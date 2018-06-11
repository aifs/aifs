<?php

/**
 * AIFS DNINT SQL Requests file
 * @version 1.04
 * @author Vincent Menard
 * @digitaloversight
 */

namespace Sql;
 
class DnintRequest extends Sql {

    private $id;
    private $page;
    private $url;
	
    public function __construct() {
        parent::__construct();

        $s = $this->execute("SELECT id, fk_osint_url_id, content FROM osint_version ORDER BY id desc LIMIT 1");
        list($id, $url, $data) = $s->fetch_array();
        $this->id = $id;
        $this->page = $data;
        $this->url = $url;
    }

    public function get_outbound( ) {
        if ($this->id == null) {
            return 0; 
	}	
        $s = $this->execute("SELECT count(*) FROM dnint_outbound WHERE fk_osint_version_id=".$this->id);
		
        $count = $s->sql_result();
        if ($count != 0) {
            return 0; 
        }
        $data = $this->page;
        $data = stripslashes( $data );
        $data = preg_replace("<a href=\"", "++link++", $data);
        $data = preg_replace("\">", "++link++", $data);
        $data = preg_replace("\" ", "++link++", $data);
        $arr = explode("++link++", $data);
	
        $trim = preg_replace("http://", "",  $this->url);
        $url_arr = explode("/", $trim);

        for ($i=0; $i<sizeof($arr); $i++) {
            if ((strpos($arr[$i], "http:") === 0) && (strpos($arr[$i], " ") === false) &&
                (strpos($arr[$i], $url_arr[0]) === false)) {

                $this->execute("INSERT INTO dnint_outbound SET url='".addslashes(html_entity_decode ($arr[$i]))."', 
                                fk_osint_version_id=".$this->id);
            }
        }
        return 1;
    }
}
