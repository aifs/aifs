<?php

/**
 * AIFS OSINT Get outbound links routine
 * @version 1.03
 * Copyright (c) digitaloversight
 */
 
error_reporting(1); 
ini_set('error_reporting', 1);

require_once '../config/tool/DomainSelector.php';
require_once '../common/component/DomainSelector.php';

use Config\Config;
use Sql\DnintRequest;
use Component\Response;

$conf = new Config('dnint');
$dnint = new DnintRequest();

$code = $dnint->get_outbound();

$resp = new Response();
if ($code == 0) {
    $resp->success('200205', 'Normal end of execution with warnings.');
}

$resp->success('200200', 'Normal end of execution.');
