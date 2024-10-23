<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>wypozyczalnia_samochodow</h1>
    <?php
        require_once 'index.php';

        $sql="SELECT COUNT(cosik.id_wypozyczenia) FROM(SELECT
    dane_wypozyczen.id_wypozyczenia
FROM
    dane_wypozyczen
GROUP BY
    dane_wypozyczen.id_wypozyczenia
HAVING
    COUNT(dane_wypozyczen.id_wypozyczenia) > 1) AS cosik;";


    $result=mysqli_query($conn,$sql);
    $ile_wyp = mysqli_fetch_row($result);
    echo "Aktualna lista wypozyczen na wiecej niz jedno auto wynosi: ".$ile_wyp[0]."<br>";

    mysqli_close($conn);
    ?>
</body>
</html>
