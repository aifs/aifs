<?php

namespace Helper;

/**
 * AIFS DNINT function helper
 * Copyright (c) digitaloversight
 */

/**
 * extract_unit
 *
 * Returns the part from $string which is contained between strings $start and $end
 * @version 2016-01-06 RC1
 */
 
function extract_unit($string, $start, $end) {

    $pos = stripos($string, $start);
    $str = substr($string, $pos);
    $str_two = substr($str, strlen($start));
    $second_pos = stripos($str_two, $end);
    $str_three = substr($str_two, 0, $second_pos);
    $unit = trim($str_three); // remove whitespaces
    return $unit;
}

/**
 * getRatedforContent
 *
 * Form html block needed for rate display and breakdown,
 * only use the x dimension to display rate.
 * @return String in html format
 * @version 2016 1.02 RC2
 */
 
function getRatedforContent($dbh, $content) {

        $str = '<table width="400"><tr><td>Word ID</td><td>Significant Words</td><td>Rate</td></tr>';
        $str2 = '<table width="400"><tr><td>Word ID</td><td>Other Words</td><td>Rate</td></tr>';

        $stripped = strip_tags($content);
        $content = explode(" ", $stripped);
        foreach($content as $curWord) {

            $query = 'SELECT keyword_id, dimension_x 
                        FROM keyword 
                        WHERE keyword ="'.addslashes($curWord).'"';
                        
            $stmt = $dbh->execute($query);
            list($b, $a) = $stmt->fetch_array();    
            if ((($a > 5) || ($a < 4)) && ($a != '') && (is_numeric($a))) {
                $str .= '<tr><td>';
                $str .= '<a href="dnint/participate/update_keyword.php?id='.$b.'&amp;from=report&repID='.addslashes($_GET['id']).'">';
                $str .= $a.'</a></td><td>'.$curWord.'</td><td>'.$b.'</td></tr>';
            } else if ($a == 5) {
                $str2 .= '<tr><td>';
                $str2 .= '<a href="dnint/participate/update_keyword.php?id='.$a.'&amp;from=report&repID='.addslashes($_GET['id']).'">'.;
                $str2 .= $a.'</a></td><td>'.$curWord.'</td><td>'.$b.'</td></tr>';
            }
            $a = 5;
        }
        $str .= '</table>';
        $str2 .= '</table>';
        return $str.'<br /><br />'.$str2;
}

/**
 * isUserQueryFoundInContent
 * @version 2016-01-06 1.02 RC1
 */

function isUserQueryFoundInContent($dbh, $theURL, $theUserQuery, $theContent, &$returnTitle, &$returnExtract, &$returnSigWords ) {
    // Strip the text from tags
    $stripped = strip_tags($theContent);

    // Search for user query in stripped text
    $resultStr = stristr($stripped, $theUserQuery);

    if( $resultStr != false ) { // user query found in content
        //extract the title from the content
        $titleStart = '<title>';
        $titleEnd   = '</title>';
        $returnTitle = extract_unit($theContent, $titleStart, $titleEnd);

        // extract the significant keywords
        $sigWords = array("w0"=>0, "w1"=>0, "w2"=>0, "w3"=>0, "w4"=>0, "w5"=>0, "w6"=>0, "w7"=>0, "w8"=>0, "w9"=>0);

        $allWords = explode(" ", $stripped);
        foreach($allWords as $curWord) {

            $query = 'SELECT * FROM osint_keyword WHERE keyword ="'.addslashes($curWord).'" and dimension_x != 5';
            $stmt = $dbh->execute($query);

            if( $oneRow = $stmt->fetch_assoc() ) {
                $query = 'SELECT * from dnint_contents_parsed WHERE url="'.addslashes($theURL).'"';
                $stmt2 = $dbh->execute($query);
                $oneRow2 = $stmt2->fetch_assoc();
                $query = 'SELECT * from dnint_parsed_results WHERE fk_dnint_contents_parsed_id="'.addslashes($oneRow2['id']).'"';
                $stmt3 =$dbh->execute($query);
                $oneRow3 = $stmt3->fetch_assoc();
                $tempAvg = $oneRow3['dimx_avg'];

                foreach($sigWords as $key => $value) {
                    if( $value < $tempAvg ) {
                        unset($sigWords[$key]);
                        $sigWords[$curWord] = $tempAvg;
                        break;
                    }
                }
            }
        }

        $arrKeys = array_keys($sigWords);
        $returnSigWords = 'Significant words: ';
        foreach($arrKeys as $curKey) {
            if (strlen($curKey) > 2) {
                $returnSigWords .= $curKey . ', ';
            }
        }


        // Extract some content showing the userQuery
        $limit = 50;

        $startFound = stripos($stripped, $theUserQuery);

        if( $startFound < $limit ){
            $start = 0;
            $Length = (2 * $limit) + strlen($theUserQuery);
            $returnExtract = substr($stripped, $start, $Length) . '...';
            $returnExtract = stripslashes($returnExtract);
        }
        else {
            $start = $startFound - $limit;
            $Length = (2 * $limit) + strlen($theUserQuery);
            $returnExtract = '...' . substr($stripped, $start, $Length) . '...';
            $returnExtract = stripslashes($returnExtract);
        }
        return true;
    }
    else {
        return true;
    }
}

/**
 * filterContent
 * filters the feed content according to set critiria and returns
 * @return String filteredContent
 * @version 2016-01-07
 */
 
function filterContent( $theContent, &$numWordsAfterFilter ) {

    // Remove punctuation from content
    $punctuation = array('!','@','#','$','%','^','&','*','(',')','-','_','+','=','/','\\','|','[',']',':',';','\"','\'',',','.','<','>','?','{','}');
    $newContent = str_replace($punctuation, " ", $theContent);

    // Put the content into an array
    $allWords = explode(" ", $newContent);
    $filteredWords = array();

    $numWordsAfterFilter = 0;
    // Parse every words
    foreach($allWords as $curWord) {
        // Decide to keep or filter the word
        if( strlen($curWord) > 2 ) {
            // Add the word to the filtered array
            array_push($filteredWords, $curWord);
            $numWordsAfterFilter++;
        }
    }

    // Put back the filtered words into the return string
    $filteredContent = implode(" ", $filteredWords);
    return($filteredContent);
}

/**
 * evaluateFilteredContent
 * @version 2016-01-07
 */

function evaluateFilteredContent( $theDBh, $filteredContent, &$keywordsFound, &$dimxTotal, &$dimyTotal ) {

    $keywordsFound = 0;
    $dimxTotal = 0;
    $dimyTotal = 0;

    // Put the filtered content into an array
    $allWords = explode(" ", $filteredContent);

    // Check every word in the database
    foreach($allWords as $curWord) {

        $query = 'SELECT * FROM osint_keyword WHERE keyword="'.addslashes($curWord).'"';
        $stmt = $theDBh->execute($query);

        if( $stmt->num_row() != 0 ){ // this word exists
            $oneRow = $stmt->fetch_assoc();
            $keywordsFound++;
            $dimxTotal += $oneRow['dimension_x'];
            $dimyTotal += $oneRow['dimension_y'];
        }
    }
}

/**
 * userKeywordsFoundInDatabase
 */

function userKeywordsFoundInDatabase( $theDBh, $userKeywords ) {

    $userWordsNotFound = 'NOT found: ';
    $atLeastOneWordNotFound = FALSE;

    // Explode the user space separated string into an array
    $userWords = explode(" ", $userKeywords);

    // Check every word in the database
    foreach($userWords as $curWord){
        $query = 'SELECT * FROM osint_keyword WHERE keyword="'.addslashes($curWord).'"';
        $stmt = $theDBh->execute($query);

        if( $stmt->num_row() == 0 ){ // This word is not found
            $atLeastOneWordNotFound = TRUE;
            $userWordsNotFound .= ' '.$curWord;
        }
    }

    if($atLeastOneWordNotFound ){
        return $userWordsNotFound;
    }
    else {
        return 'All words found';
    }
}

/**
 * analyzeUserKeywords
 */
 
function analyzeUserKeywords( $theDBh, $userKeywords, $theParsedContent, &$areNotKeywords, &$areKeywordsButNotInContent, &$dimxAverage, &$dimyAverage ) {

    $dimxTotal = 0.0;
    $dimyTotal = 0.0;
    $keywordsOccurenceTotal = 0;

    $areNotKeywords = '';
    $areKeywordsButNotInContent = '';
    $dimxAverage = 0.0;
    $dimyAverage = 0.0;

    // explode the user space separated string into an array
    $userWords = explode(" ", $userKeywords);

    // check every word in the database
    foreach($userWords as $curWord){
        $query = 'SELECT * FROM osint_keyword WHERE keyword="'.addslashes($curWord).'"';
        $stmt = $theDBh->execute($query);

        if( $stmt->num_row() == 0 ){ // This word is not found in the database
            $areNotKeywords .= $curWord .' ';
        }
        else {
            //it was found in the database so now check if it is found in the content
            $howMany = substr_count($theParsedContent, $curWord);
            if( $howMany > 0 ) {
                $oneRow = $stmt->fetch_assoc();
                $dimxTotal += ($howMany * $oneRow['dimension_x']);
                $dimxTotal += ($howMany * $oneRow['dimension_y']);
                $keywordsOccurenceTotal += $howMany;
            }
            else {
                $areKeywordsButNotInContent .= $curWord .' ';
            }
        }
    }

    //do final calculations
    if( $keywordsOccurenceTotal > 0 ) {
        $positiveAverage = $positivityTotal / $keywordsOccurenceTotal;
        $negativeAverage = $negativityTotal / $keywordsOccurenceTotal;
    }

    if( $areNotKeywords == "" ){
        $areNotKeywords = "-------------";
    }
    if( $areKeywordsButNotInContent == "" ){
        $areKeywordsButNotInContent = "-------------";
    }
}
