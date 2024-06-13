
<?php
require_once 'banco.php';
$bc = new Banco;
if (isset($_POST['enviar'])) {
  $conc = $bc->conectar();
  $reg_data_entrada = $_POST['reg_data_entrada'];
  $cli_id = $_POST['cli_id'];
  $vei_placa = $_POST['vei_placa'];
  $reg_data_saida = $_POST['reg_data_saida'];
  $sql = "INSERT INTO registro (reg_data_entrada, reg_data_saida, vei_placa, cli_id) VALUES ('$reg_data_entrada', '$reg_data_saida', '$vei_placa', '$cli_id')";

  if ($conc->query($sql) === TRUE) {
    echo "Registro inserido com sucesso.";
} else {
    echo "Erro ao inserir registro: " . $conc->error;
} mysqli_close($conc);
header("location: listar.php");
exit(); 
}
?>


