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

/*Table structure for table `emp` */

DROP TABLE IF EXISTS `emp`;

CREATE TABLE `emp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `emp` */

insert  into `emp`(`id`) values (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14);

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

insert  into `envelope`(`wishCode`,`receiveMan`,`envelopeAim`,`sendMan`,`dearMan`,`message`,`stamp`,`sendManEmail`,`receiveManEmail`) values ('asdfasd','asdfa','dfadsfs','asdfasd','sadf','asdfsda',NULL,'sdf@qq.com','sdf@c.com'),('Best Wish To Joy','杨舒粤(Joy)','Happy Birthday','胡艺宝(MoonFollow)','漂亮得能让世界毁灭的菇凉','这是我第一次为女生准备生日礼物，很高兴听见你说你喜欢，生日快乐~~~\n\n    我们大学读书有两年半，但是真正认识并且聊天的时间只有7个月。时间虽然很少，但是，就是这么点时间，却给我生命带来了很多的成长。真的发自内心，非常的感谢你！！！\n    大一我进大学，我就抱着这必将是孤独旅程的觉悟在学习，虽然给我带来了不少专业上的知识长进，但是对我的内心以及在现实中跟别人交流带来了很大的障碍，特别是对于女生。这种障碍随着时间的推移愈发的不可忽视。在大二上期的一段时间，我同床铺的那个哥们，每天都在把不同的妹子，一天晚上，我学习完回寝室，那哥们说要跟别人打比赛，让我帮他跟新加的一个妹子聊。这在对我初中和高中来说，真的是小 case，但是在这一刻我却没办法跟女生进行正常交谈，我只感觉世界都是灰暗的。\n    我当时聊天就问她这样，问她那样，像调查户口一样。糟糕到了这种地步。瞬间体会到了什么叫绝望——终。\n    另外，我也明白了一个词语叫“自卑”，在一个月前，我不觉得我是一个自卑的人。这也印证了那句话，很多时候自己是看不到自己的缺点的。就像程序员很多时候都认为自己写的程序是无懈可击的，是世界上最 \"屌\" 的。但是，你让我深刻的体会到我内心深处是存在自卑的，并且也深刻认识到，这个缺点绝对不是男人应该有的东西。不然怎么去守护一个家。别人怎么会瞧得起自己。\n    说起 \"自卑\" 另外一个东西叫做 \"自信\"。一个月前，我才发现，我是很缺少自信的，在之前我绝对因为这两个缺点失去了不少珍贵的东西。现在我不想再因为这两个缺点失去东西了。那样真的对我很不公平。\n    面对汹涌而来的现实，有时候真的会让人感到自己很渺小、很无力。有时候还会让人觉得灰心。但这也是生命的一部分，永远不要 \"自卑\" ，永远不要失去 \"自信\"。因为有困难所以才要去挑战，人生才有意义，这样才会超越其他人，才不会变得平庸，So 为什么要失去自信？\n    这个过程会很痛，会很辛苦，但总有一天你将破蛹而出，成长得比人们期待得还要美丽。因为有痛才会成长，不要害怕。\n\n——————————————————————————————————————\n\n    我感觉，我说了很多废话啊，hahaha。这个Web是我花了几天时间专门为你准备的，昨晚还 4:52 才睡觉的。嘿嘿~~~喜欢吗？？\n\n    我很想，你能通过这个WebKit给我回信~~~~\n\n    最后的最后，再次给你祝福，生日快乐，你是我人生见过最漂亮最勤奋的一个女孩子，你的人生绝对不会差，如果发达了，记得带上我哦~~~嘿嘿嘿。\n\n    还有还有，我已经把  你说要请我吃最贵的肉截图了，嘿嘿嘿，记得单独请我~~~别食言了。不然我会很伤心的。\n\n\n    生日快乐！！！！\n\n\n\n\n                                                          永远支持你的傻宝\n\n\n                                                           2017/11/6 晚',NULL,'1428384239@qq.com','1428384239@qq.com'),('CCC','SADFSD','FSDF','SDAFDS','ASDFDASF','DSAFDASF',NULL,'1428384239@qq.com','1428384239@qq.com'),('TEST01','TT','TT','TT','TT','TT',NULL,'1428384239@qq.com','1428384239@qq.com');

/*Table structure for table `envelopereaddetaillog` */

DROP TABLE IF EXISTS `envelopereaddetaillog`;

CREATE TABLE `envelopereaddetaillog` (
  `ID` char(36) NOT NULL,
  `IP` char(30) NOT NULL COMMENT '远程IP',
  `wishCode` char(50) NOT NULL COMMENT '祝福码',
  `time` datetime NOT NULL COMMENT '阅读时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `envelopereaddetaillog` */

insert  into `envelopereaddetaillog`(`ID`,`IP`,`wishCode`,`time`) values ('6c7fce00-c482-11e7-bc8b-1cb72c2f3c53','0:0:0:0:0:0:0:1','Best Wish To Joy','2017-11-08 20:43:26');

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

insert  into `envelopereadlog`(`ID`,`IP`,`readCount`,`wishCode`) values ('c7e3dfef-c349-11e7-bc8b-1cb72c2f3c53','0:0:0:0:0:0:0:1',13,'Best Wish To Joy'),('f6908d71-c35d-11e7-bc8b-1cb72c2f3c53','0:0:0:0:0:0:0:1',2,'TEST01');

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

/*Table structure for table `luckmoneylog` */

DROP TABLE IF EXISTS `luckmoneylog`;

CREATE TABLE `luckmoneylog` (
  `ip` char(16) NOT NULL COMMENT 'IP地址',
  `count` int(11) NOT NULL COMMENT '访问次数',
  PRIMARY KEY (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `luckmoneylog` */

insert  into `luckmoneylog`(`ip`,`count`) values ('127.0.0.1',2);

/*Table structure for table `music` */

DROP TABLE IF EXISTS `music`;

CREATE TABLE `music` (
  `name` char(36) NOT NULL COMMENT '歌曲名称',
  `uploadRemoteIP` char(16) NOT NULL COMMENT '上传歌曲远程IP',
  `uploadTime` datetime NOT NULL COMMENT '上传歌曲时间',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `music` */

insert  into `music`(`name`,`uploadRemoteIP`,`uploadTime`) values ('Pasteboard-squall.mp3','0:0:0:0:0:0:0:1','2017-11-30 22:24:06'),('The Rootless-One day.mp3','0:0:0:0:0:0:0:1','2017-11-30 22:23:55'),('逃跑计划 - 夜空中最亮的星.mp3','0:0:0:0:0:0:0:1','2017-11-30 22:24:01');

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

/*Table structure for table `rsa_user` */

DROP TABLE IF EXISTS `rsa_user`;

CREATE TABLE `rsa_user` (
  `username` char(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `initSalt` char(30) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `rsa_user` */

insert  into `rsa_user`(`username`,`password`,`initSalt`) values ('jiayuan','$2a$12$jyGyh4GYMeQWkL.umZd49OyuEOjm9mSKiDRD8SUUYo5HprRbiKhn6','Kq;DUYZW6W'),('lang','$2a$12$1tkV9y63og07aIyBaKisvuXKwNpFz33at5bjU6K7Pivgxk9NArymG','gUOkTa&*I+'),('username','$2a$12$mst.8P4UAjZsn5IHS4pdh.PZOqY4oRBfRpLZRz1qNZ3/1b4LbAXBu','=YBO_Ozl%h'),('xiao','$2a$12$szrEPgzdnFu0LhNZxqPE2.UsweHq275nP4Im91raaPz2f78.lN.rK',')dSw2.,F>='),('xiaomei','$2a$12$8WvcgxQFau8vn5rvJzN1VO9oCzIlszmKc7ziQ34A5dZ0vZbfkU.Ju','59D6q3cIa!'),('xiaotian','$2a$12$n/3uD3ufnP28EPVMgWArFeTBdUeBK5mZqazHfrdYFFcXLCpos3drq',')dSw2.,F>='),('xiaoxiao','$2a$12$UG2uYbkN6m4U5muTnraTi.5tE2dJnlLThsmX5oewoQsmSzUwpxhy.','STYEPSc(7X');

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
