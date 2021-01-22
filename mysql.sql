-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2021-01-22 08:29:44
-- 服务器版本： 5.5.62-log
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `backstage`
--

-- --------------------------------------------------------

--
-- 表的结构 `admin_group`
--

CREATE TABLE IF NOT EXISTS `admin_group` (
  `group_id` tinyint(3) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text,
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `admin_group`
--

INSERT INTO `admin_group` (`group_id`, `name`, `description`, `rules`, `listorder`, `updatetime`) VALUES
(1, '系统管理员', '管理系统基本配置', '1,2,3,7,8,9,12,13,17,18,19,20,21', 0, 1477622552),
(2, '票务管理员', '演出及票务管理', '1,2,3,7,8,9', 0, 1476067479),
(3, '人事管理员', '后台用户管理', '1,17,18', 0, 1479969527),
(4, '运营管理员', '客户、日志管理', '1,12,13,19,20,21', 0, 1479969527);

-- --------------------------------------------------------

--
-- 表的结构 `admin_group_access`
--

CREATE TABLE IF NOT EXISTS `admin_group_access` (
  `id` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `admin_group_access`
--

INSERT INTO `admin_group_access` (`id`, `group_id`) VALUES
(1, 1),
(2, 2),
(4, 3),
(3, 4);

-- --------------------------------------------------------

--
-- 表的结构 `admin_log`
--

CREATE TABLE IF NOT EXISTS `admin_log` (
  `id` int(10) unsigned NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(20) NOT NULL,
  `m` varchar(15) NOT NULL,
  `c` varchar(20) NOT NULL,
  `a` varchar(20) NOT NULL,
  `querystring` varchar(255) NOT NULL,
  `ip` int(10) NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=1197 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `admin_log`
--

INSERT INTO `admin_log` (`id`, `userid`, `username`, `m`, `c`, `a`, `querystring`, `ip`, `time`) VALUES
(1047, 1, 'user1', 'admin', 'Authority', 'authority_add', '', 1931204763, '2021-01-12 14:57:56'),
(1048, 1, 'user1', 'admin', 'Log', 'client', '', 1931204763, '2021-01-12 14:58:01'),
(1049, 1, 'user1', 'admin', 'Log', 'admin', '', 1931204763, '2021-01-12 14:58:08'),
(1050, 1, 'user1', 'admin', 'Log', 'client', '', 1931204763, '2021-01-12 14:58:15'),
(1051, 1, 'user1', 'admin', 'Order', 'info', '', 1931204763, '2021-01-13 15:06:32'),
(1052, 1, 'user1', 'admin', 'Order', 'info', '', 1931204763, '2021-01-13 15:06:53'),
(1053, 1, 'user1', 'admin', 'Ticket', 'program', '', 1931204763, '2021-01-13 16:05:20'),
(1054, 1, 'user1', 'admin', 'Ticket', 'info', '', 1931204763, '2021-01-13 16:05:21'),
(1055, 1, 'user1', 'admin', 'Ticket', 'ticket_del', '', 1931204763, '2021-01-13 16:05:25'),
(1056, 1, 'user1', 'admin', 'Ticket', 'info', '', 1931204763, '2021-01-13 16:05:25'),
(1057, 1, 'user1', 'admin', 'Ticket', 'ticket_edit', '', 1931204763, '2021-01-13 16:05:27'),
(1058, 1, 'user1', 'admin', 'Ticket', 'ticket_edit_db', '', 1931204763, '2021-01-13 16:05:31'),
(1059, 1, 'user1', 'admin', 'Ticket', 'info', '', 1931204763, '2021-01-13 16:05:32'),
(1060, 1, 'user1', 'admin', 'Ticket', 'info', '', 1931204763, '2021-01-13 16:07:30'),
(1061, 1, 'user1', 'admin', 'Order', 'info', '', 1931204763, '2021-01-13 16:07:36'),
(1062, 1, 'user1', 'admin', 'Order', 'info', '', 1931204763, '2021-01-13 16:08:05'),
(1063, 1, 'user1', 'admin', 'Order', 'info', '', 1931204763, '2021-01-13 16:09:52'),
(1064, 1, 'user1', 'admin', 'Order', 'info', '', 1931204763, '2021-01-13 16:11:15'),
(1065, 1, 'user1', 'admin', 'Order', 'info', '', 1931204763, '2021-01-13 16:12:42'),
(1066, 1, 'user1', 'admin', 'Order', 'info', '', 1931204763, '2021-01-13 16:12:45'),
(1067, 1, 'user1', 'admin', 'Order', 'info', '', 1931204763, '2021-01-13 16:12:46'),
(1068, 1, 'user1', 'admin', 'Order', 'info', '', 1931204763, '2021-01-13 16:13:49'),
(1069, 1, 'user1', 'admin', 'Order', 'info', '', 1931204763, '2021-01-13 16:14:06'),
(1070, 1, 'user1', 'admin', 'Order', 'info', '', 1931204763, '2021-01-13 16:16:37'),
(1071, 1, 'user1', 'admin', 'Log', 'client', '', 1931204763, '2021-01-13 16:16:40'),
(1072, 1, 'user1', 'admin', 'Order', 'info', '', 1931204763, '2021-01-13 16:17:34'),
(1073, 1, 'user1', 'admin', 'Ticket', 'program', '', 1931204763, '2021-01-19 10:34:23'),
(1074, 1, 'user1', 'admin', 'Ticket', 'info', '', 1931204763, '2021-01-19 10:34:24'),
(1075, 1, 'user1', 'admin', 'Ticket', 'ticket_del', '', 1931204763, '2021-01-19 10:34:28'),
(1076, 1, 'user1', 'admin', 'Ticket', 'info', '', 1931204763, '2021-01-19 10:34:28'),
(1077, 1, 'user1', 'admin', 'Ticket', 'ticket_edit', '', 1931204763, '2021-01-19 10:34:30'),
(1078, 1, 'user1', 'admin', 'Ticket', 'ticket_edit_db', '', 1931204763, '2021-01-19 10:34:34'),
(1079, 1, 'user1', 'admin', 'Ticket', 'info', '', 1931204763, '2021-01-19 10:34:34'),
(1080, 1, 'user1', 'admin', 'Ticket', 'info', '', 1931204763, '2021-01-19 10:36:37'),
(1081, 1, 'user1', 'admin', 'Ticket', 'ticket_edit_db', '', 1931202883, '2021-01-21 10:22:50'),
(1082, 1, 'user1', 'admin', 'Ticket', 'info', '', 1931202883, '2021-01-21 10:23:22'),
(1083, 1, 'user1', 'admin', 'Ticket', 'ticket_edit', '', 1931202883, '2021-01-21 10:23:24'),
(1084, 1, 'user1', 'admin', 'Ticket', 'ticket_edit_db', '', 1931202883, '2021-01-21 10:23:27'),
(1085, 1, 'user1', 'admin', 'Ticket', 'info', '', 1931202883, '2021-01-21 10:23:27'),
(1086, 1, 'user1', 'admin', 'Ticket', 'info', '', 1931202883, '2021-01-21 10:37:55'),
(1087, 1, 'user1', 'admin', 'Authority', 'member', '', 1931202883, '2021-01-21 10:37:56'),
(1088, 1, 'user1', 'admin', 'Authority', 'authority_edit', '', 1931202883, '2021-01-21 10:38:03'),
(1089, 1, 'user1', 'admin', 'Authority', 'authority_edit_db', '', 1931202883, '2021-01-21 10:38:06'),
(1090, 1, 'user1', 'admin', 'Authority', 'member', '', 1931202883, '2021-01-21 10:38:06'),
(1091, 2, 'piaowu', 'admin', 'Order', 'info', '', 1931202883, '2021-01-21 10:42:45'),
(1092, 1, 'user1', 'admin', 'Log', 'client', '', 1931202883, '2021-01-21 10:48:35'),
(1093, 1, 'user1', 'admin', 'Log', 'client', '', 1931202883, '2021-01-21 10:48:46'),
(1094, 1, 'user1', 'admin', 'Order', 'info', '', 1931202883, '2021-01-21 10:48:47'),
(1095, 1, 'user1', 'admin', 'Order', 'info', '', 1931202883, '2021-01-21 10:51:12'),
(1096, 1, 'user1', 'admin', 'Order', 'order_edit', '', 1931202883, '2021-01-21 10:54:13'),
(1097, 1, 'user1', 'admin', 'Order', 'order_edit_db', '', 1931202883, '2021-01-21 10:54:19'),
(1098, 1, 'user1', 'admin', 'Order', 'info', '', 1931202883, '2021-01-21 10:54:23'),
(1099, 1, 'user1', 'admin', 'Order', 'order_edit', '', 1931202883, '2021-01-21 10:54:25'),
(1100, 1, 'user1', 'admin', 'Order', 'order_edit_db', '', 1931202883, '2021-01-21 10:54:30'),
(1101, 1, 'user1', 'admin', 'Order', 'info', '', 1931202883, '2021-01-21 10:54:35'),
(1102, 1, 'user1', 'admin', 'Order', 'order_edit', '', 1931202883, '2021-01-21 10:54:38'),
(1103, 1, 'user1', 'admin', 'Order', 'order_edit_db', '', 1931202883, '2021-01-21 10:54:49'),
(1104, 1, 'user1', 'admin', 'Order', 'order_edit_db', '', 1931202883, '2021-01-21 10:57:13'),
(1105, 1, 'user1', 'admin', 'Order', 'info', '', 1931202883, '2021-01-21 10:57:15'),
(1106, 1, 'user1', 'admin', 'Order', 'order_edit', '', 1931202883, '2021-01-21 10:57:17'),
(1107, 1, 'user1', 'admin', 'Order', 'order_edit_db', '', 1931202883, '2021-01-21 10:57:29'),
(1108, 1, 'user1', 'admin', 'Order', 'info', '', 1931202883, '2021-01-21 10:59:18'),
(1109, 1, 'user1', 'admin', 'Order', 'order_edit', '', 1931202883, '2021-01-21 10:59:25'),
(1110, 1, 'user1', 'admin', 'Order', 'order_edit_db', '', 1931202883, '2021-01-21 10:59:29'),
(1111, 1, 'user1', 'admin', 'Order', 'order_edit_db', '', 1931202883, '2021-01-21 10:59:31'),
(1112, 1, 'user1', 'admin', 'Order', 'info', '', 1931202883, '2021-01-21 10:59:33'),
(1113, 1, 'user1', 'admin', 'Order', 'order_edit', '', 1931202883, '2021-01-21 11:00:01'),
(1114, 1, 'user1', 'admin', 'Order', 'order_edit_db', '', 1931202883, '2021-01-21 11:00:04'),
(1115, 1, 'user1', 'admin', 'Order', 'info', '', 1931202883, '2021-01-21 11:00:09'),
(1116, 1, 'user1', 'admin', 'Order', 'order_add', '', 1931202883, '2021-01-21 11:00:56'),
(1117, 1, 'user1', 'admin', 'Order', 'order_add', '', 1931202883, '2021-01-21 11:02:03'),
(1118, 1, 'user1', 'admin', 'Order', 'order_edit', '', 1931202883, '2021-01-21 11:03:45'),
(1119, 1, 'user1', 'admin', 'Order', 'order_del', '', 1931202883, '2021-01-21 11:07:53'),
(1120, 1, 'user1', 'admin', 'Order', 'info', '', 1931202883, '2021-01-21 13:22:48'),
(1121, 1, 'user1', 'admin', 'Ticket', 'program', '', 1931202883, '2021-01-21 13:25:12'),
(1122, 1, 'user1', 'admin', 'Ticket', 'program_add', '', 1931202883, '2021-01-21 13:26:07'),
(1123, 1, 'user1', 'admin', 'Ticket', 'program_edit', '', 1931202883, '2021-01-21 13:27:46'),
(1124, 1, 'user1', 'admin', 'Ticket', 'program_add', '', 1931202883, '2021-01-21 13:28:08'),
(1125, 1, 'user1', 'admin', 'Ticket', 'program_add', '', 1931202883, '2021-01-21 13:28:15'),
(1126, 1, 'user1', 'admin', 'Ticket', 'program_add_db', '', 1931202883, '2021-01-21 13:28:18'),
(1127, 1, 'user1', 'admin', 'Ticket', 'program', '', 1931202883, '2021-01-21 13:28:18'),
(1128, 1, 'user1', 'admin', 'Ticket', 'program_del', '', 1931202883, '2021-01-21 13:28:51'),
(1129, 1, 'user1', 'admin', 'Ticket', 'program', '', 1931202883, '2021-01-21 13:28:51'),
(1130, 1, 'user1', 'admin', 'Ticket', 'program_add', '', 1931202883, '2021-01-21 13:30:51'),
(1131, 1, 'user1', 'admin', 'Ticket', 'program_add_db', '', 1931202883, '2021-01-21 13:31:16'),
(1132, 1, 'user1', 'admin', 'Ticket', 'program', '', 1931202883, '2021-01-21 13:31:16'),
(1133, 1, 'user1', 'admin', 'Ticket', 'program_del', '', 1931202883, '2021-01-21 13:31:35'),
(1134, 1, 'user1', 'admin', 'Ticket', 'program', '', 1931202883, '2021-01-21 13:31:35'),
(1135, 1, 'user1', 'admin', 'Ticket', 'program', '', 1931202883, '2021-01-21 13:33:39'),
(1136, 1, 'user1', 'admin', 'Ticket', 'info', '', 1931202883, '2021-01-21 13:33:41'),
(1137, 1, 'user1', 'admin', 'Ticket', 'ticket_add', '', 1931202883, '2021-01-21 13:33:51'),
(1138, 1, 'user1', 'admin', 'Ticket', 'ticket_add', '', 1931202883, '2021-01-21 13:34:00'),
(1139, 1, 'user1', 'admin', 'Ticket', 'ticket_add_db', '', 1931202883, '2021-01-21 13:34:34'),
(1140, 1, 'user1', 'admin', 'Ticket', 'info', '', 1931202883, '2021-01-21 13:34:34'),
(1141, 1, 'user1', 'admin', 'Ticket', 'ticket_edit', '', 1931202883, '2021-01-21 13:34:42'),
(1142, 1, 'user1', 'admin', 'Ticket', 'ticket_edit_db', '', 1931202883, '2021-01-21 13:35:01'),
(1143, 1, 'user1', 'admin', 'Ticket', 'info', '', 1931202883, '2021-01-21 13:35:01'),
(1144, 1, 'user1', 'admin', 'Ticket', 'ticket_del', '', 1931202883, '2021-01-21 13:36:00'),
(1145, 1, 'user1', 'admin', 'Ticket', 'info', '', 1931202883, '2021-01-21 13:36:00'),
(1146, 1, 'user1', 'admin', 'Ticket', 'info', '', 1931202883, '2021-01-21 13:42:04'),
(1147, 1, 'user1', 'admin', 'Client', 'info', '', 1931202883, '2021-01-21 13:42:05'),
(1148, 1, 'user1', 'admin', 'Client', 'client_edit', '', 1931202883, '2021-01-21 13:42:27'),
(1149, 1, 'user1', 'admin', 'Client', 'client_edit_db', '', 1931202883, '2021-01-21 13:42:44'),
(1150, 1, 'user1', 'admin', 'Client', 'info', '', 1931202883, '2021-01-21 13:42:44'),
(1151, 1, 'user1', 'admin', 'Client', 'client_add', '', 1931202883, '2021-01-21 13:44:26'),
(1152, 1, 'user1', 'admin', 'Client', 'info', '', 1931202883, '2021-01-21 21:48:50'),
(1153, 1, 'user1', 'admin', 'Client', 'info', '', 1931202883, '2021-01-21 21:48:56'),
(1154, 1, 'user1', 'admin', 'Authority', 'member', '', 1931202883, '2021-01-21 21:48:58'),
(1155, 1, 'user1', 'admin', 'Authority', 'authority_add', '', 1931202883, '2021-01-21 21:49:15'),
(1156, 1, 'user1', 'admin', 'Authority', 'authority_add_db', '', 1931202883, '2021-01-21 21:50:01'),
(1157, 1, 'user1', 'admin', 'Authority', 'member', '', 1931202883, '2021-01-21 21:50:01'),
(1158, 1, 'user1', 'admin', 'Authority', 'authority_edit', '', 1931202883, '2021-01-21 21:50:30'),
(1159, 1, 'user1', 'admin', 'Authority', 'authority_edit_db', '', 1931202883, '2021-01-21 21:51:02'),
(1160, 1, 'user1', 'admin', 'Authority', 'member', '', 1931202883, '2021-01-21 21:51:02'),
(1161, 1, 'user1', 'admin', 'Authority', 'authority_edit', '', 1931202883, '2021-01-21 21:51:14'),
(1162, 1, 'user1', 'admin', 'Authority', 'authority_edit_db', '', 1931202883, '2021-01-21 21:51:18'),
(1163, 1, 'user1', 'admin', 'Authority', 'member', '', 1931202883, '2021-01-21 21:51:18'),
(1164, 1, 'user1', 'admin', 'Authority', 'authority_del', '', 1931202883, '2021-01-21 21:51:31'),
(1165, 1, 'user1', 'admin', 'Authority', 'member', '', 1931202883, '2021-01-21 21:51:32'),
(1166, 1, 'user1', 'admin', 'Authority', 'authority_add', '', 1931202883, '2021-01-21 21:52:50'),
(1167, 1, 'user1', 'admin', 'Log', 'client', '', 1931202883, '2021-01-21 21:55:45'),
(1168, 1, 'user1', 'admin', 'Log', 'client', '', 1931202883, '2021-01-21 21:57:27'),
(1169, 1, 'user1', 'admin', 'Log', 'admin', '', 1931202883, '2021-01-21 21:57:40'),
(1170, 1, 'user1', 'admin', 'Log', 'admin', '', 1931202883, '2021-01-21 21:58:14'),
(1171, 1, 'user1', 'admin', 'Log', 'admin', '', 1931202883, '2021-01-21 21:58:30'),
(1172, 1, 'user1', 'admin', 'Log', 'admin', '', 1931202883, '2021-01-21 21:58:47'),
(1173, 1, 'user1', 'admin', 'Log', 'client', '', 1931202883, '2021-01-21 22:31:00'),
(1174, 1, 'user1', 'admin', 'Ticket', 'program', '', 1931202883, '2021-01-21 22:31:02'),
(1175, 1, 'user1', 'admin', 'Ticket', 'info', '', 1931202883, '2021-01-21 22:31:03'),
(1176, 1, 'user1', 'admin', 'Ticket', 'info', '', 1931202883, '2021-01-21 22:33:56'),
(1177, 1, 'user1', 'admin', 'Ticket', 'ticket_edit', '', 1931202883, '2021-01-21 22:33:59'),
(1178, 1, 'user1', 'admin', 'Ticket', 'ticket_edit_db', '', 1931202883, '2021-01-21 22:34:03'),
(1179, 1, 'user1', 'admin', 'Ticket', 'info', '', 1931202883, '2021-01-21 22:34:03'),
(1180, 1, 'user1', 'admin', 'Ticket', 'ticket_edit', '', 1931202883, '2021-01-21 22:39:52'),
(1181, 1, 'user1', 'admin', 'Ticket', 'ticket_edit_db', '', 1931202883, '2021-01-21 22:39:57'),
(1182, 1, 'user1', 'admin', 'Ticket', 'info', '', 1931202883, '2021-01-21 22:39:57'),
(1183, 1, 'user1', 'admin', 'Ticket', 'ticket_edit', '', 1931202883, '2021-01-21 22:40:05'),
(1184, 1, 'user1', 'admin', 'Ticket', 'ticket_edit_db', '', 1931202883, '2021-01-21 22:40:08'),
(1185, 1, 'user1', 'admin', 'Ticket', 'info', '', 1931202883, '2021-01-21 22:40:09'),
(1186, 1, 'user1', 'admin', 'Ticket', 'info', '', 1931202883, '2021-01-21 22:45:01'),
(1187, 1, 'user1', 'admin', 'Ticket', 'ticket_edit', '', 1931202883, '2021-01-21 22:45:03'),
(1188, 1, 'user1', 'admin', 'Ticket', 'ticket_edit_db', '', 1931202883, '2021-01-21 22:45:05'),
(1189, 1, 'user1', 'admin', 'Ticket', 'info', '', 1931202883, '2021-01-21 22:45:05'),
(1190, 1, 'user1', 'admin', 'Ticket', 'ticket_edit', '', 1931202883, '2021-01-21 22:45:16'),
(1191, 1, 'user1', 'admin', 'Ticket', 'ticket_edit_db', '', 1931202883, '2021-01-21 22:45:19'),
(1192, 1, 'user1', 'admin', 'Ticket', 'info', '', 1931202883, '2021-01-21 22:45:19'),
(1193, 1, 'user1', 'admin', 'Ticket', 'info', '', 1931202883, '2021-01-21 22:48:20'),
(1194, 1, 'user1', 'admin', 'Ticket', 'ticket_edit', '', 1931202883, '2021-01-21 22:48:22'),
(1195, 1, 'user1', 'admin', 'Ticket', 'ticket_edit_db', '', 1931202883, '2021-01-21 22:48:25'),
(1196, 1, 'user1', 'admin', 'Ticket', 'info', '', 1931202883, '2021-01-21 22:48:25');

-- --------------------------------------------------------

--
-- 表的结构 `admin_menu`
--

CREATE TABLE IF NOT EXISTS `admin_menu` (
  `id` smallint(6) unsigned NOT NULL,
  `name` char(40) NOT NULL DEFAULT '',
  `parentid` smallint(6) DEFAULT '0',
  `icon` varchar(20) NOT NULL DEFAULT '',
  `list_order` smallint(6) unsigned NOT NULL DEFAULT '999',
  `display` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示(1:显示,2:不显示)',
  `update_time` datetime NOT NULL,
  `c` varchar(20) NOT NULL,
  `a` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `admin_menu`
--

INSERT INTO `admin_menu` (`id`, `name`, `parentid`, `icon`, `list_order`, `display`, `update_time`, `c`, `a`) VALUES
(1, '后台管理首页', 0, 'xe6b4', 0, 1, '0000-00-00 00:00:00', 'Main', 'index'),
(2, '订单管理', 0, 'xe699', 0, 1, '0000-00-00 00:00:00', 'Order', 'index'),
(3, '订单列表', 2, '', 1, 1, '0000-00-00 00:00:00', 'Order', 'info'),
(4, '添加', 2, '', 1, 2, '0000-00-00 00:00:00', 'Order', 'add'),
(5, '修改', 2, '', 1, 2, '0000-00-00 00:00:00', 'Order', 'edit'),
(6, '删除', 2, '', 1, 2, '0000-00-00 00:00:00', 'Order', 'del'),
(7, '票务管理', 0, 'xe6f6', 2, 1, '0000-00-00 00:00:00', 'Ticket', 'index'),
(8, '演出管理', 7, '', 3, 1, '0000-00-00 00:00:00', 'Ticket', 'program'),
(9, '售票管理', 7, '', 4, 1, '0000-00-00 00:00:00', 'Ticket', 'info'),
(10, '修改', 7, '', 5, 2, '0000-00-00 00:00:00', 'Ticket', 'edit'),
(11, '删除', 7, '', 6, 2, '0000-00-00 00:00:00', 'Ticket', 'del'),
(12, '客户管理', 0, 'xe6b8', 4, 1, '0000-00-00 00:00:00', 'Client', 'index'),
(13, '客户账户列表', 12, '', 5, 1, '0000-00-00 00:00:00', 'Client', 'info'),
(14, '添加', 12, '', 5, 2, '0000-00-00 00:00:00', 'Client', 'add'),
(15, '修改', 12, '', 5, 2, '0000-00-00 00:00:00', 'Client', 'edit'),
(16, '删除', 12, '', 5, 2, '0000-00-00 00:00:00', 'Client', 'del'),
(17, '管理员权限管理', 0, 'xe726', 6, 1, '0000-00-00 00:00:00', 'Authority', 'index'),
(18, '管理员列表', 17, '', 6, 1, '0000-00-00 00:00:00', 'Authority', 'member'),
(19, '日志管理', 0, 'xe6fb', 7, 1, '0000-00-00 00:00:00', 'Log', 'index'),
(20, '用户端日志管理', 19, '', 999, 1, '0000-00-00 00:00:00', 'Log', 'client'),
(21, '后台日志管理', 19, '', 999, 1, '0000-00-00 00:00:00', 'Log', 'admin');

-- --------------------------------------------------------

--
-- 表的结构 `admin_users`
--

CREATE TABLE IF NOT EXISTS `admin_users` (
  `id` mediumint(6) unsigned NOT NULL,
  `username` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `login_ip` varchar(20) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(2:无效,1:有效)',
  `login_time` datetime NOT NULL,
  `token` varchar(500) NOT NULL,
  `ad_comment` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`, `login_ip`, `status`, `login_time`, `token`, `ad_comment`) VALUES
(1, 'user1', '75c979bd25b55b268256e2ba0c9ff031', '1931202883', 1, '2021-01-21 10:48:12', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiIiLCJhdWQiOiIiLCJpYXQiOjE2MTExOTcyOTIsIm5iZiI6MTYxMTE5NzM5MiwiZXhwIjoxNjExMjY5MjkyLCJ1c2VybmFtZSI6InVzZXIxIn0.phPMs8IggRxjEZA_qD2TH3wSKqrlmDnHgY-GJhQR3-0', ''),
(2, 'piaowu', '75c979bd25b55b268256e2ba0c9ff031', '1931202883', 1, '2021-01-21 10:42:30', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiIiLCJhdWQiOiIiLCJpYXQiOjE2MTExOTY5NTAsIm5iZiI6MTYxMTE5NzA1MCwiZXhwIjoxNjExMjY4OTUwLCJ1c2VybmFtZSI6InBpYW93dSJ9.gSy2fYMZw7JdoYthWeUkBaXO7tnsEqt8UijoqN29PI4', ''),
(3, 'renshi', '75c979bd25b55b268256e2ba0c9ff031', '1931202883', 1, '2021-01-21 10:45:08', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiIiLCJhdWQiOiIiLCJpYXQiOjE2MTExOTcxMDgsIm5iZiI6MTYxMTE5NzIwOCwiZXhwIjoxNjExMjY5MTA4LCJ1c2VybmFtZSI6InJlbnNoaSJ9.CbAGtmBhOElyJQytzCsDuqINcJQfpBMf1ok-ALNwhWw', ''),
(4, 'yunying', '75c979bd25b55b268256e2ba0c9ff031', '1931202883', 1, '2021-01-21 10:44:27', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiIiLCJhdWQiOiIiLCJpYXQiOjE2MTExOTcwNjcsIm5iZiI6MTYxMTE5NzE2NywiZXhwIjoxNjExMjY5MDY3LCJ1c2VybmFtZSI6Inl1bnlpbmcifQ.1rzi4JF13Yt21ST4l_hALI92ddHNrYCz3Vc3RYmLSx0', '');

-- --------------------------------------------------------

--
-- 表的结构 `client_log`
--

CREATE TABLE IF NOT EXISTS `client_log` (
  `id` int(10) NOT NULL,
  `ticket_id` int(10) NOT NULL,
  `count` int(10) NOT NULL,
  `sum_price` int(10) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `time` datetime NOT NULL,
  `message` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `client_log`
--

INSERT INTO `client_log` (`id`, `ticket_id`, `count`, `sum_price`, `status`, `time`, `message`) VALUES
(1, 1, 1, 1280, 1, '2021-01-13 16:10:51', '秒杀成功'),
(2, 1, 1, 1280, 1, '2021-01-13 16:13:28', '秒杀成功'),
(3, 1, 1, 1280, 1, '2021-01-13 16:14:00', '秒杀成功'),
(5, 1, 1, 1280, 1, '2021-01-13 16:15:59', '秒杀成功'),
(7, 1, 1, 1280, 1, '2021-01-13 16:17:28', '秒杀成功'),
(8, 1, 1, 1280, 0, '2021-01-13 16:52:36', '秒杀失败，无库存'),
(9, 1, 1, 1280, 0, '2021-01-13 16:52:55', '秒杀失败，无库存'),
(10, 1, 1, 1280, 0, '2021-01-13 16:53:30', '秒杀失败，无库存'),
(11, 1, 1, 1280, 0, '2021-01-13 16:54:15', '秒杀失败，无库存'),
(12, 1, 1, 1280, 0, '2021-01-13 16:54:44', '秒杀失败，无库存'),
(14, 1, 1, 1280, 1, '2021-01-15 14:48:48', '秒杀成功'),
(16, 1, 1, 1280, 1, '2021-01-15 14:48:48', '秒杀成功'),
(18, 1, 1, 1280, 1, '2021-01-15 14:48:48', '秒杀成功'),
(20, 1, 1, 1280, 1, '2021-01-15 14:48:49', '秒杀成功'),
(22, 1, 1, 1280, 1, '2021-01-15 14:48:49', '秒杀成功'),
(24, 1, 1, 1280, 1, '2021-01-15 14:48:49', '秒杀成功'),
(26, 1, 1, 1280, 1, '2021-01-15 14:48:50', '秒杀成功'),
(28, 1, 1, 1280, 1, '2021-01-15 14:48:50', '秒杀成功'),
(30, 1, 1, 1280, 1, '2021-01-15 14:48:50', '秒杀成功'),
(32, 1, 1, 1280, 1, '2021-01-15 14:48:51', '秒杀成功'),
(85, 1, 1, 1280, 1, '2021-01-15 14:48:59', '{"name":"21011310053101","user_id":"\\u5f1f\\u5f1f","iden_num":"223","ticket_id":"1","price":1280,"status":1,"take":"1","time":"2021-01-13 16:52:29"}'),
(86, 1, 1, 1280, 1, '2021-01-15 14:49:00', '秒杀成功'),
(87, 1, 1, 1280, 1, '2021-01-15 14:49:00', '{"name":"21011310099102","user_id":"\\u5f1f\\u5f1f","iden_num":"223","ticket_id":"1","price":1280,"status":1,"take":"1","time":"2021-01-13 16:52:29"}'),
(88, 1, 1, 1280, 1, '2021-01-15 14:49:00', '秒杀成功'),
(89, 1, 1, 1280, 1, '2021-01-15 14:49:00', '{"name":"21011310148575","user_id":"\\u5f1f\\u5f1f","iden_num":"223","ticket_id":"1","price":1280,"status":1,"take":"1","time":"2021-01-13 16:52:30"}'),
(90, 1, 1, 1280, 1, '2021-01-15 14:49:00', '秒杀成功'),
(91, 1, 1, 1280, 1, '2021-01-15 14:49:00', '{"name":"21011310154100","user_id":"\\u5f1f\\u5f1f","iden_num":"223","ticket_id":"1","price":1280,"status":1,"take":"1","time":"2021-01-13 16:52:30"}'),
(92, 1, 1, 1280, 1, '2021-01-15 14:49:00', '秒杀成功'),
(93, 1, 1, 1280, 1, '2021-01-15 14:49:01', '{"name":"21011310253539","user_id":"\\u5f1f\\u5f1f","iden_num":"223","ticket_id":"1","price":1280,"status":1,"take":"1","time":"2021-01-13 16:52:31"}'),
(94, 1, 1, 1280, 1, '2021-01-15 14:49:01', '秒杀成功'),
(95, 1, 1, 1280, 1, '2021-01-15 14:49:01', '{"name":"21011348515797","user_id":"\\u5f1f\\u5f1f","iden_num":"223","ticket_id":"1","price":1280,"status":1,"take":"1","time":"2021-01-13 16:52:32"}'),
(96, 1, 1, 1280, 1, '2021-01-15 14:49:01', '秒杀成功'),
(97, 1, 1, 1280, 1, '2021-01-15 14:49:01', '{"name":"21011349524854","user_id":"\\u5f1f\\u5f1f","iden_num":"223","ticket_id":"1","price":1280,"status":1,"take":"1","time":"2021-01-13 16:52:33"}'),
(98, 1, 1, 1280, 1, '2021-01-15 14:49:01', '秒杀成功'),
(99, 1, 1, 1280, 1, '2021-01-15 14:49:01', '{"name":"21011350551009","user_id":"\\u5f1f\\u5f1f","iden_num":"223","ticket_id":"1","price":1280,"status":1,"take":"1","time":"2021-01-13 16:52:34"}'),
(100, 1, 1, 1280, 1, '2021-01-15 14:49:02', '秒杀成功'),
(101, 1, 1, 1280, 1, '2021-01-15 14:49:02', '{"name":"21011351511019","user_id":"\\u5f1f\\u5f1f","iden_num":"223","ticket_id":"1","price":1280,"status":1,"take":"1","time":"2021-01-13 16:52:35"}'),
(102, 1, 1, 1280, 1, '2021-01-15 14:49:02', '秒杀成功'),
(103, 1, 1, 1280, 0, '2021-01-19 10:32:56', '秒杀失败，无库存'),
(104, 1, 1, 1280, 0, '2021-01-19 10:33:26', '秒杀失败，无库存'),
(105, 1, 1, 1280, 1, '2021-01-19 10:35:02', '{"name":"21011954995710","user_id":"33","iden_num":"333","ticket_id":"1","price":1280,"status":1,"take":"1","time":"2021-01-19 10:35:02"}'),
(106, 1, 1, 1280, 1, '2021-01-19 10:35:03', '秒杀成功'),
(107, 1, 1, 1280, 1, '2021-01-19 10:35:25', '{"name":"21011910055494","user_id":"2","iden_num":"2","ticket_id":"1","price":1280,"status":1,"take":"1","time":"2021-01-19 10:35:25"}'),
(108, 1, 1, 1280, 1, '2021-01-19 10:35:25', '秒杀成功'),
(109, 1, 1, 1280, 1, '2021-01-19 10:36:33', '{"name":"21011949535699","user_id":"222","iden_num":"222","ticket_id":"1","price":1280,"status":1,"take":"1","time":"2021-01-19 10:36:33"}'),
(110, 1, 1, 1280, 1, '2021-01-19 10:36:33', '秒杀成功'),
(111, 1, 1, 1280, 1, '2021-01-20 23:20:11', '{"name":"21011957491015","user_id":"222","iden_num":"222","ticket_id":"1","price":1280,"status":1,"take":"1","time":"2021-01-19 10:38:17"}'),
(112, 1, 1, 1280, 1, '2021-01-20 23:20:11', '秒杀成功'),
(113, 1, 1, 1280, 1, '2021-01-20 23:20:11', '{"name":"21011950495399","user_id":"22","iden_num":"223","ticket_id":"1","price":1280,"status":1,"take":"1","time":"2021-01-19 10:38:26"}'),
(114, 1, 1, 1280, 1, '2021-01-20 23:20:11', '秒杀成功'),
(115, 1, 1, 1280, 1, '2021-01-20 23:20:12', '{"name":"21011955541005","user_id":"34","iden_num":"445","ticket_id":"1","price":1280,"status":1,"take":"1","time":"2021-01-19 10:39:51"}'),
(116, 1, 1, 1280, 1, '2021-01-20 23:20:12', '秒杀成功'),
(117, 1, 1, 1280, 1, '2021-01-20 23:20:12', '{"name":"21011954535554","user_id":"d","iden_num":"2er","ticket_id":"1","price":1280,"status":1,"take":"1","time":"2021-01-19 10:47:02"}'),
(118, 1, 1, 1280, 1, '2021-01-20 23:20:12', '秒杀成功'),
(119, 1, 1, 1280, 0, '2021-01-21 10:23:59', '秒杀失败，无库存');

-- --------------------------------------------------------

--
-- 表的结构 `client_order`
--

CREATE TABLE IF NOT EXISTS `client_order` (
  `id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `user_id` varchar(10) NOT NULL,
  `ticket_id` int(10) NOT NULL,
  `price` int(10) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `time` datetime NOT NULL,
  `iden_num` varchar(100) NOT NULL,
  `take` int(1) NOT NULL COMMENT '1、线下取票；2、线上邮寄'
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `client_order`
--

INSERT INTO `client_order` (`id`, `name`, `user_id`, `ticket_id`, `price`, `status`, `time`, `iden_num`, `take`) VALUES
(1, '21011397100100', '小李', 1, 1280, 1, '2021-01-13 00:00:00', '11111112147483647', 2),
(2, '21011348985110', '小王', 1, 1280, 1, '2021-01-13 00:00:00', '21474831111111647', 2),
(3, '21011355101535', '小张', 2, 1280, 1, '2021-01-13 00:00:00', '110110111111111111', 2),
(4, '21011353521011', '小小', 1, 1280, 1, '2021-01-13 00:00:00', '110110111111111112', 1),
(5, '21011356545052', '弟弟', 1, 1280, 1, '2021-01-13 16:17:28', '120110111111111111', 1),
(6, '21011352100545', '小王', 1, 1280, 1, '2021-01-13 16:41:40', '13456', 1),
(7, '21011397975598', '弟弟', 1, 1280, 1, '2021-01-13 16:52:10', '11223434', 1),
(8, '21011397100975', '姐姐', 1, 1280, 1, '2021-01-13 00:00:00', '11223434', 1),
(10, '21011398525010', '弟弟', 1, 1280, 1, '2021-01-13 16:52:11', '11223434', 1),
(11, '21011398549910', '弟弟', 1, 1280, 1, '2021-01-13 16:52:11', '11223434', 1),
(12, '21011398575355', '弟弟', 1, 1280, 1, '2021-01-13 16:52:11', '11223434', 1),
(13, '21011398995098', '弟弟', 1, 1280, 1, '2021-01-13 16:52:11', '11223434', 1),
(14, '21011398101985', '弟弟', 1, 1280, 1, '2021-01-13 16:52:11', '11223434', 1),
(15, '21011399504854', '弟弟', 1, 1280, 1, '2021-01-13 16:52:12', '11223434', 1),
(16, '21011399521001', '弟弟', 1, 1280, 1, '2021-01-13 16:52:12', '11223434', 1),
(17, '21011399555551', '弟弟', 1, 1280, 1, '2021-01-13 16:52:12', '11223434', 1),
(18, '21011399571015', '弟弟', 1, 1280, 1, '2021-01-13 16:52:12', '11223434', 1),
(19, '21011399995550', '弟弟', 1, 1280, 1, '2021-01-13 16:52:12', '11223434', 1),
(20, '21011399102495', '弟弟', 1, 1280, 1, '2021-01-13 16:52:12', '11223434', 1),
(21, '21011310050525', '弟弟', 1, 1280, 1, '2021-01-13 16:52:13', '11223434', 1),
(22, '21011310053545', '弟弟', 1, 1280, 1, '2021-01-13 16:52:13', '11223434', 1),
(23, '21011310055101', '弟弟', 1, 1280, 1, '2021-01-13 16:52:13', '11223434', 1),
(24, '21011310097555', '弟弟', 1, 1280, 1, '2021-01-13 16:52:13', '11223434', 1),
(25, '21011310010056', '弟弟', 1, 1280, 1, '2021-01-13 16:52:13', '11223434', 1),
(26, '21011310149539', '弟弟', 1, 1280, 1, '2021-01-13 16:52:14', '11223434', 1),
(27, '21011310252985', '弟弟', 1, 1280, 1, '2021-01-13 16:52:15', '11223434', 1),
(28, '21011348565352', '弟弟', 1, 1280, 1, '2021-01-13 16:52:16', '11223434', 1),
(29, '21011349525750', '弟弟', 1, 1280, 1, '2021-01-13 16:52:17', '11223434', 1),
(30, '21011350515753', '弟弟', 1, 1280, 1, '2021-01-13 16:52:18', '11223434', 1),
(31, '21011351525452', '弟弟', 1, 1280, 1, '2021-01-13 16:52:19', '11223434', 1),
(32, '21011352519849', '弟弟', 1, 1280, 1, '2021-01-13 16:52:20', '11223434', 1),
(33, '21011353515751', '弟弟', 1, 1280, 1, '2021-01-13 16:52:21', '11223434', 1),
(34, '21011354485550', '弟弟', 1, 1280, 1, '2021-01-13 16:52:22', '11223434', 1),
(35, '21011354515210', '弟弟', 1, 1280, 1, '2021-01-13 16:52:22', '11223434', 1),
(36, '21011354555156', '弟弟', 1, 1280, 1, '2021-01-13 16:52:22', '11223434', 1),
(37, '21011354579954', '弟弟', 1, 1280, 1, '2021-01-13 16:52:22', '11223434', 1),
(38, '21011399525152', '弟弟', 1, 1280, 1, '2021-01-13 16:52:28', '223', 1),
(39, '21011399555798', '弟弟', 1, 1280, 1, '2021-01-13 16:52:28', '223', 1),
(40, '21011399100491', '弟弟', 1, 1280, 1, '2021-01-13 16:52:28', '223', 1),
(41, '21011310048579', '弟弟', 1, 1280, 1, '2021-01-13 16:52:29', '223', 1),
(42, '21011310053101', '弟弟', 1, 1280, 1, '2021-01-13 16:52:29', '223', 1),
(43, '21011310099102', '弟弟', 1, 1280, 1, '2021-01-13 16:52:29', '223', 1),
(44, '21011310148575', '弟弟', 1, 1280, 1, '2021-01-13 16:52:30', '223', 1),
(45, '21011310154100', '弟弟', 1, 1280, 1, '2021-01-13 16:52:30', '223', 1),
(46, '21011310253539', '弟弟', 1, 1280, 1, '2021-01-13 16:52:31', '223', 1),
(47, '21011348515797', '弟弟', 1, 1280, 1, '2021-01-13 16:52:32', '223', 1),
(48, '21011349524854', '弟弟', 1, 1280, 1, '2021-01-13 16:52:33', '223', 1),
(49, '21011350551009', '弟弟', 1, 1280, 1, '2021-01-13 16:52:34', '223', 1),
(50, '21011351511019', '弟弟', 1, 1280, 1, '2021-01-13 16:52:35', '223', 1),
(51, '21011954995710', '33', 1, 1280, 1, '2021-01-19 10:35:02', '333', 1),
(52, '21011910055494', '2', 1, 1280, 1, '2021-01-19 10:35:25', '2', 1),
(53, '21011949535699', '222', 1, 1280, 1, '2021-01-19 10:36:33', '222', 1),
(54, '21011957491015', '222', 1, 1280, 1, '2021-01-19 10:38:17', '222', 1),
(55, '21011950495399', '22', 1, 1280, 1, '2021-01-19 10:38:26', '223', 1),
(56, '21011955541005', '34', 1, 1280, 1, '2021-01-19 10:39:51', '445', 1),
(57, '21011954535554', 'd', 1, 1280, 1, '2021-01-19 10:47:02', '2', 1);

-- --------------------------------------------------------

--
-- 表的结构 `client_users`
--

CREATE TABLE IF NOT EXISTS `client_users` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `token` varchar(50) NOT NULL,
  `login_time` datetime NOT NULL,
  `login_ip` varchar(20) NOT NULL,
  `client_comment` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `client_users`
--

INSERT INTO `client_users` (`id`, `username`, `password`, `token`, `login_time`, `login_ip`, `client_comment`) VALUES
(1, 'client1', '75c979bd25b55b268256e2ba0c9ff031', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiIiL', '2021-01-21 23:40:16', '1931202883', 'vip'),
(2, 'client2', '75c979bd25b55b268256e2ba0c9ff031', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiIiL', '2021-01-20 23:03:10', '1931202883', 'null');

-- --------------------------------------------------------

--
-- 表的结构 `program`
--

CREATE TABLE IF NOT EXISTS `program` (
  `show_id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `start_time` datetime NOT NULL,
  `place` varchar(20) NOT NULL,
  `pro_comment` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `program`
--

INSERT INTO `program` (`show_id`, `name`, `start_time`, `place`, `pro_comment`) VALUES
(1, '《恋爱的犀牛》话剧', '2020-12-25 00:00:00', '蜂巢剧场', '空花');

-- --------------------------------------------------------

--
-- 表的结构 `ticket`
--

CREATE TABLE IF NOT EXISTS `ticket` (
  `id` int(11) NOT NULL,
  `site_place` varchar(20) NOT NULL,
  `price` int(10) NOT NULL,
  `tic_num` int(10) NOT NULL,
  `re_num` int(11) NOT NULL,
  `show_id` int(11) NOT NULL,
  `tic_comment` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ticket`
--

INSERT INTO `ticket` (`id`, `site_place`, `price`, `tic_num`, `re_num`, `show_id`, `tic_comment`) VALUES
(1, '内场1区', 1280, 100, 46, 1, 'null'),
(2, '外场1区', 680, 50, 5, 1, 'null');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_group`
--
ALTER TABLE `admin_group`
  ADD PRIMARY KEY (`group_id`),
  ADD KEY `listorder` (`listorder`);

--
-- Indexes for table `admin_group_access`
--
ALTER TABLE `admin_group_access`
  ADD UNIQUE KEY `uid_group_id` (`id`,`group_id`),
  ADD KEY `uid` (`id`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `admin_log`
--
ALTER TABLE `admin_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_menu`
--
ALTER TABLE `admin_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `listorder` (`list_order`),
  ADD KEY `parentid` (`parentid`);

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `client_log`
--
ALTER TABLE `client_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_order`
--
ALTER TABLE `client_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_users`
--
ALTER TABLE `client_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `program`
--
ALTER TABLE `program`
  ADD PRIMARY KEY (`show_id`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_group`
--
ALTER TABLE `admin_group`
  MODIFY `group_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `admin_log`
--
ALTER TABLE `admin_log`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1197;
--
-- AUTO_INCREMENT for table `admin_menu`
--
ALTER TABLE `admin_menu`
  MODIFY `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` mediumint(6) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `client_log`
--
ALTER TABLE `client_log`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=120;
--
-- AUTO_INCREMENT for table `client_order`
--
ALTER TABLE `client_order`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=58;
--
-- AUTO_INCREMENT for table `client_users`
--
ALTER TABLE `client_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `program`
--
ALTER TABLE `program`
  MODIFY `show_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
