
	<?php/*

$json_msgs = file_get_contents("https://cbenni.com/api/logs/sotshi_?after=100&before=0&id=-1&token=0dc3f3fba97701dcd00d68e57a8ce561587ade5f704d2f05e6ec2c014c2f487c");
$msgs = json_decode($json_msgs, true);
echo ($msgs);
echo "<br><br><br><br>"

*/?>
<?php /*$msgs = json_decode(file_get_contents("https://cbenni.com/api/logs/sotshi_?after=100&before=0&id=-1&token=0dc3f3fba97701dcd00d6857ade5f704d2f05e6ec2c014c2f487c"),true);
$key = 0;
while($msg = $msgs['after'][$key]) { 
	echo $msgs['after'][$key]['text'].'<br>';
	$key += 1; 
} */
?>
<?php
$nb = $_GET['nb'];
$msgs = json_decode(file_get_contents("https://cbenni.com/api/logs/sotshi_?after=100&before=0&id=-1&token=0dc3f3fba97701dcd00d68e57a8ce561587ade5f704d2f05e6ec2c014c2f487c"),true);
$key = 0;
while($msg = $msgs['after'][$key]) {
	//echo '<font style="font-weight: bold">'.htmlspecialchars($msgs['after'][$key]['nick']).' : </font>'.htmlspecialchars(explode('#sotshi_ :',$msgs['after'][$key]['text'])[1]).'<br><br>';
$key += 1;
}
$key = $key - $nb - 1;
echo ' '.htmlspecialchars($msgs['after'][$key]['nick']).' : '.htmlspecialchars(explode('#sotshi_ :',$msgs['after'][$key]['text'])[1]);
?>