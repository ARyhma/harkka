<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>A-Pankki</title>
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
      <script src="rest.js"></script>
  </head>
  <body>

    <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
      <a class="navbar-brand" href="#">          A-Pankki        </a>
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="#">Link 1</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Link 2</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Link 3</a>
        </li>
      </ul>
      <span class="navbar-text ml-auto">
        <?php
          session_start();
          if(isset($_SESSION['username'])){
            echo 'Tervetuloa '.$_SESSION['firstname'].' '.$_SESSION['lastname'];
//            echo '<li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>';
//            echo 'Tervetuloa '.$_SESSION['firstname'].' '.$_SESSION['lastname'];
            echo '<a href="../api/logout.php"><button  class="btn btn-link">Kirjaudu ulos</button></a>';
          }
          else {
            echo 'Tervetuloa vieras ';
            echo '<a href="../index.php"><button type="button" class="btn btn-link">Kirjaudu</button></a>';
          }
        ?>
      </span>
    </nav>

<div class="container" style="margin:50px">

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
