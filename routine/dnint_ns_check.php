<?php

/**
 * AIFS OSINT NameServer Check
 * @version 1.03
 * @digitaloversight
 */

require_once '../config/tool/DomainSelector.php';
use Config\Config;
use Sql\Sql;

$conf = new Config('dnint');
$dbh = new Sql();

$sql = $dbh->execute("SELECT id, url FROM osint_url WHERE dead_link = 0 ORDER BY rand()");

list($id, $url) = $sql->fetch_array();
$url = str_replace('http://', '', $url);
$url = str_replace('https://', '', $url);

$arr = explode('/', $url);
$out = shell_exec("nslookup $arr[0]");
if (strpos($out, '** server') !== false) {
    $dbh->execute("UPDATE osint_url SET dead_link = 1 WHERE id=".$id);
    if (strpos($conf->ns_fail_notify, '@') !== false) {
        mail($conf->ns_fail_notify, "AIFS NS expired", 
        "The following url had it's domain name expired recently : \r\t\r\t" . $url .
        "\r\t\r\tDelivered you by AIFS node " . $conf->node_name );
    }
}

$resp = new Response();
$resp->success('200200', 'Normal end of execution.');

