Routines
========


OSINT routines
--------------


**Fetch Version** ``routine/osint_fetch_version.php``

Perform a version check with a randomly choosen url in the user filled url table.

**Changes** ``routine/osint_changes.php``

Execute a comparison algorithm between two saved version of a document stored.

**Title** ``routine/osint_title.php``

Extract title from html content.

**Tag count** ``routine/osint_tagcount.php``

Precalculate the number of urls linked for all tags stored in the `osint_tags`

**Table Rotation** ``routine/osint_table_rotation.php``

Rotate the web content present into the main version content by renaming the sql table.



DNINT routines
--------------


**Semantic Analysis** ``routine/dnint_url_semantic.php``

Apply semantic analysis against html parsed content.

**Oubound*** ``routine/dnint_oubound.php``

Get the outbound links on an html version.

**NS Check** ``routine/dnint_ns_check.php``

Perform an NS check on a saved url.

**Google PR** ``routine/dnint_google_pr.php``

Fetch the google pr for a specified url.



FININT routines
--------------


**Currency** ``routine/finint_currency.php``
