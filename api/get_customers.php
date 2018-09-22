<?php
	require "connection.php";
	$sql = "SELECT asiakasID, etunimi, sukunimi, osoite, postinumero, postitoimipaikka FROM asiakas";

	$resultObject = $db->query($sql);

	$resultArray = $resultObject->fetchAll(PDO::FETCH_ASSOC);

	echo json_encode($resultArray);
?>
