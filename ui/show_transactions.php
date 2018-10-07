<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>A-Pankki - Tilitapahtumat</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <script src="rest.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
  </head>
  <body>

    <?php include 'navbar.php';?>

    <div class="container" style="margin:40px auto">

      <div class="container" id="abc" style="max-width: 1200px">

      <div class="dropdown" id="tilinro"></div>
      <button type="button" class="btn btn-primary dropdown-toggle" id="valitse_tili" data-toggle="dropdown">Valitse tili</button>
      <ul class="dropdown-menu" role="menu" id="tee_uusi_maksu">
      </ul>

      <script>
        Populate_dropdown_for_id( <?php echo $_SESSION['asiakasID']; ?> );
      </script>

      <script>
      $(function(){
        $(".dropdown-menu").on('click', 'li a', function(event){
          $("#valitse_tili ").text($(this).text());
          var x = this.getAttribute("data-value");
          GetAccountDetails_for_id(x);
          GetTransactions_for_id(x);
         });
      });
      </script>

      <br><br>

      <div class="container" style="max-width: 1200px">
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

      <div class="container" style="max-width: 1200px">
        <h3>Tilitapahtumat</h3>
        <table class="table table-bordered" id="tilitapahtumien_tiedot">
          <thead><tr><th>Saaja</th><th>IBAN</th><th>Viite</th><th>Viesti</th><th>Määrä</th><th>Tapahtuma</th><th>Aika</th></tr></thead>
        </table>
      </div>

      </div>
    </div>

  </body>
</html>
