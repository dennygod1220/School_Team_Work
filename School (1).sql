-- phpMyAdmin SQL Dump
-- version 4.4.15.9
-- https://www.phpmyadmin.net
--
-- 主機: localhost
-- 產生時間： 
-- 伺服器版本: 5.6.37
-- PHP 版本： 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `School`
--

-- --------------------------------------------------------

--
-- 資料表結構 `class`
--

CREATE TABLE IF NOT EXISTS `class` (
  `pid` int(11) NOT NULL,
  `daytime` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '日間部',
  `nighttime` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '夜間部'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 資料表的匯出資料 `class`
--

INSERT INTO `class` (`pid`, `daytime`, `nighttime`) VALUES
(1, 'V', 'X'),
(2, 'V', 'X'),
(3, 'V', 'x');

-- --------------------------------------------------------

--
-- 資料表結構 `credit`
--

CREATE TABLE IF NOT EXISTS `credit` (
  `cid` int(11) NOT NULL,
  `Graduation_credits` int(11) NOT NULL COMMENT '畢業學分',
  `Compulsory` int(11) NOT NULL COMMENT '必修學分',
  `Elective_id` int(11) NOT NULL COMMENT '選修',
  `Realize` int(11) NOT NULL COMMENT '實得',
  `gid` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `department`
--

CREATE TABLE IF NOT EXISTS `department` (
  `depid` int(11) NOT NULL,
  `depName` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 資料表的匯出資料 `department`
--

INSERT INTO `department` (`depid`, `depName`) VALUES
(1, '資工系'),
(2, '資管系'),
(3, '電子系'),
(4, '電機系'),
(5, '通訊系'),
(6, '建築系');

-- --------------------------------------------------------

--
-- 資料表結構 `Elective`
--

CREATE TABLE IF NOT EXISTS `Elective` (
  `eid` int(11) NOT NULL,
  `outside` int(11) NOT NULL COMMENT '系外',
  `inside` int(11) NOT NULL COMMENT '系內'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 資料表的匯出資料 `Elective`
--

INSERT INTO `Elective` (`eid`, `outside`, `inside`) VALUES
(1, 3, 10),
(2, 10, 13);

-- --------------------------------------------------------

--
-- 資料表結構 `grade`
--

CREATE TABLE IF NOT EXISTS `grade` (
  `gid` int(11) NOT NULL,
  `up` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '上學期',
  `down` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '下學期',
  `sid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `sid` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pid` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 資料表的匯出資料 `student`
--

INSERT INTO `student` (`sid`, `name`, `phone`, `email`, `pid`) VALUES
(7, '小美', '0988999000', '292@88.com', 1);

--
-- 已匯出資料表的索引
--

--
-- 資料表索引 `class`
--
ALTER TABLE `class`
  ADD KEY `pid` (`pid`);

--
-- 資料表索引 `credit`
--
ALTER TABLE `credit`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `gid` (`gid`),
  ADD KEY `Elective` (`Elective_id`),
  ADD KEY `Elective_id` (`Elective_id`);

--
-- 資料表索引 `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`depid`),
  ADD UNIQUE KEY `depid` (`depid`);

--
-- 資料表索引 `Elective`
--
ALTER TABLE `Elective`
  ADD PRIMARY KEY (`eid`);

--
-- 資料表索引 `grade`
--
ALTER TABLE `grade`
  ADD PRIMARY KEY (`gid`),
  ADD UNIQUE KEY `gid` (`gid`),
  ADD KEY `cid` (`gid`),
  ADD KEY `sid` (`sid`),
  ADD KEY `sid_2` (`sid`);

--
-- 資料表索引 `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`sid`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `sid` (`sid`),
  ADD KEY `pid` (`pid`);

--
-- 在匯出的資料表使用 AUTO_INCREMENT
--

--
-- 使用資料表 AUTO_INCREMENT `credit`
--
ALTER TABLE `credit`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- 使用資料表 AUTO_INCREMENT `student`
--
ALTER TABLE `student`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- 已匯出資料表的限制(Constraint)
--

--
-- 資料表的 Constraints `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `class_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `department` (`depid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的 Constraints `credit`
--
ALTER TABLE `credit`
  ADD CONSTRAINT `credit_ibfk_1` FOREIGN KEY (`gid`) REFERENCES `grade` (`gid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `credit_ibfk_2` FOREIGN KEY (`Elective_id`) REFERENCES `Elective` (`eid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的 Constraints `grade`
--
ALTER TABLE `grade`
  ADD CONSTRAINT `grade_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的 Constraints `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `department` (`depid`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
