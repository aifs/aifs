<?php

/*
 * Execute the rotate OSINT version table
 * @digitaloversight
 */

error_reporting(1); 
ini_set('error_reporting', 1);

error_reporting(1);
ini_set('error_reporting', 1);

require_once '../config/tool/DomainSelector.php';
include_once '../common/component/DomainSelector.php';

use Config\Config;
use Sql\Sql;
use Sql\OsintRequest;
use Common\Common;

$conf = new Config('osint');
$osint = new OsintRequest();
$dbh = new Sql();

$max_row_number = 8000;

// Step 1, select the last archived id
$sql = $dbh->execute("SELECT id as table_id, last_row as lst_row FROM osint_version_table_history
		              ORDER BY osint_version_table_history.id DESC LIMIT 1");

$results = $sql->fetch_assoc();
if($results['lst_row'] == NULL) {
    $results['lst_row']=0;
}

$first_id_new_table = $results['lst_row'] + $max_row_number;

// Select the last avtive id
$sql = $dbh->execute("SELECT id as last_row_id, date as last_date FROM osint_version
		              ORDER BY osint_version.id DESC LIMIT 1");

$last_id = $sql->fetch_assoc();

// Is the last id higher than treshold ?
if ($last_id['last_row_id'] >= $first_id_new_table) {

    $sql = $dbh->execute("SELECT id as first_row_id, date as first_date FROM osint_version
  		                ORDER BY osint_version.id ASC LIMIT 1");

    $first_id = $sql->fetch_assoc();

    $sql = $dbh->execute("SELECT COUNT(*) as numberofrow FROM osint_version_table_history");

    $count = $sql->fetch_assoc();

    if($count['numberofrow']== NULL) {
        $count['numberofrow']=0;
    }

    $table_name = "osint_versions_".$count['numberofrow'];

    $dbh->execute("INSERT INTO osint_version_table_history SET table_name = '".addslashes($table_name)."', 
                                                  first_row = '".addslashes($first_id['first_row_id'])."',
  		                                  last_row = '".addslashes($last_id['last_row_id'])."',
  		                           	  first_date ='".addslashes($first_id['first_date'])."',
  		                           	  last_date='".addslashes($last_id['last_date'])."'");

    $dbh->execute("RENAME TABLE osint_versions TO ".addslashes($table_name)."");

    $initial_primary_key_value = $last_id['last_row_id']+ 1;

    $dbh->execute("CREATE TABLE osint_versions (id int(10) AUTO_INCREMENT, FK_osint_url_id int(10), date datetime, size int(20),
		         content longtext, PRIMARY KEY (id)) AUTO_INCREMENT= ".$initial_primary_key_value."");

    $dbh->execute("ALTER TABLE `osint_versions` ADD INDEX ( `FK_osint_url_id` ) ");
}

$resp = new Response();
$resp->success('200200', 'Normal end of execution.');

