-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 25, 2023 at 11:01 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: p1solution34
--

-- --------------------------------------------------------

--
-- Table structure for table buildingandroom
--

CREATE TABLE buildingandroom (
  buildingName varchar(50) NOT NULL,
  roomNumber int(11) NOT NULL,
  capacity int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table buildingandroom
--

INSERT INTO buildingandroom (buildingName, roomNumber, capacity) VALUES
('amf', 311, 1),
('dk', 101, 30),
('dk', 102, 30),
('dk', 201, 40),
('dk', 202, 40),
('dk', 203, 30),
('dk', 501, 60),
('dmf', 101, 30),
('dmf', 102, 40),
('dmf', 103, 45),
('dmf', 213, 60),
('dmf', 311, 60),
('dmf', 411, 60),
('lmf', 308, 40),
('lmf', 319, 40),
('lmf', 321, 40),
('maslak', 300, 1);

-- --------------------------------------------------------

--
-- Table structure for table course
--

CREATE TABLE course (
  courseCode varchar(10) NOT NULL,
  courseName varchar(100) NOT NULL,
  ects int(2) NOT NULL,
  numHours int(2) NOT NULL,
  prereq_courseCode varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table course
--

INSERT INTO course (courseCode, courseName, ects, numHours, prereq_courseCode) VALUES
('comp1111', 'Java Programming', 6, 3, NULL),
('comp1112', 'object oriented', 6, 2, 'comp1111'),
('comp2102', 'data structures', 6, 3, 'comp1112'),
('comp2222', 'database', 7, 3, 'comp1112'),
('INDE2001', 'Operations Research I', 7, 3, NULL),
('INDE2002', 'Operations Research II', 7, 3, 'INDE2001'),
('INDE2156', 'Engineering Statistics', 6, 3, NULL),
('math2103', 'discrete math', 5, 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table curricula
--

CREATE TABLE curricula (
  currCode varchar(10) NOT NULL,
  gradOrUrad tinyint(4) NOT NULL,
  dName varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table curricula
--

INSERT INTO curricula (currCode, gradOrUrad, dName) VALUES
('arch0813', 0, 'Architecture'),
('comp', 0, 'Computer Engineering'),
('comp2021', 0, 'Computer Engineering'),
('cse0813', 0, 'Computer Engineering'),
('eco0813', 0, 'Economics'),
('gors0813', 0, 'Visual arts'),
('ie0813', 0, 'Industrial Engineering'),
('msc0813', 1, 'Computer Engineering'),
('phd0813', 1, 'Computer Engineering'),
('soft', 0, 'Software Engineering'),
('soft2021', 0, 'Software Engineering');

-- --------------------------------------------------------

--
-- Table structure for table curriculacourses
--

CREATE TABLE curriculacourses (
  currCode varchar(10) NOT NULL,
  dName varchar(50) NOT NULL,
  courseCode varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table curriculacourses
--

INSERT INTO curriculacourses (currCode, dName, courseCode) VALUES
('comp', 'Computer Engineering', 'comp1111'),
('comp', 'Computer Engineering', 'comp1112'),
('comp', 'Computer Engineering', 'comp2102'),
('comp', 'Computer Engineering', 'comp2222'),
('comp', 'Computer Engineering', 'INDE2156'),
('comp', 'Computer Engineering', 'math2103'),
('ie0813', 'Industrial Engineering', 'INDE2001'),
('ie0813', 'Industrial Engineering', 'INDE2002'),
('ie0813', 'Industrial Engineering', 'INDE2156');

-- --------------------------------------------------------

--
-- Table structure for table department
--

CREATE TABLE department (
  dName varchar(50) NOT NULL,
  budget double DEFAULT NULL,
  headSsn varchar(20) NOT NULL,
  buildingName varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table department
--

INSERT INTO department (dName, budget, headSsn, buildingName) VALUES
('Architecture', NULL, 'i4', 'dk'),
('Computer Engineering', NULL, 'i1', 'amf'),
('Economics', NULL, 'i3', 'amf'),
('Industrial Engineering', NULL, 'i2', 'amf'),
('Software Engineering', NULL, 'i1', 'amf'),
('Visual arts', NULL, 'i5', 'maslak');

-- --------------------------------------------------------

--
-- Table structure for table emails
--

CREATE TABLE emails (
  email varchar(100) NOT NULL,
  sssn varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table emails
--

INSERT INTO emails (email, sssn) VALUES
('mscomp1@isik.edu.tr', 's3'),
('mscomp2@isik.edu.tr', 's6'),
('st1@isik.edu.tr', 's1'),
('st2@isik.edu.tr', 's2'),
('st4@isik.edu.tr', 's4'),
('st5@isik.edu.tr', 's5'),
('student1@gmail.com', 's1');

-- --------------------------------------------------------

--
-- Table structure for table enrollment
--

CREATE TABLE enrollment (
  sssn varchar(20) NOT NULL,
  issn varchar(20) NOT NULL,
  courseCode varchar(10) NOT NULL,
  sectionId int(11) NOT NULL,
  yearr int(11) NOT NULL,
  semester int(11) NOT NULL,
  grade varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table enrollment
--

INSERT INTO enrollment (sssn, issn, courseCode, sectionId, yearr, semester, grade) VALUES
('s1', 'i1', 'comp2222', 1, 2023, 2, NULL),
('s1', 'i6', 'comp1111', 1, 2023, 2, NULL),
('s1', 'i9', 'math2103', 1, 2023, 2, NULL),
('s2', 'i1', 'comp2222', 1, 2023, 2, NULL),
('s2', 'i6', 'comp1111', 1, 2023, 2, NULL),
('s2', 'i9', 'math2103', 1, 2023, 2, NULL),
('s4', 'i1', 'comp2222', 1, 2023, 2, NULL),
('s4', 'i6', 'comp1111', 1, 2023, 2, NULL),
('s4', 'i8', 'INDE2156', 1, 2023, 2, NULL),
('s4', 'i9', 'math2103', 1, 2023, 2, NULL),
('s5', 'i1', 'comp2222', 1, 2023, 2, NULL),
('s5', 'i9', 'INDE2156', 2, 2023, 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table examofsection
--

CREATE TABLE examofsection (
  examname varchar(10) NOT NULL,
  date date DEFAULT NULL,
  issn varchar(20) NOT NULL,
  courseCode varchar(10) NOT NULL,
  yearr int(11) NOT NULL,
  semester int(11) NOT NULL,
  sectionId int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table examofsection
--

INSERT INTO examofsection (examname, date, issn, courseCode, yearr, semester, sectionId) VALUES
('Final', '2023-06-12', 'i1', 'COMP2222', 2023, 2, 1),
('Final', '2023-06-24', 'i6', 'COMP1111', 2023, 2, 1),
('Final', '2023-06-18', 'i8', 'INDE2156', 2023, 2, 1),
('FinalEXam', '2023-06-24', 'i9', 'MATH2103', 2023, 2, 1),
('InclassAss', '2023-04-05', 'i8', 'INDE2156', 2023, 2, 1),
('Midterm', '2023-05-05', 'i8', 'INDE2156', 2023, 2, 1),
('Midterm1', '2023-04-17', 'i1', 'COMP2222', 2023, 2, 1),
('Midterm1', '2023-04-12', 'i6', 'COMP1111', 2023, 2, 1),
('Midterm1', '2023-04-08', 'i9', 'MATH2103', 2023, 2, 1),
('Midterm2', '2023-06-05', 'i1', 'COMP2222', 2023, 2, 1),
('Midterm2', '2023-05-17', 'i6', 'COMP1111', 2023, 2, 1),
('Midterm2', '2023-05-18', 'i9', 'MATH2103', 2023, 2, 1),
('Midterm3', '2023-06-09', 'i6', 'COMP1111', 2023, 2, 1),
('OnlineAssi', '2023-05-12', 'i8', 'INDE2156', 2023, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table gradesperquestion
--

CREATE TABLE gradesperquestion (
  pointsEarned double DEFAULT NULL,
  qno int(11) NOT NULL,
  examname varchar(10) NOT NULL,
  issn varchar(20) NOT NULL,
  courseCode varchar(10) NOT NULL,
  yearr int(11) NOT NULL,
  semester int(11) NOT NULL,
  sectionId int(11) NOT NULL,
  sssn varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table gradesperquestion
--

INSERT INTO gradesperquestion (pointsEarned, qno, examname, issn, courseCode, yearr, semester, sectionId, sssn) VALUES
(69, 1, 'InclassAss', 'i8', 'INDE2156', 2023, 2, 1, 's4'),
(82, 1, 'InclassAss', 'i8', 'INDE2156', 2023, 2, 1, 's5'),
(20, 1, 'Midterm', 'i8', 'INDE2156', 2023, 2, 1, 's4'),
(4, 1, 'Midterm', 'i8', 'INDE2156', 2023, 2, 1, 's5'),
(5, 1, 'Midterm1', 'i1', 'COMP2222', 2023, 2, 1, 's1'),
(4, 1, 'Midterm1', 'i1', 'COMP2222', 2023, 2, 1, 's2'),
(8, 1, 'Midterm1', 'i1', 'COMP2222', 2023, 2, 1, 's4'),
(4, 1, 'Midterm1', 'i6', 'COMP1111', 2023, 2, 1, 's1'),
(2, 1, 'Midterm1', 'i6', 'COMP1111', 2023, 2, 1, 's2'),
(12, 1, 'Midterm1', 'i6', 'COMP1111', 2023, 2, 1, 's4'),
(7, 1, 'Midterm1', 'i9', 'MATH2103', 2023, 2, 1, 's1'),
(3, 1, 'Midterm1', 'i9', 'MATH2103', 2023, 2, 1, 's2'),
(8, 1, 'Midterm1', 'i9', 'MATH2103', 2023, 2, 1, 's4'),
(22, 1, 'Midterm2', 'i1', 'COMP2222', 2023, 2, 1, 's1'),
(14, 1, 'Midterm2', 'i1', 'COMP2222', 2023, 2, 1, 's4'),
(18, 1, 'Midterm2', 'i1', 'COMP2222', 2023, 2, 1, 's5'),
(6, 1, 'Midterm2', 'i6', 'COMP1111', 2023, 2, 1, 's1'),
(5, 1, 'Midterm2', 'i6', 'COMP1111', 2023, 2, 1, 's2'),
(4, 1, 'Midterm2', 'i6', 'COMP1111', 2023, 2, 1, 's4'),
(14, 1, 'Midterm2', 'i9', 'MATH2103', 2023, 2, 1, 's1'),
(16, 1, 'Midterm3', 'i6', 'COMP1111', 2023, 2, 1, 's1'),
(1, 1, 'Midterm3', 'i6', 'COMP1111', 2023, 2, 1, 's2'),
(10, 1, 'Midterm3', 'i6', 'COMP1111', 2023, 2, 1, 's4'),
(11, 1, 'OnlineAssi', 'i8', 'INDE2156', 2023, 2, 1, 's5'),
(3, 2, 'Midterm', 'i8', 'INDE2156', 2023, 2, 1, 's4'),
(16, 2, 'Midterm', 'i8', 'INDE2156', 2023, 2, 1, 's5'),
(0, 2, 'Midterm1', 'i1', 'COMP2222', 2023, 2, 1, 's1'),
(7, 2, 'Midterm1', 'i1', 'COMP2222', 2023, 2, 1, 's2'),
(9, 2, 'Midterm1', 'i1', 'COMP2222', 2023, 2, 1, 's4'),
(6, 2, 'Midterm1', 'i6', 'COMP1111', 2023, 2, 1, 's1'),
(2, 2, 'Midterm1', 'i6', 'COMP1111', 2023, 2, 1, 's2'),
(3, 2, 'Midterm1', 'i6', 'COMP1111', 2023, 2, 1, 's4'),
(18, 2, 'Midterm1', 'i9', 'MATH2103', 2023, 2, 1, 's1'),
(20, 2, 'Midterm1', 'i9', 'MATH2103', 2023, 2, 1, 's2'),
(9, 2, 'Midterm1', 'i9', 'MATH2103', 2023, 2, 1, 's4'),
(12, 2, 'Midterm2', 'i1', 'COMP2222', 2023, 2, 1, 's1'),
(6, 2, 'Midterm2', 'i1', 'COMP2222', 2023, 2, 1, 's4'),
(6, 2, 'Midterm2', 'i1', 'COMP2222', 2023, 2, 1, 's5'),
(1, 2, 'Midterm2', 'i6', 'COMP1111', 2023, 2, 1, 's1'),
(17, 2, 'Midterm2', 'i6', 'COMP1111', 2023, 2, 1, 's2'),
(0, 2, 'Midterm2', 'i6', 'COMP1111', 2023, 2, 1, 's4'),
(0, 2, 'Midterm2', 'i9', 'MATH2103', 2023, 2, 1, 's1'),
(13, 2, 'Midterm3', 'i6', 'COMP1111', 2023, 2, 1, 's1'),
(9, 2, 'Midterm3', 'i6', 'COMP1111', 2023, 2, 1, 's2'),
(11, 2, 'Midterm3', 'i6', 'COMP1111', 2023, 2, 1, 's4'),
(22, 3, 'Midterm', 'i8', 'INDE2156', 2023, 2, 1, 's4'),
(7, 3, 'Midterm', 'i8', 'INDE2156', 2023, 2, 1, 's5'),
(8, 3, 'Midterm1', 'i1', 'COMP2222', 2023, 2, 1, 's1'),
(10, 3, 'Midterm1', 'i1', 'COMP2222', 2023, 2, 1, 's2'),
(1, 3, 'Midterm1', 'i1', 'COMP2222', 2023, 2, 1, 's4'),
(3, 3, 'Midterm1', 'i6', 'COMP1111', 2023, 2, 1, 's1'),
(15, 3, 'Midterm1', 'i6', 'COMP1111', 2023, 2, 1, 's2'),
(15, 3, 'Midterm1', 'i6', 'COMP1111', 2023, 2, 1, 's4'),
(3, 3, 'Midterm1', 'i9', 'MATH2103', 2023, 2, 1, 's1'),
(17, 3, 'Midterm1', 'i9', 'MATH2103', 2023, 2, 1, 's2'),
(18, 3, 'Midterm1', 'i9', 'MATH2103', 2023, 2, 1, 's4'),
(22, 3, 'Midterm2', 'i1', 'COMP2222', 2023, 2, 1, 's1'),
(25, 3, 'Midterm2', 'i1', 'COMP2222', 2023, 2, 1, 's4'),
(5, 3, 'Midterm2', 'i1', 'COMP2222', 2023, 2, 1, 's5'),
(20, 3, 'Midterm2', 'i6', 'COMP1111', 2023, 2, 1, 's1'),
(24, 3, 'Midterm2', 'i6', 'COMP1111', 2023, 2, 1, 's2'),
(23, 3, 'Midterm2', 'i6', 'COMP1111', 2023, 2, 1, 's4'),
(24, 3, 'Midterm2', 'i9', 'MATH2103', 2023, 2, 1, 's1'),
(10, 3, 'Midterm3', 'i6', 'COMP1111', 2023, 2, 1, 's1'),
(16, 3, 'Midterm3', 'i6', 'COMP1111', 2023, 2, 1, 's2'),
(25, 3, 'Midterm3', 'i6', 'COMP1111', 2023, 2, 1, 's4'),
(14, 4, 'Midterm', 'i8', 'INDE2156', 2023, 2, 1, 's4'),
(5, 4, 'Midterm', 'i8', 'INDE2156', 2023, 2, 1, 's5'),
(5, 4, 'Midterm1', 'i1', 'COMP2222', 2023, 2, 1, 's1'),
(8, 4, 'Midterm1', 'i1', 'COMP2222', 2023, 2, 1, 's2'),
(1, 4, 'Midterm1', 'i1', 'COMP2222', 2023, 2, 1, 's4'),
(3, 4, 'Midterm1', 'i6', 'COMP1111', 2023, 2, 1, 's1'),
(23, 4, 'Midterm1', 'i6', 'COMP1111', 2023, 2, 1, 's2'),
(7, 4, 'Midterm1', 'i6', 'COMP1111', 2023, 2, 1, 's4'),
(25, 4, 'Midterm1', 'i9', 'MATH2103', 2023, 2, 1, 's1'),
(8, 4, 'Midterm1', 'i9', 'MATH2103', 2023, 2, 1, 's2'),
(16, 4, 'Midterm1', 'i9', 'MATH2103', 2023, 2, 1, 's4'),
(20, 4, 'Midterm2', 'i1', 'COMP2222', 2023, 2, 1, 's1'),
(11, 4, 'Midterm2', 'i1', 'COMP2222', 2023, 2, 1, 's4'),
(5, 4, 'Midterm2', 'i1', 'COMP2222', 2023, 2, 1, 's5'),
(14, 4, 'Midterm2', 'i6', 'COMP1111', 2023, 2, 1, 's1'),
(17, 4, 'Midterm2', 'i6', 'COMP1111', 2023, 2, 1, 's2'),
(11, 4, 'Midterm2', 'i6', 'COMP1111', 2023, 2, 1, 's4'),
(19, 4, 'Midterm2', 'i9', 'MATH2103', 2023, 2, 1, 's1'),
(11, 4, 'Midterm3', 'i6', 'COMP1111', 2023, 2, 1, 's1'),
(12, 4, 'Midterm3', 'i6', 'COMP1111', 2023, 2, 1, 's2'),
(16, 4, 'Midterm3', 'i6', 'COMP1111', 2023, 2, 1, 's4'),
(7, 5, 'Midterm1', 'i1', 'COMP2222', 2023, 2, 1, 's1'),
(1, 5, 'Midterm1', 'i1', 'COMP2222', 2023, 2, 1, 's2'),
(6, 5, 'Midterm1', 'i1', 'COMP2222', 2023, 2, 1, 's4'),
(4, 6, 'Midterm1', 'i1', 'COMP2222', 2023, 2, 1, 's1'),
(7, 6, 'Midterm1', 'i1', 'COMP2222', 2023, 2, 1, 's2'),
(1, 6, 'Midterm1', 'i1', 'COMP2222', 2023, 2, 1, 's4'),
(5, 7, 'Midterm1', 'i1', 'COMP2222', 2023, 2, 1, 's1'),
(0, 7, 'Midterm1', 'i1', 'COMP2222', 2023, 2, 1, 's2'),
(9, 7, 'Midterm1', 'i1', 'COMP2222', 2023, 2, 1, 's4'),
(0, 8, 'Midterm1', 'i1', 'COMP2222', 2023, 2, 1, 's1'),
(3, 8, 'Midterm1', 'i1', 'COMP2222', 2023, 2, 1, 's2'),
(3, 8, 'Midterm1', 'i1', 'COMP2222', 2023, 2, 1, 's4'),
(3, 9, 'Midterm1', 'i1', 'COMP2222', 2023, 2, 1, 's1'),
(5, 9, 'Midterm1', 'i1', 'COMP2222', 2023, 2, 1, 's2'),
(5, 9, 'Midterm1', 'i1', 'COMP2222', 2023, 2, 1, 's4'),
(6, 10, 'Midterm1', 'i1', 'COMP2222', 2023, 2, 1, 's1'),
(0, 10, 'Midterm1', 'i1', 'COMP2222', 2023, 2, 1, 's2'),
(9, 10, 'Midterm1', 'i1', 'COMP2222', 2023, 2, 1, 's4');

-- --------------------------------------------------------

--
-- Table structure for table gradstudent
--

CREATE TABLE gradstudent (
  ssn varchar(20) NOT NULL,
  supervisorSsn varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table gradstudent
--

INSERT INTO gradstudent (ssn, supervisorSsn) VALUES
('s3', 'i1'),
('s6', 'i6');

-- --------------------------------------------------------

--
-- Table structure for table instructor
--

CREATE TABLE instructor (
  ssn varchar(20) NOT NULL,
  iname varchar(100) DEFAULT NULL,
  rankk varchar(45) DEFAULT NULL,
  baseSal double DEFAULT NULL,
  dName varchar(50) NOT NULL,
  extraSalary double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table instructor
--

INSERT INTO instructor (ssn, iname, rankk, baseSal, dName, extraSalary) VALUES
('i1', 'Emine Ekin', 'AsstProf', 50, 'Computer Engineering', NULL),
('i2', 'Caglar Aksezer', 'Prof', 1500, 'Industrial Engineering', NULL),
('i3', 'Ozlem Inanc', 'AsstProf', 50, 'Economics', NULL),
('i4', 'Elif Suyuk Makakli', 'AsstProf', 50, 'Architecture', NULL),
('i5', 'Banu Inanc Uyan Dur', 'AssocProf', 1000, 'Visual Arts', NULL),
('i6', 'Olcay Yildiz', 'Prof', 1500, 'Computer Engineering', NULL),
('i7', 'instructor7', 'lecturer', 40, 'Economics', NULL),
('i8', 'instructor8', 'AssocProf', 1000, 'Architecture', NULL),
('i9', 'Şirin Özlem', 'AsstProf', 50, 'Industrial Engineering', NULL);

-- --------------------------------------------------------

--
-- Table structure for table prevdegree
--

CREATE TABLE prevdegree (
  college varchar(100) NOT NULL,
  degree varchar(100) NOT NULL,
  yearr int(11) NOT NULL,
  Gradssn varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table prevdegree
--

INSERT INTO prevdegree (college, degree, yearr, Gradssn) VALUES
('Işık Un', 'computer Engineer ba', 2019, 's3'),
('Işık Un', 'computer Engineer ma', 2018, 's6');

-- --------------------------------------------------------

--
-- Table structure for table project
--

CREATE TABLE project (
  leadSsn varchar(20) NOT NULL,
  pName varchar(45) NOT NULL,
  subject varchar(450) DEFAULT NULL,
  budget double DEFAULT NULL,
  startDate date NOT NULL,
  enddate date NOT NULL,
  controllingDName varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table project
--

INSERT INTO project (leadSsn, pName, subject, budget, startDate, enddate, controllingDName) VALUES
('i1', 'job1', 'about computers', 50000, '2019-06-01', '2021-01-01', 'Computer Engineering'),
('i1', 'project4', 'artificial intelligence', 1000000, '2022-08-25', '2024-06-30', 'Computer Engineering'),
('i6', 'job2', 'about life', 1000, '2018-02-02', '2020-06-06', 'Computer Engineering'),
('i7', 'job3', 'money talks', 1000000, '2018-01-01', '2021-01-01', 'Economics');

-- --------------------------------------------------------

--
-- Table structure for table project_has_gradstudent
--

CREATE TABLE project_has_gradstudent (
  leadSsn varchar(20) NOT NULL,
  pName varchar(45) NOT NULL,
  Gradssn varchar(20) NOT NULL,
  workingHour int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table project_has_gradstudent
--

INSERT INTO project_has_gradstudent (leadSsn, pName, Gradssn, workingHour) VALUES
('i1', 'job1', 's3', 40),
('i6', 'job2', 's3', 12),
('i6', 'job2', 's6', 120),
('i7', 'job3', 's6', 8);

-- --------------------------------------------------------

--
-- Table structure for table project_has_instructor
--

CREATE TABLE project_has_instructor (
  leadSsn varchar(20) NOT NULL,
  pName varchar(45) NOT NULL,
  issn varchar(20) NOT NULL,
  workinghour int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table project_has_instructor
--

INSERT INTO project_has_instructor (leadSsn, pName, issn, workinghour) VALUES
('i1', 'job1', 'i3', 12),
('i1', 'job1', 'i6', 15),
('i1', 'project4', 'i6', 14),
('i6', 'job2', 'i4', 12),
('i7', 'job3', 'i5', 8),
('i7', 'job3', 'i6', 4);

-- --------------------------------------------------------

--
-- Table structure for table questionofexam
--

CREATE TABLE questionofexam (
  qno int(11) NOT NULL,
  qpoints int(11) DEFAULT NULL,
  examname varchar(10) NOT NULL,
  issn varchar(20) NOT NULL,
  courseCode varchar(10) NOT NULL,
  yearr int(11) NOT NULL,
  semester int(11) NOT NULL,
  sectionId int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table questionofexam
--

INSERT INTO questionofexam (qno, qpoints, examname, issn, courseCode, yearr, semester, sectionId) VALUES
(1, 10, 'Final', 'i1', 'COMP2222', 2023, 2, 1),
(1, 15, 'Final', 'i6', 'COMP1111', 2023, 2, 1),
(1, 20, 'Final', 'i8', 'INDE2156', 2023, 2, 1),
(1, 25, 'FinalEXam', 'i9', 'MATH2103', 2023, 2, 1),
(1, 100, 'InclassAss', 'i8', 'INDE2156', 2023, 2, 1),
(1, 25, 'Midterm', 'i8', 'INDE2156', 2023, 2, 1),
(1, 10, 'Midterm1', 'i1', 'COMP2222', 2023, 2, 1),
(1, 25, 'Midterm1', 'i6', 'COMP1111', 2023, 2, 1),
(1, 25, 'Midterm1', 'i9', 'MATH2103', 2023, 2, 1),
(1, 25, 'Midterm2', 'i1', 'COMP2222', 2023, 2, 1),
(1, 25, 'Midterm2', 'i6', 'COMP1111', 2023, 2, 1),
(1, 25, 'Midterm2', 'i9', 'MATH2103', 2023, 2, 1),
(1, 25, 'Midterm3', 'i6', 'COMP1111', 2023, 2, 1),
(1, 100, 'OnlineAssi', 'i8', 'INDE2156', 2023, 2, 1),
(2, 25, 'Final', 'i1', 'COMP2222', 2023, 2, 1),
(2, 15, 'Final', 'i6', 'COMP1111', 2023, 2, 1),
(2, 20, 'Final', 'i8', 'INDE2156', 2023, 2, 1),
(2, 25, 'FinalEXam', 'i9', 'MATH2103', 2023, 2, 1),
(2, 25, 'Midterm', 'i8', 'INDE2156', 2023, 2, 1),
(2, 10, 'Midterm1', 'i1', 'COMP2222', 2023, 2, 1),
(2, 25, 'Midterm1', 'i6', 'COMP1111', 2023, 2, 1),
(2, 25, 'Midterm1', 'i9', 'MATH2103', 2023, 2, 1),
(2, 25, 'Midterm2', 'i1', 'COMP2222', 2023, 2, 1),
(2, 25, 'Midterm2', 'i6', 'COMP1111', 2023, 2, 1),
(2, 25, 'Midterm2', 'i9', 'MATH2103', 2023, 2, 1),
(2, 25, 'Midterm3', 'i6', 'COMP1111', 2023, 2, 1),
(3, 25, 'Final', 'i1', 'COMP2222', 2023, 2, 1),
(3, 20, 'Final', 'i6', 'COMP1111', 2023, 2, 1),
(3, 20, 'Final', 'i8', 'INDE2156', 2023, 2, 1),
(3, 25, 'FinalEXam', 'i9', 'MATH2103', 2023, 2, 1),
(3, 25, 'Midterm', 'i8', 'INDE2156', 2023, 2, 1),
(3, 10, 'Midterm1', 'i1', 'COMP2222', 2023, 2, 1),
(3, 25, 'Midterm1', 'i6', 'COMP1111', 2023, 2, 1),
(3, 25, 'Midterm1', 'i9', 'MATH2103', 2023, 2, 1),
(3, 25, 'Midterm2', 'i1', 'COMP2222', 2023, 2, 1),
(3, 25, 'Midterm2', 'i6', 'COMP1111', 2023, 2, 1),
(3, 25, 'Midterm2', 'i9', 'MATH2103', 2023, 2, 1),
(3, 25, 'Midterm3', 'i6', 'COMP1111', 2023, 2, 1),
(4, 15, 'Final', 'i1', 'COMP2222', 2023, 2, 1),
(4, 20, 'Final', 'i6', 'COMP1111', 2023, 2, 1),
(4, 20, 'Final', 'i8', 'INDE2156', 2023, 2, 1),
(4, 25, 'FinalEXam', 'i9', 'MATH2103', 2023, 2, 1),
(4, 25, 'Midterm', 'i8', 'INDE2156', 2023, 2, 1),
(4, 10, 'Midterm1', 'i1', 'COMP2222', 2023, 2, 1),
(4, 25, 'Midterm1', 'i6', 'COMP1111', 2023, 2, 1),
(4, 25, 'Midterm1', 'i9', 'MATH2103', 2023, 2, 1),
(4, 25, 'Midterm2', 'i1', 'COMP2222', 2023, 2, 1),
(4, 25, 'Midterm2', 'i6', 'COMP1111', 2023, 2, 1),
(4, 25, 'Midterm2', 'i9', 'MATH2103', 2023, 2, 1),
(4, 25, 'Midterm3', 'i6', 'COMP1111', 2023, 2, 1),
(5, 15, 'Final', 'i1', 'COMP2222', 2023, 2, 1),
(5, 20, 'Final', 'i6', 'COMP1111', 2023, 2, 1),
(5, 20, 'Final', 'i8', 'INDE2156', 2023, 2, 1),
(5, 10, 'Midterm1', 'i1', 'COMP2222', 2023, 2, 1),
(6, 10, 'Final', 'i1', 'COMP2222', 2023, 2, 1),
(6, 10, 'Final', 'i6', 'COMP1111', 2023, 2, 1),
(6, 10, 'Midterm1', 'i1', 'COMP2222', 2023, 2, 1),
(7, 10, 'Midterm1', 'i1', 'COMP2222', 2023, 2, 1),
(8, 10, 'Midterm1', 'i1', 'COMP2222', 2023, 2, 1),
(9, 10, 'Midterm1', 'i1', 'COMP2222', 2023, 2, 1),
(10, 10, 'Midterm1', 'i1', 'COMP2222', 2023, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table sectionn
--

CREATE TABLE sectionn (
  issn varchar(20) NOT NULL,
  courseCode varchar(10) NOT NULL,
  yearr int(11) NOT NULL,
  semester int(11) NOT NULL,
  sectionId int(11) NOT NULL,
  quota int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table sectionn
--

INSERT INTO sectionn (issn, courseCode, yearr, semester, sectionId, quota) VALUES
('i1', 'comp2222', 2023, 2, 1, 40),
('i1', 'comp2222', 2023, 2, 2, 40),
('i6', 'comp1111', 2023, 2, 1, 40),
('i6', 'comp1111', 2023, 2, 2, 45),
('i8', 'INDE2156', 2023, 2, 1, 20),
('i9', 'INDE2156', 2023, 2, 2, 25),
('i9', 'math2103', 2023, 2, 1, 100);

-- --------------------------------------------------------

--
-- Table structure for table student
--

CREATE TABLE student (
  ssn varchar(20) NOT NULL,
  gradorUgrad tinyint(4) NOT NULL,
  advisorSsn varchar(20) NOT NULL,
  currCode varchar(10) NOT NULL,
  dName varchar(50) NOT NULL,
  studentid varchar(10) NOT NULL,
  studentname varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table student
--

INSERT INTO student (ssn, gradorUgrad, advisorSsn, currCode, dName, studentid, studentname) VALUES
('s1', 0, 'i1', 'comp', 'Computer Engineering', 'st1', 'student1'),
('s2', 0, 'i6', 'comp', 'Computer Engineering', 'st2', 'student2'),
('s3', 1, 'i1', 'phd0813', 'Computer Engineering', 'mscomp1', 'gradstcse1'),
('s4', 0, 'i4', 'arch0813', 'Architecture', 'st3', 'student3'),
('s5', 0, 'i2', 'ie0813', 'Industrial Engineering', 'st4', 'student4'),
('s6', 1, 'i6', 'phd0813', 'Computer Engineering', 'mscomp2', 'gradstcse2');

-- --------------------------------------------------------

--
-- Table structure for table studenttakingexam
--

CREATE TABLE studenttakingexam (
  examname varchar(10) NOT NULL,
  issn varchar(20) NOT NULL,
  courseCode varchar(10) NOT NULL,
  yearr int(11) NOT NULL,
  semester int(11) NOT NULL,
  sectionId int(11) NOT NULL,
  sssn varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table studenttakingexam
--

INSERT INTO studenttakingexam (examname, issn, courseCode, yearr, semester, sectionId, sssn) VALUES
('InclassAss', 'i8', 'INDE2156', 2023, 2, 1, 's4'),
('InclassAss', 'i8', 'INDE2156', 2023, 2, 1, 's5'),
('Midterm', 'i8', 'INDE2156', 2023, 2, 1, 's4'),
('Midterm', 'i8', 'INDE2156', 2023, 2, 1, 's5'),
('Midterm1', 'i1', 'COMP2222', 2023, 2, 1, 's1'),
('Midterm1', 'i1', 'COMP2222', 2023, 2, 1, 's2'),
('Midterm1', 'i1', 'COMP2222', 2023, 2, 1, 's4'),
('Midterm1', 'i6', 'COMP1111', 2023, 2, 1, 's1'),
('Midterm1', 'i6', 'COMP1111', 2023, 2, 1, 's2'),
('Midterm1', 'i6', 'COMP1111', 2023, 2, 1, 's4'),
('Midterm1', 'i9', 'MATH2103', 2023, 2, 1, 's1'),
('Midterm1', 'i9', 'MATH2103', 2023, 2, 1, 's2'),
('Midterm1', 'i9', 'MATH2103', 2023, 2, 1, 's4'),
('Midterm2', 'i1', 'COMP2222', 2023, 2, 1, 's1'),
('Midterm2', 'i1', 'COMP2222', 2023, 2, 1, 's4'),
('Midterm2', 'i1', 'COMP2222', 2023, 2, 1, 's5'),
('Midterm2', 'i6', 'COMP1111', 2023, 2, 1, 's1'),
('Midterm2', 'i6', 'COMP1111', 2023, 2, 1, 's2'),
('Midterm2', 'i6', 'COMP1111', 2023, 2, 1, 's4'),
('Midterm2', 'i9', 'MATH2103', 2023, 2, 1, 's1'),
('Midterm3', 'i6', 'COMP1111', 2023, 2, 1, 's1'),
('Midterm3', 'i6', 'COMP1111', 2023, 2, 1, 's2'),
('Midterm3', 'i6', 'COMP1111', 2023, 2, 1, 's4'),
('OnlineAssi', 'i8', 'INDE2156', 2023, 2, 1, 's5');

-- --------------------------------------------------------

--
-- Table structure for table timeslot
--

CREATE TABLE timeslot (
  dayy varchar(12) NOT NULL,
  hourr int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table timeslot
--

INSERT INTO timeslot (dayy, hourr) VALUES
('Friday', 1),
('Friday', 2),
('Friday', 3),
('Friday', 4),
('Friday', 5),
('Friday', 6),
('Friday', 7),
('Friday', 8),
('Friday', 9),
('Friday', 10),
('Friday', 11),
('Friday', 12),
('Friday', 13),
('Monday', 1),
('Monday', 2),
('Monday', 3),
('Monday', 4),
('Monday', 5),
('Monday', 6),
('Monday', 7),
('Monday', 8),
('Monday', 9),
('Monday', 10),
('Monday', 11),
('Monday', 12),
('Monday', 13),
('Saturday', 1),
('Saturday', 2),
('Saturday', 3),
('Saturday', 4),
('Saturday', 5),
('Saturday', 6),
('Thursday', 1),
('Thursday', 2),
('Thursday', 3),
('Thursday', 4),
('Thursday', 5),
('Thursday', 6),
('Thursday', 7),
('Thursday', 8),
('Thursday', 9),
('Thursday', 10),
('Thursday', 11),
('Thursday', 12),
('Thursday', 13),
('Tuesday', 1),
('Tuesday', 2),
('Tuesday', 3),
('Tuesday', 4),
('Tuesday', 5),
('Tuesday', 6),
('Tuesday', 7),
('Tuesday', 8),
('Tuesday', 9),
('Tuesday', 10),
('Tuesday', 11),
('Tuesday', 12),
('Tuesday', 13),
('Wednesday', 1),
('Wednesday', 2),
('Wednesday', 3),
('Wednesday', 4),
('Wednesday', 5),
('Wednesday', 6),
('Wednesday', 7),
('Wednesday', 8),
('Wednesday', 9),
('Wednesday', 10),
('Wednesday', 11),
('Wednesday', 12),
('Wednesday', 13);

-- --------------------------------------------------------

--
-- Table structure for table weeklyschedule
--

CREATE TABLE weeklyschedule (
  issn varchar(20) NOT NULL,
  courseCode varchar(10) NOT NULL,
  sectionId int(11) NOT NULL,
  yearr int(11) NOT NULL,
  semester int(11) NOT NULL,
  dayy varchar(12) NOT NULL,
  hourr int(11) NOT NULL,
  buildingName varchar(50) NOT NULL,
  roomNumber int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table weeklyschedule
--

INSERT INTO weeklyschedule (issn, courseCode, sectionId, yearr, semester, dayy, hourr, buildingName, roomNumber) VALUES
('i1', 'comp2222', 1, 2023, 2, 'Monday', 5, 'dk', 101),
('i1', 'comp2222', 1, 2023, 2, 'Monday', 6, 'dk', 101),
('i1', 'comp2222', 1, 2023, 2, 'Monday', 7, 'dk', 101),
('i1', 'comp2222', 2, 2023, 2, 'Tuesday', 1, 'dk', 501),
('i1', 'comp2222', 2, 2023, 2, 'Tuesday', 2, 'dk', 501),
('i1', 'comp2222', 2, 2023, 2, 'Tuesday', 3, 'dk', 501),
('i8', 'INDE2156', 1, 2023, 2, 'Thursday', 1, 'dmf', 213),
('i8', 'INDE2156', 1, 2023, 2, 'Thursday', 2, 'dmf', 213),
('i8', 'INDE2156', 1, 2023, 2, 'Thursday', 3, 'dmf', 213),
('i9', 'INDE2156', 2, 2023, 2, 'Thursday', 1, 'dmf', 311),
('i9', 'INDE2156', 2, 2023, 2, 'Thursday', 2, 'dmf', 311),
('i9', 'INDE2156', 2, 2023, 2, 'Thursday', 3, 'dmf', 311),
('i9', 'math2103', 1, 2023, 2, 'Friday', 1, 'dmf', 411),
('i9', 'math2103', 1, 2023, 2, 'Friday', 2, 'dmf', 411),
('i9', 'math2103', 1, 2023, 2, 'Friday', 3, 'dmf', 411),
('i9', 'math2103', 1, 2023, 2, 'Friday', 4, 'dmf', 411),
('i6', 'comp1111', 1, 2023, 2, 'Wednesday', 1, 'lmf', 321),
('i6', 'comp1111', 1, 2023, 2, 'Wednesday', 2, 'lmf', 321),
('i6', 'comp1111', 1, 2023, 2, 'Wednesday', 3, 'lmf', 321),
('i6', 'comp1111', 2, 2023, 2, 'Wednesday', 5, 'lmf', 321),
('i6', 'comp1111', 2, 2023, 2, 'Wednesday', 6, 'lmf', 321),
('i6', 'comp1111', 2, 2023, 2, 'Wednesday', 7, 'lmf', 321);

--
-- Indexes for dumped tables
--

--
-- Indexes for table buildingandroom
--
ALTER TABLE buildingandroom
  ADD PRIMARY KEY (buildingName,roomNumber);

--
-- Indexes for table course
--
ALTER TABLE course
  ADD PRIMARY KEY (courseCode),
  ADD KEY fk_course_course1 (prereq_courseCode);

--
-- Indexes for table curricula
--
ALTER TABLE curricula
  ADD PRIMARY KEY (currCode,dName),
  ADD KEY fk_curricula_department1 (dName);

--
-- Indexes for table curriculacourses
--
ALTER TABLE curriculacourses
  ADD PRIMARY KEY (currCode,dName,courseCode),
  ADD KEY fk_curricula_has_course_course1 (courseCode);

--
-- Indexes for table department
--
ALTER TABLE department
  ADD PRIMARY KEY (dName),
  ADD KEY fk_department_building1 (buildingName),
  ADD KEY fk_department_instructor1 (headSsn);

--
-- Indexes for table emails
--
ALTER TABLE emails
  ADD PRIMARY KEY (email,sssn),
  ADD KEY fk_emails_student1 (sssn);

--
-- Indexes for table enrollment
--
ALTER TABLE enrollment
  ADD PRIMARY KEY (sssn,issn,courseCode,yearr,semester,sectionId),
  ADD KEY fk_student_has_section_section1 (issn,courseCode,yearr,semester,sectionId);

--
-- Indexes for table examofsection
--
ALTER TABLE examofsection
  ADD PRIMARY KEY (examname,issn,courseCode,yearr,semester,sectionId),
  ADD KEY fk_Exam_sectionn (issn,courseCode,yearr,semester,sectionId);

--
-- Indexes for table gradesperquestion
--
ALTER TABLE gradesperquestion
  ADD PRIMARY KEY (qno,examname,issn,courseCode,yearr,semester,sectionId,sssn),
  ADD KEY fk_has_StudentTakingExam_StudentTakingExam1 (sssn),
  ADD KEY fk_has_StudentTakingExam_QuestionOfExam1 (sssn,examname,issn,courseCode,yearr,semester,sectionId);

--
-- Indexes for table gradstudent
--
ALTER TABLE gradstudent
  ADD PRIMARY KEY (ssn),
  ADD KEY fk_GradStudent_instructor1 (supervisorSsn);

--
-- Indexes for table instructor
--
ALTER TABLE instructor
  ADD PRIMARY KEY (ssn),
  ADD KEY fk_instructor_department (dName);

--
-- Indexes for table prevdegree
--
ALTER TABLE prevdegree
  ADD PRIMARY KEY (college,degree,yearr,Gradssn),
  ADD KEY fk_PrevDegree_GradStudent1 (Gradssn);

--
-- Indexes for table project
--
ALTER TABLE project
  ADD PRIMARY KEY (leadSsn,pName),
  ADD KEY fk_Project_department1 (controllingDName);

--
-- Indexes for table project_has_gradstudent
--
ALTER TABLE project_has_gradstudent
  ADD PRIMARY KEY (leadSsn,pName,Gradssn),
  ADD KEY fk_Project_has_GradStudent_GradStudent1 (Gradssn);

--
-- Indexes for table project_has_instructor
--
ALTER TABLE project_has_instructor
  ADD PRIMARY KEY (leadSsn,pName,issn),
  ADD KEY fk_Project_has_instructor_instructor1 (issn);

--
-- Indexes for table questionofexam
--
ALTER TABLE questionofexam
  ADD PRIMARY KEY (qno,examname,issn,courseCode,yearr,semester,sectionId),
  ADD KEY fk_Question_ExamOfSection1 (examname,issn,courseCode,yearr,semester,sectionId);

--
-- Indexes for table sectionn
--
ALTER TABLE sectionn
  ADD PRIMARY KEY (issn,courseCode,yearr,semester,sectionId),
  ADD KEY fk_instructor_has_course_course1 (courseCode);

--
-- Indexes for table student
--
ALTER TABLE student
  ADD PRIMARY KEY (ssn),
  ADD UNIQUE KEY studentid (studentid),
  ADD KEY fk_student_curricula1 (currCode,dName),
  ADD KEY fk_student_instructor1 (advisorSsn);

--
-- Indexes for table studenttakingexam
--
ALTER TABLE studenttakingexam
  ADD PRIMARY KEY (examname,issn,courseCode,yearr,semester,sectionId,sssn),
  ADD KEY fk_ExamOfSection_has_enrollment_enrollment1 (sssn);

--
-- Indexes for table timeslot
--
ALTER TABLE timeslot
  ADD PRIMARY KEY (dayy,hourr);

--
-- Indexes for table weeklyschedule
--
ALTER TABLE weeklyschedule
  ADD PRIMARY KEY (issn,courseCode,sectionId,yearr,semester,dayy,hourr),
  ADD KEY fk_section_has_TimeSlot_TimeSlot1 (dayy,hourr),
  ADD KEY fk_section_has_TimeSlot_buildingAndroom1 (buildingName,roomNumber),
  ADD KEY fk_section_has_TimeSlot_section1 (issn,courseCode,yearr,semester,sectionId);

--
-- Constraints for dumped tables
--

--
-- Constraints for table course
--
ALTER TABLE course
  ADD CONSTRAINT fk_course_course1 FOREIGN KEY (prereq_courseCode) REFERENCES course (courseCode) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table curricula
--
ALTER TABLE curricula
  ADD CONSTRAINT fk_curricula_department1 FOREIGN KEY (dName) REFERENCES department (dName) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table curriculacourses
--
ALTER TABLE curriculacourses
  ADD CONSTRAINT fk_curricula_has_course_course1 FOREIGN KEY (courseCode) REFERENCES course (courseCode) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_curricula_has_course_curricula1 FOREIGN KEY (currCode,dName) REFERENCES curricula (currCode, dName) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table department
--
ALTER TABLE department
  ADD CONSTRAINT fk_department_building1 FOREIGN KEY (buildingName) REFERENCES buildingandroom (buildingName) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_department_instructor1 FOREIGN KEY (headSsn) REFERENCES instructor (ssn) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table emails
--
ALTER TABLE emails
  ADD CONSTRAINT fk_emails_student1 FOREIGN KEY (sssn) REFERENCES student (ssn) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table enrollment
--
ALTER TABLE enrollment
  ADD CONSTRAINT fk_student_has_section_section1 FOREIGN KEY (issn,courseCode,yearr,semester,sectionId) REFERENCES sectionn (issn, courseCode, yearr, semester, sectionId) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT fk_student_has_section_student1 FOREIGN KEY (sssn) REFERENCES student (ssn) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table examofsection
--
ALTER TABLE examofsection
  ADD CONSTRAINT fk_Exam_sectionn FOREIGN KEY (issn,courseCode,yearr,semester,sectionId) REFERENCES sectionn (issn, courseCode, yearr, semester, sectionId) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table gradesperquestion
--
ALTER TABLE gradesperquestion
  ADD CONSTRAINT fk_has_StudentTakingExam_QuestionOfExam1 FOREIGN KEY (sssn,examname,issn,courseCode,yearr,semester,sectionId) REFERENCES studenttakingexam (sssn, examname, issn, courseCode, yearr, semester, sectionId) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_has_StudentTakingExam_StudentTakingExam1 FOREIGN KEY (qno) REFERENCES questionofexam (qno) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table gradstudent
--
ALTER TABLE gradstudent
  ADD CONSTRAINT fk_GradStudent_instructor1 FOREIGN KEY (supervisorSsn) REFERENCES instructor (ssn) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_GradStudent_student1 FOREIGN KEY (ssn) REFERENCES student (ssn) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table instructor
--
ALTER TABLE instructor
  ADD CONSTRAINT fk_instructor_department FOREIGN KEY (dName) REFERENCES department (dName) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table prevdegree
--
ALTER TABLE prevdegree
  ADD CONSTRAINT fk_PrevDegree_GradStudent1 FOREIGN KEY (Gradssn) REFERENCES gradstudent (ssn) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table project
--
ALTER TABLE project
  ADD CONSTRAINT fk_Project_department1 FOREIGN KEY (controllingDName) REFERENCES department (dName) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_Project_instructor1 FOREIGN KEY (leadSsn) REFERENCES instructor (ssn) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table project_has_gradstudent
--
ALTER TABLE project_has_gradstudent
  ADD CONSTRAINT fk_Project_has_GradStudent_GradStudent1 FOREIGN KEY (Gradssn) REFERENCES gradstudent (ssn) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_Project_has_GradStudent_Project1 FOREIGN KEY (leadSsn,pName) REFERENCES project (leadSsn, pName) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table project_has_instructor
--
ALTER TABLE project_has_instructor
  ADD CONSTRAINT fk_Project_has_instructor_Project1 FOREIGN KEY (leadSsn,pName) REFERENCES project (leadSsn, pName) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT fk_Project_has_instructor_instructor1 FOREIGN KEY (issn) REFERENCES instructor (ssn) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table questionofexam
--
ALTER TABLE questionofexam
  ADD CONSTRAINT fk_Question_ExamOfSection1 FOREIGN KEY (examname,issn,courseCode,yearr,semester,sectionId) REFERENCES examofsection (examname, issn, courseCode, yearr, semester, sectionId) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table sectionn
--
ALTER TABLE sectionn
  ADD CONSTRAINT fk_instructor_has_course_course1 FOREIGN KEY (courseCode) REFERENCES course (courseCode) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT fk_instructor_has_course_instructor1 FOREIGN KEY (issn) REFERENCES instructor (ssn) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table student
--
ALTER TABLE student
  ADD CONSTRAINT fk_student_curricula1 FOREIGN KEY (currCode,dName) REFERENCES curricula (currCode, dName) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_student_instructor1 FOREIGN KEY (advisorSsn) REFERENCES instructor (ssn) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table studenttakingexam
--
ALTER TABLE studenttakingexam
  ADD CONSTRAINT fk_ExamOfSection_has_enrollment_enrollment1 FOREIGN KEY (sssn) REFERENCES enrollment (sssn) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_has_enrollment_ExamOfSection1 FOREIGN KEY (examname,issn,courseCode,yearr,semester,sectionId) REFERENCES examofsection (examname, issn, courseCode, yearr, semester, sectionId) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table weeklyschedule
--
ALTER TABLE weeklyschedule
  ADD CONSTRAINT fk_section_has_TimeSlot_TimeSlot1 FOREIGN KEY (dayy,hourr) REFERENCES timeslot (dayy, hourr) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_section_has_TimeSlot_buildingAndroom1 FOREIGN KEY (buildingName,roomNumber) REFERENCES buildingandroom (buildingName, roomNumber) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_section_has_TimeSlot_section1 FOREIGN KEY (issn,courseCode,yearr,semester,sectionId) REFERENCES sectionn (issn, courseCode, yearr, semester, sectionId) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
