<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>A-Pankki</title>
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
      <script src="rest.js"></script>
  </head>
  <body>
<div id="login_status">
  <?php
  session_start();
    if(isset($_SESSION['username'])){
      echo 'Tervetuloa '.$_SESSION['username'].'<br>';
      echo '<a href="../api/logout.php"><button>Kirjaudu ulos</button></a>';
    }
    else {
      echo 'Tervetuloa vieras ';
      echo '<a href="login.html"><button>Kirjaudu</button></a>';
    }
  ?>
  <hr>
</div>

<div class="container">

    <p>
        <button class="btn btn-primary" onclick="GetCustomers()">Kaikki asiakkaat</button>

        Anna asiakas id
        <input type="text" id="customer_id">
        <button onclick="GetCustomer_by_id()">Etsi asiakas</button>
    </p>

    <p>
        Lisää uusi asiakas
        <br>
        <form id='AddNewCustomerForm'>
            <label for="name">Etunimi</label> <br>
            <input type="text" name="etunimi" id="etunimi"> <br>
            <label for="author">Sukunimi</label> <br>
            <input type="text" name="sukunimi" id="sukunimi"> <br>
            <label for="author">Osoite</label> <br>
            <input type="text" name="osoite" id="osoite"> <br>
            <label for="author">postinumero</label> <br>
            <input type="text" name="postinumero" id="postinumero"> <br>
            <label for="author">postitoimipaikka</label> <br>
            <input type="text" name="postitoimipaikka" id="postitoimipaikka"> <br>
        </form>
        <button onclick="AddNewCustomer()">Lisää asiakas</button>
    </p>
<!--    <p>
      Anna poistettavan kirjan id
      <input type="number" id="delete_id">
      <button class="btn btn-danger" onclick="DeleteBook()">Poista</button>
    </p>

    <p>
        Muokkaa kirja
        <br>
        <form id='UpdateForm'>
          <label for="name">Book id</label> <br>
          <input type="text" name="idBooks" id="idBooks"> <br>
            <label for="name">Book name</label> <br>
            <input type="text" name="name" id="name"> <br>
            <label for="author">Author</label> <br>
            <input type="text" name="author" id="author"> <br>
        </form>
        <button onclick="UpdateBook()">Tallenna</button>
    </p>
-->

    <div id="results"></div>
  </div>
  </body>
</html>
