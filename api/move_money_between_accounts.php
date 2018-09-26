<?php
	include 'connection.php';

	$tili_maksaja_id = $_POST['form_tili_maksu'];
	$tili_saaja_id = $_POST['form_tili_vastaanottaja'];
	$viite = $_POST['viite'];
	$viesti = $_POST['viesti'];
	$erapaiva = $_POST['erapaiva'];
	$maara = $_POST['maara'];
	$iban_maksaja = '';
	$iban_saaja = '';
	$etunimi_maksaja = '';
	$sukunimi_maksaja = '';
	$etunimi_saaja = '';
	$sukunimi_saaja = '';

// Maksajan osuus

	// maksutilin tiedot
	$sql=$db->prepare("SELECT iban FROM tili WHERE tiliID = :tili_maksaja_id");
	$sql->bindParam(':tili_maksaja_id',$tili_maksaja_id);
	$sql->execute();
	$result = $sql->fetch(PDO::FETCH_OBJ);
	$iban_maksaja = $result->iban;

	// maksajan nimi
	$sql=$db->prepare("SELECT etunimi, sukunimi FROM asiakas JOIN tili ON tili.omistajaID=asiakas.asiakasID WHERE tiliID = :tili_maksaja_id");
	$sql->bindParam(':tili_maksaja_id',$tili_maksaja_id);
	$sql->execute();
	$result = $sql->fetch(PDO::FETCH_OBJ);
	$etunimi_maksaja = $result->etunimi;
	$sukunimi_maksaja = $result->sukunimi;

	// vähennetään rahat
	$sql=$db->prepare("UPDATE tili SET saldo = saldo - :a_maara WHERE tiliID=:tili_maksaja_id");
	$sql->bindParam(':tili_maksaja_id',$tili_maksaja_id);
	$sql->bindParam(':a_maara',$maara);
	$sql->execute();

// Saajan osuus

	// saajan tili
	$sql=$db->prepare("SELECT iban FROM tili WHERE tiliID = :tili_saaja_id");
	$sql->bindParam(':tili_saaja_id',$tili_saaja_id);
	$sql->execute();
	$result = $sql->fetch(PDO::FETCH_OBJ);
	$iban_saaja = $result->iban;

	// saajan nimi
	$sql=$db->prepare("SELECT etunimi, sukunimi FROM asiakas JOIN tili ON tili.omistajaID=asiakas.asiakasID WHERE tiliID = :tili_saaja_id");
	$sql->bindParam(':tili_saaja_id',$tili_saaja_id);
	$sql->execute();
	$result = $sql->fetch(PDO::FETCH_OBJ);
	$etunimi_saaja = $result->etunimi;
	$sukunimi_saaja = $result->sukunimi;

	// lisätään rahat
	$sql=$db->prepare("UPDATE tili SET saldo = saldo + :a_maara WHERE tiliID=:tili_saaja_id");
	$sql->bindParam(':tili_saaja_id',$tili_saaja_id);
	$sql->bindParam(':a_maara',$maara);
	$sql->execute();

	//lisätään maksettu tilitapahtuma
	$saajannimi = $etunimi_saaja.' '.$sukunimi_saaja;
	$bic='APANKKI';
	$tapahtumaid="3"; // self service
	$aika=date("Y-m-d h:i:s");
	$maara = $maara * -1;

	$sql=$db->prepare("INSERT INTO tilitapahtumat	(saajannimi,iban,bic,viite,viesti,maara,tiliID,tapahtumaid,aika,erapaiva)
	VALUES(:a_saajannimi,:a_iban,:a_bic,:a_viite,:a_viesti,:a_maara,:a_tiliid,:a_tapahtumaid,:a_aika,:a_erapaiva)");
	$sql->bindParam(':a_saajannimi',$saajannimi);
	$sql->bindParam(':a_iban',$iban_maksaja);
	$sql->bindParam(':a_bic',$bic);
	$sql->bindParam(':a_viite',$viite);
	$sql->bindParam(':a_viesti',$viesti);
	$sql->bindParam(':a_maara',$maara);
	$sql->bindParam(':a_tiliid',$tili_maksaja_id);
	$sql->bindParam(':a_tapahtumaid',$tapahtumaid);
	$sql->bindParam(':a_aika',$aika);
	$sql->bindParam(':a_erapaiva',$erapaiva);
	$sql->execute();

	//lisätään maksu saatu tilitapahtuma
	$saajannimi = $etunimi_maksaja.' '.$sukunimi_maksaja;
	$bic='APANKKI';
	$tapahtumaid="3"; // self service
	$aika=date("Y-m-d h:i:s");
	$maara = $maara * -1;

	$sql=$db->prepare("INSERT INTO tilitapahtumat	(saajannimi,iban,bic,viite,viesti,maara,tiliID,tapahtumaid,aika,erapaiva)
	VALUES(:a_saajannimi,:a_iban,:a_bic,:a_viite,:a_viesti,:a_maara,:a_tiliid,:a_tapahtumaid,:a_aika,:a_erapaiva)");
	$sql->bindParam(':a_saajannimi',$saajannimi);
	$sql->bindParam(':a_iban',$iban_saaja);
	$sql->bindParam(':a_bic',$bic);
	$sql->bindParam(':a_viite',$viite);
	$sql->bindParam(':a_viesti',$viesti);
	$sql->bindParam(':a_maara',$maara);
	$sql->bindParam(':a_tiliid',$tili_saaja_id);
	$sql->bindParam(':a_tapahtumaid',$tapahtumaid);
	$sql->bindParam(':a_aika',$aika);
	$sql->bindParam(':a_erapaiva',$erapaiva);
	$sql->execute();

	http_response_code(201);
?>
