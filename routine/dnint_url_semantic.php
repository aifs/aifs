<?php

/**
 * AIFS Routine DNINT url pipeline
 * Copyright (c) digitaloversight
 * @version 2016-01-07 1.02 RC2
 */
 

include_once '../config/tool/DomainSelector.php';
include_once '../common/component/DomainSelector.php';
require_once '../common/component/Crawl.php';

use Config\Config;
use Component\Response;
use Component\Crawl;
use Common\Common;
use Sql\Sql;

$conf = new Config('dnint');
$helper = new Common('osint', $conf->global_path);
$dbh = new Sql();
$resp = new Response();
$fetch = new Crawl('dnint');

error_reporting($conf->debug); 
ini_set('error_reporting', $conf->debug);

$sql = $dbh->execute("SELECT url FROM url_tld_com 
                        WHERE osint_submit=0 AND subchance = 0 ORDER by id DESC LIMIT 1");
list($myurl) = $sql->fetch_array();

$sql = $dbh->execute('SELECT * FROM dnint_url ORDER BY id DESC LIMIT 1');
list($id, $url, $time) = $sql->fetch_array();;

if ($myurl != $url) {
    $sql = $dbh->execute("INSERT INTO dnint_url SET url='".$myurl."'");
}

$sql = $dbh->execute('SELECT * FROM dnint_url ORDER BY id DESC LIMIT 1');
list($id, $url, $time) = $sql->fetch_array();;

$sql = $dbh->execute("SELECT COUNT(*) FROM dnint_url_contents WHERE fk_dnint_url_id=".$id);
if ($sql->sql_result() != 0) {
    $resp->success('200001', 'No valid record to parse.');
}

$content = $fetch->getContent($url, "", "", false);

if( $content == '' ) { // There was a problem getting the content of this URL
    $dbh->execute("DELETE FROM dnint_url WHERE id=".$id);
    $resp->success('200002', 'Unable to obtain data from this URL.');
}

// Content was obtained so update or add in mysql
$query = 'SELECT * from dnint_url_contents WHERE url="'.addslashes($url).'"';
$stm2 =$dbh->execute($query);

if( $stmt->num_row() == 0 ){ 
    //this URL is new and its contents are not fetched yet
    $query = "INSERT INTO dnint_url_contents 
                SET url='". addslashes($url) ."', 
                    url_content='". addslashes($content) . "', 
                    fk_dnint_url_id=".$id;
    $dbh->execute($query);
}
else {
    //this URL exists so just overwrite its contents (and also its FK to make sure we are in sync)
    $query = "UPDATE dnint_url_contents 
                   SET url_content='". addslashes($content) ."', 
                   fk_dnint_url_id=". addslashes($id)." 
               WHERE url='".$url."'";
    $stmt = $dbh->execute($query);
}

// Semantic parsing phase

$sql = $dbh->execute("SELECT id FROM feed_url_contents ORDER BY id DESC LIMIT 1");
list($last_id) = $sql->fetch_array();

$filtered = filterContent( $content, $wordsAfterFilter );
$numKeywords = 0;
$sumDimX = 0;
$sumDimY = 0;
$negAverage = 0;

evaluateFilteredContent($dbh, $filtered, $numKeywords, $sumDimX, $sumDimY);

$dimxAverage = round($sumDimX/$numKeywords, 2);
$dimyAverage = round($sumDimY/$numKeywords, 2);

$query = "INSERT INTO dnint_contents_parsed 
                SET url='".addslashes($url)."', 
                    parsed_content='". addslashes($filtered) . "',
                    fk_dnint_url_contents_id=". addslashes($last_id);
$stmt = $dbh->execute($query);

// Get the id of the inserted record
$newID = mysql_insert_id();

// Now also add a record in the feed_parsed_results table
$query = 'INSERT INTO dnint_parsed_results 
            SET dimx_avg='. addslashes($dimxAverage) . ', 
                dimy_avg=' . addslashes($dimyAverage) . ' , 
                fk_dnint_contents_parsed_id='. addslashes($newID);
$stmt2 = $dbh->execute($query);

$resp->success('200200', 'Normal end of execution.');

