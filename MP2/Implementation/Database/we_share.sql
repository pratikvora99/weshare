-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 22, 2018 at 11:09 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `we_share`
--

-- --------------------------------------------------------

--
-- Table structure for table `album`
--

CREATE TABLE IF NOT EXISTS `album` (
  `album_id` varchar(100) NOT NULL,
  `photos` varchar(100) NOT NULL,
  `sub_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `album`
--

INSERT INTO `album` (`album_id`, `photos`, `sub_date`) VALUES
('16bit108_Turing Machine', '1.jpg', '2018-11-22'),
('16bit108_Turing Machine', '1_1.jpg', '2018-11-22'),
('16bit108_Turing Machine', '2.jpg', '2018-11-22'),
('16bit108_Turing Machine', '4.jpg', '2018-11-22');

-- --------------------------------------------------------

--
-- Table structure for table `album_details`
--

CREATE TABLE IF NOT EXISTS `album_details` (
  `album_id` varchar(100) NOT NULL,
  `author_id` varchar(50) NOT NULL,
  `album_name` varchar(50) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `branches` varchar(100) NOT NULL,
  `no_of_views` int(11) NOT NULL DEFAULT '0',
  `no_of_subs` int(11) NOT NULL DEFAULT '0',
  `date_of_start` date NOT NULL,
  `date_of_comp` date DEFAULT NULL,
  `completed` varchar(1) NOT NULL DEFAULT 'N',
  `registered` char(1) NOT NULL DEFAULT 'N',
  `remarks` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`album_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `album_details`
--

INSERT INTO `album_details` (`album_id`, `author_id`, `album_name`, `subject`, `branches`, `no_of_views`, `no_of_subs`, `date_of_start`, `date_of_comp`, `completed`, `registered`, `remarks`) VALUES
('16bit108_Turing Machine', '16bit108', 'Turing Machine', 'THOC', 'CS', 68, 0, '2018-11-22', NULL, 'N', 'Y', 'An a-z on Turing Machines.');

-- --------------------------------------------------------

--
-- Table structure for table `download`
--

CREATE TABLE IF NOT EXISTS `download` (
  `download_id` varchar(100) NOT NULL,
  `note_id` varchar(100) NOT NULL,
  `student_id` varchar(50) NOT NULL,
  `no_of_downloads` int(11) NOT NULL DEFAULT '1',
  `download_date` date NOT NULL,
  PRIMARY KEY (`download_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `follow`
--

CREATE TABLE IF NOT EXISTS `follow` (
  `followed` varchar(50) NOT NULL,
  `follower` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `follow`
--

INSERT INTO `follow` (`followed`, `follower`) VALUES
('16bit108', '16bit109');

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE IF NOT EXISTS `notes` (
  `note_id` varchar(100) NOT NULL,
  `stored_as` varchar(100) NOT NULL,
  `doc` longblob NOT NULL,
  `note_name` varchar(50) NOT NULL,
  `author_id` varchar(50) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `branches` varchar(50) NOT NULL,
  `doc_type` varchar(50) NOT NULL,
  `upload_date` date NOT NULL,
  `no_of_views` int(11) NOT NULL DEFAULT '0',
  `no_of_downloads` int(11) NOT NULL DEFAULT '0',
  `remarks` varchar(100) DEFAULT NULL,
  `registered` varchar(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`note_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notes`
--

INSERT INTO `notes` (`note_id`, `stored_as`, `doc`, `note_name`, `author_id`, `subject`, `branches`, `doc_type`, `upload_date`, `no_of_views`, `no_of_downloads`, `remarks`, `registered`) VALUES
('16bit108_Indian Contract Act', 'chapter-1-the-indian-contract-act-1872-2.pdf', 0x636861707465722d312d7468652d696e6469616e2d636f6e74726163742d6163742d313837322d322e706466, 'Indian Contract Act', '16bit108', 'Law for Engineers', 'CE', 'pdf', '2018-10-06', 6, 0, 'An overview over the Indian Contract Act, 1959.', 'Y'),
('16bit108_RDBMS - Day 3', 'RDBMS_Day3.pdf', 0x5244424d535f446179332e706466, 'RDBMS - Day 3', '16bit108', 'DBMS', 'CS', 'pdf', '2018-10-06', 0, 0, 'Lecture notes from the third session of RDBMS.', 'Y'),
('16bit108_SQL', 'Alan_Beaulieu-Learning_SQL-EN.pdf', '', 'SQL', '16bit108', 'DBMS', 'CS', 'pdf', '2018-11-21', 26, 0, 'A really nice book to begin with.', 'Y'),
('16bit108_University Schema', 'univ-schema.pdf', 0x756e69762d736368656d612e706466, 'University Schema', '16bit108', 'DBMS', 'CS', 'pdf', '2018-10-06', 0, 0, 'Just for your reference.', 'N'),
('16bit109_SQL', 'Alan_Beaulieu-Learning_SQL-EN.pdf', 0x416c616e5f426561756c6965752d4c6561726e696e675f53514c2d454e2e706466, 'SQL', '16bit109', 'DBMS', 'CS', 'pdf', '2018-11-22', 0, 0, 'Optional', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `name` varchar(30) NOT NULL,
  `uname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `uni` varchar(50) NOT NULL,
  `branch` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `photo` longblob,
  `registered` varchar(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`uname`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`name`, `uname`, `email`, `phone`, `uni`, `branch`, `password`, `photo`, `registered`) VALUES
('Pratik Vora', '16bit108', '16bit108@nirmauni.ac.in', '9586098425', 'Nirma University', 'CS', 'Pratik@1999', NULL, 'Y'),
('Prince Dholiya', '16bit109', '16bit109@nirmauni.ac.in', '3216549870', 'MIT', 'IC', 'Prince@99', NULL, 'Y'),
('Ridham Dudhat', '16bit111', 'ridham.dudhat@gmail.com', '0123456789', 'Nirma Uni', 'CS', 'Ridham@98', NULL, 'N'),
('Priyanshi Panchal', '17bit164', '17bit164@nirmauni.ac.in', '1234567890', 'Nirma', 'CS', 'Panchal@16', NULL, 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `subs`
--

CREATE TABLE IF NOT EXISTS `subs` (
  `sub_id` varchar(100) NOT NULL,
  `album_id` varchar(100) NOT NULL,
  `uname` varchar(100) NOT NULL,
  `sub_date` date NOT NULL,
  PRIMARY KEY (`sub_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subs`
--

INSERT INTO `subs` (`sub_id`, `album_id`, `uname`, `sub_date`) VALUES
('16bit109_16bit108_Turing Machine', '16bit108_Turing Machine', '16bit109', '2018-11-22');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
