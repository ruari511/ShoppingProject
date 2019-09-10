-- MySQL dump 10.13  Distrib 5.6.42, for Win64 (x86_64)
--
-- Host: localhost    Database: shoppingmall
-- ------------------------------------------------------
-- Server version	5.6.42-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `buycard`
--

DROP TABLE IF EXISTS `buycard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buycard` (
  `bcnum` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(20) DEFAULT NULL,
  `cardNum` varchar(20) DEFAULT NULL,
  `cardDate` varchar(10) DEFAULT NULL,
  `cardCvc` varchar(10) DEFAULT NULL,
  `cardPass` varchar(10) DEFAULT NULL,
  `passfail` int(11) DEFAULT NULL,
  `bank` varchar(20) DEFAULT NULL,
  `installment` int(11) DEFAULT NULL,
  `buynum` int(11) DEFAULT NULL,
  PRIMARY KEY (`bcnum`),
  KEY `buycard_mid_FK_NN` (`id`),
  CONSTRAINT `buycard_mid_FK_NN` FOREIGN KEY (`id`) REFERENCES `member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buycard`
--

LOCK TABLES `buycard` WRITE;
/*!40000 ALTER TABLE `buycard` DISABLE KEYS */;
INSERT INTO `buycard` VALUES (1,'test','1111-1111-1111-1111','11/11','111','1111',1,'우리카드',0,3),(2,'test','1111-1111-1111-1111','11/11','111','1111',1,'신협카드',0,8),(3,'test','1111-1111-1111-1111','11/11','111','1111',1,'제주카드',0,9),(4,'test','1111-1111-1232-1111','11/11','111','1111',0,'BC카드',0,0);
/*!40000 ALTER TABLE `buycard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buylist`
--

DROP TABLE IF EXISTS `buylist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buylist` (
  `buynum` int(11) DEFAULT NULL,
  `id` varchar(20) DEFAULT NULL,
  `order_name` varchar(15) DEFAULT NULL,
  `order_mtel` varchar(20) DEFAULT NULL,
  `order_email` varchar(40) DEFAULT NULL,
  `buydate` varchar(50) NOT NULL,
  `product_num` int(11) DEFAULT NULL,
  `buy_count` int(11) DEFAULT NULL,
  `all_coupon_num` int(11) DEFAULT NULL,
  `delivery_coupon_num` int(11) DEFAULT NULL,
  `point` int(11) DEFAULT NULL,
  `delivery_title` varchar(50) DEFAULT NULL,
  `delivery_cost` int(11) DEFAULT NULL,
  `delivery_result` varchar(20) DEFAULT NULL,
  `delivery_name` varchar(15) DEFAULT NULL,
  `delivery_mtel` varchar(20) DEFAULT NULL,
  `delivery_address` varchar(150) DEFAULT NULL,
  `delivery_message` varchar(50) DEFAULT NULL,
  `payments` varchar(10) DEFAULT NULL,
  KEY `buylist_mid_FK_NN` (`id`),
  CONSTRAINT `buylist_mid_FK_NN` FOREIGN KEY (`id`) REFERENCES `member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buylist`
--

LOCK TABLES `buylist` WRITE;
/*!40000 ALTER TABLE `buylist` DISABLE KEYS */;
INSERT INTO `buylist` VALUES (1,'test','박정현','010-5172-8187','test5625@naver.com','2019/02/01',195,3,0,0,0,'집',0,'배송준비중','박정현','010-5172-8187','(01027) 서울 강북구 수유동 291-108 123','','bankbook'),(2,'test','박정현','010-5172-8187','test5625@naver.com','2019/03/01',167,1,0,0,3000,'집1',2500,'배송준비중','박정현','010-5172-8187','(01030) 서울 강북구 수유동 287 23','','card'),(3,'test','박정현','010-5172-8187','test5625@naver.com','2019/04/01',115,1,0,0,0,'집1',2500,'배송준비중','박정현','010-5172-8187','(01096) 서울 강북구 수유동 731 2323','','card'),(4,'test','박정현','010-5172-8187','test5625@naver.com','2019/09/09',116,1,0,0,0,'집1',2500,'배송준비중','박정현','010-5172-8187','(01080) 서울 강북구 수유동 1-32 123','','bankbook'),(5,'test','박정현','010-5172-8187','test5625@naver.com','2019/05/01',178,1,0,0,0,'집1',2500,'배송준비중','박정현','010-5172-8187','(61447) 광주 동구 지산동 201-7 2323','','bankbook'),(6,'test','박정현','010-5172-8187','test5625@naver.com','2019/06/01',176,1,0,0,0,'집1',2500,'배송준비중','박정현','010-5172-8187','(01096) 서울 강북구 인수봉로23가길 3 123','','bankbook'),(7,'test','박정현','010-5172-8187','test5625@naver.com','2019/09/09',115,8,3,0,160,'집1',0,'배송준비중','박정현','010-5172-8187','(01080) 서울 강북구 수유동 1-32 2323','','bankbook'),(7,'test','박정현','010-5172-8187','test5625@naver.com','2019/09/09',214,5,3,0,160,'집1',0,'배송준비중','박정현','010-5172-8187','(01080) 서울 강북구 수유동 1-32 2323','','bankbook'),(7,'test','박정현','010-5172-8187','test5625@naver.com','2019/09/09',248,4,3,0,160,'집1',0,'배송준비중','박정현','010-5172-8187','(01080) 서울 강북구 수유동 1-32 2323','','bankbook'),(8,'test','박정현','010-5172-8187','test5625@naver.com','2019/09/09',113,1,0,0,435,'집1',2500,'배송준비중','박정현','010-5172-8187','(01066) 서울 강북구 번동 414-15 123213','','card'),(8,'test','박정현','010-5172-8187','test5625@naver.com','2019/09/09',115,1,0,0,435,'집1',2500,'배송준비중','박정현','010-5172-8187','(01066) 서울 강북구 번동 414-15 123213','','card'),(9,'test','박정현','010-5172-8187','test5625@naver.com','2019/09/09',114,1,0,0,0,'123',2500,'배송준비중','박정현','010-5172-8187','(01066) 서울 강북구 번동 414-15 213213','','card'),(10,'test','박정현','010-5172-8187','test5625@naver.com','2019/09/09',113,1,0,0,0,'123',2500,'배송준비중','박정현','010-5172-8187','(49214) 부산 서구 망양로213번길 2-3 213213','','bankbook'),(11,'test','박정현','010-5172-8187','test5625@naver.com','2019/09/09',113,1,0,0,0,'집1',2500,'배송준비중','박정현','010-5172-8187','(11447) 경기 양주시 봉양동 527 213','','bankbook'),(12,'test','박정현','010-5172-8187','test5625@naver.com','2019/09/09',114,1,0,0,0,'집1',2500,'배송준비중','박정현','010-5172-8187','(49214) 부산 서구 망양로213번길 2-3 21312','','bankbook'),(13,'test','박정현','010-5172-8187','test5625@naver.com','2019/09/09',114,1,0,0,0,'집1',2500,'배송준비중','박정현','010-5172-8187','(01030) 서울 강북구 수유동 287 213123','','bankbook'),(14,'test','박정현','010-5172-8187','test5625@naver.com','2019/09/09',116,1,0,0,0,'집1',2500,'배송준비중','박정현','010-5172-8187','(08797) 서울 관악구 봉천동 180-504 3123','','bankbook'),(15,'test','박정현','010-5172-8187','test5625@naver.com','2019/09/09',179,1,0,0,237,'집1',2500,'배송준비중','박정현','010-5172-8187','(07616) 서울 강서구 방화동 607-117 213','','bankbook'),(16,'test','박정현','010-5172-8187','test5625@naver.com','2019/09/09',178,1,0,0,0,'집1',2500,'배송준비중','박정현','010-5172-8187','(01115) 서울 강북구 수유동 52-81 123','','bankbook'),(16,'test','박정현','010-5172-8187','test5625@naver.com','2019/09/09',179,1,0,0,0,'집1',2500,'배송준비중','박정현','010-5172-8187','(01115) 서울 강북구 수유동 52-81 123','','bankbook'),(17,'wjdgus','정정정','010-1517-7887','test562511@nate.com','2019/09/09',114,1,0,0,0,'집1',0,'배송준비중','정정정','010-1517-7887','(61447) 광주 동구 지산동 201-7 123','','bankbook'),(17,'wjdgus','정정정','010-1517-7887','test562511@nate.com','2019/09/09',116,1,0,0,0,'집1',0,'배송준비중','정정정','010-1517-7887','(61447) 광주 동구 지산동 201-7 123','','bankbook'),(17,'wjdgus','정정정','010-1517-7887','test562511@nate.com','2019/09/09',113,1,0,0,0,'집1',0,'배송준비중','정정정','010-1517-7887','(61447) 광주 동구 지산동 201-7 123','','bankbook'),(18,'wjdgus','정정정','010-1517-7887','test562511@nate.com','2019/09/09',176,1,0,0,0,'집1',2500,'배송준비중','정정정','010-1517-7887','(18577) 경기 화성시 팔탄면 매곡리 179-6 232','','bankbook'),(18,'wjdgus','정정정','010-1517-7887','test562511@nate.com','2019/09/09',178,1,0,0,0,'집1',2500,'배송준비중','정정정','010-1517-7887','(18577) 경기 화성시 팔탄면 매곡리 179-6 232','','bankbook');
/*!40000 ALTER TABLE `buylist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `card`
--

DROP TABLE IF EXISTS `card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `card` (
  `cardNum` varchar(20) DEFAULT NULL,
  `cardDate` varchar(10) DEFAULT NULL,
  `cardCvc` varchar(10) DEFAULT NULL,
  `cardPass` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card`
--

LOCK TABLES `card` WRITE;
/*!40000 ALTER TABLE `card` DISABLE KEYS */;
INSERT INTO `card` VALUES ('1111-1111-1111-1111','11/11','111','1111');
/*!40000 ALTER TABLE `card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `cart_num` int(11) NOT NULL AUTO_INCREMENT,
  `product_num` int(11) DEFAULT NULL,
  `id` varchar(20) DEFAULT NULL,
  `product_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`cart_num`),
  KEY `cart_pnum_FK_NN` (`product_num`),
  KEY `cart_mid_FK_NN` (`id`),
  CONSTRAINT `cart_mid_FK_NN` FOREIGN KEY (`id`) REFERENCES `member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cart_pnum_FK_NN` FOREIGN KEY (`product_num`) REFERENCES `product` (`product_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon`
--

DROP TABLE IF EXISTS `coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupon` (
  `coupon_num` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_name` varchar(80) DEFAULT NULL,
  `coupon_percent` int(11) NOT NULL,
  `coupon_limitmax` int(11) DEFAULT NULL,
  `coupon_type` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`coupon_num`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon`
--

LOCK TABLES `coupon` WRITE;
/*!40000 ALTER TABLE `coupon` DISABLE KEYS */;
INSERT INTO `coupon` VALUES (1,'10% 할인 쿠폰',10,5000,'전체금액'),(2,'20% 할인 쿠폰',20,8000,'전체금액'),(3,'30% 할인 쿠폰',30,10000,'전체금액'),(4,'90% 할인 쿠폰',90,20000,'전체금액'),(5,'배송비 무료 쿠폰',0,0,'배송비');
/*!40000 ALTER TABLE `coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon_roulet`
--

DROP TABLE IF EXISTS `coupon_roulet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupon_roulet` (
  `id` varchar(20) DEFAULT NULL,
  `count` int(11) NOT NULL DEFAULT '1',
  KEY `rlet_id_fk_nn` (`id`),
  CONSTRAINT `rlet_id_fk_nn` FOREIGN KEY (`id`) REFERENCES `member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon_roulet`
--

LOCK TABLES `coupon_roulet` WRITE;
/*!40000 ALTER TABLE `coupon_roulet` DISABLE KEYS */;
INSERT INTO `coupon_roulet` VALUES ('test',0),('wjdgus',0),('water_rice1',0);
/*!40000 ALTER TABLE `coupon_roulet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq`
--

DROP TABLE IF EXISTS `faq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faq` (
  `num` int(11) DEFAULT NULL,
  `category` varchar(10) NOT NULL,
  `category_num` int(11) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `content` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq`
--

LOCK TABLES `faq` WRITE;
/*!40000 ALTER TABLE `faq` DISABLE KEYS */;
INSERT INTO `faq` VALUES (1,'10',1,'내 등급은 어디서 볼 수 있나요?','[PC 사이트로 접속하신 경우]\r\n\r\n마이페이지 상단에서 고객님의 등급을 확인하실 수 있으며, \'마이페이지 > 등급혜택\'에서 상세내용을 확인하실 수 있습니다.\r\n\r\n[모바일로 접속하신 경우]\r\n\r\n좌측메뉴(三) > 마이페이지 에서 고객님의 등급을 확인하실 수 있으며, \'등급혜택\'을 클릭하시면 상세내역도 확인하실 수 있습니다.'),(2,'10',2,'회원정보 변경은 어디서 하나요?','[PC 사이트로 접속하신 경우]\r\n\r\n마이페이지 > MY정보 > 회원정보 수정 메뉴에서 회원정보 변경이 가능합니다.\r\n\r\n[모바일로 접속하신 경우]\r\n\r\n마이페이지 > 정보수정 버튼을 클릭하여 회원정보 변경이 가능합니다.'),(3,'10',3,'비밀번호 변경은 어떻게 하나요?','[PC 사이트로 접속하신 경우]\r\n\r\n마이페이지 > MY정보 > 회원정보 수정 > 비밀번호 변경 메뉴에서 회원정보 변경이 가능합니다.\r\n\r\n[모바일로 접속하신 경우]\r\n\r\n마이페이지 > 정보수정 > 비밀번호 변경 버튼을 클릭하여 회원정보 변경이 가능합니다.'),(4,'10',4,'회원 탈퇴는 어떻게 하나요?','회원 탈퇴는 PC > 마이페이지 > MY정보 > 회원탈퇴 메뉴에서 가능합니다. '),(5,'10',5,'회원 가입은 어떻게 하나요?','메인 화면 상단의 \'회원가입\' 버튼을 클릭 하시면 가입하실 수 있습니다.'),(6,'20',1,'POINT가 무엇인가요?','적립되는 포인트이며 어느 곳에서나 상품/서비스 구매 시 현금처럼 사용할 수 있습니다.'),(7,'20',2,'주문한 상품 옵션을 변경하고 싶어요','주문하신 상품의 옵션 변경은 불가하며, 변경을 원하실 경우 취소 후 재주문해주셔야 합니다.'),(8,'20',3,'장바구니에 담아둔 상품이 없어졌어요','고객님께서 담아두신 상품을 주문하시면, 장바구니에서 해당 상품은 삭제됩니다.'),(9,'20',4,'전화로도 주문할 수 있나요?','전화 주문은 서비스되지 않습니다.'),(10,'20',5,'상품준비중에는 취소가 불가능한가요?','상품준비와 출고가 동시에 이루어지기 때문에 상품준비중인 상태에서는 취소가 불가하며, 상품 수령 후 반품으로 진행해주셔야 합니다.'),(11,'30',1,'배송지를 변경할 수 있나요?','배송지 변경은 결제완료 단계에서만 가능하나, 결제완료 단계에서도\r\n이미 물류에 출고 지시가 된 경우에는 불가능 합니다. '),(12,'30',2,'배송비는 얼마인가요?','배송비는 실결제금액 기준 2만원 이상 결제 시 무료이며, 2만원 이하 결제의 경우 기본적으로 배송비는 2,500원입니다.\r\n\r\n※ 추가 배송비가 발생하는 경우\r\n - 도서산간: +2,500원 (5,000원)\r\n - 제주도:  +2,500원 (5,000원)\r\n - 제주도의 도서산간 지역:  +7,000원 (9,500원)\r\n \r\n\r\n※ 업체배송 상품의 경우 업체의 규정에 따라 비용이 상이할 수 있습니다.'),(13,'30',3,'원하는 날짜에 배송이 가능한가요?','지정일 및 지정시간 배송은 불가능합니다.'),(14,'30',4,'주문한 상품은 언제 배송되나요?','온라인몰에서 주문하신 상품은 주문일 기준 3일~5일 이내(주말 및 공휴일 제외)로 배송됩니다.\r\n\r\n※ 도서산간, 제주도 지역의 경우 5~7일 이내 배송됩니다.\r\n※ 브랜드 세일 기간에는 주문량 폭주로 인해 주문일로부터 5~7일 이내 배송됩니다.\r\n※ 예약배송 상품의 경우, 지정된 배송일에 배송됩니다.'),(15,'30',5,'해외로도 배송이 가능한가요?','해외배송은 불가능 합니다.'),(16,'40',1,'반품할 상품을 직접 보내도 되나요?','상품 회수의 경우, 당사에서 직접 진행해야 하는 부분으로\r\n고객님께서 직접 상품을 발송하시는 방식으로는 진행이 불가합니다.\r\n반품 접수해주시면 택배기사님께서 직접 방문하여 상품 회수 진행됩니다.'),(17,'40',2,'반품 배송비는 어떻게 결제하나요?','반품배송비는 처음 결제하셨던 금액에서 차감처리됩니다.'),(18,'40',3,'반품할 때 비용이 드나요?','반품 시 지불하셔야 하는 반품비용은 회수비 2,500원입니다.\r\n\r\n※ 추가비용이 발생하는 경우\r\n - 도서산간: +2,500원 (5,000원)\r\n - 제주도:  +2,500원 (5,000원)\r\n - 제주도의 도서산간 지역:  +7,000원 (9,500원)\r\n - 무료배송이었으나 부분적인 반품으로 인해 무료배송 조건(결제금액 2만원 이상)이 깨진 경우\r\n   :  면제받으셨던 초기 배송비 2,500원 추가 발생\r\n\r\n※ 반품비는 환불금액에서 차감처리 됩니다.'),(19,'40',4,'반품은 언제까지 가능한가요?','반품은 상품을 수령하신 날짜를 기준으로 15일 이내에 가능합니다.\r\n다만 상품의 불량, 배송 오류 등 당사의 실수로 인한 반품인 경우, 30일 이내 신청이 가능합니다.'),(20,'50',1,'당첨자 확인은 어디서 하나요?','[PC 사이트로 접속하신 경우]\r\n\r\n마이페이지 > MY활동 > 이벤트 참여 현황 또는 뷰티테스터 참여 현황 메뉴에서 확인하실 수 있습니다.\r\n\r\n또한, \'이벤트\' 메뉴 상단에 \'당첨자 발표보기\'에서 당첨자 확인을 하실 수 있습니다.\r\n\r\n\r\n[모바일로 접속하신 경우]\r\n\r\n마이페이지 > 이벤트 또는 뷰티테스터 메뉴에서 참여 현황 및 당첨자 확인이 가능합니다.\r\n\r\n또한, \'이벤트\' 메뉴 하단에 \'당첨자 발표\'에서 당첨자 확인을 하실 수 있습니다.\r\n '),(21,'50',2,'개인정보 위수탁 동의는 무엇인가요?','개인정보 위수탁 동의는,\r\n올리브영에서 보유하고 있는 고객님의 정보를 경품 발송 등을 위해 대행사, 제조사, 혹은 택배사 등에 전달하기 위하여 고객님께 개인정보 제공에 대한 동의를 받는 것을 말합니다.'),(22,'50',3,'당첨자 추첨은 어떻게 진행되나요?','당첨자는 이벤트 종료 후, 조건에 맞는 고객님들의 정보를 추출하여 공정하게 추첨됩니다.');
/*!40000 ALTER TABLE `faq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `birth_date` varchar(40) NOT NULL,
  `gender` varchar(5) NOT NULL,
  `email` varchar(40) NOT NULL,
  `reg_date` datetime NOT NULL,
  `address_main` varchar(60) NOT NULL,
  `address_detail` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `grade` varchar(40) NOT NULL,
  `totalprice` int(11) NOT NULL,
  `point` int(11) NOT NULL,
  PRIMARY KEY (`num`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'admin','1234','관리자','1995-04-30','남','itwill@naver.com','2019-08-21 00:00:00','부산','우리집','010-0055-1249','아이언',0,1740),(2,'test','1234','박정현','1995-04-30','남자','test5625@naver.com','2019-09-09 11:25:03','부산광역시 부산진구 동천로 109','7층 아이티윌','010-5172-8187','아이언',184938,297),(3,'wjdgus','123123','정정정','1995-02-28','남자','test562511@nate.com','2019-09-09 20:01:06','부산광역시 부산진구 동천로 109','7층 아이티윌','010-1517-7887','아이언',32300,3323),(4,'water_rice1','1234','빙따밤','1959-05-12','남자','test5625@naver.com','2019-09-09 20:33:14','부산광역시 부산진구 동천로 109','213213213','010-1232-2323','아이언',0,3000);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notice` (
  `num` int(11) DEFAULT NULL,
  `category` varchar(10) NOT NULL,
  `category_num` int(11) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `content` varchar(2000) NOT NULL,
  `reg_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` VALUES (1,'10',1,'[공지]  상품평 포인트 지급 개편 안내','[공지] 상품평 포인트 지급 개편 안내\r\n\r\n \r\n\r\n항상 저희 쇼핑몰을 사랑해주시는 고객님들께 진심으로 감사 드립니다.\r\n\r\n쇼핑몰 상품평 작성을 해 주시는 고객님께 보다 폭넓은 혜택을 드리기 위해, 상품평 포인트 지급 항목을 늘리고 일부 항목의 포인트를 조정하는 개편을 진행하게 되었습니다.\r\n\r\n상품평 포인트 지급 개편 정책은 9월 18일 상품평 작성 건부터 적용될 예정입니다.\r\n\r\n \r\n\r\n- 아 래 -\r\n\r\n \r\n\r\n1. 변경내용 : 상품평 작성 지급 포인트 조정\r\n\r\n2. 시행일자 : 2019년 9월 18일 (수)\r\n\r\n3. 변경내용 상세 :\r\n\r\n- 별점/만족도 항목 평가 시 각 5 POINT 지급 (추가)\r\n\r\n- 포토 추가 시 50 POINT → 30 POINT 지급 (조정)\r\n\r\n ','2019-09-09 12:31:05'),(2,'10',2,' NH농협카드 결제 시스템 작업 안내(~9/14)','안녕하세요, 올리브영입니다.\r\n항상 올리브영의 서비스를 이용해주시는 고객님들께 진심으로 감사 드립니다.\r\n\r\nNH농협카드 전산시스템 개편으로 인하여 아래 시간에 NH농협카드 결제 서비스 이용이 원활하지 않을 수 있으니 참고 부탁드립니다.\r\n\r\n\r\n1. 작업 일시\r\n2019/09/13(금) 21:00 ~ 2019/09/14(토) 05:00\r\n\r\n2. 서비스 이용 영향\r\n- NH농협카드(체크카드 포함) 결제 서비스 중단 \r\n\r\n\r\n\r\n\r\n보다 안정적인 서비스를 위해 다른 카드 또는 다른 결제수단을 이용해주시거나, 작업시간 이후에 이용 부탁드립니다.\r\n\r\n감사합니다.','2019-09-09 12:31:59');
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `product_num` int(11) NOT NULL AUTO_INCREMENT,
  `category_main` varchar(30) NOT NULL,
  `category_sub` varchar(30) NOT NULL,
  `product_name` varchar(70) DEFAULT NULL,
  `product_subname` varchar(70) DEFAULT NULL,
  `product_count` int(11) NOT NULL,
  `product_price` int(11) NOT NULL,
  `product_sale_price` int(11) NOT NULL,
  `img_main` varchar(80) NOT NULL,
  `img_contents` varchar(80) NOT NULL,
  `brand` varchar(20) NOT NULL,
  `price_count` int(11) DEFAULT '0',
  PRIMARY KEY (`product_num`)
) ENGINE=InnoDB AUTO_INCREMENT=419 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (266,'스킨케어','페이셜케어','닥터지 레드블레미쉬 클리어 수딩토너 300ml','토너',100,29000,19000,'t_1.jpg','t1.jpg','닥터지',NULL),(267,'스킨케어','페이셜케어','닥터지 필라그린 배리어 토너 160ml','토너',100,25000,20000,'t_2.jpg','t2.jpg','닥터지',NULL),(268,'스킨케어','페이셜케어','닥터지 센시어스 버블 토너 150g','토너',100,5000,500,'t_3.jpg','t3.jpg','닥터지',NULL),(269,'스킨케어','페이셜케어','시카페어 토너 250ml (시카 진정 토너)','토너',100,33000,26400,'t_4.jpg','t4.jpg','닥터자르트',NULL),(270,'스킨케어','페이셜케어','NEW 세라마이딘 리퀴드 150ml (세라 보습 고농축 토너)','토너',100,39000,31200,'t_5.jpg','t5.jpg','닥터자르트',NULL),(271,'스킨케어','페이셜케어','컨트롤에이 티트리먼트 토너 200ml ','토너',100,28000,23800,'t_6.jpg','t6.jpg','닥터자르트',NULL),(272,'스킨케어','페이셜케어','1025 독도 토너 500ml','토너',100,30000,25000,'t_7.jpg','t7.jpg','라운드랩',NULL),(273,'스킨케어','페이셜케어','제로 모공 패드 155g','토너',100,26000,22100,'t_8.jpg','t8.jpg','메디큐브',NULL),(274,'스킨케어','페이셜케어','익스트림 에센스 토너 190ml','토너',100,25000,17500,'t_9.jpg','t9.jpg','리얼베리어',NULL),(275,'스킨케어','페이셜케어','피지오겔 DMT 로션 200ml','로션',100,31900,20700,'r_1.jpg','r1.jpg','피지오겔',NULL),(276,'스킨케어','페이셜케어','라로슈포제 에빠끌라 H 멀티 컴펜세이팅 수딩 모이스춰라이저','로션',100,29000,23200,'r_2.jpg','r2.jpg','라로슈포제',NULL),(277,'스킨케어','페이셜케어','싸이닉 더심플데일리로션 145ml','로션',100,18000,9900,'r_3.jpg','r3.jpg','싸이닉',NULL),(278,'스킨케어','페이셜케어','마몽드 세라마이드에멀젼 150ML(19AD)','로션',100,18000,12600,'r_4.jpg','r4.jpg','마몽드',NULL),(279,'스킨케어','페이셜케어','바이오더마 센시비오 라이트','로션',100,27000,24300,'r_5.jpg','r5.jpg','바이오더마',NULL),(280,'스킨케어','페이셜케어','유세린 더모퓨리파이어 오일컨트롤 수딩크림 50ml','로션',100,32000,22400,'r_6.jpg','r6.jpg','유세린',NULL),(281,'스킨케어','페이셜케어','이자녹스 크리스탈 에이징 컴포팅 에멀전 130ml','로션',100,42000,33600,'r_7.jpg','r7.jpg','이자녹스',NULL),(282,'스킨케어','페이셜케어','크리니크 포 맨 모이스춰라이징 로션 100ml','로션',100,49000,39200,'r_8.jpg','r8.jpg','크리니크',NULL),(283,'스킨케어','페이셜케어','차앤박 옴므 에이 케어 로션 100ml','로션',100,29000,23200,'r_9.jpg','r9.jpg','차앤박',NULL),(284,'스킨케어','페이셜케어','싸이닉 퍼스트 트리트먼트 에센스','에센스/세럼',100,19800,19800,'a_1.jpg','a1.jpg','싸이닉',NULL),(285,'스킨케어','페이셜케어','마몽드 바이탈 비타민 에센스 100ml','에센스/세럼',100,28000,19600,'a_2.jpg','a2.jpg','마몽드',NULL),(286,'스킨케어','페이셜케어','차앤박 하이드로세라 딥세럼 60ml','에센스/세럼',100,45000,40500,'a_3.jpg','a3.jpg','차앤박',NULL),(287,'스킨케어','페이셜케어','바이오더마 하이드라비오 에센스로션 200ml','에센스/세럼',100,32000,27200,'a_4.jpg','a4.jpg','바이오더마',NULL),(288,'스킨케어','페이셜케어','바이탈 하이드라 솔루션 바이옴 에센스 150ml','에센스/세럼',100,49000,39200,'a_5.jpg','a5.jpg','닥터자르트',NULL),(289,'스킨케어','페이셜케어','더마리프트 센텔라-리페어 트리트먼트 30ml','에센스/세럼',100,21000,10500,'a_6.jpg','a6.jpg','더마리프트',NULL),(290,'스킨케어','페이셜케어','에스티 로더 어드밴스드 나이트 리페어 싱크로나이즈드 리커버리 콤플렉스II 20ML','에센스/세럼',100,52000,46800,'a_7.jpg','a7.jpg','에스티로더',NULL),(291,'스킨케어','페이셜케어','메디큐브 레드 세럼 30ml','에센스/세럼',100,35200,29900,'a_8.jpg','a8.jpg','메디큐브',NULL),(292,'스킨케어','페이셜케어','닥터자르트 V7 세럼 50ml (2018)','에센스/세럼',100,45000,36000,'a_9.jpg','a9.jpg','닥터자르트',NULL),(293,'메이크업','베이스','클리오 킬커버 광채쿠션 기획세트','파운데이션',100,32000,22400,'p_1.jpg','p1.jpg','클리오',NULL),(294,'메이크업','베이스','에스티 로더 더블웨어 파운데이션 SPF10/PA++','파운데이션',100,69000,62100,'p_2.jpg','p2.jpg','에스티로더',NULL),(295,'메이크업','베이스','지베르니 고밀착 시그니처 파운데이션 (밀착 마스터 브러쉬 증정 기획)','파운데이션',100,45000,34000,'p_3.jpg','p3.jpg','지베르니',NULL),(296,'메이크업','베이스','클리오 킬커버 앰플쿠션 기획세트','파운데이션',100,32000,22400,'p_4.jpg','p4.jpg','클리오',NULL),(297,'메이크업','베이스','에스티 로더 퓨처리스트 아쿠아 브릴리언스 리퀴드 메이크업 ','파운데이션',100,88000,79200,'p_5.jpg','p5.jpg','에스티로더',NULL),(298,'메이크업','베이스','지베르니 밀착 쉬폰 쿠션 ','파운데이션',100,36000,28800,'p_6.jpg','p6.jpg','지베르니',NULL),(299,'메이크업','베이스','지베르니 고밀착 시그니처 파운데이션 ','파운데이션',100,45000,36000,'p_7.jpg','p7.jpg','지베르니',NULL),(300,'메이크업','베이스','차앤박 프로폴리스 앰플 인 쿠션 리미티드에디션','파운데이션',100,37000,33300,'p_8.jpg','p8.jpg','차앤박',NULL),(301,'메이크업','베이스','메이블린 뉴욕 핏미 파운데이션','파운데이션',100,18000,11700,'p_9.jpg','p9.jpg','메이블린 뉴욕',NULL),(302,'메이크업','베이스','크리니크 치크 팝','블러셔',100,31000,26300,'b_1.jpg','b1.jpg','크리니크',NULL),(303,'메이크업','베이스','3CE 블러셔 쿠션 8g','블러셔',100,17000,13600,'b_2.jpg','b2.jpg','3CE',NULL),(304,'메이크업','베이스','라카 저스트 치크','블러셔',100,17000,14400,'b_3.jpg','b3.jpg','라카',NULL),(305,'메이크업','베이스','웨이크메이크 컬러스타일러 싱글치크','블러셔',100,11000,8800,'b_4.jpg','b4.jpg','웨이크메이크',NULL),(306,'메이크업','베이스','캔메이크 글로우 플로어 치크','블러셔',100,14000,9800,'b_5.jpg','b5.jpg','캔메이크',NULL),(307,'메이크업','베이스','피치씨 코튼 블러셔','블러셔',100,12000,10200,'b_6.jpg','b6.jpg','피치씨',NULL),(308,'메이크업','베이스','롬앤 베러 댄 치크','블러셔',100,9900,9900,'b_7.jpg','b7.jpg','롬앤',NULL),(309,'메이크업','베이스','에스쁘아 치크 룩북팔레트','블러셔',100,40000,20000,'b_8.jpg','b8.jpg','에스쁘아',NULL),(310,'메이크업','베이스','3CE 크리미 치크 스틱 7g','블러셔',100,22000,17600,'b_9.jpg','b9.jpg','3CE',NULL),(311,'메이크업','베이스','투쿨포스쿨 바이로댕 쉐이딩','쉐이딩/컨투어링',100,16000,12800,'c_1.jpg','c1.jpg','투쿨포스쿨',NULL),(312,'메이크업','베이스','마몽드 팡팡 헤어 섀도우 3.5g','쉐이딩/컨투어링',100,14000,14000,'c_2.jpg','c2.jpg','마몽드',NULL),(313,'메이크업','베이스','손앤박 섀딩프레소 브러쉬 기획세트','쉐이딩/컨투어링',100,24000,16800,'c_3.jpg','c3.jpg','손앤박',NULL),(314,'메이크업','베이스','아임미미 아임멀티스퀘어 001 올어바웃컨투어링','쉐이딩/컨투어링',100,18000,13500,'c_4.jpg','c4.jpg','아임미미',NULL),(315,'메이크업','베이스','다슈 안티헤어로스 헤어쿠션(내추럴브라운)16g','쉐이딩/컨투어링',100,18000,18000,'c_5.jpg','c5.jpg','다슈',NULL),(316,'메이크업','베이스','컬러그램 밀크칙 블러셔 (미피)','쉐이딩/컨투어링',100,9000,7200,'c_6.jpg','c6.jpg','컬러그램톡',NULL),(317,'메이크업','베이스','케이트 슬림 크리에이트 파우더 N (쉐딩&하이라이터)','쉐이딩/컨투어링',100,22000,15400,'c_7.jpg','c7.jpg','케이트',NULL),(318,'메이크업','베이스','캔메이크 쉐딩 파우더','쉐이딩/컨투어링',100,13000,9100,'c_8.jpg','c8.jpg','캔메이크',NULL),(319,'메이크업','베이스','아임미미 리뉴얼 아임멀티스틱','쉐이딩/컨투어링',100,12000,10200,'c_9.jpg','c9.jpg','아임미미',NULL),(320,'메이크업','립메이크업','MAC [올리브영단독]섀이드오브러브/미니맥키트','립스틱',100,48000,40800,'l_1.jpg','l1.jpg','맥',NULL),(321,'메이크업','립메이크업','MAC 립스틱','립스틱',100,31000,29450,'l_2.jpg','l2.jpg','맥',NULL),(322,'메이크업','립메이크업','바비브라운 크러쉬드 립칼라','립스틱',100,39000,33150,'l_3.jpg','l3.jpg','바비브라운',NULL),(323,'메이크업','립메이크업','MAC 파우더 키스 립스틱','립스틱',100,31000,29450,'l_4.jpg','l4.jpg','맥',NULL),(324,'메이크업','립메이크업','웨이크메이크 루즈건 제로 에어 [19＇캉골콜라보]','립스틱',100,16000,13600,'l_5.jpg','l5.jpg','웨이크메이크',NULL),(325,'메이크업','립메이크업','클리오 멜팅듀이립','립스틱',100,16000,10600,'l_6.jpg','l6.jpg','클리오',NULL),(326,'메이크업','립메이크업','에스티 로더 퓨어 컬러 러브 립스틱','립틴트',100,32000,28800,'l_7.jpg','l7.jpg','에스티로더',NULL),(327,'메이크업','립메이크업','[온라인단독]페리페라 미니미니 잉크더벨벳스틱 세트','립스틱',100,30000,15900,'l_8.jpg','l8.jpg','페리페라',NULL),(328,'메이크업','립메이크업','[컬러풀 누드] 에스쁘아 립스틱 노웨어','립스틱',100,20000,14000,'l_9.jpg','l9.jpg','에스쁘아',NULL),(329,'바디로션','로션/크림','[한정기획] 세타필 모이스춰라이징 로션 473ml+473ml(더블기획)','바디로선',100,30400,22000,'br_1.jpg','br1.jpg','세타필',NULL),(330,'바디로션','로션/크림','피지오겔 DMT 바디로션 400ml','바디로선',100,28000,25200,'br_2.jpg','br2.jpg','피지오겔',NULL),(331,'바디로션','로션/크림','더마비 데일리 모이스처 바디로션 400ml','바디로선',100,15000,10200,'br_3.jpg','br3.jpg','더마비',NULL),(332,'바디로션','로션/크림','[온라인단독] 일리윤 세라마이드 아토로션 대용량 528ML','바디로선',100,30000,14900,'br_4.jpg','br4.jpg','일리윤',NULL),(333,'바디로션','로션/크림','[온라인단독] 아토팜 MLE 로션 200ml 기획 (아토팜로션60ml증정)','바디로선',100,32000,22400,'br_5.jpg','br5.jpg','아토팜',NULL),(334,'바디로션','로션/크림','일리윤 세라마이드 아토 로션 350ml (75ml 증정기획)','바디로선',100,20000,11900,'br_6.jpg','br6.jpg','일리윤',NULL),(335,'바디로션','로션/크림','[올영단독기획]바이오더마 아토덤 pp밤 200ml + 센시비오 H2O 250ml 기획','바디로선',100,29000,26100,'br_7.jpg','br7.jpg','바이오더마',NULL),(336,'바디로션','로션/크림','더프트앤도프트 모이스춰 바디로션 300ml 5종 택1','치약',100,18800,9900,'br_8.jpg','br8.jpg','더프트엔도프트',NULL),(337,'바디로션','로션/크림','아토팜 수딩 젤 로션 120ml','치약',100,20000,14000,'br_9.jpg','b9.jpg','아토팜',NULL),(338,'바디케어','핸드/풋','카밀 핸드앤네일 크림 클래식 더블기획(100ml+100ml)+30ml','핸드크림',100,8900,7900,'ha_1.jpg','ha1.jpg','카밀',NULL),(339,'바디케어','핸드/풋','카밀 핸드앤네일크림 미니 3+1기획세트 (30ml*4)','핸드크림',100,9300,8400,'ha_2.jpg','ha2.jpg','카밀',NULL),(340,'바디케어','핸드/풋','[온라인단독]더프트앤도프트 핸드크림50ml 8종 택1','핸드크림',100,9800,5310,'ha_3.jpg','ha3.jpg','더프트앤도프트',NULL),(341,'바디케어','핸드/풋','눅스 레브드미엘 핸드 앤 네일 크림 50ml 1+1 기획약','핸드크림',100,15000,13500,'ha_4.jpg','ha4.jpg','눅스',NULL),(342,'바디케어','핸드/풋','[온라인단독] 록시땅 하트 핸드 트리오30ml*3 [2019한정판]','핸드크림',100,42000,39060,'ha_5.jpg','ha5.jpg','록시땅',NULL),(343,'바디케어','핸드/풋','[온라인단독] 더프트앤도프트 베스트 핸드크림 3종 선물세트','핸드크림',100,17400,12000,'ha_6.jpg','ha6.jpg','더프트앤도프트',NULL),(344,'바디케어','핸드/풋','카밀 핸드크림 보너스 2종 기획팩(클래식 133ml + 바이탈Q10 100ml)','핸드크림',100,9900,9900,'ha_7.jpg','ha7.jpg','카밀',NULL),(345,'바디케어','핸드/풋','[기획]캐스키드슨 핸드크림 트리오 블로썸 30mlX3 +배스밤','핸드크림',100,11800,9900,'ha_8.jpg','ha8.jpg','캐드키드슨',NULL),(346,'바디케어','핸드/풋','허바신 카밀 핸드크림','핸드크림',100,10000,7000,'ha_9.jpg','ha9.jpg','허바신',NULL),(347,'헤어케어','샴푸/린스','[온라인단독] 어헤즈 프리미엄 히든 테라피 샴푸 750ml','샴푸',100,39000,27300,'s_1.jpg','s1.jpg','어헤즈',NULL),(348,'헤어케어','샴푸/린스','[온라인단독] 닥터포헤어 폴리젠 샴푸 500ml*2개입 기획약','샴푸',100,59900,35910,'s_2.jpg','s2.jpg','닥터포헤어',NULL),(349,'헤어케어','샴푸/린스','[온라인단독] 아로마티카 로즈마리 스케일링 샴푸 900ml','샴푸',100,37000,25900,'s_3.jpg','s3.jpg','아로마티카',NULL),(350,'헤어케어','샴푸/린스','[온라인단독]클로란 피오니 샴푸 400ml 2+1','샴푸',100,39600,29700,'s_4.jpg','s4.jpg','클로란',NULL),(351,'헤어케어','샴푸/린스','[온라인단독] 더마클라센 샴푸 1,000ml (레몬글라스) + 더마클라센 트리트먼트 ','샴푸',100,42000,24120,'s_5.jpg','s5.jpg','더마클라센',NULL),(352,'헤어케어','샴푸/린스','[온라인단독] 달리프 클로렐라 베러 루트 릴렉싱샴푸 500ml*2개 (1+1기획세트)','샴푸',100,19600,16720,'s_6.jpg','s6.jpg','달리프',NULL),(353,'헤어케어','샴푸/린스','[온라인단독]착한팩토리 밀크 단백질샴푸 1000ml+트리트먼트 1000ml','샴푸',100,19800,18800,'s_7.jpg','s7.jpg','착한팩토리',NULL),(354,'헤어케어','샴푸/린스','[온라인단독][샴푸2종 추가증정]마녀공장 허브그린 내추럴 헤어 샴푸 510ml 더블 기획 SET','샴푸',100,35000,22000,'s_8.jpg','s8.jpg','마녀공장',NULL),(355,'헤어케어','샴푸/린스','알페신 카페인샴푸 C1 250ml','샴푸',100,14000,9800,'s_9.jpg','s9.jpg','알페신',NULL),(356,'헤어케어','샴푸/린스','이브로쉐 라즈베리 헤어식초 400ML 듀오 기획세트 (공병증정)','린스/컨디셔너',100,29800,21420,'ls_1.jpg','ls1.jpg','아로마티카',NULL),(357,'헤어케어','샴푸/린스','[아로마티카] 로즈마리 헤어 씨크닝 트리트먼트 컨디셔너 400ml','린스/컨디셔너',100,15000,10500,'ls_2.jpg','ls2.jpg','루치펠로',NULL),(358,'헤어케어','샴푸/린스','이브로쉐 라즈베리 헤어식초 150ML 미스트 증정 기획 (1902)','린스/컨디셔너',100,9900,6900,'ls_3.jpg','ls3.jpg','이브로쉐',NULL),(359,'헤어케어','샴푸/린스','이브로쉐 리프레쉬 헤어식초 2+1 기획세트 (1908)','린스/컨디셔너',100,19800,17820,'ls_4.jpg','ls4.jpg','이브로쉐',NULL),(360,'헤어케어','샴푸/린스','[온라인단독] 이브로쉐 라즈베리 헤어식초 대용량 400ML 트리플 ','린스/컨디셔너',100,40200,35200,'ls_5.jpg','ls5.jpg','이브로쉐',NULL),(361,'헤어케어','샴푸/린스','이브로쉐 퓨리티 헤어식초 150ml','린스/컨디셔너',100,11900,8900,'ls_6.jpg','ls6.jpg','이브로쉐',NULL),(362,'헤어케어','샴푸/린스','허벌에센스 클래식 카모마일 컨디셔너 490ml','린스/컨디셔너',100,13900,6900,'ls_7.jpg','ls7.jpg','허벌에센스',NULL),(363,'헤어케어','샴푸/린스','팬틴 극손상 린스 500ml','린스/컨디셔너',100,11300,5600,'ls_8.jpg','ls8.jpg','팬틴',NULL),(364,'헤어케어','샴푸/린스','사이오스 실리콘무첨가 리페어 컨디셔너 750ml','린스/컨디셔너',100,16500,8300,'ls_9.jpg','ls9.jpg','사이오스',NULL),(365,'헤어케어','스타일링/에센스','[올영단독] 퍼펙트세럼 오리지널 200ML(한정 대용량)','헤어에센스',100,30000,13900,'hs_1.jpg','hs1.jpg','미쟝센',NULL),(366,'헤어케어','스타일링/에센스','(한정기획)실크테라피 핑크에디션KIT(에센스165+핑크에센스60)','헤어에센스',100,5000,500,'hs_2.jpg','hs2.jpg','실크테라피',NULL),(367,'헤어케어','스타일링/에센스','미쟝센 퍼펙트세럼 70ml 1+1 [꼬마세럼 추가증정]','헤어에센스',100,13000,11700,'hs_3.jpg','hs3.jpg','미쟝센',NULL),(368,'헤어케어','스타일링/에센스','존프리다 프리즈 이즈 오리지널 세럼 50ml','헤어에센스',100,19000,13300,'hs_4.jpg','hs4.jpg','존프라다',NULL),(369,'헤어케어','스타일링/에센스','존프리다 프리즈 이즈 세럼 4종 선택1','헤어에센스',100,19000,13300,'hs_5.jpg','hs5.jpg','존프라다',NULL),(370,'헤어케어','스타일링/에센스','라우쉬 오리지널 헤어 팅크처 200ml 기획(두피 강화 토닉)','헤어에센스',100,47000,37600,'hs_6.jpg','hs6.jpg','라우쉬',NULL),(371,'헤어케어','스타일링/에센스','헤어플러스 단백질 본드 앰플 에센스 기획세트(70ml+70ml)','헤어에센스',100,5000,500,'hs_7.jpg','hs7.jpg','루치펠로',NULL),(372,'헤어케어','스타일링/에센스','어헤즈 프리미엄 히든 테라피 토닉 60ml','헤어에센스',100,17000,14500,'hs_8.jpg','hs8.jpg','어헤즈',NULL),(373,'헤어케어','스타일링/에센스','모레모 헤어 세럼 R 120ml','헤어에센스',100,19000,15200,'hs_9.jpg','hs9.jpg','모레모',NULL),(374,'향수/디퓨저','캔들/디퓨저','라운드어라운드 선인장 디퓨저[만세선인장] NEW','디퓨저',100,24000,18300,'df_1.jpg','df1.jpg','라운드어라운드',NULL),(375,'향수/디퓨저','캔들/디퓨저','[온라인단독]코코도르 디퓨저 200ml+리필액 200ml*2 블랙체리','디퓨저',100,16700,12520,'df_2.jpg','df2.jpg','코코도르',NULL),(376,'향수/디퓨저','캔들/디퓨저','아로니카 앳홈 블루밍가든 디퓨저 85ml','디퓨저',100,19900,14900,'df_3.jpg','df3.jpg','아로니카',NULL),(377,'향수/디퓨저','캔들/디퓨저','우드윅 디퓨저(59ml) 5종 모음','디퓨저',100,5000,500,'df_4.jpg','df4.jpg','우드윅',NULL),(378,'향수/디퓨저','캔들/디퓨저','[온라인단독]코코도르 디퓨저 200ml+리필액 200ml*2 퓨어코튼','디퓨저',100,16700,12520,'df_5.jpg','df5.jpg','코코도르',NULL),(379,'향수/디퓨저','캔들/디퓨저','라운드어라운드 드라이플라워 디퓨저 [스윗그라스] NEW패키지','디퓨저',100,22000,16500,'df_6.jpg','df6.jpg','라운드어라운드',NULL),(380,'향수/디퓨저','캔들/디퓨저','[온라인단독]코코도르 디퓨저 200ml+리필액 200ml*2 화이트머스크','디퓨저',100,16700,12520,'df_7.jpg','df7.jpg','코코도르',NULL),(381,'향수/디퓨저','캔들/디퓨저','[온라인단독]미니캔들+로즈화이트 워머세트 [린넨]','디퓨저',100,58000,36900,'df_8.jpg','df8.jpg','우드윅',NULL),(382,'향수/디퓨저','캔들/디퓨저','우드윅 라지캔들 6종 모음','디퓨저',100,47000,29900,'df_9.jpg','df9.jpg','우드윅',NULL),(383,'남성','스킨케어','우르오스 스킨밀크 200ml','스킨케어',100,29700,22300,'ms_1.jpg','ms1.jpg','우르오스',NULL),(384,'남성','스킨케어','우르오스 올인원 스킨밀크&스킨로션 200ml 택 1','스킨케어',100,29700,22300,'ms_2.jpg','ms2.jpg','우르오스',NULL),(385,'남성','스킨케어','보타닉힐보 아이디얼포맨퍼펙트 올인원 기획세트','스킨케어',100,28000,18900,'ms_3.jpg','ms3.jpg','보타닉힐보아이디얼포맨',NULL),(386,'남성','스킨케어','랩시리즈 레스큐 워터 로션 기획세트 (200ml+50ml+50ml)','스킨케어',100,51000,45900,'ms_4.jpg','ms4.jpg','랩시리즈',NULL),(387,'남성','스킨케어','우르오스 스킨로션 200ml','스킨케어',100,29700,22300,'ms_5.jpg','ms5.jpg','우르오스',NULL),(388,'남성','스킨케어','헤지스맨 룰429 화이트닝 선 올인원 기획SPF50+ (퍼팩크림40ml증정)','스킨케어',100,38000,26910,'ms_6.jpg','ms6.jpg','헤지스맨룰429',NULL),(389,'남성','스킨케어','헤지스 맨 룰429 슬리핑퍼팩크림 선물기획(올인원50ml 증정)','스킨케어',100,32000,23040,'ms_7.jpg','ms7.jpg','헤지스맨룰429',NULL),(390,'남성','스킨케어','프레시올인원세트 150mL','스킨케어',100,26000,19900,'ms_8.jpg','ms8.jpg','보타닉힐보아이디얼포맨',NULL),(391,'남성','스킨케어','보타닉힐보아이디얼포맨 프레시스킨케어세트','스킨케어',100,38000,29000,'ms_9.jpg','ms9.jpg','보타닉힐보아이디얼포맨',NULL),(392,'남성','헤어케어','알페신 카페인샴푸 C1 250ml','헤어케어',100,14000,9800,'mh_1.jpg','mh1.jpg','알페신',NULL),(393,'남성','헤어케어','[온라인전용]필립스 휴대용 헤어드라이어 (BHC010) 블랙 1200W','헤어케어',100,19900,9900,'mh_2.jpg','mh2.jpg','필립스',NULL),(394,'남성','헤어케어','다슈 포맨 프리미엄 울트라 홀딩 파워 왁스 100g','헤어케어',100,15000,14250,'mh_3.jpg','mh3.jpg','다슈',NULL),(395,'남성','헤어케어','다슈 포맨 프리미엄 메가 홀드 슈퍼 스프레이 250ml','헤어케어',100,15000,14250,'mh_4.jpg','mh4.jpg','다슈',NULL),(396,'남성','헤어케어','갸스비 셋앤킵 수퍼하드 스프레이 263ml','헤어케어',100,8000,6400,'mh_5.jpg','mh5.jpg','갸스비',NULL),(397,'남성','헤어케어','알페신 카페인 샴푸 리퀴드 200ml','헤어케어',100,16000,13600,'mh_6.jpg','mh6.jpg','알페신',NULL),(398,'남성','헤어케어','다슈 데일리 볼륨업 컬크림 150ml','헤어케어',100,15000,9400,'mh_7.jpg','mh7.jpg','다슈',NULL),(399,'남성','헤어케어','다슈 데일리 울트라 홀딩 스칼프 스프레이 200ml','헤어케어',100,18000,18000,'mh_8.jpg','mh8.jpg','루치펠로',NULL),(400,'남성','헤어케어','그라펜 엣지 핑거','헤어케어',100,13900,13900,'mh_9.jpg','mh9.jpg','그라펜',NULL),(401,'건강/위생용품','덴탈케어','덴티스테 플러스화이트 치약 튜브100g','치약',100,9200,6400,'ck_1.jpg','ck1.jpg','덴티스테',NULL),(402,'건강/위생용품','덴탈케어','덴티스테 플러스화이트 치약 튜브 60g','치약',100,5900,2600,'ck_2.jpg','ck2.jpg','덴티스테',NULL),(403,'건강/위생용품','덴탈케어','[온라인단독] 히말라야핑크쏠트 아이스민트기획 (100g*2개+50g)','치약',100,10900,6900,'ck_3.png','ck3.jpg','페리오',NULL),(404,'건강/위생용품','덴탈케어','루치펠로 브레스케어 미스틱포레스트 치약 100g','치약',100,9800,7800,'ck_4.jpg','ck4.jpg','루치펠로',NULL),(405,'건강/위생용품','덴탈케어','언파 차차 치약 100g','치약',100,8900,7900,'ck_5.jpg','ck5.jpg','언파',NULL),(406,'건강/위생용품','덴탈케어','[온라인단독] 루치펠로 치약&가글 6종','치약',100,45900,39930,'ck_6.jpg','ck6.jpg','루치펠로',NULL),(407,'건강/위생용품','덴탈케어','[온라인단독] 히말라야 핑크쏠트 펌핑치약 플로럴 민트','치약',100,9900,5900,'ck_7.jpg','ck7.jpg','페리오',NULL),(408,'건강/위생용품','덴탈케어','루치펠로 검케어 트로피칼오션 치약 100g','치약',100,9800,7800,'ck_8.jpg','ck8.jpg','루치펠로',NULL),(409,'건강/위생용품','덴탈케어','센소다인 멀티케어 100g','치약',100,6100,4800,'ck_9.jpg','ck9.jpg','센소다인',NULL),(410,'건강/위생용품','덴탈케어','KENT 초극세모 칫솔 - 핑크/민트/베이지','칫솔',100,4300,3800,'cs_1.jpg','cs1.jpg','켄트',NULL),(411,'건강/위생용품','덴탈케어','[온라인단독]KENT 컴팩트 초극세모 칫솔(민트/바이올렛/핑크/그린)','칫솔',100,4300,3800,'cs_2.jpg','cs2.jpg','켄트',NULL),(412,'건강/위생용품','덴탈케어','페리오 i-brush 리필모 2입','칫솔',100,5400,5400,'cs_3.jpg','cs3.jpg','페리오',NULL),(413,'건강/위생용품','덴탈케어','[온라인단독]2080 크리스탈 실키 칫솔 4입 미세모','칫솔',100,9900,4950,'cs_4.jpg','cs4.jpg','2080',NULL),(414,'건강/위생용품','덴탈케어','에비스 인터 치간철저케어 칫솔(NEW)','칫솔',100,4300,3600,'cs_5.jpg','cs5.jpg','에비스',NULL),(415,'건강/위생용품','덴탈케어','에비스 프리미엄케어 6열 광폭헤드 칫솔 미세모(NEW)','칫솔',100,4300,3600,'cs_6.jpg','cs6.jpg','에비스',NULL),(416,'건강/위생용품','덴탈케어','데일리 칫솔 8P 세트','칫솔',100,20880,16710,'cs_7.jpg','cs7.jpg','데일리라이크',NULL),(417,'건강/위생용품','덴탈케어','오랄비 고탄력 초미세모 그린티1ea','칫솔',100,3500,3500,'cs_8.jpg','cs8.jpg','오랄비',NULL),(418,'건강/위생용품','덴탈케어','조르단 인터덴탈 브러쉬(마이크로)','칫솔',100,6000,6000,'cs_9.jpg','cs9.jpg','조르단',NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qna`
--

DROP TABLE IF EXISTS `qna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qna` (
  `num` int(11) DEFAULT NULL,
  `id` varchar(20) DEFAULT NULL,
  `category` varchar(10) NOT NULL,
  `category_num` int(11) NOT NULL,
  `product_num` int(11) DEFAULT NULL,
  `subject` varchar(200) NOT NULL,
  `content` varchar(2000) NOT NULL,
  `re_result` varchar(10) DEFAULT NULL,
  `reply_id` varchar(20) DEFAULT NULL,
  `reply` varchar(2000) NOT NULL,
  `reg_date` datetime DEFAULT NULL,
  `re_reg_date` datetime DEFAULT NULL,
  KEY `Qna_FK_NN` (`product_num`),
  CONSTRAINT `Qna_FK_NN` FOREIGN KEY (`product_num`) REFERENCES `product` (`product_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qna`
--

LOCK TABLES `qna` WRITE;
/*!40000 ALTER TABLE `qna` DISABLE KEYS */;
/*!40000 ALTER TABLE `qna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_like`
--

DROP TABLE IF EXISTS `review_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_like` (
  `review_num` int(11) NOT NULL,
  `id` varchar(20) NOT NULL,
  PRIMARY KEY (`review_num`,`id`),
  KEY `like_mid_FK_NN` (`id`),
  CONSTRAINT `like_mid_FK_NN` FOREIGN KEY (`id`) REFERENCES `member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `like_renum_FK_NN` FOREIGN KEY (`review_num`) REFERENCES `reviewboard` (`review_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_like`
--

LOCK TABLES `review_like` WRITE;
/*!40000 ALTER TABLE `review_like` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviewboard`
--

DROP TABLE IF EXISTS `reviewboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviewboard` (
  `review_num` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `product_num` int(11) DEFAULT NULL,
  `review_title` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `review_content` varchar(400) COLLATE utf8_unicode_ci NOT NULL,
  `like_count` int(11) NOT NULL,
  `review_star` int(11) DEFAULT NULL,
  `review_regdate` datetime NOT NULL,
  `review_img` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`review_num`),
  KEY `board_pnum_FK_NN` (`product_num`),
  CONSTRAINT `board_pnum_FK_NN` FOREIGN KEY (`product_num`) REFERENCES `product` (`product_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviewboard`
--

LOCK TABLES `reviewboard` WRITE;
/*!40000 ALTER TABLE `reviewboard` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviewboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_coupon`
--

DROP TABLE IF EXISTS `user_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_coupon` (
  `coupon_num` int(11) DEFAULT NULL,
  `id` varchar(20) DEFAULT NULL,
  `start_date` varchar(50) DEFAULT NULL,
  `last_date` varchar(50) DEFAULT NULL,
  `usecheck` int(11) DEFAULT NULL,
  KEY `cuser_cnum_FK_NN` (`coupon_num`),
  KEY `cuser_mid_FK_NN` (`id`),
  CONSTRAINT `cuser_cnum_FK_NN` FOREIGN KEY (`coupon_num`) REFERENCES `coupon` (`coupon_num`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cuser_mid_FK_NN` FOREIGN KEY (`id`) REFERENCES `member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_coupon`
--

LOCK TABLES `user_coupon` WRITE;
/*!40000 ALTER TABLE `user_coupon` DISABLE KEYS */;
INSERT INTO `user_coupon` VALUES (1,'test','2019-08-14','2019-12-25',0),(2,'test','2019-08-14','2019-12-25',0),(3,'test','2019-08-14','2019-12-25',1),(2,'test','2019-09-09 14:16:50.707','2019-10-09 14:16:50.707',1),(4,'wjdgus','2019-09-09 20:01:27.998','2019-10-09 20:01:27.998',0),(2,'water_rice1','2019-09-09 20:33:24.134','2019-10-09 20:33:24.134',0);
/*!40000 ALTER TABLE `user_coupon` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-09 20:36:12