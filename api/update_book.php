<?php
	include 'connection.php';

	$name=$_POST['name'];
	$author=$_POST['author'];
	$idBooks=$_POST['idBooks'];

	$sql=$db->prepare("UPDATE books SET name=:a_name, author=:a_author WHERE idBooks=:a_idBooks");
	$sql->bindParam(':a_name',$name);
	$sql->bindParam(':a_author',$author);
	$sql->bindParam(':a_idBooks',$idBooks);
	$sql->execute();

	http_response_code(201);
?>
