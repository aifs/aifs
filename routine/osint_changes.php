<?php 

/**
 * AIFS OSINT Change Parser
 * @version 1.03
 * Copyright (c) digitaloversight
 */

error_reporting(1);
ini_set('error_reporting', 1);

require_once '../config/tool/DomainSelector.php';
require_once '../common/component/DomainSelector.php';

use Config\Config;
use Sql\Sql;
use Sql\OsintRequest;
use Common\Common;
use Component\Response;

$conf = new Config('osint');
$helper = new Common('osint', $conf->global_path);
$dbh = new Sql();
$resp = new Response();

// Check for the newest version
$sql = $dbh->execute("SELECT id, fk_osint_url_id, content FROM osint_version ORDER BY id DESC LIMIT 1");
list($new_id, $new_url_id, $new_version) = $sql->fetch_array();

// Check if 2 versions are in store
$sql = $dbh->execute("SELECT count(*) FROM osint_version WHERE fk_osint_url_id=".$new_url_id);
if( $sql->sql_result() < 2 ) {
    $resp->success('200001', 'No valid record to parse.');
}

$sql = $dbh->execute("SELECT count(*) FROM osint_changes WHERE fk_new_version_id=".$new_id);
if( $sql->sql_result() == 1 ) {
    $resp->success('200002', 'Current record already processed.');
}

$fp = fopen ($conf->tmp_path . '/tmp_file_osint_changes', "w");
fwrite($fp, stripslashes( $new_version ) );
fclose( $fp );

$counter = 0;
$stmt = $dbh->execute("SELECT id, content FROM osint_version
                                WHERE fk_osint_url_id='".$new_url_id."' ORDER BY id desc LIMIT 2");

while ($row = $stmt->fetch_assoc() ) {

	if ($counter != 0) {
		$old_data = $row['content'];
		$old_id = $row['id'];
	}
	$counter++;
}

// PHP diff algorithm start
$buffer_size = $conf->diff_buffer_size;
$timeout = 15;

// Strings and Buffers
$contents = '';
$flow = '';
$new_str = '';
$old_str = '';
$added_changes = '';
$deleted_changes = '';

// Flag
$on_change = false;

// Counters
$off_set = 0;
$change_num = 0;
$closed_change = 0;

$handle = fopen($conf->tmp_path . '/tmp_file_osint_changes', "rb");
stream_set_timeout($handle, $timeout);
 
while (!feof(@$handle)) {

	$flow = fread(@$handle, (int)$conf->diff_buffer_size);
	if ( ($off_set < sizeof($old_data)) && (stripos_special($old_data, $flow, $off_set) === false) )  {
		// First String of new change
		if (!$on_change) {
			$change_num++;
			$new_str = $flow;
			for ($i=(int)$conf->diff_buffer_size; $i>0; $i--)
				$old_str .= $old_data[$off_set + ((int)$conf->diff_buffer_size * 2) - $i];
			$on_change = true;
		} else {
		// Change continuation
			$new_str .= $flow;
			for ($i=(int)$conf->diff_buffer_size; $i>0; $i--)
				$old_str .= $old_data[$off_set + ((int)$conf->diff_buffer_size * 2) - $i];
		}
	} else {
		// Identical changes
		if ($closed_change != $change_num) {
			$deleted_changes .= cleanhtml($old_str).'<cutme>';
			$added_changes .= cleanhtml($new_str).'<cutme>';
			$new_str = $old_str = '';
			
			$closed_change++;
		}
		$on_change = false;
	}
	
	$contents .= $flow;
	$size = $size + (int)$conf->diff_buffer_size;
	if ($size == (int)$conf->diff_buffer_size)
		$off_sex = $off_set + (int)$conf->diff_buffer_size -1;
	else
		$off_set = $off_set + (int)$conf->diff_buffer_size;

} // while
fclose($handle);


$dbh->execute("INSERT INTO osint_changes SET fk_osint_url_id=".$new_url_id.",
					fk_new_version_id=".$new_id.",
					fk_old_version_id=".$old_id.",
					added='".addslashes($added_changes)."',
					deleted='".addslashes($deleted_changes)."',
					changes_count='".$change_num."'"); 

$sql = $dbh->execute("SELECT id FROM osint_changes ORDER BY id desc LIMIT 1");
list($last_change_id) = $sql->fetch_array();

$dbh->execute("INSERT INTO osint_changes_size SET fk_osint_url_id=".$new_url_id.",
                                        fk_new_version_id=".$new_id.",
                                        fk_old_version_id=".$old_id.",
					added_size='".strlen(ereg_replace('<cutme>', '', $added_changes))."',
					deleted_size='".strlen(ereg_replace('<cutme>', '', $deleted_changes))."',
					new_version_size='".strlen($new_version)."',
					old_version_size='".strlen($old_data)."',
					fk_changes_id='".$last_change_id."'");

$resp->success('200200', 'Normal end of execution.');

