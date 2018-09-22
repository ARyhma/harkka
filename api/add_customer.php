<?php
	include 'connection.php';

	$etunimi=$_POST['etunimi'];
	$sukunimi=$_POST['sukunimi'];
	$osoite=$_POST['osoite'];
	$postinumero=$_POST['postinumero'];
	$postitoimipaikka=$_POST['postitoimipaikka'];

	$sql=$db->prepare("INSERT INTO asiakas
		(etunimi,sukunimi,osoite,postinumero,postitoimipaikka)
		VALUES(:a_etunimi,:a_sukunimi,:a_osoite,:a_postinumero,:a_postitoimipaikka)");
	$sql->bindParam(':a_etunimi',$etunimi);
	$sql->bindParam(':a_sukunimi',$sukunimi);
	$sql->bindParam(':a_osoite',$osoite);
	$sql->bindParam(':a_postinumero',$postinumero);
	$sql->bindParam(':a_postitoimipaikka',$postitoimipaikka);
	$sql->execute();

	http_response_code(201);
?>
