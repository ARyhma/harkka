<?php

	try
	{
//	 $conn_string = "mysql:host=mysli.oamk.fi;dbname=opisk_c8hape00";
   $conn_string = "mysql:host=localhost;dbname=opisk_c8hape00";
	 $db = new PDO ($conn_string, "root", "mysql");
//	 $db = new PDO ($conn_string, "c8hape00", "mysql");
	 $db->setAttribute (PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	 //print ("Connected\n");
	}
	catch (PDOException $e)
	{
	 print ("Cannot connect to server\n");
	 print ("Error code: " . $e->getCode () . "\n");
	 print ("Error message: " . $e->getMessage () . "\n");
	}

?>
