<?php
    $con = mysqli_connect("127.0.0.1", "root", "", "wilah");
    
    $cpf = $_POST['userCpf'];
    $telefone = $_POST['tel'];
    $senha = $_POST['userSenha'];
    $nome = $_POST['userName'];
    $email = $_POST['userEmail'];
   
    $insert = "INSERT INTO cliente(cpf, email, senha, nome, telefone) VALUES ('$cpf','$email','$senha',
        '$nome','$telefone')";
    $resultado_cliente = mysqli_query($con, $insert);
    header('Location: ../login.html'); 
?>
