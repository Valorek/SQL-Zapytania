<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Document</title>
</head>
<body>
    
<form action="rezerwacja.php" method="post">
    Imie: <input type="text" name="imie">
    Nazwisko: <input type="text" name="nazwisko">
    Miasto zamieszkane: <input type="text" name="miastoz">

    <?php
    $conn = mysqli_connect('localhost','root','','porty_lotnicze') or die("Błąd z połaczeniem");
       
    $query = "SELECT odloty.id, odloty.miasto, odloty.data FROM odloty";
    $result = mysqli_query($conn, $query);

    echo '<select name="kierunek">';
    while($row = mysqli_fetch_row($result)) {
        echo '<option value="'.$row[0].'">'.$row[1].", ".$row[2].'</option>';
    }
     mysqli_set_charset($conn, "utf8");
    echo '</select>';

    mysqli_close($conn);

    ?>

     <br>
     <input type="reset" value="Wyczyść">;
     <input type="submit" value="Zarezerwuj">;
     <br>

    <div class="center-table">
     <?php

$conn = mysqli_connect('localhost','root','','porty_lotnicze') or die("Błąd z połączeniem");
$query = "SELECT DISTINCT odloty.miasto FROM odloty";
$result = mysqli_query($conn, $query);
echo "<table>";
echo "<tr><th>Miasto</th></tr>"; 

while ($row = mysqli_fetch_assoc($result)) {
    echo "<tr><td>" . $row['miasto'] . "</td></tr>";
}

echo "</table>";

mysqli_close($conn);
?>
</div>
</body>
</html>
