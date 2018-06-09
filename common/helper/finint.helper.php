<?php

namespace Helper;

/**
 * AIFS FININT Helper File
 * Copyright (c) aifs.io
 * @version 1.03 
 */
 
/**
 * Dual separator information extraction,
 * used to extract most currency from plain hmtl..
 */
 
function planarExtraction( $content, $sep1, $sep2, $trim = false )  {

    $tmp = explode($sep1, $content);
    $val = explode($sep2, $tmp[1]);
    if ($trim) {
        return str_replace($trim, '', $val[0]);
    }
    return $val[0];
}
