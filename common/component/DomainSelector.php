<?php

/**
 * AIFS Common Domain Selector
 * @digitaloversight
 */

namespace Common;
 
Class Common {
    
    
    function __construct( $domain = 'osint', $path ) {
        require_once $path.'/common/helper/'.$domain.'.helper.php';
    }
 
 }
