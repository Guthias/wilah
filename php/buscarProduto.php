<?php
//conexão com o banco
$con = mysqli_connect("127.0.0.1", "root", "", "Wilah");

//variáveis
if(empty($_POST['buscar'])){
  $produto = "";
}else{
  $produto = $_POST['buscar'];
}


//pesquisa no banco
$query = ("SELECT * from produtos WHERE nome LIKE '" . $produto . "%';");
$encontrou = false;

if ($result = mysqli_query($con, $query)) {
  $rows = [];
  /* fetch associative array */
  while ($row = mysqli_fetch_assoc($result)) {
    $encontrou = true;
    
    echo "Nome:".$row["nome"]."<br />"; 
    echo "-----------------------------------------<br />"; 
    echo "Descricao:".$row["descricao"]."<br />"; 
    echo "-----------------------------------------<br />"; 
    echo "Preço:".$row["preco"]."<br />"; 
    echo "-----------------------------------------<br />"; 
    echo "Distribuidora:".$row["distribuidora"]."<br />";  
    echo "••••••••••••••••••••••••••••••••••••••••••••<br />"; 
    
    array_push($rows, $row);
  }
  echo json_encode($rows);
}
  /* free result set */
  mysqli_free_result($result);



if($encontrou == false){
  echo "Produto não encontrado";
}
?>





<!--
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
</head>
<body>
    <form method="post" action="BuscaProduto.php">
        Buscar:<input type="text" name="Buscar">
        <input name = "SendPesqProd" type ="submit" value="Buscar">
    </form>
    </body>
</html> -->