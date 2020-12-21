-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 31, 2019 at 03:54 PM
-- Server version: 8.0.18
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `grades`
--
CREATE DATABASE IF NOT EXISTS `grades` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `grades`;

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
CREATE TABLE `classes` (
  `id` int(11) NOT NULL,
  `class_name` varchar(30) NOT NULL,
  `class_full_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`id`, `class_name`, `class_full_name`) VALUES
(1, 'API_1', 'Annee Preparatoire Integre 01'),
(2, 'API_2', 'Annee Preparatoire Integre 02'),
(3, 'TC', 'Tronc Commun'),
(4, 'GIID_01', 'Genie Informatique et Ingenierie de donne'),
(5, 'GI_01', 'Genie Informatique'),
(6, 'GE_01', 'Genie Electrique'),
(7, 'GRT_01', 'Genie Reseaux & Telecommunication'),
(8, 'GPER_01', 'Genie Procede Energie Renouvlable'),
(9, 'GIID_02', 'Genie Informatique et Ingenierie de donne'),
(10, 'GIID_03', 'Genie Informatique et Ingenierie de donne'),
(11, 'GI_02', 'Genie Informatique'),
(12, 'GE_02', 'Genie Electrique'),
(13, 'GRT_02', 'Genie Reseaux & Telecommunication'),
(14, 'GPER_02', 'Genie Procede Energie Renouvlable'),
(15, 'GPER_03', 'Genie Procede Energie Renouvlable');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `course_name` varchar(45) NOT NULL,
  `course_semester` int(11) DEFAULT (1),
  `class_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `course_name`, `course_semester`) VALUES
(1, 'Analyse01', 1),
(2, 'Algebre 01', 1),
(3, 'Francais', 1),
(4, 'Mecanique 01', 1),
(5, 'Infromatique 01', 1),
(6, 'Physique 01', 1),
(7, 'Analyse 02', 1),
(8, 'Algebre 03', 1),
(9, 'Francais', 1),
(10, 'Mecanique 02', 1),
(11, 'Infromatique 03', 1),
(12, 'Electronique 01', 1),
(13, 'Algorithmique Avance', 1),
(14, 'Probabilite/Statistique', 1),
(15, 'TEC', 1),
(16, 'Electronique Numerique', 1),
(17, 'Getion Entreprise', 1),
(18, 'Anglais', 1),
(19, 'System Info & BD', 1),
(20, 'Analyse_01', 2),
(21, 'Analyse_01', 1),
(22, 'Analyse_01', 1),
(23, 'Analyse_02', 2),
(24, 'Analyse_02', 2),
(25, 'Analyse_02', 2),
(26, 'Analyse_03', 2),
(27, 'Analyse_03', 2),
(28, 'Analyse_03', 2),
(29, 'Algebre_01', 1),
(30, 'Algebre_01', 1),
(31, 'Algebre_01', 2),
(32, 'Algebre_02', 1),
(33, 'Algebre_02', 1),
(34, 'Algebre_02', 1),
(35, 'Algebre_03', 1),
(36, 'Algebre_03', 1),
(37, 'Algebre_03', 1),
(38, 'Calcul_Scientifique', 1),
(39, 'Calcul_Scientifique', 1),
(40, 'Calcul_Scientifique', 2),
(41, 'ACD', 1),
(42, 'ACD', 1),
(43, 'ACD', 1),
(44, 'Getion_Entrerpise', 2),
(45, 'Getion_Entrerpise', 2),
(46, 'Getion_Entrerpise', 2),
(47, 'Electronique_Numerique', 2),
(48, 'Electronique_Numerique', 2),
(49, 'Electronique_Numerique', 2),
(50, 'Electronique_Analogique_01', 2),
(51, 'Electronique_Analogique_01', 2),
(52, 'Electronique_Analogique_01', 2),
(53, 'Electronique_Analogique_02', 1),
(54, 'Electronique_Analogique_02', 1),
(55, 'Electronique_Analogique_02', 1),
(56, '_Programmation_C++', 2),
(57, '_Programmation_C++', 2),
(58, '_Programmation_C++', 1),
(59, 'Programmation_C', 1),
(60, 'Programmation_C', 2),
(61, 'Programmation_C', 1),
(62, 'Matlab', 2),
(63, 'Matlab', 2),
(64, 'Matlab', 1),
(65, 'Analyse_Numerique', 1),
(66, 'Analyse_Numerique', 2),
(67, 'Analyse_Numerique', 2),
(68, 'Sport', 2),
(69, 'Sport', 2),
(70, 'Sport', 1),
(71, 'Francais', 1),
(72, 'Francais', 1),
(73, 'Francais', 1),
(74, 'Anglais', 2),
(75, 'Anglais', 1),
(76, 'Anglais', 1),
(77, 'Economie', 2),
(78, 'Economie', 1),
(79, 'Economie', 1),
(80, 'DAO', 2),
(81, 'DAO', 1),
(82, 'DAO', 2),
(83, 'Mecanique_de_solide', 1),
(84, 'Mecanique_de_solide', 2),
(85, 'Mecanique_de_solide', 1),
(86, 'Mecanique_de_point', 2),
(87, 'Mecanique_de_point', 2),
(88, 'Mecanique_de_point', 1),
(89, 'Physique_01', 1),
(90, 'Physique_01', 2),
(91, 'Physique_01', 1),
(92, 'Physique_02', 1),
(93, 'Physique_02', 2),
(94, 'Physique_02', 1),
(95, 'Reseaux_&_Telecom', 2),
(96, 'Reseaux_&_Telecom', 2),
(97, 'Reseaux_&_Telecom', 2),
(98, '_Reseux_&_Telecom_Avance', 2),
(99, '_Reseux_&_Telecom_Avance', 2),
(100, '_Reseux_&_Telecom_Avance', 1),
(101, 'Java', 2),
(102, 'Java', 2),
(103, 'Java', 1),
(104, 'System_Information', 1),
(105, 'System_Information', 2),
(106, 'System_Information', 2),
(107, 'UML', 2),
(108, 'UML', 2),
(109, 'UML', 1),
(110, 'Recherche_Operationnel', 1),
(111, 'Recherche_Operationnel', 1),
(112, 'Recherche_Operationnel', 1),
(113, 'Technologie_Web', 2),
(114, 'Technologie_Web', 2),
(115, 'Technologie_Web', 1),
(116, 'Dev_Android', 1),
(117, 'Dev_Android', 1),
(118, 'Dev_Android', 1),
(119, 'Administration_System', 2);

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

DROP TABLE IF EXISTS `grades`;
CREATE TABLE `grades` (
  `student_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `first_test` int(11) NOT NULL,
  `second_test` int(11) NOT NULL,
  `course_grade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `notification_content` varchar(300) NOT NULL,
  `notification_status` varchar(15) NOT NULL,
  `student_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `professors`
--

DROP TABLE IF EXISTS `professors`;
CREATE TABLE `professors` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(60) NOT NULL,
  `passphrase` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `professors`
--

INSERT INTO `professors` (`id`, `username`, `first_name`, `last_name`, `email`, `passphrase`) VALUES
(1, 'dargham', 'abdelmajid', 'dargham', 'dargham@gmail.com', 'helloworld'),
(2, 'Olsen', 'Felix', 'Shelby', 'sed.dui.Fusce@erosProinultrices.co.uk', 'VYI64JCH3SC'),
(3, 'Nguyen', 'Elliott', 'Raya', 'lectus@eu.co.uk', 'UDI92HBL6JE'),
(4, 'Morin', 'Christopher', 'Deirdre', 'enim.consequat@tellus.co.uk', 'UKR85OOG5DR'),
(5, 'Parsons', 'Noble', 'Ori', 'vitae.orci@vulputaterisus.co.uk', 'CUW61QTW1EN'),
(6, 'Donovan', 'Yardley', 'Morgan', 'natoque.penatibus@risus.net', 'RZL97MOY5HG'),
(7, 'Fischer', 'Ralph', 'Jeanette', 'dui.lectus.rutrum@risusIn.edu', 'NUI84SAK2IB'),
(8, 'Collins', 'Stone', 'Nora', 'non@metusfacilisis.com', 'TJK16SQH8ND'),
(9, 'Simmons', 'Evan', 'Jocelyn', 'eu.placerat@Donec.ca', 'GCS86QAW0ZK'),
(10, 'Vaughn', 'Ferdinand', 'Rama', 'Aenean.eget.magna@egestasSedpharetra.edu', 'AFU33OWZ5FG'),
(11, 'Williams', 'Raja', 'Shay', 'eget@ac.co.uk', 'JSD58MQW0QR'),
(12, 'Newton', 'Jacob', 'Ima', 'ullamcorper.velit.in@enim.ca', 'XJD96ABC4UM'),
(13, 'Francis', 'Graham', 'Athena', 'augue.ut@sociosquad.co.uk', 'VRT16HUR0NM'),
(14, 'Buckley', 'Herrod', 'Nina', 'dui@massanonante.edu', 'RHV72ZJO3WW'),
(15, 'Rhodes', 'Forrest', 'Aubrey', 'elit@tempusnon.ca', 'SOE32UNA5ST'),
(16, 'Clarke', 'Vladimir', 'Farrah', 'arcu.eu.odio@Duisgravida.com', 'HCS22PPA4UD'),
(17, 'Flynn', 'Allen', 'Yetta', 'Nunc.ullamcorper@infaucibus.edu', 'WBC92JIG6AO'),
(18, 'Woodward', 'Ashton', 'Xaviera', 'iaculis.aliquet.diam@vitae.com', 'WZL95QWO9ZX'),
(19, 'Duffy', 'Garrett', 'Flavia', 'ipsum.ac.mi@dolor.org', 'KHT30WDG3MJ'),
(20, 'Chase', 'Silas', 'Neve', 'at.libero@acrisusMorbi.com', 'GDL07RYN4SS'),
(21, 'Harrington', 'Wyatt', 'Liberty', 'semper.rutrum@utsem.net', 'NXT32TBD2CS'),
(22, 'Fleming', 'Louis', 'Quon', 'Nulla.dignissim.Maecenas@Nunclaoreetlectus.org', 'MQS12XMQ1PJ'),
(23, 'Valencia', 'Adrian', 'Blaine', 'sit@felispurus.ca', 'LXT47AMJ7CI'),
(24, 'Gamble', 'Kennan', 'Bianca', 'Ut@ullamcorpereueuismod.com', 'VCK99EDC1SO'),
(25, 'Carroll', 'Brock', 'Cameron', 'eu.euismod.ac@sit.com', 'KDJ27PXC3KN'),
(26, 'Hood', 'Guy', 'Clio', 'sapien.Cras.dolor@pede.org', 'NOC95DZO1HM'),
(27, 'Robertson', 'John', 'Lisandra', 'sagittis.augue@volutpatNulla.net', 'JEA44JAZ4ND'),
(28, 'Pearson', 'Slade', 'Maxine', 'lorem.auctor@eleifendCras.edu', 'CFJ46AAO3DZ'),
(29, 'Payne', 'Hyatt', 'Haviva', 'sapien.cursus.in@suscipitest.ca', 'JZX13QHF7KW'),
(30, 'Morrison', 'Harrison', 'Rosalyn', 'eget@urna.ca', 'DAW98TSW6ZP'),
(31, 'Andrews', 'Tiger', 'Noelani', 'nulla@rutrumlorem.com', 'MZC60BWO8ZM'),
(32, 'Herrera', 'Kenyon', 'Casey', 'orci.sem.eget@intempus.co.uk', 'VVG62DTY4ME'),
(33, 'Duke', 'Matthew', 'Demetria', 'Aliquam@CuraePhasellus.net', 'IIM15WGA8NL'),
(34, 'Le', 'Ezekiel', 'Hillary', 'Sed@vel.org', 'UJM60JDU9GB'),
(35, 'Mcbride', 'Daquan', 'Emi', 'nunc.sed@nequetellus.edu', 'SBR53ZHP2UV'),
(36, 'Lowery', 'Drew', 'Kellie', 'purus.sapien@lacus.net', 'TUL40CBJ4AD'),
(37, 'Hines', 'Russell', 'Zelenia', 'molestie.orci.tincidunt@felisorciadipiscing.org', 'CTI24RPL5OC'),
(38, 'Slater', 'Slade', 'Cassady', 'tellus.sem@auctorMauris.com', 'ZHK54VSK5FF'),
(39, 'Leonard', 'Chandler', 'Jessica', 'lacus.varius@vitaepurus.edu', 'OCB52MFJ6WD'),
(40, 'Ayala', 'Aaron', 'Mariam', 'et.malesuada.fames@nibhAliquam.edu', 'AGQ11HPY9CQ'),
(41, 'Reese', 'Cyrus', 'Lacota', 'diam@blanditviverraDonec.edu', 'YRZ99SSX4TA'),
(42, 'Wilkinson', 'Garrison', 'Melanie', 'cursus.diam@pharetra.org', 'CWP99CWH9AY'),
(43, 'Chase', 'Howard', 'Imelda', 'sociis.natoque.penatibus@rutrum.com', 'ZBV43BFM3KI'),
(44, 'Waters', 'Sean', 'Jayme', 'tincidunt.neque@enim.edu', 'DQO51FMP1CR'),
(45, 'Compton', 'Sawyer', 'Sybil', 'libero.Proin@rutrummagna.org', 'MLO56RGW4FY'),
(46, 'Torres', 'Wyatt', 'Shannon', 'Sed.nulla@Phasellusdapibus.co.uk', 'UVX18URU6ZY'),
(47, 'Wolfe', 'Chancellor', 'Patience', 'aliquam.enim.nec@ligulaAeneangravida.ca', 'ODB86IHR4WL'),
(48, 'Hudson', 'Chaim', 'Paloma', 'Aliquam@Aenean.ca', 'PWO74UKG6OE'),
(49, 'Grant', 'Nero', 'Clare', 'eget.odio.Aliquam@magnatellusfaucibus.net', 'RQL09ZWP4AW'),
(50, 'Livingston', 'Charles', 'Melissa', 'ornare.sagittis@urnaetarcu.ca', 'CIB54KQQ7NK'),
(51, 'Boyer', 'Coby', 'Ayanna', 'per@idmollis.com', 'BKE43QWT1VU'),
(52, 'Sanders', 'Kirk', 'Sigourney', 'luctus.felis.purus@Crasegetnisi.edu', 'RXD71PDF7DQ'),
(53, 'Mcbride', 'Keegan', 'Anjolie', 'id.enim@sitametmetus.com', 'XRZ50DPI8PY'),
(54, 'Sullivan', 'Jackson', 'Jenette', 'est.congue@consectetueradipiscing.edu', 'ZOR04ATW9KY'),
(55, 'Juarez', 'Byron', 'Ima', 'ligula.tortor.dictum@pedenec.edu', 'KGF49IZW8LL'),
(56, 'Riley', 'Kenyon', 'Nell', 'Cras.eget.nisi@dignissim.edu', 'EGS47WCV0JH'),
(57, 'Cooper', 'Vance', 'Justine', 'quam.quis@et.net', 'FMG93VCZ5TJ'),
(58, 'Watkins', 'Nasim', 'Kai', 'urna.Vivamus@tristiquepharetraQuisque.org', 'RGH77LNS5GV');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(60) NOT NULL,
  `passphrase` varchar(45) NOT NULL,
  `class_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `username`, `first_name`, `last_name`, `email`, `passphrase`, `class_id`) VALUES
(2, 'Richards', 'Merrill', 'Patience', 'adipiscing@massaIntegervitae.co.uk', 'KDB32HPA0EC', 15),
(3, 'Powers', 'Perry', 'Eliana', 'molestie.orci@eu.org', 'GXE44QYO7ZC', 14),
(4, 'Rocha', 'Wade', 'Chava', 'erat.Sed@magna.co.uk', 'VBT27CKF6ZR', 13),
(5, 'Sherman', 'Emmanuel', 'Christine', 'eros.nec.tellus@pedePraesent.co.uk', 'KQT38ZUS5HV', 6),
(6, 'Clayton', 'Yardley', 'Sasha', 'aliquet@Sed.edu', 'TVC16VBJ4UO', 6),
(7, 'Vincent', 'Caleb', 'Bertha', 'Sed.pharetra@anteNuncmauris.net', 'BQW03PRG0QE', 8),
(8, 'Barr', 'Ivan', 'Jorden', 'litora.torquent.per@Fuscediamnunc.net', 'DNM21ESA7AG', 1),
(9, 'Whitney', 'Dorian', 'Lacey', 'fringilla@nonummy.co.uk', 'VFQ69JJL3LW', 9),
(10, 'Pickett', 'Burton', 'Hollee', 'ut.nisi.a@dictumPhasellusin.edu', 'UPM62ZAV8LY', 3),
(11, 'Wood', 'Malachi', 'Mercedes', 'Fusce.feugiat.Lorem@risusvariusorci.co.uk', 'HOD77BPJ5UI', 4),
(12, 'Cohen', 'Joshua', 'Eden', 'sagittis.lobortis.mauris@odio.net', 'HGT66WYS6FY', 10),
(13, 'White', 'Merrill', 'Kelsie', 'risus.Donec@purusDuiselementum.net', 'NUK61RHB4XZ', 8),
(14, 'Michael', 'Quinlan', 'Yolanda', 'Maecenas.iaculis@sapienmolestie.edu', 'WOQ84ZYO3WP', 15),
(15, 'Cameron', 'Jakeem', 'Dacey', 'Morbi.vehicula@ultriciessem.com', 'ULG33MDB5MX', 3),
(16, 'Carey', 'Griffith', 'Irma', 'est@elitpretiumet.edu', 'FDM41ZQM3EU', 1),
(17, 'Edwards', 'Brent', 'Ingrid', 'odio.tristique.pharetra@Suspendissecommodo.net', 'YQX93QMJ1JD', 13),
(18, 'Golden', 'Melvin', 'Hayley', 'a@montesnascetur.ca', 'WBP75ZMV8EA', 11),
(19, 'Blankenship', 'Demetrius', 'Maryam', 'nec.metus.facilisis@netus.com', 'RAV36UNZ1QW', 1),
(20, 'Manning', 'Travis', 'Aubrey', 'auctor@massaIntegervitae.co.uk', 'QPK08DOB4BH', 2),
(21, 'Walter', 'Paki', 'Carly', 'sem@pede.co.uk', 'RJF58UDL1LF', 6),
(22, 'Blackburn', 'Jamal', 'Iris', 'amet.lorem@quis.co.uk', 'WWB43CXW0ZR', 6),
(23, 'Sargent', 'Cody', 'Noelle', 'erat@facilisis.net', 'GEF52XTF7VB', 9),
(24, 'Griffin', 'Hammett', 'Anjolie', 'diam@liberoat.edu', 'YFK47UJR8CN', 5),
(25, 'Heath', 'Keefe', 'Colleen', 'ut.nulla.Cras@commodoipsum.net', 'OBR58RFV7ZS', 2),
(26, 'French', 'Aristotle', 'Halla', 'ipsum@Utnecurna.org', 'SKW06EBV7LU', 13),
(27, 'Terrell', 'Erasmus', 'Rosalyn', 'accumsan.sed@laoreet.net', 'HQR60XWJ9EC', 12),
(28, 'Chase', 'Omar', 'Melinda', 'leo.Vivamus.nibh@necimperdiet.org', 'HNU33UQN8ND', 11),
(29, 'Mclaughlin', 'Camden', 'Amaya', 'a.malesuada@nonluctussit.edu', 'EPM64BRL8ZL', 3),
(30, 'Conley', 'Christopher', 'Irma', 'euismod.et@sodalesatvelit.net', 'WOS78LLJ0CC', 11),
(31, 'Delacruz', 'Blake', 'Alexandra', 'In@Fuscedolor.org', 'SIO88NPP6JE', 8),
(32, 'Burns', 'Stephen', 'Megan', 'Fusce.mollis.Duis@dolorFusce.edu', 'XVG08NJZ6TM', 5),
(33, 'Daniels', 'William', 'Sloane', 'tellus.Nunc.lectus@magnisdis.ca', 'ZKM63RFI2FI', 2),
(34, 'Burch', 'Jelani', 'Kevyn', 'vulputate.risus.a@Donectincidunt.edu', 'XFD56SGK9NV', 5),
(35, 'Bowman', 'Byron', 'Lillith', 'ipsum.primis@massa.net', 'ETW13HSG3RA', 13),
(36, 'Black', 'Tyler', 'Kiara', 'elementum@liberoProin.edu', 'RCZ24YFN9FS', 2),
(37, 'Talley', 'Gary', 'Marcia', 'erat.volutpat@nascetur.edu', 'LYS39AGQ4KX', 12),
(38, 'Day', 'Reed', 'Cecilia', 'In@dapibus.ca', 'CIT98ARX9OP', 5),
(39, 'Davis', 'Hop', 'Gloria', 'mauris@odiosagittissemper.com', 'WAT04XFH9TB', 3),
(40, 'Moore', 'Baker', 'Desirae', 'non.egestas.a@facilisisegetipsum.ca', 'QTP47LWO8UQ', 13),
(41, 'Britt', 'Norman', 'Pearl', 'Duis.cursus@tortornibh.com', 'TTK52FDT8XD', 13),
(42, 'Hatfield', 'Laith', 'Athena', 'semper.rutrum@in.com', 'AAE63VSC9HV', 13),
(43, 'Snider', 'Jacob', 'Vanna', 'diam.Proin@ante.co.uk', 'VDA47MOO6GT', 8),
(44, 'Barber', 'Carter', 'Illiana', 'non@posuere.net', 'JUM76HTC3ZG', 3),
(45, 'Warren', 'Kasper', 'Tana', 'enim.diam@mifringilla.edu', 'PRU25GYO6DC', 11),
(46, 'Mckee', 'Tiger', 'Hannah', 'libero@velturpisAliquam.co.uk', 'DPT89OBP3CJ', 1),
(47, 'Nolan', 'Tobias', 'Kay', 'ante@enimSuspendissealiquet.ca', 'DIG29IHK9RL', 6),
(48, 'Slater', 'Ezra', 'Kessie', 'vestibulum.lorem.sit@non.net', 'WSS99BCI0GV', 8),
(49, 'Swanson', 'Jackson', 'Orla', 'suscipit@eget.org', 'CXK04DTB9VP', 15),
(50, 'Christensen', 'Wade', 'Nita', 'eu.ultrices.sit@orci.com', 'YDW57HEH4BS', 12),
(51, 'Weeks', 'Macon', 'Alisa', 'mauris.sagittis@malesuada.net', 'YHU81NMU3LZ', 1),
(52, 'Carver', 'Oleg', 'Sybil', 'Nullam@lectus.co.uk', 'ORZ26LFL6ST', 11),
(53, 'Cervantes', 'Axel', 'Phyllis', 'elementum.at@loremvitaeodio.co.uk', 'TMB38EIE7PI', 1),
(54, 'Schneider', 'Daniel', 'Gretchen', 'ipsum@Aliquam.edu', 'VWN00BET3TR', 5),
(55, 'Rice', 'William', 'Jessamine', 'Integer.urna@idsapienCras.co.uk', 'PSC09WQD1KD', 4),
(56, 'Warner', 'Nero', 'Colette', 'non.hendrerit.id@Morbineque.com', 'MDR09DQD8FC', 5),
(57, 'Kelley', 'Allen', 'Amanda', 'aliquam.eros.turpis@faucibus.co.uk', 'ZGN19HFG1UV', 8),
(58, 'Weaver', 'Charles', 'Ori', 'ornare.tortor.at@tristiqueac.net', 'JJH68UWY1YG', 15),
(59, 'House', 'Amos', 'Rose', 'ut@est.org', 'GFZ50KAB5CL', 15),
(60, 'Conner', 'Kato', 'Nerea', 'posuere.at@Sedid.co.uk', 'YMP78SWW8GB', 10),
(61, 'Reeves', 'Allen', 'Jaime', 'dictum.sapien@congueIn.ca', 'UNZ52UGN7BB', 6),
(62, 'Bennett', 'Cullen', 'Quintessa', 'ullamcorper.eu.euismod@Integervulputaterisus.ca', 'RUL73MJK7IW', 15),
(63, 'Shields', 'Scott', 'Florence', 'iaculis.nec@interdumenimnon.org', 'LLG04UIX1FH', 5),
(64, 'Kinney', 'Marvin', 'Jane', 'nec.eleifend@Fuscefermentumfermentum.co.uk', 'BTT46VDG0JM', 5),
(65, 'Rose', 'Fritz', 'Pamela', 'Nulla@tinciduntorci.co.uk', 'BPS17BRJ3OQ', 10),
(66, 'Stephens', 'Rahim', 'Rhoda', 'risus.Nunc@scelerisquemollis.ca', 'COD58XWW5PM', 6),
(67, 'Riggs', 'Buckminster', 'Daria', 'quis@perinceptos.net', 'MNV80KXE9UQ', 1),
(68, 'Coleman', 'Hop', 'Alika', 'bibendum@ornaresagittisfelis.net', 'GBZ06VBC2AX', 11),
(69, 'Klein', 'Alfonso', 'Amity', 'blandit.mattis@Suspendissedui.org', 'JSF66KMM4GT', 5),
(70, 'Winters', 'Michael', 'Megan', 'in@tinciduntvehicularisus.com', 'PIF58UYD3SG', 5),
(71, 'Davenport', 'Avram', 'Alma', 'Donec.nibh@augueutlacus.ca', 'DUH79KYH8OY', 3),
(72, 'Hayes', 'Nathaniel', 'Lynn', 'est.congue.a@eratnonummyultricies.org', 'RRJ16SKN1WX', 15),
(73, 'Dunlap', 'Stewart', 'Adara', 'in.molestie@Duisvolutpat.edu', 'PGG27XEA0AP', 13),
(74, 'Craig', 'Grant', 'Blythe', 'inceptos.hymenaeos.Mauris@massaSuspendisseeleifend.ca', 'AWB24ZBE1NH', 9),
(75, 'Burt', 'Akeem', 'Cheyenne', 'sed@necmauris.co.uk', 'MSG03BDT0XK', 13),
(76, 'Watts', 'Cadman', 'Joy', 'consectetuer@Sednullaante.ca', 'IHN99KVV4DY', 8),
(77, 'Merrill', 'Arsenio', 'Deirdre', 'risus.quis@etmagnaPraesent.ca', 'JRA76FHI1SE', 2),
(78, 'Mosley', 'Barclay', 'Tanya', 'semper.cursus@dictum.com', 'EHR80BXH8PX', 7),
(79, 'Price', 'Preston', 'Ora', 'euismod@sit.co.uk', 'QBC19SSH7AS', 5),
(80, 'Hopkins', 'Ralph', 'Isabelle', 'Nullam.suscipit@ipsumsodalespurus.co.uk', 'UUS75IFX8US', 5),
(81, 'Drake', 'Alexander', 'Zelda', 'mollis.lectus@Donec.com', 'XAB76YGB4ZO', 3),
(82, 'Carlson', 'Judah', 'Rhoda', 'nisi.Mauris.nulla@Aliquamnecenim.co.uk', 'OJN61RJR0IE', 9),
(83, 'Garrett', 'Guy', 'Jaime', 'netus.et.malesuada@molestieorcitincidunt.org', 'LVJ88GJE4HK', 2),
(84, 'Haley', 'Jelani', 'Tatum', 'Vivamus@egestasDuisac.com', 'QJC55VGI1AE', 4),
(85, 'Snow', 'Justin', 'Dacey', 'ac.feugiat@urnaVivamus.co.uk', 'ULU51LEX3QG', 14),
(86, 'Green', 'Kadeem', 'Eleanor', 'purus@aarcuSed.com', 'QYU85IXG1BX', 4),
(87, 'Everett', 'Ray', 'Sharon', 'cursus.in@placeratCrasdictum.com', 'BFT64QHR9XB', 2),
(88, 'Garcia', 'Yuli', 'Justina', 'sed@interdumNuncsollicitudin.edu', 'CXF18TBT8AW', 6),
(89, 'Blackwell', 'Harper', 'Lavinia', 'Nullam.enim.Sed@acmattissemper.com', 'WKJ51WET3QL', 10),
(90, 'Lamb', 'Sebastian', 'Tamekah', 'posuere.cubilia@volutpatnunc.edu', 'KJO40LYN9ST', 1),
(91, 'Valencia', 'Kennan', 'Lacy', 'dui.nec@quamCurabiturvel.co.uk', 'SSA53BWE4AI', 4),
(92, 'Daugherty', 'Norman', 'Kaden', 'nulla.In@velitCraslorem.net', 'MHH23CQL2RL', 2),
(93, 'Mcfadden', 'Quinlan', 'Charde', 'aliquet@sempercursusInteger.net', 'AXJ87POH9IB', 12),
(94, 'Berry', 'Kyle', 'Haley', 'nibh.Aliquam.ornare@nec.edu', 'BZD76MHH6ME', 7),
(95, 'Chapman', 'Dylan', 'Frances', 'malesuada.id@liberoatauctor.co.uk', 'JZE34PBK4GU', 4),
(96, 'Love', 'Louis', 'Miriam', 'justo.Proin.non@amet.co.uk', 'KJB22ZAF1TB', 13),
(97, 'Hester', 'Rajah', 'Aileen', 'Cras.dolor@conubia.com', 'RJZ73OJR5VX', 8),
(98, 'Stuart', 'Moses', 'Sydnee', 'arcu.eu.odio@porttitor.com', 'RBL46TCE9FK', 8),
(99, 'Pennington', 'Kato', 'Dana', 'Lorem@Lorem.co.uk', 'VZY07BLM1NH', 8),
(100, 'Reeves', 'Cedric', 'Darryl', 'lobortis.nisi.nibh@massarutrummagna.com', 'YML55OJA2ZN', 10),
(101, 'Mckinney', 'Wayne', 'Madaline', 'fringilla.purus@etmagnis.edu', 'BUT08WKX9XS', 2),
(102, 'Hobbs', 'Chadwick', 'Beatrice', 'non.massa@amet.com', 'WVP10GKX1PT', 3),
(103, 'Griffin', 'Russell', 'Maite', 'vel.pede.blandit@eudui.net', 'IFU00HZJ8NT', 14),
(104, 'Francis', 'Josiah', 'Yoshi', 'Maecenas.ornare.egestas@laoreet.com', 'ZQU63BPW2OF', 2),
(105, 'Johnston', 'Quamar', 'Quyn', 'dictum.cursus@aliquam.ca', 'CMI43YBA0UK', 7),
(106, 'Ross', 'Roth', 'Illana', 'iaculis@maurisblanditmattis.ca', 'TVW14EYS6WP', 14),
(107, 'Moon', 'Yuli', 'Xerxes', 'velit.eu@orcisem.net', 'WSF87YAG3CY', 13),
(108, 'Kinney', 'Allen', 'Mary', 'nunc.sit@ornareplacerat.edu', 'PTS18UFZ0VT', 13),
(109, 'Miller', 'Brendan', 'Mary', 'sem@blanditviverraDonec.org', 'MTL07PNT3ZO', 1),
(110, 'Farrell', 'Jin', 'Jada', 'libero@tristique.edu', 'CNV29JSI9AF', 5),
(111, 'Kelly', 'Aquila', 'Shaine', 'sagittis@eleifendvitae.co.uk', 'OZV33SCV2UJ', 5),
(112, 'Patton', 'George', 'Bell', 'senectus.et@lacus.co.uk', 'NFD15ERA7RM', 6),
(113, 'Ingram', 'Cooper', 'Tamekah', 'semper@dolorsit.co.uk', 'VTO31DHA4UI', 8),
(114, 'Cochran', 'Wade', 'Sasha', 'Nulla.interdum.Curabitur@estmollisnon.org', 'TUD50JZG4LY', 6),
(115, 'Powers', 'Akeem', 'Halee', 'interdum@dolor.net', 'TOY81DTL3EA', 6),
(116, 'Chambers', 'Luke', 'Claudia', 'et.netus@urna.org', 'PAG77RYI7YI', 9),
(117, 'Nguyen', 'Emmanuel', 'Tallulah', 'elit.a@ipsumprimis.org', 'NAW00SGU5UU', 10),
(118, 'Perry', 'Cain', 'Ebony', 'accumsan.convallis@tincidunt.net', 'LLP71RJY2AF', 2),
(119, 'Walls', 'Ciaran', 'Quyn', 'Integer@semper.co.uk', 'EFY93TRJ5II', 14),
(120, 'Benjamin', 'Jermaine', 'Ariel', 'vel@purusin.com', 'JVQ56AKT6VM', 4),
(121, 'Golden', 'Garrison', 'Nelle', 'id.libero@sit.net', 'REK56QTY6XM', 10),
(122, 'Herring', 'Neville', 'Kaden', 'suscipit.nonummy.Fusce@suscipit.co.uk', 'JBP11AFI8YX', 7),
(123, 'Wooten', 'Neville', 'Kim', 'dolor.sit@amagnaLorem.net', 'RQS37WFZ1VV', 12),
(124, 'Keller', 'Uriah', 'Yvette', 'enim.Etiam@turpis.net', 'VYW06TDJ0AO', 2),
(125, 'Chavez', 'Devin', 'Shannon', 'ut.pharetra@NullamenimSed.edu', 'LXC00KIC7QX', 4),
(126, 'White', 'Ashton', 'Cleo', 'mattis.ornare.lectus@magna.com', 'YAH94RNJ4KI', 3),
(127, 'Donaldson', 'Aidan', 'Hayfa', 'ultricies.ligula@variusNam.ca', 'UUN42KGS4FD', 6),
(128, 'Bell', 'Kennan', 'Casey', 'non.hendrerit@feugiat.com', 'DJB94CMT2WF', 12),
(129, 'Fields', 'Tyler', 'Barbara', 'Curabitur.egestas@parturient.edu', 'HOY44TNI2HQ', 5),
(130, 'Hess', 'Robert', 'Camilla', 'ipsum@nuncrisusvarius.ca', 'YHT04YFN5IM', 2),
(131, 'Frederick', 'William', 'Frances', 'adipiscing.elit@Lorem.edu', 'NJK50DLR2TH', 5),
(132, 'Walter', 'Lane', 'Leila', 'adipiscing.lobortis@massa.net', 'GSH80KHN5YI', 2),
(133, 'Mason', 'Jesse', 'Iona', 'ridiculus@feugiat.org', 'HBN56YQS5ZK', 10),
(134, 'Mathews', 'Zeus', 'Tamekah', 'vitae.sodales@semper.net', 'MRQ24QBA4RI', 15),
(135, 'Miranda', 'Brock', 'Amela', 'tempor@tristique.co.uk', 'ZIM69WEW6CF', 9),
(136, 'Holmes', 'Marshall', 'Alexa', 'ridiculus.mus@eteuismodet.org', 'BGR22LUG9NF', 15),
(137, 'Macias', 'August', 'Xantha', 'ac.tellus@et.com', 'SLQ82JTY6KG', 9),
(138, 'Mccoy', 'Armando', 'Anastasia', 'ante.dictum.mi@Duis.com', 'ANQ31HYU0EM', 10),
(139, 'Cummings', 'Salvador', 'Zia', 'massa.Suspendisse.eleifend@consectetuer.com', 'MYD93UGX4FR', 14),
(140, 'Kent', 'Rashad', 'Althea', 'ultrices.Duis@dignissim.ca', 'GVB24QMI0YE', 13),
(141, 'Raymond', 'Deacon', 'Xena', 'nisi@nunc.org', 'TTZ62GGZ5AS', 6),
(142, 'Hudson', 'Derek', 'Lilah', 'ut.pharetra.sed@enimnectempus.ca', 'AJB89IVG4MK', 8),
(143, 'Parks', 'Jameson', 'Joy', 'at.pede.Cras@enimEtiam.ca', 'ISO80CVE7QT', 15),
(144, 'Clark', 'Graham', 'April', 'adipiscing@duinec.org', 'OGL86DRM6KT', 2),
(145, 'Potts', 'Porter', 'Tamekah', 'nibh@maurisipsum.edu', 'FUM46MSY6KB', 2),
(146, 'England', 'Mannix', 'Heidi', 'egestas.Sed.pharetra@condimentum.co.uk', 'CUH17PMN2IO', 5),
(147, 'Kelly', 'Carson', 'Aretha', 'nulla@etmalesuada.co.uk', 'ZCL92ATI2UZ', 15),
(148, 'Short', 'Adrian', 'Aileen', 'libero.Integer@Craslorem.com', 'OHU46PIO9TK', 8),
(149, 'Roth', 'Beau', 'Camilla', 'et@inaliquetlobortis.ca', 'JPI80OCR6EJ', 4),
(150, 'Davidson', 'Lee', 'Ifeoma', 'et.magnis@consectetuermaurisid.net', 'TSH95ESY2WT', 4),
(151, 'Fields', 'Oliver', 'Sandra', 'metus.urna@utdolordapibus.com', 'ELI53FPF9QF', 12),
(152, 'Oneal', 'Lars', 'Jocelyn', 'euismod@laoreetliberoet.co.uk', 'MPY78TGR7TU', 4),
(153, 'Forbes', 'Aquila', 'Tamara', 'dapibus.ligula.Aliquam@euismodetcommodo.ca', 'VRG20LHM4NF', 1),
(154, 'Mccall', 'Yasir', 'Gillian', 'Suspendisse.sed@nonmagna.net', 'ZMK69CWG0GE', 11),
(155, 'Pollard', 'Addison', 'Gillian', 'Donec.sollicitudin@ategestas.com', 'YXS33VED3OU', 7),
(156, 'Levine', 'Garth', 'Teagan', 'egestas.Duis.ac@egestasDuis.co.uk', 'HBT12NMP5SN', 15),
(157, 'Gray', 'Wyatt', 'Amy', 'porttitor.eros@ut.net', 'RRK19HTW1ZL', 12),
(158, 'Bonner', 'Boris', 'Molly', 'Donec.felis.orci@eratvelpede.ca', 'OKO90QHZ4TW', 3),
(159, 'Bird', 'Byron', 'Hyacinth', 'eget.massa@hendrerit.org', 'BEH52PMO8BU', 14),
(160, 'Mathis', 'Ciaran', 'TaShya', 'libero.lacus@purus.net', 'PZX91HJC2HA', 1),
(161, 'Hayden', 'Demetrius', 'Adara', 'ut.sem@scelerisquelorem.co.uk', 'DUV49RQM6UO', 13),
(162, 'Small', 'Ivan', 'Kyla', 'ligula@sapienimperdiet.co.uk', 'QWC80PMJ6IT', 13),
(163, 'Richard', 'Kelly', 'Elizabeth', 'enim.mi@feugiatLoremipsum.ca', 'GFE90YFC5BM', 5),
(164, 'Rosales', 'Josiah', 'September', 'a@Fusce.net', 'KCL55QVP5DI', 5),
(165, 'Camacho', 'Alan', 'Charlotte', 'in.felis@mi.co.uk', 'DMS74IRW9NZ', 2),
(166, 'Simmons', 'Flynn', 'Madison', 'tellus@fringillapurusmauris.edu', 'VSR21YLB1VC', 3),
(167, 'Harper', 'Garrett', 'Kelsie', 'Donec@Sednecmetus.net', 'VRV36MAU9SF', 12),
(168, 'Kemp', 'Wing', 'Irma', 'eget@Cras.org', 'JTT69FFI3CW', 8),
(169, 'Ortiz', 'Branden', 'Zia', 'luctus@natoquepenatibuset.ca', 'PFA07STA9XS', 5),
(170, 'Matthews', 'Edan', 'Portia', 'nonummy.ut@Fuscemollis.org', 'ASH69JKZ9WR', 3),
(171, 'Cherry', 'Lev', 'Bianca', 'risus.quis@primis.net', 'JRS40ORH0YO', 11),
(172, 'Compton', 'Orlando', 'Hyacinth', 'arcu.Nunc@sed.ca', 'KZI77FNB4GQ', 13),
(173, 'Kinney', 'Kevin', 'Clementine', 'nec.malesuada.ut@acfeugiatnon.co.uk', 'HOC52UWM4SK', 6),
(174, 'West', 'Xavier', 'Darryl', 'felis.Nulla.tempor@sitametmetus.ca', 'JLX20EZK3RG', 13),
(175, 'Paul', 'Carter', 'Jada', 'sociis.natoque.penatibus@Nullamvitaediam.net', 'KNC20LUN0DT', 10),
(176, 'Jefferson', 'Samson', 'Kaye', 'cursus.in@Crasconvallis.net', 'USG29QWA1DF', 15),
(177, 'Kennedy', 'Zahir', 'Madonna', 'mollis.nec@atfringillapurus.net', 'AUC39AZF6GA', 7),
(178, 'Walter', 'Hu', 'Kirestin', 'habitant@euismod.org', 'IZJ59AIC3SX', 11),
(179, 'Drake', 'Harding', 'Lacey', 'nisl.Nulla@mollis.com', 'DOA52SJJ4IL', 8),
(180, 'Dale', 'Basil', 'Isabella', 'enim@mattissemperdui.org', 'PUM41WXC7AX', 7),
(181, 'Sharpe', 'Walker', 'Chiquita', 'est.vitae.sodales@auguemalesuada.co.uk', 'ZGN73HHF6HH', 15),
(182, 'Park', 'Gareth', 'Darryl', 'odio@auctorvelitAliquam.ca', 'PFF08TEZ2EL', 1),
(183, 'English', 'Keith', 'Justina', 'erat.volutpat.Nulla@luctuset.org', 'LOR08SSI5DX', 1),
(184, 'Winters', 'Isaiah', 'Avye', 'lectus.rutrum@parturientmontes.org', 'JHD44OZA3JZ', 12),
(185, 'Chavez', 'Zachary', 'Alma', 'eget.laoreet.posuere@Nam.ca', 'DRO25AUU9MC', 10),
(186, 'Steele', 'Jackson', 'Alexa', 'iaculis.enim@gravidanon.com', 'ZRO59CPL8YT', 12),
(187, 'Hopkins', 'Brent', 'Amaya', 'Aenean@leo.edu', 'NOU31NMP2XD', 15),
(188, 'Briggs', 'Giacomo', 'Candace', 'lacus.varius@Proinvelit.org', 'EDO03GAW7MN', 2),
(189, 'Horn', 'Oscar', 'Yolanda', 'lacinia@massaVestibulumaccumsan.co.uk', 'DWU05TER2GF', 9),
(190, 'Bullock', 'Oren', 'Shafira', 'mauris.eu@vestibulumloremsit.co.uk', 'JHG20IJZ0FY', 11),
(191, 'Kirkland', 'Louis', 'Indira', 'Donec@ac.ca', 'SBH15NCJ1VB', 15),
(192, 'Skinner', 'Nolan', 'Juliet', 'magna@mauris.net', 'HTU81QIN6PC', 9),
(193, 'Hebert', 'Hunter', 'Rina', 'egestas.Aliquam.fringilla@placeratCras.co.uk', 'IEX77FOP7JI', 7),
(194, 'Macias', 'Blake', 'Kiara', 'sed.pede.nec@QuisquevariusNam.net', 'JCI45PDE5BL', 9),
(195, 'Bentley', 'Christian', 'Dana', 'risus.a.ultricies@egestas.edu', 'UDE61JXS2KN', 7),
(196, 'Burgess', 'Slade', 'Galena', 'Nulla.eget.metus@sapienimperdiet.net', 'LLV22RGO9FN', 9),
(197, 'Coffey', 'Sylvester', 'Isadora', 'non.feugiat.nec@utnisia.ca', 'FWN61QWM6HO', 5),
(198, 'Burnett', 'Tiger', 'Nichole', 'Pellentesque.ultricies@ad.edu', 'BDB85QDI7MC', 15),
(199, 'Acosta', 'Nissim', 'Genevieve', 'eu.sem@mauris.ca', 'YZA51MYU7BW', 2),
(200, 'Holman', 'Kelly', 'Charity', 'nulla.Integer@Integer.com', 'NLW65EWA6DN', 5),
(201, 'Lloyd', 'Donovan', 'Deanna', 'iaculis@cursusdiam.net', 'LUN81SBQ3KI', 5),
(202, 'Sargent', 'Wylie', 'Blossom', 'lobortis.quis@auctorullamcorper.ca', 'KIV76FQH3YL', 7),
(203, 'Massey', 'Marvin', 'Anne', 'justo@erateget.ca', 'OHW57YWT3LZ', 3),
(204, 'Beard', 'Alden', 'Stella', 'libero.Proin.sed@montes.org', 'ELQ62PWC9ZS', 1),
(205, 'Olson', 'Colin', 'Christine', 'scelerisque.scelerisque.dui@arcuVestibulum.com', 'ZZD84MCR2RT', 5),
(206, 'Haley', 'Clayton', 'Zelenia', 'faucibus@feugiatmetus.ca', 'JRU51UED5QB', 4),
(207, 'Michael', 'Nero', 'Zephr', 'magna.Lorem@nisi.co.uk', 'WAG69AZC5HT', 12),
(208, 'Molina', 'Abel', 'Xena', 'Nullam@dui.com', 'MMT49RJI3RR', 14),
(209, 'Bradshaw', 'Curran', 'Bo', 'Nunc.ullamcorper@imperdietdictummagna.ca', 'BJA42AQH5GH', 8),
(210, 'Compton', 'Alan', 'Mari', 'ut.erat.Sed@tellus.edu', 'SYC41PWK0RK', 11),
(211, 'Blair', 'Yasir', 'Lesley', 'sodales.Mauris.blandit@augueeutellus.ca', 'YCC28VLJ5FX', 13),
(212, 'Tillman', 'Philip', 'Kirsten', 'amet.lorem.semper@Aliquamtinciduntnunc.co.uk', 'UUD90FYJ7YW', 13),
(213, 'Morse', 'Aristotle', 'Noelle', 'Nunc@Sed.com', 'SIQ74QOX3QR', 5),
(214, 'Merrill', 'Channing', 'Meghan', 'blandit@at.org', 'OCN89LWD5HJ', 7),
(215, 'Fox', 'Benjamin', 'Adena', 'eleifend.non@magnamalesuada.co.uk', 'VPJ69AVS4GF', 14),
(216, 'Blair', 'Lamar', 'Nita', 'amet.orci.Ut@ullamcorpernisl.com', 'DZG64PQB5CB', 9),
(217, 'Kemp', 'Tyrone', 'Marcia', 'luctus@Nunc.com', 'GXR69AXY8BK', 1),
(218, 'Harding', 'Garrison', 'Maile', 'aliquet@dictumeleifend.co.uk', 'VEB70ASU4RV', 14),
(219, 'Greer', 'Brenden', 'Ashely', 'mauris.sapien@et.net', 'POG76KNP2QG', 14),
(220, 'Phelps', 'Zachery', 'Melanie', 'pede@interdumCurabiturdictum.net', 'YGI47LJV9XH', 9),
(221, 'Oconnor', 'Brett', 'Erica', 'vel.mauris.Integer@vitae.ca', 'BPN53SMN8PE', 1),
(222, 'Fry', 'William', 'Taylor', 'sit.amet@Nullam.org', 'UMS27ZTA2JI', 8),
(223, 'Matthews', 'Dexter', 'Shea', 'viverra.Donec@egetmassa.co.uk', 'WQU56XPP5AX', 10),
(224, 'Singleton', 'Jerry', 'Renee', 'Curabitur@Nullamlobortisquam.net', 'IYS87EMG1VR', 1),
(225, 'Howard', 'Emery', 'Ramona', 'est.ac@orci.edu', 'HYS82NKY4NX', 6),
(226, 'Davenport', 'Lewis', 'Marah', 'dui.Cras.pellentesque@atvelitPellentesque.org', 'TIB11SSA9QG', 13),
(227, 'Nguyen', 'Lee', 'Alyssa', 'Ut.tincidunt@estmollisnon.edu', 'QIP94OWN4UW', 5),
(228, 'Gallagher', 'William', 'Nevada', 'odio.tristique@InloremDonec.edu', 'IJX83FWR8VN', 11),
(229, 'Mcdowell', 'Ivor', 'Illiana', 'Mauris.nulla@dapibusid.ca', 'DCA26MSM2HW', 6),
(230, 'Evans', 'Dolan', 'Wendy', 'tellus.Phasellus.elit@NullafacilisiSed.ca', 'FOV06PXN7JM', 11),
(231, 'Mccarthy', 'Nash', 'Miranda', 'Vivamus@risus.com', 'VJH34RIF3AT', 14),
(232, 'Justice', 'Dexter', 'Sybil', 'libero@ac.ca', 'BQN42LEY6AK', 5),
(233, 'Pate', 'Laith', 'Serena', 'faucibus.orci@nulla.co.uk', 'UXO99RHZ1WV', 6),
(234, 'Adams', 'Bernard', 'Inez', 'lorem.vitae.odio@Morbimetus.ca', 'VMF51OGZ9IS', 11),
(235, 'Owens', 'Denton', 'Eliana', 'lacus.Ut@lacusCras.com', 'LUA87YUK4QK', 6),
(236, 'Snow', 'Nathan', 'Britanney', 'leo.Cras.vehicula@Aeneansedpede.com', 'KGQ33RAD2MF', 8),
(237, 'Dejesus', 'Aidan', 'Patience', 'mollis@Curabiturvellectus.com', 'ZQM89KTF1KI', 3),
(238, 'Mendez', 'Kato', 'Stacey', 'diam@sit.org', 'IHC13VMS3LG', 6),
(239, 'Morgan', 'Xanthus', 'Lacy', 'adipiscing.lobortis@gravida.ca', 'FHT18URO9KL', 9),
(240, 'Mcfarland', 'Drake', 'Rinah', 'Proin.nisl.sem@necluctus.net', 'ETM00DLW6UH', 3),
(241, 'Walsh', 'Howard', 'Yolanda', 'Suspendisse.ac.metus@velit.edu', 'YNO94DYP1FM', 8),
(242, 'Garcia', 'Jakeem', 'Sonia', 'et.netus@loremac.ca', 'YGP35MCK7TM', 4),
(243, 'Mathis', 'Kadeem', 'Naida', 'dignissim.pharetra.Nam@lacus.net', 'CVY09TIL2UH', 11),
(244, 'Hanson', 'Tad', 'Desirae', 'lobortis.tellus.justo@amet.ca', 'VOB11PNJ0QJ', 3),
(245, 'Solomon', 'Travis', 'Orli', 'ornare@famesac.edu', 'SIG13YJA6YM', 10),
(246, 'Lucas', 'Oliver', 'Camille', 'ornare@consectetueripsumnunc.net', 'LQI67CXK2OF', 11),
(247, 'Richmond', 'Lucian', 'Serina', 'egestas.lacinia@malesuada.org', 'WRU41BWF0TQ', 14),
(248, 'Mccarty', 'Ciaran', 'Kim', 'id@quismassa.com', 'FID30RRF2QZ', 11),
(249, 'Montgomery', 'Branden', 'Deanna', 'vestibulum.nec.euismod@magnaa.edu', 'YLM36CUJ4SI', 6),
(250, 'Emerson', 'Hakeem', 'Bree', 'aliquam.iaculis.lacus@loremipsumsodales.org', 'AUD87GNU8NC', 3),
(251, 'Gilmore', 'Holmes', 'Maya', 'Maecenas@fringillaornare.ca', 'KTW01VSF6BW', 6),
(252, 'Alston', 'Abraham', 'Signe', 'dignissim.magna@orciDonecnibh.net', 'XRP58OUF4KE', 7),
(253, 'Holman', 'Francis', 'Roanna', 'ut@risusMorbimetus.org', 'GMO83UBH7UU', 15),
(254, 'Mendoza', 'Lev', 'Brooke', 'Curabitur@congueaaliquet.ca', 'QZS12ABZ2QX', 11),
(255, 'Price', 'Berk', 'Tanisha', 'ipsum.leo@sit.org', 'ZQR68OMF0HV', 6),
(256, 'Goff', 'Bruce', 'Megan', 'facilisis@egestasblanditNam.edu', 'BTH69ZUB2NK', 10),
(257, 'Fields', 'Ira', 'Fiona', 'tristique@anteblandit.org', 'ZSQ96JLP6BM', 7),
(258, 'Waller', 'George', 'Shay', 'adipiscing.Mauris.molestie@estcongue.net', 'FMH14XJR2HF', 7),
(259, 'Payne', 'Elvis', 'Jessica', 'quis.turpis.vitae@Fusce.org', 'CXB11XBD1YC', 5),
(260, 'Schultz', 'Levi', 'Alana', 'nec.quam@etmalesuada.co.uk', 'NDO02NIM9EH', 9),
(261, 'Stone', 'Gavin', 'Kessie', 'nec.tempus@eunulla.com', 'BGQ73XNH9CP', 5),
(262, 'Gillespie', 'Jackson', 'May', 'feugiat@luctusipsumleo.org', 'BMT64IOX0UW', 15),
(263, 'Byers', 'Damian', 'Leslie', 'nisi.sem.semper@scelerisquemollisPhasellus.net', 'YMB24SDX7QG', 8),
(264, 'Gould', 'Lester', 'Roanna', 'non.justo@interdumCurabitur.co.uk', 'KZM91TWO1YI', 4),
(265, 'Luna', 'Kyle', 'Miriam', 'enim.Nunc.ut@accumsanlaoreet.org', 'BEI17MKN0BI', 13),
(266, 'Blair', 'Uriah', 'Jenna', 'egestas.Duis.ac@Suspendisse.ca', 'LRU38SKQ8FW', 11),
(267, 'Ward', 'Magee', 'Blossom', 'mi@Vestibulum.org', 'EIG68SSR7VE', 3),
(268, 'Jackson', 'Thor', 'Fiona', 'eget.magna.Suspendisse@euenimEtiam.com', 'LAS47PUX0WO', 7),
(269, 'Slater', 'Alan', 'Vera', 'lobortis.ultrices.Vivamus@in.edu', 'JYB03OXG8XG', 1),
(270, 'Glover', 'Neville', 'Eden', 'eu@quis.edu', 'VUX99YGH2BY', 5),
(271, 'Blanchard', 'Cedric', 'Risa', 'In.nec@temporbibendumDonec.co.uk', 'BEJ60NBQ1FY', 2),
(272, 'Baird', 'Cadman', 'Gwendolyn', 'nec.mollis@atpede.org', 'EFB06IFJ8UJ', 10),
(273, 'Foreman', 'Owen', 'Isadora', 'Ut@eunullaat.net', 'PMH71BOV5UM', 9),
(274, 'Watkins', 'Ethan', 'Quail', 'risus@porttitorvulputate.edu', 'REQ97XUV5NH', 8),
(275, 'Dennis', 'Felix', 'Imelda', 'non.bibendum.sed@temporerat.net', 'ZLW72LPW6WT', 15),
(276, 'Brock', 'Neil', 'Alma', 'id.mollis.nec@tempor.co.uk', 'IVB77GWM5PG', 5),
(277, 'Espinoza', 'Hop', 'Mara', 'ut.mi.Duis@natoquepenatibuset.ca', 'VZE02JYO0BN', 7),
(278, 'Fulton', 'Kennan', 'Carla', 'Nam.ligula.elit@velitegestas.com', 'SOE83LKP2FW', 13),
(279, 'Byers', 'Sebastian', 'Germaine', 'Donec.fringilla.Donec@orci.co.uk', 'PVK26GBG4SD', 10),
(280, 'Wells', 'Isaac', 'Kristen', 'rhoncus.id.mollis@euodiotristique.co.uk', 'SBH35OPW3CE', 5),
(281, 'Branch', 'Erich', 'Marah', 'a.odio.semper@vitaesodales.org', 'ABK53EXI9CF', 12),
(282, 'Best', 'Gabriel', 'Adena', 'risus@adipiscing.org', 'OMP25UXE3PF', 8),
(283, 'Lester', 'Lyle', 'Kalia', 'sed@habitantmorbi.com', 'KIW43LQV8YC', 10),
(284, 'Oneil', 'Jameson', 'Tashya', 'fermentum.arcu.Vestibulum@suscipit.net', 'VPR24FSZ2IJ', 15),
(285, 'Armstrong', 'Joseph', 'Haviva', 'adipiscing.fringilla.porttitor@nisidictum.net', 'WEK37HAL8RV', 3),
(286, 'Lopez', 'Castor', 'Ursula', 'sem.eget.massa@Crassed.com', 'YYV75LQK4RK', 10),
(287, 'Clemons', 'Jarrod', 'Jaquelyn', 'Sed.eget.lacus@fringillaest.org', 'DRS93LKX8PC', 1),
(288, 'Michael', 'Reed', 'Sheila', 'diam.eu@parturientmontes.edu', 'RJL43QYE9CF', 11),
(289, 'Michael', 'Lionel', 'Zorita', 'sit.amet@magnaCrasconvallis.org', 'CMO67WJI4QH', 5),
(290, 'Moran', 'Boris', 'Kevyn', 'Nunc@nullaIntincidunt.com', 'QKM64MQX9XY', 3),
(291, 'Mitchell', 'Reese', 'Rebecca', 'cursus.Nunc.mauris@estMauriseu.org', 'ARK95WLS7AT', 2),
(292, 'Dale', 'Brian', 'Kylie', 'auctor.vitae@estarcu.org', 'MVS17JLO8BS', 7),
(293, 'Goodwin', 'Michael', 'Ciara', 'tincidunt.congue@arcuimperdietullamcorper.com', 'EUI77NHV7NJ', 5),
(294, 'Odom', 'Damon', 'Sasha', 'et@pedeNuncsed.net', 'XEI92IKJ3EU', 14),
(295, 'Miles', 'Derek', 'Zenaida', 'felis@euismod.com', 'DRP05IRP6YS', 3),
(296, 'Pitts', 'Melvin', 'Yolanda', 'amet.lorem.semper@pretiumaliquet.org', 'DEX79SUJ7GD', 12),
(297, 'Osborn', 'Noble', 'Kiayada', 'orci@facilisisnonbibendum.org', 'XFK46HCV1AA', 2),
(298, 'Navarro', 'Talon', 'Kevyn', 'tellus.imperdiet@nec.org', 'KUL53RUX3DY', 12),
(299, 'Hamilton', 'Connor', 'Ifeoma', 'luctus.ut.pellentesque@tellus.ca', 'BXU66IDH4MQ', 2),
(300, 'Cummings', 'Declan', 'Shellie', 'neque.In.ornare@afelisullamcorper.edu', 'GXL74BLF4CW', 11),
(301, 'Riley', 'Alfonso', 'Aphrodite', 'Nam@vitae.net', 'DCE02EVA1WK', 13);

-- --------------------------------------------------------

--
-- Table structure for table `teaching`
--

DROP TABLE IF EXISTS `teaching`;
CREATE TABLE `teaching` (
  `class_id` int(11) NOT NULL,
  `professor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `teaching`
--

INSERT INTO `teaching` (`class_id`, `professor_id`) VALUES
(1, 1),
(3, 1),
(5, 1),
(10, 1),
(9, 2),
(12, 2),
(3, 3),
(4, 3),
(6, 3),
(10, 3),
(1, 4),
(5, 4),
(9, 4),
(12, 4),
(15, 4),
(1, 5),
(4, 5),
(6, 5),
(7, 5),
(12, 5),
(13, 5),
(1, 6),
(6, 6),
(8, 6),
(9, 6),
(11, 6),
(2, 7),
(5, 7),
(13, 7),
(14, 7),
(15, 7),
(4, 8),
(6, 8),
(2, 9),
(8, 9),
(11, 9),
(13, 9),
(6, 10),
(7, 10),
(9, 10),
(11, 10),
(15, 10),
(2, 11),
(9, 11),
(10, 11),
(15, 11),
(2, 12),
(4, 12),
(6, 12),
(14, 12),
(4, 13),
(7, 13),
(9, 13),
(12, 13),
(3, 14),
(4, 14),
(5, 14),
(6, 14),
(7, 14),
(10, 14),
(11, 14),
(1, 15),
(8, 15),
(14, 15),
(4, 16),
(6, 16),
(10, 16),
(11, 16),
(1, 17),
(11, 17),
(13, 17),
(7, 18),
(8, 18),
(13, 18),
(10, 19),
(14, 19),
(4, 20),
(5, 20),
(15, 20),
(10, 21),
(11, 21),
(4, 22),
(8, 22),
(15, 22),
(1, 23),
(6, 23),
(4, 24),
(6, 24),
(7, 24),
(13, 24),
(14, 24),
(7, 25),
(10, 25),
(11, 25),
(12, 25),
(15, 25),
(5, 26),
(6, 26),
(8, 26),
(10, 26),
(15, 26),
(1, 27),
(2, 27),
(8, 27),
(9, 27),
(11, 27),
(14, 27),
(1, 28),
(11, 28),
(7, 29),
(13, 29),
(1, 30),
(4, 30),
(5, 30),
(11, 30),
(12, 30),
(7, 31),
(11, 31),
(12, 31),
(5, 32),
(8, 32),
(13, 32),
(4, 33),
(12, 33),
(13, 33),
(2, 34),
(4, 34),
(5, 34),
(2, 35),
(4, 35),
(11, 35),
(12, 35),
(6, 36),
(13, 36),
(14, 36),
(10, 37),
(13, 37),
(15, 37),
(2, 38),
(4, 38),
(8, 38),
(7, 39),
(9, 39),
(10, 39),
(15, 39),
(1, 40),
(7, 40),
(8, 40),
(9, 40),
(14, 40),
(15, 40),
(3, 41),
(6, 41),
(11, 41),
(13, 41),
(5, 42),
(7, 42),
(9, 42),
(11, 42),
(14, 42),
(1, 43),
(10, 43),
(14, 43),
(3, 44),
(5, 44),
(7, 44),
(11, 44),
(12, 44),
(13, 44),
(15, 44),
(1, 45),
(2, 45),
(8, 45),
(11, 45),
(2, 46),
(7, 46),
(14, 46),
(2, 47),
(1, 48),
(3, 48),
(6, 48),
(8, 48),
(14, 48),
(15, 48),
(6, 49),
(8, 49),
(12, 49),
(13, 49),
(1, 50),
(1, 51),
(11, 51),
(13, 51),
(14, 51),
(3, 52),
(5, 52),
(10, 52),
(13, 52),
(14, 52),
(2, 53),
(5, 53),
(7, 53),
(13, 53),
(15, 53),
(7, 54),
(9, 54),
(10, 54),
(13, 54),
(14, 54),
(15, 54),
(2, 55),
(6, 55),
(7, 55),
(1, 56),
(8, 56),
(10, 56),
(11, 56),
(1, 57),
(4, 57),
(10, 57),
(12, 57),
(2, 58),
(6, 58),
(7, 58);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_fk_class_id` (`class_id`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`student_id`,`course_id`),
  ADD KEY `grade_fk_course` (`course_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notif_fk_student` (`student_id`),
  ADD KEY `notif_fk_course` (`course_id`);

--
-- Indexes for table `professors`
--
ALTER TABLE `professors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_fk_class_id` (`class_id`);

--
-- Indexes for table `teaching`
--
ALTER TABLE `teaching`
  ADD PRIMARY KEY (`class_id`,`professor_id`),
  ADD KEY `teaching_fk_proffessor_id` (`professor_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `professors`
--
ALTER TABLE `professors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=302;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `course_fk_class_id` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`);

--
-- Constraints for table `grades`
--
ALTER TABLE `grades`
  ADD CONSTRAINT `grade_fk_course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `grade_fk_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notif_fk_course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `notif_fk_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `student_fk_class_id` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`);

--
-- Constraints for table `teaching`
--
ALTER TABLE `teaching`
  ADD CONSTRAINT `teaching_fk_class_id` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`),
  ADD CONSTRAINT `teaching_fk_proffessor_id` FOREIGN KEY (`professor_id`) REFERENCES `professors` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
