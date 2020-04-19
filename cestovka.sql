-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Pon 03. dub 2017, 18:18
-- Verze serveru: 10.1.9-MariaDB
-- Verze PHP: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `cestovka`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `nabidka`
--

CREATE TABLE `nabidka` (
  `id` int(10) UNSIGNED NOT NULL,
  `destinace` varchar(100) COLLATE utf8_czech_ci NOT NULL,
  `popis` text COLLATE utf8_czech_ci,
  `cena` int(11) NOT NULL,
  `datum` date NOT NULL,
  `delka` int(11) DEFAULT NULL,
  `doprava` enum('letadlo','autobus','kombinovaná','auto') COLLATE utf8_czech_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `nabidka`
--

INSERT INTO `nabidka` (`id`, `destinace`, `popis`, `cena`, `datum`, `delka`, `doprava`) VALUES
(1, 'HOTEL CLUB SIMENA, Kypr, Kyrenia, Vasilia', 'Příjemný 3* hotelový komplex se nachází v severní části Kypru, asi 18 kilometrů od města Kyrenia. Mezinárodní letiště Ercan je vzdálené asi 55 kilometrů od hotelu. Nákupní možnosti a restaurace v pěší vzdálenosti od hotelu.', 7980, '2017-05-06', 7, 'letadlo'),
(2, 'LES PALMIERS, Tunisko, Monastir', 'Starší hotelový komplex s klasickým zařízením se nachází v krásné rozlehlé zahradě přímo u pláže. Hotelové pokoje jsou umístěné v hlavní budově a v několika přilehlých pavilonech. Hotel leží 3 kilometry od centra Monastiru. Hotel hodnotíme na kategorii 2*+.', 9851, '2017-04-12', 7, 'letadlo'),
(3, 'Vila Sara, Černá Hora, Bar', 'Vila s příjemnou atmosférou se nachází v malém letovisku na samotném okraji krásného města Bar s lesem obklopenou, 2 km dlouhou oblázkovou pláží, s pozvolným vstupem do moře. V Šušanju začíná promenáda, která vede podél moře až do samotného centra a přístavu města Bar.', 9268, '2017-07-01', 7, 'letadlo'),
(4, 'Alexander, Řecko, Rhodos, Faliraki', 'Objekt Alexander nabízí příjemné ubytování na klidném okraji letoviska Faliraki jen 50 metrů od moře a 100 metrů od písečné pláže. Na známou nudistickou pláž, skrytou v malém zálivu mezi útesy, dojdete asi za 10 minut. V okolí najdete menší obchůdky,Faliraki s mnoha restauracemi a bary je vzdáleno asi 15 minut chůze. Do hlavního města lze dojet pravidelnou autobusovou linkou.', 14300, '2017-07-14', 14, 'letadlo'),
(5, 'HOTEL MONT ROSA, Španělsko, Katalánsko, Calella', 'CALELLA DE LA COSTA Městečko staré 650 let zasahuje svými úzkými uličkami až ke 3 kilometry široké pláži se zlatým čistým pískem. Hotely jsou zpravidla situovány dále od pláže, v nové hotelové zóně. Ulice Manuel Puigvert, Garbí a Les Torretes, čistémodré moře a nedaleké přírodní parky vítají návštěvníky z celé Evropy. Plážový servis doplňují rekreační aktivity: lyžování, surfování, vodní skútry, projížďky na banánu i na šlapadlech. Pláž končí majákem, kde vystupují z moře romantické skalnaté útesy.Při pobřeží vede místní železnice spojující Barcelonu a Blanes, oběma směry je možné podnikat výlety. Poloha: Jednodušší hotel s výbornou polohou v první linii u pláže, 200 m od centra letoviska Calella. Vhodný pro mladé a méněnáročné hosty. Atmosféra v hotelu může starším klientům připadat poněkud hlučnější.', 17371, '2017-07-21', 11, 'autobus'),
(6, 'Trpanj, Chorvatsko, Jižní Dalmácie', 'Trpanj – menší turistické městečko, které se nachází na severovýchodní části poloostrova Pelješac (oblast ústřic a mušlí), proslulé svými krásnými plážemi, azurovým mořem a výtečnými druhy vína. Do městečka Trpanj vede cesta přes kouzelné historické město STON a také trajektová linka z jadranského pobřeží (město Ploče) a také proto je oblíbeným letoviskem pro všechny návštěvníky pobřeží jižní Dalmácie. Výjimečně krásná promenáda kolem moře je obklopena rozmanitými středomořskými rostlinami. Naleznete zde výborné restaurace s bohatou nabídkou ryb, plodů moře a vynikajících místních vín, proslulých v celém světě. Okolí i pláže jsou umístěny uprostřed zeleně s cypřiši a piniemi. Stálé počasí od května do října. Letovisko je vyhledávané také pro svoji tzv. „černou“ zátoku s léčivým bahnem, které léčí onemocnění pohybového ústrojí – zbaví vás bolestí kloubů bez léků!!!', 7497, '2017-06-24', 11, 'autobus'),
(7, 'REZIDENCE PRA STE MARIE, Francie, Alpy', 'REZIDENCE PRA STE MARIE Tato rezidence se nachází v malé vesničce Ste Marie. V těsné blízkostí je k dispozici sedačková lanovka u vyhlášené sjezdovky Olympique. Rezidence je vzdálená cca 1 km od obchodního centra v části Vars les Claux. V okolí semůžete věnovat paraglidingu a či jiným horským sportům.', 12255, '2017-08-04', 14, 'auto'),
(8, 'Hotel FIS, Slovensko, Štrbské Pleso', 'Hotel na klidném místě ve Štrbské Plese. Ideální jak pro zimní tak letní dovolenou.\r\nPoloha v nadmořské výšce 1355m n.m., v centru lyžařského areálu Štrbské Pleso, Lyžařský vlek: 100m.', 15372, '2017-06-16', 14, 'auto'),
(9, 'Penzion Levteri, Bulharsko, Primorsko', 'Rodinný penzion situovaný cca 60 m od severní pláže a cca 100 m od živého centra letoviska. V přízemí se nachází restaurace s venkovní terasou, kde je možné vychutnat si pokrmy bulharské i mezinárodní kuchyně.', 7790, '2017-07-21', 13, 'kombinovaná');

--
-- Klíče pro exportované tabulky
--

--
-- Klíče pro tabulku `nabidka`
--
ALTER TABLE `nabidka`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `nabidka`
--
ALTER TABLE `nabidka`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
