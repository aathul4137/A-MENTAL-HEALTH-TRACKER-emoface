-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 16, 2023 at 11:48 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `emoface`
--

-- --------------------------------------------------------

--
-- Table structure for table `analysis`
--

CREATE TABLE `analysis` (
  `u_id` int(11) NOT NULL,
  `question_no` int(11) NOT NULL,
  `answer` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cbot`
--

CREATE TABLE `cbot` (
  `cbot_id` int(11) NOT NULL,
  `resp` varchar(100) NOT NULL,
  `quest` varchar(50) NOT NULL,
  `uid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-03-12 07:29:15.460978'),
(2, 'auth', '0001_initial', '2023-03-12 07:29:15.983267'),
(3, 'admin', '0001_initial', '2023-03-12 07:29:16.140351'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-03-12 07:29:16.155999'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-03-12 07:29:16.171620'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-03-12 07:29:16.234377'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-03-12 07:29:16.291582'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-03-12 07:29:16.314258'),
(9, 'auth', '0004_alter_user_username_opts', '2023-03-12 07:29:16.329778'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-03-12 07:29:16.372258'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-03-12 07:29:16.377484'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-03-12 07:29:16.377484'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-03-12 07:29:16.409257'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-03-12 07:29:16.424901'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-03-12 07:29:16.456137'),
(16, 'auth', '0011_update_proxy_permissions', '2023-03-12 07:29:16.471836'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-03-12 07:29:16.504538'),
(18, 'sessions', '0001_initial', '2023-03-12 07:29:16.550858');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('khkyxf50xakw8s2vxgfe3iq0ip5vwl2u', 'eyJyZXEiOiJMb3cgUmlzayJ9:1pbG9n:iFJofhea7LKcHjcTvuL7mzgNeWRos4vmVHwHV94auds', '2023-03-26 07:30:15.407963');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `login_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `u_id` int(11) NOT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`login_id`, `username`, `password`, `u_id`, `type`) VALUES
(2, 'aswani', 'aswani@123', 22, 'user'),
(3, 'aswani', 'aswani@123', 23, 'user'),
(4, 'athul', 'athul@123', 24, 'user'),
(5, 'chithra', 'chithra369', 25, 'user'),
(6, 'abc', '', 26, 'user'),
(7, 'abc', 's', 27, 'user'),
(8, 'aaaaa', 'athul', 28, 'user'),
(9, 'babin', '123456', 29, 'user'),
(10, 'anju', 'anju', 30, 'user'),
(11, 'aa', 'cpt', 31, 'user'),
(12, 'shythya', 'shy', 32, 'user');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `question no` int(11) NOT NULL,
  `question` varchar(100) NOT NULL,
  `option_1` varchar(50) NOT NULL,
  `option_2` varchar(50) NOT NULL,
  `option_3` varchar(50) NOT NULL,
  `option_4` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`question no`, `question`, `option_1`, `option_2`, `option_3`, `option_4`) VALUES
(1, 'On average, do you get 7-8 hours of sleep?', 'Often', 'Rarely', 'Sometimes', 'Never'),
(2, 'Do you experience difficulty with breathing?', 'I have never had trouble breathing', 'Sometimes I feel discomfort when breathing', 'I often feel short of breath', 'Difficulty in breathing'),
(3, 'Do you tend to overreact to situations?', 'I feel in control of my emotions in most situation', 'Sometimes react quickly and emotionally', 'I often feel annoyed and irritated', 'I never mind what\'s happening in my life'),
(4, 'Difficulty focusing on everyday tasks?', 'Never', 'Some of the time', 'Most of the time', 'Nearly all the time'),
(5, 'Being harsh on yourself or overly self-critical', 'Never', 'Some of the time', 'Most of the time', 'Nearly all the time'),
(6, 'Considering harming yourself, or committing suicide', 'Never', 'Some of the time', 'Most of the time', 'Nearly all the time'),
(7, 'I have felt bad-tempered, irritable, or moody', 'Never', 'Some of the time', 'Most of the time', 'Nearly all the time'),
(8, 'I have been afraid or panicky about bad things that might happen to myself or others', 'Never', 'Some of the time', 'Most of the time', 'Nearly all the time'),
(9, 'I have been easily irritated or agitated', 'Never', 'Some of the time', 'Most of the time', 'Nearly all the time'),
(10, 'I feel fatigued during the day', 'Never', 'Some of the time', 'Most of the time', 'Nearly all the time'),
(11, 'My performance at work, school or other duties has been negatively impacted', 'Not at all', 'Somewhat', 'Moderately', 'Very much so'),
(12, 'I wake up feeling tired or exhausted', 'Never', 'Some of the time', 'Most of the time', 'Nearly all the time'),
(13, 'I frequently feel like other people are plotting against me', 'Agree', 'Disagree', 'Sometimes', 'I don\'t know'),
(14, 'I have been unable to connect to my emotions such as not being able to laugh or cry, or feel affecti', 'Not at all', 'Once', 'A few times ', 'Several times'),
(15, 'I often eat so much that I feel uncomfortable or unwell \r\n\r\n', 'Not true for me', 'A little true for me', 'Somewhat true for me', 'Very true for me'),
(16, 'You sometimes forget meetings, appointments, or events', 'Never', 'Rarely', 'Often', 'Sometimes'),
(17, 'You struggle to complete tasks or projects, even ones which are nearly complete', 'Never', 'Rarely', 'Sometimes', 'Often'),
(18, 'Meeting someone new for the first time', 'Never avoid', 'Sometimes avoid', 'Often avoid', 'Always avoid'),
(19, 'Do you avoid social situations because of fear or anxiety', 'Never', 'Rarely', 'Sometimes', 'Often'),
(20, 'Do you find you are unwilling to recognize or identify with the feeling and needs of others?\r\n', 'Never', 'Rarely', 'Sometimes', 'Often');

-- --------------------------------------------------------

--
-- Table structure for table `register`
--

CREATE TABLE `register` (
  `register_id` int(11) NOT NULL,
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `age` date NOT NULL,
  `gender` varchar(10) NOT NULL,
  `email_id` varchar(30) NOT NULL,
  `password` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `register`
--

INSERT INTO `register` (`register_id`, `firstname`, `lastname`, `age`, `gender`, `email_id`, `password`) VALUES
(1, 'gcngn', 'ggfcfgf', '0000-00-00', 'male', 'gg@gmail', '1234'),
(2, 'gcvhvngn', 'ggfcfgf', '0000-00-00', 'male', 'gg@gmail', '1234'),
(3, 'gcvhvngn', 'ggfcfgf', '0000-00-00', 'male', 'gg@gmail', '1234'),
(4, 'gchjyjvhvngn', 'ggfcfgf', '0000-00-00', 'male', 'gg@gmail', '1234'),
(5, 'athul', 'unni', '0000-00-00', 'male', 'athulunni310@gmail.c', '123'),
(6, 'chithra', 'seemu', '0000-00-00', 'female', 'chithraseemu@gmail.c', 'seemu@9'),
(7, 'chithra', 'seemu', '0000-00-00', 'female', 'chithraseemu@gmail.c', 'seemu@9'),
(8, 'aswani', 'achu', '0000-00-00', 'female', 'aswanip@gmail.com', 'aswani@123'),
(9, 'chithra', 'seemu', '0000-00-00', 'female', 'chithraseemu@gmail.c', 'seemu@9'),
(10, 'chithra', 'seemu', '0000-00-00', 'female', 'chithraseemu@gmail.c', 'seemu@9'),
(11, 'chithra', 'seemu', '0000-00-00', 'female', 'chithraseemu@gmail.c', 'seemu@9'),
(12, 'chithra', 'seemu', '0000-00-00', 'female', 'chithraseemu@gmail.c', 'seemu@9'),
(13, 'chithra', 'seemu', '0000-00-00', 'female', 'chithraseemu@gmail.c', 'seemu@9'),
(14, 'chithra', 'seemu', '0000-00-00', 'female', 'chithraseemu@gmail.c', 'seemu@9'),
(15, 'chithra', 'seemu', '0000-00-00', 'female', 'chithraseemu@gmail.c', 'seemu@9'),
(16, 'chithra', 'seemu', '0000-00-00', 'female', 'chithraseemu@gmail.c', 'seemu@9'),
(17, 'chithra', 'seemu', '0000-00-00', 'female', 'chithraseemu@gmail.c', 'seemu@9'),
(18, 'chithra', 'seemu', '0000-00-00', 'female', 'chithraseemu@gmail.c', 'seemu@9'),
(19, 'chithra', 'seemu', '0000-00-00', 'female', 'chithraseemu@gmail.c', 'seemu@9'),
(20, 'chithra', 'seemu', '0000-00-00', 'female', 'chithraseemu@gmail.c', 'seemu@9'),
(22, 'aswani', 'achu', '0000-00-00', 'female', 'aswanip2019@gmail.co', 'aswani@123'),
(23, 'aswani', 'achu', '0000-00-00', 'female', 'aswanip2019@gmail.co', 'aswani@123'),
(24, 'athul', 'unni', '0000-00-00', 'male', 'athul123@gmail.com', 'athul@123'),
(25, 'chithra', 'cpt', '0000-00-00', 'female', 'chithsree369@gmail.com', 'chithra369'),
(26, 'abc', '', '0000-00-00', 'female', '', ''),
(27, 'abc', 'a', '0000-00-00', 'male', 's', 's'),
(28, 'aaaaa', 'ccc', '0000-00-00', '0', '1234', 'athul'),
(29, 'babin', 'das', '0000-00-00', 'male', 'babin@gmail.com', '123456'),
(30, 'anju', 's', '0000-00-00', 'female', 'a@gmail.com', 'anju'),
(31, 'aa', 'js', '0000-00-00', 'male', 'abccc@gmail.com', 'cpt'),
(32, 'shythya', 'menon', '2023-06-13', 'female', 'shy@gmail.com', 'shy');

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

CREATE TABLE `result` (
  `result_id` int(11) NOT NULL,
  `result` varchar(20) NOT NULL,
  `q_no` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `cbot`
--
ALTER TABLE `cbot`
  ADD PRIMARY KEY (`cbot_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`login_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`question no`);

--
-- Indexes for table `register`
--
ALTER TABLE `register`
  ADD PRIMARY KEY (`register_id`);

--
-- Indexes for table `result`
--
ALTER TABLE `result`
  ADD PRIMARY KEY (`result_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cbot`
--
ALTER TABLE `cbot`
  MODIFY `cbot_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `login_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `question no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `register`
--
ALTER TABLE `register`
  MODIFY `register_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `result`
--
ALTER TABLE `result`
  MODIFY `result_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=581;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
