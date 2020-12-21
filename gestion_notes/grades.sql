-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: ablil.tech 
-- Generation Time: Jan 19, 2020 at 09:04 PM
-- Server version: 8.0.18
-- PHP Version: 7.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:10";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `grades`
--

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

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

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `course_name` varchar(45) NOT NULL,
  `course_semester` int(11) DEFAULT (1)
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
(80, 'DAO', 2);

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `student_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `first_test` int(11) NOT NULL,
  `second_test` int(11) NOT NULL,
  `course_grade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `grades`
--

INSERT INTO `grades` (`student_id`, `course_id`, `first_test`, `second_test`, `course_grade`) VALUES
(1, 35, 10, 10, 10),
(3, 13, 5, 10, 3),
(3, 52, 18, 13, 2),
(4, 40, 20, 13, 7),
(4, 52, 9, 4, 11),
(4, 57, 7, 9, 11),
(4, 77, 16, 14, 9),
(5, 21, 11, 20, 1),
(7, 40, 2, 19, 4),
(8, 35, 1, 5, 13),
(9, 75, 5, 6, 14),
(10, 45, 17, 7, 11),
(10, 75, 13, 14, 2),
(11, 10, 12, 16, 2),
(11, 27, 13, 13, 10),
(12, 5, 8, 12, 4),
(12, 54, 20, 4, 0),
(13, 65, 14, 17, 12),
(13, 67, 7, 3, 11),
(13, 78, 19, 6, 20),
(14, 80, 12, 3, 7),
(16, 21, 8, 10, 18),
(17, 26, 12, 4, 6),
(22, 70, 4, 19, 5),
(22, 77, 10, 10, 20),
(23, 66, 14, 6, 15),
(24, 40, 18, 0, 20),
(24, 65, 3, 10, 18),
(25, 74, 8, 20, 1),
(26, 47, 5, 3, 8),
(27, 8, 9, 11, 14),
(27, 27, 1, 2, 2),
(27, 78, 7, 5, 5),
(28, 8, 0, 0, 3),
(28, 69, 18, 2, 16),
(29, 56, 16, 9, 4),
(29, 62, 2, 3, 2),
(30, 62, 0, 4, 12),
(33, 21, 20, 0, 20),
(34, 77, 9, 15, 18),
(35, 28, 3, 18, 9),
(35, 65, 4, 8, 15),
(35, 72, 14, 0, 4),
(37, 14, 3, 4, 9),
(37, 53, 9, 10, 12),
(37, 54, 17, 10, 9),
(38, 48, 0, 16, 14),
(40, 26, 18, 4, 16),
(40, 38, 6, 14, 16),
(40, 62, 1, 8, 13),
(40, 76, 15, 0, 7),
(41, 8, 13, 7, 15),
(41, 11, 14, 15, 12),
(41, 13, 1, 15, 12),
(41, 21, 4, 8, 15),
(42, 35, 18, 2, 8),
(42, 41, 18, 16, 12),
(42, 68, 7, 4, 0),
(43, 28, 6, 4, 18),
(44, 7, 11, 2, 8),
(44, 14, 20, 8, 16),
(44, 57, 1, 3, 19),
(44, 61, 18, 14, 17),
(44, 67, 3, 3, 7),
(46, 54, 8, 5, 5),
(47, 10, 4, 9, 18),
(48, 22, 14, 4, 15),
(49, 75, 12, 9, 5),
(51, 79, 18, 6, 9),
(52, 10, 3, 15, 10),
(55, 5, 1, 11, 10),
(57, 36, 17, 10, 4),
(57, 60, 11, 17, 7),
(58, 1, 4, 5, 15),
(58, 10, 20, 18, 13),
(58, 23, 14, 13, 20),
(58, 72, 2, 19, 5),
(59, 50, 20, 20, 14),
(59, 67, 12, 8, 17),
(60, 15, 0, 6, 9),
(65, 5, 19, 14, 14),
(65, 49, 7, 11, 9),
(66, 12, 19, 11, 1),
(66, 36, 7, 18, 11),
(66, 61, 5, 18, 2),
(66, 76, 16, 7, 20),
(67, 17, 1, 2, 12),
(67, 30, 17, 7, 9),
(68, 52, 17, 1, 11),
(68, 78, 5, 12, 1),
(69, 6, 15, 20, 4),
(70, 6, 17, 3, 8),
(70, 19, 13, 1, 4),
(70, 61, 0, 20, 12),
(71, 67, 2, 19, 5),
(72, 12, 10, 2, 2),
(73, 52, 10, 8, 10),
(74, 8, 18, 20, 13),
(74, 15, 17, 13, 18),
(76, 57, 4, 5, 19),
(77, 60, 5, 3, 16),
(78, 32, 14, 5, 17),
(78, 47, 11, 8, 12),
(80, 47, 18, 6, 11),
(81, 19, 13, 2, 4),
(81, 27, 9, 17, 11),
(83, 38, 10, 1, 14),
(85, 40, 9, 0, 10),
(85, 75, 0, 13, 12),
(86, 35, 10, 13, 19),
(86, 52, 19, 7, 4),
(86, 53, 14, 6, 1),
(88, 45, 19, 10, 15),
(88, 48, 1, 12, 12),
(90, 13, 4, 2, 5),
(92, 46, 0, 18, 11),
(92, 76, 3, 2, 3),
(93, 28, 17, 17, 10),
(94, 20, 3, 12, 18),
(94, 42, 12, 0, 20),
(95, 16, 10, 15, 8),
(95, 66, 13, 10, 2),
(96, 24, 5, 19, 5),
(96, 38, 18, 5, 17),
(96, 68, 18, 14, 14),
(97, 24, 8, 19, 2),
(97, 26, 20, 15, 0),
(97, 41, 19, 20, 9),
(97, 61, 1, 8, 12),
(98, 36, 2, 13, 11),
(98, 59, 12, 17, 17),
(99, 27, 13, 1, 19),
(100, 53, 18, 9, 9),
(101, 20, 6, 17, 5),
(102, 9, 6, 19, 14),
(102, 45, 0, 10, 15),
(103, 35, 19, 13, 1),
(104, 78, 9, 2, 16),
(107, 38, 20, 2, 14),
(109, 36, 4, 18, 16),
(109, 38, 1, 20, 3),
(110, 44, 13, 6, 1),
(110, 66, 15, 20, 20),
(112, 32, 14, 5, 2),
(112, 76, 14, 17, 4),
(113, 45, 10, 2, 15),
(114, 19, 6, 17, 18),
(115, 47, 18, 11, 13),
(115, 54, 8, 12, 12),
(116, 1, 15, 0, 20),
(116, 49, 7, 12, 14),
(116, 68, 7, 8, 6),
(117, 32, 17, 14, 16),
(117, 66, 6, 10, 14),
(118, 3, 14, 2, 10),
(119, 3, 14, 15, 3),
(119, 32, 18, 7, 2),
(119, 79, 9, 7, 19),
(120, 79, 0, 9, 8),
(121, 24, 19, 15, 20),
(123, 53, 7, 8, 10),
(123, 60, 16, 17, 1),
(124, 54, 2, 14, 0),
(126, 2, 8, 6, 12),
(127, 18, 1, 17, 3),
(127, 44, 4, 13, 9),
(127, 69, 18, 4, 8),
(128, 21, 11, 0, 7),
(128, 73, 5, 9, 14),
(129, 2, 0, 7, 8),
(131, 54, 0, 0, 2),
(131, 68, 18, 2, 7),
(132, 24, 19, 3, 16),
(132, 75, 14, 19, 3),
(133, 40, 12, 16, 18),
(134, 21, 17, 13, 8),
(134, 72, 19, 18, 7),
(137, 53, 11, 13, 3),
(138, 40, 11, 1, 4),
(139, 8, 6, 5, 4),
(139, 13, 0, 0, 1),
(139, 19, 7, 12, 4),
(141, 78, 7, 0, 0),
(142, 65, 17, 9, 9),
(145, 5, 9, 0, 13),
(146, 76, 19, 19, 6),
(147, 30, 12, 8, 3),
(147, 56, 4, 7, 10),
(148, 16, 20, 13, 4),
(148, 80, 4, 17, 17),
(152, 22, 18, 17, 18),
(153, 5, 19, 17, 11),
(157, 36, 1, 6, 6),
(160, 37, 2, 3, 5),
(160, 43, 13, 2, 5),
(161, 46, 1, 16, 14),
(162, 68, 4, 20, 3),
(162, 76, 9, 15, 15),
(162, 80, 6, 5, 8),
(163, 21, 15, 4, 0),
(165, 5, 9, 9, 3),
(166, 31, 9, 1, 0),
(166, 49, 9, 17, 18),
(166, 52, 14, 6, 18),
(167, 73, 9, 12, 11),
(167, 78, 1, 11, 19),
(168, 46, 4, 2, 19),
(170, 54, 11, 9, 16),
(171, 1, 3, 17, 10),
(171, 78, 9, 20, 3),
(173, 2, 14, 17, 1),
(173, 63, 14, 20, 11),
(173, 69, 7, 16, 18),
(174, 17, 7, 15, 16),
(174, 52, 7, 9, 9),
(174, 75, 19, 19, 17),
(174, 79, 8, 12, 3),
(175, 23, 15, 2, 7),
(175, 62, 6, 6, 0),
(175, 69, 18, 18, 13),
(175, 74, 6, 1, 8),
(176, 66, 3, 10, 19),
(178, 27, 12, 3, 11),
(180, 2, 15, 16, 11),
(180, 24, 1, 20, 0),
(180, 32, 5, 13, 3),
(180, 74, 7, 20, 11),
(181, 44, 5, 7, 14),
(182, 11, 17, 10, 9),
(182, 24, 0, 14, 20),
(184, 36, 7, 5, 6),
(185, 53, 19, 11, 6),
(185, 60, 2, 18, 6),
(186, 20, 4, 6, 12),
(186, 47, 5, 14, 13),
(187, 62, 4, 19, 19),
(188, 16, 0, 2, 17),
(190, 11, 15, 18, 17),
(192, 70, 13, 17, 8),
(193, 18, 16, 14, 14),
(194, 51, 11, 3, 2),
(196, 24, 14, 3, 6),
(196, 42, 6, 1, 7),
(197, 34, 11, 14, 10),
(198, 42, 9, 12, 9),
(199, 8, 8, 3, 20),
(199, 40, 12, 18, 11),
(199, 44, 18, 20, 9),
(199, 55, 4, 10, 10);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

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
(1, 'dargham', 'Abdelmajid', 'Dargham', 'dargham@pmasdf.me', 'helloworld'),
(2, 'metrane', 'Assunta', 'Kozey', 'ebert.al@example.org', 'helloworld'),
(3, 'adaline11', 'Rocio', 'Adams', 'khodkiewicz@example.com', 'Molestias similique enim debitis ut repellend'),
(4, 'keshawn.mayert', 'Elisabeth', 'Nienow', 'vkub@example.org', 'Facilis quaerat est vel itaque. Placeat maior'),
(5, 'ucremin', 'Joey', 'Johnston', 'nkris@example.com', 'Error ullam doloremque quod vero. Dolorem qui'),
(6, 'arno.kris', 'Kathleen', 'Hahn', 'collins.graciela@example.com', 'Velit et molestiae nam voluptatem impedit vol'),
(7, 'powlowski.estelle', 'Vallie', 'Stark', 'heaven37@example.net', 'Eum ut sit aut praesentium sunt. Vel minus eo'),
(8, 'ktowne', 'Zella', 'Steuber', 'janae.hessel@example.com', 'Et ut voluptatem necessitatibus at asperiores'),
(9, 'uherzog', 'Jennyfer', 'Rodriguez', 'yo\'conner@example.net', 'Et animi consequatur est et. Eum expedita ab '),
(10, 'gregg.toy', 'Lonnie', 'McKenzie', 'ophelia.glover@example.net', 'Iusto quis facere enim et. Maiores architecto'),
(11, 'zhackett', 'Beverly', 'Bartoletti', 'cassin.yessenia@example.org', 'At repellendus impedit architecto illum est. '),
(12, 'josefa85', 'Stella', 'Bailey', 'kaylah.gerhold@example.net', 'Voluptatem ut quo quis consequuntur eveniet e'),
(13, 'josianne40', 'Heidi', 'Kemmer', 'gail49@example.net', 'Repellat vero aut ullam similique est est et.'),
(14, 'rhintz', 'Nyasia', 'Okuneva', 'kshlerin.heaven@example.org', 'Assumenda id atque et ipsa autem in magnam. Q'),
(15, 'marks.wilford', 'Kareem', 'Eichmann', 'thomas.ankunding@example.net', 'Soluta omnis voluptates deleniti rerum consec'),
(16, 'mrohan', 'Jany', 'Beer', 'leffler.casimer@example.net', 'Magnam laborum et modi repellat iure animi ev'),
(17, 'clementina.cartwright', 'Ashley', 'Hermann', 'madilyn.senger@example.org', 'Sint necessitatibus iste sit. Accusantium rep'),
(18, 'goyette.vidal', 'Bianka', 'Strosin', 'keith.ratke@example.org', 'Eos sint dolor a aut quam harum accusantium c'),
(19, 'lesch.clarabelle', 'Dusty', 'Dooley', 'kfeeney@example.com', 'Et quod nobis consequuntur iste doloremque. F'),
(20, 'cronin.robb', 'Opal', 'Fadel', 'lew73@example.com', 'Itaque velit quod dolor totam. Cum ea volupta'),
(21, 'zulauf.maye', 'Albertha', 'Mann', 'yebert@example.org', 'Enim ut soluta eligendi sequi neque inventore'),
(22, 'mary09', 'Glennie', 'Hermann', 'nikko.nader@example.org', 'Sint qui dolor maxime vitae vel. Veniam iusto'),
(23, 'tritchie', 'Dorcas', 'Schmeler', 'vsatterfield@example.org', 'Animi vitae quasi molestiae fuga provident qu'),
(24, 'vita.will', 'Keven', 'Rath', 'felipe.lang@example.net', 'Optio commodi est animi fugiat error. Optio t'),
(25, 'chadd02', 'Maximo', 'Mills', 'wunsch.pierce@example.net', 'Delectus nulla dolores necessitatibus sequi o'),
(26, 'qblock', 'Lilyan', 'McLaughlin', 'uklein@example.org', 'Eos omnis alias et corporis eaque vel. Dignis'),
(27, 'chesley.pouros', 'Dolly', 'Conroy', 'lowell.funk@example.org', 'Magnam dolor reprehenderit dolor dolores ut c'),
(28, 'caleigh84', 'Janie', 'Hoeger', 'gage36@example.org', 'Aliquid qui molestiae nostrum occaecati praes'),
(29, 'price.annamae', 'Toby', 'Hauck', 'wuckert.clemmie@example.net', 'Repellendus aut in et repellat delectus cumqu'),
(30, 'ferry.damien', 'Noemie', 'Jacobs', 'whand@example.net', 'Blanditiis eius fugiat esse soluta quos accus'),
(31, 'zromaguera', 'Rico', 'Bins', 'ethelyn.koepp@example.com', 'Nisi qui laudantium ab magnam. Doloremque qui'),
(32, 'hillard.sauer', 'Earl', 'Hickle', 'walter.cassie@example.org', 'Quam itaque suscipit id doloribus eaque. Natu'),
(33, 'dach.emie', 'Jayce', 'Dickinson', 'murphy.vernon@example.com', 'Expedita at consequatur et eius magni recusan'),
(34, 'hansen.hildegard', 'Vidal', 'Kuvalis', 'kboyle@example.net', 'Debitis vel est fuga atque est in. Non dolore'),
(35, 'rickie10', 'Fernando', 'Hansen', 'rashawn.witting@example.org', 'Sapiente dicta voluptatum facere molestias. I'),
(36, 'leta.goodwin', 'Nikko', 'Mayert', 'fking@example.net', 'Est odit quas vel est eum cumque dicta. Quod '),
(37, 'becker.pamela', 'Uriel', 'Hodkiewicz', 'kunde.monroe@example.com', 'Error vel laudantium amet debitis esse eos. P'),
(38, 'parker.luisa', 'Devan', 'Corkery', 'julian40@example.net', 'Perspiciatis maiores corrupti consequatur qui'),
(39, 'jakubowski.donny', 'Izabella', 'Rutherford', 'ricky27@example.org', 'Similique et quia aut sed suscipit consectetu'),
(40, 'wisozk.dasia', 'Lavern', 'Prohaska', 'ocollier@example.org', 'Ut dolor non pariatur perferendis eos numquam'),
(41, 'herzog.elyssa', 'Belle', 'Conn', 'cspencer@example.org', 'Fugiat et consequatur repellat vel vel et opt'),
(42, 'nigel.mccullough', 'Erna', 'Crist', 'lmosciski@example.org', 'Fuga perferendis quae ab rerum aut ut at. Lau'),
(43, 'auer.josiane', 'Albina', 'McClure', 'oeffertz@example.com', 'Id ducimus a voluptas esse minima consequuntu'),
(44, 'uaufderhar', 'Cassie', 'Mosciski', 'joe.crist@example.com', 'Voluptatem omnis voluptate voluptatibus dicta'),
(45, 'barbara60', 'Theodora', 'Deckow', 'willis57@example.org', 'Dolor voluptatum ipsa fuga eos molestiae. Non'),
(46, 'juvenal.kovacek', 'Hayley', 'Moore', 'cgleichner@example.com', 'Necessitatibus velit et neque aut architecto.'),
(47, 'schroeder.beryl', 'Ashly', 'Rau', 'lvolkman@example.com', 'Hic quisquam et numquam sunt exercitationem. '),
(48, 'hhoppe', 'Rosalia', 'D\'Amore', 'kristian16@example.com', 'Quia voluptate natus nesciunt quia autem id l'),
(49, 'qconroy', 'Chad', 'Schmidt', 'helmer.mills@example.org', 'Minima cupiditate sed culpa et. Corrupti volu'),
(50, 'dratke', 'Magdalen', 'Hayes', 'madison52@example.org', 'Id et aut quia aut eos. Qui veritatis est vol'),
(51, 'pfannerstill.kayla', 'Allen', 'Kovacek', 'grayce.toy@example.org', 'Deleniti libero omnis non in omnis numquam se'),
(52, 'kilback.dana', 'Elody', 'Skiles', 'jamar23@example.org', 'Rem molestias blanditiis molestias ut consequ'),
(53, 'xbotsford', 'Abby', 'Price', 'abernathy.georgiana@example.net', 'Id veritatis voluptates similique quo. Placea'),
(54, 'armand39', 'Adrienne', 'Reichert', 'lazaro.jakubowski@example.com', 'Sunt dolore ad aut natus natus voluptates rec');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

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
(1, 'khalil', 'Christopher', 'Anne', 'quis.arcu@rhoncusProinnisl.net', 'helloworld', 11),
(2, 'Robbins', 'Noah', 'April', 'a@orcilacus.ca', 'NXC14ZQA2WZ', 14),
(3, 'Pope', 'Marshall', 'Lilah', 'sed.libero.Proin@sapiengravida.edu', 'ZYH05JVW4XL', 6),
(4, 'karim', 'Brett', 'Audra', 'Curabitur@aliquamenimnec.ca', 'helloworld', 2),
(5, 'Palmer', 'Lionel', 'Iola', 'tellus@leo.com', 'HBP70GVV4NU', 9),
(6, 'Rowland', 'Macon', 'Orli', 'Nulla.tempor.augue@purussapiengravida.net', 'BAG30POE9CQ', 12),
(7, 'Mcmillan', 'Ralph', 'Audrey', 'ac@elitpharetra.com', 'TEP23KQO3IN', 11),
(8, 'Manning', 'Julian', 'Leandra', 'ipsum.porta.elit@massa.co.uk', 'SDI94WNK6WN', 1),
(9, 'Cabrera', 'Dominic', 'Brianna', 'egestas.blandit.Nam@volutpat.ca', 'ORZ56VHK5SK', 6),
(10, 'Sharp', 'Blaze', 'Bianca', 'Ut.semper.pretium@Maurisvelturpis.co.uk', 'FYB96GQE5XP', 2),
(11, 'Middleton', 'Christopher', 'Alana', 'sagittis.Nullam.vitae@sagittisNullamvitae.ca', 'GGE74WWR3OU', 11),
(12, 'Perez', 'Oliver', 'Moana', 'ac.libero.nec@sagittisDuis.com', 'PNI54TWT7TG', 9),
(13, 'Little', 'Brandon', 'Lillith', 'eros@euturpisNulla.co.uk', 'VQL14NOT7BN', 15),
(14, 'Clements', 'Mason', 'Kiara', 'Aenean.euismod.mauris@porttitor.net', 'TKQ73UVE5YF', 14),
(15, 'Pate', 'Gannon', 'Dorothy', 'metus.sit@mollisInteger.ca', 'PIQ83DVM4OT', 15),
(16, 'Everett', 'Calvin', 'Olga', 'ligula.Aenean.euismod@fringilla.org', 'BWD70IKZ9IH', 1),
(17, 'Rios', 'Brent', 'Alice', 'Morbi@Namnulla.com', 'EVV50ZTC5GZ', 3),
(18, 'Atkinson', 'Phelan', 'Jayme', 'Etiam.imperdiet@disparturientmontes.org', 'GHK01ADB6ZQ', 13),
(19, 'Dunn', 'Barry', 'Hillary', 'ut.lacus.Nulla@In.org', 'WWF17DOX9XC', 3),
(20, 'Kirkland', 'Edward', 'Rhoda', 'Duis@mifringillami.ca', 'LHY77KMG9ZX', 1),
(21, 'Compton', 'Leroy', 'Justine', 'Nunc.ullamcorper@senectus.edu', 'HOY82PHY7RG', 7),
(22, 'Harrell', 'Simon', 'McKenzie', 'et.pede.Nunc@Duiselementum.ca', 'CJU38BRM7FC', 10),
(23, 'Hayden', 'Davis', 'Quynn', 'malesuada.vel@dolorelit.edu', 'JON27IJY3OF', 12),
(24, 'Carver', 'Nolan', 'Lareina', 'ut.odio.vel@imperdietornareIn.org', 'ASC29BQL1PG', 14),
(25, 'Bender', 'Reece', 'Mechelle', 'neque.vitae@dolorquamelementum.net', 'SEJ42OIK7YU', 12),
(26, 'Rivera', 'Cyrus', 'Leslie', 'mauris@velitegestaslacinia.net', 'FQR92EQI4TI', 6),
(27, 'Quinn', 'Hector', 'Ora', 'elit@egetipsum.edu', 'TAT29MMA8CM', 13),
(28, 'Curry', 'Octavius', 'Maris', 'tempor.bibendum.Donec@velpedeblandit.com', 'BMW65DRQ2CB', 14),
(29, 'Ratliff', 'Keane', 'Cameron', 'mus@ametorci.ca', 'NRU65CIC5TS', 10),
(30, 'Estrada', 'Forrest', 'Tana', 'pede.Cras@magnisdis.edu', 'AFF02GHQ7AJ', 2),
(31, 'Morton', 'Alvin', 'Abra', 'pede.nec@iderat.net', 'AIG41SQF4QK', 8),
(32, 'Rodriguez', 'Hector', 'Nelle', 'dictum.ultricies@imperdiet.co.uk', 'SNO98CAX9LO', 13),
(33, 'Pierce', 'Lawrence', 'Stacy', 'diam.Pellentesque.habitant@cursus.ca', 'CSR75JJZ1IC', 4),
(34, 'Mcintyre', 'Lucas', 'Lynn', 'hendrerit.neque.In@malesuada.org', 'GQH39WRN5TY', 12),
(35, 'Carlson', 'Nathan', 'Yen', 'tincidunt@Aenean.org', 'LYQ81KII2PH', 2),
(36, 'Cortez', 'Benjamin', 'Adena', 'metus.facilisis.lorem@mollis.co.uk', 'HQH02FRO2RN', 14),
(37, 'Vang', 'Tarik', 'Shana', 'Proin@sagittis.org', 'LOB75PYG8NI', 13),
(38, 'Henderson', 'Merritt', 'Maia', 'rhoncus@dictum.edu', 'UBY77SNX8ZS', 3),
(39, 'Meadows', 'Kennan', 'Tashya', 'erat.vitae.risus@felisorciadipiscing.net', 'USA95CFU7FY', 9),
(40, 'Robinson', 'Howard', 'Ignacia', 'Curabitur@vestibulumneceuismod.co.uk', 'ZAX20WXB4NB', 15),
(41, 'Caldwell', 'Isaac', 'Faith', 'semper.dui.lectus@mifelis.org', 'UDX29DUN6UD', 10),
(42, 'Grimes', 'Abel', 'Willa', 'lorem.ipsum.sodales@sodalesat.ca', 'QXN17XOH2HK', 13),
(43, 'Mayer', 'Rafael', 'Shellie', 'vitae.risus.Duis@Fuscediamnunc.ca', 'GJQ78GBY6QV', 7),
(44, 'Fuentes', 'Akeem', 'Chiquita', 'sem.semper@Quisquepurussapien.org', 'YHS08QEE8AR', 11),
(45, 'Wilson', 'Charles', 'Alfreda', 'a.enim.Suspendisse@SeddictumProin.co.uk', 'VKN69DSX5RW', 6),
(46, 'Bass', 'Austin', 'Guinevere', 'sed.tortor.Integer@enim.ca', 'MSE20ILE2ID', 14),
(47, 'Landry', 'Rafael', 'Yetta', 'lacus@leoCrasvehicula.edu', 'CUA06LIK4PK', 8),
(48, 'Galloway', 'Fuller', 'Priscilla', 'orci.consectetuer@vulputatedui.ca', 'HIA89XSI3OQ', 14),
(49, 'Keith', 'Myles', 'Raya', 'orci.sem.eget@mitemporlorem.org', 'IUJ37FMY3CH', 3),
(50, 'Phillips', 'Hammett', 'Kathleen', 'at.velit.Pellentesque@metusurna.org', 'QRO41FVK4KO', 7),
(51, 'Cervantes', 'Hop', 'Marny', 'dolor.quam.elementum@anteVivamusnon.com', 'ZKB68SCI8SD', 15),
(52, 'Schroeder', 'Benedict', 'Leandra', 'dui.Cras@arcu.org', 'MRU45XZO0HC', 10),
(53, 'Charles', 'Dane', 'Marah', 'mi.pede@nuncQuisque.org', 'WRZ05ZMM6QL', 11),
(54, 'Fitzgerald', 'Acton', 'Winter', 'urna.et.arcu@tinciduntnuncac.com', 'UTX47PLR1EC', 12),
(55, 'Morse', 'Jesse', 'Kirsten', 'at.risus.Nunc@Proinsed.ca', 'EPR60POP9QJ', 13),
(56, 'Goff', 'Seth', 'Wilma', 'lectus.quis@interdumfeugiatSed.org', 'POD01CRQ1TJ', 10),
(57, 'Meyers', 'Clark', 'Tamara', 'Duis@facilisismagna.edu', 'MAU88ELN6JT', 10),
(58, 'Hewitt', 'Jason', 'Renee', 'malesuada@velvulputate.org', 'XFZ17JKE9OZ', 13),
(59, 'Vang', 'Samuel', 'Audra', 'fermentum@Quisque.ca', 'AHX15QOR5EE', 12),
(60, 'Robles', 'Jacob', 'Ciara', 'Donec.consectetuer.mauris@magnaLoremipsum.net', 'IFP62NWL2SV', 12),
(61, 'Williamson', 'Herrod', 'Remedios', 'ultrices.a.auctor@feugiat.edu', 'EPT75GXV6YU', 15),
(62, 'Kirkland', 'Alexander', 'Hadassah', 'porttitor.scelerisque.neque@lobortis.com', 'VMZ54PLX1OO', 4),
(63, 'Hines', 'Mufutau', 'Halla', 'scelerisque.mollis.Phasellus@euismod.co.uk', 'LYQ96HDN1OF', 14),
(64, 'Dillon', 'Brendan', 'Robin', 'rutrum.magna@ipsumSuspendissenon.com', 'DZD13YWD3NN', 10),
(65, 'Wagner', 'Levi', 'Bo', 'amet.lorem@lacusMaurisnon.co.uk', 'PKY55KCQ9QW', 14),
(66, 'Brock', 'Magee', 'Amaya', 'mauris@Fusce.net', 'ALR38GMM8ZQ', 8),
(67, 'Savage', 'Dillon', 'Eve', 'Cras.sed@commodoipsum.net', 'FYP37BHP4LL', 8),
(68, 'Tanner', 'Griffith', 'Quynn', 'justo.nec.ante@arcueu.edu', 'RLO09SKC1TL', 4),
(69, 'Acevedo', 'Kareem', 'Hanae', 'adipiscing@erosnectellus.edu', 'LZW98YFG0QV', 7),
(70, 'Roberson', 'Brian', 'Kai', 'ultrices@loremDonec.org', 'BBN38MMX8QF', 15),
(71, 'Lamb', 'Cedric', 'MacKensie', 'ut.eros@dis.edu', 'ZNO58OBH7XB', 4),
(72, 'Beach', 'Cyrus', 'Robin', 'libero.mauris@commodo.ca', 'QHP99PQV4TY', 15),
(73, 'Holder', 'Jamal', 'Hanae', 'Nullam.nisl.Maecenas@mattissemperdui.net', 'IWN55SDD2XL', 11),
(74, 'Bright', 'Mannix', 'Daria', 'Proin.eget.odio@malesuadaid.com', 'HNF86QRX6LQ', 1),
(75, 'Leach', 'Bruno', 'Suki', 'Ut.semper.pretium@Maurisblanditenim.net', 'ZDQ54OVM8BO', 8),
(76, 'Best', 'Melvin', 'Florence', 'luctus.et@placerat.ca', 'AXM01TOX8YP', 4),
(77, 'Nichols', 'Derek', 'Beverly', 'Vivamus@liberoMorbiaccumsan.net', 'HIU45NQI8KI', 6),
(78, 'Cantu', 'Scott', 'Tara', 'a@consequat.ca', 'YKQ32AYP8SS', 12),
(79, 'Rollins', 'Kieran', 'Christen', 'ac.mattis.ornare@eleifend.net', 'AKX76YCP6GT', 11),
(80, 'Williamson', 'Hyatt', 'Judith', 'Duis.cursus.diam@eratsemperrutrum.edu', 'PJD99VDM7ZX', 13),
(81, 'Bauer', 'Lester', 'Justine', 'ornare.lectus.justo@magnaetipsum.com', 'IRU50TQL6ZR', 3),
(82, 'Calderon', 'Guy', 'Nicole', 'velit.Quisque@Donecsollicitudinadipiscing.ca', 'BIB62JQW1AR', 11),
(83, 'Hewitt', 'Ryder', 'Farrah', 'Nullam@pretiumaliquet.ca', 'EHS13EHS2RG', 9),
(84, 'Snyder', 'Ethan', 'Geraldine', 'vehicula.et@risus.ca', 'HNK81OEJ9VA', 6),
(85, 'Richards', 'Arthur', 'Bertha', 'lobortis@mollisDuis.org', 'BDG81AMH0ML', 8),
(86, 'Welch', 'Lamar', 'Winifred', 'Class.aptent@egestasligulaNullam.co.uk', 'ZJM07YRS5CL', 1),
(87, 'Chandler', 'Cain', 'Petra', 'Aliquam.nec@aaliquetvel.ca', 'QHI99QOE7PQ', 6),
(88, 'Collier', 'Herrod', 'Tashya', 'a.sollicitudin.orci@ametornarelectus.com', 'XQH74NLT5UO', 13),
(89, 'Spence', 'Conan', 'Winifred', 'ut.dolor.dapibus@nibh.ca', 'YLW14ONI5KQ', 4),
(90, 'Salas', 'Kadeem', 'Rae', 'neque.non@facilisis.com', 'LQW43NJT6RC', 9),
(91, 'Vazquez', 'Francis', 'Montana', 'Ut.tincidunt@quis.ca', 'DDY11CIS7CP', 10),
(92, 'Grant', 'Barry', 'Hedy', 'Nam@magnaa.edu', 'CMM29XMP5QB', 7),
(93, 'Johns', 'Forrest', 'Jolene', 'lobortis.tellus@diamat.ca', 'LBD45IDJ8TW', 6),
(94, 'Summers', 'Erich', 'Mercedes', 'urna.Nullam.lobortis@congue.ca', 'NEE56SJX8BK', 4),
(95, 'Holman', 'Arsenio', 'Sloane', 'Nunc.laoreet.lectus@Fusce.com', 'DYN15NWF9NP', 2),
(96, 'Rose', 'Anthony', 'Odessa', 'iaculis.aliquet.diam@ornare.co.uk', 'ZNG30PPK0DU', 1),
(97, 'Shields', 'Harding', 'Lee', 'convallis.ante@dictum.ca', 'EFJ76PTK6HB', 4),
(98, 'Stark', 'Jordan', 'Madeson', 'pulvinar.arcu@elementum.ca', 'FWP64UPL0AD', 6),
(99, 'Palmer', 'Kennedy', 'Ulla', 'neque.sed@odio.edu', 'KJS23ZLZ6HF', 1),
(100, 'Rogers', 'Dean', 'Kaitlin', 'a.dui@famesacturpis.ca', 'PTK65ZYW1FA', 5),
(101, 'Burch', 'Zeph', 'April', 'ut.ipsum@velitPellentesque.com', 'UQV69IJR9ZL', 5),
(102, 'Washington', 'Ryan', 'Lenore', 'purus@Maecenasmi.ca', 'DKT17GDT3QY', 1),
(103, 'Ballard', 'Cade', 'Martha', 'nonummy@dui.com', 'HAU26JJA1LC', 1),
(104, 'Dickson', 'Wylie', 'Chastity', 'malesuada@mollisInteger.ca', 'XHP99SHX0RC', 9),
(105, 'Gordon', 'Shad', 'Hannah', 'ipsum@Duisa.net', 'ZXF34JOG4ST', 6),
(106, 'Moses', 'Harlan', 'Elizabeth', 'non@magnaPhasellus.org', 'AYU99MFM4VA', 10),
(107, 'Alvarez', 'Ciaran', 'Wynter', 'urna@ligulatortor.com', 'BRI34ZOG3JO', 7),
(108, 'Frederick', 'Fuller', 'Lee', 'lectus.pede@dictumeleifendnunc.net', 'EIL82GDW4CR', 10),
(109, 'Carter', 'Samson', 'Brenna', 'magnis.dis.parturient@Morbivehicula.net', 'ITM34MPM2IM', 5),
(110, 'Snider', 'Bevis', 'Hollee', 'ligula.eu@atnisiCum.co.uk', 'LUQ76QUA9EX', 7),
(111, 'Goodwin', 'Garth', 'Aphrodite', 'pede.Praesent.eu@duisemper.co.uk', 'FRQ94OSI4LM', 6),
(112, 'Anderson', 'Xanthus', 'Mona', 'sed@quis.ca', 'DPJ84YPE7FV', 10),
(113, 'Dalton', 'Ashton', 'Vera', 'dapibus@etcommodo.co.uk', 'GBT15JTS3XH', 14),
(114, 'Cohen', 'Chaney', 'Pearl', 'vestibulum.neque.sed@hendreritconsectetuercursus.edu', 'AKX68XFM9CY', 9),
(115, 'Payne', 'Cruz', 'Iona', 'orci@odiosemper.org', 'OVT92COD1ZW', 6),
(116, 'Erickson', 'Barry', 'Claire', 'luctus.sit.amet@molestie.edu', 'OGN56DRK6FB', 11),
(117, 'Calderon', 'Levi', 'Samantha', 'imperdiet@gravida.org', 'UOT78HQP6PT', 6),
(118, 'Griffith', 'Ryan', 'Chastity', 'faucibus.leo.in@estmollisnon.com', 'YDY75JGA4MM', 5),
(119, 'Carr', 'Lev', 'Brynne', 'Nulla.facilisi.Sed@Duis.com', 'UEB67ULW3ZT', 6),
(120, 'Powell', 'Walter', 'Paloma', 'libero.nec@est.edu', 'AVD69RMK4RP', 13),
(121, 'Austin', 'Herman', 'Rylee', 'sagittis.placerat@mipede.edu', 'AAM41TVC7DD', 9),
(122, 'Sherman', 'Alec', 'Teagan', 'sit@arcuetpede.co.uk', 'HAI60NNV9KC', 14),
(123, 'Rollins', 'Christian', 'Laurel', 'magnis@lacusNulla.com', 'WAS29FGR6FP', 6),
(124, 'Dale', 'Amery', 'Maxine', 'ante@temporest.edu', 'OKE78LVR6EU', 5),
(125, 'Lee', 'Cade', 'Freya', 'amet.diam.eu@ridiculus.ca', 'DDN30BFU2GR', 10),
(126, 'Lawrence', 'Kibo', 'Patricia', 'eget.mollis@Cumsociis.org', 'NMY45SAT7HQ', 12),
(127, 'Witt', 'Hamilton', 'Daphne', 'Quisque.imperdiet.erat@Sednec.com', 'OBR92JSG1KE', 10),
(128, 'Wilkerson', 'Zeus', 'Zia', 'Donec.egestas.Duis@Donec.ca', 'LVP58VJA4CX', 3),
(129, 'Boyer', 'Hammett', 'Donna', 'vel.faucibus@placerat.ca', 'ZDG41ZRV7UW', 9),
(130, 'Farrell', 'Ulric', 'Camilla', 'pellentesque.Sed.dictum@vitaedolorDonec.net', 'HPK30NMI2DC', 2),
(131, 'Hawkins', 'Hamilton', 'Rhonda', 'augue.scelerisque@duinec.com', 'LRM90PWU2GC', 6),
(132, 'Stevens', 'Wesley', 'Jordan', 'dui.Suspendisse@enimmi.co.uk', 'LRH59WXX5TO', 2),
(133, 'Walls', 'Tiger', 'Xantha', 'lacinia@sapien.co.uk', 'ZAS66IGK9UF', 12),
(134, 'Gates', 'Simon', 'Karen', 'erat.vitae@utmi.edu', 'NJJ21IYV5SR', 8),
(135, 'Quinn', 'Zeus', 'Lacey', 'Donec.sollicitudin.adipiscing@placeratorcilacus.org', 'ZWX17HMM3XQ', 11),
(136, 'Harvey', 'Timothy', 'Tatiana', 'risus.varius.orci@ipsumacmi.co.uk', 'SZA37SOQ2CU', 6),
(137, 'Herrera', 'Derek', 'Cassandra', 'a.feugiat@mollisduiin.com', 'LEO51IFW7ZQ', 4),
(138, 'Moon', 'Talon', 'Tana', 'urna.nec.luctus@consequatlectussit.co.uk', 'YJQ67IHL9JG', 13),
(139, 'Guthrie', 'Hyatt', 'Shelby', 'nascetur@consectetuer.ca', 'RTU19PAW4FE', 4),
(140, 'Elliott', 'Giacomo', 'Xena', 'lectus.pede@lectuspedeet.net', 'LAE51BLZ0QI', 6),
(141, 'Hughes', 'Arsenio', 'Joelle', 'dolor@quamdignissim.net', 'BLS69JSY9VU', 3),
(142, 'Hatfield', 'Hamish', 'Raya', 'purus.Maecenas@rhoncus.edu', 'STX73HIN5XJ', 4),
(143, 'Wright', 'Lance', 'Megan', 'risus.Donec@in.net', 'XQK57GNE2VP', 1),
(144, 'Blackwell', 'Justin', 'Indira', 'nonummy@loremsitamet.co.uk', 'FOF53POU7KS', 7),
(145, 'Rowe', 'Laith', 'Amy', 'semper.Nam.tempor@Pellentesque.ca', 'LCK76NAH0WV', 5),
(146, 'Sanford', 'Driscoll', 'Robin', 'amet.ornare@nullaCras.ca', 'SNP37VNM2WB', 5),
(147, 'Johnston', 'Abbot', 'Kristen', 'Ut.semper@nisi.net', 'ISY84FFL7OX', 8),
(148, 'Gould', 'Arden', 'Tallulah', 'faucibus.leo@tellusfaucibusleo.ca', 'FSA08KFM7JN', 15),
(149, 'Barron', 'Todd', 'Quemby', 'metus@quislectusNullam.co.uk', 'VZJ14DWJ7SH', 15),
(150, 'Cross', 'Wing', 'Lucy', 'aliquet@Nuncmauris.com', 'OXT70PYR4MF', 15),
(151, 'Mcdowell', 'Moses', 'Deborah', 'nec.imperdiet@ante.ca', 'YEH48VKR1BY', 7),
(152, 'Townsend', 'Gil', 'Montana', 'euismod@facilisisfacilisismagna.ca', 'EQP07NMI8RO', 3),
(153, 'Bowers', 'Caleb', 'Regan', 'faucibus.leo@egestashendreritneque.ca', 'YBI97RAW8UG', 14),
(154, 'Nixon', 'Donovan', 'Uma', 'sit.amet@quis.net', 'HMB89OFH2CV', 9),
(155, 'Pace', 'Jonas', 'Naida', 'pellentesque@tristiquealiquetPhasellus.net', 'LRR56HIP9DG', 5),
(156, 'Baxter', 'Mohammad', 'Deborah', 'arcu.Vestibulum@sit.co.uk', 'LXV23BWQ2UJ', 2),
(157, 'Mejia', 'Timon', 'Shaine', 'justo.eu.arcu@CurabiturdictumPhasellus.org', 'UWV79PKN9UY', 9),
(158, 'Randolph', 'Kermit', 'Martina', 'tortor@sempercursusInteger.co.uk', 'GIB41PXY8EW', 1),
(159, 'Arnold', 'Perry', 'Cheyenne', 'Quisque.tincidunt.pede@odio.com', 'MUY69ZTQ7CP', 12),
(160, 'Phelps', 'Nathan', 'Jayme', 'vitae.nibh@urna.edu', 'COD50LIX3JT', 8),
(161, 'Solis', 'Xavier', 'Joan', 'arcu.et@dolornonummyac.ca', 'VUV25CDQ5KI', 6),
(162, 'Olsen', 'Colorado', 'Jillian', 'morbi.tristique.senectus@fringillaporttitorvulputate.ca', 'CGQ61GUB7MK', 15),
(163, 'Estrada', 'Acton', 'Erica', 'pharetra.nibh.Aliquam@Proin.com', 'MHY87OND0ZV', 11),
(164, 'Mckinney', 'Caleb', 'Clio', 'enim.gravida@aclibero.com', 'HLK00GBB8RA', 4),
(165, 'Mcconnell', 'Denton', 'Simone', 'lectus.justo@maurisidsapien.co.uk', 'YNV58PNU5YE', 5),
(166, 'Grant', 'Keith', 'Idona', 'ornare.tortor@vestibulum.com', 'HZP89IWM5ZD', 8),
(167, 'Dominguez', 'Keefe', 'Robin', 'magna@ac.com', 'YGU99IXT5KW', 2),
(168, 'Marks', 'Conan', 'Xyla', 'non.justo.Proin@consectetuer.com', 'OOF91OZC0QA', 3),
(169, 'Shaffer', 'Tiger', 'Ima', 'felis.Nulla@massa.co.uk', 'QNI45MXM4BC', 11),
(170, 'Cash', 'Nero', 'Susan', 'Fusce.dolor@fringillaeuismodenim.co.uk', 'NJU61ZBS0AI', 13),
(171, 'Richardson', 'Kevin', 'Mira', 'nisi@sociisnatoque.org', 'HHA68DDW1AG', 6),
(172, 'Weaver', 'Raphael', 'Quemby', 'litora.torquent@dictum.co.uk', 'AOW31QAQ7DI', 11),
(173, 'Burton', 'Wayne', 'Ursula', 'Fusce.aliquam@tortorNunccommodo.ca', 'RPE83YFQ1GC', 15),
(174, 'Adams', 'Hashim', 'Rae', 'egestas@quamelementumat.edu', 'REC14LIE7KJ', 14),
(175, 'Dean', 'Joel', 'Shana', 'tortor.Integer.aliquam@auctornonfeugiat.co.uk', 'EKE53XOB2KF', 15),
(176, 'Raymond', 'Grady', 'Olympia', 'sociosqu@eratvolutpatNulla.edu', 'YRT92TXK1PW', 6),
(177, 'Strickland', 'Emmanuel', 'Kendall', 'turpis.egestas@Quisqueporttitor.org', 'BSS62VTZ2LI', 4),
(178, 'Ayers', 'Wesley', 'Maite', 'In.scelerisque.scelerisque@Loremipsumdolor.ca', 'OAA50XAI0AW', 2),
(179, 'Matthews', 'Vaughan', 'Leigh', 'ac.mattis.semper@molestie.edu', 'ONX40NOF4MT', 10),
(180, 'Nieves', 'Matthew', 'Madeline', 'orci@ridiculusmus.ca', 'NZO54VFG0SR', 15),
(181, 'Glover', 'Raphael', 'Amaya', 'diam.eu.dolor@vitae.ca', 'SQL21CCY3ML', 11),
(182, 'Trevino', 'Michael', 'Medge', 'sodales.at.velit@Aliquamadipiscinglobortis.co.uk', 'JSJ84LHG5VG', 13),
(183, 'Holt', 'Kamal', 'Cara', 'Nulla.eu@maurissagittisplacerat.org', 'PKM70OII8TZ', 5),
(184, 'Fleming', 'Burton', 'Nadine', 'non.leo.Vivamus@diamSeddiam.edu', 'MQM72XPQ9MA', 1),
(185, 'Hampton', 'Gray', 'Hayley', 'malesuada@ut.ca', 'LJZ91EKQ5HF', 7),
(186, 'Bender', 'Warren', 'Cailin', 'lobortis@egettinciduntdui.ca', 'TGJ78WYW2OD', 10),
(187, 'Bridges', 'John', 'Ursa', 'cursus.in.hendrerit@augueporttitor.edu', 'OIT18AFN7YX', 13),
(188, 'Harris', 'Kenyon', 'Amanda', 'nulla@Uttinciduntorci.net', 'BNC27BRD0EQ', 2),
(189, 'Mcconnell', 'Hall', 'Inez', 'quis.accumsan@SuspendisseeleifendCras.co.uk', 'BXB64HHF1HY', 5),
(190, 'Ayala', 'Byron', 'Lilah', 'egestas@quis.net', 'PQY61FIK6UZ', 9),
(191, 'Hurst', 'Tobias', 'Hanna', 'nulla.Cras.eu@Suspendisseac.ca', 'EQH92DYV7KY', 7),
(192, 'Knox', 'Francis', 'Indira', 'ac@porttitortellusnon.org', 'PGB91WFY8PS', 5),
(193, 'Harrington', 'Ian', 'Catherine', 'eu@in.co.uk', 'YII70AZL3IK', 9),
(194, 'Cruz', 'Nicholas', 'Phoebe', 'elementum.purus.accumsan@pellentesque.org', 'CBM23NJG3AF', 5),
(195, 'Rosario', 'Mark', 'Hanna', 'vitae.risus@justo.edu', 'AGI50SBK3VX', 10),
(196, 'Walters', 'Joseph', 'Tamekah', 'Nulla.dignissim@velpede.com', 'BLQ49XUX2MZ', 15),
(197, 'Ellison', 'Hamish', 'Roary', 'lectus@molestiearcu.edu', 'LUR52LPA9QQ', 13),
(198, 'Cardenas', 'Calvin', 'Remedios', 'magna@lectusjustoeu.net', 'HOZ39MKO7UK', 9),
(199, 'Rivera', 'Felix', 'Hillary', 'purus@laciniaorciconsectetuer.ca', 'LVH35CCO0II', 3),
(200, 'Bright', 'Dolan', 'Donna', 'libero.Integer@justoeu.org', 'KDA77IVK8EG', 6);

-- --------------------------------------------------------

--
-- Table structure for table `teaching`
--

CREATE TABLE `teaching` (
  `class_id` int(11) NOT NULL,
  `professor_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `teaching`
--

INSERT INTO `teaching` (`class_id`, `professor_id`, `course_id`) VALUES
(1, 1, 12),
(2, 1, 53),
(10, 1, 7),
(11, 1, 11),
(4, 2, 8),
(5, 2, 29),
(11, 2, 13),
(3, 3, 43),
(7, 3, 42),
(12, 3, 15),
(1, 4, 63),
(6, 4, 8),
(6, 4, 52),
(11, 4, 65),
(12, 5, 41),
(2, 7, 67),
(6, 7, 58),
(9, 7, 61),
(12, 7, 78),
(14, 7, 4),
(1, 8, 49),
(2, 8, 35),
(5, 8, 18),
(6, 8, 70),
(10, 8, 74),
(12, 8, 53),
(1, 9, 36),
(5, 9, 74),
(7, 9, 71),
(9, 9, 13),
(10, 9, 75),
(13, 9, 74),
(15, 10, 32),
(2, 11, 52),
(15, 11, 58),
(9, 12, 24),
(11, 12, 12),
(2, 13, 42),
(6, 13, 69),
(9, 13, 20),
(13, 13, 56),
(3, 14, 17),
(11, 14, 42),
(12, 14, 60),
(13, 14, 79),
(5, 15, 5),
(13, 15, 26),
(3, 16, 25),
(9, 16, 12),
(10, 16, 11),
(12, 16, 23),
(5, 17, 6),
(3, 18, 38),
(5, 18, 55),
(8, 18, 12),
(10, 18, 56),
(13, 18, 35),
(15, 18, 79),
(2, 19, 21),
(3, 19, 17),
(9, 19, 37),
(11, 19, 1),
(1, 20, 47),
(2, 20, 40),
(6, 20, 62),
(10, 20, 11),
(2, 21, 49),
(10, 21, 64),
(15, 21, 17),
(2, 22, 70),
(4, 22, 44),
(8, 22, 15),
(11, 22, 53),
(12, 22, 69),
(13, 22, 28),
(1, 23, 60),
(3, 23, 6),
(9, 23, 57),
(12, 23, 12),
(14, 23, 57),
(4, 24, 70),
(8, 24, 21),
(8, 24, 69),
(9, 24, 5),
(2, 25, 65),
(7, 25, 78),
(8, 25, 2),
(10, 25, 35),
(15, 25, 68),
(1, 26, 10),
(4, 26, 61),
(7, 26, 14),
(8, 26, 11),
(14, 26, 38),
(3, 27, 64),
(6, 27, 24),
(15, 27, 2),
(1, 28, 25),
(3, 28, 48),
(6, 28, 42),
(11, 28, 13),
(11, 28, 25),
(12, 28, 61),
(11, 29, 65),
(11, 29, 73),
(3, 30, 34),
(5, 30, 40),
(14, 30, 30),
(1, 31, 34),
(5, 31, 48),
(15, 31, 36),
(6, 32, 70),
(12, 32, 22),
(15, 32, 32),
(2, 33, 7),
(3, 33, 68),
(6, 33, 27),
(6, 33, 33),
(6, 33, 76),
(14, 33, 56),
(1, 34, 33),
(5, 34, 38),
(8, 34, 9),
(10, 34, 18),
(14, 34, 5),
(2, 35, 69),
(6, 35, 63),
(9, 35, 46),
(11, 35, 48),
(2, 36, 49),
(4, 36, 55),
(6, 36, 32),
(8, 36, 41),
(10, 36, 18),
(2, 37, 66),
(7, 37, 22),
(7, 37, 30),
(9, 37, 64),
(1, 39, 44),
(6, 39, 60),
(11, 39, 24),
(13, 39, 12),
(5, 40, 3),
(6, 40, 29),
(8, 40, 18),
(8, 40, 62),
(13, 41, 2),
(15, 41, 31),
(3, 42, 2),
(11, 43, 14),
(12, 43, 8),
(4, 44, 18),
(6, 44, 25),
(7, 44, 62),
(11, 44, 70),
(14, 44, 25),
(15, 44, 72),
(3, 45, 75),
(5, 45, 52),
(6, 45, 79),
(10, 45, 29),
(10, 45, 72),
(11, 45, 68),
(12, 45, 65),
(13, 45, 36),
(1, 46, 47),
(2, 46, 29),
(8, 46, 30),
(14, 46, 46),
(2, 47, 2),
(5, 47, 35),
(7, 47, 22),
(13, 47, 38),
(14, 47, 53),
(1, 48, 16),
(3, 48, 61),
(8, 49, 12),
(12, 49, 70),
(15, 49, 18),
(2, 50, 46),
(8, 50, 71),
(13, 50, 76),
(15, 50, 70),
(1, 51, 52),
(4, 51, 57),
(5, 51, 58),
(12, 51, 10),
(1, 52, 46),
(14, 52, 5),
(15, 52, 26),
(2, 53, 7),
(7, 53, 10),
(8, 53, 10),
(10, 53, 23),
(12, 53, 65),
(13, 53, 78),
(15, 53, 3),
(4, 54, 32),
(5, 54, 28),
(9, 54, 39);

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
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`class_id`,`professor_id`,`course_id`),
  ADD KEY `teaching_fk_proffessor_id` (`professor_id`),
  ADD KEY `teaching_fk_course_id` (`course_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

--
-- Constraints for dumped tables
--

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
  ADD CONSTRAINT `teaching_fk_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `teaching_fk_proffessor_id` FOREIGN KEY (`professor_id`) REFERENCES `professors` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
