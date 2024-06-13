

<?php
require_once 'banco.php';
$bc = new Banco;
if (isset($_POST['enviar'])) {
    $conc = $bc->conectar();
    $vei_modelo = $_POST['vei_modelo'];
    $vei_placa = $_POST['vei_placa'];
    $vei_cor = $_POST['vei_cor'];
    $cli_id = $_POST['cli_id'];
    $sql = "INSERT INTO veiculo (vei_placa, vei_cor, vei_modelo, cli_id) VALUES ('$vei_placa', '$vei_modelo', '$vei_cor', '$cli_id')";

  if ($conc->query($sql) === TRUE) {
    echo "Registro inserido com sucesso.";
} else {
    echo "Erro ao inserir registro: " . $conc->error;
} mysqli_close($conc);

header("location: cadastro-entrada.html");
exit();
}
?>