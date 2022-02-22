-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 22, 2022 at 11:46 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`id`, `name`, `image`) VALUES
(1, 'Peter David', 'https://upload.wikimedia.org/wikipedia/commons/5/5c/10.14.11PeterDavidByLuigiNovi.jpg'),
(2, 'Sergio Dante', 'https://media.istockphoto.com/photos/happy-smiling-man-looking-away-picture-id1158245623?k=20&m=1158245623&s=612x612&w=0&h=rGmn02kNdoQySPEoQmbbDBxOayL4sdW3QWqP9rjgxCg='),
(3, 'Olivia Stone', 'https://image.shutterstock.com/image-photo/happy-cheerful-young-woman-wearing-260nw-613759379.jpg'),
(4, 'Berta Stinson', 'https://i.insider.com/5cb8b133b8342c1b45130629?width=700'),
(5, 'Barnes Mandela', 'https://compote.slate.com/images/81c40963-7cb6-4da4-8524-dc0222b03f72.jpeg?width=780&height=520&rect=1734x1156&offset=0x0'),
(6, 'Marc Erlington', 'https://fashionweekdaily.com/wp-content/uploads/2019/09/DanWakeford_HTH-51.jpg'),
(7, 'Harry Styles', 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/normal-people-paul-mescal-1590484961.jpg?crop=0.718xw:0.716xh;0.0435xw,0.284xh&resize=480:*');

-- --------------------------------------------------------

--
-- Table structure for table `authorities`
--

CREATE TABLE `authorities` (
  `username` varchar(50) NOT NULL,
  `authority` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `authorities`
--

INSERT INTO `authorities` (`username`, `authority`) VALUES
('barnes', 'ROLE_admin'),
('berta', 'ROLE_admin'),
('harry', 'ROLE_admin'),
('marc', 'ROLE_admin'),
('olivia', 'ROLE_admin'),
('peter', 'ROLE_admin'),
('sergio', 'ROLE_admin'),
('jovan', 'ROLE_visitor'),
('marko', 'ROLE_visitor');

-- --------------------------------------------------------

--
-- Table structure for table `blog`
--

CREATE TABLE `blog` (
  `id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `image` varchar(200) DEFAULT NULL,
  `enableOrDisable` tinyint(1) DEFAULT NULL,
  `importance` tinyint(1) DEFAULT NULL,
  `idCategory` int(11) DEFAULT NULL,
  `commentsNumber` int(11) DEFAULT NULL,
  `viewNumber` int(11) DEFAULT NULL,
  `idAuthor` int(11) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `text` longtext NOT NULL,
  `isOnMainPage` tinyint(1) DEFAULT NULL,
  `isOnMenu` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `blog`
--

INSERT INTO `blog` (`id`, `name`, `image`, `enableOrDisable`, `importance`, `idCategory`, `commentsNumber`, `viewNumber`, `idAuthor`, `time`, `text`, `isOnMainPage`, `isOnMenu`) VALUES
(1, 'Freak out Friday', 'http://condor.depaul.edu/dwrd/moore/wrd360/sac-reliable-individual-450px.jpg', 0, 0, 1, 6, 1000, 1, '2020-01-09 18:45:00', 'By day it’s a concoction of trend-conscious fashion stores selling variations of the same 90s cuts to a generation of image-obsessed Korean youth, endless street food stalls vending sauced and battered chicken, and the almost intimidatingly trendy rummaging through vintage basements', 1, 1),
(2, 'Nature\'s promise', 'https://images.pexels.com/photos/417074/pexels-photo-417074.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 0, 0, 19, 9, 500, 2, '2021-02-10 21:00:00', 'A number of years ago I went on holiday to a beautiful part of Portugal. We stayed in a converted farmhouse in the middle of a national park. The farmhouse was in a valley. ', 1, 1),
(3, 'Wild cooking', 'https://cdn.skoda-storyboard.com/2019/09/SKODA-1.JPG-1920x730.jpg', 0, 0, 16, 10, 647, 3, '2020-03-11 16:30:00', 'Gastronomy is the science of pain. Professional cooks belong to a secret society whose ancient rituals derive from the principles of stoicism in the face of humiliation, injury, fatigue, and the threat of illness. ', 1, 1),
(4, 'I against I', 'https://bigthink.com/wp-content/uploads/2017/12/origin-121.jpg?lb=1536,864', 1, 1, 7, 5, 324, 4, '2021-06-15 21:00:00', 'I work up early the next morning and it was just as I imagined it would be. There is nothing like the stillness of the early morning. There was a gentle, peaceful feeling that enveloped me.', 0, 0),
(5, 'Rearranging furniture', 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/ba-0111778-lr-1592404733.jpg', 1, 1, 18, 3, 400, 5, '2021-04-20 10:00:00', 'Sometimes, it?s important to look at things from different points of view ? and that includes your furniture. Rearranging one or more rooms in your home may feel like completing a life-sized jigsaw puzzle', 0, 0),
(6, 'Life after publishing a book', 'https://images-na.ssl-images-amazon.com/images/I/71XtGTK8OpL.jpg', 1, 1, 11, 11, 1200, 6, '2021-08-01 21:30:00', 'Irvine Welsh is doing just fine for money. He knows he never has to work another day in his life, but he can?t stop himself. ?I don?t like it when people say I?ve got an addictive personality,? he says. ', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `blog_tag`
--

CREATE TABLE `blog_tag` (
  `id_blog` int(11) DEFAULT NULL,
  `id_tag` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `blog_tag`
--

INSERT INTO `blog_tag` (`id_blog`, `id_tag`, `id`) VALUES
(5, 34, 12),
(5, 26, 13),
(5, 14, 14),
(6, 10, 15),
(6, 18, 16),
(6, 19, 17),
(6, 22, 18);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `isOnBlogPage` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `isOnBlogPage`) VALUES
(1, 'Lifestyle', 1),
(2, 'fashion', 1),
(3, 'beauty', 1),
(4, 'fitness', 1),
(5, 'relationship', 1),
(6, 'travelling', 1),
(7, 'life hacks', 1),
(8, 'parenting', 1),
(9, 'teen', 1),
(10, 'business', 1),
(11, 'education', 1),
(12, 'technology', 1),
(13, 'films', 1),
(14, 'music', 1),
(15, 'games', 1),
(16, 'cooking', 1),
(17, 'places to visit', 1),
(18, 'art', 1),
(19, 'nature', 1),
(20, 'animals', 1),
(21, 'ecology', 1),
(22, 'health', 1);

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `message` varchar(300) DEFAULT NULL,
  `isSeen` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `name`, `email`, `message`, `isSeen`) VALUES
(1, 'Vuk', 'vukpaunovic1995@gmail.com', 'hello lovely people, very nice to meet you :)', 1);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `authority` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`authority`) VALUES
('ROLE_admin'),
('ROLE_visitor');

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tag`
--

INSERT INTO `tag` (`id`, `name`) VALUES
(1, 'healthy food'),
(2, 'exercise'),
(3, 'nature and relax'),
(4, 'delicious food'),
(5, 'all natural'),
(6, 'weights'),
(7, 'spicy'),
(8, 'cooking tricks'),
(9, 'interesting places'),
(10, 'world miracles'),
(11, 'sunset'),
(12, 'feminine world'),
(13, 'only for men'),
(14, 'quality life'),
(15, 'ios'),
(16, 'android'),
(17, 'mobile '),
(18, 'nightlife'),
(19, 'quality happenings'),
(20, 'where to go out'),
(21, 'what to learn'),
(22, 'who to ask'),
(23, 'what to listen'),
(24, 'culture'),
(25, 'connect with people'),
(26, 'learning'),
(27, 'reading'),
(28, 'writing'),
(29, 'dialogue'),
(30, 'conscience'),
(31, 'problem solving'),
(32, 'better world'),
(33, 'no stress'),
(34, 'positivity');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(68) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `surname` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`, `enabled`, `name`, `surname`) VALUES
('barnes', '{bcrypt}$2a$12$2YWpQxPlQyBo8UM6I.mTvOHR7tIxUkjVXqVqXqPd0QB8yCEr58fT2', 1, 'Barnes', 'Mandela'),
('berta', '{bcrypt}$2a$12$4AkHZePn6TtBbnKF4ne2EOl6AwLYxU3en4o2u9b6yWAJ1SdLEoId6', 1, 'Berta', 'Stinson'),
('harry', '{bcrypt}$2a$12$eAwp9PsM07ht8HOFkGenSuaWRThp1.9BRsSKiKYnD41KTsVwYfMlK', 1, 'Harry', 'Styles'),
('jovan', '{bcrypt}$2a$12$dCSVca19PRAsM7S3t2VssepCg/CFy98NmP5slWrxXe0mu2SDNtjnu', 1, 'Jovan', 'Jovanovic'),
('marc', '{bcrypt}$2a$12$.trBAID3wiJiUesyET4mCeoKLD2pH4OWpnRpGRv7/yg0VbkbZv97W', 1, 'Marc', 'Erlington'),
('marko', '{bcrypt}$2a$12$pV4KJN5TfeO2G8Ns6cn7ce.6Mk9wyfSKskHj54OjBOuy94sU3an6K', 1, 'Marko', 'Markovic'),
('olivia', '{bcrypt}$2a$12$oanGNTEYjSpYbwWdSHtnYuoOKkp7p1aIiz2xGbM.YoiMTQW9Zwp.y', 1, 'Olivia', 'Stone'),
('peter', '{bcrypt}$2a$12$8pqY6s5XgjZiNFuAXuHfk.cnnSPLMX/NP6ojY3q4tgDZQZt2xyRly', 1, 'Peter', 'David'),
('sergio', '{bcrypt}$2a$12$m44j6sE6Zs05.cycFunwOONNsegYNo/JdV29jMAJnG7kuMomfb7.G', 1, 'Sergio', 'Dante');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `authorities`
--
ALTER TABLE `authorities`
  ADD PRIMARY KEY (`username`),
  ADD KEY `authority_idx` (`authority`);

--
-- Indexes for table `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idCategory_idx` (`idCategory`),
  ADD KEY `idAuthor_idx` (`idAuthor`);

--
-- Indexes for table `blog_tag`
--
ALTER TABLE `blog_tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`authority`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `author`
--
ALTER TABLE `author`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `blog`
--
ALTER TABLE `blog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `blog_tag`
--
ALTER TABLE `blog_tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `authorities`
--
ALTER TABLE `authorities`
  ADD CONSTRAINT `authority` FOREIGN KEY (`authority`) REFERENCES `roles` (`authority`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `username` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `blog`
--
ALTER TABLE `blog`
  ADD CONSTRAINT `idAuthor` FOREIGN KEY (`idAuthor`) REFERENCES `author` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `idCategory` FOREIGN KEY (`idCategory`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
