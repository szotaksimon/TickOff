-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 19, 2022 at 09:04 PM
-- Server version: 8.0.28
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `salamonb_python-login`
--
CREATE DATABASE IF NOT EXISTS `project` DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
USE `project`;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int NOT NULL,
  `category` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `category`) VALUES
(1, 'Tanulás'),
(2, 'Munka'),
(3, 'Bevásárlás'),
(4, 'Család'),
(5, 'Számlák');

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE `session` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `token_hash` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- Dumping data for table `session`
--

INSERT INTO `session` (`id`, `user_id`, `token_hash`) VALUES
(98, 31, 'd8ffa4b4d1e8bff68f2de760737e5b513eaf372683e5c14166acecfb85bf485f'),
(99, 31, '40142b913cc79f2009b08fb44e67e6a4b1b87a09388d84772bb51efc54976362'),
(100, 31, 'c3ff2c1e6299ca9fa524e6986df0c05af8a215c4ed616fc131e63da5ac785b41'),
(101, 31, 'f9c399f14ff94ee2cd080e124b34ad8ea5dcb76af839819fbf9fa692cd99acca'),
(102, 31, 'c601a8b8d4d9d87ee01605a53976323c2f04baf919e017c4e1edd3270b4d03bd'),
(103, 31, 'dd4c5a55e219476be0a499f16cba95a147431530d3d15d193afaf92718c611fa'),
(104, 31, 'a58751aa4f08ebadc4705edc1956f73930abd9af4033a42f0d38563ddc95806e'),
(106, 31, '4d0e50a3359267e8530b6168eba3ca36575a7bfc879b689602bee69d5f997a62'),
(107, 31, 'ad92ff407dd9f601fa088bcaea0843a25944b6a1a3f5813d1fbfa4ad05be0e75'),
(108, 31, '84b6f264cd9351851ad9178a59e87d6f57f3ae7bb66bf1359fe890eefd8b1d2a'),
(109, 31, '6707bb98160c629456d5e3a89af678f5d2c2ecb5ff6b7e9ed89838393fa98867'),
(111, 31, '8194e7e61ab2f69c8e17734009e717718a1919d1a11603df1080ef352bfb6e02'),
(113, 31, '05adaa18abecf01489c2f4bffab8a296ebae56a83106a43846fcb8ff54c33c52'),
(114, 31, '1db5121dd37c1fa04ee7765e8ee53e6a469b01ab6d1578b7bb2efd23b0156325'),
(116, 31, 'eeb7e66b77dc938ef5d55321abb7d39026d71f0adb58079734447adfc1736445'),
(118, 31, 'd318d65a123ef6e4aee4216001a00c6513169c41a25e404915c4d27e3d6f4557'),
(119, 31, 'f45427a8050e2c8c1247e21dd192e1f9212afa78ee4671dc64f8b0291ab8bdee'),
(120, 31, '166e45390efcda3b86ee351a6dfad98e3bfee1af8f6e4e52300ed5f51759ae36'),
(124, 31, '8cb43a549d09457bdbdd124c809b76a7cfbd3f1146a7acad30740ea6256db1fe'),
(125, 31, '3615f4c96e40556d7be46323a7e2dda7c38ade4ee9d272f18696dfcb44d7c0e7'),
(126, 31, '860ffc5dcf29369927b2244b3b8e37e57ed384222ee506f0b2efcfbf5555413d'),
(127, 31, 'f280f25794f0ce2209a03448fd7c03648e28c1c6014ee87f1058cc84ee9f4e8b'),
(128, 31, 'e433abb124a35a1bd2bc5af025cdc10c00af6a4ed87674e72a22e7b2938e1150'),
(129, 31, '28640ca4cbe7bed27e183c14f4ae387fdb5fd854a37af80b729d3100122cc8ee'),
(130, 31, 'b1a97a9bc0f729e42b7bf8745cd8e5a60da46b2c343cb2275a532c8045d5228a'),
(131, 31, '54a8fd13278a979503cf6027b6874078d8b700419470f99e19dba0f24fafaabe'),
(133, 77, '6b2beb2c268d8ee453f9eca1747580bebed06b07794413e6249c774d3a558091'),
(134, 31, '0e9aae1182ec1de12135dac5ea3ac7ee5cc65f92731372d2f56fb8883e1066be'),
(135, 31, '14cb96a9506aeaceca388bdc46bbeac180f46e293e65dd6b393f7a7a3c376b4d'),
(136, 31, '9c9aab48dbd44d072f7b385b8933a84e17ff687d2dc3716f5d53ca14c473d213'),
(137, 31, 'e8b662d72b2bdd0b6fe1a2fbd1b1e278ac1b10aaa170920a5cb62c17538577ea'),
(138, 31, '60db91a46186d290e8d9ee329c7e3c8989b492360a2aa56d24f3328f284fcf61'),
(139, 31, 'b4efad332399cb8cf00766e44068a568d67ece45903f225b9df63d605803cae1'),
(140, 31, '57149168523ee55656ab244deaa858a25ec4ec9f51d06b91ee93d95ca3c7c70b'),
(143, 74, 'bb5a7fa7b0137d0bb2df89039f4a252d5c88ee3395ea5a3e570be8abbb889949'),
(144, 74, '410f406ea56b81e3b8e2cde8a35db010846b8f629c48bf7cdf24044e8fe004d7'),
(146, 74, '6d9270c35ac7669e618e36dab9d7cfd17a08ad88a9aaa81fe7896912ca3f8166'),
(157, 74, '4affab70b15d753ea2a8987f2a17b8e398d1953e8feb456e349efc1fa6dbc5e9'),
(159, 74, '3e0110e97b78c4255e7d485a7cf443a799faf3ad342d600b7a235626f84e47d6'),
(161, 74, '356244d98bbabaf124c60af267395c8a80d209344eadf3062ae0b7a3c29e900b'),
(162, 74, '65ce2dbdfa9af1e0cb21297246ab8d7dec165ee520139ca0a7a506807d049656'),
(164, 74, 'e3137947a0dd3569f00c1c96afdd5ed3541344340d366c80ee8f7746419443dc'),
(165, 74, '14840b17a29645e452c526b270ed5fc32345a321a5806795c488decdff515c7d'),
(172, 74, 'b3d1df1ba5a3b99dc8a6d1942d45e307764fe077081b7a184142ac542908963c'),
(175, 74, '6bd11cb739605cf25d474693ad2d0f12287d303d2c0d4836e3e76a164fab6979'),
(176, 74, 'f30bd0d37f8907a23304e8a0974d15588c5af5214b9984146acb99aeee73a806'),
(177, 74, '19e46730fc665c8f9c451b138cb7d5f5f3e8a1c50f44450cee367ef862faf37f'),
(178, 74, 'b7060b0827427bd92d7f73816d67c7d3fa5586c38eeda005dd32cea5dbe17292'),
(179, 74, '4d27fcd4e2bd63bdac7d9e3a7716292e1e4c70b2b9fdb1ce90731aec041fa4fc'),
(180, 74, 'd76cae2c679d588bdf6c0b4ff280cc9535ca54cb249094e432a01f93574822aa'),
(181, 74, 'd4f5aa6eaf6bfbf3a0ed6a8a30e9daf6313d8d8d31b17857e4e3b10f2def8f0c'),
(182, 74, 'b76c8e43a9a7bc35aa128e0057212c97ef1a7c5e4d07bb03a26e1460101e34a7'),
(184, 74, 'be75ffd27b448f76d5240fab559bebcb7122588606a3d35562eab3b8df686a2a'),
(185, 74, 'c845125e550b5e4e51a22d575afc9e4a45add53ed5fa96038f4d983aec31c5c5'),
(186, 74, 'f3483f644d4d30e9cb7677f85ff8d99d5609b7ef2cbe1f5877f6f7c983c61fbc'),
(187, 74, '3b0b41bf651a70d616c5cbc9d987355f0e20bb06a7886f9088cb7cd7387ead4a'),
(190, 74, '4a6261c259d9341bd4f332791204f820246241d8974b4a9ec01fd18a077597b5'),
(197, 74, 'f8215a3ae738934c47b59e8868c092f1d5ba1caceee97861306ea987ff961c51'),
(201, 74, '479c3168beceb2f41a41144ec571ee2c7142ed9cd45257244bcd5298eb5775a3'),
(215, 74, 'b24a49367d2bb38cd542d0ddf371026b878d88f48a36e6d493563f77c0a7bb24'),
(220, 74, 'db15a959f86f407142190087b7bf5684322f9ee7b6dbe91a948c28d5c63486e4'),
(223, 74, '604ae364ab5c6b6fff9e0bbc75d793a26298eb531c3c16f4ade653741f0f496f'),
(225, 74, '4632920811395e750a0be3e7c971b3e1752b717312c7f73bda1b41f79256cf4d'),
(227, 74, '6f0958f1f83191d1b2b2334ea40fd2da3c06bc512a91c46e4c160a16bf17ac4b'),
(229, 74, 'a89fa5d8f0b7761736f2e2f6a71d65fc6ed7b9295c5f7b70cacfa7247931b8b6'),
(232, 74, '87aaab17488acb0342ba0bb137c78eeca7d1aa12c11e2ea0cecd68a9a69eb139'),
(233, 74, '6dfe03fadfe745f8cc56487fd08bd855dec0786fe6b511b8d33cc3244f3cfa8e'),
(234, 74, 'd3cfb74875af8045a166b64fccd5a8f57fd00f663f428e1e76d6a36c771885d0'),
(235, 74, '58a72faf26daa221dbdffc3c84b01ab6e5fac6391798fb7dc7422b78f4085bd5'),
(237, 74, 'e458b788dd766c086b2fc5911e5f85f8d3a8db643a91720f2205e7330b334232'),
(240, 74, 'dfce85ff2b3caac7ce7181638fbf0ff31e271f09ec0c0ef2ba0354834e41ff1a'),
(241, 74, 'dfb58cca27a2e5c191f86f408f8ae800eb81154adb9629d3234c11376ae8b68a'),
(247, 74, '8429c83b085c2a3ccae92c1a52da618c6bf727c11a9e05d6d54b34bd7ddc2270'),
(251, 74, 'eb745aa5c17bb2d78e607be406e777eeb9a7b13665d46015a849fab4a433deff'),
(252, 74, 'd8c27779e84f34f071ecdd99778186f0e3d6769f42604ccb9972611e5eba2b0a'),
(253, 74, 'db993e5d2be5ce78848d4f5071236b891a53a5cc0bd4b9d9b23afcb55937b5c6'),
(254, 74, '04fdfecbeab3443c38f87bcaa15dc986d1a4f1ab5390404eb2d52bb405fdf876'),
(256, 74, '640e18d42e7fe30f2c5a8887dbee0aabc02f534fe3f2aed0b66ac8cdd89604cc'),
(260, 74, '6b736e1e66ee9c44964293721a0007657234a99631a85a476a47b44048b041c7'),
(269, 31, '0827a751dd6c01d477cae39377ab970cc192746069b2e79dd8f50199ca229e48'),
(272, 31, '5078375769f44e402ceed3225de910ed185ffa1f7e9313efe228e1bd87bcf6dc'),
(282, 31, '267ecb4c21a752c1a5f11684525a515449bfc72e48ed763cd8ae177f144c1963'),
(283, 31, '6b60971437ec756f1eecb7da74562e5004b2bbe303630e4131b2968d42243889'),
(284, 74, '25745ac7f43a3dc05630431916d551e65df18f85e9b04e6ff5268ba45128ed97'),
(289, 74, 'ea263674e617727d9364fef853c6cb60541720955bc59c38dcd78ecac9bee123'),
(290, 74, 'add8c2df302f15814c375a9947a852d21cd29af10218f14cc6d53c62ff1b73de'),
(292, 74, 'dbfef7d856c0fe6d19cae747dae9b9efa669b8dae313c2dc6e4ad91aeb549603'),
(293, 74, '392c35004fdf67c13f45ab662dedc2751cd18eb5785ded477f340bf48a895094'),
(295, 74, '67859b8605d90d93ae69b379711a9fb0fc4277e7c24fbda84b16f8166da779b2'),
(303, 74, '9e0062729157fd30164badde46ee4a3617b354afda60669eb2d1df8116cc97c9'),
(312, 74, '33ce23befb6862d6af7a8950499297aa6f209055c7f1ecdc70b66dad682fedd8'),
(314, 31, '232110e0f82ff2ecade425d4ff07407c90936d71bd6dac988d45da3f05071a34'),
(317, 31, '79dbec7bc7a1a06097c24d29a624664df5ab2cf443f15fd8c3491f524112d373'),
(319, 31, '20c2de123816090b2fb8ec1e1b452ddea47442acdee9264ffcad082d29840420'),
(321, 31, '992bfa094f8fcf9cf690ee6120145acab41f4661283bf2b47bc4130c780e81fb'),
(322, 31, 'e99877e4e98e3485b44fb1b4f16ac3400a1e8ab72b3d07c0961cea22071a28c5'),
(323, 31, '6e80ab094319931fc8f14ba85d19d01e2776b9dd9626a185589fdad32b01adf4'),
(324, 31, 'fcf41d4efe0f8f80f40e37c59b571bbe1258293f064111f44546968c228eecb7'),
(325, 31, '1fd281e0b90ed15e55deb1c303ecd86972ab97ce66f999cbb9bceea6472bb3d7'),
(327, 31, '15069710c78b27a189b98fd3339ebf357abb6e63dee3ba1a8744f9ff3e6693d0'),
(330, 79, '03283f032587c09963faa908d5d738e27219c1acbf89d684351344f559058a8f'),
(336, 76, '22be464c264a26dcbcb8e2d3fa5c4f440ab38909d1362d1864c096889e6cd982'),
(338, 74, '4bc2c7cade2467fae21ccb4af131866acd422b92a342181885ea0d615bec92a8'),
(339, 31, '0b7c88627e3d0c1327f9bb04b4c5e1e9d5ffd0ada313a7bfcc0a8f51f093dc9b'),
(344, 31, '60893746db8305565f970e05e3477272fe36400a55dce6002674d10c66b3c3e9'),
(345, 31, '37b570fcc9c2d8b89544bd143506e7fe78125af42e3854b04aed8642eed6a735'),
(347, 31, 'a8b786e55a5632de713b0bc6596b98e608a277dd1b2d8df848a971e9c9ae784e'),
(348, 31, '8ca80e25e1b42a00f09ab4e0e2e28f89b90cdbceb0cedb7e76d7afb1d579381a'),
(349, 31, '29ce4bd08e9ecff2322f8cd8208edcfdfeb8f9f26dd97a3ef89922d61bf93121'),
(350, 31, '36ff9dc808f5a12d991eb3a03a13cc1a1335dc530f1d305e97f05e0f7ec42554'),
(351, 31, '77d4ddfd606c5c4944f7946f33e0f46babcee949361961e00d9c573ba74a2d16'),
(352, 31, '3e857f1de3f940c3f2b599f2f4ad95a4486fe5ecf85a121e1df0d2c0f9a6c59d'),
(353, 31, 'b368f4dd93355b298dafb8b2e46eb9deed6f71b99746afd2148d08f3d235d50f'),
(354, 31, '52eeed3f88d53861e4449505eb58dbcf52ce82eaa2cc8b0e03ff6ff1d1a8ac6f'),
(355, 31, 'e22e918519aced2dadfeff06eb173db629f93d4c03781cb946462fc436754476'),
(356, 74, '1953f6f7e72b135d47c9c5a40f2c0bd3ad3c6dbde2a5efe1e560882a770118e7'),
(360, 31, '94c004a534c41f44bf158114df7493a7613566694ae407bbf5456f4cfdaacd74'),
(362, 88, 'bf85eaef91e9981533f5c1113f2fc0ee04baaedb7e13129f0109f3b86f1c19b6'),
(365, 31, '2fa079999f3183107a2dace202b871fa51ab20d91c47cf4f6422d949de59cd57'),
(366, 31, 'ebe3456a265ecc51ed95295b61dfecd5fe89ae2ac83198969acf6921aba801fe'),
(367, 91, 'aad23d2a41bf550966636d9ab1de86df9e85d87f1649947a28efe1c8ad532c25'),
(368, 92, '19bde39c7b34027f91320cea6010dc1116dd415e11a8460b8531cf66a244792f'),
(369, 93, '0b78bbf0ca368ca21db3cb638108498ce41c17bf5e6f280fc22a75fe0809cfdf'),
(375, 96, '1c875d07873a164e6aced679e48af8e8572b4d47266b9e53965ac99c4112f798'),
(376, 31, '25faf909d86dd0e6512594c57aaa1d953f438f4fb6d3c8dc7974f316ffa478bd'),
(377, 31, '7adb9d96f4c8491b4992fcea47c113106361160afa096e9070e257fd2919b4cc'),
(378, 31, '73c38621616298606ebb0ae642ba90e595f75f80a34af5577483a448966c9eb3'),
(379, 31, '132c37471ed28e74259287b590aa99fe746fc05a774ed1f0001a322409ad9c58'),
(381, 74, '514f88e8444214eea187b9f6392864c77d11c330fb0757d948d3fbdb2f158b16'),
(383, 31, 'a310308b1bfd29d4bf59a5a0e7889057b4f93f7568ab2c1a6536f536e7336951'),
(385, 31, '8f7f9d47581ddeb93081328f72b6997fe2a5a18fe409b6c96fd0826160dbb032'),
(386, 31, '74545c9fdda21338d8f85ac919d629d3519dfb685bdc86b905fa4a1a7f9c5be1'),
(387, 31, '21ae1def41571ea8fc4dcfc8083f1a4d8299580c98d8d072d034c7aa67a37fb7'),
(388, 31, '0a5d34f70cb5e0a9d565ef8d866df5b437615424d86b12d9966efcfb5783c1db'),
(389, 31, 'b92146f0ac9ebf81d6f0d655f8aacd776a69d9935007a721d23d123f25c6252b'),
(390, 31, '3fd761554d008ee05a3ea172b8619d957faba275b93b80c3f9eb6fac22fd91d8'),
(391, 31, '3faec1bd544809989ada7e8e5b4cc3d22fd50ac6af2f73ed3871c35e0e4411f5'),
(392, 31, '6d62285c5f3b06b5186a1ec232068ee50d29d1155aea056914e7884b79db22bd'),
(393, 31, 'cedde4bbfa00e838ca12466efa97676d2dec2ba6d1153c2d3dc79527ecec7381'),
(394, 31, '1cfe0f702861e6cbfe5e896992139a25eea61858c91590181f85e63d89ecd378'),
(395, 31, '27c9e9d1aab0babb86b011365debe558b3456583ade59adb1ff731f89dd40744'),
(396, 31, 'f581c269b801e55914b0bdc24ef7a8b911ffcf4fce9286deb5b3bd08f9643958');

-- --------------------------------------------------------

--
-- Table structure for table `todo`
--

CREATE TABLE `todo` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `todo` varchar(256) COLLATE utf8_hungarian_ci NOT NULL,
  `category_id` int NOT NULL,
  `creation_date` int NOT NULL,
  `end_date` int NOT NULL,
  `done` tinyint(1) NOT NULL,
  `important` tinyint(1) NOT NULL,
  `deadline` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_hungarian_ci;

--
-- Dumping data for table `todo`
--

INSERT INTO `todo` (`id`, `user_id`, `todo`, `category_id`, `creation_date`, `end_date`, `done`, `important`, `deadline`) VALUES
(89, 31, 'Az első feladatom.', 2, 1650107987, 0, 0, 1, 1650067200);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `admin` tinyint(1) NOT NULL,
  `username` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci NOT NULL,
  `password_hash` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci NOT NULL,
  `password_salt` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci NOT NULL,
  `email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci NOT NULL,
  `first_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci NOT NULL,
  `last_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci NOT NULL,
  `born_date` bigint NOT NULL,
  `register_date` bigint NOT NULL,
  `password_reset_token` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci DEFAULT NULL,
  `email_verification_token` char(64) COLLATE utf8mb4_hungarian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `admin`, `username`, `password_hash`, `password_salt`, `email`, `first_name`, `last_name`, `born_date`, `register_date`, `password_reset_token`, `email_verification_token`) VALUES
(31, 1, 'admin1', '3efe0ecc33bcf6dfeaac9021f87594ec517db8eb43fee3e215f896694f528780', '7206cbe8399e3061c5132b3ad817eb30a5b401f06a87f37c9af00b5b59817213', 'admin@example.com', 'Admin', 'Project', 945129600, 1645793563, NULL, NULL),
(88, 0, 'krisz_98', '7afc72ba13cefcb81dc36338486dd6f472c5f59833fd1b518692474477bc6920', '9539a910a80e88c8b085767d0fffade0629ba78f6c3aba19a6e59c547c7c4659', 'v.krisztian98@freemail.hu', 'Krisztián', 'Vágvölgyi ', 891907200, 1649965593, NULL, NULL),
(93, 0, 'mmgergoo', 'e28f91fa6bdff50b9010cfbdb3fd9a4503cd564258852a3f79e31871c47a3e03', '54679066e4908dea577fbdf242b0d67fae769cab9652245a20ebf1f6b55ef694', 'mmgergo5@gmail.com', 'Gergő', 'Molnár', 975888000, 1650136035, NULL, NULL),
(96, 0, 'Wricky', '8d6b984c28f05f0c595d50ac0075124c815bb52b19d6396c509afe3ff27a3ead', 'f877db0f47baadab1fa0beca579de0c317cc158d5b7ae5e25fc2c97cc7e76fc9', 'rakosiv@gmail.com', 'Viktória', 'Rákosi', 998870400, 1650141384, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `todo`
--
ALTER TABLE `todo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ibfk_1_todo` (`category_id`),
  ADD KEY `ibfk_2_todo` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_name` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `session`
--
ALTER TABLE `session`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=397;

--
-- AUTO_INCREMENT for table `todo`
--
ALTER TABLE `todo`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `todo`
--
ALTER TABLE `todo`
  ADD CONSTRAINT `ibfk_1_todo` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ibfk_2_todo` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
