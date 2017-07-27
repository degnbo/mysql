-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2017-07-27 13:36:05
-- 服务器版本： 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `yiicms`
--

-- --------------------------------------------------------

--
-- 表的结构 `ad`
--

CREATE TABLE IF NOT EXISTS `ad` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL DEFAULT '',
  `type` tinyint(4) DEFAULT '101' COMMENT '101 轮播图 102 友情链接',
  `category_id` int(11) DEFAULT '0',
  `image` varchar(255) NOT NULL DEFAULT '',
  `link` varchar(255) NOT NULL DEFAULT '',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `i-type-category` (`type`,`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `ad`
--

INSERT INTO `ad` (`id`, `title`, `type`, `category_id`, `image`, `link`, `created_at`, `updated_at`) VALUES
(1, '百度', 101, 0, '/uploads/ad-img/img_58500a3e1b241.jpg', 'http://www.baidu.com', 1481640510, 1481640673),
(2, '腾讯', 101, 0, '/uploads/ad-img/img_58500a67014d3.jpg', 'http://www.qq.com', 1481640551, 1481640751),
(3, '网易', 101, 0, '/uploads/ad-img/img_58500a8b4fb51.png', 'http://www.163.com', 1481640587, 1481640587);

-- --------------------------------------------------------

--
-- 表的结构 `admin_menu`
--

CREATE TABLE IF NOT EXISTS `admin_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL COMMENT '名字',
  `parent` int(11) DEFAULT NULL,
  `route` varchar(256) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `data` blob,
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

--
-- 转存表中的数据 `admin_menu`
--

INSERT INTO `admin_menu` (`id`, `name`, `parent`, `route`, `order`, `data`) VALUES
(1, '产品管理', NULL, '/backend/products/index', 0, 0x7b2269636f6e22203a2266612066612d7468227d),
(2, '产品分类', 1, '/backend/category/index?type=1', 1, NULL),
(3, '产品列表', 1, '/backend/products/index', 0, NULL),
(4, '新闻管理', NULL, '/backend/news/index', 1, 0x7b2269636f6e223a2266612066612d6e65777370617065722d6f227d),
(5, '新闻列表', 4, '/backend/news/index', 0, NULL),
(6, '新闻分类', 4, '/backend/category/index?type=2', 1, NULL),
(7, '下载管理', NULL, '/backend/downloads/index', 2, 0x7b2269636f6e223a2266612066612d646f776e6c6f6164227d),
(8, '下载列表', 7, '/backend/downloads/index', 0, NULL),
(9, '下载分类', 7, '/backend/category/index?type=3', 1, NULL),
(10, '照片管理', NULL, '/backend/photos/index', 4, 0x7b2269636f6e223a2266612066612d706963747572652d6f227d),
(11, '相册列表', 10, '/backend/photos/index', 0, NULL),
(12, '相册分类', 10, '/backend/category/index?type=4', 1, NULL),
(13, '用户反馈', NULL, '/backend/feedback/index', 5, 0x7b2269636f6e223a2266612066612d636f6d6d656e74696e67227d),
(14, '网站配置', NULL, '/backend/config/index', 6, 0x7b2269636f6e223a2266612066612d636f67227d),
(15, '基础配置', 14, '/backend/config/base-config', 1, NULL),
(16, '其他配置', 14, '/backend/config/index', 2, NULL),
(17, '轮播图片', 14, '/backend/ad/index', 3, NULL),
(18, '后台配置', NULL, '/backend/rbac/route/index', 7, 0x7b2269636f6e223a2266612066612d62617273227d),
(19, '管理员列表', 18, '/backend/admin-user/index', 1, NULL),
(20, '权限配置', 18, '/backend/rbac/assignment/index', 2, NULL),
(21, '角色列表', 18, '/backend/rbac/role/index', 3, NULL),
(22, '权限列表', 18, '/backend/rbac/permission/index', 4, NULL),
(23, '规则列表', 18, '/backend/rbac/rule/index', 5, NULL),
(24, '路由列表', 18, '/backend/rbac/route/index', 5, NULL),
(25, '后台菜单', 18, '/backend/rbac/menu/index', 7, NULL),
(26, '开发工具', NULL, '/gii/default/index', 8, 0x7b2269636f6e223a2266612066612d7368617265227d),
(27, 'gii', 26, '/gii/default/index', 2, NULL),
(28, 'debug', 26, '/debug/default/index', 1, NULL),
(29, '模板主题配置', 14, '/backend/config/view-config', 2, NULL),
(30, '页面管理', 14, '/backend/page/index', 7, NULL),
(31, '分类列表', NULL, '/backend/type/index', 1, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `admin_user`
--

CREATE TABLE IF NOT EXISTS `admin_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `access_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `u-username` (`username`),
  UNIQUE KEY `u-email` (`email`),
  UNIQUE KEY `u-password-reset-token` (`password_reset_token`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `admin_user`
--

INSERT INTO `admin_user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `access_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', '', '0192023a7bbd73250516f069df18b500', NULL, '739800600@qq.com', 10, '', 0, 1498894606),
(4, 'demo', '', 'fe01ce2a7fbac8fafaed7c982a04e229', NULL, 'demo@demo.com', 10, '', 1481431804, 1481431804);

-- --------------------------------------------------------

--
-- 表的结构 `auth_assignment`
--

CREATE TABLE IF NOT EXISTS `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('Administrator', '1', 1482897657),
('AdministratorAccess', '1', 1482897661),
('Visitor', '4', 1482897661),
('VisitorAccess', '4', 1482897661);

-- --------------------------------------------------------

--
-- 表的结构 `auth_item`
--

CREATE TABLE IF NOT EXISTS `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('/backend/*', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/ad/*', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/ad/create', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/ad/delete', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/ad/index', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/ad/update', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/ad/upload', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/ad/view', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/admin-user/*', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/admin-user/create', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/admin-user/delete', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/admin-user/index', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/admin-user/update', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/admin-user/upload', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/admin-user/view', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/category/*', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/category/create', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/category/delete', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/category/index', 2, NULL, NULL, NULL, 1482977677, 1482977677),
('/backend/category/index?type=1', 2, NULL, NULL, NULL, 1482977712, 1482977712),
('/backend/category/index?type=2', 2, NULL, NULL, NULL, 1482977717, 1482977717),
('/backend/category/index?type=3', 2, NULL, NULL, NULL, 1482977721, 1482977721),
('/backend/category/index?type=4', 2, NULL, NULL, NULL, 1482977728, 1482977728),
('/backend/category/update', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/category/upload', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/category/view', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/config/*', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/config/base-config', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/config/create', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/config/delete', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/config/index', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/config/update', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/config/upload', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/config/view', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/config/view-config', 2, NULL, NULL, NULL, 1483066838, 1483066838),
('/backend/default/*', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/default/edit-password', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/default/error', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/default/index', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/default/login', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/default/logout', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/downloads/*', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/downloads/create', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/downloads/delete', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/downloads/index', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/downloads/update', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/downloads/upload', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/downloads/view', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/feedback/*', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/feedback/delete', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/feedback/index', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/feedback/upload', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/feedback/view', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/news/*', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/news/create', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/news/delete', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/news/index', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/news/update', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/news/upload', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/news/view', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/page/*', 2, NULL, NULL, NULL, 1483164471, 1483164471),
('/backend/page/create', 2, NULL, NULL, NULL, 1483164471, 1483164471),
('/backend/page/delete', 2, NULL, NULL, NULL, 1483164471, 1483164471),
('/backend/page/index', 2, NULL, NULL, NULL, 1483164471, 1483164471),
('/backend/page/update', 2, NULL, NULL, NULL, 1483164471, 1483164471),
('/backend/page/upload', 2, NULL, NULL, NULL, 1483164471, 1483164471),
('/backend/page/view', 2, NULL, NULL, NULL, 1483164471, 1483164471),
('/backend/photos/*', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/photos/create', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/photos/delete', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/photos/edit-detail', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/photos/index', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/photos/update', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/photos/upload', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/photos/upload-photo', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/photos/view', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/products/*', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/products/create', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/products/delete', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/products/index', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/products/update', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/products/upload', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/products/view', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/rbac/*', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/rbac/assignment/*', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/rbac/assignment/assign', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/rbac/assignment/index', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/rbac/assignment/revoke', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/rbac/assignment/view', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/rbac/default/*', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/rbac/default/index', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/rbac/menu/*', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/rbac/menu/create', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/rbac/menu/delete', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/rbac/menu/index', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/rbac/menu/update', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/rbac/menu/view', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/rbac/permission/*', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/rbac/permission/assign', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/rbac/permission/create', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/rbac/permission/delete', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/rbac/permission/index', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/rbac/permission/remove', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/rbac/permission/update', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/rbac/permission/view', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/rbac/role/*', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/rbac/role/assign', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/rbac/role/create', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/rbac/role/delete', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/rbac/role/index', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/rbac/role/remove', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/rbac/role/update', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/rbac/role/view', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/rbac/route/*', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/rbac/route/assign', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/rbac/route/create', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/rbac/route/index', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/rbac/route/refresh', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/rbac/route/remove', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/rbac/rule/*', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/rbac/rule/create', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/rbac/rule/delete', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/rbac/rule/index', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/rbac/rule/update', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/rbac/rule/view', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/rbac/user/*', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/rbac/user/activate', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/rbac/user/change-password', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/rbac/user/delete', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/rbac/user/index', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/rbac/user/login', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/rbac/user/logout', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/rbac/user/request-password-reset', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/rbac/user/reset-password', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/rbac/user/signup', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/rbac/user/view', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/backend/type/add', 2, NULL, NULL, NULL, 1501141442, 1501141442),
('/backend/type/edit', 2, NULL, NULL, NULL, 1501141449, 1501141449),
('/backend/type/index', 2, NULL, NULL, NULL, 1501141216, 1501141216),
('/debug/*', 2, NULL, NULL, NULL, 1482977163, 1482977163),
('/debug/default/*', 2, NULL, NULL, NULL, 1482977163, 1482977163),
('/debug/default/db-explain', 2, NULL, NULL, NULL, 1482977163, 1482977163),
('/debug/default/download-mail', 2, NULL, NULL, NULL, 1482977163, 1482977163),
('/debug/default/index', 2, NULL, NULL, NULL, 1482977163, 1482977163),
('/debug/default/toolbar', 2, NULL, NULL, NULL, 1482977163, 1482977163),
('/debug/default/view', 2, NULL, NULL, NULL, 1482977163, 1482977163),
('/gii/*', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/gii/default/*', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/gii/default/action', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/gii/default/diff', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/gii/default/index', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/gii/default/preview', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('/gii/default/view', 2, NULL, NULL, NULL, 1482896720, 1482896720),
('Administrator', 1, '超级管理员', NULL, NULL, 1482896582, 1482898405),
('AdministratorAccess', 2, '超级管理员权限', NULL, NULL, 1482897169, 1482898428),
('Visitor', 1, '后台参观者', 'VisitorRule', NULL, 1482897794, 1482899002),
('VisitorAccess', 2, '浏览者权限，只读权限', 'VisitorRule', NULL, 1482897866, 1482898974);

-- --------------------------------------------------------

--
-- 表的结构 `auth_item_child`
--

CREATE TABLE IF NOT EXISTS `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `auth_item_child`
--

INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
('AdministratorAccess', '/backend/*'),
('VisitorAccess', '/backend/*'),
('AdministratorAccess', '/backend/ad/*'),
('VisitorAccess', '/backend/ad/*'),
('AdministratorAccess', '/backend/ad/create'),
('VisitorAccess', '/backend/ad/create'),
('AdministratorAccess', '/backend/ad/delete'),
('VisitorAccess', '/backend/ad/delete'),
('AdministratorAccess', '/backend/ad/index'),
('VisitorAccess', '/backend/ad/index'),
('AdministratorAccess', '/backend/ad/update'),
('VisitorAccess', '/backend/ad/update'),
('AdministratorAccess', '/backend/ad/upload'),
('VisitorAccess', '/backend/ad/upload'),
('AdministratorAccess', '/backend/ad/view'),
('VisitorAccess', '/backend/ad/view'),
('AdministratorAccess', '/backend/admin-user/*'),
('VisitorAccess', '/backend/admin-user/*'),
('AdministratorAccess', '/backend/admin-user/create'),
('VisitorAccess', '/backend/admin-user/create'),
('AdministratorAccess', '/backend/admin-user/delete'),
('VisitorAccess', '/backend/admin-user/delete'),
('AdministratorAccess', '/backend/admin-user/index'),
('VisitorAccess', '/backend/admin-user/index'),
('AdministratorAccess', '/backend/admin-user/update'),
('VisitorAccess', '/backend/admin-user/update'),
('AdministratorAccess', '/backend/admin-user/upload'),
('VisitorAccess', '/backend/admin-user/upload'),
('AdministratorAccess', '/backend/admin-user/view'),
('VisitorAccess', '/backend/admin-user/view'),
('AdministratorAccess', '/backend/category/*'),
('VisitorAccess', '/backend/category/*'),
('AdministratorAccess', '/backend/category/create'),
('VisitorAccess', '/backend/category/create'),
('AdministratorAccess', '/backend/category/delete'),
('VisitorAccess', '/backend/category/delete'),
('AdministratorAccess', '/backend/category/update'),
('VisitorAccess', '/backend/category/update'),
('AdministratorAccess', '/backend/category/upload'),
('VisitorAccess', '/backend/category/upload'),
('AdministratorAccess', '/backend/category/view'),
('VisitorAccess', '/backend/category/view'),
('AdministratorAccess', '/backend/config/*'),
('VisitorAccess', '/backend/config/*'),
('AdministratorAccess', '/backend/config/base-config'),
('VisitorAccess', '/backend/config/base-config'),
('AdministratorAccess', '/backend/config/create'),
('VisitorAccess', '/backend/config/create'),
('AdministratorAccess', '/backend/config/delete'),
('VisitorAccess', '/backend/config/delete'),
('AdministratorAccess', '/backend/config/index'),
('VisitorAccess', '/backend/config/index'),
('AdministratorAccess', '/backend/config/update'),
('VisitorAccess', '/backend/config/update'),
('AdministratorAccess', '/backend/config/upload'),
('VisitorAccess', '/backend/config/upload'),
('AdministratorAccess', '/backend/config/view'),
('VisitorAccess', '/backend/config/view'),
('AdministratorAccess', '/backend/config/view-config'),
('AdministratorAccess', '/backend/default/*'),
('VisitorAccess', '/backend/default/*'),
('AdministratorAccess', '/backend/default/edit-password'),
('VisitorAccess', '/backend/default/edit-password'),
('AdministratorAccess', '/backend/default/error'),
('VisitorAccess', '/backend/default/error'),
('AdministratorAccess', '/backend/default/index'),
('VisitorAccess', '/backend/default/index'),
('AdministratorAccess', '/backend/default/login'),
('VisitorAccess', '/backend/default/login'),
('AdministratorAccess', '/backend/default/logout'),
('VisitorAccess', '/backend/default/logout'),
('AdministratorAccess', '/backend/downloads/*'),
('VisitorAccess', '/backend/downloads/*'),
('AdministratorAccess', '/backend/downloads/create'),
('VisitorAccess', '/backend/downloads/create'),
('AdministratorAccess', '/backend/downloads/delete'),
('VisitorAccess', '/backend/downloads/delete'),
('AdministratorAccess', '/backend/downloads/index'),
('VisitorAccess', '/backend/downloads/index'),
('AdministratorAccess', '/backend/downloads/update'),
('VisitorAccess', '/backend/downloads/update'),
('AdministratorAccess', '/backend/downloads/upload'),
('VisitorAccess', '/backend/downloads/upload'),
('AdministratorAccess', '/backend/downloads/view'),
('VisitorAccess', '/backend/downloads/view'),
('AdministratorAccess', '/backend/feedback/*'),
('VisitorAccess', '/backend/feedback/*'),
('AdministratorAccess', '/backend/feedback/delete'),
('VisitorAccess', '/backend/feedback/delete'),
('AdministratorAccess', '/backend/feedback/index'),
('VisitorAccess', '/backend/feedback/index'),
('AdministratorAccess', '/backend/feedback/upload'),
('VisitorAccess', '/backend/feedback/upload'),
('AdministratorAccess', '/backend/feedback/view'),
('VisitorAccess', '/backend/feedback/view'),
('AdministratorAccess', '/backend/news/*'),
('VisitorAccess', '/backend/news/*'),
('AdministratorAccess', '/backend/news/create'),
('VisitorAccess', '/backend/news/create'),
('AdministratorAccess', '/backend/news/delete'),
('VisitorAccess', '/backend/news/delete'),
('AdministratorAccess', '/backend/news/index'),
('VisitorAccess', '/backend/news/index'),
('AdministratorAccess', '/backend/news/update'),
('VisitorAccess', '/backend/news/update'),
('AdministratorAccess', '/backend/news/upload'),
('VisitorAccess', '/backend/news/upload'),
('AdministratorAccess', '/backend/news/view'),
('VisitorAccess', '/backend/news/view'),
('AdministratorAccess', '/backend/photos/*'),
('VisitorAccess', '/backend/photos/*'),
('AdministratorAccess', '/backend/photos/create'),
('VisitorAccess', '/backend/photos/create'),
('AdministratorAccess', '/backend/photos/delete'),
('VisitorAccess', '/backend/photos/delete'),
('AdministratorAccess', '/backend/photos/edit-detail'),
('VisitorAccess', '/backend/photos/edit-detail'),
('AdministratorAccess', '/backend/photos/index'),
('VisitorAccess', '/backend/photos/index'),
('AdministratorAccess', '/backend/photos/update'),
('VisitorAccess', '/backend/photos/update'),
('AdministratorAccess', '/backend/photos/upload'),
('VisitorAccess', '/backend/photos/upload'),
('AdministratorAccess', '/backend/photos/upload-photo'),
('VisitorAccess', '/backend/photos/upload-photo'),
('AdministratorAccess', '/backend/photos/view'),
('VisitorAccess', '/backend/photos/view'),
('AdministratorAccess', '/backend/products/*'),
('VisitorAccess', '/backend/products/*'),
('AdministratorAccess', '/backend/products/create'),
('VisitorAccess', '/backend/products/create'),
('AdministratorAccess', '/backend/products/delete'),
('VisitorAccess', '/backend/products/delete'),
('AdministratorAccess', '/backend/products/index'),
('VisitorAccess', '/backend/products/index'),
('AdministratorAccess', '/backend/products/update'),
('VisitorAccess', '/backend/products/update'),
('AdministratorAccess', '/backend/products/upload'),
('VisitorAccess', '/backend/products/upload'),
('AdministratorAccess', '/backend/products/view'),
('VisitorAccess', '/backend/products/view'),
('AdministratorAccess', '/backend/rbac/*'),
('VisitorAccess', '/backend/rbac/*'),
('AdministratorAccess', '/backend/rbac/assignment/*'),
('VisitorAccess', '/backend/rbac/assignment/*'),
('AdministratorAccess', '/backend/rbac/assignment/assign'),
('VisitorAccess', '/backend/rbac/assignment/assign'),
('AdministratorAccess', '/backend/rbac/assignment/index'),
('VisitorAccess', '/backend/rbac/assignment/index'),
('AdministratorAccess', '/backend/rbac/assignment/revoke'),
('VisitorAccess', '/backend/rbac/assignment/revoke'),
('AdministratorAccess', '/backend/rbac/assignment/view'),
('VisitorAccess', '/backend/rbac/assignment/view'),
('AdministratorAccess', '/backend/rbac/default/*'),
('VisitorAccess', '/backend/rbac/default/*'),
('AdministratorAccess', '/backend/rbac/default/index'),
('VisitorAccess', '/backend/rbac/default/index'),
('AdministratorAccess', '/backend/rbac/menu/*'),
('VisitorAccess', '/backend/rbac/menu/*'),
('AdministratorAccess', '/backend/rbac/menu/create'),
('VisitorAccess', '/backend/rbac/menu/create'),
('AdministratorAccess', '/backend/rbac/menu/delete'),
('VisitorAccess', '/backend/rbac/menu/delete'),
('AdministratorAccess', '/backend/rbac/menu/index'),
('VisitorAccess', '/backend/rbac/menu/index'),
('AdministratorAccess', '/backend/rbac/menu/update'),
('VisitorAccess', '/backend/rbac/menu/update'),
('AdministratorAccess', '/backend/rbac/menu/view'),
('VisitorAccess', '/backend/rbac/menu/view'),
('AdministratorAccess', '/backend/rbac/permission/*'),
('VisitorAccess', '/backend/rbac/permission/*'),
('AdministratorAccess', '/backend/rbac/permission/assign'),
('VisitorAccess', '/backend/rbac/permission/assign'),
('AdministratorAccess', '/backend/rbac/permission/create'),
('VisitorAccess', '/backend/rbac/permission/create'),
('AdministratorAccess', '/backend/rbac/permission/delete'),
('VisitorAccess', '/backend/rbac/permission/delete'),
('AdministratorAccess', '/backend/rbac/permission/index'),
('VisitorAccess', '/backend/rbac/permission/index'),
('AdministratorAccess', '/backend/rbac/permission/remove'),
('VisitorAccess', '/backend/rbac/permission/remove'),
('AdministratorAccess', '/backend/rbac/permission/update'),
('VisitorAccess', '/backend/rbac/permission/update'),
('AdministratorAccess', '/backend/rbac/permission/view'),
('VisitorAccess', '/backend/rbac/permission/view'),
('AdministratorAccess', '/backend/rbac/role/*'),
('VisitorAccess', '/backend/rbac/role/*'),
('AdministratorAccess', '/backend/rbac/role/assign'),
('VisitorAccess', '/backend/rbac/role/assign'),
('AdministratorAccess', '/backend/rbac/role/create'),
('VisitorAccess', '/backend/rbac/role/create'),
('AdministratorAccess', '/backend/rbac/role/delete'),
('VisitorAccess', '/backend/rbac/role/delete'),
('AdministratorAccess', '/backend/rbac/role/index'),
('VisitorAccess', '/backend/rbac/role/index'),
('AdministratorAccess', '/backend/rbac/role/remove'),
('VisitorAccess', '/backend/rbac/role/remove'),
('AdministratorAccess', '/backend/rbac/role/update'),
('VisitorAccess', '/backend/rbac/role/update'),
('AdministratorAccess', '/backend/rbac/role/view'),
('VisitorAccess', '/backend/rbac/role/view'),
('AdministratorAccess', '/backend/rbac/route/*'),
('VisitorAccess', '/backend/rbac/route/*'),
('AdministratorAccess', '/backend/rbac/route/assign'),
('VisitorAccess', '/backend/rbac/route/assign'),
('AdministratorAccess', '/backend/rbac/route/create'),
('VisitorAccess', '/backend/rbac/route/create'),
('AdministratorAccess', '/backend/rbac/route/index'),
('VisitorAccess', '/backend/rbac/route/index'),
('AdministratorAccess', '/backend/rbac/route/refresh'),
('VisitorAccess', '/backend/rbac/route/refresh'),
('AdministratorAccess', '/backend/rbac/route/remove'),
('VisitorAccess', '/backend/rbac/route/remove'),
('AdministratorAccess', '/backend/rbac/rule/*'),
('VisitorAccess', '/backend/rbac/rule/*'),
('AdministratorAccess', '/backend/rbac/rule/create'),
('VisitorAccess', '/backend/rbac/rule/create'),
('AdministratorAccess', '/backend/rbac/rule/delete'),
('VisitorAccess', '/backend/rbac/rule/delete'),
('AdministratorAccess', '/backend/rbac/rule/index'),
('VisitorAccess', '/backend/rbac/rule/index'),
('AdministratorAccess', '/backend/rbac/rule/update'),
('VisitorAccess', '/backend/rbac/rule/update'),
('AdministratorAccess', '/backend/rbac/rule/view'),
('VisitorAccess', '/backend/rbac/rule/view'),
('AdministratorAccess', '/backend/rbac/user/*'),
('VisitorAccess', '/backend/rbac/user/*'),
('AdministratorAccess', '/backend/rbac/user/activate'),
('VisitorAccess', '/backend/rbac/user/activate'),
('AdministratorAccess', '/backend/rbac/user/change-password'),
('VisitorAccess', '/backend/rbac/user/change-password'),
('AdministratorAccess', '/backend/rbac/user/delete'),
('VisitorAccess', '/backend/rbac/user/delete'),
('AdministratorAccess', '/backend/rbac/user/index'),
('VisitorAccess', '/backend/rbac/user/index'),
('AdministratorAccess', '/backend/rbac/user/login'),
('VisitorAccess', '/backend/rbac/user/login'),
('AdministratorAccess', '/backend/rbac/user/logout'),
('VisitorAccess', '/backend/rbac/user/logout'),
('AdministratorAccess', '/backend/rbac/user/request-password-reset'),
('VisitorAccess', '/backend/rbac/user/request-password-reset'),
('AdministratorAccess', '/backend/rbac/user/reset-password'),
('VisitorAccess', '/backend/rbac/user/reset-password'),
('AdministratorAccess', '/backend/rbac/user/signup'),
('VisitorAccess', '/backend/rbac/user/signup'),
('AdministratorAccess', '/backend/rbac/user/view'),
('VisitorAccess', '/backend/rbac/user/view'),
('AdministratorAccess', '/debug/*'),
('AdministratorAccess', '/debug/default/*'),
('AdministratorAccess', '/debug/default/db-explain'),
('AdministratorAccess', '/debug/default/download-mail'),
('AdministratorAccess', '/debug/default/index'),
('AdministratorAccess', '/debug/default/toolbar'),
('AdministratorAccess', '/debug/default/view'),
('AdministratorAccess', '/gii/*'),
('AdministratorAccess', '/gii/default/*'),
('AdministratorAccess', '/gii/default/action'),
('AdministratorAccess', '/gii/default/diff'),
('AdministratorAccess', '/gii/default/index'),
('AdministratorAccess', '/gii/default/preview'),
('AdministratorAccess', '/gii/default/view');

-- --------------------------------------------------------

--
-- 表的结构 `auth_rule`
--

CREATE TABLE IF NOT EXISTS `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `auth_rule`
--

INSERT INTO `auth_rule` (`name`, `data`, `created_at`, `updated_at`) VALUES
('VisitorRule', 'O:36:"app\\modules\\backend\\rbac\\VisitorRule":3:{s:4:"name";s:11:"VisitorRule";s:9:"createdAt";i:1482898941;s:9:"updatedAt";i:1482898941;}', 1482898941, 1482898941);

-- --------------------------------------------------------

--
-- 表的结构 `beidou_article`
--

CREATE TABLE IF NOT EXISTS `beidou_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章id',
  `type_id` int(11) NOT NULL DEFAULT '0' COMMENT '类型id',
  `cate_id` int(10) unsigned NOT NULL COMMENT '栏目id',
  `is_show` enum('1','2') NOT NULL DEFAULT '1' COMMENT '是否显示',
  `is_rec` enum('1','2') NOT NULL DEFAULT '1' COMMENT '是否推荐',
  `is_hot` enum('1','2') NOT NULL DEFAULT '1',
  `addtime` int(10) unsigned NOT NULL COMMENT '添加时间',
  `uptime` int(10) unsigned NOT NULL COMMENT '修改时间',
  `title` varchar(30) NOT NULL COMMENT '文章标题',
  `des` varchar(500) NOT NULL COMMENT '文章描述',
  `keywords` varchar(100) NOT NULL COMMENT '文章关键字',
  `alias` varchar(30) NOT NULL COMMENT '标题别名',
  `content` text NOT NULL COMMENT '文章内容',
  `hits` int(11) NOT NULL DEFAULT '0' COMMENT '点击量',
  `author` varchar(20) NOT NULL DEFAULT 'author' COMMENT '作者/发布者',
  `sort_num` mediumint(9) NOT NULL COMMENT '排序',
  `logo` varchar(100) NOT NULL COMMENT '文章logo',
  `thumb_logo` varchar(100) NOT NULL COMMENT '缩略logo',
  `model_name` varchar(50) NOT NULL DEFAULT 'Article' COMMENT '模块名称',
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `url` text NOT NULL COMMENT '图集路径',
  `url_name` text NOT NULL COMMENT '图集名称',
  `colorval` varchar(100) NOT NULL COMMENT '颜色值',
  `boldval` varchar(100) NOT NULL COMMENT '粗体值',
  `cid` int(11) NOT NULL COMMENT '课程分类id',
  PRIMARY KEY (`id`),
  KEY `hits` (`hits`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `beidou_article`
--

INSERT INTO `beidou_article` (`id`, `type_id`, `cate_id`, `is_show`, `is_rec`, `is_hot`, `addtime`, `uptime`, `title`, `des`, `keywords`, `alias`, `content`, `hits`, `author`, `sort_num`, `logo`, `thumb_logo`, `model_name`, `width`, `height`, `url`, `url_name`, `colorval`, `boldval`, `cid`) VALUES
(1, 1, 0, '1', '1', '2', 1476544025, 1476500819, '颁发的建筑装饰工程施工贰级资质', '界拓自由潜水学院荣幸地邀请到AIDA国际自由潜水发展协会.教育长官JP Francois先生来京开展为期3天的AIDA自由潜水国际裁判课程。我们见证了30名来自全国各地的自由潜水员参加学习。我们深信，随着中国自由潜水运动地蓬勃发展。', '', '是室内装修精品', '&lt;p&gt;&lt;img src=&quot;http://zyqs.qmchina.net/Public/umeditor1_2_2-utf8-php/php/upload/20161016/14766047869641.jpg&quot; _src=&quot;http://zyqs.qmchina.net/Public/umeditor1_2_2-utf8-php/php/upload/20161016/14766047869641.jpg&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(102, 102, 102); line-height: 25px; text-indent: 2em; font-family: 微软雅黑; font-size: 12px; white-space: normal; widows: 1;&quot;&gt;策展人班夫合伙人牧野表示，这组《融入深蓝》作品历时一个半月创作完成，希望通过拍摄人与自然之间的和谐美好，让更多的人知道用正确的方式和大自然相处，开始保护和热爱大自然。希望班夫中国和蜂鸟网能够在潜水领域展开更多的合作。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(102, 102, 102); line-height: 25px; text-indent: 2em; font-family: 微软雅黑; font-size: 12px; white-space: normal; widows: 1;&quot;&gt;摄影师宋刚说到拍摄初衷是想把人和自然的和谐状态呈现给大家。只有你勇敢的去跟大自然接触、去尝试去感受它们的生活环境，你会知道大自然给予我们人类的东西是多么的美好。同时，宋刚希望成为蜂鸟网原动力计划的签约摄影师，与蜂鸟网展开更深层次的合作。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 20px; padding: 0px; color: rgb(102, 102, 102); line-height: 25px; text-indent: 2em; font-family: 微软雅黑; font-size: 12px; white-space: normal; widows: 1;&quot;&gt;最后，大家就创作与更多合作的可能性彼此交流意见。蜂鸟网为摄影师及爱好者提供线上蜂鸟论坛和线下蜂鸟影像艺术空间的线上线下一体化展示平台，希望能与更多优秀摄影师深度合作，制造中国的影像原动力。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 45, 'author', 1, '/Public/Uploads/kindeditor/truefile/20161107/20161107171040_38924.jpg', '/Public/Uploads/kindeditor/truefile/20161107/thumb_20161107171040_38924.jpg', 'Article', 20, 20, '', '', '', '', 9),
(2, 1, 0, '1', '1', '1', 1476546302, 1476909971, '泰国七大旅游海域从2017年1月20日起无限期关闭', '界拓自由潜水学院荣幸地邀请到AIDA国际自由潜水发展协会.教育长官JP Francois先生来京开展为期3天的AIDA自由潜水国际裁判课程。我们见证了30名来自全国各地的自由潜水员参加学习。我们深信，随着中国自由潜水运动地蓬勃发展。', '', '恒国泰始略指导', '&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(102, 102, 102); line-height: 25px; text-indent: 2em; font-family: 微软雅黑; font-size: 12px; white-space: normal; widows: 1;&quot;&gt;深蓝色的海洋充满了无限的可能，未知、纯净、恐惧、奇幻这些关键词都无法形容宋刚的影像作品，在他的作品中，一种与海洋接触、融入海洋的力量弥漫开来。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(102, 102, 102); line-height: 25px; text-indent: 2em; font-family: 微软雅黑; font-size: 12px; white-space: normal; widows: 1;&quot;&gt;2016年5月30日下午，由蜂鸟网、蜂鸟·圣点影像艺术空间主办，班夫中国联合主办的《融入深蓝——宋刚水下摄影展》在北京798艺术区蜂鸟圣点影像艺术空间举行。此次《融入深蓝》摄影作品展的主旨，在于通过摄影镜头向大众展示海底世界的神秘之美，以及呼吁全人类善待海洋生物，关注受到威胁的海洋环境。&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://zyqs.qmchina.net/Public/umeditor1_2_2-utf8-php/php/upload/20161016/14765978244418.jpg&quot; _src=&quot;http://zyqs.qmchina.net/Public/umeditor1_2_2-utf8-php/php/upload/20161016/14765978244418.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-family: 微软雅黑; font-size: 12px; line-height: 25px; text-indent: 24px; white-space: normal; widows: 1;&quot;&gt;开幕式上，蜂鸟网CEO欧阳潼舢表示，随着潜水运动的风靡，蜂鸟潜水论坛板块优秀摄影师和作品层出不穷，我们率先与极具创造力和想象力的摄影师宋刚合作，进行《融入深蓝》作品首发。并透露，自2015年以来，蜂鸟网大力投入摄影的后市场建设，先后推出在线摄影培训平台、二手摄影器材鉴定担保平台、专业的摄影后期输出平台蜂鸟印，以及线下蜂鸟圣点影像艺术空间。2016年蜂鸟网将启动影像原动力计划，旨在从器材的赞助、媒体的传播、图书的出版到线下的影赛、影展等方面，为青年摄影师提供一站式的影像服务平台。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-family: 微软雅黑; font-size: 12px; line-height: 25px; text-indent: 24px; white-space: normal; widows: 1;&quot;&gt;&lt;img src=&quot;http://zyqs.qmchina.net/Public/umeditor1_2_2-utf8-php/php/upload/20161016/14765978478702.jpg&quot; _src=&quot;http://zyqs.qmchina.net/Public/umeditor1_2_2-utf8-php/php/upload/20161016/14765978478702.jpg&quot;/&gt;&lt;/span&gt;&lt;/p&gt;', 40, '', 2, '/Public/Uploads/kindeditor/truefile/20161107/20161107095524_72457.jpg', '', 'Article', 0, 0, '', '', '', '', 4),
(3, 2, 0, '1', '1', '2', 1476598084, 1476554884, '感受海底屏息的魅力 专访水下摄影师宋刚团队', '界拓自由潜水学院荣幸地邀请到AIDA国际自由潜水发展协会.教育长官JP Francois先生来京开展为期3天的AIDA自由潜水国际裁判课程。我们见证了30名来自全国各地的自由潜水员参加学习。我们深信，随着中国自由潜水运动地蓬勃发展。', '', '', '&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(102, 102, 102); line-height: 25px; text-indent: 2em; font-family: 微软雅黑; font-size: 12px; white-space: normal; widows: 1;&quot;&gt;深蓝色的海洋充满了无限的可能，未知、纯净、恐惧、奇幻这些关键词都无法形容宋刚的影像作品，在他的作品中，一种与海洋接触、融入海洋的力量弥漫开来。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(102, 102, 102); line-height: 25px; text-indent: 2em; font-family: 微软雅黑; font-size: 12px; white-space: normal; widows: 1;&quot;&gt;2016年5月30日下午，由蜂鸟网、蜂鸟·圣点影像艺术空间主办，班夫中国联合主办的《融入深蓝——宋刚水下摄影展》在北京798艺术区蜂鸟圣点影像艺术空间举行。此次《融入深蓝》摄影作品展的主旨，在于通过摄影镜头向大众展示海底世界的神秘之美，以及呼吁全人类善待海洋生物，关注受到威胁的海洋环境。&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://zyqs.qmchina.net/Public/umeditor1_2_2-utf8-php/php/upload/20161016/14765980569979.jpg&quot; _src=&quot;http://zyqs.qmchina.net/Public/umeditor1_2_2-utf8-php/php/upload/20161016/14765980569979.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-family: 微软雅黑; font-size: 12px; line-height: 25px; text-indent: 24px; white-space: normal; widows: 1;&quot;&gt;开幕式上，蜂鸟网CEO欧阳潼舢表示，随着潜水运动的风靡，蜂鸟潜水论坛板块优秀摄影师和作品层出不穷，我们率先与极具创造力和想象力的摄影师宋刚合作，进行《融入深蓝》作品首发。并透露，自2015年以来，蜂鸟网大力投入摄影的后市场建设，先后推出在线摄影培训平台、二手摄影器材鉴定担保平台、专业的摄影后期输出平台蜂鸟印，以及线下蜂鸟圣点影像艺术空间。2016年蜂鸟网将启动影像原动力计划，旨在从器材的赞助、媒体的传播、图书的出版到线下的影赛、影展等方面，为青年摄影师提供一站式的影像服务平台。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-family: 微软雅黑; font-size: 12px; line-height: 25px; text-indent: 24px; white-space: normal; widows: 1;&quot;&gt;&lt;img src=&quot;http://web.jietuo.com/Public/umeditor1_2_2-utf8-php/php/upload/20161016/14765980814877.jpg&quot; _src=&quot;http://web.jietuo.com/Public/umeditor1_2_2-utf8-php/php/upload/20161016/14765980814877.jpg&quot;/&gt;&lt;/span&gt;&lt;/p&gt;', 58, '', 4, '/Public/Uploads/kindeditor/truefile/20161016/20161019091200_19398.jpg', '', 'Article', 0, 0, '', '', '', '', 7),
(4, 2, 0, '1', '1', '1', 1476598864, 1476555664, '颁发的建筑装饰工程施工贰级资质、蜂鸟网发力潜水摄影 首发宋刚', '界拓自由潜水学院荣幸地邀请到AIDA国际自由潜水发展协会.教育长官JP Francois先生来京开展为期3天的AIDA自由潜水国际裁判课程。我们见证了30名来自全国各地的自由潜水员参加学习。我们深信，随着中国自由潜水运动地蓬勃发展。', '', '', '&lt;p&gt;&lt;img src=&quot;http://zyqs.qmchina.net/Public/umeditor1_2_2-utf8-php/php/upload/20161016/1476604882704.jpg&quot; _src=&quot;http://zyqs.qmchina.net/umeditor1_2_2-utf8-php/php/upload/20161016/1476604882704.jpg&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(102, 102, 102); line-height: 25px; text-indent: 2em; font-family: 微软雅黑; font-size: 12px; white-space: normal; widows: 1;&quot;&gt;深蓝色的海洋充满了无限的可能，未知、纯净、恐惧、奇幻这些关键词都无法形容宋刚的影像作品，在他的作品中，一种与海洋接触、融入海洋的力量弥漫开来。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(102, 102, 102); line-height: 25px; text-indent: 2em; font-family: 微软雅黑; font-size: 12px; white-space: normal; widows: 1;&quot;&gt;2016年5月30日下午，由蜂鸟网、蜂鸟·圣点影像艺术空间主办，班夫中国联合主办的《融入深蓝——宋刚水下摄影展》在北京798艺术区蜂鸟圣点影像艺术空间举行。此次《融入深蓝》摄影作品展的主旨，在于通过摄影镜头向大众展示海底世界的神秘之美，以及呼吁全人类善待海洋生物，关注受到威胁的海洋环境。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 32, '', 3, '/Public/Uploads/kindeditor/truefile/20161107/20161107172626_49847.jpg', '/Public/Uploads/kindeditor/truefile/20161107/thumb_20161107172626_49847.jpg', 'Article', 50, 50, '', '', '', '', 5),
(5, 1, 0, '1', '1', '2', 1476601180, 1476557980, 'AIDA自由潜水国际裁判课程', '界拓自由潜水学院荣幸地邀请到AIDA国际自由潜水发展协会.教育长官JP Francois先生来京开展为期3天的AIDA自由潜水国际裁判课程。我们见证了30名来自全国各地的自由潜水员参加学习。我们深信，随着中国自由潜水运动地蓬勃发展。', '', '', '&lt;p&gt;&lt;img src=&quot;http://zyqs.qmchina.net/Public/umeditor1_2_2-utf8-php/php/upload/20161016/14766024156447.jpg&quot; _src=&quot;http://zyqs.qmchina.net/Public/umeditor1_2_2-utf8-php/php/upload/20161016/14766024156447.jpg&quot;/&gt;&lt;/p&gt;', 53, '', 5, '/Public/Uploads/kindeditor/truefile/20160930/20161019102325_17885.jpg', '/Public/Uploads/kindeditor/truefile/20160930/thumb_20161019102325_17885.jpg', 'Article', 0, 0, '', '', '#CC3399', '', 3);

-- --------------------------------------------------------

--
-- 表的结构 `beidou_type`
--

CREATE TABLE IF NOT EXISTS `beidou_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '类型id',
  `tname` varchar(30) NOT NULL COMMENT '类型名称',
  `cate_id` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `beidou_type`
--

INSERT INTO `beidou_type` (`id`, `tname`, `cate_id`) VALUES
(1, '新闻中心', 1),
(2, '最新活动', 1);

-- --------------------------------------------------------

--
-- 表的结构 `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '分类名',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父id',
  `path` varchar(50) NOT NULL DEFAULT '0' COMMENT '完整的父id 用/分开',
  `type` tinyint(4) NOT NULL COMMENT '1.news 2 products 3 download 4 photo',
  `image` varchar(255) DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `i-type-pid` (`type`,`pid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `category`
--

INSERT INTO `category` (`id`, `name`, `pid`, `path`, `type`, `image`, `description`, `keywords`, `created_at`, `updated_at`) VALUES
(1, '产品分类一', 0, '', 2, '', '', '', 1481360463, 1481452810),
(2, '默认分类', 0, '', 1, '', '', '', 1481367786, 1481367944),
(3, '新闻分类2', 2, '', 1, '', '', '', 1481372394, 1481372772),
(4, '产品分类二', 0, '', 2, '', '', '', 1481609361, 1481609361),
(5, '下载文档', 0, '', 3, '/uploads/products-img/img_59228cddd2280.gif', 'fdf', 'sfd', 1482155225, 1495436509),
(6, '企业环境', 0, '', 4, '', '', '', 1482559711, 1482559711);

-- --------------------------------------------------------

--
-- 表的结构 `config`
--

CREATE TABLE IF NOT EXISTS `config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '字段名英文',
  `label` varchar(50) DEFAULT NULL COMMENT '字段标注',
  `value` varchar(255) NOT NULL DEFAULT '' COMMENT '字段值',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `iu-name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `config`
--

INSERT INTO `config` (`id`, `name`, `label`, `value`, `created_at`, `updated_at`) VALUES
(2, 'contact_us', '联系我们', '<p>公司: 在北京网络科技</p><p>联系人: 李</p><p>QQ: 739800600</p><p>电话: 1304351</p><p>E-mail: 739800600@qq.com</p><p>地址: 北京市丰台区大红门</p>', 1481350005, 1482902162),
(3, 'contact_us_page_id', '联系我们', '1', 1481355647, 1483169811);

-- --------------------------------------------------------

--
-- 表的结构 `content`
--

CREATE TABLE IF NOT EXISTS `content` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '类型1news,2product3photo',
  `category_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '缩略图',
  `description` varchar(255) NOT NULL DEFAULT '',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0不显示1显示',
  `admin_user_id` int(11) NOT NULL DEFAULT '0',
  `hits` int(11) NOT NULL DEFAULT '0' COMMENT '浏览数点击数',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `logo` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `i-type-status-title` (`type`,`status`,`title`),
  KEY `i-update` (`updated_at`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

--
-- 转存表中的数据 `content`
--

INSERT INTO `content` (`id`, `title`, `type`, `category_id`, `image`, `description`, `keywords`, `status`, `admin_user_id`, `hits`, `created_at`, `updated_at`, `logo`) VALUES
(1, '测试1', 1, 0, '', '测试测试222', '', 1, 0, 1, 0, 1481269292, ''),
(7, '新闻2', 1, 3, '', '吃豆腐的房地产', '', 0, 0, 0, 1481264976, 1481379895, ''),
(9, 'dfdsfadfdsfdsfds', 1, 0, '', 'dfsdds', '', 0, 0, 0, 1481265228, 1481265228, ''),
(10, 'dfsdfds312321的所得税法', 1, 0, '', '的范德萨发的', '', 0, 1, 0, 1481265362, 1481265362, ''),
(11, '测试你好', 1, 0, '', '三大市场', '', 1, 1, 2, 1481265454, 1481265454, ''),
(13, 'sdfdsvds', 1, 0, '', 'dsfadsfdsa adfdasfd', '', 0, 1, 0, 1481265650, 1481265650, ''),
(14, 'dfsdfds312321的所得税法dsfdsf', 1, 0, '', 'fdsdsfsdfds', '', 0, 1, 0, 1481268136, 1481268136, ''),
(15, '测试测试测试', 1, 0, '', '测试测试222', '', 0, 1, 0, 1481268506, 1481268506, ''),
(16, '电风扇的范德萨', 1, 0, '', '东方闪电', '', 0, 1, 0, 1481268645, 1481268645, ''),
(17, 'ceshi', 1, 2, '', '测试', '', 1, 1, 3, 1481294417, 1482486244, ''),
(18, '测试测试', 1, 0, '', '测试3333333', '', 1, 1, 1, 1481294436, 1481294436, ''),
(19, '测试测试测试', 1, 2, '', '测试测试', '', 1, 1, 2, 1481294458, 1482120320, ''),
(20, '德国代购2016 Marc Jacobs/马克·雅可布 女士撞色皮质直板钱包', 2, 1, '', '<p>德国代购2016 Marc Jacobs/马克·雅可布 女士撞色皮质直板钱包</p>', '', 1, 1, 0, 1481455753, 1482071209, ''),
(21, '测试测试', 2, 1, '/uploads/products-img/img_584d571075916.jpg', '测试', '', 1, 1, 0, 1481463544, 1481552670, ''),
(22, '测试测试测试', 2, 1, '/uploads/products-img/img_584d57438ddb0.jpg', '测试测试测试', '', 1, 1, 1, 1481463619, 1481463619, ''),
(23, '测试产品22222222222222', 2, 1, '/uploads/products-img/img_584d5d65a0855.jpg', '测试产品', '', 1, 1, 0, 1481465189, 1481465189, ''),
(24, '飒飒的范德萨范德萨似懂非懂是', 2, 1, '/uploads/products-img/img_58575c9b83b7b.png', '<p>似懂非懂是付的是</p><p><br></p>', '', 1, 1, 0, 1481465708, 1482120751, ''),
(25, '美国代购2016 MOTHER 女士磨边牛仔裤', 2, 1, '/uploads/products-img/img_584eb27571659.jpg', '重度磨损和猫须褶皱为这款褪色 MOTHER 牛仔裤带来做旧效果。5 口袋设计。钮扣和拉链门襟。', '', 1, 1, 1, 1481552501, 1481552688, ''),
(26, '关于公司考勤制度', 3, 5, '', '<p>关于公司考勤制度</p>', '', 1, 1, 0, 1482155706, 1482157422, ''),
(27, '测试', 3, 5, '', '', '', 0, 1, 0, 1482200020, 1500109412, ''),
(28, '继承测试', 1, 2, '', '继承测试', '', 1, 1, 4, 1482291369, 1482291661, ''),
(29, '产品继承测试', 2, 1, '/uploads/products-img/img_5969da1a1c6b0.png', '', '', 1, 1, 6, 1482291398, 1500109338, ''),
(30, '办公环境', 4, 6, '', '', '', 1, 1, 0, 1482560413, 1482560413, ''),
(31, '测试相册', 4, 6, '/uploads/photos/31/img_585f8410249c6.jpg', '测试', '测试', 1, 1, 0, 1482654720, 1500109489, '');

-- --------------------------------------------------------

--
-- 表的结构 `content_detail`
--

CREATE TABLE IF NOT EXISTS `content_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `content_id` int(11) NOT NULL,
  `detail` text NOT NULL,
  `params` varchar(1000) NOT NULL DEFAULT '',
  `file_url` varchar(255) NOT NULL DEFAULT '',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `i-content` (`content_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

--
-- 转存表中的数据 `content_detail`
--

INSERT INTO `content_detail` (`id`, `content_id`, `detail`, `params`, `file_url`, `created_at`, `updated_at`) VALUES
(1, 1, '测试detail,123232,45454545', '', '', 1481264096, 1481269292),
(3, 7, '测试测试', '', '', 1481264976, 1481379895),
(4, 9, 'dsfdsfdsfdsfdsdfsdfds', '', '', 1481265228, 1481265228),
(5, 10, '打算vdsvdsdsfadf是打发第三方打发第三方', '', '', 1481265362, 1481265362),
(6, 11, '是的撒FDSAD', '', '', 1481265454, 1481265454),
(7, 13, 'dfadsfda', '', '', 1481265650, 1481265650),
(8, 14, 'dsfdsfdsfdsfds', '', '', 1481268136, 1481268136),
(9, 15, '电风扇的范德萨发生的', '', '', 1481268506, 1481268506),
(10, 16, '大多数是范德萨', '', '', 1481268645, 1481268645),
(11, 17, '<p><img src="/uploads/redactor-img/1/892f7f6043-9c1ab2f5-f848-4e09-bb3e-9b10c2938520.png" alt="892f7f6043-9c1ab2f5-f848-4e09-bb3e-9b10c2938520.png"/>测试测试</p>', '', '', 1481294417, 1482486244),
(12, 18, '测试测试测试', '', '', 1481294436, 1481294436),
(13, 19, '<p>水电费的所得税法</p><p><img src="/uploads/redactor-img/1/892f7f6043-9c1ab2f5-f848-4e09-bb3e-9b10c2938520.png"></p><p><br></p><p><img></p>', '', '', 1481294458, 1482120320),
(14, 20, '<p><img></p><p><img src="/uploads/redactor-img/1/3c779817e7-9c1ab2f5-f848-4e09-bb3e-9b10c2938520.png"></p><p><img></p><p><img></p><p>发货相关问题</p><p>SEND ABOUT</p><p>购买来源：本店所有商品均为海外购，所有海外购商品均从（美国、欧洲、香港）正品专柜、官网、百货公司购买，正品保证，请放心选购。</p><p>邮寄方式：本店商品均为海外直发，欧洲商家一般经由我们香港仓、澳门仓等中转再转发国内快递发往您；美国商家一般采用美国直邮方式到国内自动转为EMS直接发往您。</p><p>物流显示：因淘宝物流显示问题，本店商品到达国内才会转为发货状态并显示国内物流单号。一般商品到货时间为2-4周。因而当您的订单淘宝未显示发货，请不要心急，商品都在正常国际运输中，我们全程为您监控物流进程，如有异常会及时通知您。如有疑问，可以咨询在线客服，请勿催单哦！</p><p>特别提醒：以上发货及运送时间均为理论时效，但偶有意外如恶劣天气、清关延误、节假日等国际物流的不确定因素请理性看待。</p><p>退换货政策详解</p><p>RETURN POLICY</p><p>商品签收： 确认签收前，请务必 本人签收 ，并当场拍照验货。如遇 严重质量问题或商品错发 请保留商品问题照片及物流签收有效凭证联系 在线客服处理。 如签收后发现严重质量问题请在签收时间起 48小时内 联系处理， 过后恕不负责，且需保持商品完好无损 （产品包装、吊牌、配件保持原样情况下）。 本店不接受任何形式的拒收 ，如因拒收产生一切后果由收件人负责。</p><p>退换说明： 本店不支持退换货，除严重商品质量问题和商品错发外。</p><p>码数、型号、颜色、款式、均由顾客自行决定，客服建议只供参考，不对此负责，不作为退换货理由。</p><p>所有主观原因(但不限于)：面料与想象有差距，例如厚薄或透明度、手感软硬等。不适合自己、穿上不好看、没想象中漂亮。个人认为做工不好等。细微瑕疵、线头、不明显或可去除的画粉痕迹、极好处理的小脱线，存在于鞋底的污迹或刮痕，不明显处的走线不直、偶尔有烫钻装饰的脱落、细微的印花脱落开裂、羽毛制品轻量掉毛，因运输造成的不平整或皱折、不同显示器解析度和颜色质量造成的网上图片与实物颜色存在一定色差、主观认为不是正品等，均不属于质量问题，不支持退换货。</p><p>退货地址：由于我公司为海外公司，商品均为海外直发， 退货需退回指定的海外物流仓库，详情请咨询在线客服。若因寄到非指定的退货地址，造成商品退换货失败，客户需自行承担后果。</p><p>差价问题：关于打折商品购买之后再度打折，或原来价格商品购买之后打折的情况，本店不退差价。</p><p>关税问题：  如遇海关查验，按照海关规定，收件人为办理清关和交纳税金的责任人。 税金产生后无法办理退货退款 。 为保证清关的顺利， 请填写收件人姓名的时候务必使用真实姓名 ，如使用假名将无法正常完成清关，导致扣件等情况，一切后果将由收件人承担。</p><p>如协商一致退货，请务必遵守如下规则：</p><p>本店不接受未经沟通自主邮寄包裹的退换货，如自行邮寄一律拒收。</p><p>本店不接受任何到付件，寄送包裹需要亲先行垫付邮费。</p><p>请务必保持退货商品的标签吊牌包装等的商品完整性。</p><p>寄出包裹后，请联系客服告知物流公司和运单号码，方便客服查询。</p>', '', '', 1481455753, 1482071209),
(15, 21, 'sadsadsadasdas122333333', '', '', 1481463544, 1481552670),
(16, 22, '测试测试测试', '', '', 1481463619, 1481463619),
(17, 23, '测试测试测试', '', '', 1481465189, 1481465189),
(18, 24, '<p>sdsadsadasdsaasdsadcas</p><p><img src="/uploads/redactor-img/1/99ebc906c2-a165a89a-83d3-4882-948c-a551be1bb769.jpg"></p>', '', '', 1481465708, 1482120751),
(19, 25, '商品由美国百货公司发货，下单即采购。约1~2周到货。\r\n商品货号：s1569032116\r\n商品说明：\r\n重度磨损和猫须褶皱为这款褪色 MOTHER 牛仔裤带来做旧效果。5 口袋设计。钮扣和拉链门襟。\r\n\r\n面料: 弹性牛仔布。\r\n98% 棉 / 2% 弹性纤维。\r\n冷水洗涤。\r\n美国制造。\r\n进口面料。\r\n\r\n尺寸\r\n裆高: 9.75 英寸 / 25 厘米\r\n裤子内长: 28.75 英寸 / 73 厘米\r\n裤脚口: 11.75 英寸 / 30 厘米\r\n所列尺寸以 27 号为标准 2010 年，受到突破传统牛仔裤的启发，业内专家 Lela Tillem (Citizens of Humanity) 和 Tim Kaeding (7 For All Mankind) 推出了 MOTHER 牛仔服饰：精致裁剪、超软织物的奢华牛仔裤系列。MOTHER 牛仔裤将显长腿部的外型、创新的水洗工艺、完美的修身效果和令人难以置信的舒适感融入到高度演变的奢华牛仔系列中。这款高级牛仔裤适合并修饰各种体型。 查看所有 MOTHER 的评论\r\n售后服务：香港仓库收到日期计起30天可以申请退换货,final sale不退不换,商家运费$35\r\n最后更新：2016-10-27 22:03', '', '', 1481552501, 1481552688),
(20, 26, '<p>关于公司考勤制度</p>', '', '/uploads/downloads/yiicms5857e77c7167d.zip', 1482155706, 1482157422),
(21, 27, '<p>测试测试<span class="redactor-invisible-space">测试<span class="redactor-invisible-space">测试<span class="redactor-invisible-space">测试<span class="redactor-invisible-space">测试<span class="redactor-invisible-space"></span></span></span></span></span></p>', '', '/uploads/downloads/yiicms5969da6468588.zip', 1482200020, 1500109412),
(22, 28, '<p>继承测试</p>', '', '', 1482291369, 1482291661),
(23, 29, '<p>产品继承</p>', '<p>产品继承</p>', '', NULL, 1500109338),
(24, 30, 'dd', '', '/uploads/photos/30/img_585e2a68b0fe2.jpg', 1482566248, 1495251163),
(25, 30, '', '', '/uploads/photos/30/img_585e2abda64a2.jpg', 1482566333, 1482566333),
(26, 30, '', '', '/uploads/photos/30/img_585f60a17b4fa.jpg', 1482645665, 1482645665),
(27, 30, '', '', '/uploads/photos/30/img_585f60a888c8a.jpg', 1482645672, 1482645672),
(28, 30, '', '', '/uploads/photos/30/img_585f60bbb3340.jpg', 1482645691, 1482645691),
(29, 30, '', '', '/uploads/photos/30/img_585f73b9d439b.jpg', 1482650553, 1482650553),
(30, 30, '', '', '/uploads/photos/30/img_585f7414e39c8.jpg', 1482650644, 1482650644),
(31, 30, '', '', '/uploads/photos/30/img_585f7a31d66e1.jpg', 1482652209, 1482652209),
(32, 30, '', '', '/uploads/photos/30/img_585f7a84578d6.jpg', 1482652292, 1482652292),
(33, 30, '', '', '/uploads/photos/30/img_585f7afeb8410.jpg', 1482652414, 1482652414),
(34, 30, '', '', '/uploads/photos/30/img_585f7c8f432bd.png', 1482652815, 1482652815),
(35, 30, '', '', '/uploads/photos/30/img_585f7cabe31fd.jpg', 1482652843, 1482652843),
(36, 31, 'ceshi', '', '/uploads/photos/31/img_585f8410249c6.jpg', 1482654736, 1482913682),
(37, 31, '测试2', '', '/uploads/photos/31/img_585f84183ea3b.jpg', 1482654744, 1482822674),
(38, 31, 'ceshi34', '', '/uploads/photos/31/img_585f8410249c6.jpg', 1482655165, 1482913687);

-- --------------------------------------------------------

--
-- 表的结构 `feedback`
--

CREATE TABLE IF NOT EXISTS `feedback` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(125) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  `phone` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `body` varchar(255) NOT NULL DEFAULT '',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `feedback`
--

INSERT INTO `feedback` (`id`, `subject`, `name`, `phone`, `email`, `body`, `created_at`, `updated_at`) VALUES
(1, '测试测试', '李先生', '13240702278', '739800600@qq.com', '你好你好你好', 1481433870, 1481433870),
(2, '你好', '你好', '', '739800600@qq.com', '你好，你好', 1481434463, 1481434463);

-- --------------------------------------------------------

--
-- 表的结构 `migration`
--

CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m140506_102106_rbac_init', 1482895903);

-- --------------------------------------------------------

--
-- 表的结构 `page`
--

CREATE TABLE IF NOT EXISTS `page` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `keyword` varchar(100) NOT NULL DEFAULT '',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '模板路径',
  `content` text NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `page`
--

INSERT INTO `page` (`id`, `title`, `image`, `description`, `keyword`, `template`, `content`, `created_at`, `updated_at`) VALUES
(1, '关于我们', '', '关于我们', '关于我们', 'page', '<p><iframe class="ueditor_baidumap" src="http://dev.qy.com/assets/7a0b751e/dialogs/map/show.html#center=116.404,39.915&zoom=10&width=530&height=340&markers=116.404,39.915&markerStyles=l,A" frameborder="0" width="534" height="344"></iframe></p>', 1483165325, 1483170261);

--
-- 限制导出的表
--

--
-- 限制表 `admin_menu`
--
ALTER TABLE `admin_menu`
  ADD CONSTRAINT `admin_menu_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `admin_menu` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- 限制表 `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `auth_item`
--
ALTER TABLE `auth_item`
  ADD CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- 限制表 `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
