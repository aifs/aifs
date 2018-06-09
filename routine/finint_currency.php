<?php

/**
 * AIFS Finint Crypto Currency 
 * 1.03 PoC for currency information gathering routine.
 * @version 1.03 2017
 * @author Vincent A. Menard 
 * Copyright (c) aifs
 */

error_reporting(1);
ini_set('error_reporting', 1);

require_once '../config/tool/DomainSelector.php';

use Config\Config;
use Sql\FinintRequest;
use Component\Response;
use function Helper\planarExtraction as Extraction;

$conf = new Config('finint');
$finint = new FinintRequest();

// Get some currency sources
$stmt = $finint->getOneCurrency();
while ($row = $stmt->fetch_assoc()) {
    $content = '';
    $dValue = 0;
    // Web query them for values
    $content = file_get_contents($row['url']);
    if (strlen($content) > 1) {
        $dValue = Extraction($content, '<span class="text-large" id="quote_price">', '</span>', '$');
        if ($dValue > 0) {
            $finint->saveCurrentValue($row['id'], 2, $row['dnint_id'], $dValue);
        }
    }
}
$resp = new Response();
$resp->success('200200', 'Normal end of execution.');
