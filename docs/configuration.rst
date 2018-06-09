Configuration
=============


If you do not load the web administration panel, you will need two things to enable basic features of AIFS : a keyword dictionary and an url list.


Keyword dictionary
------------------

If you wish to enable semantic indexing, you need to load a dictionary. We provide the English-French words list in the aifs-extends repository. 
Load it on a freshly installed ``aifs-base-1.02.sql`` schema using this command :

::

   # git clone https://github.com/digitaloversight/aifs-extends.git
   
   # tar -xvzf ./aifs-extends/data/osint_keyword_EN_FR_102.sql.tar.gz
   
   # mysql -u root -p aifs < ./aifs-extends/data/osint_keyword_EN_FR_102.sql



URL list
--------

If you do not use the web administration panel to provide urls, you will need to fill the osint_url manually.

::

   mysql> insert into osint_url set url='https://twitter.com/infainit';

