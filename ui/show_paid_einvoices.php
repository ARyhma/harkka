<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>A-Pankki - Maksetut e-laskut</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <script src="rest.js"></script>
  </head>
  <body>

    <?php include 'navbar.php';?>

    <div class="container" style="margin:40px auto; max-width: 1000px">

      <script>
          GetPaidEinvoices_for_id(<?php echo $_SESSION['asiakasID']; ?>);
      </script>

      <br>

      <div class="container" style="max-width: 1000px">
        <h3>Maksetut e-laskut</h3>
        <table class="table table-bordered" id="tilitapahtumien_tiedot">
          <thead><tr><th>Saaja</th><th>IBAN</th><th>Viite</th><th>Viesti</th><th>Määrä</th><th>Aika</th></tr></thead>
        </table>
      </div>

      </div>
    </div>

  </body>
</html>
