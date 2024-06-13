<!DOCTYPE html>
<html lang="pt-br">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Listagem de Registros</title>
  <link rel="stylesheet" href="estilos/manager.css">
</head>

<body class="text-center">
  <div class="cover-container d-flex h-100 p-3 mx-auto flex-column">
    <header class="masthead mb-auto">
      <div class="inner">
        <h3 class="masthead-brand">FMU - Parking</h3>
        <nav class="nav nav-masthead justify-content-center">
          <nav>
            <ul>
              <li><a class="nav-link" href="index.html">Voltar</a></li>
              <li><a class="nav-link" href="listar.php">Listagem de clientes</a></li>
              <li><a class="nav-link" href="listar-veiculos.php">Listagem de veículos</a></li>
            </ul>
          </nav>
          <div class="clearfix"></div>
    </header>

    <div class="clearfix"></div>
    </header>
    <table id="customers">
      <tr>
        <th>ID Registro</th>
        <th>CPF</th>
        <th>Placa</th>
        <th>Data entrada</th>
        <th>Data Saida</th>


      </tr>
      <?php
      require_once 'banco.php';
      $bc = new Banco;
      $con = $bc->conectar();
      $query = "SELECT * FROM `registro`";
      $dados = mysqli_query($con, $query);
      $result = mysqli_fetch_assoc($dados);
      $total = mysqli_num_rows($dados);
      if ($total > 0) {
        do {
          echo "<tr>" .
            "<td>" . $result['reg_id'] . "</td>" .
            "<td>" . $result['cli_id'] . "</td>" .
            "<td>" . $result['vei_placa'] . "</td>" .
            "<td>" . $result['reg_data_entrada'] . "</td>" .
            "<td>" . $result['reg_data_saida'] . "</td>" .

            "</tr>";
        } while ($result = mysqli_fetch_assoc($dados));
      }
      if ($con->query($sql) === TRUE) {
        echo "Registro inserido com sucesso.";
      } else {
        echo "Erro ao inserir registro: " . $con->error;
      }
      mysqli_close($con);
      header("location: index.php");
      exit();
      ?>
    </table>
</body>

</html>