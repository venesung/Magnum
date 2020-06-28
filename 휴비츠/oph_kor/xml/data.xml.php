<?php 
header('Content-Type: text/xml');
include_once $_SERVER['DOCUMENT_ROOT']."/common/include/dbConn.php";

$result = mysql_query("SELECT idx, kor_name, eng_name, filename, thumbnail regDate FROM lookaround WHERE site = 'optical' ORDER BY idx ASC");
$resultCount = mysql_num_rows($result);
?>
<items>
<?php			
for($i=0; $i < $resultCount; $i++)
{
	$idx = mysql_result($result, $i , 0);
	$kor_name = mysql_result($result, $i , 1);										
	$eng_name = mysql_result($result, $i , 2);
	$thumbnail = mysql_result($result, $i , 3);
	$filename = mysql_result($result, $i , 4);
?>
	<item>
		<desc><?php echo $kor_name;?></desc>
		<simage>../../upload/<?php echo $filename;?></simage>	
		<image>../../upload/<?php echo $thumbnail;?></image>
	</item>
<?php 
}
?>		
</items>