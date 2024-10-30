<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>Lista furek na wypozyczenie</h1>
    
    <?php
        require_once "connect.php";
        $sql="SELECT marka,model,data_prod,kolor,przebieg,cena_doba,dostepnosc FROM samochody";
        $result=mysqli_query($conn,$sql) or die("Problemy z odczytem danych");
        echo "<table border=1><th>marka</th><th>model</th><th>data_prod/th><th>kolor</th><th>przebieg</th><th>cena_doba</th><th>dostepnosc</th>";
        while($row=mysqli_fetch_assoc($result)){
            echo '<tr><td>'.$row['marka'].
                '</td><td>'.$row['model'].
                '</td><td>'.$row['data_prod'].
                '</td><td>'.$row['kolor'].
                '</td><td>'.$row['przebieg'].
                '</td><td>'.$row['cena_doba'].
                '</td><td>'.$row['dostepnosc'].'</td></tr>';
        }
        mysqli_close($conn);
    ?>
    
</body>
</html>
