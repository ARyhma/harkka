<!DOCTYPE html>
<html lang="en" dir="ltr">

  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>A-Pankki</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link href="ui/sticky-footer.css" rel="stylesheet">
  </head>

  <body>
    <div class="jumbotron text-center">
      <h1>Tervetuloa A-Pankkiin</h1>
      <p><i>Se ystävällinen pankki</i></p>
    </div>

    <div class="container" style="max-width: 400px; min-height: 350px">
      <?php
        if ( isset( $_GET['error'] ) && $_GET['error'] == '1' )
        {
          echo '<div class="alert alert-info">';
          echo '<strong>Uuups!</strong> Nyt tais tulla kirjoitusrvirhe tunnukseen tai salasanaan.';
          echo '</div>';
        }
      ?>
      <form id='LoginForm' action="./api/login.php" method="post">
        <div class="form-group">
          <label for="username">Tunnus</label>
          <input type="text" class="form-control" id="username" name="username" placeholder="Syötä käyttäjätunnus">
        </div>
        <div class="form-group">
          <label for="password">Salasana</label>
          <input type="password" class="form-control" id="password" name="password" placeholder="Syötä salasana">
        </div>
          <button type="submit" name="" class="btn btn-primary">Kirjaudu</button>
      </form>
  </div>

  <footer class="footer">
        <div class="container" style="background-color: #f5f5f5;">
          <div class="row text-center">
            <div class="col-sm-3">
              <h3>CTO</h3>
              <p>Juho Rajala</p>
            </div>
            <div class="col-sm-3">
              <h3>CFO</h3>
              <p>Antti Rajala</p>
            </div>
            <div class="col-sm-3">
              <h3>CMO</h3>
              <p>Petteri Hamalainen</p>
            </div>
            <div class="col-sm-3">
              <h3>COO</h3>
              <p>Tomi Mujunen</p>
            </div>
          </div>
        </div>
      </footer>

  </body>
</html>
