/*
SQLyog Community v12.09 (64 bit)
MySQL - 5.6.17 : Database - projekat_prosoft
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`projekat_prosoft` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_croatian_ci */;

USE `projekat_prosoft`;

/*Table structure for table `administrativniradnik` */

DROP TABLE IF EXISTS `administrativniradnik`;

CREATE TABLE `administrativniradnik` (
  `administrativniradnikid` int(11) NOT NULL AUTO_INCREMENT,
  `ime` varchar(100) COLLATE utf8_croatian_ci NOT NULL,
  `prezime` varchar(100) COLLATE utf8_croatian_ci NOT NULL,
  `korisnickoime` varchar(100) COLLATE utf8_croatian_ci NOT NULL,
  `korisnickasifra` varchar(100) COLLATE utf8_croatian_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  PRIMARY KEY (`administrativniradnikid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

/*Data for the table `administrativniradnik` */

insert  into `administrativniradnik`(`administrativniradnikid`,`ime`,`prezime`,`korisnickoime`,`korisnickasifra`,`token`) values (1,'Marko','Baračkov','mare','mikimaus','TOKEN##1'),(2,'Lazar','Blanuša','laki','minimaus',NULL),(3,'Ognjen','Ašković','ogi','somina',NULL),(4,'Ivan','Aracki','raca','mikimaus',NULL),(5,'Ana','Adamović','anna','allegra',NULL),(6,'Marko','Peric','tuki','mare',NULL);

/*Table structure for table `dnevnaberba` */

DROP TABLE IF EXISTS `dnevnaberba`;

CREATE TABLE `dnevnaberba` (
  `jmbg` varchar(100) COLLATE utf8_croatian_ci NOT NULL,
  `dnevnaberbaid` int(11) NOT NULL AUTO_INCREMENT,
  `datum` date DEFAULT NULL,
  PRIMARY KEY (`jmbg`,`dnevnaberbaid`),
  KEY `dnevnaberbaid` (`dnevnaberbaid`),
  CONSTRAINT `dnevnaberba_ibfk_1` FOREIGN KEY (`jmbg`) REFERENCES `dobavljac` (`jmbg`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

/*Data for the table `dnevnaberba` */

insert  into `dnevnaberba`(`jmbg`,`dnevnaberbaid`,`datum`) values ('0103992870087',61,'2016-01-18'),('0103992870087',63,'2016-01-18'),('0103992870087',64,'2016-01-20'),('0103992870087',65,'2016-01-20'),('0103992870087',66,'2016-01-20'),('0236965457852',46,'2015-07-06'),('0236965457852',47,'2015-07-06'),('0236965457852',48,'2015-07-06'),('1111111111111',51,'2015-07-06'),('2312998870321',42,'2015-07-05'),('2312998870321',52,'2015-07-06'),('2804992710291',50,'2015-07-06'),('7898325652301',44,'2015-07-06'),('7898325652301',45,'2015-07-06');

/*Table structure for table `dobavljac` */

DROP TABLE IF EXISTS `dobavljac`;

CREATE TABLE `dobavljac` (
  `jmbg` varchar(100) COLLATE utf8_croatian_ci NOT NULL,
  `brojgazdinstva` varchar(100) COLLATE utf8_croatian_ci NOT NULL,
  `brojlicnekarte` varchar(100) COLLATE utf8_croatian_ci NOT NULL,
  `ime` varchar(100) COLLATE utf8_croatian_ci NOT NULL,
  `prezime` varchar(100) COLLATE utf8_croatian_ci NOT NULL,
  `tekuciracun` varchar(100) COLLATE utf8_croatian_ci NOT NULL,
  `ulica` varchar(100) COLLATE utf8_croatian_ci NOT NULL,
  `broj` varchar(100) COLLATE utf8_croatian_ci NOT NULL,
  `mesto` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`jmbg`),
  KEY `mesto` (`mesto`),
  CONSTRAINT `dobavljac_ibfk_1` FOREIGN KEY (`mesto`) REFERENCES `mesto` (`ptt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

/*Data for the table `dobavljac` */

insert  into `dobavljac`(`jmbg`,`brojgazdinstva`,`brojlicnekarte`,`ime`,`prezime`,`tekuciracun`,`ulica`,`broj`,`mesto`) values ('0103992870087','234234','234233','Lazar','Blanuš','23423 - 23423 - 2342','slkdjflk','5',11000),('0236965457852','568462','0949084','Zivojin','Arandjelovic','608 - 36001 - 33','Aradska','345',36313),('0323155984561','8465659519','4901951','Milan','Nedovic','408 - 36001 - 33','Egejska','65',11000),('0804156320008','0515940','09540940','Vukasin','Jerovic','408 - 17001 - 94','Djure Strugara','29',25260),('0808992870009','2323423423','23523423','Marko','Baračkov','32232  - 322- 2322','Laze Ranića','21/a',26330),('1010101010101','54952957','098406405','Aleksandar','Cvijetinovic','708 - 15501 - 35','Disova','747',26300),('1111111111111','0595190','0641030','Aleksandar','Toskic','608 - 17001 - 94','Brace Nedic','674',11000),('1212998875123','234234','234234','ldskjafksj','lakjdsflk','3232 - 2332 - 23232','sdjfklaj','23',11000),('128503263653214','190498045904','0949840','Marko','Blazenovic','208 - 17001 - 94','Laze Ranica','27',36313),('2145896325632','09482490','09460406','Aleksandar','Blazenovic','888 - 20001 - 18','Aradska','7',11000),('2222222222222','0519510989','0940654','Lazar','Askovic','708 - 17001 - 94','Laze Ranica','264',26330),('2312998870321','23452','243234','Mica','Pica','345 - 3454 - 345','skldjflakj','23',25260),('2323232323232','29429894029489','0408','Vukasin','Sumadinovic','708 - 28501 - 29','Brace Nedic','652',11000),('243424','2342342','234234','234234','23423','234234','24342234234','234234',11000),('25169851236','32165498','879804','Marko','Adamovic','708 - 36001 - 33','Laze Ranica','76',11000),('2804992710291','234234','2342342','Ognjen','Ašković','32423 - 324 - 3242','Mice Trofrtaljke','32',11000),('3030303030303','52095090','0984061','Ivan','Radjenovic','908 - 15501 - 35','Djure Strugara','857',36313),('324234','324234','2342342',' marko','barackov','23 - 23423423 - 234','jove','34',23207),('4040404040404','0594248904','04065406','Vukasin','Milosev','108 - 28501 - 29','Vojvode Vuka','84',26330),('4444444444444','05192980','0954066','Zivkica','Sumadinovic','908 - 17001 - 94','Egejska','214',25260),('45126520003','511982952','094098409','Marko','Blanusa','608 - 26501 - 15','Djure Strugara','22',11000),('4521658789856','090842480','0984064','Marko','Barackov ','908 - 28501 - 29','Djure Strugara','2',25260),('4523226458521','1654','091502','Marko','Nesic','108 - 36001 - 33','Egejska','22',26330),('4525987654321','0261515925','509459','Milica','Jokic','308 - 36001 - 33','2. Oktobar','321',23207),('4578985123215','91520021','0949540954','Katarina','Tomic','908 - 26501 - 15','Egejska','84',11000),('4585123654562','31945165','541915','Lazar','Askovic','908 - 11501 - 07','Djure Strugara','12',11000),('5050505050505','95240845','09490849','Milica','Askovic','208 - 28501 - 29','Egejska','92',25260),('54652132589','54665949','1951','Aleksandar','Blanusa','908 - 12501 - 14','Vojvode Vuka','11',36313),('5555555555555','50295904985','40951090','Milica','Blazenovic','108 - 15501 - 35','Disova','236',11000),('6060606060606','05284054','04643','Marko','Blazenovic','308 - 28501 - 29','Laze Ranica','72',11000),('6666666666666','059542984','09549049','Marko','Jovanovic','208 - 15501 - 35','Vojvode Vuka','237',26300),('7070707070707','019528949','5940654','Lazar','Milutinovic','408 - 28501 - 29','Brace Nedic','84',26300),('7777777777777','059129410','09446060','Vlastimir','Blanusa','308 - 15501 - 35','Djure Strugara','236',36313),('7865158849856','51565928','0549510','Vukasin','Askovic','508 - 36001 - 33','Djure Strugara','46',26330),('78651589156545','26151984','089429840','Lazar','Leban','908 - 36001 - 33','Egejska','77',26300),('78653211230','05192510','0492409','Aleksandar','Sumadinovic','808 - 26501 - 15','Disova','94',26300),('7865321145214','519128912','409849084','Ivan','Nesic','408 - 26501 - 15','Disova','44',26300),('78962130201','15195487','04904049','Vukasin','Udovicic','308 - 26501 - 15','Egejska','66',25260),('7898325652301','216598','984054','Milica','Aracki','108 - 26501 - 15','Ickova','99',25260),('7898456321235','23154984','5094190','Aleksandar','Barisic','808 - 36001 - 33','Vojvode Vuka','88',36313),('8080808080808','095525949051','09846406','Aleksandar','Blanusa','508 - 28501 - 29','Djure Strugara','96',23207),('85201234563','15192826','094940954','Andrijana','Armenovic','708 - 26501 - 15','Vojvode Vuka','43',23207),('8532123965887','05195281709','04994094','Milica','Adamovic','108 - 17001 - 94','Brace Nedic','74',25260),('8585858585858','048246','098406','Aleksandar','Blanusa','808 - 28501 - 29','Disova','92',36313),('879854621456','0261565592','010594','Ognjen','Adamovic','208 - 36001 - 33','Ickova','33',25260),('8888888888888','0541952095','094065464','Ana','Aracki','508 - 17001 - 94','Egejska','456',26300),('8888888888889','0519248001','0940644','Vukasin','Rendulic','408 - 15501 - 35','2. Oktobar','346',11000);

/*Table structure for table `mesto` */

DROP TABLE IF EXISTS `mesto`;

CREATE TABLE `mesto` (
  `ptt` bigint(20) NOT NULL,
  `naziv` varchar(100) COLLATE utf8_croatian_ci DEFAULT NULL,
  PRIMARY KEY (`ptt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

/*Data for the table `mesto` */

insert  into `mesto`(`ptt`,`naziv`) values (11000,'Beograd'),(23207,'Aradac'),(25260,'Apatin'),(26300,'Vršac'),(26330,'Uljma'),(36313,'Ugao');

/*Table structure for table `stavkadnevneberbe` */

DROP TABLE IF EXISTS `stavkadnevneberbe`;

CREATE TABLE `stavkadnevneberbe` (
  `jmbg` varchar(100) COLLATE utf8_croatian_ci NOT NULL,
  `dnevnaberbaid` int(11) NOT NULL,
  `stavkaid` int(11) NOT NULL AUTO_INCREMENT,
  `tacne` double DEFAULT NULL,
  `prvaklasa` double DEFAULT NULL,
  `drugaklasa` double DEFAULT NULL,
  `trecaklasa` double DEFAULT NULL,
  `cenatacne` double DEFAULT NULL,
  `cenaprvaklasa` double DEFAULT NULL,
  `cenadrugaklasa` double DEFAULT NULL,
  `cenatrecaklasa` double DEFAULT NULL,
  PRIMARY KEY (`jmbg`,`dnevnaberbaid`,`stavkaid`),
  KEY `stavkaid` (`stavkaid`),
  KEY `stavkadnevneberbe_ibfk_2` (`dnevnaberbaid`),
  CONSTRAINT `stavkadnevneberbe_ibfk_1` FOREIGN KEY (`jmbg`) REFERENCES `dnevnaberba` (`jmbg`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stavkadnevneberbe_ibfk_2` FOREIGN KEY (`dnevnaberbaid`) REFERENCES `dnevnaberba` (`dnevnaberbaid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

/*Data for the table `stavkadnevneberbe` */

insert  into `stavkadnevneberbe`(`jmbg`,`dnevnaberbaid`,`stavkaid`,`tacne`,`prvaklasa`,`drugaklasa`,`trecaklasa`,`cenatacne`,`cenaprvaklasa`,`cenadrugaklasa`,`cenatrecaklasa`) values ('0103992870087',63,27,34,0,0,0,200,0,0,0),('0103992870087',63,28,0,0,45,34,0,0,25,264),('0103992870087',64,29,34,0,0,0,2344,0,0,0),('0236965457852',46,21,1,0,0,0,1,0,0,0),('0236965457852',46,22,1,0,0,0,1,0,0,0),('0236965457852',46,23,1,0,0,0,1,0,0,0),('0236965457852',46,25,15,0,0,0,150,0,0,0),('2804992710291',50,24,23,3,0,0,100,50,0,0),('7898325652301',44,18,3,0,0,0,100,0,0,0),('7898325652301',44,19,0,3,0,0,0,150,0,0),('7898325652301',45,20,3,0,0,0,50,0,0,0);

/*Table structure for table `zaduzenje` */

DROP TABLE IF EXISTS `zaduzenje`;

CREATE TABLE `zaduzenje` (
  `jmbg` varchar(100) COLLATE utf8_croatian_ci NOT NULL,
  `zaduzenjeid` int(11) NOT NULL AUTO_INCREMENT,
  `datumzaduzenja` date DEFAULT NULL,
  `datumrazduzenja` date DEFAULT NULL,
  `kompost` tinyint(1) DEFAULT NULL,
  `prevoz` tinyint(1) DEFAULT NULL,
  `brojvreca` int(11) DEFAULT NULL,
  `zaduzio` int(11) DEFAULT NULL,
  `razduzio` int(11) DEFAULT NULL,
  PRIMARY KEY (`jmbg`,`zaduzenjeid`),
  KEY `zaduzenjeid` (`zaduzenjeid`),
  KEY `zaduzio` (`zaduzio`),
  KEY `razduzio` (`razduzio`),
  CONSTRAINT `zaduzenje_ibfk_1` FOREIGN KEY (`zaduzio`) REFERENCES `administrativniradnik` (`administrativniradnikid`),
  CONSTRAINT `zaduzenje_ibfk_2` FOREIGN KEY (`razduzio`) REFERENCES `administrativniradnik` (`administrativniradnikid`),
  CONSTRAINT `zaduzenje_ibfk_3` FOREIGN KEY (`jmbg`) REFERENCES `dobavljac` (`jmbg`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

/*Data for the table `zaduzenje` */

insert  into `zaduzenje`(`jmbg`,`zaduzenjeid`,`datumzaduzenja`,`datumrazduzenja`,`kompost`,`prevoz`,`brojvreca`,`zaduzio`,`razduzio`) values ('0103992870087',26,'2015-07-05','2016-01-18',0,1,0,6,1),('0103992870087',36,'2016-01-13','2016-01-13',0,1,0,NULL,NULL),('0103992870087',37,'2016-01-13',NULL,1,0,30,NULL,NULL),('0103992870087',38,'2016-01-18','2016-01-18',0,1,0,NULL,NULL),('0103992870087',39,'2016-01-18',NULL,1,0,58,NULL,NULL),('0103992870087',40,'2016-01-20','2016-01-20',0,1,0,NULL,NULL),('0236965457852',2,'2015-05-07','2015-07-05',0,1,0,5,1),('0236965457852',27,'2015-07-05','2015-07-05',0,1,0,6,1),('0236965457852',35,'2015-07-12',NULL,1,0,100,1,NULL),('0323155984561',17,'2015-07-04',NULL,0,1,0,6,NULL),('0804156320008',15,'2015-07-04',NULL,0,1,0,6,NULL),('1010101010101',13,'2015-07-04','2015-07-04',0,1,0,6,6),('1010101010101',14,'2015-07-04',NULL,1,0,56,6,NULL),('1010101010101',21,'2015-07-04','2015-07-04',0,1,0,6,6),('1010101010101',24,'2015-07-05',NULL,1,0,6,6,NULL),('128503263653214',25,'2015-07-05',NULL,1,0,8,6,NULL),('2145896325632',34,'2015-07-10',NULL,0,1,0,1,NULL),('2312998870321',28,'2015-07-05',NULL,1,0,32,1,NULL),('2312998870321',29,'2015-07-05',NULL,0,1,0,1,NULL),('25169851236',3,'2015-05-23',NULL,1,0,96,3,NULL),('2804992710291',32,'2015-07-06','2015-07-06',0,1,0,1,1),('2804992710291',33,'2015-07-06','2015-07-06',1,0,34,1,1),('4040404040404',22,'2015-07-04',NULL,0,1,0,6,NULL),('4525987654321',4,'2015-05-08','2015-05-28',0,1,0,2,4),('4525987654321',5,'2015-07-08',NULL,1,0,100,4,NULL),('4525987654321',16,'2015-07-04',NULL,0,1,0,6,NULL),('6060606060606',23,'2015-07-05',NULL,0,1,0,6,NULL),('8532123965887',18,'2015-07-04',NULL,0,1,0,6,NULL),('8532123965887',19,'2015-07-04',NULL,1,0,56,6,NULL),('8888888888888',30,'2015-07-06',NULL,1,0,54,1,NULL),('8888888888888',31,'2015-07-06',NULL,0,1,0,1,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
