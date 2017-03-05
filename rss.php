<?php
$url = "http://news.yahoo.co.jp/pickup/rss.xml";
$xml = file_get_contents($url);
header("Content-type: application/xml; charset=UTF-8");
print $xml;
?>