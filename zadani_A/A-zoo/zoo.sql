-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Pon 23. dub 2018, 18:55
-- Verze serveru: 10.1.30-MariaDB
-- Verze PHP: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `zoo`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `event`
--

CREATE TABLE `event` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `summary` varchar(100) CHARACTER SET utf8 COLLATE utf8_czech_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_czech_ci,
  `visitors` int(6) DEFAULT '0',
  `type` enum('charitativní','odborná','tradiční','ostatní') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `event`
--

INSERT INTO `event` (`id`, `date`, `time`, `summary`, `description`, `visitors`, `type`) VALUES
(1, '2017-03-18', '11:00:00', 'Otevření rozhledny Obora', 'V 11 hodin po dlouhé zimní pauze opět otevíráme rozhlednu.', 943, 'tradiční'),
(2, '2017-03-19', '10:00:00', 'Setkání u hrabáčů', 'Připojte se k oslavě Mezinárodního dne hrabáčů a dozvíte se zajímavosti z jejich života.', 1421, 'odborná'),
(3, '2017-03-25', '10:30:00', 'Slavnostní zahájení 86. sezony Zoo Praha', 'Společně zahájíme novou hlavní sezonu v pražské zoo. Akce začíná v 11.00 u Vzdělávacího centra.', 2144, 'tradiční'),
(4, '2017-04-01', '09:00:00', 'Pan Hroch na telefonu opět zasahuje', 'Na speciální aprílovou linku mohou celý den telefonovat zájemci – odpověď na každou otázku hlavně o zvířatech.', 86, 'ostatní'),
(5, '2017-04-01', '09:00:00', 'Mezinárodní den ptactva', 'Vycházka za volavkami a kvakoši v zoo. Slavnostní odhalení panelu na téma kvakoši v zoo a jejich výzkum. Beseda o výzkumu volavek a kvakošů v Zoo Praha.', 0, 'odborná'),
(6, '2017-04-08', '13:00:00', '1. rok slůněte Maxe', 'Malý Max už není tak docela malý a slaví první narozeniny. Oslava v Údolí slonů.', 988, 'ostatní'),
(7, '2017-04-14', '10:00:00', 'Den chovatelů želv', 'Cyklus přednášek o želvách a chovatelská poradna po celý den.', 123, 'odborná'),
(8, '2017-04-13', '09:00:00', 'Velikonoce v zoo a velikonoční prázdniny', 'Ukázky staročeských tradic spojených s jarem. Na velikonoční pondělí si zvířata při neobvyklých komentovaných krmeních pochutnají na pomlázkách.', 3814, 'tradiční'),
(9, '2017-04-23', '14:30:00', 'Běh pro zoo', 'Charitativní běh pořádaný studentským spolkem Univerzity Karlovy.', 312, 'charitativní'),
(10, '2017-04-23', '09:00:00', 'Světový den Země (Earth Day)', 'Připomenutí významného dne s upozorněním na ohrožené druhy zvířat a in-situ projekty Zoo Praha.', 5130, 'tradiční');

--
-- Klíče pro exportované tabulky
--

--
-- Klíče pro tabulku `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `summary` (`summary`),
  ADD KEY `date` (`date`),
  ADD KEY `type` (`type`),
  ADD KEY `visitors` (`visitors`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `event`
--
ALTER TABLE `event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
