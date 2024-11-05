<?php
    include_once "connect.php";

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form action="index.php" method="POST">
        <label for="id">Wpisz swoje ID:</label>
        <input type="number" name="id">
        <br>
        <br>
        <label for="Imie">Wpisz swoje imie:</label>
        <input type="text" name="imie">
        <br>
        <br>
        <label for="nazwisko">Wpisz swoje nazwisko:</label>
        <input type="text" name="nazwisko">
        <br>
        <br>
        <label for="miejscowosc">Wpisz swoja miejscowosc:</label>
        <input type="text" name="miejscowosc">
        <input type="submit" value="Wyslij">
        <input type="reset" value="Zresetuj">
    </form>
    <?php
        $id=$_POST['id'];
        $imie=$_POST['imie'];
        $nazwisko=$_POST['nazwisko'];
        $miejscowosc=$_POST['miejscowosc'];
        $zapytanie="INSERT INTO klienci (ID_klienta,imie,nazwisko,miejscowosc) VALUES ('$id','$imie','$nazwisko','$miejscowosc')";
        $sql=mysqli_query($conn,$zapytanie);
    ?>

    <table border='1px'>
        <tr>
            <th>ID</th>
            <th>Imie</th>
            <th>Nazwisko</th>
            <th>Miejscowosc</th>
</tr>
<?php
$sql2="SELECT * FROM Klienci";
$zapytanie2=mysqli_query($conn,$sql2);

while($wiersz=mysqli_fetch_assoc($zapytanie2))
{
    echo "<tr>";
    echo "<td>".$wiersz['ID_klienta']."</td>";
    echo "<td>".$wiersz['imie']."</td>";
    echo "<td>".$wiersz['nazwisko']."</td>";
    echo "<td>".$wiersz['miejscowosc']."</td>";
    echo "</tr>";

}
mysqli_close($conn);
?>
</table>
</body>
</html>
