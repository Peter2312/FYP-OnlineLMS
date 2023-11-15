-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Generation Time: Nov 8, 2023 at 02:57 PM
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
-- Database: `lms_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `activity_log_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL,
  `action` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`activity_log_id`, `username`, `date`, `action`) VALUES
(25, 'navdeep300', '2023-11-01 14:29:14', 'Add User peterpang');

-- --------------------------------------------------------

--
-- Table structure for table `answer`
--

CREATE TABLE `answer` (
  `answer_id` int(11) NOT NULL,
  `quiz_question_id` int(11) NOT NULL,
  `answer_text` varchar(100) NOT NULL,
  `choices` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `answer`
--

INSERT INTO `answer` (`answer_id`, `quiz_question_id`, `answer_text`, `choices`) VALUES
(81, 32, 'john', 'A'),
(82, 32, 'smith', 'B'),
(83, 32, 'kevin', 'C'),
(84, 32, 'lorayna', 'D'),
(85, 34, 'Peso', 'A'),
(86, 34, 'PHP Hypertext', 'B'),
(87, 34, 'PHP Hypertext Preprocessor', 'C'),
(88, 34, 'Philippines', 'D'),
(89, 37, 'Preprocessor Hypertext', 'A'),
(90, 37, 'Pull He Paps', 'B'),
(91, 37, 'Pure Hyper Language', 'C'),
(92, 37, 'None of the above', 'D'),
(93, 39, '', 'A'),
(94, 39, '', 'B'),
(95, 39, '', 'C'),
(96, 39, '', 'D');

-- --------------------------------------------------------

--
-- Table structure for table `assignment`
--

CREATE TABLE `assignment` (
  `assignment_id` int(11) NOT NULL,
  `floc` varchar(300) NOT NULL,
  `fdatein` varchar(100) NOT NULL,
  `fdesc` varchar(100) NOT NULL,
  `lecturer_id` int(11) DEFAULT NULL,
  `class_id` int(11) NOT NULL,
  `fname` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `assignment`
--

INSERT INTO `assignment` (`assignment_id`, `floc`, `fdatein`, `fdesc`, `lecturer_id`, `class_id`, `fname`) VALUES
(32, 'admin/uploads/4865_File_6000CEM - DPP Submission - Peter Pang Kher Yong.docx', '2023-11-04 03:34:40', 'f', 20, 187, 's'),
(33, 'admin/uploads/6540_File_PETER PANG KHER YONG Internship letter.pdf', '2023-11-06 15:50:22', 'g', 20, 187, 'g'),
(34, 'admin/uploads/1800_File_PETER PANG KHER YONG Internship letter.pdf', '2023-11-06 16:10:39', 'r', 20, 187, 'e'),
(35, 'admin/uploads/9063_File_PETER PANG KHER YONG Internship letter.pdf', '2023-11-06 20:10:27', 'e', 15, 187, 'w');

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `class_id` int(11) NOT NULL,
  `class_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`class_id`, `class_name`) VALUES
(7, 'ME A1'),
(8, 'ME A2'),
(12, 'CE A1'),
(13, 'CE A2'),
(14, 'CE E1'),
(15, 'CE E2'),
(16, 'IT A1'),
(17, 'IT A2'),
(18, 'IT B1'),
(19, 'IT B2'),
(20, 'CSE A1'),
(21, 'CSE A2'),
(22, 'CSE B1'),
(23, 'CSE B2');

-- --------------------------------------------------------

--
-- Table structure for table `class_quiz`
--

CREATE TABLE `class_quiz` (
  `class_quiz_id` int(11) NOT NULL,
  `lecturer_class_id` int(11) DEFAULT NULL,
  `quiz_time` int(11) NOT NULL,
  `quiz_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `class_quiz`
--

INSERT INTO `class_quiz` (`class_quiz_id`, `lecturer_class_id`, `quiz_time`, `quiz_id`) VALUES
(13, 167, 3600, 3),
(14, 167, 3600, 3),
(15, 167, 1800, 3),
(16, 185, 900, 0),
(17, 197, 300, 6),
(18, 187, 720, 6),
(19, 187, 600, 7),
(20, 187, 720, 7);

-- --------------------------------------------------------

--
-- Table structure for table `class_subject_overview`
--

CREATE TABLE `class_subject_overview` (
  `class_subject_overview_id` int(11) NOT NULL,
  `lecturer_class_id` int(11) DEFAULT NULL,
  `content` varchar(10000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `class_subject_overview`
--

INSERT INTO `class_subject_overview` (`class_subject_overview_id`, `lecturer_class_id`, `content`) VALUES
(1, 167, '<p>Chapter 1</p>\r\n\r\n<p>Cha</p>\r\n'),
(2, 197, '<p>Computer Graphics subject will teach students about how the graphics is formed on a screen. We will learn various rendering techniques and much more.</p>\r\n'),
(4, 192, '<p>This subject is excellent</p>\r\n'),
(5, 187, '<p>haha</p>\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `content`
--

CREATE TABLE `content` (
  `content_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `content`
--

INSERT INTO `content` (`content_id`, `title`, `content`) VALUES
(1, 'Mission', '<pre>\r\n<span style=\"font-size:16px\"><strong>Mission</strong></span></pre>\r\n\r\n<p style=\"text-align:left\"><span style=\"font-family:arial,helvetica,sans-serif; font-size:medium\"><span style=\"font-size:large\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></span>&nbsp; &nbsp;<span style=\"font-size:18px\"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; A leading institution in higher and continuing education commited to engage in quality instruction, development-oriented research sustinable lucrative economic enterprise, and responsive extension and training services through relevant academic programs to empower a human resource that responds effectively to challenges in life and acts as catalyst in the holistoic development of a humane society.&nbsp;</span></p>\r\n\r\n<p style=\"text-align:left\">&nbsp;</p>\r\n'),
(2, 'Vision', '<pre><span style=\"font-size: large;\"><strong>Vision</strong></span></pre>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"font-size: large;\">&nbsp; Driven by its passion for continous improvement, the State College has to vigorously pursue distinction and proficieny in delivering its statutory functions to the Filipino people in the fields of education, business, agro-fishery, industrial, science and technology, through committed and competent human resource, guided by the beacon of innovation and productivity towards the heights of elevated status. </span><br /><br /></p>'),
(3, 'History', '<pre>\r\n<span style=\"font-size:large\">HISTORY &nbsp;</span> </pre>\r\n\r\n<p style=\"text-align:justify\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Ultimate University is a public educational institution that aims to provide higher technological, professional and vocational instruction and training in science, agriculture and industrial fields as well as short term or vocational courses.</p>\r\n'),
(4, 'Footer', '<p style=\"text-align:center\">Ultimate University Online Learning Management System</p>\r\n\r\n<p style=\"text-align:center\">All Rights Reserved &reg;2023</p>\r\n'),
(5, 'Upcoming Events', '<pre>\r\nUP COMING EVENTS</pre>\r\n\r\n<p><strong>&gt;</strong> EXAM</p>\r\n\r\n<p><strong>&gt;</strong> INTERCAMPUS MEET</p>\r\n\r\n<p><strong>&gt;</strong> DEFENSE</p>\r\n\r\n<p><strong>&gt;</strong> ENROLLMENT</p>\r\n\r\n<p>&nbsp;</p>\r\n'),
(6, 'Title', '<p><span style=\"font-family:trebuchet ms,geneva\">Ultimate University Online Learning Management System</span></p>\r\n'),
(7, 'News', '<pre>\r\n<span style=\"font-size:medium\"><em><strong>Recent News\r\n</strong></em></span></pre>\r\n\r\n<h2><span style=\"font-size:small\">Extension and Community Services</span></h2>\r\n\r\n<p style=\"text-align:justify\">This technology package was promoted by the College of Industrial Technology Unit is an index to offer Practical Skills and Livelihood Training Program particularly to the Ina ngTahanan of Tayabas, Barangay Zone 15, Talisay City, Negros Occidental</p>\r\n\r\n<p style=\"text-align:justify\">The respondent of this technology package were mostly &ldquo;ina&rdquo; or mothers in PurokTayabas. There were twenty mothers who responded to the call of training and enhancing their sewing skills. The beginners projects include an apron, elastics waist skirts, pillow-cover and t-shirt style top. Short sleeve blouses with buttonholes or contoured seaming are also some of the many projects introduced to the mothers. Based on the interview conducted after the culmination activity, the projects done contributed as a means of earning to the respondents.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; In support to the thrust of the government to improve the health status of neighboring barangays, the Faculty and Staff of CHMSC ECS Fortune Towne, Bacolod City, launched its Medical Mission in Patag, Silay City. It was conducted last March 2010, to address the health needs of the people. A medical consultation is given to the residents of SitioPatag to attend to their health related problems that may need medical treatment. Medical tablets for headache, flu, fever, antibiotics and others were availed by the residents.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;The BAYAN-ANIHAN is a Food Production Program with a battle cry of &ldquo;GOODBYE GUTOM&rdquo;, advocating its legacy &ldquo;Food on the Table for every Filipino Family&rdquo; through backyard gardening. NGO&rsquo;s, governmental organizations, private and public sectors, business sectors are the cooperating agencies that support and facilitate this project and Carlos Hilado Memorial State College (CHMSC) is one of the identified partner school. Being a member institution in advocating its thrust, the school through its Extension and Community Services had conducted capability training workshop along this program identifying two deputy coordinators and trainers last November 26,27 and 28, 2009, with the end in view of implementing the project all throughout the neighboring towns, provinces and regions to help address poverty in the country. Program beneficiaries were the selected families of GawadKalinga (GK) in Hope Village, Brgy. Cabatangan, Talisay City, with 120 families beneficiaries; GK FIAT Village in Silay City with 30 beneficiaries; Bonbon Dream Village brgy. E. Lopez, Silay City with 60 beneficiaries; and respectively Had. Teresita and Had. Carmen in Talisay City, Negros Occidental both with 60 member beneficiaries. This program was introduced to 30 household members with the end in view of alleviating the quality standards of their living.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">The extension &amp; Community Services of the College conducted a series of consultations and meetings with the different local government units to assess technology needs to determines potential products to be developed considering the abundance of raw materials in their respective areas and their product marketability. The project was released in November 2009 in six cities in the province of Negros Occidental, namely San Carlos, Sagay, Silay, Bago, Himamaylan and Sipalay and the Municipality of E. B Magalona</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; The City of San Carlos focused on peanut and fish processing. Sagay and bago focused on meat processing, while Silay City on fish processing. The City of Himamaylan is on sardines, and in Sipalay focused on fish processing specially on their famous BARONGAY product. The municipality of E.B Magalona focused on bangus deboning.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; The food technology instructors are tasked to provide the needed skills along with the TLDC Livelihood project that each City is embarking on while the local government units provide the training venue for the project and the training equipment and machine were provided by the Department of Science and Technology.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n'),
(8, 'Announcements', '<pre>\r\n<span style=\"font-size:medium\"><em><strong>Announcements</strong></em></span></pre>\r\n\r\n<p>Examination Period: October 9-11, 2023</p>\r\n\r\n<p>Semester Break: October 12- November 3, 2023</p>\r\n\r\n<p>FASKFJASKFAFASFMFAS</p>\r\n\r\n<p>GASGA</p>\r\n'),
(10, 'Calendar', '<pre style=\"text-align:center\">\r\n<span style=\"font-size:medium\"><strong>&nbsp;CALENDAR OF EVENT</strong></span></pre>\r\n\r\n<table align=\"center\" cellpadding=\"0\" cellspacing=\"0\" style=\"line-height:1.6em; margin-left:auto; margin-right:auto\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<p>First Semester &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p>\r\n			</td>\r\n			<td>\r\n			<p>June 10, 2023 to October 11, 2023</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Semester Break</p>\r\n			</td>\r\n			<td>\r\n			<p>Oct. 12, 2023 to November 3, 2023</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Second Semester</p>\r\n			</td>\r\n			<td>\r\n			<p>Nov. 5, 2023 to March 27, 2024</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Semester Break</p>\r\n			</td>\r\n			<td>\r\n			<p>March 27, 2024 to April 8, 2024</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Classes Begin</p>\r\n			</td>\r\n			<td>\r\n			<p>April 8 , 2024 to May 24, 2024</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<table cellpadding=\"0\" cellspacing=\"0\" style=\"line-height:1.6em; margin-left:auto; margin-right:auto\">\r\n	<tbody>\r\n		<tr>\r\n			<td colspan=\"4\">\r\n			<p><strong>June 5, 2023 to October 11, 2023 &ndash; First Semester AY 2023-2024</strong></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>June 4, 2013 &nbsp; &nbsp; &nbsp; &nbsp;</p>\r\n			</td>\r\n			<td>\r\n			<p>Orientation with the Parents of the University New Students</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>June 5</p>\r\n			</td>\r\n			<td>\r\n			<p>First Day of Service</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>June 5</p>\r\n			</td>\r\n			<td>\r\n			<p>College Personnel General Assembly</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>June 6,7</p>\r\n			</td>\r\n			<td>\r\n			<p>In-Service Training (Departmental)</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>June 10</p>\r\n			</td>\r\n			<td>\r\n			<p>First Day of Classes</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>June 14</p>\r\n			</td>\r\n			<td>\r\n			<p>Orientation with Students by College/Campus/Department</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>June 19,20,21</p>\r\n			</td>\r\n			<td>\r\n			<p>Branch/Campus Visit for Administrative / Academic/Accreditation/ Concerns</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td rowspan=\"2\">\r\n			<p>June</p>\r\n			</td>\r\n			<td>\r\n			<p>Club Organizations (By Discipline/Programs)</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Student Affiliation/Induction Programs</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>July</p>\r\n			</td>\r\n			<td>\r\n			<p>Nutrition Month (Sponsor: Laboratory School)</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>July 11, 12</p>\r\n			</td>\r\n			<td>\r\n			<p>Long Tests</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>August&nbsp; 8, 9</p>\r\n			</td>\r\n			<td>\r\n			<p>Midterm Examinations</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>August 19</p>\r\n			</td>\r\n			<td>\r\n			<p>ArawngLahi</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>August 23</p>\r\n			</td>\r\n			<td>\r\n			<p>Submission of Grade Sheets for Midterm</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>August</p>\r\n			</td>\r\n			<td>\r\n			<p>Recognition Program (Dean&rsquo;s List)</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>August 26</p>\r\n			</td>\r\n			<td>\r\n			<p>National Heroes Day (Regular Holiday)</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>August 28, 29, 30</p>\r\n			</td>\r\n			<td>\r\n			<p>Sports and Cultural Meet</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>September 19,20</p>\r\n			</td>\r\n			<td>\r\n			<p>Long Tests</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>October 5</p>\r\n			</td>\r\n			<td>\r\n			<p>Teachers&rsquo; Day / World Teachers&rsquo; Day</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>October 10, 11</p>\r\n			</td>\r\n			<td>\r\n			<p>Final Examination</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>October 12</p>\r\n			</td>\r\n			<td>\r\n			<p>Semester Break</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<table cellpadding=\"0\" cellspacing=\"0\" style=\"margin-left:auto; margin-right:auto\">\r\n	<tbody>\r\n		<tr>\r\n			<td colspan=\"4\">\r\n			<p><strong>Nov. 4, 2013 to March 27, 2014 &ndash; Second Semester AY 2013-2014</strong></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>November 4 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p>\r\n			</td>\r\n			<td>\r\n			<p>Start of Classes</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>November 19, 20, 21, 22</p>\r\n			</td>\r\n			<td>\r\n			<p>Intercampus Sports and Cultural Fest/College Week</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>December 5, 6</p>\r\n			</td>\r\n			<td>\r\n			<p>Long Tests</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>December 19,20</p>\r\n			</td>\r\n			<td>\r\n			<p>Thanksgiving Celebrations</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>December 21</p>\r\n			</td>\r\n			<td>\r\n			<p>Start of Christmas Vacation</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>December 25</p>\r\n			</td>\r\n			<td>\r\n			<p>Christmas Day (Regular Holiday)</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>December 30</p>\r\n			</td>\r\n			<td>\r\n			<p>Rizal Day (Regular Holiday)</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>January 6, 2024</p>\r\n			</td>\r\n			<td>\r\n			<p>Classes Resume</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>January 9, 10</p>\r\n			</td>\r\n			<td>\r\n			<p>Midterm Examinations</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>January 29</p>\r\n			</td>\r\n			<td>\r\n			<p>Submission of Grades Sheets for Midterm</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>February 13, 14</p>\r\n			</td>\r\n			<td>\r\n			<p>Long Tests</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>March 6, 7</p>\r\n			</td>\r\n			<td>\r\n			<p>Final Examinations (Graduating)</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>March 13, 14</p>\r\n			</td>\r\n			<td>\r\n			<p>Final Examinations (Non-Graduating)</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>March 17, 18, 19, 20, 21</p>\r\n			</td>\r\n			<td>\r\n			<p>Recognition / Graduation Rites</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>March 27</p>\r\n			</td>\r\n			<td>\r\n			<p>Last Day of Service for Faculty</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>June 5, 2024</p>\r\n			</td>\r\n			<td>\r\n			<p>First Day of Service for SY 2024-2025</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<table border=\"1\" cellpadding=\"0\" cellspacing=\"0\" style=\"margin-left:auto; margin-right:auto\">\r\n	<tbody>\r\n		<tr>\r\n			<td colspan=\"2\">\r\n			<p><strong>FLAG RAISING CEREMONY-TALISAY CAMPUS</strong></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>MONTHS &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p>\r\n			</td>\r\n			<td>\r\n			<p>UNIT-IN-CHARGE</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>June, Sept. and Dec. 2023, March 2024</p>\r\n			</td>\r\n			<td>\r\n			<p>COE</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>July and October 2023, Jan. 2024</p>\r\n			</td>\r\n			<td>\r\n			<p>SAS</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>August and November 2023, Feb. 2024</p>\r\n\r\n			<p>April and May 2024</p>\r\n			</td>\r\n			<td>\r\n			<p>CIT</p>\r\n\r\n			<p>GASS</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n'),
(11, 'Directories', '<div class=\"jsn-article-content\" style=\"text-align: left;\">\r\n<pre>\r\n<span style=\"font-size:medium\"><em><strong>DIRECTORIES</strong></em></span></pre>\r\n\r\n<ul>\r\n	<li>Lab School - 712-0848</li>\r\n	<li>Accounting - 495-5560</li>\r\n	<li>Presidents Office - 495-4064(telefax)</li>\r\n	<li>VPA/PME - 495-1635</li>\r\n	<li>Registrar Office - 495-4657(telefax)</li>\r\n	<li>Cashier - 712-7272</li>\r\n	<li>CIT - 712-0670</li>\r\n	<li>SAS/COE - 495-6017</li>\r\n	<li>BAC - 712-8404(telefax)</li>\r\n	<li>Records - 495-3470</li>\r\n	<li>Supply - 495-3767</li>\r\n	<li>Internet Lab - 712-6144/712-6459</li>\r\n	<li>COA - 495-5748</li>\r\n	<li>Guard House - 476-1600</li>\r\n	<li>HRM - 495-4996</li>\r\n	<li>Extension - 457-2819</li>\r\n	<li>Canteen - 495-5396</li>\r\n	<li>Research - 712-8464</li>\r\n	<li>Library - 495-5143</li>\r\n	<li>OSA - 495-1152</li>\r\n</ul>\r\n</div>\r\n'),
(12, 'president', '<p>It is my great pleasure and privilege to welcome you to CHMSC&rsquo;s official website. Accept my deep appreciation for continuously taking interest in CHMSC and its programs and activities.<br /> Recently, the challenges of the knowledge era of the 21st Century led me to think very deeply how educational institutions of higher learning must vigorously pursue relevant e<img style=\"float: left;\" src=\"images/president.jpg\" alt=\"\" />ducation to compete with and respond to the challenges of globalization. As an international fellow, I realized that in the face of this globalization and technological advancement, educational institutions are compelled to work extraordinary in educating the youths and enhancing their potentials for gainful employment and realization of their dreams to become effective citizens.<br /><br /> Honored and humbled to be given the opportunity for stewardship of this good College, I am fully aware that the goal is to make CHMSC as the center of excellence or development in various fields. The vision, CHMSC ExCELS: Excellence, Competence and Educational Leadership in Science and Technology is a profound battle cry for each member of CHMSC Community. A CHMSCian must be technologically and academically competent, socially mature, safety conscious with care for the environment, a good citizen and possesses high moral values. The way the College is being managed, the internal and the external culture of all stockholders, and the efforts for quality and excellence will result to the establishment of the good corporate image of the College. The hallmark is reflected as the image of the good institution.<br /><br /> The tasks at hand call for our full cooperation, support and active participation. Therefore, I urge everyone to help me in the crusade to <br /><br /></p>\r\n<p style=\"text-align: justify;\"><span style=\"line-height: 1.3em;\">Provide wider access to CHMSC programs;</span></p>\r\n<p style=\"text-align: justify;\"><span style=\"line-height: 1.3em;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* Harness the potentials of students thru effective teaching and learning methodologies and techniques;</span></p>\r\n<p style=\"text-align: justify;\"><span style=\"line-height: 1.3em;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* Enable CHMSC Environment for All through secure green campus;</span></p>\r\n<p style=\"text-align: justify;\"><span style=\"line-height: 1.3em;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* Advocate green movement, protect intellectual property and stimulate innovation;</span></p>\r\n<p style=\"text-align: justify;\"><span style=\"line-height: 1.3em;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* Promote lifelong learning;</span></p>\r\n<p style=\"text-align: justify;\"><span style=\"line-height: 1.3em;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* Conduct Research and Development for community and poverty alleviation;</span></p>\r\n<p style=\"text-align: justify;\"><span style=\"line-height: 1.3em;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* Share and disseminate knowledge through publication and extension outreach to communities; and</span></p>\r\n<p style=\"text-align: justify;\"><span style=\"line-height: 1.3em;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;*Strengthen Institute-industry linkages and public-private partnership for mutual interest.</span></p>\r\n<p style=\"text-align: justify;\"><br /><span style=\"line-height: 1.3em; text-align: justify;\">Together, WE can make CHMSC</span></p>\r\n<p style=\"text-align: justify;\"><br /><span style=\"line-height: 1.3em;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;*A model green institution for Human Resources Development, a builder of human resources in the knowledge era of the 21st Century;</span></p>\r\n<p style=\"text-align: justify;\"><span style=\"line-height: 1.3em;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; *A center for curricular innovations and research especially in education, technology, engineering, ICT and entrepreneurship; and</span></p>\r\n<p style=\"text-align: justify;\"><span style=\"line-height: 1.3em;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; *A Provider of quality graduates in professional and technological programs for industry and community.</span></p>\r\n<p style=\"text-align: justify;\"><br /><br /> Dear readers and guests, these are the challenges for every CHMSCian to hurdle and the dreams to realize. This website will be one of the connections with you as we ardently take each step. Feel free to visit often and be kept posted as we continue to work for discoveries and advancement that will bring benefits to the lives of the students, the community, and the world, as a whole.<br /><br /> Warmest welcome and I wish you well!</p>\r\n<p style=\"text-align: justify;\"><br /><br /></p>\r\n<p style=\"text-align: justify;\">RENATO M. SOROLLA, Ph.D.<br />SUC President II</p>'),
(13, 'motto', '<p><strong><span style=\"color:#FFF0F5\"><span style=\"font-family:arial,helvetica,sans-serif\">Ultimate University EXCELS:</span></span></strong></p>\r\n\r\n<p><strong>&quot;Strive To Serve In Excellence&quot;</strong></p>\r\n'),
(14, 'Campuses', '<pre>\r\n<span style=\"font-size:16px\"><strong>Campuses</strong></span></pre>\r\n\r\n<ul>\r\n	<li>Penang Campus</li>\r\n	<li>Kuala Lumpur Campus</li>\r\n	<li>Johor Bahru Campus</li>\r\n	<li>Perak Campus<br />\r\n	&nbsp;</li>\r\n</ul>\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `department_id` int(11) NOT NULL,
  `department_name` varchar(100) NOT NULL,
  `dean` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`department_id`, `department_name`, `dean`) VALUES
(9, 'Civil Engineering', 'Krishnan'),
(11, 'Business', 'Khor Kok Chin'),
(12, 'Mass Comunication', 'Teng Wei Jian'),
(13, 'Information Technology', 'Light Lau'),
(15, 'Computer Science & Engineering', 'Asvhini Subramaniam');

-- --------------------------------------------------------

--
-- Table structure for table `discussions`
--

CREATE TABLE `discussions` (
  `discussion_id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `lecturer_id` int(11) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `lecturer_class_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `discussions`
--

INSERT INTO `discussions` (`discussion_id`, `subject`, `title`, `content`, `student_id`, `lecturer_id`, `date_created`, `lecturer_class_id`) VALUES
(36, '', '', '<p>Hello</p>\r\n', 0, 20, '2023-11-05 20:38:13', 188),
(37, '', '', '<p>hello</p>\r\n', 0, 20, '2023-11-06 15:14:45', 187),
(38, '', '', '<p>yo students</p>\r\n', 0, 20, '2023-11-08 16:06:12', 187),
(39, '', '', '<p>ht</p>\r\n', 0, 20, '2023-11-08 17:18:45', 187);

-- --------------------------------------------------------

--
-- Table structure for table `discussion_replies`
--

CREATE TABLE `discussion_replies` (
  `reply_id` int(11) NOT NULL,
  `reply_content` text NOT NULL,
  `discussion_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `lecturer_id` int(11) DEFAULT NULL,
  `date_replied` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `discussion_replies`
--

INSERT INTO `discussion_replies` (`reply_id`, `reply_content`, `discussion_id`, `student_id`, `lecturer_id`, `date_replied`) VALUES
(3, '', 0, 15, 20, '2023-11-05 08:47:41'),
(4, '', 19, 15, 0, '2023-11-05 08:50:41'),
(5, '', 19, 15, 0, '2023-11-05 08:50:42'),
(6, '', 19, 15, 0, '2023-11-05 08:50:42'),
(7, '', 19, 15, 0, '2023-11-05 08:50:44'),
(8, '', 0, 15, 0, '2023-11-05 09:02:43'),
(9, '', 0, 20, 0, '2023-11-05 09:52:37'),
(10, '', 19, 15, 0, '2023-11-05 11:23:38'),
(11, '', 0, 15, 0, '2023-11-05 11:23:45'),
(12, '', 19, 15, 0, '2023-11-05 11:25:06'),
(13, 'hello', 19, 15, 0, '2023-11-05 11:27:50'),
(28, 'hello', 28, 15, 15, '2023-11-05 15:26:09'),
(29, 'hello', 27, 15, 15, '2023-11-05 15:26:09'),
(30, 'hello', 26, 15, 15, '2023-11-05 15:26:09'),
(31, 'hello', 25, 15, 15, '2023-11-05 15:26:09'),
(32, 'hello', 24, 15, 15, '2023-11-05 15:26:09'),
(33, 'hello', 23, 15, 15, '2023-11-05 15:26:09'),
(34, 'hello', 22, 15, 15, '2023-11-05 15:26:09'),
(35, 'hello', 21, 15, 15, '2023-11-05 15:26:09'),
(36, 'hello', 32, 15, 15, '2023-11-05 15:26:39'),
(37, 'hello', 31, 15, 15, '2023-11-05 15:26:39'),
(38, 'hello', 30, 15, 15, '2023-11-05 15:26:39'),
(39, 'hello', 29, 15, 15, '2023-11-05 15:26:39'),
(44, 'hello', 24, 15, 15, '2023-11-05 15:26:39'),
(45, 'hello', 23, 15, 15, '2023-11-05 15:26:39'),
(46, 'hello', 22, 15, 15, '2023-11-05 15:26:39'),
(47, 'hello', 21, 15, 15, '2023-11-05 15:26:39'),
(48, 'heyyyy', 36, 25, 25, '2023-11-05 20:43:00'),
(49, 'he', 36, 20, 0, '2023-11-05 20:49:30'),
(50, 'efd', 36, 20, 0, '2023-11-05 20:49:34'),
(51, 'efd', 36, 20, 0, '2023-11-05 20:56:44'),
(52, 'haha', 36, 20, 0, '2023-11-05 20:56:49'),
(53, 'hello', 35, 15, 15, '2023-11-06 14:48:07'),
(54, 'hello', 34, 15, 15, '2023-11-06 14:48:07'),
(55, 'hello', 30, 15, 15, '2023-11-06 14:48:07'),
(56, 'hello', 35, 15, 15, '2023-11-06 14:48:46'),
(57, 'hello', 34, 15, 15, '2023-11-06 14:48:46'),
(58, 'hello', 30, 15, 15, '2023-11-06 14:48:46'),
(59, 'hello miss\r\n', 35, 15, 15, '2023-11-06 14:49:01'),
(60, 'hello miss\r\n', 34, 15, 15, '2023-11-06 14:49:01'),
(61, 'hello miss\r\n', 30, 15, 15, '2023-11-06 14:49:01'),
(62, 'yo miss', 35, 15, 15, '2023-11-06 14:49:10'),
(63, 'yo miss', 34, 15, 15, '2023-11-06 14:49:10'),
(64, 'yo miss', 30, 15, 15, '2023-11-06 14:49:10'),
(65, 'i', 35, 15, 15, '2023-11-06 14:49:31'),
(66, 'i', 34, 15, 15, '2023-11-06 14:49:31'),
(67, 'i', 30, 15, 15, '2023-11-06 14:49:31'),
(68, 's', 35, 15, 15, '2023-11-06 14:58:28'),
(69, 'df', 35, 15, 15, '2023-11-06 14:58:33'),
(70, '', 35, 20, 0, '2023-11-06 15:07:08'),
(71, '', 34, 20, 0, '2023-11-06 15:07:08'),
(72, '', 30, 20, 0, '2023-11-06 15:07:08'),
(73, 'yo', 37, 15, 15, '2023-11-06 17:49:00'),
(74, 'he', 36, 15, 15, '2023-11-06 19:48:01'),
(75, 'lalala', 36, 15, 15, '2023-11-06 19:48:05'),
(76, 'lalala', 36, 15, 15, '2023-11-06 19:49:10'),
(77, 'is', 36, 15, 15, '2023-11-06 19:49:24'),
(78, 'is', 36, 15, 15, '2023-11-06 19:49:28'),
(79, 'is', 36, 15, 15, '2023-11-06 19:49:37'),
(80, 'ok', 36, 15, 15, '2023-11-06 19:49:42'),
(81, 'ok', 36, 15, 15, '2023-11-06 19:49:46'),
(82, 'ok', 36, 15, 15, '2023-11-06 19:49:48'),
(83, 'ok', 36, 15, 15, '2023-11-06 19:57:23'),
(84, 'hello\n', 36, NULL, NULL, '2023-11-06 19:57:29'),
(85, 'hello\n', 36, NULL, NULL, '2023-11-06 19:57:31'),
(86, 'hello\n', 36, NULL, NULL, '2023-11-06 19:57:33'),
(87, 'hello\n', 36, NULL, NULL, '2023-11-06 19:57:36'),
(88, 'hello\n', 36, NULL, NULL, '2023-11-06 19:57:36'),
(89, 'hello\n', 36, NULL, NULL, '2023-11-06 19:57:38'),
(90, 'ok', 36, 15, 15, '2023-11-06 20:00:11'),
(91, 'ok', 36, 15, 15, '2023-11-06 20:00:22'),
(92, 'ok', 36, 15, 15, '2023-11-06 20:07:36'),
(93, 'ok', 36, 15, 15, '2023-11-06 20:07:40'),
(94, 'hah', 36, 15, 15, '2023-11-06 20:07:48'),
(95, 'hah', 36, 15, 15, '2023-11-06 20:07:52'),
(96, '', 0, 15, 15, '2023-11-06 20:08:33'),
(97, 'hah', 0, 15, 15, '2023-11-06 20:09:13'),
(98, 'hello', 36, 0, 0, '2023-11-06 20:15:35'),
(99, 'jj', 36, 15, 15, '2023-11-06 20:16:41'),
(100, 'bibiana', 36, 15, 15, '2023-11-06 20:17:14'),
(101, 'iii', 37, 15, 15, '2023-11-06 20:45:17'),
(102, 'what do you want?', 36, 25, 25, '2023-11-06 20:47:50'),
(103, 'hello', 36, 25, 25, '2023-11-06 20:53:24'),
(104, 'kkk', 36, 25, 25, '2023-11-06 20:53:45'),
(105, 's', 36, 25, 25, '2023-11-06 20:55:16'),
(106, 'ds', 36, 25, 25, '2023-11-06 20:55:27'),
(107, 'jj', 36, 25, 25, '2023-11-06 20:59:18'),
(108, 'jsjsd', 36, 25, 25, '2023-11-06 20:59:32'),
(109, 'sdf', 36, 25, 25, '2023-11-06 21:04:00'),
(110, 'what do you want', 36, 25, 25, '2023-11-06 21:05:25'),
(111, 's', 36, 25, 25, '2023-11-06 21:08:28'),
(112, 's', 36, 25, 25, '2023-11-06 21:10:36'),
(113, 's', 36, 25, 25, '2023-11-06 21:15:05'),
(114, 'sdf', 36, 25, 25, '2023-11-06 21:20:13'),
(115, 'sd', 36, 25, 25, '2023-11-06 21:28:52'),
(116, 'sd', 36, 25, 25, '2023-11-06 21:28:52'),
(117, 'sa', 36, 0, 0, '2023-11-06 21:29:33'),
(118, 'sa', 36, 0, 0, '2023-11-06 21:29:33'),
(119, 'sd', 36, 0, 0, '2023-11-06 21:30:17'),
(120, 'sd', 36, 0, 0, '2023-11-06 21:30:17'),
(121, 'dsd', 36, 25, 25, '2023-11-06 21:30:33'),
(122, 'dsd', 36, 25, 25, '2023-11-06 21:30:33'),
(123, 'rrr', 36, 25, 25, '2023-11-06 21:30:41'),
(124, 'rrr', 36, 25, 25, '2023-11-06 21:30:41'),
(125, 's', 36, 25, 25, '2023-11-06 21:32:02'),
(126, 's', 36, 25, 25, '2023-11-06 21:32:02'),
(127, 's', 36, 25, 25, '2023-11-06 21:32:05'),
(128, 's', 36, 25, 25, '2023-11-06 21:32:05'),
(129, 's', 36, 25, 25, '2023-11-06 21:32:19'),
(130, 's', 36, 25, 25, '2023-11-06 21:32:19'),
(131, 'sdf', 36, 25, 25, '2023-11-06 21:36:21'),
(132, 'sd', 37, 25, 25, '2023-11-06 21:37:42'),
(133, 'sd', 37, 25, 25, '2023-11-06 21:42:45'),
(134, 'd', 37, 25, 25, '2023-11-06 21:43:05'),
(135, 'd', 37, 25, 25, '2023-11-06 21:43:20'),
(136, 'rfff', 37, 25, 25, '2023-11-06 21:43:27'),
(137, 'd', 37, 25, 25, '2023-11-06 21:44:36'),
(138, 'fdewwe', 37, 25, 25, '2023-11-06 21:44:46'),
(139, 's', 37, 25, 25, '2023-11-06 21:45:28'),
(140, 'dsd', 37, 25, 25, '2023-11-06 21:52:06'),
(141, 'sas', 37, 25, 25, '2023-11-06 21:52:28'),
(142, 'dsa', 37, 25, 25, '2023-11-06 21:52:43'),
(143, 'sdas', 37, 25, 25, '2023-11-06 21:53:46'),
(144, 'sasd', 37, 25, 25, '2023-11-06 21:54:21'),
(145, 'dasd', 37, 25, 25, '2023-11-06 21:55:48'),
(146, 'sffs', 37, 25, 25, '2023-11-06 21:56:29'),
(147, 'sds', 36, 20, 0, '2023-11-06 22:12:05'),
(148, 'hello', 36, 0, 0, '2023-11-06 22:18:06'),
(149, 'sd', 39, 0, 0, '2023-11-08 17:19:14'),
(150, 'sd', 38, 0, 0, '2023-11-08 17:19:14'),
(151, 'sd', 37, 0, 0, '2023-11-08 17:19:14');

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `event_id` int(11) NOT NULL,
  `event_title` varchar(100) NOT NULL,
  `lecturer_class_id` int(11) NOT NULL,
  `date_start` varchar(100) NOT NULL,
  `date_end` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`event_id`, `event_title`, `lecturer_class_id`, `date_start`, `date_end`) VALUES
(23, 'Mid sem break', 0, '11/08/2023', '11/16/2023'),
(25, 'Class Test', 187, '11/30/2023', '12/01/2023');

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `file_id` int(11) NOT NULL,
  `floc` varchar(500) NOT NULL,
  `fdatein` varchar(200) NOT NULL,
  `fdesc` varchar(100) NOT NULL,
  `lecturer_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `uploaded_by` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lecturer`
--

CREATE TABLE `lecturer` (
  `lecturer_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `department_id` int(11) NOT NULL,
  `location` varchar(200) NOT NULL,
  `about` varchar(500) NOT NULL,
  `lecturer_status` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `lecturer`
--

INSERT INTO `lecturer` (`lecturer_id`, `username`, `password`, `firstname`, `lastname`, `department_id`, `location`, `about`, `lecturer_status`, `email`) VALUES
(20, 'asvhini', '1234', 'Asvhini', 'Subramaniam', 4, 'uploads/hihi.jpg', '', 'Registered', 'pangkheryong@gmail.com'),
(24, 'shahriman', '1231', 'Mohd', 'Shahriman', 4, 'uploads/Diananagpal.jpg', '', 'Registered', ''),
(28, 'kooleechun', '1231', 'Koo', 'Lee Chun', 6, 'uploads/ksmann-150x150.jpg', '', 'Registered', ''),
(25, 'usha', '1231', 'Usha', 'Jayahkudy', 4, 'uploads/jappreet.jpg', '', 'Registered', ''),
(26, 'wendy', '1231', 'Wendy', 'Bong', 4, 'uploads/Sukhjit.jpg', '', 'Registered', ''),
(27, 'vasuky', '1231', 'Vasuky', 'Mohanan', 4, 'uploads/poonam.jpg', '', 'Registered', ''),
(29, 'vaithegy', '1231', 'Vaithegy', 'Krishnan', 4, 'uploads/vivekthapar.jpg', '', 'Registered', ''),
(30, 'lightlau', '1231', 'Light', 'Lau Teng Lye', 9, 'uploads/JNJHA.jpg', '', 'Registered', ''),
(34, 'Katherine', 'kl#1234', 'Katherine', 'Lim', 9, '', '', 'Registered', ''),
(0, 'a', 'y', 'r', 't', 0, '', '', 'Registered', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lecturer_backpack`
--

CREATE TABLE `lecturer_backpack` (
  `file_id` int(11) NOT NULL,
  `floc` varchar(100) NOT NULL,
  `fdatein` varchar(100) NOT NULL,
  `fdesc` varchar(100) NOT NULL,
  `lecturer_id` int(11) DEFAULT NULL,
  `fname` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lecturer_class`
--

CREATE TABLE `lecturer_class` (
  `lecturer_class_id` int(11) NOT NULL,
  `lecturer_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `thumbnails` varchar(100) NOT NULL,
  `school_year` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `lecturer_class`
--

INSERT INTO `lecturer_class` (`lecturer_class_id`, `lecturer_id`, `class_id`, `subject_id`, `thumbnails`, `school_year`) VALUES
(97, 9, 7, 15, 'admin/uploads/thumbnails.jpg', '2022-2023'),
(135, 0, 22, 29, 'admin/uploads/thumbnails.jpg', '2023-2024'),
(151, 5, 7, 14, 'admin/uploads/thumbnails.jpg', '2023-2024'),
(152, 5, 8, 14, 'admin/uploads/thumbnails.jpg', '2023-2024'),
(153, 5, 13, 36, 'admin/uploads/thumbnails.jpg', '2023-2024'),
(157, 18, 15, 23, 'admin/uploads/thumbnails.jpg', '2023-2024'),
(158, 18, 16, 23, 'admin/uploads/thumbnails.jpg', '2023-2024'),
(159, 18, 12, 23, 'admin/uploads/thumbnails.jpg', '2023-2024'),
(160, 18, 7, 29, 'admin/uploads/thumbnails.jpg', '2023-2024'),
(165, 134, 15, 23, 'admin/uploads/thumbnails.jpg', '2023-2024'),
(167, 12, 13, 35, 'admin/uploads/thumbnails.jpg', '2023-2024'),
(168, 12, 14, 35, 'admin/uploads/thumbnails.jpg', '2023-2024'),
(170, 12, 16, 24, 'admin/uploads/thumbnails.jpg', '2023-2024'),
(172, 18, 13, 39, 'admin/uploads/thumbnails.jpg', '2023-2024'),
(173, 18, 14, 39, 'admin/uploads/thumbnails.jpg', '2023-2024'),
(174, 13, 12, 16, 'admin/uploads/thumbnails.jpg', '2023-2024'),
(175, 13, 13, 16, 'admin/uploads/thumbnails.jpg', '2023-2024'),
(176, 13, 14, 16, 'admin/uploads/thumbnails.jpg', '2023-2024'),
(177, 14, 12, 32, 'admin/uploads/thumbnails.jpg', '2023-2024'),
(178, 14, 13, 32, 'admin/uploads/thumbnails.jpg', '2023-2024'),
(179, 14, 14, 32, 'admin/uploads/thumbnails.jpg', '2023-2024'),
(180, 19, 13, 22, 'admin/uploads/thumbnails.jpg', '2023-2024'),
(181, 12, 20, 24, 'admin/uploads/thumbnails.jpg', '2023-2024'),
(183, 12, 18, 24, 'admin/uploads/thumbnails.jpg', '2023-2024'),
(184, 12, 17, 25, 'admin/uploads/thumbnails.jpg', '2023-2024'),
(185, 12, 7, 22, 'admin/uploads/thumbnails.jpg', '2023-2024'),
(186, 9, 18, 42, 'admin/uploads/thumbnails.jpg', '2023-2024'),
(187, 20, 16, 14, 'admin/uploads/thumbnails.jpg', '2025-2026'),
(188, 20, 16, 22, 'admin/uploads/thumbnails.jpg', '2025-2026'),
(189, 20, 12, 17, 'admin/uploads/thumbnails.jpg', '2025-2026');

-- --------------------------------------------------------

--
-- Table structure for table `lecturer_class_announcements`
--

CREATE TABLE `lecturer_class_announcements` (
  `lecturer_class_announcements_id` int(11) NOT NULL,
  `content` varchar(500) NOT NULL,
  `lecturer_id` int(11) DEFAULT NULL,
  `lecturer_class_id` int(11) DEFAULT NULL,
  `date` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `lecturer_class_announcements`
--

INSERT INTO `lecturer_class_announcements` (`lecturer_class_announcements_id`, `content`, `lecturer_id`, `lecturer_class_id`, `date`) VALUES
(40, '<p>hello</p>\r\n', 20, 187, '2023-11-02 13:31:57');

-- --------------------------------------------------------

--
-- Table structure for table `lecturer_class_student`
--

CREATE TABLE `lecturer_class_student` (
  `lecturer_class_student_id` int(11) NOT NULL,
  `lecturer_class_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `lecturer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `lecturer_class_student`
--

INSERT INTO `lecturer_class_student` (`lecturer_class_student_id`, `lecturer_class_id`, `student_id`, `lecturer_id`) VALUES
(23, 25, 100, 20),
(31, 165, 141, 134),
(32, 165, 134, 134),
(62, 167, 100, 12),
(69, 167, 76, 12),
(70, 167, 107, 12),
(77, 167, 73, 12),
(79, 167, 71, 12),
(82, 168, 162, 12),
(97, 168, 179, 12),
(135, 172, 100, 18),
(142, 172, 76, 18),
(143, 172, 107, 18),
(150, 172, 73, 18),
(152, 172, 71, 18),
(155, 173, 162, 18),
(170, 173, 179, 18),
(177, 174, 134, 13),
(183, 174, 147, 13),
(193, 174, 157, 13),
(204, 175, 100, 13),
(211, 175, 76, 13),
(212, 175, 107, 13),
(219, 175, 73, 13),
(221, 175, 71, 13),
(224, 176, 162, 13),
(239, 176, 179, 13),
(246, 177, 134, 14),
(252, 177, 147, 14),
(262, 177, 157, 14),
(273, 178, 100, 14),
(280, 178, 76, 14),
(281, 178, 107, 14),
(288, 178, 73, 14),
(290, 178, 71, 14),
(293, 179, 162, 14),
(308, 179, 179, 14),
(323, 180, 100, 19),
(330, 180, 76, 19),
(331, 180, 107, 19),
(338, 180, 73, 19),
(340, 180, 71, 19),
(342, 181, 210, 12),
(346, 183, 214, 12),
(371, 184, 217, 12),
(373, 185, 93, 12),
(374, 185, 136, 12),
(380, 186, 162, 17),
(395, 186, 179, 17),
(403, 187, 210, 20),
(404, 187, 219, 20),
(410, 190, 210, 14),
(411, 190, 219, 14),
(415, 192, 210, 24),
(416, 192, 219, 24),
(417, 192, 220, 24),
(418, 192, 221, 24),
(419, 192, 222, 24),
(424, 194, 227, 24),
(425, 194, 228, 24),
(426, 195, 229, 24),
(427, 195, 230, 24),
(429, 196, 223, 24),
(430, 196, 224, 24),
(431, 196, 225, 24),
(432, 196, 226, 24),
(433, 197, 223, 20),
(434, 197, 224, 20),
(435, 197, 225, 20),
(436, 197, 226, 20),
(439, 198, 219, 20),
(440, 198, 220, 20),
(441, 198, 221, 20),
(442, 198, 222, 20),
(443, 0, 100, 20),
(446, 0, 71, 20),
(447, 0, 231, 20),
(448, 0, 15, 20),
(449, 0, 93, 20),
(450, 187, 107, 20),
(452, 187, 56, 20),
(453, 187, 15, 20),
(454, 187, 71, 20),
(455, 187, 25, 20),
(456, 188, 232, 20),
(457, 188, 15, 20),
(458, 188, 25, 20);

-- --------------------------------------------------------

--
-- Table structure for table `lecturer_notification`
--

CREATE TABLE `lecturer_notification` (
  `lecturer_notification_id` int(11) NOT NULL,
  `lecturer_class_id` int(11) DEFAULT NULL,
  `notification` varchar(100) NOT NULL,
  `date_of_notification` varchar(100) NOT NULL,
  `link` varchar(100) NOT NULL,
  `student_id` int(11) NOT NULL,
  `assignment_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lecturer_shared`
--

CREATE TABLE `lecturer_shared` (
  `lecturer_shared_id` int(11) NOT NULL,
  `lecturer_id` int(11) DEFAULT NULL,
  `shared_lecturer_id` int(11) DEFAULT NULL,
  `floc` varchar(100) NOT NULL,
  `fdatein` varchar(100) NOT NULL,
  `fdesc` varchar(100) NOT NULL,
  `fname` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `message_id` int(11) NOT NULL,
  `reciever_id` int(11) NOT NULL,
  `content` varchar(200) NOT NULL,
  `date_sended` varchar(100) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `reciever_name` varchar(50) NOT NULL,
  `sender_name` varchar(200) NOT NULL,
  `message_status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`message_id`, `reciever_id`, `content`, `date_sended`, `sender_id`, `reciever_name`, `sender_name`, `message_status`) VALUES
(35, 20, 'hello', '2023-11-04 03:15:35', 15, 'Asvhini Subramaniam', 'Peter Pang Kher Yong', 'read'),
(36, 15, 'hello peter', '2023-11-04 16:35:05', 20, 'Peter Pang Kher Yong', 'Asvhini Subramaniam', 'read'),
(37, 15, 'miss, I am struggling on FYP!!!!', '2023-11-04 16:35:36', 20, 'Peter Pang Kher Yong', 'Asvhini Subramaniam', 'read'),
(38, 20, 'Hi miss', '2023-11-04 16:36:23', 20, 'Asvhini Subramaniam', ' ', 'read'),
(39, 15, 'hello peter', '2023-11-04 16:43:37', 15, 'Peter Pang Kher Yong', ' ', 'read'),
(40, 20, 'hi miss', '2023-11-04 16:44:27', 15, 'Asvhini Subramaniam', 'Peter Pang Kher Yong', 'read'),
(45, 20, 'yo', '2023-11-05 14:10:24', 15, 'Asvhini Subramaniam', 'Peter Pang Kher Yong', 'read'),
(47, 20, 'ssd', '2023-11-09 00:10:54', 15, 'Asvhini Subramaniam', 'Peter Pang Kher Yong', ''),
(48, 20, 'I love you miss', '2023-11-15 00:26:30', 15, 'Asvhini Subramaniam', 'Peter Pang Kher Yong', ''),
(50, 20, 'I want to ponteng class', '2023-11-15 00:29:21', 20, 'Asvhini Subramaniam', ' ', '');

-- --------------------------------------------------------

--
-- Table structure for table `message_sent`
--

CREATE TABLE `message_sent` (
  `message_sent_id` int(11) NOT NULL,
  `reciever_id` int(11) NOT NULL,
  `content` varchar(200) NOT NULL,
  `date_sended` varchar(100) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `reciever_name` varchar(100) NOT NULL,
  `sender_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `message_sent`
--

INSERT INTO `message_sent` (`message_sent_id`, `reciever_id`, `content`, `date_sended`, `sender_id`, `reciever_name`, `sender_name`) VALUES
(20, 20, 'hello', '2023-11-04 03:15:35', 15, 'Asvhini Subramaniam', 'Peter Pang Kher Yong'),
(21, 15, 'hello peter', '2023-11-04 16:35:05', 20, 'Peter Pang Kher Yong', 'Asvhini Subramaniam'),
(22, 15, 'miss, I am struggling on FYP!!!!', '2023-11-04 16:35:36', 20, 'Peter Pang Kher Yong', 'Asvhini Subramaniam'),
(23, 20, 'Hi miss', '2023-11-04 16:36:23', 20, 'Asvhini Subramaniam', ' '),
(24, 15, 'hello peter', '2023-11-04 16:43:37', 15, 'Peter Pang Kher Yong', ' '),
(25, 20, 'hi miss', '2023-11-04 16:44:27', 15, 'Asvhini Subramaniam', 'Peter Pang Kher Yong'),
(27, 20, 'Hello miss', '2023-11-05 14:06:52', 15, 'Asvhini Subramaniam', 'Peter Pang Kher Yong'),
(28, 15, 'hello peter', '2023-11-05 14:07:48', 20, 'Peter Pang Kher Yong', 'Asvhini Subramaniam'),
(30, 20, 'yo', '2023-11-05 14:10:24', 15, 'Asvhini Subramaniam', 'Peter Pang Kher Yong'),
(32, 20, 'ssd', '2023-11-09 00:10:54', 15, 'Asvhini Subramaniam', 'Peter Pang Kher Yong'),
(34, 15, 'Please siam', '2023-11-15 00:28:12', 20, 'Peter Pang Kher Yong', 'Asvhini Subramaniam'),
(35, 20, 'I want to ponteng class', '2023-11-15 00:29:21', 20, 'Asvhini Subramaniam', ' ');

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `notification_id` int(11) NOT NULL,
  `lecturer_class_id` int(11) DEFAULT NULL,
  `notification` varchar(100) NOT NULL,
  `date_of_notification` varchar(50) NOT NULL,
  `link` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`notification_id`, `lecturer_class_id`, `notification`, `date_of_notification`, `link`) VALUES
(36, 187, 'Add Assignment file name <b>s</b>', '2023-11-04 03:34:40', 'assignment_student.php'),
(37, 187, 'Add Practice Quiz file', '2023-11-04 03:49:27', 'student_quiz_list.php'),
(38, 187, 'Add Practice Quiz file', '2023-11-05 00:49:16', 'student_quiz_list.php'),
(39, 187, 'New Discussion', '2023-11-05 20:52:42', 'discussion_board_student.php'),
(40, 187, 'New Discussion', '2023-11-05 20:52:48', 'discussion_board_student.php'),
(41, 187, 'New Discussion', '2023-11-05 20:53:34', 'discussion_board_student.php'),
(42, 187, 'New Discussion', '2023-11-05 21:29:42', 'discussion_board_student.php'),
(43, 187, 'New Discussion', '2023-11-05 21:30:21', 'discussion_board_student.php'),
(44, 187, 'New Discussion', '2023-11-05 21:59:54', 'discussion_board_lecturer.php'),
(45, 187, 'New Discussion', '2023-11-05 22:25:59', 'discussion_board_lecturer.php'),
(46, 187, 'New Discussion', '2023-11-05 22:46:08', 'discussion_board_lecturer.php'),
(47, 187, 'New Discussion Board Created', '2023-11-05 22:50:52', 'discussion_board_student.php'),
(48, 187, 'New Discussion Board Created', '2023-11-05 22:56:10', 'discussion_board_student.php'),
(49, 187, 'New Discussion Board Created', '2023-11-05 23:01:19', 'discussion_board_student.php'),
(50, 187, 'New Discussion Board Created', '2023-11-05 23:25:39', 'discussion_board_student.php'),
(51, 187, 'New Discussion Board Created', '2023-11-05 23:30:29', 'discussion_board_student.php'),
(52, 187, 'New Discussion Board Created', '2023-11-06 01:30:25', 'discussion_board_student.php'),
(53, 187, 'New Discussion Board Created', '2023-11-06 02:51:06', 'discussion_board_student.php'),
(54, 188, 'New Discussion Board Created', '2023-11-06 04:38:13', 'discussion_board_student.php'),
(55, 187, 'Add Assignment file name <b>g</b>', '2023-11-06 15:50:22', 'assignment_student.php'),
(56, 187, 'Add Assignment file name <b>e</b>', '2023-11-06 16:10:39', 'assignment_student.php'),
(57, 0, 'Add Assignment file name <b>t</b>', '2023-11-06 16:31:19', 'assignment_student.php'),
(58, 0, 'Add Assignment file name <b>r</b>', '2023-11-06 16:32:55', 'assignment_student.php'),
(59, 0, 'Add Assignment file name <b>r</b>', '2023-11-06 16:33:20', 'assignment_student.php'),
(60, 0, 'Add Assignment file name <b>tr</b>', '2023-11-06 16:36:18', 'assignment_student.php'),
(61, 0, 'Add Assignment file name <b>d</b>', '2023-11-06 16:38:39', 'assignment_student.php'),
(62, 0, 'Add Assignment file name <b>a</b>', '2023-11-06 19:07:31', 'assignment_student.php'),
(63, 187, 'Add Assignment file name <b>w</b>', '2023-11-06 20:10:27', 'assignment_student.php'),
(64, 0, 'Add Assignment file name <b>e</b>', '2023-11-06 20:10:50', 'assignment_student.php'),
(65, 187, 'New Discussion Board Created', '2023-11-06 23:14:45', 'discussion_board_student.php'),
(66, 187, 'New Discussion Board Created', '2023-11-09 00:06:12', 'discussion_board_student.php'),
(67, 187, 'Add Practice Quiz file', '2023-11-09 00:13:46', 'student_quiz_list.php'),
(68, 187, 'New Discussion Board Created', '2023-11-09 01:18:45', 'discussion_board_student.php'),
(69, 0, 'Add Assignment file name <b>e</b>', '2023-11-09 04:07:19', 'assignment_student.php'),
(70, 0, 'Add Assignment file name <b>e</b>', '2023-11-09 04:07:57', 'assignment_student.php');

-- --------------------------------------------------------

--
-- Table structure for table `notification_read`
--

CREATE TABLE `notification_read` (
  `notification_read_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `student_read` varchar(50) NOT NULL,
  `notification_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `notification_read`
--

INSERT INTO `notification_read` (`notification_read_id`, `student_id`, `student_read`, `notification_id`) VALUES
(1, 225, 'yes', 15),
(2, 225, 'yes', 16),
(3, 225, 'yes', 17),
(4, 15, 'yes', 20),
(5, 15, 'yes', 19),
(6, 100, 'yes', 20),
(7, 100, 'yes', 19),
(8, 15, 'yes', 23),
(9, 15, 'yes', 23),
(10, 15, 'yes', 23),
(11, 15, 'yes', 23),
(12, 15, 'yes', 14),
(13, 15, 'yes', 14),
(14, 15, 'yes', 14),
(15, 15, 'yes', 14),
(16, 15, 'yes', 13),
(17, 15, 'yes', 13),
(18, 15, 'yes', 13),
(19, 15, 'yes', 13),
(20, 15, 'yes', 12),
(21, 15, 'yes', 12),
(22, 15, 'yes', 12),
(23, 15, 'yes', 12),
(24, 15, 'yes', 11),
(25, 15, 'yes', 11),
(26, 15, 'yes', 11),
(27, 15, 'yes', 11),
(28, 15, 'yes', 8),
(29, 15, 'yes', 8),
(30, 15, 'yes', 8),
(31, 15, 'yes', 8),
(32, 15, 'yes', 7),
(33, 15, 'yes', 7),
(34, 15, 'yes', 7),
(35, 15, 'yes', 7),
(36, 15, 'yes', 6),
(37, 15, 'yes', 6),
(38, 15, 'yes', 6),
(39, 15, 'yes', 6),
(40, 15, 'yes', 4),
(41, 15, 'yes', 4),
(42, 15, 'yes', 4),
(43, 15, 'yes', 4),
(44, 15, 'yes', 30),
(45, 15, 'yes', 30),
(46, 15, 'yes', 30),
(47, 15, 'yes', 30),
(48, 15, 'yes', 29),
(49, 15, 'yes', 29),
(50, 15, 'yes', 29),
(51, 15, 'yes', 29),
(52, 15, 'yes', 28),
(53, 15, 'yes', 28),
(54, 15, 'yes', 28),
(55, 15, 'yes', 28),
(56, 15, 'yes', 27),
(57, 15, 'yes', 27),
(58, 15, 'yes', 27),
(59, 15, 'yes', 27),
(60, 15, 'yes', 26),
(61, 15, 'yes', 26),
(62, 15, 'yes', 26),
(63, 15, 'yes', 26),
(64, 15, 'yes', 25),
(65, 15, 'yes', 25),
(66, 15, 'yes', 25),
(67, 15, 'yes', 25),
(68, 15, 'yes', 24),
(69, 15, 'yes', 24),
(70, 15, 'yes', 24),
(71, 15, 'yes', 24),
(72, 15, 'yes', 31),
(73, 15, 'yes', 31),
(74, 15, 'yes', 32),
(75, 15, 'yes', 32),
(76, 15, 'yes', 32),
(77, 15, 'yes', 32),
(78, 15, 'yes', 33),
(79, 15, 'yes', 33),
(80, 15, 'yes', 33),
(82, 25, 'yes', 38),
(83, 25, 'yes', 37),
(84, 25, 'yes', 36),
(85, 25, 'yes', 51),
(86, 25, 'yes', 50),
(87, 25, 'yes', 49),
(88, 25, 'yes', 48),
(89, 25, 'yes', 47),
(90, 25, 'yes', 46),
(91, 25, 'yes', 45),
(92, 25, 'yes', 44),
(93, 25, 'yes', 43),
(94, 25, 'yes', 42),
(95, 25, 'yes', 41),
(96, 25, 'yes', 40),
(97, 25, 'yes', 39),
(98, 25, 'yes', 65),
(99, 25, 'yes', 63),
(100, 25, 'yes', 56),
(101, 25, 'yes', 55),
(102, 25, 'yes', 54),
(103, 25, 'yes', 53),
(104, 25, 'yes', 52);

-- --------------------------------------------------------

--
-- Table structure for table `notification_read_lecturer`
--

CREATE TABLE `notification_read_lecturer` (
  `notification_read_lecturer_id` int(11) NOT NULL,
  `lecturer_id` int(11) DEFAULT NULL,
  `student_read` varchar(100) NOT NULL,
  `notification_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `question_type`
--

CREATE TABLE `question_type` (
  `question_type_id` int(11) NOT NULL,
  `question_type` varchar(150) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

CREATE TABLE `quiz` (
  `quiz_id` int(11) NOT NULL,
  `quiz_title` varchar(50) NOT NULL,
  `quiz_description` varchar(100) NOT NULL,
  `date_added` varchar(100) NOT NULL,
  `lecturer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `quiz`
--

INSERT INTO `quiz` (`quiz_id`, `quiz_title`, `quiz_description`, `date_added`, `lecturer_id`) VALUES
(3, 'Sample Test', 'Test', '2023-10-03 23:01:56', 12),
(4, 'Chapter 1', 'topics', '2023-10-13 01:51:02', 14),
(5, 'test3', '123', '2023-10-16 04:12:07', 12),
(6, 'PHP', 'Basics of PHP', '2023-10-18 21:27:03', 20),
(7, 'Hello', 's', '2023-10-29 04:13:24', 20),
(8, 'he', 'w', '2023-10-30 19:41:53', 24);

-- --------------------------------------------------------

--
-- Table structure for table `quiz_question`
--

CREATE TABLE `quiz_question` (
  `quiz_question_id` int(11) NOT NULL,
  `quiz_id` int(11) NOT NULL,
  `question_text` varchar(100) NOT NULL,
  `question_type_id` int(11) NOT NULL,
  `points` int(11) NOT NULL,
  `date_added` varchar(100) NOT NULL,
  `answer` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `quiz_question`
--

INSERT INTO `quiz_question` (`quiz_question_id`, `quiz_id`, `question_text`, `question_type_id`, `points`, `date_added`, `answer`) VALUES
(33, 5, '<p>q</p>\r\n', 2, 0, '2014-01-17 04:15:03', 'False'),
(34, 3, '<p>Php Stands for ?</p>\r\n', 1, 0, '2014-01-17 12:25:17', 'C'),
(35, 3, '<p>Echo is a Php code that display the output.</p>\r\n', 2, 0, '2014-01-17 12:26:18', 'True'),
(36, 6, '<p>Is php a server side language ?</p>\r\n', 2, 0, '2015-12-18 21:27:33', 'True'),
(37, 6, '<p>PHP stand for ?</p>\r\n', 1, 0, '2015-12-18 21:28:52', 'A'),
(38, 6, '<p>Php can&#39;t be used for Bigger Projects ?</p>\r\n', 2, 0, '2015-12-18 21:30:20', 'False'),
(39, 8, '<p>we?<br />\r\nsffwq<br />\r\n&nbsp;</p>\r\n', 1, 0, '2023-10-30 19:42:13', '');

-- --------------------------------------------------------

--
-- Table structure for table `school_year`
--

CREATE TABLE `school_year` (
  `school_year_id` int(11) NOT NULL,
  `school_year` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `school_year`
--

INSERT INTO `school_year` (`school_year_id`, `school_year`) VALUES
(2, '2023-2024'),
(3, '2024-2025'),
(4, '2025-2026');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `student_id` int(11) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `class_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `email` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`student_id`, `firstname`, `lastname`, `class_id`, `username`, `password`, `location`, `status`, `email`) VALUES
(56, 'Chng', 'Kai Siang', 13, '21100303', '1234', 'uploads/jamila.jpg', 'Registered', 'chngkaisiang@gmail.com'),
(25, 'Bibiana', 'Lee Zi Ying', 7, '111', '222', 'uploads/3094_384893504898082_1563225657_n.jpg', 'Registered', 'p20012724@student.newinti.edu.my'),
(19, 'Tan', 'Zhen Ying', 13, '21100555', '123', 'uploads/maica.jpg', 'Registered', 'zhenyingtan@gmail.com'),
(107, 'Lee', 'Wei Shen', 13, '29001002', '1234', 'uploads/harry.jpg', 'Registered', 'weishenlee@gmail.com'),
(15, 'Peter', 'Pang Kher Yong', 13, 'peter2312', '1234', 'uploads/Cat.jpg', 'Registered', ''),
(71, 'Jason', 'Lee', 13, '21100556', 'noledel', 'uploads/noli.jpg', 'Registered', NULL),
(231, 'Ong', 'Chun Chee', 17, '12', 'occ1234', '', 'Registered', NULL),
(232, 'Ong', 'Yu Yong', 16, '134', '', 'uploads/NO-IMAGE-AVAILABLE.jpg', 'Unregistered', NULL),
(234, 'Ooos', 'wwee', 16, '1234', '', 'uploads/NO-IMAGE-AVAILABLE.jpg', 'Unregistered', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `student_assignment`
--

CREATE TABLE `student_assignment` (
  `student_assignment_id` int(11) NOT NULL,
  `assignment_id` int(11) NOT NULL,
  `floc` varchar(100) NOT NULL,
  `assignment_fdatein` varchar(50) NOT NULL,
  `fdesc` varchar(100) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `student_id` int(11) NOT NULL,
  `grade` varchar(5) DEFAULT NULL,
  `lecturer_class_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `student_assignment`
--

INSERT INTO `student_assignment` (`student_assignment_id`, `assignment_id`, `floc`, `assignment_fdatein`, `fdesc`, `fname`, `student_id`, `grade`, `lecturer_class_id`) VALUES
(8, 34, 'admin/uploads/1008_File_PETER PANG KHER YONG Internship letter.pdf', '2023-11-06 16:36:18', 'r', 'tr', 15, '60', NULL),
(9, 34, 'admin/uploads/1208_File_PETER PANG KHER YONG Internship letter.pdf', '2023-11-06 16:38:39', 'f', 'd', 15, '90', NULL),
(10, 33, 'admin/uploads/9364_File_PETER PANG KHER YONG Internship letter.pdf', '2023-11-06 19:07:31', 'd', 'a', 15, '76', NULL),
(11, 35, 'admin/uploads/2519_File_PETER PANG KHER YONG Internship letter.pdf', '2023-11-06 20:10:50', 'R', 'e', 15, '65', NULL),
(12, 34, 'admin/uploads/8430_File_PETER PANG KHER YONG Internship letter.pdf', '2023-11-09 04:07:19', 'r', 'e', 15, '85', NULL),
(13, 35, 'admin/uploads/4031_File_PETER PANG KHER YONG Internship letter.pdf', '2023-11-09 04:07:57', 'r', 'e', 15, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `student_backpack`
--

CREATE TABLE `student_backpack` (
  `file_id` int(11) NOT NULL,
  `floc` varchar(100) NOT NULL,
  `fdatein` varchar(100) NOT NULL,
  `fdesc` varchar(100) NOT NULL,
  `student_id` int(11) NOT NULL,
  `fname` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `student_backpack`
--

INSERT INTO `student_backpack` (`file_id`, `floc`, `fdatein`, `fdesc`, `student_id`, `fname`) VALUES
(1, '\'admin/uploads/2658_File_kevin.docx\'', '\'2014-02-13 11:11:50\'', '\'test\'', 210, '\'test\''),
(2, '\'admin/uploads/5704_File_3 MISTAKES OF MY LIFE.pdf\'', '\'2015-12-18 21:47:54\'', '\'It is a novel by chetan bhagat\'', 225, '\'3 Mistakes Of my life\'');

-- --------------------------------------------------------

--
-- Table structure for table `student_class_quiz`
--

CREATE TABLE `student_class_quiz` (
  `student_class_quiz_id` int(11) NOT NULL,
  `class_quiz_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `student_quiz_time` varchar(100) NOT NULL,
  `grade` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `student_class_quiz`
--

INSERT INTO `student_class_quiz` (`student_class_quiz_id`, `class_quiz_id`, `student_id`, `student_quiz_time`, `grade`) VALUES
(1, 15, 107, '3600', '0 out of 2'),
(2, 16, 136, '\'3600\'', '\'0 out of 0\''),
(3, 17, 225, '\'3600\'', '\'1 out of 3\''),
(4, 17, 224, '\'3599\'', '\'1 out of 3\''),
(5, 18, 15, '3594', '1 out of 3'),
(6, 19, 15, '3600', '0 out of 0'),
(7, 19, 25, '3590', '0 out of 0'),
(8, 18, 25, '3600', '1 out of 3');

-- --------------------------------------------------------

--
-- Table structure for table `student_performance`
--

CREATE TABLE `student_performance` (
  `student_performance_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `assignment_grade` int(11) NOT NULL,
  `quiz_score` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `subject_id` int(11) NOT NULL,
  `subject_code` varchar(100) NOT NULL,
  `subject_title` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `unit` int(11) NOT NULL,
  `Pre_req` varchar(100) NOT NULL,
  `semester` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`subject_id`, `subject_code`, `subject_title`, `category`, `description`, `unit`, `Pre_req`, `semester`) VALUES
(14, '5001CEM', 'Advanced Algorithms', '', 'This subject comprises topics about systems development, SLC methodologies, Conceptual Framework, and FD and Flowchart analysis.', 3, '', '2023-2024'),
(15, 'DCS1104', 'Database Management', '', 'This subject comprises topics about systems development, SLC methodologies, Conceptual Framework, and FD and Flowchart analysis.', 3, '', '2023-2024'),
(16, 'BTCS503', 'Programming Languages', '', 'This subject comprises topics about systems development, SLC methodologies, Conceptual Framework, and FD and Flowchart analysis.', 3, '', '2023-2024'),
(17, 'BTCS504', 'Design & Analysis of Algorithms', '', 'This subject comprises topics about systems development, SLC methodologies, Conceptual Framework, and FD and Flowchart analysis.', 3, '', '2023-2024'),
(22, '5003CEM', 'Software Engineering', '', 'This subject comprises topics about systems development, SLC methodologies, Conceptual Framework, and FD and Flowchart analysis.', 3, '', '2nd'),
(23, 'IS 222', 'Network and Internet Technology', '', 'This subject comprises topics about systems development, SLC methodologies, Conceptual Framework, and FD and Flowchart analysis.', 3, '', '2nd'),
(24, 'BTCS505', 'Computer Graphics', '', 'This subject comprises topics about systems development, SLC methodologies, Conceptual Framework, and FD and Flowchart analysis.', 3, '', '2nd'),
(25, 'BTCSE-303', 'Data Structures', '', 'This subject comprises topics about systems development, SLC methodologies, Conceptual Framework, and FD and Flowchart analysis.', 3, '', '2nd'),
(32, 'BTCSE-302', 'Digital Circuits & Logic Design', '', 'This subject comprises topics about systems development, SLC methodologies, Conceptual Framework, and FD and Flowchart analysis.', 3, '', '2nd'),
(36, 'IS 324', 'Web Technologies', '', 'This subject comprises topics about systems development, SLC methodologies, Conceptual Framework, and FD and Flowchart analysis.', 3, '', '2nd'),
(37, 'BTCS506', 'Operating System', '', 'This subject comprises topics about systems development, SLC methodologies, Conceptual Framework, and FD and Flowchart analysis.', 3, '', '2nd');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `firstname`, `lastname`) VALUES
(14, 'james', '1234', 'James', 'Pang Kher Jun'),
(16, 'peterpang', '23122002', 'Peter', 'Pang Kher Yong');

-- --------------------------------------------------------

--
-- Table structure for table `user_log`
--

CREATE TABLE `user_log` (
  `user_log_id` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `login_date` varchar(30) NOT NULL,
  `logout_date` varchar(30) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_log`
--

INSERT INTO `user_log` (`user_log_id`, `username`, `login_date`, `logout_date`, `user_id`) VALUES
(86, 'peterpang', '2023-11-02 03:09:53', '2023-11-15 00:24:42', 16),
(87, 'james', '2023-11-02 03:10:23', '', 14),
(88, 'peterpang', '2023-11-02 03:23:58', '2023-11-15 00:24:42', 16),
(89, 'peterpang', '2023-11-02 04:26:04', '2023-11-15 00:24:42', 16),
(90, 'peterpang', '2023-11-02 15:01:39', '2023-11-15 00:24:42', 16),
(91, 'peterpang', '2023-11-02 15:03:03', '2023-11-15 00:24:42', 16),
(92, 'peterpang', '2023-11-04 04:45:19', '2023-11-15 00:24:42', 16),
(93, 'peterpang', '2023-11-05 18:11:43', '2023-11-15 00:24:42', 16),
(94, 'peterpang', '2023-11-06 22:14:31', '2023-11-15 00:24:42', 16),
(95, 'peterpang', '2023-11-07 17:38:17', '2023-11-15 00:24:42', 16),
(96, 'peterpang', '2023-11-07 23:29:08', '2023-11-15 00:24:42', 16),
(97, 'peterpang', '2023-11-08 21:30:42', '2023-11-15 00:24:42', 16),
(98, 'peterpang', '2023-11-09 02:02:09', '2023-11-15 00:24:42', 16),
(99, 'peterpang', '2023-11-09 07:49:06', '2023-11-15 00:24:42', 16),
(100, 'peterpang', '2023-11-09 08:11:23', '2023-11-15 00:24:42', 16),
(101, 'peterpang', '2023-11-15 00:09:11', '2023-11-15 00:24:42', 16);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`activity_log_id`);

--
-- Indexes for table `answer`
--
ALTER TABLE `answer`
  ADD PRIMARY KEY (`answer_id`);

--
-- Indexes for table `assignment`
--
ALTER TABLE `assignment`
  ADD PRIMARY KEY (`assignment_id`);

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`class_id`);

--
-- Indexes for table `class_quiz`
--
ALTER TABLE `class_quiz`
  ADD PRIMARY KEY (`class_quiz_id`);

--
-- Indexes for table `class_subject_overview`
--
ALTER TABLE `class_subject_overview`
  ADD PRIMARY KEY (`class_subject_overview_id`);

--
-- Indexes for table `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`content_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`department_id`);

--
-- Indexes for table `discussions`
--
ALTER TABLE `discussions`
  ADD PRIMARY KEY (`discussion_id`);

--
-- Indexes for table `discussion_replies`
--
ALTER TABLE `discussion_replies`
  ADD PRIMARY KEY (`reply_id`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`event_id`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`file_id`);

--
-- Indexes for table `lecturer`
--
ALTER TABLE `lecturer`
  ADD PRIMARY KEY (`lecturer_id`);

--
-- Indexes for table `lecturer_backpack`
--
ALTER TABLE `lecturer_backpack`
  ADD PRIMARY KEY (`file_id`);

--
-- Indexes for table `lecturer_class`
--
ALTER TABLE `lecturer_class`
  ADD PRIMARY KEY (`lecturer_class_id`);

--
-- Indexes for table `lecturer_class_announcements`
--
ALTER TABLE `lecturer_class_announcements`
  ADD PRIMARY KEY (`lecturer_class_announcements_id`);

--
-- Indexes for table `lecturer_class_student`
--
ALTER TABLE `lecturer_class_student`
  ADD PRIMARY KEY (`lecturer_class_student_id`);

--
-- Indexes for table `lecturer_notification`
--
ALTER TABLE `lecturer_notification`
  ADD PRIMARY KEY (`lecturer_notification_id`);

--
-- Indexes for table `lecturer_shared`
--
ALTER TABLE `lecturer_shared`
  ADD PRIMARY KEY (`lecturer_shared_id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`message_id`);

--
-- Indexes for table `message_sent`
--
ALTER TABLE `message_sent`
  ADD PRIMARY KEY (`message_sent_id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`notification_id`);

--
-- Indexes for table `notification_read`
--
ALTER TABLE `notification_read`
  ADD PRIMARY KEY (`notification_read_id`);

--
-- Indexes for table `notification_read_lecturer`
--
ALTER TABLE `notification_read_lecturer`
  ADD PRIMARY KEY (`notification_read_lecturer_id`);

--
-- Indexes for table `question_type`
--
ALTER TABLE `question_type`
  ADD PRIMARY KEY (`question_type_id`);

--
-- Indexes for table `quiz`
--
ALTER TABLE `quiz`
  ADD PRIMARY KEY (`quiz_id`);

--
-- Indexes for table `quiz_question`
--
ALTER TABLE `quiz_question`
  ADD PRIMARY KEY (`quiz_question_id`);

--
-- Indexes for table `school_year`
--
ALTER TABLE `school_year`
  ADD PRIMARY KEY (`school_year_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_id`);

--
-- Indexes for table `student_assignment`
--
ALTER TABLE `student_assignment`
  ADD PRIMARY KEY (`student_assignment_id`);

--
-- Indexes for table `student_backpack`
--
ALTER TABLE `student_backpack`
  ADD PRIMARY KEY (`file_id`);

--
-- Indexes for table `student_class_quiz`
--
ALTER TABLE `student_class_quiz`
  ADD PRIMARY KEY (`student_class_quiz_id`);

--
-- Indexes for table `student_performance`
--
ALTER TABLE `student_performance`
  ADD PRIMARY KEY (`student_performance_id`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`subject_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_log`
--
ALTER TABLE `user_log`
  ADD PRIMARY KEY (`user_log_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `activity_log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `answer`
--
ALTER TABLE `answer`
  MODIFY `answer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `assignment`
--
ALTER TABLE `assignment`
  MODIFY `assignment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
  MODIFY `class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `class_quiz`
--
ALTER TABLE `class_quiz`
  MODIFY `class_quiz_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `class_subject_overview`
--
ALTER TABLE `class_subject_overview`
  MODIFY `class_subject_overview_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `content`
--
ALTER TABLE `content`
  MODIFY `content_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `discussions`
--
ALTER TABLE `discussions`
  MODIFY `discussion_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `discussion_replies`
--
ALTER TABLE `discussion_replies`
  MODIFY `reply_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `lecturer_backpack`
--
ALTER TABLE `lecturer_backpack`
  MODIFY `file_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lecturer_class`
--
ALTER TABLE `lecturer_class`
  MODIFY `lecturer_class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=190;

--
-- AUTO_INCREMENT for table `lecturer_class_announcements`
--
ALTER TABLE `lecturer_class_announcements`
  MODIFY `lecturer_class_announcements_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `lecturer_class_student`
--
ALTER TABLE `lecturer_class_student`
  MODIFY `lecturer_class_student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=459;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `message_sent`
--
ALTER TABLE `message_sent`
  MODIFY `message_sent_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `notification_read`
--
ALTER TABLE `notification_read`
  MODIFY `notification_read_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `quiz`
--
ALTER TABLE `quiz`
  MODIFY `quiz_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `quiz_question`
--
ALTER TABLE `quiz_question`
  MODIFY `quiz_question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `school_year`
--
ALTER TABLE `school_year`
  MODIFY `school_year_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=235;

--
-- AUTO_INCREMENT for table `student_assignment`
--
ALTER TABLE `student_assignment`
  MODIFY `student_assignment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `student_backpack`
--
ALTER TABLE `student_backpack`
  MODIFY `file_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `student_class_quiz`
--
ALTER TABLE `student_class_quiz`
  MODIFY `student_class_quiz_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `user_log`
--
ALTER TABLE `user_log`
  MODIFY `user_log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
