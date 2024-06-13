<!doctype html>
<html lang="pt-br">

<head>
  <title>Login</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="estilos/login.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>

<body>
  <div class="wrapper">
    <form action="login.php" class="form-signin" method="post">
      <h2 class="form-signin-heading text-center">Login</h2>
      <input type="text" class="form-control" name="login" placeholder="Login" required autofocus>
      <input type="password" name="senha" class="form-control" placeholder="Senha" required>
      <label class="checkbox">
        <input type="checkbox" name="lembrar" value="Mantenha Conectado" id="rememberMe">
        Mantenha Conectado
      </label>
      <input type="submit" class="btn btn-lg btn-primary btn-block" value="Enviar" name="enviar">
    </form>
  </div>
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>

</html>


<?php
require_once 'banco.php';

$bc = new Banco;
if (isset($_POST['enviar'])) {
  $conc = $bc->conectar();
  $login = $_POST['login'];
  $senha = $_POST['senha'];
  $sql = "SELECT * FROM `estacionamento` WHERE `login`='$login' AND `senha`='$senha'";
  $result = mysqli_query($conc, $sql);
  if (mysqli_num_rows($result) > 0) {
    $_SESSION['login'] = $login;
    $_SESSION['senha'] = $senha;
    setcookie("user", $login);
    header('location:cadastro-cliente.html');
  } else {
    unset($_SESSION['login']);
    unset($_SESSION['senha']);
    header('location:login.php');
  }
}
?>