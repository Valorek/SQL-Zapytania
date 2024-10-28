<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php

    if(isset($_POST['imie']) && isset($_POST['nazwisko']) && isset($_POST['miastoz']))
    {
        $conn = mysqli_connect('localhost','root','','porty_lotnicze') or die("Błąd z połaczeniem");
        mysqli_set_charset($conn, "utf8");
        $imie = $_POST['imie'];
        $nazwisko = $_POST['nazwisko'];
        $miastoz = $_POST['miastoz'];
        $kierunek = $_POST['kierunek'];

        $query = "INSERT klienci VALUE('','$imie','$nazwisko','$miastoz', $kierunek)";
        $result = mysqli_query($conn, $query);

        echo $imie." ".$nazwisko." został dodany do bazy";
    } else {
        echo "Wprowadż dane";
    }
    mysqli_close($conn);
    ?>

    <br>
    <a href="index.php">Wróć do menu</a>
</body>
</html>


