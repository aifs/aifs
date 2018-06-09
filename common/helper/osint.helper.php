<?php

namespace Helper;

/**
 * AIFS OSINT Helper File
 * Copyright (c) 2017, Digital Oversight
 * Very basic html parser.
 * @version 1.04
 */
 
function cleanhtml( $string )  {
    $ignore = false;
    $buffer = '';
    $cleaned = '';
    
    for ($i = 0; $i<strlen($string); $i++) {

        if ($ignore == false)
            $buffer .= $string[$i];

        if ($string[$i] == '<') {
            $cleaned .= ' '.ereg_replace('<', '', $buffer);
            $buffer = '';
            $ignore = true;
            
        } else if ($string[$i] == '>') {
            $ignore = false;
            $buffer = '';
        }
    }

    return $cleaned;
}

/**
 * Email call on content modification, used in osint_fetch_version.php
 * @version 1.04
 */

function mailChangeAlert($toemail = "aifs-noreply@", $userurl = 'http://', 
                                    $internal = '', $domain = 'aifs.io')  {

    if ($toemail == 'aifs-noreply@') {
        return false;
    }
    if ($userurl == 'http://') {
        return false;
    }
    
    $old_url = $url = $userurl;
    
    if (strpos($url, "http://") === false){

        $url = "http://".$url;
    }

    $from     = "aifs-noreply@".$domain;
    $subject = "AIFS Notification of changed URL ";

    $html = "
        <html><body>
        <table width=\"600\" border=\"0\">
        <tr>
        <td><img src=\"" . $domain . "/aifs/images/aifs-email-small.gif\" alt=\"\" title=\"\" />
        </td><td>
        <h1><a href=\"" . $domain . "/aifs\">AIFS</a></h1>.
        </td></tr>
        </table>
        <br />Fellow AIFS user,<br><br>
        You subscribed to the url: <b>".$old_url."</b>.<br />
        This url has changed recently, you can click <a href=\"".$internal."\">here to see changes on your AIFS.</a><br /> 
        or on this <a href=\"".$url."\">link</a> to visit the site .<br />
        <br />
        <div style=\"font-size:10px; font-color:gray\">AIFS.<br />
        </div></body></html>";

    $headers = "From: " . strip_tags($from) . "\r\n";
    $headers .= "Reply-To: ". strip_tags($from) . "\r\n";
    $headers .= "MIME-Version: 1.0\r\n";
    $headers .= "Content-Type: text/html; charset=UTF-8\r\n";

    return mail($toemail, $subject, $html, $headers);

} 
