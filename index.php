<!DOCTYPE html>
<html lang="en" dir="ltr">

  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>A-Pankki</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
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
      <form id='LoginForm' action="./api/login.php" method="post" data-toggle="tooltip" title="Tunnus: yksi Salasana: yksi">
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
              <span class="fa fa-user" style="font-size: 75px;"></span>
              <h5>Juho<br>Rajala</h5>
            </div>
            <div class="col-sm-3">
              <span class="fa fa-user" style="font-size: 75px;"></span>
              <h5>Antti<br>Rajala</h5>
            </div>
            <div class="col-sm-3">
              <span class="fa fa-user" style="font-size: 75px;"></span>
              <h5>Petteri<br>Hamalainen</h5>
            </div>
            <div class="col-sm-3">
              <span class="fa fa-user" style="font-size: 75px;"></span>
              <h5>Tomi<br>Mujunen</h5>
            </div>
          </div>
        </div>
      </footer>

  </body>
</html>
