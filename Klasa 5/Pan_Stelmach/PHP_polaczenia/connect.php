<?php
        $server="127.0.0.1";
        $user="root";
        $password='';
        $dbname="wypozyczalnia_samochodow";
        
        $conn=mysqli_connect($server,$user,$password,$dbname) OR die("blad polaczenia: ".mysqli_connect_error());
        
        if(!$conn){
            die("Blad polaczenia: ".mysqli_connect_error());
        }
        echo "Sukces polaczenia z baza danych<br><br>";
        mysqli_set_charset($conn,"utf8");
?>
