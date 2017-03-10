<?php
$srv="localhost";
$usr="root";
$pwd="";
$db="copycat";
$c=mysql_connect($srv,$usr,$pwd);
mysql_select_db($db) or die(mysql_error());
?>