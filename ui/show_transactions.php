<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>A-Pankki</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <script src="rest.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
  </head>
  <body>

    <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
      <a class="navbar-brand" href="index.php">A-Pankki</a>
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
            echo '<a href="../api/logout.php"><button class="btn btn-link">Kirjaudu ulos</button></a>';
          }
          else {
            echo 'Tervetuloa vieras ';
            echo '<a href="../index.php"><button type="button" class="btn btn-link">Kirjaudu</button></a>';
          }
        ?>
      </span>
    </nav>

    <div class="container" style="margin:50px">

      <div class="container" id="abc" style="max-width: 800px">

      <div class="dropdown" id="tilinro"></div>
      <button type="button" class="btn btn-primary dropdown-toggle" id="valitse_tili" data-toggle="dropdown">Valitse tili</button>
      <ul class="dropdown-menu" role="menu" id="tee_uusi_maksu">
      </ul>

        <script>
          Populate_dropdown_for_id(
          <?php echo $_SESSION['asiakasID']; ?>
          );
        </script>

      <script>
      $(function(){
        $(".dropdown-menu").on('click', 'li a', function(event){
          $("#valitse_tili").text($(this).text());
          var x = this.getAttribute("data-value");
          GetAccountDetails_for_id(x);
          GetTransactions_for_id(x);
         });
      });
      </script>

      <br><br>

      <div class="container" style="max-width: 1000px">
        <h3>Tilitiedot</h3>
        <table class="table table-bordered" id="tili_tiedot">
          <tr><td>Tilinumero</td><td></td>
          <td>IBAN</td><td></td></tr>
          <tr><td>Tilin Nimi</td><td></td>
          <td>Tilin Saldo</td><td> </td><tr>
          <tr><td>SWIFT/BIC</td><td></td>
          <td>Tilin Omistaja</td><td>
          </td></tr>
        </table>
      </div>

      <br>

      <div class="container" style="max-width: 1000px">
        <h3>Tilitapahtumat</h3>
        <table class="table table-bordered" id="tilitapahtumien_tiedot">
          <thead><tr><th>Saaja</th><th>IBAN</th><th>Viite</th><th>Viesti</th><th>Määrä</th><th>Aika</th></tr></thead>
        </table>
      </div>

      </div>
    </div>

  </body>
</html>
