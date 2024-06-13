<?php
require_once 'banco.php';
$bc = new Banco;
if (isset($_POST['enviar'])) {
    $conc = $bc->conectar();
    $cli_id = $_POST['cli_id'];
    $cli_nome = $_POST['cli_nome'];
    $cli_telefone = $_POST['cli_telefone'];
    $sql = "INSERT INTO cliente (cli_id , cli_telefone, cli_nome) VALUES ('$cli_id', '$cli_telefone','$cli_nome')";

    if ($conc->query($sql) === TRUE) {
        echo "Registro inserido com sucesso.";
    } else {
        echo "Erro ao inserir registro: " . $conc->error;
    }
    mysqli_close($conc);
    header("location: cadastro-veiculo.html");
    exit();
}
