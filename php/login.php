<?php
//conexão com o banco
$con = mysqli_connect("127.0.0.1", "root", "", "wilah");

//variáveis
$email = $_POST['Email'];
$senha = $_POST['Password'];

//pesquisa no banco
$query = "SELECT id_cliente from cliente WHERE email = " . "'".$email."'" ." and senha = " .  "'".$senha."'";
?>

</br>
</br>

<?php
$result = mysqli_query($con, $query);
$row = mysqli_num_rows($result);

//liberar acesso
if (mysqli_num_rows($result) != 1) {
    // Mensagem de erro quando os dados são inválidos e/ou o usuário não foi encontrado
    header('Location: ../login.html'); 
} else {
    // Salva os dados encontados na variável $resultado
    $resultado = mysqli_fetch_assoc($result);
    header('Location: ../app.html'); 
}

?>