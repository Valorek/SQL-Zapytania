-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Lis 05, 2024 at 08:05 PM
-- Wersja serwera: 10.4.28-MariaDB
-- Wersja PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Klienci`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klienci`
--

CREATE TABLE `klienci` (
  `ID_klienta` int(11) NOT NULL,
  `imie` varchar(50) DEFAULT NULL,
  `nazwisko` varchar(50) DEFAULT NULL,
  `miejscowosc` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `klienci`
--

INSERT INTO `klienci` (`ID_klienta`, `imie`, `nazwisko`, `miejscowosc`) VALUES
(228, 'Marcin', 'Juralewicz', 'Olesnica'),
(250, 'Anna', 'Srokowska', 'Wolow'),
(266, 'Paulina', 'Kachniarz', 'Bielawa'),
(270, 'Mateusz', 'Krupa', 'Wroclaw'),
(275, 'Paweł', 'Pilewski', 'Wroclaw'),
(296, 'Karolina', 'Zbieska', 'Sobotka'),
(332, 'Ewa', 'Rautenberg', 'Wroclaw'),
(343, 'Maja', 'Jenda', 'Wroclaw'),
(352, 'Joanna', 'Zebala', 'Walbrzych'),
(377, 'Damian', 'Kukulski', 'Walbrzych'),
(388, 'Marek', 'Jakubowski', 'Wroclaw'),
(408, 'Mateusz', 'Podrazka', 'Sobotka'),
(420, 'Super', 'Koles', 'Zadupie'),
(440, 'Karolina', 'Jarosiewicz', 'Sobotka'),
(455, 'Malgorzata', 'Warda', 'Olesnica'),
(500, 'Mateusz', 'Smal', 'Sobotka'),
(505, 'Paulina', 'Januszewska', 'Sobotka'),
(513, 'Maja', 'Kruz', 'Walbrzych'),
(527, 'Maja', 'Janukowicz', 'Sobotka'),
(542, 'Anna', 'Krzywiec', 'Wroclaw'),
(585, 'Marek', 'Kozinski', 'Bielawa'),
(643, 'Marcin', 'Jurczak', 'Jelenia Gora'),
(644, 'Malgorzta', 'Ordecka', 'Olesnica'),
(645, 'Dorota', 'Sikora', 'Trzebnica'),
(666, 'Witek', 'Galuszka', 'Knurowice'),
(676, 'Mateusz', 'Król', 'Wroclaw'),
(700, 'Mateusz', 'Kruk', 'Sobotka'),
(701, 'Wiktor', 'Galuszka', 'Knurów'),
(888, 'Pablo', 'Nerodos', 'dobra'),
(900, 'tesetr', 'ter', 'tesg'),
(909, 'trwa', 'wrewrwrrew', 'rwrwrwrwrw');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `klienci`
--
ALTER TABLE `klienci`
  ADD PRIMARY KEY (`ID_klienta`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `klienci`
--
ALTER TABLE `klienci`
  MODIFY `ID_klienta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=910;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
