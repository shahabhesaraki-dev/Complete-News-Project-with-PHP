-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 24, 2021 at 10:01 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `w84php_news`
--

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `title`, `image`, `category_id`, `created_at`, `updated_at`) VALUES
(10, 'sport', '171f8f5bc6e586500204695e5a01dcc3.jpg', 14, '2021-11-24 22:48:12', '2021-11-24 22:49:50'),
(12, 'history', '448beddaac049919f1a53b364412f0ab.jpg', 17, '2021-11-24 22:54:30', NULL),
(13, 'politics', '697d46b6c6ee708ae2bc9432d1ae7a8e.jpg', 22, '2021-11-24 22:54:58', NULL),
(14, 'economic', '0da4a0a6c4334536fb0f9f65951fde94.jpg', 15, '2021-11-24 22:55:21', NULL),
(15, 'culture', '331f7eb662e82f3a5d68d9c98fcc99a5.jpg', 16, '2021-11-24 22:55:40', NULL),
(16, 'travel', '23119d5ddbdada7da620ece20912822b.jpg', 19, '2021-11-24 22:55:58', NULL),
(17, 'health', '1706517a6baf4a5760636164726d14fc.jpg', 18, '2021-11-24 22:56:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `description`, `created_at`, `updated_at`) VALUES
(14, 'sport', '', '2021-11-10 20:29:31', NULL),
(15, 'economic', '', '2021-11-10 20:29:42', NULL),
(16, 'culture', '', '2021-11-10 20:29:55', NULL),
(17, 'history', '', '2021-11-10 20:30:05', NULL),
(18, 'health', '', '2021-11-10 20:30:27', NULL),
(19, 'travel', '', '2021-11-10 20:30:41', '2021-11-10 21:26:21'),
(22, 'politics', '', '2021-11-17 16:08:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `news_id` int(11) UNSIGNED NOT NULL,
  `parent_id` int(11) UNSIGNED DEFAULT NULL,
  `adminAccept` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `name`, `email`, `message`, `answer`, `news_id`, `parent_id`, `adminAccept`, `created_at`, `updated_at`) VALUES
(1, 'ali', 'Ali@gmail.com', 'Great news!!!', 'Thanks Ali', 15, NULL, 1, '2021-11-18 16:37:20', '2021-11-18 19:45:33'),
(2, 'shahab', 'shahab@gmail.com', 'Thanks!', NULL, 15, NULL, 1, '2021-11-18 16:40:44', NULL),
(27, 'jafar', 'jafar@gmail.com', 'hahaha', '', 15, NULL, 1, '2021-11-18 21:52:17', '2021-11-26 16:44:03'),
(29, 'john doe', 'john@gmail.com', 'Bad news!', '', 16, NULL, 1, '2021-11-19 20:59:06', '2021-11-19 21:01:22'),
(30, 'john doe', 'john@gmail.com', 'Bad news!', NULL, 16, NULL, 0, '2021-11-19 21:01:34', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(10) UNSIGNED NOT NULL,
  `address` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_code` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `days` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `address`, `postal_code`, `number`, `days`, `email`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Quebec, Montreal', 'H4L 0B5', '+1 438 883 9936', 'Mon to Fri 9a.m to 5p.m', 'Shahabhes@gmail.com', 'Send us your query anytime!', '2021-11-19 17:33:46', '2021-11-19 17:57:54');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `message` varchar(1500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `message`, `name`, `email`, `created_at`) VALUES
(1, 'Hello admin', 'john', 'jafar@gmail.com', '2021-11-19 15:45:15'),
(2, 'Hi author', 'smith', 'smith@gmail.com', '2021-11-24 14:33:21'),
(3, 'Hi Admin . How are you ?', 'jafar', 'jafar@gmail.com', '2021-11-25 17:15:51');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `views` int(11) NOT NULL DEFAULT 0,
  `category_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `summary`, `content`, `image`, `views`, `category_id`, `created_at`, `updated_at`) VALUES
(10, 'The Netherlands booked their place at the World Cup finals in Qatar', 'The Netherlands booked their place at the World Cup finals in Qatar with victory against Norway, who miss out on next year\'s tournament as a result.', '<p>Late goals from Tottenham Hotspur\'s Steven Bergwijn and Barcelona\'s Memphis Depay ensured the Dutch claimed top spot in Group G.</p><p>The goals were the only bright moments of an otherwise drab game between two sides fearful of being too attacking.</p><p>It was a costly loss for Norway, who miss out on a play-off spot to Turkey.</p><p>However, it was also punishment for their lack of ambition for much of a game in which they only mustered two shots, both of which came in the second half.</p><p>Admittedly, the absence of injured striker Erling Braut Haaland, who scored in the 1-1 draw between these sides in Oslo in September, did not help their cause.</p><ul><li><a href=\"https://www.bbc.co.uk/sport/football/59309989\"><strong>Who has qualified for the 2022 World Cup &amp; who is in playoffs?</strong></a></li></ul><p>The visitors did defend well though, but as soon as Bergwijn\'s rising shot hit the net with six minutes to go - with rivals for second place Turkey winning 2-1 in Montenegro - their challenge was over.</p><p>Over-commitment in the closing stages for a corner then allowed the Dutch to break, with Bergwijn unselfishly setting up Depay to end the contest.</p><p>The home side lacked pace and creation in attack for much of the game but found a way, sealing qualification for Qatar after having failed to reach the finals in Russia in 2018.</p><p>It represents a success for manager Louis van Gaal, who led the Dutch to a third-place finish at the 2014 World Cup in his second spell as national boss.</p><p>He spent Tuesday\'s game in a wheelchair in the stands after <a href=\"https://www.bbc.co.uk/sport/football/59296589\"><strong>injuring his hip when he fell off his bicycle on Sunday.</strong></a></p><p>Norway have not qualified for the finals of a World Cup since France 1998, while they have not reached a European Championship since 2000.</p>', '58a5907bd7f09d7c74c834c19489ef94.jpg', 3, 14, '2021-11-17 16:01:41', NULL),
(11, 'Queen seen in first engagement since Cenotaph absence', 'The Queen has been seen taking part in public duties for the first time since she pulled out of the Remembrance Sunday service at the Cenotaph.', '<p>She was pictured having a face-to-face audience with Gen Sir Nick Carter, chief of the defence staff, at Windsor Castle on Wednesday.</p><p>The monarch, 95, had to miss Sunday\'s event because she had a sprained back, Buckingham Palace said.</p><p>The palace had previously said it was the Queen\'s \"firm intention\" to attend.</p><p>The Queen was seen standing as she greeted Gen Sir Nick for the military audience in Windsor\'s Oak Room.</p><ul><li><a href=\"https://www.bbc.co.uk/news/uk-59280608\"><strong>Queen misses Remembrance Sunday service</strong></a></li><li><a href=\"https://www.bbc.co.uk/news/uk-59304407\"><strong>Queen\'s message to General Synod delivered by Prince Edward</strong></a></li></ul><p>It is the first time in nearly a month the Queen has been pictured carrying out an engagement in person. She had her regular face-to-face audience with Prime Minister Boris Johnson last week but was not pictured doing so.</p><p>She smiled as the pair shook hands and began chatting, with the Queen saying it was \"rather sad\" he was leaving his role.</p><p>Gen Sir Nick, who is preparing to step down as armed forces chief at the end of the month, agreed \"it\'s a long time\", saying he had been in the post for eight years.</p><p>Her pet dorgi Candy - a cross between a corgi and dachshund - could be seen at the door of the room as the military leader entered. The Oak Room is the Queen\'s sitting room where she spends much of her time and it doubles as her office.</p><p>Before their meeting, the Queen held an audience by video link with the Commanding Officers of the Royal Scots Dragoon Guards, Buckingham Palace said.</p>', 'b0293263449e38a725e3483393d5b148.jpg', 1, 22, '2021-11-17 16:07:03', '2021-11-17 16:08:35'),
(12, ' Frida Kahlo’s ‘Diego y yo’ breaks records, sells for $34.9 million', 'Her 1949 self-portrait, titled “Diego y yo,” sold for $34.9 million at Sotheby’s Modern Evening Sale in New York on Tuesday night. It\'s the highest price ever paid for Latin American art.', '<p>The painting was purchased by the Eduardo F. Costantini Collection, Sotheby’s confirmed to The Associated Press shortly after Tuesday’s sale. Constantini, a real estate developer and philanthropist, is a renowned collector committed to supporting Latin American art and the founder of Malba, the Museum of Latin American Art in Buenos Aires.</p><p>Painted five years before her death, “Diego y yo” is considered to be Kahlo’s final self-portrait. The 11.7- by 8.8-inch oil painting shows a teary-eyed Kahlo with a portrait of her husband, Diego Rivera, embedded above her brow.</p><p>“Tonight’s outstanding result further secures her place in the auction echelon she belongs, as one of the true titans of 20th century art,\" Julian Dawes, Sotheby’s senior vice president and co-head of impressionist and modern art, <a href=\"https://www.artnews.com/art-news/market/frida-kahlo-diego-y-yo-auction-record-sothebys-1234610416/\">said in a statement.</a></p><p>“Diego y yo,” an intense painting that speaks to the state of Kahlo’s fragile marriage, was created when she was experiencing a great deal of physical pain, said <a href=\"https://www.wildterrains.com/our-partners/natalia-zerbato\">Natalia Zerbato</a>, an art historian who studies Kahlo’s life and work at the National Autonomous University of Mexico and offers tours based on Kahlo’s life.&nbsp;</p><p>Sotheby’s last auctioned “Diego y yo” in 1990 for $1.4 million. Kahlo’s previous auction record was $8 million for her 1939 painting “Two Nudes in the Forest,” which was auctioned in 2016, according to <a href=\"https://www.sothebys.com/en/articles/frida-kahlos-final-bust-self-portrait-from-the-1940s\">Sotheby’s</a>.</p><p>“I think this is very powerful, too, because it’s not even one of her most famous works,” Zerbato said. “I think if you use just the numbers to talk about how important Frida’s work is, it looks very important and very marketable.”</p><p>In Mexico, much of Kahlo’s art is recognized as an artistic monument, a <a href=\"https://culturalpropertynews.org/mexico-art-in-the-time-of-restrictive-export-laws/\">legal status</a> that prevents the sale of prominent 19th and 20th century Mexican art, Zerbato said.</p><p>“For Mexico, the meaning of Frida can’t be given a price,” she said. “From my point of view, I can’t put a price on Frida.”</p><p>Kahlo’s ability to speak to so many identities is what makes her art and story so enduring, said Gregorio Luke, a Mexican and Latin American art expert and lecturer.</p>', '3577c1f120bb65f6f17c0a052fbb8897.jpg', 4, 16, '2021-11-17 16:12:40', NULL),
(13, 'Thailand\'s Maya Bay made famous by Leonardo DiCaprio\'s \'The Beach\' set to reopens', 'A beautiful cove in Thailand made famous in the Leonardo DiCaprio movie \"The Beach\" will reopen to the public almost three years after it was closed because of environmental damage', '<p>A beautiful cove in <a href=\"https://www.nbcnews.com/news/world/police-use-water-cannons-protesters-trying-deliver-letters-about-thailand-n1247030\">Thailand</a> made famous in the <a href=\"https://www.nbcnews.com/nightly-news/video/leonardo-dicaprio-responds-to-brazilian-president-s-amazon-fires-accusation-74292805761\">Leonardo DiCaprio</a> movie \"The Beach\" will reopen to the public almost three years after it was closed because of environmental damage, authorities said Wednesday.</p><p>With its white sand and crystal clear waters, Maya Bay became a popular tourist destination after the film, based on the novel by Alex Garland, was released in 2000.</p><p>While the 4,000 to 5,000 daily visitors provided a welcome boost to the local economy, the trash — particularly plastics — they left behind, damaged the island’s ecosystem and Thai authorities <a href=\"https://www.nbcnews.com/news/world/ailing-thai-beach-made-famous-leonardo-dicaprio-film-gets-tourist-n878791\">closed it off</a> to tourists in May 2018.</p><p>Although it was originally supposed to close for four months, Maya Bay, which is a part of the Hat Noppharat Thara — Mu Ko Phi Phi National Park, remained closed to help its environmental recovery.</p><p>\"The closure of Maya Bay was to rehabilitate its natural resources. Now the natural resources are rehabilitated back to the good level,\" Varawut Silpa-archa, Thailand’s minister of natural resources and environment, said in a statement Monday.</p><p>He added that domestic and international tourists were once again welcome to visit the tropical paradise when it reopens in January.</p><p>Those visits will however, be strictly regulated. Between 10:00 a.m. to 4:00 p.m., only 300 tourists an hour will be allowed on the island, according to the Department of National Park, Wildlife and Plant Conservation. They will then have to leave once their allotted time is up.</p><p>As well as coral regrowing efforts off the bay’s coast, the department said that on land, wild plants and trees had been replanted to “prevent erosion on the beachfront.”</p>', 'd68d8f433c5c6d1e77d239126521280c.jpg', 6, 19, '2021-11-17 16:14:29', '2021-11-26 16:56:29'),
(14, 'FDA expected to authorize Pfizer booster for all adults this week', 'The Food and Drug Administration is expected to authorize Pfizer-BioNTech\'s Covid-19 booster shot for all adults within days, according to a person familiar with the plans.', '<p>The FDA\'s action could come as early as Thursday. The news was first reported by <a href=\"https://www.nytimes.com/live/2021/11/16/world/covid-vaccine-boosters-mandates#fda-pfizer-booster-shots-adults\">The New York Times</a>.</p><p>The Centers for Disease Control and Prevention’s <a href=\"https://www.cdc.gov/vaccines/acip/index.html\">vaccine advisory committee</a> is scheduled to meet Friday to discuss boosters.</p><p>Pfizer <a href=\"https://www.nbcnews.com/health/health-news/pfizer-asks-fda-authorization-booster-everyone-18-rcna4893\">requested emergency use authorization for the booster</a> last week, citing results from a Phase 3 clinical trial with more than 10,000 participants, which found that the third dose was safe and effective.</p><p><a href=\"https://www.nbcnews.com/health/coronavirus\"><i><strong>Full coverage of the Covid-19 pandemic</strong></i></a></p><p>Still, with case numbers once again rising in the U.S. as winter approaches, <a href=\"https://www.nbcnews.com/health/health-news/nyc-states-move-ahead-boosters-fda-deliberates-rcna5600\">several states</a>, including Arkansas, California, Colorado and New Mexico, along with New York City, chose not to wait for the FDA’s official signoff, moving on their own to allow boosters, including Moderna’s, for all adults in the past week.</p>', '03fd98692df1669a9435143e1467b1aa.jpg', 0, 18, '2021-11-17 16:16:58', NULL),
(15, 'Service to their country was a double-edged sword for Japanese American regiment', 'For soldiers in the segregated 442nd Regimental Combat Team, the choice came down to barbed wire or combat. Historians point to their story in a year of anti-Asian hate.', '<p>After a year of increased hate, historians are looking back on the sacrifices Asian Americans have had to make to prove loyalty to a country that often disregards them.</p><p>The plight of a World War II Army combat unit whose Japanese American soldiers were forced from prison camps into war is a story that doesn’t often get told, experts said.&nbsp;</p><p>The members of the segregated 442nd Regimental Combat Team left their families and crossed to the other side of barbed-wire fences when they were drafted in 1943. Just a year earlier, people of Japanese descent were labeled as enemy aliens by the War Department, the predecessor of the Defense Department.&nbsp;</p><p>“Many believed that they were being used as cannon fodder,” said Brian Niiya, the content director for Densho, an organization dedicated to chronicling the history of Japanese incarceration.&nbsp;</p><p>The 442nd, two thirds of which was made up of Hawaiian-born Japanese Americans, was sent to complete particularly dangerous and bloody missions and suffered heavy casualties.</p><p>“I don’t know which was worse, being locked up in camp or going off to war,” Masao Watanabe, a soldier in the 442nd, <a href=\"https://encyclopedia.densho.org/442nd_Regimental_Combat_Team/\">said in a 1998 interview</a>. “Barbed wires aren’t very inviting. I just didn’t like being cooped up and looking at barbed wires and guard towers. That just wasn’t for me.”&nbsp;</p><p>The instinct to prove loyalty and assimilation didn’t end with being imprisoned, and it’s a pressure experts say Asian Americans in the 21st century aren’t immune from.</p><p>“I hope that we can learn from this history and make sure that future generations will not be asked to make those same sacrifices to prove that they belong here,” said Nina Wallace, Densho’s communications coordinator.&nbsp;</p><p>Even though the combat team came out of the war the most decorated unit in U.S. military history for its size and period of service, many members still faced societal rejection as they returned to homes in disparate parts of the country. Asian American civil rights movements later on did credit soldiers of the 442nd for gradually improving the public image of Japanese Americans. But it’s a sacrifice they shouldn’t have had to make, Wallace said.&nbsp;</p><p>“I think we can look back with gratitude for the sacrifices made by the soldiers of the 442nd, as well as grief and some critical questioning of why they were expected to give so much to a country that didn’t recognize them as equal citizens,” she said.&nbsp;</p><p>Niiya said the public animosity is something that Asian Americans have become all too familiar with this year. And it’s a reality that has deep roots.&nbsp;</p>', 'ece3bada3a33f14f96faaaf71be5edfb.jpg', 3, 17, '2021-11-17 16:19:32', '2021-11-26 16:59:08'),
(16, 'The secrecy behind a wartime disaster at sea', 'Dame Mary Richardson is determined to get to the truth of one of the worst wartime disasters in UK waters.', '<p>In the season of Remembrance, families will honour loved ones who lost their lives in conflict but Mary and dozens of others have still not managed to find out how their relatives died and where they came to rest.Her father, George Habgood, was a butcher on board HMS Dasher, an aircraft carrier which blew up in the Firth of Clyde in March 1943 and went down within eight minutes.The explosion on the carrier, which had been converted from a merchant ship, within sight of the beach near Ardrossan, is thought to have been caused by a petrol leak with vapour subsequently igniting.</p><p>Out of 528 personnel on board, the death toll was 379 but only 23 were given official burials, some in Ardrossan cemetery.This was despite the disaster happening in calm conditions, a few miles offshore and with rescue ships rapidly in attendance.It was within living memory and yet little is known to the public of the disaster, even within the local community.Official documents in the National Archives at Kew in south west London show that bodies were washed ashore for over a week after the disaster but there are no known graves of unidentified seamen.Mary was just seven when her father died and is now 85.</p><p>She has formed the view that some of the bodies must have been buried in a mass grave somewhere along the Ayrshire coast.\"Somebody must know, I hope somebody knows, and those men can be honoured,\" she says.\"They seem to have been dishonoured, forgotten, hidden, disgraced and I just want them recognised and it\'s not just my father I\'m worried about.\"It\'s all of the others who have lain for over 70 years unnoticed.\"The National Archives also hold secret government documents from 1943 which reveal the extent to which the authorities went to suppress the news about HMS Dasher\'s sinking.Relatives were not told where their loved ones had perished, or which ship they had been on.</p>', '62ef01a91146cba9b57cbc566ff4b776.jpg', 7, 17, '2021-11-17 20:47:44', NULL),
(17, 'Inflation is not going away any time soon ', 'After lying dormant for years, inflation is once again chipping away at American wallets, and it has become a chief concern for the White House.', '<p>In recent months, the Biden administration ramped up its efforts to remedy the <a href=\"https://www.cnbc.com/2021/11/24/california-docks-see-significant-progress-with-supply-chain-backlog-port-chief-says.html\">supply-chain interruptions</a> economists blame for hot inflation. And President <a href=\"https://www.cnbc.com/joe-biden/\">Joe Biden</a> has been pushing his economic agenda as a remedy for inflation worries.</p><p>But ask investors, economists and the American people for their thoughts on inflation, and no one sees inflation cooling off anytime soon. That means everyone from the president to the everyday voter will likely need patience to get through this.</p><p>“I don’t think you want to promise people inflation is going away,” said Jason Furman, an economist and former chairman of the White House Council of Economic Advisers during the Obama administration.</p><p>“I think the hardest thing to communicate is that not every problem has a solution. Some of what needs to be done to heal our economy is to be patient,” he continued. “That’s a really hard a message for any president to deliver. They have to be seen as doing things.”</p><p>Rising food and gas prices are weighing on Americans living on fixed or modest incomes. Retail grocery prices rose 1% in October, laundry and dry-cleaning costs are up 6.9% from a year ago, and in some parts of California gasoline is being sold north of $6 a gallon. General Mills notified retailers that it plans to soon hike prices on dozens of its brands, including Cheerios, Wheaties and Annie’s, <a href=\"https://www.cnn.com/2021/11/23/business/cheerios-grocery-prices-general-mills/index.html\">according to a report</a> published Tuesday.</p><p>In turn, the inflation messaging coming out of the White House has focused a great deal on two big, Biden-backed bills. One of the president’s favorite counters to inflation worries is to point out that many economists say his $1.75 trillion Build Back Better bill and a separate $1 trillion infrastructure plan will make businesses and workers more productive and ease inflation pressures over the long term.</p><p>Yet while better roads, access to child care and weatherization may help reduce costs years in the future, Democrats face critical midterm elections in less than 12 months.</p><p>Inflation appeared to be a hurdle for Democrat Terry McAuliffe, who lost to Republican Glenn Youngkin in Virginia’s recent gubernatorial election.</p>', '7830af9d0700bc0dbbbfbde22849ff56.jpg', 3, 15, '2021-12-01 20:09:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `statistics`
--

CREATE TABLE `statistics` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `statistics`
--

INSERT INTO `statistics` (`id`, `ip`, `uri`, `created_at`) VALUES
(1, '127.0.0.1', 'http://localhost/news/index/1', '2021-11-25 22:05:58'),
(2, '127.0.0.1', 'http://localhost/categories/show/14', '2021-11-25 22:06:00'),
(3, '127.0.0.1', 'http://localhost/categories/show/15', '2021-11-25 22:06:01'),
(4, '127.0.0.1', 'http://localhost/categories/show/17', '2021-11-25 22:06:30'),
(5, '127.0.0.1', 'http://localhost/categories/show/18', '2021-11-25 22:06:32'),
(6, '127.0.0.1', 'http://localhost/dashboard', '2021-11-25 22:06:44'),
(7, '127.0.0.1', 'http://localhost/login', '2021-11-25 22:06:48'),
(8, '127.0.0.1', 'http://localhost/login', '2021-11-25 22:07:02'),
(9, '127.0.0.1', 'http://localhost/dashboard', '2021-11-25 22:07:02'),
(10, '127.0.0.1', 'http://localhost/news/index/1', '2021-11-25 22:07:20'),
(11, '127.0.0.1', 'http://localhost/categories/show/15', '2021-11-25 22:07:21'),
(12, '127.0.0.1', 'http://localhost/categories/show/16', '2021-11-25 22:07:23'),
(13, '127.0.0.1', 'http://localhost/categories/show/17', '2021-11-25 22:07:24'),
(14, '127.0.0.1', 'http://localhost/categories/show/18', '2021-11-25 22:07:25'),
(15, '127.0.0.1', 'http://localhost/categories/show/19', '2021-11-25 22:07:26'),
(16, '127.0.0.1', 'http://localhost/categories/show/22', '2021-11-25 22:07:27'),
(17, '127.0.0.1', 'http://localhost/news/show/11', '2021-11-25 22:07:31'),
(18, '127.0.0.1', 'http://localhost/categories/show/15', '2021-11-25 22:07:34'),
(19, '127.0.0.1', 'http://localhost/home', '2021-11-25 22:07:35'),
(20, '127.0.0.1', 'http://localhost/dashboard', '2021-11-25 22:07:44'),
(21, '127.0.0.1', 'http://localhost/dashboard', '2021-11-25 22:08:43'),
(22, '127.0.0.1', 'http://localhost/news/index/1', '2021-11-25 22:10:40'),
(23, '127.0.0.1', 'http://localhost/categories/show/14', '2021-11-25 22:10:44'),
(24, '127.0.0.1', 'http://localhost/news/index/1', '2021-11-25 22:10:50'),
(25, '127.0.0.1', 'http://localhost/news/index/2', '2021-11-25 22:10:55'),
(26, '127.0.0.1', 'http://localhost/categories/show/15', '2021-11-25 22:10:58'),
(27, '127.0.0.1', 'http://localhost/news/index/1', '2021-11-25 22:11:08'),
(28, '127.0.0.1', 'http://localhost/news/index/2', '2021-11-25 22:11:15'),
(29, '127.0.0.1', 'http://localhost/news/index/1', '2021-11-25 22:11:21'),
(30, '127.0.0.1', 'http://localhost/dashboard', '2021-11-25 22:11:57'),
(31, '127.0.0.1', 'http://localhost/categories/show/17', '2021-11-25 22:12:08'),
(32, '127.0.0.1', 'http://localhost/categories/show/19', '2021-11-25 22:12:10'),
(33, '127.0.0.1', 'http://localhost/home', '2021-11-25 22:12:12'),
(34, '127.0.0.1', 'http://localhost/dashboard', '2021-11-25 22:12:33'),
(35, '127.0.0.1', 'http://localhost/home', '2021-11-25 22:13:30'),
(36, '127.0.0.1', 'http://localhost/contact', '2021-11-25 22:13:57'),
(37, '127.0.0.1', 'http://localhost/contact', '2021-11-25 22:15:51'),
(38, '127.0.0.1', 'http://localhost/contact/index', '2021-11-25 22:15:51'),
(39, '127.0.0.1', 'http://localhost/messages', '2021-11-25 22:15:58'),
(40, '127.0.0.1', 'http://localhost/contact', '2021-11-25 22:16:19'),
(41, '127.0.0.1', 'http://localhost/contact/index', '2021-11-25 22:16:19'),
(42, '127.0.0.1', 'http://localhost/messages', '2021-11-25 22:16:26'),
(43, '127.0.0.1', 'http://localhost/messages/delete/4', '2021-11-25 22:16:40'),
(44, '127.0.0.1', 'http://localhost/messages', '2021-11-25 22:18:49'),
(45, '127.0.0.1', 'http://localhost/messages', '2021-11-25 22:19:34'),
(46, '127.0.0.1', 'http://localhost/messages/delete/4', '2021-11-25 22:19:38'),
(47, '127.0.0.1', 'http://localhost/messages', '2021-11-25 22:19:38'),
(48, '127.0.0.1', 'http://localhost/contact/list', '2021-11-25 22:26:34'),
(49, '127.0.0.1', 'http://localhost/news/index/1', '2021-11-25 22:26:49'),
(50, '127.0.0.1', 'http://localhost/categories/show/14', '2021-11-25 22:27:01'),
(51, '127.0.0.1', 'http://localhost/news/index/1', '2021-11-25 22:32:33'),
(52, '127.0.0.1', 'http://localhost/news/index/2', '2021-11-25 22:32:38'),
(53, '127.0.0.1', 'http://localhost/news/index/2', '2021-11-25 22:34:25'),
(54, '127.0.0.1', 'http://localhost/categories/show/14/1', '2021-11-25 22:34:28'),
(55, '127.0.0.1', 'http://localhost/categories/show/14/1', '2021-11-25 22:37:48'),
(56, '127.0.0.1', 'http://localhost/categories/show/14/1', '2021-11-25 22:42:05'),
(57, '127.0.0.1', 'http://localhost/categories/show/14/1', '2021-11-25 22:42:48'),
(58, '127.0.0.1', 'http://localhost/categories/show/14/1', '2021-11-25 22:43:25'),
(59, '127.0.0.1', 'http://localhost/news/index/1', '2021-11-25 22:43:32'),
(60, '10.30.150.89', 'http://10.30.150.89/', '2021-11-26 15:46:34'),
(61, '127.0.0.1', 'http://localhost/news/index/1', '2021-11-26 15:48:03'),
(62, '127.0.0.1', 'http://localhost/categories/show/14/1', '2021-11-26 15:48:08'),
(63, '127.0.0.1', 'http://localhost/categories/show/14/1', '2021-11-26 15:55:13'),
(64, '127.0.0.1', 'http://localhost/categories/show/14/1', '2021-11-26 15:57:55'),
(65, '127.0.0.1', 'http://localhost/categories/show/14/1', '2021-11-26 15:58:19'),
(66, '127.0.0.1', 'http://localhost/categories/show/14/1', '2021-11-26 15:58:53'),
(67, '127.0.0.1', 'http://localhost/categories/show/14/1', '2021-11-26 15:59:01'),
(68, '127.0.0.1', 'http://localhost/categories/show/14/1', '2021-11-26 15:59:19'),
(69, '127.0.0.1', 'http://localhost/categories/show/14/1', '2021-11-26 16:02:17'),
(70, '127.0.0.1', 'http://localhost/categories/show/14/1', '2021-11-26 16:04:02'),
(71, '127.0.0.1', 'http://localhost/categories/show/14/1', '2021-11-26 16:04:03'),
(72, '127.0.0.1', 'http://localhost/categories/show/14/1', '2021-11-26 16:04:04'),
(73, '127.0.0.1', 'http://localhost/categories/show/14/1', '2021-11-26 16:04:18'),
(74, '127.0.0.1', 'http://localhost/categories/show/14/1', '2021-11-26 16:05:07'),
(75, '127.0.0.1', 'http://localhost/categories/show/14/1', '2021-11-26 16:05:09'),
(76, '127.0.0.1', 'http://localhost/categories/show/14/1', '2021-11-26 16:05:27'),
(77, '127.0.0.1', 'http://localhost/categories/show/14/1', '2021-11-26 16:06:16'),
(78, '127.0.0.1', 'http://localhost/categories/show/14/1', '2021-11-26 16:07:00'),
(79, '127.0.0.1', 'http://localhost/categories/show/14/1', '2021-11-26 16:07:27'),
(80, '127.0.0.1', 'http://localhost/categories/show/14/1', '2021-11-26 16:07:49'),
(81, '127.0.0.1', 'http://localhost/categories/show/14/1', '2021-11-26 16:08:03'),
(82, '127.0.0.1', 'http://localhost/categories/show/14/1', '2021-11-26 16:08:10'),
(83, '127.0.0.1', 'http://localhost/news/index/1', '2021-11-26 16:08:11'),
(84, '127.0.0.1', 'http://localhost/categories/show/14/1', '2021-11-26 16:08:17'),
(85, '127.0.0.1', 'http://localhost/categories/show/14/1', '2021-11-26 16:08:41'),
(86, '127.0.0.1', 'http://localhost/categories/show/14/1', '2021-11-26 16:09:56'),
(87, '127.0.0.1', 'http://localhost/categories/show/14/1', '2021-11-26 16:10:35'),
(88, '127.0.0.1', 'http://localhost/categories/show/14/1', '2021-11-26 16:10:52'),
(89, '127.0.0.1', 'http://localhost/categories/show/14/1', '2021-11-26 16:11:00'),
(90, '127.0.0.1', 'http://localhost/categories/show/14/1', '2021-11-26 16:11:55'),
(91, '127.0.0.1', 'http://localhost/categories/show/14/2', '2021-11-26 16:12:01'),
(92, '127.0.0.1', 'http://localhost/categories/show/14/ddd4', '2021-11-26 16:12:06'),
(93, '127.0.0.1', 'http://localhost/categories/show/14/1', '2021-11-26 16:12:13'),
(94, '127.0.0.1', 'http://localhost/categories/show/14/1', '2021-11-26 16:12:38'),
(95, '127.0.0.1', 'http://localhost/categories/show/14/1', '2021-11-26 16:14:37'),
(96, '127.0.0.1', 'http://localhost/news/index/2', '2021-11-26 16:14:46'),
(97, '127.0.0.1', 'http://localhost/categories/show/14/1', '2021-11-26 16:15:33'),
(98, '127.0.0.1', 'http://localhost/categories/show/14/1', '2021-11-26 16:15:34'),
(99, '127.0.0.1', 'http://localhost/categories/show/2', '2021-11-26 16:15:37'),
(100, '127.0.0.1', 'http://localhost/categories/show/1', '2021-11-26 16:16:29'),
(101, '127.0.0.1', 'http://localhost/categories/show/1', '2021-11-26 16:17:13'),
(102, '127.0.0.1', 'http://localhost/categories/show/1', '2021-11-26 16:17:16'),
(103, '127.0.0.1', 'http://localhost/categories/show/14/1', '2021-11-26 16:17:24'),
(104, '127.0.0.1', 'http://localhost/categories/show/14/1', '2021-11-26 16:18:23'),
(105, '127.0.0.1', 'http://localhost/categories/show/%3Cbr%20/%3E%3Cb%3EWarning%3C/b%3E:%20%20Trying%20to%20access%20array%20offset%20on%20value%20of%20type%20bool%20in%20%3Cb%3EC:/xampp/htdocs/App/Views/categories/show.php%3C/b%3E%20on%20line%20%3Cb%3E99%3C/b%3E%3Cbr%20/%3E', '2021-11-26 16:18:26'),
(106, '127.0.0.1', 'http://localhost/categories/show/%3Cbr%20/%3E%3Cb%3EWarning%3C/b%3E:%20%20Trying%20to%20access%20array%20offset%20on%20value%20of%20type%20bool%20in%20%3Cb%3EC:/xampp/htdocs/App/Views/categories/show.php%3C/b%3E%20on%20line%20%3Cb%3E99%3C/b%3E%3Cbr%20/%3E', '2021-11-26 16:18:42'),
(107, '127.0.0.1', 'http://localhost/categories/show/14/1', '2021-11-26 16:18:49'),
(108, '127.0.0.1', 'http://localhost/categories/show/%3Cbr%20/%3E%3Cb%3EWarning%3C/b%3E:%20%20Trying%20to%20access%20array%20offset%20on%20value%20of%20type%20bool%20in%20%3Cb%3EC:/xampp/htdocs/App/Views/categories/show.php%3C/b%3E%20on%20line%20%3Cb%3E99%3C/b%3E%3Cbr%20/%3E', '2021-11-26 16:19:14'),
(109, '127.0.0.1', 'http://localhost/categories/show/14/1', '2021-11-26 16:19:20'),
(110, '127.0.0.1', 'http://localhost/categories/show/14/1', '2021-11-26 16:19:25'),
(111, '127.0.0.1', 'http://localhost/categories/show/14/1', '2021-11-26 16:20:00'),
(112, '127.0.0.1', 'http://localhost/categories/show/14/1', '2021-11-26 16:20:22'),
(113, '127.0.0.1', 'http://localhost/categories/show/14/1', '2021-11-26 16:21:08'),
(114, '127.0.0.1', 'http://localhost/categories/show/14/1', '2021-11-26 16:22:19'),
(115, '127.0.0.1', 'http://localhost/categories/show/14/1', '2021-11-26 16:22:35'),
(116, '127.0.0.1', 'http://localhost/categories/show/15/1', '2021-11-26 16:24:20'),
(117, '127.0.0.1', 'http://localhost/categories/show/16/1', '2021-11-26 16:24:23'),
(118, '127.0.0.1', 'http://localhost/categories/show/17/1', '2021-11-26 16:24:25'),
(119, '127.0.0.1', 'http://localhost/categories/show/18/1', '2021-11-26 16:24:26'),
(120, '127.0.0.1', 'http://localhost/categories/show/19/1', '2021-11-26 16:24:28'),
(121, '127.0.0.1', 'http://localhost/categories/show/22/1', '2021-11-26 16:24:29'),
(122, '127.0.0.1', 'http://localhost/categories/show/14/1', '2021-11-26 16:24:33'),
(123, '127.0.0.1', 'http://localhost/categories/show/16/1', '2021-11-26 16:24:36'),
(124, '127.0.0.1', 'http://localhost/categories/show/14/1', '2021-11-26 16:24:39'),
(125, '127.0.0.1', 'http://localhost/categories/show/14/1', '2021-11-26 16:26:10'),
(126, '127.0.0.1', 'http://localhost/categories/show/14/1', '2021-11-26 16:28:37'),
(127, '127.0.0.1', 'http://localhost/categories/show/14/1', '2021-11-26 16:31:30'),
(128, '127.0.0.1', 'http://localhost/categories/show/14/1', '2021-11-26 16:33:24'),
(129, '127.0.0.1', 'http://localhost/categories/show/14/1', '2021-11-26 16:34:21'),
(130, '127.0.0.1', 'http://localhost/categories/show/14/2', '2021-11-26 16:34:30'),
(131, '127.0.0.1', 'http://localhost/categories/show/14/1', '2021-11-26 16:34:33'),
(132, '127.0.0.1', 'http://localhost/categories/show/14/1/4', '2021-11-26 16:34:38'),
(133, '127.0.0.1', 'http://localhost/categories/show/14/1/4/255', '2021-11-26 16:34:50'),
(134, '127.0.0.1', 'http://localhost/categories/show/14/ddd4', '2021-11-26 16:35:01'),
(135, '127.0.0.1', 'http://localhost/categories/show/14', '2021-11-26 16:35:07'),
(136, '127.0.0.1', 'http://localhost/categories/show/14/1', '2021-11-26 16:35:10'),
(137, '127.0.0.1', 'http://localhost/categories/show/14/2', '2021-11-26 16:35:16'),
(138, '127.0.0.1', 'http://localhost/categories/show/14/3', '2021-11-26 16:35:22'),
(139, '127.0.0.1', 'http://localhost/categories/show/14/2', '2021-11-26 16:35:26'),
(140, '127.0.0.1', 'http://localhost/categories/show/14/1', '2021-11-26 16:35:27'),
(141, '127.0.0.1', 'http://localhost/categories/show/17/1', '2021-11-26 16:35:46'),
(142, '127.0.0.1', 'http://localhost/categories/show/17/1', '2021-11-26 16:36:24'),
(143, '127.0.0.1', 'http://localhost/categories/show/17/2', '2021-11-26 16:36:27'),
(144, '127.0.0.1', 'http://localhost/categories/show/17/1', '2021-11-26 16:36:29'),
(145, '127.0.0.1', 'http://localhost/categories/show/14/1', '2021-11-26 16:36:31'),
(146, '127.0.0.1', 'http://localhost/news/index/1', '2021-11-26 16:37:45'),
(147, '127.0.0.1', 'http://localhost/home', '2021-11-26 16:37:47'),
(148, '127.0.0.1', 'http://localhost/home', '2021-11-26 16:38:44'),
(149, '127.0.0.1', 'http://localhost/news/index/1', '2021-11-26 16:38:55'),
(150, '127.0.0.1', 'http://localhost/news/index/2', '2021-11-26 16:38:58'),
(151, '127.0.0.1', 'http://localhost/news/index/1', '2021-11-26 16:39:04'),
(152, '127.0.0.1', 'http://localhost/dashboard', '2021-11-26 16:39:35'),
(153, '127.0.0.1', 'http://localhost/dashboard', '2021-11-26 16:40:19'),
(154, '127.0.0.1', 'http://localhost/dashboard', '2021-11-26 16:40:36'),
(155, '127.0.0.1', 'http://localhost/dashboard', '2021-11-26 16:40:47'),
(156, '127.0.0.1', 'http://localhost/dashboard', '2021-11-26 16:41:02'),
(157, '127.0.0.1', 'http://localhost/logout', '2021-11-26 16:41:11'),
(158, '127.0.0.1', 'http://localhost/home', '2021-11-26 16:41:11'),
(159, '127.0.0.1', 'http://localhost/dashboard', '2021-11-26 16:41:20'),
(160, '127.0.0.1', 'http://localhost/contact', '2021-11-26 16:41:23'),
(161, '127.0.0.1', 'http://localhost/login', '2021-11-26 16:41:27'),
(162, '127.0.0.1', 'http://localhost/login', '2021-11-26 16:41:31'),
(163, '127.0.0.1', 'http://localhost/dashboard', '2021-11-26 16:41:31'),
(164, '127.0.0.1', 'http://localhost/users/index', '2021-11-26 16:41:39'),
(165, '127.0.0.1', 'http://localhost/users/admin', '2021-11-26 16:41:51'),
(166, '127.0.0.1', 'http://localhost/users/admin', '2021-11-26 16:42:17'),
(167, '127.0.0.1', 'http://localhost/news/create', '2021-11-26 16:42:25'),
(168, '127.0.0.1', 'http://localhost/news/list', '2021-11-26 16:42:32'),
(169, '127.0.0.1', 'http://localhost/categories/index', '2021-11-26 16:42:38'),
(170, '127.0.0.1', 'http://localhost/categories/create', '2021-11-26 16:42:44'),
(171, '127.0.0.1', 'http://localhost/banners/index', '2021-11-26 16:42:48'),
(172, '127.0.0.1', 'http://localhost/subscribes/index', '2021-11-26 16:42:55'),
(173, '127.0.0.1', 'http://localhost/subscribes/delete/11', '2021-11-26 16:43:13'),
(174, '127.0.0.1', 'http://localhost/subscribes/index', '2021-11-26 16:43:13'),
(175, '127.0.0.1', 'http://localhost/subscribes/delete/12', '2021-11-26 16:43:17'),
(176, '127.0.0.1', 'http://localhost/subscribes/index', '2021-11-26 16:43:17'),
(177, '127.0.0.1', 'http://localhost/subscribes/delete/23', '2021-11-26 16:43:23'),
(178, '127.0.0.1', 'http://localhost/subscribes/index', '2021-11-26 16:43:23'),
(179, '127.0.0.1', 'http://localhost/subscribes/edit/14', '2021-11-26 16:43:29'),
(180, '127.0.0.1', 'http://localhost/subscribes/edit/14', '2021-11-26 16:43:37'),
(181, '127.0.0.1', 'http://localhost/subscribes/index', '2021-11-26 16:43:37'),
(182, '127.0.0.1', 'http://localhost/comments/index', '2021-11-26 16:43:49'),
(183, '127.0.0.1', 'http://localhost/comments/edit/27', '2021-11-26 16:43:58'),
(184, '127.0.0.1', 'http://localhost/comments/edit/27', '2021-11-26 16:44:03'),
(185, '127.0.0.1', 'http://localhost/comments/index', '2021-11-26 16:44:03'),
(186, '127.0.0.1', 'http://localhost/contact/list', '2021-11-26 16:44:17'),
(187, '127.0.0.1', 'http://localhost/messages', '2021-11-26 16:44:24'),
(188, '127.0.0.1', 'http://localhost/dashboard', '2021-11-26 16:44:31'),
(189, '127.0.0.1', 'http://localhost/dashboard', '2021-11-26 16:45:05'),
(190, '127.0.0.1', 'http://localhost/dashboard', '2021-11-26 16:47:32'),
(191, '127.0.0.1', 'http://localhost/', '2021-11-26 16:48:15'),
(192, '127.0.0.1', 'http://localhost/search/index', '2021-11-26 16:48:26'),
(193, '127.0.0.1', 'http://localhost/', '2021-11-26 16:48:27'),
(194, '127.0.0.1', 'http://localhost/', '2021-11-26 16:48:51'),
(195, '127.0.0.1', 'http://localhost/', '2021-11-26 16:48:53'),
(196, '127.0.0.1', 'http://localhost/', '2021-11-26 16:48:55'),
(197, '127.0.0.1', 'http://localhost/', '2021-11-26 16:49:16'),
(198, '127.0.0.1', 'http://localhost/', '2021-11-26 16:50:05'),
(199, '127.0.0.1', 'http://localhost/', '2021-11-26 16:50:05'),
(200, '127.0.0.1', 'http://localhost/', '2021-11-26 16:50:28'),
(201, '127.0.0.1', 'http://localhost/', '2021-11-26 16:51:08'),
(202, '127.0.0.1', 'http://localhost/', '2021-11-26 16:51:21'),
(203, '127.0.0.1', 'http://localhost/contact', '2021-11-26 16:51:50'),
(204, '127.0.0.1', 'http://localhost/categories/show/18/1', '2021-11-26 16:51:58'),
(205, '127.0.0.1', 'http://localhost/home', '2021-11-26 16:52:05'),
(206, '127.0.0.1', 'http://localhost/news/index/1', '2021-11-26 16:52:07'),
(207, '127.0.0.1', 'http://localhost/home', '2021-11-26 16:52:57'),
(208, '127.0.0.1', 'http://localhost/home', '2021-11-26 16:53:28'),
(209, '127.0.0.1', 'http://localhost/news/index/1', '2021-11-26 16:53:56'),
(210, '127.0.0.1', 'http://localhost/news/index/1', '2021-11-26 16:54:03'),
(211, '127.0.0.1', 'http://localhost/news/index/1', '2021-11-26 16:54:06'),
(212, '127.0.0.1', 'http://localhost/home', '2021-11-26 16:54:24'),
(213, '127.0.0.1', 'http://localhost/dashboard', '2021-11-26 16:55:00'),
(214, '127.0.0.1', 'http://localhost/news/list', '2021-11-26 16:55:05'),
(215, '127.0.0.1', 'http://localhost/news/edit/13', '2021-11-26 16:55:09'),
(216, '127.0.0.1', 'http://localhost/news/edit/13', '2021-11-26 16:56:29'),
(217, '127.0.0.1', 'http://localhost/news/index', '2021-11-26 16:56:29'),
(218, '127.0.0.1', 'http://localhost/home', '2021-11-26 16:57:45'),
(219, '127.0.0.1', 'http://localhost/dashboard', '2021-11-26 16:58:08'),
(220, '127.0.0.1', 'http://localhost/news/list', '2021-11-26 16:58:13'),
(221, '127.0.0.1', 'http://localhost/news/edit/15', '2021-11-26 16:58:18'),
(222, '127.0.0.1', 'http://localhost/news/edit/15', '2021-11-26 16:59:08'),
(223, '127.0.0.1', 'http://localhost/news/list', '2021-11-26 16:59:08'),
(224, '127.0.0.1', 'http://localhost/', '2021-11-26 16:59:20'),
(225, '::1', 'http://localhost/', '2021-12-01 16:44:54'),
(226, '::1', 'http://localhost/favicon.ico', '2021-12-01 16:44:56'),
(227, '::1', 'http://localhost/site.webmanifest', '2021-12-01 16:44:56'),
(228, '::1', 'http://localhost/', '2021-12-01 16:47:36'),
(229, '::1', 'http://localhost/favicon.ico', '2021-12-01 16:47:37'),
(230, '::1', 'http://localhost/site.webmanifest', '2021-12-01 16:47:37'),
(231, '::1', 'http://localhost/product-details.html', '2021-12-01 16:47:38'),
(232, '::1', 'http://localhost/favicon.ico', '2021-12-01 16:47:39'),
(233, '::1', 'http://localhost/site.webmanifest', '2021-12-01 16:47:39'),
(234, '::1', 'http://localhost/product-details.html', '2021-12-01 16:49:10'),
(235, '::1', 'http://localhost/favicon.ico', '2021-12-01 16:49:12'),
(236, '::1', 'http://localhost/site.webmanifest', '2021-12-01 16:49:12'),
(237, '::1', 'http://localhost/product-details.html', '2021-12-01 16:49:36'),
(238, '::1', 'http://localhost/favicon.ico', '2021-12-01 16:49:37'),
(239, '::1', 'http://localhost/site.webmanifest', '2021-12-01 16:49:37'),
(240, '::1', 'http://localhost/product-details.html', '2021-12-01 16:50:20'),
(241, '::1', 'http://localhost/favicon.ico', '2021-12-01 16:50:21'),
(242, '::1', 'http://localhost/site.webmanifest', '2021-12-01 16:50:21'),
(243, '::1', 'http://localhost/product-details.html', '2021-12-01 16:54:06'),
(244, '::1', 'http://localhost/favicon.ico', '2021-12-01 16:54:07'),
(245, '::1', 'http://localhost/site.webmanifest', '2021-12-01 16:54:07'),
(246, '::1', 'http://localhost/product-details.html', '2021-12-01 16:54:28'),
(247, '::1', 'http://localhost/favicon.ico', '2021-12-01 16:54:29'),
(248, '::1', 'http://localhost/site.webmanifest', '2021-12-01 16:54:29'),
(249, '::1', 'http://localhost/product-details.html', '2021-12-01 16:55:39'),
(250, '::1', 'http://localhost/favicon.ico', '2021-12-01 16:55:40'),
(251, '::1', 'http://localhost/site.webmanifest', '2021-12-01 16:55:40'),
(252, '::1', 'http://localhost/product-details.html', '2021-12-01 16:56:43'),
(253, '::1', 'http://localhost/favicon.ico', '2021-12-01 16:56:44'),
(254, '::1', 'http://localhost/site.webmanifest', '2021-12-01 16:56:44'),
(255, '::1', 'http://localhost/product-details.html', '2021-12-01 16:57:22'),
(256, '::1', 'http://localhost/favicon.ico', '2021-12-01 16:57:23'),
(257, '::1', 'http://localhost/site.webmanifest', '2021-12-01 16:57:23'),
(258, '::1', 'http://localhost/product-details.html', '2021-12-01 16:57:47'),
(259, '::1', 'http://localhost/favicon.ico', '2021-12-01 16:57:48'),
(260, '::1', 'http://localhost/site.webmanifest', '2021-12-01 16:57:48'),
(261, '::1', 'http://localhost/product-details.html', '2021-12-01 17:03:03'),
(262, '::1', 'http://localhost/favicon.ico', '2021-12-01 17:03:04'),
(263, '::1', 'http://localhost/site.webmanifest', '2021-12-01 17:03:04'),
(264, '::1', 'http://localhost/product-details.html', '2021-12-01 17:03:11'),
(265, '::1', 'http://localhost/favicon.ico', '2021-12-01 17:03:11'),
(266, '::1', 'http://localhost/site.webmanifest', '2021-12-01 17:03:11'),
(267, '::1', 'http://localhost/product-details.html', '2021-12-01 17:05:04'),
(268, '::1', 'http://localhost/favicon.ico', '2021-12-01 17:05:05'),
(269, '::1', 'http://localhost/site.webmanifest', '2021-12-01 17:05:05'),
(270, '::1', 'http://localhost/product-details.html', '2021-12-01 17:06:49'),
(271, '::1', 'http://localhost/favicon.ico', '2021-12-01 17:06:50'),
(272, '::1', 'http://localhost/site.webmanifest', '2021-12-01 17:06:50'),
(273, '::1', 'http://localhost/product-details.html', '2021-12-01 17:10:07'),
(274, '::1', 'http://localhost/favicon.ico', '2021-12-01 17:10:08'),
(275, '::1', 'http://localhost/site.webmanifest', '2021-12-01 17:10:08'),
(276, '::1', 'http://localhost/product-details.html', '2021-12-01 17:23:16'),
(277, '::1', 'http://localhost/favicon.ico', '2021-12-01 17:23:17'),
(278, '::1', 'http://localhost/site.webmanifest', '2021-12-01 17:23:17'),
(279, '::1', 'http://localhost/', '2021-12-01 17:23:29'),
(280, '::1', 'http://localhost/favicon.ico', '2021-12-01 17:23:30'),
(281, '::1', 'http://localhost/', '2021-12-01 17:24:25'),
(282, '::1', 'http://localhost/favicon.ico', '2021-12-01 17:24:26'),
(283, '::1', 'http://localhost/site.webmanifest', '2021-12-01 17:24:26'),
(284, '::1', 'http://localhost/', '2021-12-01 17:25:41'),
(285, '::1', 'http://localhost/', '2021-12-01 17:27:32'),
(286, '::1', 'http://localhost/', '2021-12-01 17:27:32'),
(287, '::1', 'http://localhost/product-details.html', '2021-12-01 17:27:32'),
(288, '::1', 'http://localhost/', '2021-12-01 17:27:32'),
(289, '::1', 'http://localhost/', '2021-12-01 17:27:37'),
(290, '::1', 'http://localhost/favicon.ico', '2021-12-01 17:27:37'),
(291, '::1', 'http://localhost/', '2021-12-01 17:31:26'),
(292, '::1', 'http://localhost/', '2021-12-01 17:32:36'),
(293, '::1', 'http://localhost/favicon.ico', '2021-12-01 17:32:36'),
(294, '::1', 'http://localhost/', '2021-12-01 17:33:47'),
(295, '::1', 'http://localhost/', '2021-12-01 17:46:54'),
(296, '::1', 'http://localhost/', '2021-12-01 17:46:55'),
(297, '::1', 'http://localhost/favicon.ico', '2021-12-01 17:46:56'),
(298, '::1', 'http://localhost/site.webmanifest', '2021-12-01 17:46:56'),
(299, '::1', 'http://localhost/site.webmanifest', '2021-12-01 17:49:18'),
(300, '::1', 'http://localhost/assets/js/bootstrap.min.js.map', '2021-12-01 17:49:18'),
(301, '::1', 'http://localhost/assets/js/popper.min.js.map', '2021-12-01 17:49:18'),
(302, '::1', 'http://localhost/assets/css/bootstrap.min.css.map', '2021-12-01 17:49:18'),
(303, '::1', 'http://localhost/assets/css/style.css.map', '2021-12-01 17:49:18'),
(304, '::1', 'http://localhost/', '2021-12-01 17:49:39'),
(305, '::1', 'http://localhost/assets/css/bootstrap.min.css.map', '2021-12-01 17:49:39'),
(306, '::1', 'http://localhost/assets/css/style.css.map', '2021-12-01 17:49:39'),
(307, '::1', 'http://localhost/assets/js/popper.min.js.map', '2021-12-01 17:49:40'),
(308, '::1', 'http://localhost/assets/js/bootstrap.min.js.map', '2021-12-01 17:49:40'),
(309, '::1', 'http://localhost/favicon.ico', '2021-12-01 17:49:40'),
(310, '::1', 'http://localhost/site.webmanifest', '2021-12-01 17:49:40'),
(311, '::1', 'http://localhost/', '2021-12-01 17:56:25'),
(312, '::1', 'http://localhost/favicon.ico', '2021-12-01 17:56:26'),
(313, '::1', 'http://localhost/site.webmanifest', '2021-12-01 17:56:26'),
(314, '::1', 'http://localhost/', '2021-12-01 17:59:41'),
(315, '::1', 'http://localhost/favicon.ico', '2021-12-01 17:59:42'),
(316, '::1', 'http://localhost/site.webmanifest', '2021-12-01 17:59:42'),
(317, '::1', 'http://localhost/', '2021-12-01 18:05:30'),
(318, '::1', 'http://localhost/favicon.ico', '2021-12-01 18:05:31'),
(319, '::1', 'http://localhost/site.webmanifest', '2021-12-01 18:05:31'),
(320, '::1', 'http://localhost/', '2021-12-01 18:14:30'),
(321, '::1', 'http://localhost/site.webmanifest', '2021-12-01 18:14:31'),
(322, '::1', 'http://localhost/favicon.ico', '2021-12-01 18:14:31'),
(323, '::1', 'http://localhost/', '2021-12-01 18:14:33'),
(324, '::1', 'http://localhost/favicon.ico', '2021-12-01 18:14:34'),
(325, '::1', 'http://localhost/site.webmanifest', '2021-12-01 18:14:34'),
(326, '::1', 'http://localhost/', '2021-12-01 18:15:06'),
(327, '::1', 'http://localhost/favicon.ico', '2021-12-01 18:15:07'),
(328, '::1', 'http://localhost/site.webmanifest', '2021-12-01 18:15:07'),
(329, '::1', 'http://localhost/', '2021-12-01 18:15:22'),
(330, '::1', 'http://localhost/favicon.ico', '2021-12-01 18:15:23'),
(331, '::1', 'http://localhost/site.webmanifest', '2021-12-01 18:15:23'),
(332, '::1', 'http://localhost/', '2021-12-01 18:15:40'),
(333, '::1', 'http://localhost/favicon.ico', '2021-12-01 18:15:41'),
(334, '::1', 'http://localhost/site.webmanifest', '2021-12-01 18:15:41'),
(335, '::1', 'http://localhost/', '2021-12-01 18:17:13'),
(336, '::1', 'http://localhost/favicon.ico', '2021-12-01 18:17:14'),
(337, '::1', 'http://localhost/site.webmanifest', '2021-12-01 18:17:14'),
(338, '::1', 'http://localhost/', '2021-12-01 18:18:45'),
(339, '::1', 'http://localhost/favicon.ico', '2021-12-01 18:18:46'),
(340, '::1', 'http://localhost/site.webmanifest', '2021-12-01 18:18:46'),
(341, '::1', 'http://localhost/', '2021-12-01 18:19:38'),
(342, '::1', 'http://localhost/site.webmanifest', '2021-12-01 18:19:39'),
(343, '::1', 'http://localhost/favicon.ico', '2021-12-01 18:19:39'),
(344, '::1', 'http://localhost/', '2021-12-01 18:21:53'),
(345, '::1', 'http://localhost/favicon.ico', '2021-12-01 18:21:54'),
(346, '::1', 'http://localhost/site.webmanifest', '2021-12-01 18:21:54'),
(347, '::1', 'http://localhost/', '2021-12-01 18:24:43'),
(348, '::1', 'http://localhost/favicon.ico', '2021-12-01 18:24:44'),
(349, '::1', 'http://localhost/', '2021-12-01 19:15:23'),
(350, '::1', 'http://localhost/favicon.ico', '2021-12-01 19:15:24'),
(351, '::1', 'http://localhost/site.webmanifest', '2021-12-01 19:15:24'),
(352, '::1', 'http://localhost/', '2021-12-01 19:16:09'),
(353, '::1', 'http://localhost/favicon.ico', '2021-12-01 19:16:10'),
(354, '::1', 'http://localhost/site.webmanifest', '2021-12-01 19:16:10'),
(355, '::1', 'http://localhost/', '2021-12-01 19:16:55'),
(356, '::1', 'http://localhost/favicon.ico', '2021-12-01 19:16:56'),
(357, '::1', 'http://localhost/site.webmanifest', '2021-12-01 19:16:56'),
(358, '::1', 'http://localhost/', '2021-12-01 19:17:17'),
(359, '::1', 'http://localhost/favicon.ico', '2021-12-01 19:17:18'),
(360, '::1', 'http://localhost/site.webmanifest', '2021-12-01 19:17:18'),
(361, '::1', 'http://localhost/', '2021-12-01 19:20:58'),
(362, '::1', 'http://localhost/favicon.ico', '2021-12-01 19:20:59'),
(363, '::1', 'http://localhost/site.webmanifest', '2021-12-01 19:20:59'),
(364, '::1', 'http://localhost/', '2021-12-01 19:21:56'),
(365, '::1', 'http://localhost/favicon.ico', '2021-12-01 19:21:57'),
(366, '::1', 'http://localhost/site.webmanifest', '2021-12-01 19:21:57'),
(367, '::1', 'http://localhost/', '2021-12-01 19:22:41'),
(368, '::1', 'http://localhost/favicon.ico', '2021-12-01 19:22:42'),
(369, '::1', 'http://localhost/site.webmanifest', '2021-12-01 19:22:42'),
(370, '::1', 'http://localhost/', '2021-12-01 19:23:57'),
(371, '::1', 'http://localhost/favicon.ico', '2021-12-01 19:23:58'),
(372, '::1', 'http://localhost/site.webmanifest', '2021-12-01 19:23:58'),
(373, '::1', 'http://localhost/', '2021-12-01 19:24:15'),
(374, '::1', 'http://localhost/favicon.ico', '2021-12-01 19:24:16'),
(375, '::1', 'http://localhost/site.webmanifest', '2021-12-01 19:24:16'),
(376, '::1', 'http://localhost/', '2021-12-01 19:28:02'),
(377, '::1', 'http://localhost/favicon.ico', '2021-12-01 19:28:03'),
(378, '::1', 'http://localhost/site.webmanifest', '2021-12-01 19:28:03'),
(379, '::1', 'http://localhost/', '2021-12-01 19:28:28'),
(380, '::1', 'http://localhost/favicon.ico', '2021-12-01 19:28:29'),
(381, '::1', 'http://localhost/site.webmanifest', '2021-12-01 19:28:29'),
(382, '::1', 'http://localhost/', '2021-12-01 19:29:21'),
(383, '::1', 'http://localhost/favicon.ico', '2021-12-01 19:29:22'),
(384, '::1', 'http://localhost/site.webmanifest', '2021-12-01 19:29:22'),
(385, '::1', 'http://localhost/', '2021-12-01 19:30:00'),
(386, '::1', 'http://localhost/favicon.ico', '2021-12-01 19:30:01'),
(387, '::1', 'http://localhost/site.webmanifest', '2021-12-01 19:30:01'),
(388, '::1', 'http://localhost/', '2021-12-01 19:30:28'),
(389, '::1', 'http://localhost/favicon.ico', '2021-12-01 19:30:28'),
(390, '::1', 'http://localhost/site.webmanifest', '2021-12-01 19:30:28'),
(391, '::1', 'http://localhost/', '2021-12-01 19:32:01'),
(392, '::1', 'http://localhost/favicon.ico', '2021-12-01 19:32:02'),
(393, '::1', 'http://localhost/site.webmanifest', '2021-12-01 19:32:02'),
(394, '::1', 'http://localhost/', '2021-12-01 19:32:22'),
(395, '::1', 'http://localhost/favicon.ico', '2021-12-01 19:32:23'),
(396, '::1', 'http://localhost/site.webmanifest', '2021-12-01 19:32:23'),
(397, '::1', 'http://localhost/', '2021-12-01 19:33:41'),
(398, '::1', 'http://localhost/favicon.ico', '2021-12-01 19:33:42'),
(399, '::1', 'http://localhost/site.webmanifest', '2021-12-01 19:33:42'),
(400, '::1', 'http://localhost/', '2021-12-01 19:34:13'),
(401, '::1', 'http://localhost/favicon.ico', '2021-12-01 19:34:13'),
(402, '::1', 'http://localhost/site.webmanifest', '2021-12-01 19:34:13'),
(403, '::1', 'http://localhost/site.webmanifest', '2021-12-01 19:35:02'),
(404, '::1', 'http://localhost/assets/js/popper.min.js.map', '2021-12-01 19:35:02'),
(405, '::1', 'http://localhost/assets/js/bootstrap.min.js.map', '2021-12-01 19:35:02'),
(406, '::1', 'http://localhost/assets/css/bootstrap.min.css.map', '2021-12-01 19:35:02'),
(407, '::1', 'http://localhost/assets/css/style.css.map', '2021-12-01 19:35:02'),
(408, '::1', 'http://localhost/', '2021-12-01 19:36:30'),
(409, '::1', 'http://localhost/assets/css/bootstrap.min.css.map', '2021-12-01 19:36:31'),
(410, '::1', 'http://localhost/assets/css/style.css.map', '2021-12-01 19:36:31'),
(411, '::1', 'http://localhost/assets/js/popper.min.js.map', '2021-12-01 19:36:31'),
(412, '::1', 'http://localhost/assets/js/bootstrap.min.js.map', '2021-12-01 19:36:31'),
(413, '::1', 'http://localhost/favicon.ico', '2021-12-01 19:36:32'),
(414, '::1', 'http://localhost/site.webmanifest', '2021-12-01 19:36:32'),
(415, '::1', 'http://localhost/', '2021-12-01 19:37:01'),
(416, '::1', 'http://localhost/favicon.ico', '2021-12-01 19:37:02'),
(417, '::1', 'http://localhost/site.webmanifest', '2021-12-01 19:37:02'),
(418, '::1', 'http://localhost/site.webmanifest', '2021-12-01 19:37:09'),
(419, '::1', 'http://localhost/assets/js/popper.min.js.map', '2021-12-01 19:37:10'),
(420, '::1', 'http://localhost/assets/js/bootstrap.min.js.map', '2021-12-01 19:37:10'),
(421, '::1', 'http://localhost/assets/css/bootstrap.min.css.map', '2021-12-01 19:37:10'),
(422, '::1', 'http://localhost/assets/css/style.css.map', '2021-12-01 19:37:10'),
(423, '::1', 'http://localhost/assets/css/bootstrap.min.css.map', '2021-12-01 19:39:25'),
(424, '::1', 'http://localhost/assets/css/style.css.map', '2021-12-01 19:39:25'),
(425, '::1', 'http://localhost/assets/js/popper.min.js.map', '2021-12-01 19:39:25'),
(426, '::1', 'http://localhost/assets/js/bootstrap.min.js.map', '2021-12-01 19:39:25'),
(427, '::1', 'http://localhost/', '2021-12-01 19:40:38'),
(428, '::1', 'http://localhost/assets/css/bootstrap.min.css.map', '2021-12-01 19:40:38'),
(429, '::1', 'http://localhost/assets/css/style.css.map', '2021-12-01 19:40:38'),
(430, '::1', 'http://localhost/assets/js/popper.min.js.map', '2021-12-01 19:40:38'),
(431, '::1', 'http://localhost/assets/js/bootstrap.min.js.map', '2021-12-01 19:40:38'),
(432, '::1', 'http://localhost/favicon.ico', '2021-12-01 19:40:38'),
(433, '::1', 'http://localhost/site.webmanifest', '2021-12-01 19:40:38'),
(434, '::1', 'http://localhost/', '2021-12-01 19:42:02'),
(435, '::1', 'http://localhost/assets/css/bootstrap.min.css.map', '2021-12-01 19:42:02'),
(436, '::1', 'http://localhost/assets/css/style.css.map', '2021-12-01 19:42:03'),
(437, '::1', 'http://localhost/assets/js/popper.min.js.map', '2021-12-01 19:42:03'),
(438, '::1', 'http://localhost/assets/js/bootstrap.min.js.map', '2021-12-01 19:42:03'),
(439, '::1', 'http://localhost/favicon.ico', '2021-12-01 19:42:04'),
(440, '::1', 'http://localhost/site.webmanifest', '2021-12-01 19:42:04'),
(441, '::1', 'http://localhost/', '2021-12-01 19:42:38'),
(442, '::1', 'http://localhost/assets/css/bootstrap.min.css.map', '2021-12-01 19:42:39'),
(443, '::1', 'http://localhost/assets/css/style.css.map', '2021-12-01 19:42:39'),
(444, '::1', 'http://localhost/assets/js/popper.min.js.map', '2021-12-01 19:42:40'),
(445, '::1', 'http://localhost/assets/js/bootstrap.min.js.map', '2021-12-01 19:42:40'),
(446, '::1', 'http://localhost/favicon.ico', '2021-12-01 19:42:40'),
(447, '::1', 'http://localhost/site.webmanifest', '2021-12-01 19:42:40'),
(448, '::1', 'http://localhost/', '2021-12-01 19:42:59'),
(449, '::1', 'http://localhost/assets/css/bootstrap.min.css.map', '2021-12-01 19:42:59'),
(450, '::1', 'http://localhost/assets/css/style.css.map', '2021-12-01 19:42:59'),
(451, '::1', 'http://localhost/assets/js/popper.min.js.map', '2021-12-01 19:43:00'),
(452, '::1', 'http://localhost/assets/js/bootstrap.min.js.map', '2021-12-01 19:43:00'),
(453, '::1', 'http://localhost/favicon.ico', '2021-12-01 19:43:00'),
(454, '::1', 'http://localhost/site.webmanifest', '2021-12-01 19:43:00'),
(455, '::1', 'http://localhost/', '2021-12-01 19:43:30'),
(456, '::1', 'http://localhost/assets/css/bootstrap.min.css.map', '2021-12-01 19:43:30'),
(457, '::1', 'http://localhost/assets/css/style.css.map', '2021-12-01 19:43:31'),
(458, '::1', 'http://localhost/assets/js/popper.min.js.map', '2021-12-01 19:43:31'),
(459, '::1', 'http://localhost/assets/js/bootstrap.min.js.map', '2021-12-01 19:43:31'),
(460, '::1', 'http://localhost/site.webmanifest', '2021-12-01 19:43:31'),
(461, '::1', 'http://localhost/favicon.ico', '2021-12-01 19:43:31'),
(462, '::1', 'http://localhost/', '2021-12-01 19:44:41'),
(463, '::1', 'http://localhost/favicon.ico', '2021-12-01 19:44:42'),
(464, '::1', 'http://localhost/site.webmanifest', '2021-12-01 19:44:42'),
(465, '::1', 'http://localhost/', '2021-12-01 19:45:37'),
(466, '::1', 'http://localhost/favicon.ico', '2021-12-01 19:45:38'),
(467, '::1', 'http://localhost/site.webmanifest', '2021-12-01 19:45:38'),
(468, '::1', 'http://localhost/', '2021-12-01 19:46:35'),
(469, '::1', 'http://localhost/favicon.ico', '2021-12-01 19:46:35'),
(470, '::1', 'http://localhost/site.webmanifest', '2021-12-01 19:46:36'),
(471, '::1', 'http://localhost/', '2021-12-01 19:47:03'),
(472, '::1', 'http://localhost/favicon.ico', '2021-12-01 19:47:03'),
(473, '::1', 'http://localhost/site.webmanifest', '2021-12-01 19:47:03'),
(474, '::1', 'http://localhost/site.webmanifest', '2021-12-01 19:48:16'),
(475, '::1', 'http://localhost/assets/js/popper.min.js.map', '2021-12-01 19:48:16'),
(476, '::1', 'http://localhost/assets/js/bootstrap.min.js.map', '2021-12-01 19:48:16'),
(477, '::1', 'http://localhost/assets/css/style.css.map', '2021-12-01 19:48:16'),
(478, '::1', 'http://localhost/assets/css/bootstrap.min.css.map', '2021-12-01 19:48:16'),
(479, '::1', 'http://localhost/', '2021-12-01 19:52:49'),
(480, '::1', 'http://localhost/favicon.ico', '2021-12-01 19:52:50'),
(481, '::1', 'http://localhost/site.webmanifest', '2021-12-01 19:52:50'),
(482, '::1', 'http://localhost/', '2021-12-01 19:53:07'),
(483, '::1', 'http://localhost/site.webmanifest', '2021-12-01 19:53:07'),
(484, '::1', 'http://localhost/favicon.ico', '2021-12-01 19:53:07'),
(485, '::1', 'http://localhost/', '2021-12-01 19:57:46'),
(486, '::1', 'http://localhost/favicon.ico', '2021-12-01 19:57:47'),
(487, '::1', 'http://localhost/site.webmanifest', '2021-12-01 19:57:47'),
(488, '::1', 'http://localhost/', '2021-12-01 20:02:39'),
(489, '::1', 'http://localhost/favicon.ico', '2021-12-01 20:02:40'),
(490, '::1', 'http://localhost/site.webmanifest', '2021-12-01 20:02:40'),
(491, '::1', 'http://localhost/', '2021-12-01 20:03:28'),
(492, '::1', 'http://localhost/favicon.ico', '2021-12-01 20:03:29'),
(493, '::1', 'http://localhost/site.webmanifest', '2021-12-01 20:03:29'),
(494, '::1', 'http://localhost/', '2021-12-01 20:04:23'),
(495, '::1', 'http://localhost/site.webmanifest', '2021-12-01 20:04:24'),
(496, '::1', 'http://localhost/favicon.ico', '2021-12-01 20:04:24'),
(497, '::1', 'http://localhost/', '2021-12-01 20:04:48'),
(498, '::1', 'http://localhost/favicon.ico', '2021-12-01 20:04:49'),
(499, '::1', 'http://localhost/site.webmanifest', '2021-12-01 20:04:49'),
(500, '::1', 'http://localhost/dashboard', '2021-12-01 20:05:01'),
(501, '::1', 'http://localhost/favicon.ico', '2021-12-01 20:05:01'),
(502, '::1', 'http://localhost/site.webmanifest', '2021-12-01 20:05:01'),
(503, '::1', 'http://localhost/dashboard', '2021-12-01 20:05:08'),
(504, '::1', 'http://localhost/favicon.ico', '2021-12-01 20:05:08'),
(505, '::1', 'http://localhost/site.webmanifest', '2021-12-01 20:05:08'),
(506, '::1', 'http://localhost/', '2021-12-01 20:05:21'),
(507, '::1', 'http://localhost/', '2021-12-01 20:05:22'),
(508, '::1', 'http://localhost/favicon.ico', '2021-12-01 20:05:23'),
(509, '::1', 'http://localhost/site.webmanifest', '2021-12-01 20:05:23'),
(510, '::1', 'http://localhost/dashboard', '2021-12-01 20:05:28'),
(511, '::1', 'http://localhost/dashboard', '2021-12-01 20:05:29'),
(512, '::1', 'http://localhost/favicon.ico', '2021-12-01 20:05:29'),
(513, '::1', 'http://localhost/site.webmanifest', '2021-12-01 20:05:29'),
(514, '::1', 'http://localhost/', '2021-12-01 20:05:32'),
(515, '::1', 'http://localhost/favicon.ico', '2021-12-01 20:05:32'),
(516, '::1', 'http://localhost/site.webmanifest', '2021-12-01 20:05:32'),
(517, '::1', 'http://localhost/login', '2021-12-01 20:05:35'),
(518, '::1', 'http://localhost/favicon.ico', '2021-12-01 20:05:35'),
(519, '::1', 'http://localhost/site.webmanifest', '2021-12-01 20:05:35'),
(520, '::1', 'http://localhost/login', '2021-12-01 20:05:46'),
(521, '::1', 'http://localhost/dashboard', '2021-12-01 20:05:46'),
(522, '::1', 'http://localhost/favicon.ico', '2021-12-01 20:05:47'),
(523, '::1', 'http://localhost/news/create', '2021-12-01 20:06:04'),
(524, '::1', 'http://localhost/favicon.ico', '2021-12-01 20:06:05'),
(525, '::1', 'http://localhost/news/create', '2021-12-01 20:09:27'),
(526, '::1', 'http://localhost/news/index', '2021-12-01 20:09:27'),
(527, '::1', 'http://localhost/favicon.ico', '2021-12-01 20:09:28'),
(528, '::1', 'http://localhost/news/site.webmanifest', '2021-12-01 20:09:28'),
(529, '::1', 'http://localhost/news/index', '2021-12-01 20:10:10'),
(530, '::1', 'http://localhost/favicon.ico', '2021-12-01 20:10:10'),
(531, '::1', 'http://localhost/news/site.webmanifest', '2021-12-01 20:10:10'),
(532, '::1', 'http://localhost/dashboard', '2021-12-01 20:10:15'),
(533, '::1', 'http://localhost/favicon.ico', '2021-12-01 20:10:16'),
(534, '::1', 'http://localhost/news/list', '2021-12-01 20:10:19'),
(535, '::1', 'http://localhost/favicon.ico', '2021-12-01 20:10:20'),
(536, '::1', 'http://localhost/', '2021-12-01 20:10:31'),
(537, '::1', 'http://localhost/', '2021-12-01 20:10:31'),
(538, '::1', 'http://localhost/favicon.ico', '2021-12-01 20:10:32'),
(539, '::1', 'http://localhost/site.webmanifest', '2021-12-01 20:10:32'),
(540, '::1', 'http://localhost/site.webmanifest', '2021-12-01 20:11:50'),
(541, '::1', 'http://localhost/assets/js/popper.min.js.map', '2021-12-01 20:11:50'),
(542, '::1', 'http://localhost/assets/js/bootstrap.min.js.map', '2021-12-01 20:11:50'),
(543, '::1', 'http://localhost/assets/css/style.css.map', '2021-12-01 20:11:50'),
(544, '::1', 'http://localhost/assets/css/bootstrap.min.css.map', '2021-12-01 20:11:50'),
(545, '::1', 'http://localhost/', '2021-12-01 20:13:18'),
(546, '::1', 'http://localhost/favicon.ico', '2021-12-01 20:13:19'),
(547, '::1', 'http://localhost/site.webmanifest', '2021-12-01 20:13:19'),
(548, '::1', 'http://localhost/', '2021-12-01 20:15:19'),
(549, '::1', 'http://localhost/site.webmanifest', '2021-12-01 20:15:20'),
(550, '::1', 'http://localhost/favicon.ico', '2021-12-01 20:15:20'),
(551, '::1', 'http://localhost/', '2021-12-01 20:16:20'),
(552, '::1', 'http://localhost/favicon.ico', '2021-12-01 20:16:21'),
(553, '::1', 'http://localhost/site.webmanifest', '2021-12-01 20:16:21'),
(554, '::1', 'http://localhost/', '2021-12-01 20:16:48'),
(555, '::1', 'http://localhost/favicon.ico', '2021-12-01 20:16:49'),
(556, '::1', 'http://localhost/site.webmanifest', '2021-12-01 20:16:49'),
(557, '::1', 'http://localhost/', '2021-12-01 20:17:30'),
(558, '::1', 'http://localhost/favicon.ico', '2021-12-01 20:17:31'),
(559, '::1', 'http://localhost/site.webmanifest', '2021-12-01 20:17:31'),
(560, '::1', 'http://localhost/', '2021-12-01 20:18:02'),
(561, '::1', 'http://localhost/favicon.ico', '2021-12-01 20:18:02'),
(562, '::1', 'http://localhost/site.webmanifest', '2021-12-01 20:18:02'),
(563, '::1', 'http://localhost/', '2021-12-01 20:18:59'),
(564, '::1', 'http://localhost/favicon.ico', '2021-12-01 20:19:00'),
(565, '::1', 'http://localhost/site.webmanifest', '2021-12-01 20:19:00'),
(566, '::1', 'http://localhost/', '2021-12-01 20:19:15'),
(567, '::1', 'http://localhost/favicon.ico', '2021-12-01 20:19:15'),
(568, '::1', 'http://localhost/site.webmanifest', '2021-12-01 20:19:15'),
(569, '::1', 'http://localhost/', '2021-12-01 20:20:00'),
(570, '::1', 'http://localhost/favicon.ico', '2021-12-01 20:20:01'),
(571, '::1', 'http://localhost/site.webmanifest', '2021-12-01 20:20:01'),
(572, '::1', 'http://localhost/', '2021-12-01 20:20:31'),
(573, '::1', 'http://localhost/favicon.ico', '2021-12-01 20:20:32'),
(574, '::1', 'http://localhost/site.webmanifest', '2021-12-01 20:20:32'),
(575, '::1', 'http://localhost/', '2021-12-01 20:22:37'),
(576, '::1', 'http://localhost/favicon.ico', '2021-12-01 20:22:37'),
(577, '::1', 'http://localhost/site.webmanifest', '2021-12-01 20:22:37'),
(578, '::1', 'http://localhost/logout', '2021-12-01 20:22:40'),
(579, '::1', 'http://localhost/home', '2021-12-01 20:22:40'),
(580, '::1', 'http://localhost/favicon.ico', '2021-12-01 20:22:41'),
(581, '::1', 'http://localhost/site.webmanifest', '2021-12-01 20:22:41'),
(582, '::1', 'http://localhost/dashboard', '2021-12-01 20:22:43'),
(583, '::1', 'http://localhost/dashboard', '2021-12-01 20:22:45'),
(584, '::1', 'http://localhost/favicon.ico', '2021-12-01 20:22:45'),
(585, '::1', 'http://localhost/home', '2021-12-01 20:22:49'),
(586, '::1', 'http://localhost/favicon.ico', '2021-12-01 20:22:50'),
(587, '::1', 'http://localhost/site.webmanifest', '2021-12-01 20:22:50'),
(588, '::1', 'http://localhost/home', '2021-12-01 20:22:56'),
(589, '::1', 'http://localhost/favicon.ico', '2021-12-01 20:22:57'),
(590, '::1', 'http://localhost/site.webmanifest', '2021-12-01 20:22:57'),
(591, '::1', 'http://localhost/dashboard', '2021-12-01 20:23:02'),
(592, '::1', 'http://localhost/favicon.ico', '2021-12-01 20:23:02'),
(593, '::1', 'http://localhost/dashboard', '2021-12-01 20:23:14'),
(594, '::1', 'http://localhost/favicon.ico', '2021-12-01 20:23:15'),
(595, '::1', 'http://localhost/site.webmanifest', '2021-12-01 20:23:15'),
(596, '::1', 'http://localhost/dashboard', '2021-12-01 20:23:17'),
(597, '::1', 'http://localhost/favicon.ico', '2021-12-01 20:23:17'),
(598, '::1', 'http://localhost/site.webmanifest', '2021-12-01 20:23:17'),
(599, '::1', 'http://localhost/dashboard', '2021-12-01 20:23:18'),
(600, '::1', 'http://localhost/favicon.ico', '2021-12-01 20:23:18'),
(601, '::1', 'http://localhost/site.webmanifest', '2021-12-01 20:23:18'),
(602, '::1', 'http://localhost/dashboard', '2021-12-01 20:23:19'),
(603, '::1', 'http://localhost/favicon.ico', '2021-12-01 20:23:20'),
(604, '::1', 'http://localhost/site.webmanifest', '2021-12-01 20:23:20'),
(605, '::1', 'http://localhost/dashboard', '2021-12-01 20:24:08'),
(606, '::1', 'http://localhost/favicon.ico', '2021-12-01 20:24:09'),
(607, '::1', 'http://localhost/home', '2021-12-01 20:24:11'),
(608, '::1', 'http://localhost/favicon.ico', '2021-12-01 20:24:12'),
(609, '::1', 'http://localhost/site.webmanifest', '2021-12-01 20:24:12'),
(610, '::1', 'http://localhost/dashboard', '2021-12-01 20:24:17'),
(611, '::1', 'http://localhost/favicon.ico', '2021-12-01 20:24:18'),
(612, '::1', 'http://localhost/dashboard', '2021-12-01 20:24:25'),
(613, '::1', 'http://localhost/favicon.ico', '2021-12-01 20:24:25'),
(614, '::1', 'http://localhost/site.webmanifest', '2021-12-01 20:24:25'),
(615, '::1', 'http://localhost/dashboard', '2021-12-01 20:24:50'),
(616, '::1', 'http://localhost/favicon.ico', '2021-12-01 20:24:51'),
(617, '::1', 'http://localhost/site.webmanifest', '2021-12-01 20:24:51'),
(618, '::1', 'http://localhost/', '2021-12-01 20:24:56'),
(619, '::1', 'http://localhost/favicon.ico', '2021-12-01 20:24:57'),
(620, '::1', 'http://localhost/site.webmanifest', '2021-12-01 20:24:57'),
(621, '::1', 'http://localhost/dashboard', '2021-12-01 20:25:03'),
(622, '::1', 'http://localhost/favicon.ico', '2021-12-01 20:25:03'),
(623, '::1', 'http://localhost/site.webmanifest', '2021-12-01 20:25:03'),
(624, '::1', 'http://localhost/dashboard', '2021-12-01 20:25:16'),
(625, '::1', 'http://localhost/favicon.ico', '2021-12-01 20:25:17'),
(626, '::1', 'http://localhost/site.webmanifest', '2021-12-01 20:25:17'),
(627, '::1', 'http://localhost/', '2021-12-01 20:25:42'),
(628, '::1', 'http://localhost/favicon.ico', '2021-12-01 20:25:43'),
(629, '::1', 'http://localhost/site.webmanifest', '2021-12-01 20:25:43'),
(630, '::1', 'http://localhost/login', '2021-12-01 20:25:45'),
(631, '::1', 'http://localhost/favicon.ico', '2021-12-01 20:25:46'),
(632, '::1', 'http://localhost/site.webmanifest', '2021-12-01 20:25:46'),
(633, '::1', 'http://localhost/login', '2021-12-01 20:25:55'),
(634, '::1', 'http://localhost/dashboard', '2021-12-01 20:25:56'),
(635, '::1', 'http://localhost/favicon.ico', '2021-12-01 20:25:56'),
(636, '::1', 'http://localhost/', '2021-12-01 20:26:28'),
(637, '::1', 'http://localhost/', '2021-12-01 20:26:29'),
(638, '::1', 'http://localhost/favicon.ico', '2021-12-01 20:26:30'),
(639, '::1', 'http://localhost/site.webmanifest', '2021-12-01 20:26:30'),
(640, '::1', 'http://localhost/', '2021-12-01 20:28:37'),
(641, '::1', 'http://localhost/site.webmanifest', '2021-12-01 20:28:38'),
(642, '::1', 'http://localhost/favicon.ico', '2021-12-01 20:28:38'),
(643, '::1', 'http://localhost/news/show/17', '2021-12-01 20:28:44'),
(644, '::1', 'http://localhost/favicon.ico', '2021-12-01 20:28:44'),
(645, '::1', 'http://localhost/news/show/site.webmanifest', '2021-12-01 20:28:44'),
(646, '::1', 'http://localhost/home', '2021-12-01 20:29:14'),
(647, '::1', 'http://localhost/favicon.ico', '2021-12-01 20:29:14'),
(648, '::1', 'http://localhost/site.webmanifest', '2021-12-01 20:29:14'),
(649, '127.0.0.1', 'http://localhost/', '2021-12-01 20:31:15'),
(650, '127.0.0.1', 'http://localhost/logout', '2021-12-01 20:31:52'),
(651, '127.0.0.1', 'http://localhost/home', '2021-12-01 20:31:52'),
(652, '127.0.0.1', 'http://localhost/dashboard', '2021-12-01 20:31:59'),
(653, '127.0.0.1', 'http://localhost/home', '2021-12-01 20:32:34'),
(654, '127.0.0.1', 'http://localhost/login', '2021-12-01 20:32:39'),
(655, '127.0.0.1', 'http://localhost/login', '2021-12-01 20:33:07'),
(656, '127.0.0.1', 'http://localhost/dashboard', '2021-12-01 20:33:07'),
(657, '127.0.0.1', 'http://localhost/', '2021-12-01 20:33:18'),
(658, '::1', 'http://localhost/', '2021-12-01 21:05:39'),
(659, '::1', 'http://localhost/favicon.ico', '2021-12-01 21:05:40'),
(660, '::1', 'http://localhost/site.webmanifest', '2021-12-01 21:05:40'),
(661, '::1', 'http://localhost/news/show/13', '2021-12-01 21:06:59'),
(662, '::1', 'http://localhost/favicon.ico', '2021-12-01 21:07:00'),
(663, '::1', 'http://localhost/news/show/site.webmanifest', '2021-12-01 21:07:00'),
(664, '::1', 'http://localhost/home', '2021-12-02 16:18:02'),
(665, '::1', 'http://localhost/favicon.ico', '2021-12-02 16:18:04'),
(666, '::1', 'http://localhost/site.webmanifest', '2021-12-02 16:18:04'),
(667, '10.30.150.89', 'http://10.30.150.89/', '2021-12-03 15:56:10'),
(668, '192.168.56.1', 'http://192.168.56.1/', '2021-12-03 15:56:10'),
(669, '::1', 'http://localhost/', '2021-12-08 04:21:53'),
(670, '::1', 'http://localhost/favicon.ico', '2021-12-08 04:21:54'),
(671, '::1', 'http://localhost/site.webmanifest', '2021-12-08 04:21:54'),
(672, '::1', 'http://localhost/categories/show/14/1', '2021-12-08 04:22:08'),
(673, '::1', 'http://localhost/favicon.ico', '2021-12-08 04:22:08'),
(674, '::1', 'http://localhost/categories/show/14/site.webmanifest', '2021-12-08 04:22:08'),
(675, '::1', 'http://localhost/news/index/1', '2021-12-08 04:22:25'),
(676, '::1', 'http://localhost/favicon.ico', '2021-12-08 04:22:25'),
(677, '::1', 'http://localhost/news/index/site.webmanifest', '2021-12-08 04:22:25'),
(678, '::1', 'http://localhost/categories/show/14/1', '2021-12-08 04:22:37'),
(679, '::1', 'http://localhost/favicon.ico', '2021-12-08 04:22:38'),
(680, '::1', 'http://localhost/categories/show/14/site.webmanifest', '2021-12-08 04:22:38'),
(681, '::1', 'http://localhost/news/index/1', '2021-12-08 04:22:50'),
(682, '::1', 'http://localhost/favicon.ico', '2021-12-08 04:22:51'),
(683, '::1', 'http://localhost/news/index/site.webmanifest', '2021-12-08 04:22:51'),
(684, '::1', 'http://localhost/news/index/site.webmanifest', '2021-12-08 04:23:58'),
(685, '::1', 'http://localhost/assets/js/popper.min.js.map', '2021-12-08 04:23:58'),
(686, '::1', 'http://localhost/assets/js/bootstrap.min.js.map', '2021-12-08 04:23:58'),
(687, '::1', 'http://localhost/assets/css/bootstrap.min.css.map', '2021-12-08 04:23:58'),
(688, '::1', 'http://localhost/assets/css/style.css.map', '2021-12-08 04:23:58'),
(689, '::1', 'http://localhost/categories/show/16/1', '2021-12-08 04:24:52'),
(690, '::1', 'http://localhost/favicon.ico', '2021-12-08 04:24:53'),
(691, '::1', 'http://localhost/categories/show/16/site.webmanifest', '2021-12-08 04:24:53'),
(692, '::1', 'http://localhost/home', '2021-12-08 04:24:59'),
(693, '::1', 'http://localhost/favicon.ico', '2021-12-08 04:25:00'),
(694, '::1', 'http://localhost/site.webmanifest', '2021-12-08 04:25:00');
INSERT INTO `statistics` (`id`, `ip`, `uri`, `created_at`) VALUES
(695, '::1', 'http://localhost/news/index/1', '2021-12-08 04:25:30'),
(696, '::1', 'http://localhost/favicon.ico', '2021-12-08 04:25:30'),
(697, '::1', 'http://localhost/news/index/site.webmanifest', '2021-12-08 04:25:30'),
(698, '::1', 'http://localhost/news/index/1', '2021-12-08 04:26:19'),
(699, '::1', 'http://localhost/favicon.ico', '2021-12-08 04:26:19'),
(700, '::1', 'http://localhost/news/index/site.webmanifest', '2021-12-08 04:26:19'),
(701, '::1', 'http://localhost/news/index/1', '2021-12-08 04:26:22'),
(702, '::1', 'http://localhost/favicon.ico', '2021-12-08 04:26:22'),
(703, '::1', 'http://localhost/news/index/site.webmanifest', '2021-12-08 04:26:22'),
(704, '::1', 'http://localhost/news/index/1', '2021-12-08 04:26:26'),
(705, '::1', 'http://localhost/news/index/site.webmanifest', '2021-12-08 04:26:28'),
(706, '::1', 'http://localhost/favicon.ico', '2021-12-08 04:26:28'),
(707, '::1', 'http://localhost/news/index/2', '2021-12-08 04:27:35'),
(708, '::1', 'http://localhost/favicon.ico', '2021-12-08 04:27:36'),
(709, '::1', 'http://localhost/news/index/site.webmanifest', '2021-12-08 04:27:36'),
(710, '::1', 'http://localhost/news/index/3', '2021-12-08 04:27:41'),
(711, '::1', 'http://localhost/favicon.ico', '2021-12-08 04:27:41'),
(712, '::1', 'http://localhost/news/index/site.webmanifest', '2021-12-08 04:27:41'),
(713, '::1', 'http://localhost/news/index/2', '2021-12-08 04:27:47'),
(714, '::1', 'http://localhost/favicon.ico', '2021-12-08 04:27:47'),
(715, '::1', 'http://localhost/news/index/site.webmanifest', '2021-12-08 04:27:47'),
(716, '::1', 'http://localhost/news/index/1', '2021-12-08 04:27:50'),
(717, '::1', 'http://localhost/favicon.ico', '2021-12-08 04:27:50'),
(718, '::1', 'http://localhost/news/index/site.webmanifest', '2021-12-08 04:27:50'),
(719, '::1', 'http://localhost/news/index/site.webmanifest', '2021-12-08 04:28:01'),
(720, '::1', 'http://localhost/assets/js/popper.min.js.map', '2021-12-08 04:28:01'),
(721, '::1', 'http://localhost/assets/js/bootstrap.min.js.map', '2021-12-08 04:28:01'),
(722, '::1', 'http://localhost/assets/css/style.css.map', '2021-12-08 04:28:01'),
(723, '::1', 'http://localhost/assets/css/bootstrap.min.css.map', '2021-12-08 04:28:01'),
(724, '::1', 'http://localhost/assets/css/style.css.map', '2021-12-08 04:29:43'),
(725, '::1', 'http://localhost/assets/css/bootstrap.min.css.map', '2021-12-08 04:29:43'),
(726, '::1', 'http://localhost/assets/js/popper.min.js.map', '2021-12-08 04:29:43'),
(727, '::1', 'http://localhost/assets/js/bootstrap.min.js.map', '2021-12-08 04:29:43'),
(728, '::1', 'http://localhost/news/index/2', '2021-12-08 04:30:54'),
(729, '::1', 'http://localhost/assets/css/style.css.map', '2021-12-08 04:30:54'),
(730, '::1', 'http://localhost/assets/css/bootstrap.min.css.map', '2021-12-08 04:30:54'),
(731, '::1', 'http://localhost/assets/js/bootstrap.min.js.map', '2021-12-08 04:30:54'),
(732, '::1', 'http://localhost/assets/js/popper.min.js.map', '2021-12-08 04:30:54'),
(733, '::1', 'http://localhost/favicon.ico', '2021-12-08 04:30:55'),
(734, '::1', 'http://localhost/news/index/site.webmanifest', '2021-12-08 04:30:55'),
(735, '::1', 'http://localhost/news/index/2', '2021-12-08 04:32:07'),
(736, '::1', 'http://localhost/favicon.ico', '2021-12-08 04:32:07'),
(737, '::1', 'http://localhost/news/index/site.webmanifest', '2021-12-08 04:32:07'),
(738, '::1', 'http://localhost/categories/show/16/1', '2021-12-08 04:32:47'),
(739, '::1', 'http://localhost/favicon.ico', '2021-12-08 04:32:48'),
(740, '::1', 'http://localhost/categories/show/16/site.webmanifest', '2021-12-08 04:32:48'),
(741, '::1', 'http://localhost/categories/show/22/1', '2021-12-08 04:32:52'),
(742, '::1', 'http://localhost/favicon.ico', '2021-12-08 04:32:53'),
(743, '::1', 'http://localhost/categories/show/22/site.webmanifest', '2021-12-08 04:32:53'),
(744, '::1', 'http://localhost/home', '2021-12-08 04:32:57'),
(745, '::1', 'http://localhost/favicon.ico', '2021-12-08 04:32:57'),
(746, '::1', 'http://localhost/site.webmanifest', '2021-12-08 04:32:57'),
(747, '::1', 'http://localhost/home', '2021-12-08 04:34:38'),
(748, '::1', 'http://localhost/favicon.ico', '2021-12-08 04:34:38'),
(749, '::1', 'http://localhost/site.webmanifest', '2021-12-08 04:34:38'),
(750, '::1', 'http://localhost/home', '2021-12-08 04:34:47'),
(751, '::1', 'http://localhost/favicon.ico', '2021-12-08 04:34:47'),
(752, '::1', 'http://localhost/site.webmanifest', '2021-12-08 04:34:47'),
(753, '::1', 'http://localhost/news/index/1', '2021-12-08 04:34:50'),
(754, '::1', 'http://localhost/favicon.ico', '2021-12-08 04:34:51'),
(755, '::1', 'http://localhost/news/index/site.webmanifest', '2021-12-08 04:34:51'),
(756, '::1', 'http://localhost/news/index/1', '2021-12-08 04:34:56'),
(757, '::1', 'http://localhost/news/index/1', '2021-12-08 04:34:56'),
(758, '::1', 'http://localhost/assets/trending/style.css', '2021-12-08 04:34:56'),
(759, '::1', 'http://localhost/favicon.ico', '2021-12-08 04:34:57'),
(760, '::1', 'http://localhost/news/index/site.webmanifest', '2021-12-08 04:34:57'),
(761, '::1', 'http://localhost/home', '2021-12-08 04:35:03'),
(762, '::1', 'http://localhost/assets/trending/style.css', '2021-12-08 04:35:03'),
(763, '::1', 'http://localhost/favicon.ico', '2021-12-08 04:35:04'),
(764, '::1', 'http://localhost/site.webmanifest', '2021-12-08 04:35:04'),
(765, '::1', 'http://localhost/home', '2021-12-08 04:43:44'),
(766, '::1', 'http://localhost/assets/trending/style.css', '2021-12-08 04:43:44'),
(767, '::1', 'http://localhost/favicon.ico', '2021-12-08 04:43:45'),
(768, '::1', 'http://localhost/site.webmanifest', '2021-12-08 04:43:45'),
(769, '::1', 'http://localhost/home', '2021-12-08 04:43:46'),
(770, '::1', 'http://localhost/assets/trending/style.css', '2021-12-08 04:43:46'),
(771, '::1', 'http://localhost/site.webmanifest', '2021-12-08 04:43:48'),
(772, '::1', 'http://localhost/favicon.ico', '2021-12-08 04:43:48'),
(773, '::1', 'http://localhost/news/index/1', '2021-12-08 04:43:54'),
(774, '::1', 'http://localhost/assets/trending/style.css', '2021-12-08 04:43:54'),
(775, '::1', 'http://localhost/favicon.ico', '2021-12-08 04:43:54'),
(776, '::1', 'http://localhost/news/index/site.webmanifest', '2021-12-08 04:43:54'),
(777, '::1', 'http://localhost/home', '2021-12-08 04:44:05'),
(778, '::1', 'http://localhost/assets/trending/style.css', '2021-12-08 04:44:05'),
(779, '::1', 'http://localhost/favicon.ico', '2021-12-08 04:44:05'),
(780, '::1', 'http://localhost/site.webmanifest', '2021-12-08 04:44:05'),
(781, '::1', 'http://localhost/home', '2021-12-08 04:53:24'),
(782, '::1', 'http://localhost/favicon.ico', '2021-12-08 04:53:26'),
(783, '::1', 'http://localhost/site.webmanifest', '2021-12-08 04:53:26'),
(784, '::1', 'http://localhost/news/index/1', '2021-12-08 04:53:49'),
(785, '::1', 'http://localhost/favicon.ico', '2021-12-08 04:53:50'),
(786, '::1', 'http://localhost/news/index/site.webmanifest', '2021-12-08 04:53:50'),
(787, '::1', 'http://localhost/news/index/site.webmanifest', '2021-12-08 04:53:59'),
(788, '::1', 'http://localhost/assets/js/popper.min.js.map', '2021-12-08 04:53:59'),
(789, '::1', 'http://localhost/assets/js/bootstrap.min.js.map', '2021-12-08 04:53:59'),
(790, '::1', 'http://localhost/assets/css/bootstrap.min.css.map', '2021-12-08 04:53:59'),
(791, '::1', 'http://localhost/assets/css/style.css.map', '2021-12-08 04:53:59'),
(792, '::1', 'http://localhost/news/index/1', '2021-12-08 04:56:16'),
(793, '::1', 'http://localhost/assets/css/bootstrap.min.css.map', '2021-12-08 04:56:16'),
(794, '::1', 'http://localhost/assets/css/style.css.map', '2021-12-08 04:56:16'),
(795, '::1', 'http://localhost/assets/js/popper.min.js.map', '2021-12-08 04:56:16'),
(796, '::1', 'http://localhost/assets/js/bootstrap.min.js.map', '2021-12-08 04:56:16'),
(797, '::1', 'http://localhost/favicon.ico', '2021-12-08 04:56:16'),
(798, '::1', 'http://localhost/news/index/site.webmanifest', '2021-12-08 04:56:17'),
(799, '::1', 'http://localhost/home', '2021-12-08 15:08:15'),
(800, '::1', 'http://localhost/favicon.ico', '2021-12-08 15:08:17'),
(801, '::1', 'http://localhost/site.webmanifest', '2021-12-08 15:08:17'),
(802, '::1', 'http://localhost/site.webmanifest', '2021-12-08 15:08:25'),
(803, '::1', 'http://localhost/assets/js/popper.min.js.map', '2021-12-08 15:08:25'),
(804, '::1', 'http://localhost/assets/js/bootstrap.min.js.map', '2021-12-08 15:08:25'),
(805, '::1', 'http://localhost/assets/css/bootstrap.min.css.map', '2021-12-08 15:08:25'),
(806, '::1', 'http://localhost/assets/css/style.css.map', '2021-12-08 15:08:25'),
(807, '::1', 'http://localhost/assets/css/bootstrap.min.css.map', '2021-12-08 15:10:11'),
(808, '::1', 'http://localhost/assets/css/style.css.map', '2021-12-08 15:10:11'),
(809, '::1', 'http://localhost/assets/js/popper.min.js.map', '2021-12-08 15:10:11'),
(810, '::1', 'http://localhost/assets/js/bootstrap.min.js.map', '2021-12-08 15:10:11'),
(811, '::1', 'http://localhost/news/show/17', '2021-12-08 15:10:28'),
(812, '::1', 'http://localhost/news/show/site.webmanifest', '2021-12-08 15:10:29'),
(813, '::1', 'http://localhost/favicon.ico', '2021-12-08 15:10:29'),
(814, '::1', 'http://localhost/home', '2021-12-08 15:11:49'),
(815, '::1', 'http://localhost/assets/css/bootstrap.min.css.map', '2021-12-08 15:11:49'),
(816, '::1', 'http://localhost/assets/css/style.css.map', '2021-12-08 15:11:50'),
(817, '::1', 'http://localhost/assets/js/popper.min.js.map', '2021-12-08 15:11:50'),
(818, '::1', 'http://localhost/assets/js/bootstrap.min.js.map', '2021-12-08 15:11:50'),
(819, '::1', 'http://localhost/favicon.ico', '2021-12-08 15:11:51'),
(820, '::1', 'http://localhost/site.webmanifest', '2021-12-08 15:11:52'),
(821, '::1', 'http://localhost/home', '2021-12-08 15:13:05'),
(822, '::1', 'http://localhost/favicon.ico', '2021-12-08 15:13:06'),
(823, '::1', 'http://localhost/site.webmanifest', '2021-12-08 15:13:06'),
(824, '::1', 'http://localhost/home', '2021-12-08 15:13:22'),
(825, '::1', 'http://localhost/favicon.ico', '2021-12-08 15:13:23'),
(826, '::1', 'http://localhost/site.webmanifest', '2021-12-08 15:13:23'),
(827, '::1', 'http://localhost/site.webmanifest', '2021-12-08 15:14:24'),
(828, '::1', 'http://localhost/assets/js/popper.min.js.map', '2021-12-08 15:14:25'),
(829, '::1', 'http://localhost/assets/js/bootstrap.min.js.map', '2021-12-08 15:14:25'),
(830, '::1', 'http://localhost/assets/css/bootstrap.min.css.map', '2021-12-08 15:14:25'),
(831, '::1', 'http://localhost/assets/css/style.css.map', '2021-12-08 15:14:25'),
(832, '::1', 'http://localhost/home', '2021-12-08 15:22:47'),
(833, '::1', 'http://localhost/favicon.ico', '2021-12-08 15:22:47'),
(834, '::1', 'http://localhost/site.webmanifest', '2021-12-08 15:22:47'),
(835, '::1', 'http://localhost/news/index/1', '2021-12-08 15:22:51'),
(836, '::1', 'http://localhost/favicon.ico', '2021-12-08 15:22:52'),
(837, '::1', 'http://localhost/news/index/site.webmanifest', '2021-12-08 15:22:52'),
(838, '::1', 'http://localhost/news/index/1', '2021-12-08 15:22:58'),
(839, '::1', 'http://localhost/favicon.ico', '2021-12-08 15:22:58'),
(840, '::1', 'http://localhost/news/index/site.webmanifest', '2021-12-08 15:22:58'),
(841, '::1', 'http://localhost/home', '2021-12-08 15:23:02'),
(842, '::1', 'http://localhost/favicon.ico', '2021-12-08 15:23:03'),
(843, '::1', 'http://localhost/site.webmanifest', '2021-12-08 15:23:03'),
(844, '::1', 'http://localhost/home', '2021-12-08 15:23:50'),
(845, '::1', 'http://localhost/favicon.ico', '2021-12-08 15:23:52'),
(846, '::1', 'http://localhost/site.webmanifest', '2021-12-08 15:23:52'),
(847, '::1', 'http://localhost/news/index/1', '2021-12-08 15:23:59'),
(848, '::1', 'http://localhost/favicon.ico', '2021-12-08 15:23:59'),
(849, '::1', 'http://localhost/news/index/site.webmanifest', '2021-12-08 15:23:59'),
(850, '::1', 'http://localhost/home', '2021-12-08 15:24:06'),
(851, '::1', 'http://localhost/favicon.ico', '2021-12-08 15:24:07'),
(852, '::1', 'http://localhost/site.webmanifest', '2021-12-08 15:24:07'),
(853, '::1', 'http://localhost/home', '2021-12-08 15:24:48'),
(854, '::1', 'http://localhost/favicon.ico', '2021-12-08 15:24:49'),
(855, '::1', 'http://localhost/site.webmanifest', '2021-12-08 15:24:49'),
(856, '::1', 'http://localhost/news/index/1', '2021-12-08 15:25:05'),
(857, '::1', 'http://localhost/favicon.ico', '2021-12-08 15:25:05'),
(858, '::1', 'http://localhost/news/index/site.webmanifest', '2021-12-08 15:25:05'),
(859, '::1', 'http://localhost/home', '2021-12-08 15:26:23'),
(860, '::1', 'http://localhost/favicon.ico', '2021-12-08 15:26:24'),
(861, '::1', 'http://localhost/site.webmanifest', '2021-12-08 15:26:24'),
(862, '::1', 'http://localhost/home', '2021-12-08 15:26:26'),
(863, '::1', 'http://localhost/site.webmanifest', '2021-12-08 15:26:27'),
(864, '::1', 'http://localhost/favicon.ico', '2021-12-08 15:26:27'),
(865, '::1', 'http://localhost/site.webmanifest', '2021-12-08 15:26:41'),
(866, '::1', 'http://localhost/assets/js/popper.min.js.map', '2021-12-08 15:26:42'),
(867, '::1', 'http://localhost/assets/js/bootstrap.min.js.map', '2021-12-08 15:26:42'),
(868, '::1', 'http://localhost/assets/css/bootstrap.min.css.map', '2021-12-08 15:26:42'),
(869, '::1', 'http://localhost/assets/css/style.css.map', '2021-12-08 15:26:42'),
(870, '::1', 'http://localhost/home', '2021-12-08 15:28:07'),
(871, '::1', 'http://localhost/assets/css/bootstrap.min.css.map', '2021-12-08 15:28:08'),
(872, '::1', 'http://localhost/assets/css/style.css.map', '2021-12-08 15:28:08'),
(873, '::1', 'http://localhost/assets/js/popper.min.js.map', '2021-12-08 15:28:08'),
(874, '::1', 'http://localhost/assets/js/bootstrap.min.js.map', '2021-12-08 15:28:08'),
(875, '::1', 'http://localhost/favicon.ico', '2021-12-08 15:28:09'),
(876, '::1', 'http://localhost/site.webmanifest', '2021-12-08 15:28:09'),
(877, '::1', 'http://localhost/home', '2021-12-08 15:28:53'),
(878, '::1', 'http://localhost/assets/css/bootstrap.min.css.map', '2021-12-08 15:28:53'),
(879, '::1', 'http://localhost/assets/js/bootstrap.min.js.map', '2021-12-08 15:28:54'),
(880, '::1', 'http://localhost/assets/js/popper.min.js.map', '2021-12-08 15:28:54'),
(881, '::1', 'http://localhost/assets/css/style.css.map', '2021-12-08 15:28:54'),
(882, '::1', 'http://localhost/favicon.ico', '2021-12-08 15:28:56'),
(883, '::1', 'http://localhost/site.webmanifest', '2021-12-08 15:28:56'),
(884, '::1', 'http://localhost/news/show/17', '2021-12-08 15:29:47'),
(885, '::1', 'http://localhost/favicon.ico', '2021-12-08 15:29:48'),
(886, '::1', 'http://localhost/news/show/site.webmanifest', '2021-12-08 15:29:48'),
(887, '::1', 'http://localhost/news/index/1', '2021-12-08 15:29:52'),
(888, '::1', 'http://localhost/assets/css/bootstrap.min.css.map', '2021-12-08 15:29:53'),
(889, '::1', 'http://localhost/assets/js/popper.min.js.map', '2021-12-08 15:29:54'),
(890, '::1', 'http://localhost/assets/js/bootstrap.min.js.map', '2021-12-08 15:29:54'),
(891, '::1', 'http://localhost/assets/css/style.css.map', '2021-12-08 15:29:54'),
(892, '::1', 'http://localhost/favicon.ico', '2021-12-08 15:29:54'),
(893, '::1', 'http://localhost/news/index/site.webmanifest', '2021-12-08 15:29:55'),
(894, '::1', 'http://localhost/news/index/2', '2021-12-08 15:30:02'),
(895, '::1', 'http://localhost/news/index/site.webmanifest', '2021-12-08 15:30:02'),
(896, '::1', 'http://localhost/favicon.ico', '2021-12-08 15:30:02'),
(897, '::1', 'http://localhost/news/index/1', '2021-12-08 15:30:05'),
(898, '::1', 'http://localhost/favicon.ico', '2021-12-08 15:30:06'),
(899, '::1', 'http://localhost/news/index/site.webmanifest', '2021-12-08 15:30:06'),
(900, '::1', 'http://localhost/home', '2021-12-08 15:30:08'),
(901, '::1', 'http://localhost/site.webmanifest', '2021-12-08 15:30:09'),
(902, '::1', 'http://localhost/favicon.ico', '2021-12-08 15:30:09'),
(903, '::1', 'http://localhost/home', '2021-12-08 15:40:59'),
(904, '::1', 'http://localhost/favicon.ico', '2021-12-08 15:41:00'),
(905, '::1', 'http://localhost/site.webmanifest', '2021-12-08 15:41:00'),
(906, '::1', 'http://localhost/news/index/1', '2021-12-08 15:41:09'),
(907, '::1', 'http://localhost/favicon.ico', '2021-12-08 15:41:09'),
(908, '::1', 'http://localhost/news/index/site.webmanifest', '2021-12-08 15:41:09'),
(909, '::1', 'http://localhost/login', '2021-12-08 15:41:42'),
(910, '::1', 'http://localhost/favicon.ico', '2021-12-08 15:41:42'),
(911, '::1', 'http://localhost/site.webmanifest', '2021-12-08 15:41:42'),
(912, '::1', 'http://localhost/dashboard', '2021-12-08 15:41:47'),
(913, '::1', 'http://localhost/dashboard', '2021-12-08 15:41:49'),
(914, '::1', 'http://localhost/favicon.ico', '2021-12-08 15:41:50'),
(915, '::1', 'http://localhost/site.webmanifest', '2021-12-08 15:41:50'),
(916, '::1', 'http://localhost/', '2021-12-08 15:41:58'),
(917, '::1', 'http://localhost/', '2021-12-08 15:41:58'),
(918, '::1', 'http://localhost/favicon.ico', '2021-12-08 15:41:59'),
(919, '::1', 'http://localhost/site.webmanifest', '2021-12-08 15:41:59'),
(920, '::1', 'http://localhost/login', '2021-12-08 15:42:01'),
(921, '::1', 'http://localhost/favicon.ico', '2021-12-08 15:42:01'),
(922, '::1', 'http://localhost/site.webmanifest', '2021-12-08 15:42:01'),
(923, '::1', 'http://localhost/login', '2021-12-08 15:42:09'),
(924, '::1', 'http://localhost/dashboard', '2021-12-08 15:42:09'),
(925, '::1', 'http://localhost/favicon.ico', '2021-12-08 15:42:10'),
(926, '::1', 'http://localhost/banners/index', '2021-12-08 15:42:29'),
(927, '::1', 'http://localhost/favicon.ico', '2021-12-08 15:42:30'),
(928, '::1', 'http://localhost/news/list', '2021-12-08 15:42:34'),
(929, '::1', 'http://localhost/favicon.ico', '2021-12-08 15:42:35'),
(930, '::1', 'http://localhost/', '2021-12-08 15:42:51'),
(931, '::1', 'http://localhost/favicon.ico', '2021-12-08 15:42:51'),
(932, '::1', 'http://localhost/site.webmanifest', '2021-12-08 15:42:51'),
(933, '::1', 'http://localhost/', '2021-12-08 15:55:24'),
(934, '::1', 'http://localhost/favicon.ico', '2021-12-08 15:55:25'),
(935, '::1', 'http://localhost/site.webmanifest', '2021-12-08 15:55:25'),
(936, '::1', 'http://localhost/', '2021-12-08 15:56:14');

-- --------------------------------------------------------

--
-- Table structure for table `subscribes`
--

CREATE TABLE `subscribes` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscribes`
--

INSERT INTO `subscribes` (`id`, `email`, `created_at`, `updated_at`) VALUES
(13, 'shahab@gmail.com', '2021-11-12 21:04:26', NULL),
(14, 'john@gmail.com', '2021-11-12 21:04:59', '2021-11-26 16:43:37'),
(15, 'Ali@gmail.com', '2021-11-12 21:06:17', NULL),
(18, 'admin@gmail.com', '2021-11-12 21:09:34', NULL),
(24, 'hellobye@yahoo.com', '2021-11-18 21:25:03', NULL),
(25, 'Alissss@gmail.com', '2021-11-18 21:50:14', NULL),
(26, 'buazar@gmail.com', '2021-11-19 20:56:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `firstName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstName`, `lastName`, `email`, `password`, `admin`, `created_at`, `updated_at`) VALUES
(6, 'shahab', 'hesaraki', 'shahab@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 1, '2021-11-04 19:49:48', NULL),
(21, 'ahamd', 'zoghi', 'zoghi@gmail.com', 'Ahmad@123456', 0, '2021-11-10 16:53:58', NULL),
(22, 'jafar', 'panahi', 'jafar@gmail.com', 'Jafar@123456', 0, '2021-11-10 16:56:38', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `news_id` (`news_id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `statistics`
--
ALTER TABLE `statistics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribes`
--
ALTER TABLE `subscribes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `statistics`
--
ALTER TABLE `statistics`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=937;

--
-- AUTO_INCREMENT for table `subscribes`
--
ALTER TABLE `subscribes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `banners`
--
ALTER TABLE `banners`
  ADD CONSTRAINT `banners_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`news_id`) REFERENCES `news` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
