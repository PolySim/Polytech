<?php
define('SERIAL_DEVICE', '/dev/ttyACM0');
define('SERIAL_SPEED', 9600);
$number = $_REQUEST['duree'];
echo '<p>' . $number . '</p>';
system('stty -F ' . SERIAL_DEVICE . ' clocal -crtscts -ixon -ixoff');
system('stty -F ' . SERIAL_DEVICE . ' ' . SERIAL_SPEED);
file_put_contents(SERIAL_DEVICE, chr($number));
?>