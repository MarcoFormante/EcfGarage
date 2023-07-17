-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Lug 17, 2023 alle 23:14
-- Versione del server: 10.4.27-MariaDB
-- Versione PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `garage`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `cars`
--

CREATE TABLE `cars` (
  `id` int(11) NOT NULL,
  `make` varchar(30) NOT NULL,
  `model` varchar(50) NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `year` int(4) NOT NULL,
  `km` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `offer` int(11) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `cars`
--

INSERT INTO `cars` (`id`, `make`, `model`, `thumbnail`, `year`, `km`, `price`, `offer`, `created_at`) VALUES
(151, 'Fiat', 'Punto', '64a1c495d1e7264a1c495d1e74.jpg', 2020, 200000, 2088, 0, '2023-07-02 20:40:21'),
(233, 'dsdsasdasdklasdjaskdhkjaawdiha', 'Fiat77asdkasdj', '64a9d7b88169464a9d7b881698.webp', 454, 45, 454, 200, '2023-07-04 17:40:46'),
(234, 'kjjkasdkjashdasdkjh', 'kljkl', '64a43e6749d5164a43e6749d52.jpg', 4, 2349, 45, 200, '2023-07-04 17:44:39'),
(235, 'oiosadmnasdjh', 'klj', '64a43ee55200f64a43ee552010.jpg', 4787823, 234234, 454, 0, '2023-07-04 17:46:45'),
(236, 'Fiat', 'asd', '64a4474ac348964a4474ac348b.jpg', 4, 324234, 45, 0, '2023-07-04 18:22:34'),
(237, 'koi', 'df', '64a4480f2e71f64a4480f2e721.jpg', 324, 44, 45, 0, '2023-07-04 18:25:51'),
(239, 'jjkj', '45', '64a448d19d2a364a448d19d2a5.jpg', 45, 45, 45, 0, '2023-07-04 18:29:05'),
(240, 'asdasd', 'asdasd', '64a44d122899564a44d1228996.jpg', 5454, 5454, 4, 121, '2023-07-04 18:47:14'),
(241, 'jk', '45', '64a44e187d92d64a44e187d92f.jpg', 45, 45, 45, 0, '2023-07-04 18:51:36'),
(242, 'mkj', 'jkj', '64a44e5e5121964a44e5e5121c.jpg', 4, 44, 4, 0, '2023-07-04 18:52:46'),
(244, 'mkj', 'jkj', '64a44eafd377b64a44eafd377d.jpg', 4, 44, 4, 0, '2023-07-04 18:54:07'),
(245, 'asd', 'klj', '64a54b2c0505364a54b2c05056.jpg', 56, 65656, 56, 0, '2023-07-05 12:51:24'),
(246, 'jhkjhjkh', 'bvhb', '64a5bb77421a664a5bb77421a8.jpg', 454, 454, 545, 0, '2023-07-05 20:50:31'),
(250, 'jhkjhjkh', 'bvhb', '64a5bc1251efc64a5bc1251eff.jpg', 454, 454, 545, 0, '2023-07-05 20:53:06'),
(252, 'asldjkas', 'asdkj', '64a5bc7177a1f64a5bc7177a21.jpg', 454, 454, 545, 0, '2023-07-05 20:54:41'),
(254, 'asd', 'asd', '64a5bd036161264a5bd0361614.jpg', 454, 454, 454, 0, '2023-07-05 20:57:07'),
(255, 'jh', '45', '64a5bd5cdf4fd64a5bd5cdf4fe.jpg', 45, 45, 45, 0, '2023-07-05 20:58:36'),
(257, 'jh', '45', '64a5bddabdaf064a5bddabdaf1.jpg', 45, 45, 45, 0, '2023-07-05 21:00:42'),
(268, 'asdkjsakd', 'jkjhkhj', '64a6f2eb844d064a6f2eb844d2.jpg', 15151, 1515, 5545, 0, '2023-07-06 18:59:23'),
(269, 'asdh', '44asdkjh', '64a6f442b9d1664a6f442b9d18.jpg', 151515, 15151, 141515, 0, '2023-07-06 19:05:06'),
(270, 'sadnkb', 'nkjnkj', '64a700d4564d664a700d4564d8.jpg', 151, 151, 15, 0, '2023-07-06 19:09:17'),
(271, 'asdkjsahdkj', '45', '64a6f844e593264a6f844e5933.jpg', 44, 44, 44, 0, '2023-07-06 19:18:25'),
(272, 'asdjash', 'jhjkh', '64a8956039e2c64a8956039e2e.webp', 45, 454, 545, 0, '2023-07-07 22:40:44'),
(273, 'jk', 'kj', '[object Promise]', 54, 45, 545, 0, '2023-07-07 22:43:11'),
(274, 'asdklasjd', 'kjkl', '[object Promise]', 454, 45, 545, 0, '2023-07-07 23:54:31'),
(275, 'snzdjn', '45', '64a896061ffe664a896061ffe8.webp', 45, 45, 45, 0, '2023-07-08 00:47:34'),
(276, 'asdkjh', 'jhjk', '64a906a69255864a906a69255a.webp', 47, 45, 4, 0, '2023-07-08 08:48:06'),
(277, 'klj', '45', '64a907f63714664a907f637148.webp', 45, 45, 455, 0, '2023-07-08 08:53:42'),
(278, 'jhgjhg', 'iuhh', '4454asd.webp', 2058, 10000, 4544, 100, '2023-07-11 20:45:51'),
(279, 'jhgjhg', 'iuhh', '4454asd.webp', 2058, 10000, 4544, 100, '2023-07-11 20:45:53'),
(280, 'jhgjhg', 'iuhh', '4454asd.webp', 2058, 10000, 4544, 100, '2023-07-11 20:45:54'),
(281, 'jhgjhg', 'iuhh', '4454asd.webp', 2058, 10000, 4544, 100, '2023-07-11 20:45:54'),
(282, 'jhgjhg', 'iuhh', '4454asd.webp', 2058, 10000, 4544, 100, '2023-07-11 20:45:54'),
(283, 'jhgjhg', 'iuhh', '4454asd.webp', 2058, 10000, 4544, 100, '2023-07-11 20:45:54'),
(284, 'jhgjhg', 'iuhh', '4454asd.webp', 2058, 10000, 4544, 100, '2023-07-11 20:45:54'),
(285, 'jhgjhg', 'iuhh', '4454asd.webp', 2058, 10000, 4544, 100, '2023-07-11 20:45:54'),
(286, 'jhgjhg', 'iuhh', '4454asd.webp', 2058, 10000, 4544, 100, '2023-07-11 20:45:54'),
(287, 'asd', 'jhh', '64b1d62e5226e64b1d62e52270.webp', 4, 545, 54, 0, '2023-07-15 01:11:42'),
(288, 'asdjadh\\\\', 'hkjh', '64b1d927ca01c64b1d927ca01e.webp', 4, 4, 74, 0, '2023-07-15 01:24:23'),
(290, 'asdjadh\\\\', 'hkjh', '64b1d9c14b41564b1d9c14b417.webp', 4, 4, 74, 0, '2023-07-15 01:26:57'),
(292, 'asdkj', 'jh', '64b1da2cc47e264b1da2cc47e3.webp', 4, 47, 444, 0, '2023-07-15 01:28:44'),
(293, 'kjkj', 'njk', '64b1dc815477664b1dc8154778.webp', 45, 54, 54, 0, '2023-07-15 01:38:41'),
(294, 'asdjkh', 'jhkj', '64b4620fd251f64b4620fd2520.webp', 4, 45, 54, 149, '2023-07-16 23:33:03'),
(295, 'asdjkn', 'jnjk', '64b462d120e0564b462d120e07.webp', 89, 8, 98, 0, '2023-07-16 23:36:17'),
(296, 'klkj', 'jkh', '64b464034d3ff64b464034d401.webp', 8797, 7897, 897, 89, '2023-07-16 23:41:23'),
(297, 'hghg', 'hjhkjh', '64b4706b96bc064b4706b96bc2.webp', 6545, 786, 786, 0, '2023-07-17 00:34:19'),
(298, 'ghhg', 'hg', '64b473c99bbd764b473c99bbd9.webp', 78, 78, 78, 0, '2023-07-17 00:48:41'),
(300, 'ghhg', 'hg', '64b473ef97c6b64b473ef97c6d.webp', 78, 78, 78, 0, '2023-07-17 00:49:19'),
(301, 'sdjkh', 'hjk', '64b47426114be64b47426114bf.webp', 998, 89, 8, 0, '2023-07-17 00:50:14'),
(303, 'sdjkh', 'hjk', '64b4745bb072764b4745bb0729.webp', 998, 89, 8, 0, '2023-07-17 00:51:07'),
(304, 'jkjh', 'hjk', '64b474af267fa64b474af267fb.webp', 67, 678, 78, 0, '2023-07-17 00:52:31'),
(311, 'jkj', 'hg', '64b47533e525964b47533e525b.webp', 798, 789, 87, 0, '2023-07-17 00:54:43'),
(312, 'asd', 'jkh', '64b47562a19f764b47562a19fb.webp', 898, 89, 99, 0, '2023-07-17 00:55:30');

-- --------------------------------------------------------

--
-- Struttura della tabella `car_details`
--

CREATE TABLE `car_details` (
  `car_id` int(11) NOT NULL,
  `vo_number` varchar(11) NOT NULL,
  `gearbox` varchar(20) NOT NULL,
  `din_power` varchar(10) NOT NULL,
  `fiscal_power` varchar(10) NOT NULL,
  `color` varchar(20) NOT NULL,
  `doors` int(2) NOT NULL,
  `seats` int(3) NOT NULL,
  `energy` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `car_details`
--

INSERT INTO `car_details` (`car_id`, `vo_number`, `gearbox`, `din_power`, `fiscal_power`, `color`, `doors`, `seats`, `energy`) VALUES
(233, '556554445', 'Manuelle', '25', '2', '5454', 5, 454, 'Essence'),
(234, '45454545', 'Manuelle', '45', '45', '45', 45, 45, 'Essence'),
(235, '565456464', 'Manuelle', '545', '45', '54', 544, 54, 'Essence'),
(236, '2221112', 'Manuelle', '45', '44', '45', 5, 545, 'Gazole'),
(237, '45454577', 'Manuelle', '44', '44', '44', 455, 44, 'Gazole'),
(239, '454996', 'Automatique', '45', '-245', '45', 45, 45, 'Essence'),
(240, '545477744', 'Manuelle', '454', '5454', '4545', 55, 545, 'Essence'),
(241, '45454444747', 'Manuelle', '45', '45', '45', 8, 45, 'Essence'),
(242, '4554', 'Manuelle', '45', '45', '45', 45, 45, 'Essence'),
(244, '455420', 'Manuelle', '45', '45', '45', 45, 45, 'Essence'),
(245, '4544541111', 'Manuelle', '656', '565', '565656', 56, 5656, 'Essence'),
(246, '45656545454', 'Manuelle', '545', '4554', '454', 565, 454, 'Essence'),
(250, '-2', 'Manuelle', '545', '4554', '454', 565, 454, 'Essence'),
(252, '45489652165', 'Manuelle', '454', '454', '454', 454, 4545, 'Électrique'),
(254, '565', 'Manuelle', '445', '45', '454', 565, 454, 'Essence'),
(255, '742', 'Manuelle', '54', '54', '4', 56, 45, 'Essence'),
(257, '74296', 'Manuelle', '54', '54', '4', 56, 45, 'Essence'),
(268, '40', 'Manuelle', '45', '45ch', '151515', 456540, 1515, 'Essence'),
(269, '155115', 'Manuelle', '515151', '515151', '15151', 5151, 1515, 'Essence'),
(270, '51515656265', 'Manuelle', '1515', '151', '5151', 515, 151, 'Essence'),
(271, '1151161', 'Manuelle', '44', '44', '44', 5526, 44, 'Essence'),
(272, '5454', 'Manuelle', '454', '454', '5454', 54, 5454, 'Essence'),
(273, '45', 'Manuelle', '45', '45', '45', 54, 45, 'Essence'),
(274, '5', 'Manuelle', '4545', '4545', '454', 415, 4545, 'Essence'),
(275, '415', 'Manuelle', '45', '45', '45', 545, 45, 'Essence'),
(276, '454', 'Manuelle', '45', '45', '45', 45, 45, 'Essence'),
(277, '23', 'Manuelle', '45', '45', '45', 2, 45, 'Essence'),
(287, '4545111', 'Manuelle', '45', '45', '45', 4, 45, 'Essence'),
(288, '454898562', 'Manuelle', '4', '44', '4', 565, 4, 'Essence'),
(290, '45489856', 'Manuelle', '4', '44', '4', 565, 4, 'Gazole'),
(292, '45423332', 'Manuelle', '4', '4', '4', 45, 4, 'Gazole'),
(293, '45888585', 'Manuelle', '5', '5', '5', 45, 45, 'Essence'),
(294, '5465685453', 'Automatique', '5', '45', '4', 56, 4, 'Essence'),
(295, '45656323', 'Automatique', '89', '9', '89', -15, 98, 'Électrique'),
(296, '899', 'Manuelle', '78897', '7897', '7897', 90, 7897, 'Essence'),
(297, '6984357758', 'Manuelle', '657', '786', '76', 5, 786, 'Essence'),
(298, '124576', 'Manuelle', '78', '78', '78', 5, 7, 'Essence'),
(300, '1245766', 'Manuelle', '78', '78', '78', 5, 7, 'Essence'),
(301, '45457777', 'Manuelle', '98', '9', '98', 45, 89, 'Essence'),
(303, '454577733', 'Manuelle', '98', '9', '98', 45, 89, 'Essence'),
(304, '758654444', 'Manuelle', '687', '687', '678', 565, 87, 'Gazole'),
(311, '50439984', 'Manuelle', '789', '789', '789', 5, 798, 'Essence'),
(312, '4455771141', 'Manuelle', '89', '89', '89', 5, 89, 'Essence');

-- --------------------------------------------------------

--
-- Struttura della tabella `car_equipments`
--

CREATE TABLE `car_equipments` (
  `car_id` int(11) NOT NULL,
  `equip_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `car_equipments`
--

INSERT INTO `car_equipments` (`car_id`, `equip_id`) VALUES
(234, 1),
(235, 1),
(240, 9),
(245, 1),
(246, 21),
(250, 21),
(252, 1),
(254, 15),
(268, 3),
(269, 21),
(241, 5),
(241, 25),
(233, 6),
(233, 30),
(233, 9),
(233, 14),
(233, 29),
(233, 17),
(236, 8),
(288, 19),
(290, 19),
(292, 50),
(293, 7),
(233, 21),
(233, 25),
(311, 2),
(311, 4);

-- --------------------------------------------------------

--
-- Struttura della tabella `car_images`
--

CREATE TABLE `car_images` (
  `id` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  `car_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `car_images`
--

INSERT INTO `car_images` (`id`, `path`, `car_id`) VALUES
(80, '64a43d7e3dd5a64a43d7e3dd5b.jpg', 233),
(83, '64a43e6749d5464a43e6749d55.jpg', 234),
(84, '64a43e6749d5664a43e6749d57.jpg', 234),
(85, '64a43e6749d5864a43e6749d59.jpg', 234),
(86, '64a43ee55201264a43ee552013.jpg', 235),
(87, '64a43ee55201464a43ee552015.jpg', 235),
(88, '64a43ee55201664a43ee552017.jpg', 235),
(89, '64a4474ac348f64a4474ac3490.jpg', 236),
(91, '64a448d19d2a664a448d19d2a7.jpg', 239),
(92, '64a448d19d2a864a448d19d2a9.jpg', 239),
(93, '64a448d19d2aa64a448d19d2ab.jpg', 239),
(94, '64a44d122899964a44d122899a.jpg', 240),
(95, '64a44e187d94364a44e187d944.jpg', 241),
(96, '64a44e5e5121f64a44e5e51220.jpg', 242),
(97, '64a44e5e5122264a44e5e51223.jpg', 242),
(98, '64a44e5e5122464a44e5e51225.jpg', 242),
(99, '64a44eafd377f64a44eafd3780.jpg', 244),
(100, '64a44eafd378164a44eafd3782.jpg', 244),
(101, '64a44eafd378364a44eafd3784.jpg', 244),
(102, '64a54b2c0505964a54b2c0505a.jpg', 245),
(103, '64a54b2c0505b64a54b2c0505c.jpg', 245),
(104, '64a54b2c0505d64a54b2c0505e.jpg', 245),
(105, '25664a5bb77430cf.jpg', 246),
(106, '9564a5bb77431c7.jpg', 246),
(107, '105964a5bb7743252.jpg', 246),
(108, '85564a5bc12520d9.jpg', 250),
(109, '29164a5bc12521e8.jpg', 250),
(110, '89964a5bc125231b.jpg', 250),
(113, '93064a5bc7177c13.jpg', 252),
(114, '64a5bd036161654064a5bd036161f.jpg', 254),
(115, '64a5bd5cdf50023464a5bd5cdf50b.jpg', 255),
(116, '64a5bddabdaf339664a5bddabdaf6.jpg', 257),
(142, '64a6f2eb844d529264a6f2eb84d10.jpg', 268),
(143, '64a6f2eb84d1612064a6f2eb84d18.jpg', 268),
(144, '64a6f2eb84d1982864a6f2eb84d1a.jpg', 268),
(145, '64a6f442b9d2c59664a6f442b9d32.jpg', 269),
(146, '64a6f53dc389085664a6f53dc38a6.jpg', 270),
(147, '64a6f761239c377364a6f761239d8.jpg', 271),
(152, '64a878df1425665564a878df142b7.jpg', 273),
(155, '64a88997df10263764a88997df838.jpg', 274),
(156, '64a896061ffea28664a8960620025.webp', 275),
(157, '64a906a69605063164a906a696702.webp', 276),
(158, '64a907f63769697064a907f6376a5.webp', 277),
(161, '64aef028e1c5093064aef028e1c51.webp', 233),
(162, '64aef08b5d47898464aef08b5d48a.webp', 233),
(163, '64aef08b5d73227764aef08b5d734.webp', 233),
(164, '64aef08b5d85984764aef08b5d85b.webp', 233),
(165, '64aef09a7b85625264aef09a7b860.webp', 233),
(167, '64aef0e0772185664aef0e0773c7.webp', 233),
(169, '64aef0eb9bff572964aef0eb9bff9.webp', 233),
(170, '64aef0f1b7b029864aef0f1b7b0a.webp', 233),
(171, '64aef1036290918464aef10362910.webp', 233),
(172, '64aef10cbd29857464aef10cbd29d.webp', 233),
(173, '64aef127f12e374464aef127f12ee.webp', 233),
(174, '64aef1300f3fc52064aef1300f407.webp', 233),
(176, '64aef13ede82a22564aef13ede82f.webp', 233),
(185, '64aef233b95b252764aef233b95b9.webp', 234),
(186, '64aef241cfa1f31464aef241cfa30.webp', 234),
(187, '64aef26f109a785764aef26f109ae.webp', 234),
(189, '64aef28cdf07478064aef28cdf085.webp', 234),
(192, '64aef2da8881348064aef2da8881e.webp', 235),
(193, '64aef2da889bb46664aef2da889bd.webp', 235),
(194, '64aef3437248e7564aef343724ba.webp', 235),
(195, '64aef34c6a22793164aef34c6a371.webp', 235),
(196, '64aef3584740233764aef35847413.webp', 235),
(197, '64aef37704bcf88664aef37704bdf.webp', 235),
(198, '64aef3832c9ec94464aef3832c9f8.webp', 235),
(209, '64aef8855efbb79164aef8855eff7.webp', 237),
(210, '64aef89fdb81923364aef89fdb839.webp', 237),
(211, '64aef8ae1712e36064aef8ae17136.webp', 237),
(212, '64aef8b74da9e27564aef8b74daa3.webp', 237),
(213, '64aef8bbd430781264aef8bbd430b.webp', 237),
(214, '64aef8bbd4c2840564aef8bbd4c36.webp', 237),
(215, '64aefa0dc939b81864aefa0dc93c3.webp', 237),
(216, '64aefb41db1f417664aefb41db66a.webp', 237),
(217, '64aefc563c2f682164aefc563ccdb.webp', 239),
(218, '64aefc563d07185064aefc563d07c.webp', 239),
(219, '64aefc69de2e624664aefc69de2ef.webp', 239),
(220, '64aefc69de51461964aefc69de517.webp', 239),
(221, '64aefcdeac5fa33364aefcdeac612.webp', 239),
(226, '64b1d62e5287011264b1d62e528a5.webp', 287),
(227, '64b1d927ca2d748864b1d927ca2de.webp', 288),
(229, '64b1da2cc49e542764b1da2cc49ed.webp', 292),
(230, '64b1dc8154a2916664b1dc8154a53.webp', 293),
(231, '64b1de7df1b4997864b1de7df1b4d.webp', 290),
(232, '64b4620fe7bb836164b4620fe8054.webp', 294),
(233, '64b4620fe828126264b4620fe8283.webp', 294),
(234, '64b4620fe843356264b4620fe8434.webp', 294),
(235, '64b462d1210c786964b462d1210d0.webp', 295),
(236, '64b464034d95d16164b464034d964.webp', 296),
(237, '64b4706b96ef854664b4706b96f23.webp', 297),
(238, '64b473c99be8a19764b473c99be90.webp', 298),
(239, '64b473c99c00e54964b473c99c010.webp', 298),
(240, '64b473ef97e6d53664b473ef97e73.webp', 300),
(241, '64b473ef9800659264b473ef98008.webp', 300),
(242, '64b474261169568464b4742611698.webp', 301),
(243, '64b474261184521364b4742611847.webp', 301),
(244, '64b4745bb096b69464b4745bb0977.webp', 303),
(245, '64b4745bb0b1919264b4745bb0b1b.webp', 303),
(246, '64b474af269d614664b474af269da.webp', 304),
(247, '64b474af26b9877664b474af26b9a.webp', 304),
(248, '64b47533e543321864b47533e5436.webp', 311),
(249, '64b47562a231462164b47562a231b.webp', 312);

-- --------------------------------------------------------

--
-- Struttura della tabella `equipments`
--

CREATE TABLE `equipments` (
  `id` int(4) NOT NULL,
  `equipment` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `equipments`
--

INSERT INTO `equipments` (`id`, `equipment`) VALUES
(5, 'ABS'),
(6, 'Accoudoir central AV'),
(7, 'AFIL'),
(8, 'Aide au démarrage en côte'),
(9, 'Airbag conducteur'),
(10, 'Airbag passager'),
(11, 'Airbags latéraux AV et AR'),
(12, 'Airbags rideaux AV et AR'),
(13, 'Antidémarrage électronique'),
(14, 'Appui-tête conducteur réglable hauteur'),
(15, 'Appui-tête passager réglable en hauteur'),
(34, 'asd'),
(33, 'asdasa'),
(29, 'asdasd'),
(16, 'Bacs de portes avant'),
(17, 'Banquette 60/40'),
(18, 'Boite à gants fermée'),
(19, 'Borne Wi-Fi'),
(20, 'Boucliers AV et AR couleur caisse'),
(2, 'Caméra de recul'),
(21, 'Capteur de luminosité'),
(22, 'Capteur de pluie'),
(23, 'Clim automatique bi-zones'),
(24, 'Commandes vocales'),
(4, 'Haut parleurs'),
(31, 'j'),
(30, 'jkj'),
(36, 'mmaksmk'),
(46, 'mmaksmkasd'),
(48, 'mmaksmkasdasd'),
(51, 'mmaksmkasdasdsaasdd'),
(50, 'mmaksmkasdasdsad'),
(3, 'Pack B&O'),
(52, 'sad3'),
(53, 'test'),
(1, 'Vitres arrière surteintées'),
(25, 'Vitres avant électriques'),
(26, 'Volant cuir'),
(27, 'Volant multifonction'),
(28, 'Volant sport');

-- --------------------------------------------------------

--
-- Struttura della tabella `opening_times`
--

CREATE TABLE `opening_times` (
  `id` int(1) NOT NULL,
  `day_start_am` varchar(5) NOT NULL,
  `day_end_am` varchar(5) DEFAULT NULL,
  `day_start_pm` varchar(5) DEFAULT NULL,
  `day_end_pm` varchar(5) NOT NULL,
  `close` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `opening_times`
--

INSERT INTO `opening_times` (`id`, `day_start_am`, `day_end_am`, `day_start_pm`, `day_end_pm`, `close`) VALUES
(0, '09:30', 'HC', 'HC', '19:00', 1),
(1, '09:30', 'HC', 'HC', '19:00', 1),
(2, '09:30', 'HC', 'HC', '19:00', 1),
(3, '09:30', 'HC', 'HC', '01:00', 1),
(4, '09:30', 'HC', 'HC', '19:00', 1),
(5, '09:30', 'HC', 'HC', '19:00', 1),
(6, '11:30', 'HC', 'HC', '19:00', 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `message` text NOT NULL,
  `is_validate` tinyint(1) NOT NULL DEFAULT 0,
  `review` int(5) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `reviews`
--

INSERT INTO `reviews` (`id`, `name`, `message`, `is_validate`, `review`) VALUES
(1, 'teasdjk askjdklaj ', 'asjkdhajskdhjkhas ajsdkjashdkjhas dhaskjdhaksjhdj ashdjakshdjkhsajkdhajshdjkhaskdhaskjdhasjhdjaskhdjkashjkdhjakshdahdhajskhd hasjkdhasjkdh ashdjkashdjkashdjkashdaskj dhasjkdaskdhjakshdjkashd ahdjsahdkjashdkjashdkjahd ashdjkasdhaskdjhaskdjas dhakjasdasdsaa', 1, 5),
(2, '23472398hjkasdkahs', 'askdjaksdh', 0, 3),
(3, 'asdkjh', 'samdjaskljd', 1, 2),
(4, 'askjdhakjsdh834798', 'askldjlkasd', 1, 5),
(5, 'aslkdjalkdj38247ad', 'aslkdjliasjd', 0, 5),
(6, 'aslkdjaskldj347892', 'asjdjhjkashdkjhasd', 0, 5),
(7, 'salkdjalksjd328479', 'sakldjkljalksdj', 0, 5),
(8, 'asmdnaskj38974', 'askldjalk234', 0, 3),
(9, 'askldjakse329847', 'sakldjalksjd39824', 0, 4),
(10, 'asdklajlskdjklajkl', '32342747289njndknskdlkaskdakdoweijcsdjsiljcoisjdcn82372894789327r89mcjsfdkldsmfasldkjklasjkdljaskljdljaskldjaskljdkajjsjdkljaljljskldjkljlakjsd klasjdkljkajskljdkljkljaklsdjkjkljasljdkljkljaklsjdkljljaksljdkljklajskldjljklajskldj aklsdjklasjdkljaskldjkkj ', 0, 5),
(11, 'm', 'asdjknh', 0, 1),
(12, 'sjkdashkdhashd', 'ajsdhkjas', 0, 1),
(13, 'asd', 'asd', 0, 1),
(14, 'asdm', 'khkj', 1, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `roles`
--

CREATE TABLE `roles` (
  `id` int(1) NOT NULL,
  `role` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `roles`
--

INSERT INTO `roles` (`id`, `role`) VALUES
(0, 'admin'),
(1, 'employee');

-- --------------------------------------------------------

--
-- Struttura della tabella `services`
--

CREATE TABLE `services` (
  `id` int(4) NOT NULL,
  `service` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `services`
--

INSERT INTO `services` (`id`, `service`) VALUES
(48, 'Rèparation du système d’allumage'),
(49, 'Vérification et remplacement des joints'),
(50, 'Changement d’huile et de filtres'),
(51, 'Réparation du système de suspension'),
(52, 'Réparation du système d’alimentation'),
(53, 'Remplacement du système d’èclairage extérieur');

-- --------------------------------------------------------

--
-- Struttura della tabella `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(60) NOT NULL,
  `password` char(60) NOT NULL,
  `role_id` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `role_id`) VALUES
(1, 'MIchela.Foreign@gmail.com', '$2y$10$8eof1wsi74UV8pgKlYl4OOfXJx7U/erK5CH.oGiBsUO1u4VAuPy9S', 1),
(17, 'aawe@gmail.com', '$2y$10$i3aA5YfdIVkEFhMwiE7Mv.BOrI8QbBKPGbxUpjmkbmUl9eQ6FQDC6', 1),
(18, 'aaswe@gmail.com', '$2y$10$/ptA6W8TQgba0ZYX6hMc4eFJVJUeMVn8Wm6fNKy0xsvDua07unQle', 1),
(20, 'sadsj@ksad.com', '$2y$10$AfKG0b7TMNdOzydZdq939evU/EuEr5gA.HAqlT7mQQ6SIdLvuKxa6', 1),
(22, 'testEmp@gmail.com', '$2y$10$jXnNIMQYkMvCDENyg.MOGuNKVUGtfBUN4iLIXJqLztNw91kvzQf/C', 1),
(23, 'sdaj@asd.com', '$2y$10$Asm048DhWyThpqfjj8cBTedk6rLnVhRTrYbYJHc4iDboa3LWr.OiK', 1),
(24, 'asdjk@masd.com', '$2y$10$tOb9AKH8sDYc3CsVOmmOBu/ESQ3iVSkxd362g2Rn9JU79vWrxaQg6', 1),
(25, 'asd@asd.com', '$2y$10$FmfW3jaTJBAM4kkFBw3cqu9NGjWLRfPncvjKFxFVuixjdLzji.CPu', 1),
(26, 'askdaskdsajdjasdajsjdajsdjjasd@asdk.com', '$2y$10$DdOJlJZSASFIxeGR1p7osut6GwiWMSmWc0CXNmaf2egu4vEnTkqr6', 1),
(27, 'testadmin@gmail.com', '$2y$10$oDmBgS7WFKMJxingJhpOwuCzt.sJzRcuIoAjIU9Tb5fo36mhpgOoO', 0);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `car_details`
--
ALTER TABLE `car_details`
  ADD PRIMARY KEY (`car_id`),
  ADD UNIQUE KEY `vo_number` (`vo_number`);

--
-- Indici per le tabelle `car_equipments`
--
ALTER TABLE `car_equipments`
  ADD KEY `car_id` (`car_id`),
  ADD KEY `equip_id` (`equip_id`);

--
-- Indici per le tabelle `car_images`
--
ALTER TABLE `car_images`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `path` (`path`),
  ADD KEY `car_id` (`car_id`);

--
-- Indici per le tabelle `equipments`
--
ALTER TABLE `equipments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `equipment` (`equipment`);

--
-- Indici per le tabelle `opening_times`
--
ALTER TABLE `opening_times`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `cars`
--
ALTER TABLE `cars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=313;

--
-- AUTO_INCREMENT per la tabella `car_images`
--
ALTER TABLE `car_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=250;

--
-- AUTO_INCREMENT per la tabella `equipments`
--
ALTER TABLE `equipments`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT per la tabella `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT per la tabella `services`
--
ALTER TABLE `services`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT per la tabella `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `car_details`
--
ALTER TABLE `car_details`
  ADD CONSTRAINT `car_details_ibfk_1` FOREIGN KEY (`car_id`) REFERENCES `cars` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `car_equipments`
--
ALTER TABLE `car_equipments`
  ADD CONSTRAINT `car_equipments_ibfk_1` FOREIGN KEY (`car_id`) REFERENCES `cars` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `car_equipments_ibfk_2` FOREIGN KEY (`equip_id`) REFERENCES `equipments` (`id`);

--
-- Limiti per la tabella `car_images`
--
ALTER TABLE `car_images`
  ADD CONSTRAINT `car_images_ibfk_1` FOREIGN KEY (`car_id`) REFERENCES `cars` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
