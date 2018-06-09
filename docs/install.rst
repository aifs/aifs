How to install
========================


::

   # git clone https://github.com/digitaloversight/aifs.git
   
   # mysql -u root -p < ./aifs/schema/aifs-base-1.02.sql

::

   mysql> insert into user set Host='localhost', User='aifs', Password=PASSWORD('');
   
   mysql> flush privileges;
   
   mysql> grant all on aifs.*  to 'aifs'@'localhost';
   


Configuration
-------------

Make sure you reviwed the configuration on the following files

::

   ``/config/config.php``
   
   ``/config/tool/DomainSelector.php``


Extends
-------

AIFS comes with extensions, please take a look at the `aifs-extends repository <https://github.com/digitaloversight/aifs-extends>`_ available on Github.
