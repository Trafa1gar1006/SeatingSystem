-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2025-07-31 17:40:19
-- 伺服器版本： 10.4.32-MariaDB
-- PHP 版本： 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `esun`
--

DELIMITER $$
--
-- 程序
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `AssignSeat` (IN `emp_id` VARCHAR(5), IN `seat_seq` INT)   BEGIN
    UPDATE Employee SET floor_seat_seq = seat_seq WHERE emp_id = emp_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ClearSeat` (IN `emp_id` VARCHAR(5))   BEGIN
    UPDATE Employee SET floor_seat_seq = NULL WHERE emp_id = emp_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllSeating` ()   BEGIN
    SELECT s.floor_seat_seq, s.floor_no, s.seat_no, e.emp_id
    FROM SeatingChart s
    LEFT JOIN Employee e ON s.floor_seat_seq = e.floor_seat_seq;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- 資料表結構 `employee`
--

CREATE TABLE `employee` (
  `EMP_ID` int(11) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `FLOOR_SEAT_SEQ` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `employee`
--

INSERT INTO `employee` (`EMP_ID`, `NAME`, `EMAIL`, `FLOOR_SEAT_SEQ`) VALUES
(10285, 'Sage', 'sage@example.com', NULL),
(10515, 'Freddy', 'freddy@example.com', NULL),
(12085, 'Kenny', 'kenny@example.com', NULL),
(14022, 'Cody', 'cody@example.com', NULL),
(14309, 'Elsa', 'elsa@example.com', NULL),
(15157, 'Diana', 'diana@example.com', NULL),
(15644, 'Fiona', 'fiona@example.com', NULL),
(15827, 'Aaron', 'aaron@example.com', NULL),
(17278, 'Steven', 'steven@example.com', NULL),
(17966, 'Jack', 'jack@example.com', NULL),
(18093, 'Simon', 'simon@example.com', NULL),
(18549, 'Luis', 'luis@example.com', NULL),
(18754, 'Sofia', 'sofia@example.com', NULL),
(19086, 'Chloe', 'chloe@example.com', NULL),
(19104, 'Alice', 'alice@example.com', NULL),
(19736, 'Casey', 'casey@example.com', NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `seatingchart`
--

CREATE TABLE `seatingchart` (
  `FLOOR_SEAT_SEQ` int(11) NOT NULL,
  `FLOOR_NO` varchar(3) NOT NULL,
  `SEAT_NO` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `seatingchart`
--

INSERT INTO `seatingchart` (`FLOOR_SEAT_SEQ`, `FLOOR_NO`, `SEAT_NO`) VALUES
(101, '1F', 'S1'),
(102, '1F', 'S2'),
(103, '1F', 'S3'),
(104, '1F', 'S4'),
(201, '2F', 'S1'),
(202, '2F', 'S2'),
(203, '2F', 'S3'),
(204, '2F', 'S4'),
(301, '3F', 'S1'),
(302, '3F', 'S2'),
(303, '3F', 'S3'),
(304, '3F', 'S4'),
(401, '4F', 'S1'),
(402, '4F', 'S2'),
(403, '4F', 'S3'),
(404, '4F', 'S4');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`EMP_ID`),
  ADD KEY `FLOOR_SEAT_SEQ` (`FLOOR_SEAT_SEQ`);

--
-- 資料表索引 `seatingchart`
--
ALTER TABLE `seatingchart`
  ADD PRIMARY KEY (`FLOOR_SEAT_SEQ`);

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`FLOOR_SEAT_SEQ`) REFERENCES `seatingchart` (`FLOOR_SEAT_SEQ`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
