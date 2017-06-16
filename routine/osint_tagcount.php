<?php

/**
 * AIFS OSINT Async Tag Count
 * @version 1.03
 * @author Vincent A. Menard
 * Copyright (c) digitaloversight
 */
 
error_reporting(1); 
ini_set('error_reporting', 1);

require_once '../config/tool/DomainSelector.php';
use Sql\Sql;

$dbh = new Sql();
$sql = $dbh->execute("SELECT DISTINCT   tag as mytag, 
                     (select count(*) from osint_tags WHERE tag = mytag) as mycount
                     FROM osint_tags ORDER BY rand() LIMIT 1");

$results = $sql->fetch_assoc();

$sql = $dbh->execute("SELECT count(*) FROM osint_tags_count WHERE tags_name = '".addslashes($results['mytag'])."'");
$count = $sql->sql_result();

if ($count==0) {
    $dbh->execute("INSERT INTO osint_tags_count SET tags_name = '".addslashes($results['mytag'])."',
                                                        tags_count = '".$results['mycount']."'");
} else {
    $dbh->execute("UPDATE osint_tags_count SET tags_count = '".$results['mycount']."' WHERE
                                                    tags_name ='".addslashes($results['mytag'])."'");
}

$resp = new Response();
$resp->success('200200', 'Normal end of execution.');
