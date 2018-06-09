<?php

/**
 * AIFS Config Domain Selector
 * @version 1.02
 * @author Vincent Menard 
 */

namespace Config; 

require_once '../common/component/Response.php';

require_once '../common/sql/Sql.php';
require_once '../common/sql/Statement.php';

Class General {
 
}
 
Class Config extends General {
    
    var $tmp_path;
    
    function __construct( $domain = 'osint' ) {

        $path = '/var/aifs';
        require_once $path . '/config/config.php';

        $this->global_path = '/var/aifs';
        $this->node_name = $node_name;
        $this->debug = $debug;
        
        switch ($domain) {
            
            case 'osint':
                require_once '../common/sql/OsintRequest.php';

                // Diff Tmp file
                $this->tmp_path = $this->global_path.'/routine/tmp/osint';
                // Buffer size on diff
                $this->diff_buffer_size = 50;
                // Humain to notify on ns fail
                $this->ns_fail_notify = 'aifs-noreply@digitaloversight.com';
                
            break;
            
            case 'dnint':
                require_once '../common/sql/DnintRequest.php';

                // Diff Tmp file
                $this->tmp_path = $this->global_path.'/routine/tmp/dnint';
                
             break;
           
            case 'finint':
                require_once '../common/helper/finint.helper.php';
                require_once '../common/sql/FinintRequest.php';

            break; 
        }
    }    
 
}
