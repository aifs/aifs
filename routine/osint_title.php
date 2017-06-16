<?php

/**
 * AIFS OSINT Title Parser
 * @version 1.03
 * Copyright (c) digitaloversight
 */

error_reporting(1); 
ini_set('error_reporting', 1);


require_once '../config/tool/DomainSelector.php';
use Sql\Sql;
use Component\Response;

$dbh = new Sql();
$resp = new Response();

$sql = $dbh->execute("  SELECT osint_version.id, osint_version.fk_osint_url_id, osint_version.content 
                            FROM osint_version
                            LEFT JOIN osint_titles ON (osint_titles.fk_osint_version_id = osint_version.id)
                        WHERE osint_titles.title IS NULL ORDER BY osint_version.id DESC LIMIT 1");

list($id, $uid, $content) = $sql->fetch_array();

if (!is_numeric($id)) {
    $resp->success('200001', 'No valid record to parse.');
}

$content = preg_replace('<title>', '<cutme>', $content);
$content = preg_replace('</title>', '<cutme>', $content);

$arr = explode('<cutme>', $content);

$title = preg_replace("/\n\r|\r\n|\n|\r/", "", $arr[1]);

$sql = $dbh->execute("SELECT COUNT(*) FROM osint_titles WHERE osint_titles.fk_osint_url_id =".$id);
if ($sql->sql_result() == 0) {
    if (strlen($arr[1]) < 500) {
        $dbh->execute("INSERT INTO osint_titles SET fk_osint_version_id='".$id."',
                                fk_osint_url_id='".$uid."',
                                title='".addslashes($title)."'");
    }
}
$resp->success('200200', 'Normal end of execution.');
