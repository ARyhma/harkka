<nav class="navbar navbar-expand-sm bg-dark navbar-dark">

  <a class="navbar-brand" href="index.php">A-Pankki</a>
  <!--ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" href="#">Link 1</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#">Link 2</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#">Link 3</a>
    </li>
  </ul-->

  <span class="navbar-text ml-auto">
    <?php
      session_start();
      if(isset($_SESSION['username'])){
        echo 'Tervetuloa '.$_SESSION['firstname'].' '.$_SESSION['lastname'];
        echo '<a href="../api/logout.php"><button  class="btn btn-link">Kirjaudu ulos</button></a>';
      }
      else {
        echo 'Tervetuloa vieras ';
        echo '<a href="../index.php"><button type="button" class="btn btn-link">Kirjaudu</button></a>';
      }
    ?>
  </span>
</nav>
