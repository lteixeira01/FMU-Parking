<?php
class Banco
{

    function conectar()
    {
        $conc = mysqli_connect("localhost", "root", "", "fmu_parking");
        return $conc;
    }

    //function query($con, $sql)
    //{
     //   mysqli_query($con, $sql);
   // }

    // Verifica se a conexão foi estabelecida com sucesso
//if ($con->connect_error) {
 //   die("Erro na conexão: " . $conn->connect_error);
//}
}
