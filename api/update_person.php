<?php
	include 'connection.php';

	$id=$_GET['id'];
	$osoite=$_POST['osoite'];
	$postinumero=$_POST['postinumero'];
	$postitoimipaikka=$_POST['postitoimipaikka'];

	$sql=$db->prepare("UPDATE asiakas SET
		osoite=:a_osoite,
		postinumero=:a_postinumero,
		postitoimipaikka=:a_postitoimipaikka
		WHERE asiakasID=:a_asiakasID");
	$sql->bindParam(':a_osoite',$osoite);
	$sql->bindParam(':a_postinumero',$postinumero);
	$sql->bindParam(':a_postitoimipaikka',$postitoimipaikka);
	$sql->bindParam(':a_asiakasID', $id );
	$sql->execute();

	http_response_code(201);
?>
