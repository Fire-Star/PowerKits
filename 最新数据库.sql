/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.6.17 : Database - powerkits
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`powerkits` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `powerkits`;

/*Table structure for table `envelope` */

DROP TABLE IF EXISTS `envelope`;

CREATE TABLE `envelope` (
  `wishCode` char(50) NOT NULL COMMENT '祝福码',
  `receiveMan` char(16) NOT NULL COMMENT '收信人',
  `envelopeAim` char(20) NOT NULL COMMENT '这封信的目的',
  `sendMan` char(20) NOT NULL COMMENT '寄信人',
  `dearMan` char(20) NOT NULL COMMENT '致 谁谁谁',
  `message` text NOT NULL COMMENT '信的内容',
  `stamp` char(100) DEFAULT NULL COMMENT '邮票',
  `sendManEmail` varchar(100) DEFAULT NULL COMMENT '发送者的邮件地址',
  `receiveManEmail` varchar(100) DEFAULT NULL COMMENT '收件人的邮件地址',
  PRIMARY KEY (`wishCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `envelope` */

/*Table structure for table `envelopereadlog` */

DROP TABLE IF EXISTS `envelopereadlog`;

CREATE TABLE `envelopereadlog` (
  `ID` char(36) NOT NULL,
  `IP` char(30) NOT NULL COMMENT '远程IP地址',
  `readCount` int(11) NOT NULL COMMENT '远程IP对信件的阅读次数',
  `wishCode` char(50) NOT NULL COMMENT '祝福码',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `envelopereadlog` */

/*Table structure for table `hotcritical` */

DROP TABLE IF EXISTS `hotcritical`;

CREATE TABLE `hotcritical` (
  `id` char(36) NOT NULL,
  `critical` varchar(500) NOT NULL COMMENT '热门评论',
  `titleType` char(50) NOT NULL COMMENT '热门标题类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `hotcritical` */

insert  into `hotcritical`(`id`,`critical`,`titleType`) values ('1650b7ac-bb9d-11e7-a820-1cb72c2f3c53','这不是去幼儿园的路我要下车……','fun_恶搞漫画'),('5fb72bd9-bbba-11e7-a820-1cb72c2f3c53','车门悍死!今天谁都别想下车!','fun_娱乐'),('653a87eb-bba9-11e7-a820-1cb72c2f3c53','你想痛死我然后继承我的支付宝吗？？？','fun_娱乐'),('967efb03-bb9d-11e7-a820-1cb72c2f3c53','当\"逗逼\"从骂一个人到变成一个动作时，你已经丢掉了节操~~~','fun_恶搞漫画');

/*Table structure for table `res` */

DROP TABLE IF EXISTS `res`;

CREATE TABLE `res` (
  `res_id` char(36) NOT NULL,
  `res_url` varchar(2048) NOT NULL,
  `res_description` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `res` */

/*Table structure for table `res_role` */

DROP TABLE IF EXISTS `res_role`;

CREATE TABLE `res_role` (
  `res_r_id` char(36) NOT NULL,
  `res_id` char(36) NOT NULL,
  `r_id` char(36) NOT NULL,
  PRIMARY KEY (`res_r_id`),
  KEY `res_role_foreikey_res_id` (`res_id`),
  KEY `res_role_foreikey_r_id` (`r_id`),
  CONSTRAINT `res_role_foreikey_res_id` FOREIGN KEY (`res_id`) REFERENCES `res` (`res_id`),
  CONSTRAINT `res_role_foreikey_r_id` FOREIGN KEY (`r_id`) REFERENCES `role` (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `res_role` */

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `rid` char(36) NOT NULL,
  `rname` varchar(40) NOT NULL COMMENT '角色名称',
  `rdescription` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `role` */

insert  into `role`(`rid`,`rname`,`rdescription`) values ('967bafbc-7cda-11e7-9bb7-708bcd7b61ba','ROLE_USER','普通登录账户'),('d0a93949-7ce2-11e7-9bb7-708bcd7b61ba','ROLE_ADMIN','管理员账户');

/*Table structure for table `titlefun` */

DROP TABLE IF EXISTS `titlefun`;

CREATE TABLE `titlefun` (
  `id` char(36) NOT NULL,
  `title` char(100) NOT NULL COMMENT '自媒体有趣的标题',
  `belongType` char(10) NOT NULL COMMENT '标题归类',
  `analyzeSuccess` varchar(250) DEFAULT NULL COMMENT '为什么别人的标题会是热点头条',
  `playCount` char(20) DEFAULT NULL COMMENT '该标题内容到达的播放量',
  `keyWord` varchar(200) DEFAULT NULL COMMENT '标题提取关键字',
  `guessUserFlock` char(50) DEFAULT NULL COMMENT '猜测该文字的用户群是谁',
  `howTimeLong` char(20) DEFAULT NULL COMMENT '视频时间长度',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `titlefun` */

insert  into `titlefun`(`id`,`title`,`belongType`,`analyzeSuccess`,`playCount`,`keyWord`,`guessUserFlock`,`howTimeLong`) values ('027c0ca8-ba67-11e7-a820-1cb72c2f3c53','小宝宝和爸爸的神秘默契~看完90%的人都想要baby了','fun_亲子','小宝宝+爸爸+神秘的默契，让人产生了对小宝宝和爸爸有哪儿种默契度的好奇？引人遐想连篇！播放量如此大的原因还可能是，少妇的用户群比较大，由于她们有了家庭或者想要拥有家庭，普遍工作不劳累，有时间刷视频，用户基数大！','77万','小宝宝;爸爸;神秘默契;','男士;女士;屌丝;','03:48'),('1ee6e393-ba68-11e7-a820-1cb72c2f3c53','小孩对发型的执着，那个把自己剃成地中海的好像还挺满意？','fun_亲子','小孩+发型+执着+地中海，让人觉得小孩调皮，cute，可爱，最后给出那个地中海的小孩还挺满意，地中海不属于小孩，却在小孩身上，让出一些遐想给用户，用户也会坚持看完！好奇地中海的小孩长啥样！','28.2万','小孩;发型;执着;地中海;','男士;女士;屌丝;少妇;孕妇;','04:48'),('8235c6c9-ba63-11e7-a820-1cb72c2f3c53','喵新人成精了啊~这舞姿真销魂~','fun_宠物','舞姿+销魂+成精，对比其它同类标题，改标题具有吸引女生和爱宠人士的特点！','1.8万','喵星人;舞姿;销魂;成精;','女生、爱宠人士','02:44'),('d1cba024-ba68-11e7-a820-1cb72c2f3c53','小宝宝愤怒起来，说实话，我都不敢笑了~','fun_亲子','小宝宝+愤怒+不敢笑了，小宝宝平时都是开开心心的，还真的很少看到为什么愤怒，并且小宝宝愤怒也是很cute的，引起了广大少女的好奇心！','82.6万','小宝宝;愤怒;','屌丝;少妇;孕妇;','03:30');

/*Table structure for table `titletype` */

DROP TABLE IF EXISTS `titletype`;

CREATE TABLE `titletype` (
  `type` char(50) NOT NULL COMMENT '标题类型',
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `titletype` */

insert  into `titletype`(`type`) values ('fun_亲子'),('fun_娱乐'),('fun_宠物'),('fun_恶搞漫画');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `username` varchar(40) NOT NULL COMMENT '用户名',
  `password` varchar(30) NOT NULL COMMENT '密码',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`username`,`password`) values ('Admin','123'),('MoonFollow','123');

/*Table structure for table `user_role` */

DROP TABLE IF EXISTS `user_role`;

CREATE TABLE `user_role` (
  `urid` char(36) NOT NULL,
  `username` char(36) NOT NULL,
  `rid` char(36) NOT NULL,
  PRIMARY KEY (`urid`),
  KEY `user_role_foreikey_username` (`username`),
  KEY `user_role_foreikey_rid` (`rid`),
  CONSTRAINT `user_role_foreikey_rid` FOREIGN KEY (`rid`) REFERENCES `role` (`rid`),
  CONSTRAINT `user_role_foreikey_username` FOREIGN KEY (`username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_role` */

insert  into `user_role`(`urid`,`username`,`rid`) values ('09d079b7-7ce3-11e7-9bb7-708bcd7b61ba','Admin','d0a93949-7ce2-11e7-9bb7-708bcd7b61ba'),('3417eeaf-7ce2-11e7-9bb7-708bcd7b61ba','MoonFollow','967bafbc-7cda-11e7-9bb7-708bcd7b61ba');

/*Table structure for table `userflock` */

DROP TABLE IF EXISTS `userflock`;

CREATE TABLE `userflock` (
  `name` char(20) NOT NULL COMMENT '用户群名称',
  `feature` varchar(100) DEFAULT NULL COMMENT '用户群特点',
  `platform` varchar(100) DEFAULT NULL COMMENT '常常出现的媒体平台',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `userflock` */

insert  into `userflock`(`name`,`feature`,`platform`) values ('孕妇','刷平台时间多、基数大','今日头条;'),('少妇','刷平台时间多、基数大','今日头条;'),('屌丝','刷平台时间多、购买力小、基数大','今日头条;');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
