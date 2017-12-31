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

insert  into `envelope`(`wishCode`,`receiveMan`,`envelopeAim`,`sendMan`,`dearMan`,`message`,`stamp`,`sendManEmail`,`receiveManEmail`) values ('Best Wish To FireLang','胡大宝','愿成为Better me','Joy仙女','最最最努力的胡艺宝同学','最近真的因为很多事情好忙好忙,所以拖到现在才给你写这封信,不得不说,这个网站做的真的棒棒棒,让我感受到了一个技术宅的爱哈哈,换句话来说,有技术的人,真的是可怕哈哈\n    很感谢你送给我的生日礼物,真心的,因为能感受到你的用心,毕竟你也是记住了我喜欢吃的东西,我很感谢你对我的用心,我也希望你能把对我的这份热情,把他放在其他方面上去,那你肯定也真的能成为一个很厉害的人了,毕竟凡事最怕的就是用心了,对了,写到这里, 我发现了一个不太好的用户体验,为啥不能插入图片那些呢哈哈哈哈,你可以考虑把这个功能加进去\n   我是真的很不爽  我本来早就可以给你写这封信的\n   但是却拖到了今天  so不好意思  哎让我从头开始又写,其实我真的很不爽\n    我感觉真的就像写作文一样,没办法写出两篇同样的作文一样,感觉写过的话再让我重新写真的感觉很困难\n    我也不知道应该如何开头,我一直觉得你是一个很努力的男生,有自己的目标,有自己的理想,尽管有时候我觉得你有一点轴还有一点不讲道理,不,应该是很不讲道理,我有时候真心不知道我那句话又会把你惹生气,哈哈哈哈对你像个小女孩一样爱生气哦哈哈  有时候我觉得在你眼中,我说什么都是错的一样,你觉得我好像总是很有针对性的说你,但其实我想说我真的很少那个样子做,我有时候说话真的蛮单纯的,说什么就是什么  没有其他的花花肠子  但是你可能会想的很复杂,所以我希望你真心不要想太多,因为人一旦想太多,对自己不好,对他人也不好,我很希望你能成为一个Better man,但是一个Better man   但是一个better man 绝对不止只是学习厉害的人哦\n而是各方面都超级厉害的人,  我很欣赏你的自制能力和你的努力程度,我前段时间还因为你说你不想回家过年,而站在所谓的道德制高点去说你,现在我觉得我有点不对,因为我想你肯定没有你非要回家的理由, 也有自己的理由,因为你想乘着过年的时候好好努力,毕竟我知道你老家的环境是没办法让你好好学习的,所以我觉得你现在要是还是那个想法,那么你就go head  跟着自己的心去做吧\n    我们认识也不算特别久, 你以前给我的印象就是是一个很热情的人,因为感觉每次在学校碰到你,,你都非常热情的喊我名字,  可能是因为很少人会叫我全名 所以我对此印象还蛮深刻的吧哈哈哈哈哈\n   再然后因为我们经常在图书馆相遇,  所以就熟悉了, 你是我大学里认识的最努力,我觉得你是一个很有目标的人,并且有目标就会去实现的人哈哈,我觉得实训的时候, 你对我的帮助远远大于你所说的我对你的帮助   毕竟你的形象在我心中一直都是那种大神形象\n  每次当我找不到工作给你吐槽的时候,你都会安慰我, 给我说让我别放弃之类的,所以我觉得我现在的成功有你的很大帮助哈哈哈,所以你是我的良师,更是我的益友,(ps:如果你真的少气我的话,会更好的)     \n      我只是我也不是一个很完美的人,我有时候脾气不太好,也有点固执,所以可能也会有伤害你的地方,在此\n先给你说一声抱歉,如果我以前真的有很伤害你的地方的话,我最近也很忙,也没啥时间去聊天之类的,我知道你也很忙,所以我觉得这样的状态挺好的,你做你的事情 我做我的事情,各自忙各自的,各自都在往自己想要成为的那种人的方向去努力着, \n   我也希望你的愿望成真,你能找到你的right girl  能在事业上和生活上都有所收获  这次我就先说到这里哦,如果以后有时间,我会有想分享的事情的时候  会继续给你写的哈哈  到时候可不要嫌我烦,我要下班了哈哈哈,一周总是过去的那么的快,希望以后你的每个周末也能像我这周过的一样充实又有意义,在此,送你一句毒鸡汤,我一直想要成为一个更好的人，更上进，更发奋，更聪明，更努力，更有志气，更能吃苦，更坚忍不拔，也更健康和苗条; 可是，每次吃饱肚子我都很想睡觉，然后跟自己说: 我等到明天再成为更好的人。\n  哈哈哈哈哈,我希望你也不要成为一个等到明天更好的人\n                                                                                                  祝:天天开心   身体健康\n\n                                                      From: 你见过最漂亮的小仙女哈哈哈哈(ps:不接受反驳)',NULL,'871513700@qq.com','1428384239@qq.com'),('Best Wish To Joy','杨舒粤(Joy)','Happy Birthday','胡艺宝(MoonFollow)','漂亮得能让世界毁灭的菇凉','    这是我第一次为女生准备生日礼物，很高兴听见你说你喜欢，生日快乐~~~\n\n    我们大学读书有两年半，但是真正认识并且聊天的时间只有7个月。时间虽然很少，但是，就是这么点时间，却给我生命带来了很多的成长。真的发自内心，非常的感谢你！！！\n    大一我进大学，我就抱着这必将是孤独旅程的觉悟在学习，虽然给我带来了不少专业上的知识长进，但是对我的内心以及在现实中跟别人交流带来了很大的障碍，特别是对于女生。这种障碍随着时间的推移愈发的不可忽视。在大二上期的一段时间，我同床铺的那个哥们，每天都在把不同的妹子，一天晚上，我学习完回寝室，那哥们说要跟别人打比赛，让我帮他跟新加的一个妹子聊。这在对我初中和高中来说，真的是小 case，但是在这一刻我却没办法跟女生进行正常交谈，我只感觉世界都是灰暗的。\n    我当时聊天就问她这样，问她那样，像调查户口一样。糟糕到了这种地步。瞬间体会到了什么叫绝望——终。\n    另外，我也明白了一个词语叫“自卑”，在一个月前，我不觉得我是一个自卑的人。这也印证了那句话，很多时候自己是看不到自己的缺点的。就像程序员很多时候都认为自己写的程序是无懈可击的，是世界上最 \"屌\" 的。但是，你让我深刻的体会到我内心深处是存在自卑的，并且也深刻认识到，这个缺点绝对不是男人应该有的东西。不然怎么去守护一个家。别人怎么会瞧得起自己。\n    说起 \"自卑\" 另外一个东西叫做 \"自信\"。一个月前，我才发现，我是很缺少自信的，在之前我绝对因为这两个缺点失去了不少珍贵的东西。现在我不想再因为这两个缺点失去东西了。那样真的对我很不公平。\n    面对汹涌而来的现实，有时候真的会让人感到自己很渺小、很无力。有时候还会让人觉得灰心。但这也是生命的一部分，永远不要 \"自卑\" ，永远不要失去 \"自信\"。因为有困难所以才要去挑战，人生才有意义，这样才会超越其他人，才不会变得平庸，So 为什么要失去自信？\n    这个过程会很痛，会很辛苦，但总有一天你将破蛹而出，成长得比人们期待得还要美丽。因为有痛才会成长，不要害怕。\n\n——————————————————————————————————————\n\n    我感觉，我说了很多废话啊，hahaha。这个Web是我花了几天时间专门为你准备的，昨晚还 4:52 才睡觉的。嘿嘿~~~喜欢吗？？\n\n    我很想，你能通过这个WebKit给我回信~~~~\n\n    最后的最后，再次给你祝福，生日快乐，你是我人生见过最漂亮最勤奋的一个女孩子，你的人生绝对不会差，如果发达了，记得带上我哦~~~嘿嘿嘿。\n\n    还有还有，我已经把  你说要请我吃最贵的肉截图了，嘿嘿嘿，记得单独请我~~~别食言了。不然我会很伤心的。\n\n\n    生日快乐！！！！\n\n\n\n\n                                                          永远支持你的傻宝\n\n\n                                                           2017/11/6 晚\n\n\n\n',NULL,'1428384239@qq.com','yangshuyue17@qq.com'),('愿成为世界上最漂亮的女孩子','陶源','Better 陶源','胡海龙','温柔可爱的陶源','陶源小妹妹，生日快乐！\n    跟你相处这一段时间，你让我感觉到你是一个很坚强、很独立、做事很认真、专一的女孩子。我们天隔一方、路途遥远，但也不影响我对你温暖的传递，让这个冬天不再那么寒冷。\n    我多么希望是你的手机，每天接受你含情脉脉的目光；我多么希望是你的键盘，每天承受你指尖的跳动！\n    自己一个人在家的时候好好照顾自己，早上起来的时候注意点，别感冒了。晚上早点睡觉，别熬夜到十一二点。\n    最后，真诚的祝福你~~~~~生日快乐！！！今天晚上，我陪你！！！\n\n\n\n                                                           胡海龙\n                                                           2017/12/19 22:00',NULL,'3047477226@qq.com','3322048441@qq.com');

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

insert  into `envelopereaddetaillog`(`ID`,`IP`,`wishCode`,`time`) values ('06e14bc5-e4ce-11e7-bcd4-525400053676','139.207.181.5','愿成为世界上最漂亮的女孩子','2017-12-19 23:05:18'),('3fa8638e-e4ce-11e7-bcd4-525400053676','42.92.101.150','愿成为世界上最漂亮的女孩子','2017-12-19 23:06:54'),('9ef53cb8-cbbb-11e7-9022-525400053676','171.210.232.109','Best Wish To FireLang','2017-11-18 01:20:34'),('d712ea9f-cb74-11e7-9022-525400053676','222.212.204.75','Best Wish To FireLang','2017-11-17 16:53:54'),('e8004ba4-e4dc-11e7-bcd4-525400053676','139.207.181.5','愿成为世界上最漂亮的女孩子','2017-12-20 00:51:49'),('f7659014-c483-11e7-b192-52540003f87b','171.210.187.141','Best Wish To Joy','2017-11-08 20:54:34');

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

insert  into `envelopereadlog`(`ID`,`IP`,`readCount`,`wishCode`) values ('06d22fac-e4ce-11e7-bcd4-525400053676','139.207.181.5',2,'愿成为世界上最漂亮的女孩子'),('252f8952-c47e-11e7-b192-52540003f87b','171.210.187.141',2,'Best Wish To Joy'),('3fa64b1f-e4ce-11e7-bcd4-525400053676','42.92.101.150',1,'愿成为世界上最漂亮的女孩子'),('7e5327ef-c357-11e7-b192-52540003f87b','222.212.202.226',3,'Best Wish To Joy'),('9eee5e61-cbbb-11e7-9022-525400053676','171.210.232.109',1,'Best Wish To FireLang'),('d70828a9-cb74-11e7-9022-525400053676','222.212.204.75',1,'Best Wish To FireLang');

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
  `ip` char(16) NOT NULL COMMENT 'ip address',
  `count` int(11) NOT NULL COMMENT 'count number',
  PRIMARY KEY (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `luckmoneylog` */

insert  into `luckmoneylog`(`ip`,`count`) values ('101.226.102.97',1),('101.226.33.200',1),('101.226.33.219',1),('101.226.64.174',1),('106.120.173.78',1),('111.205.112.101',1),('112.101.176.113',1),('112.65.193.14',1),('112.90.82.196',2),('112.90.82.218',2),('113.108.21.80',1),('117.136.75.99',1),('117.181.49.250',1),('118.113.89.16',1),('118.113.89.18',4),('119.147.207.152',1),('119.185.68.149',1),('121.31.250.15',1),('123.125.71.95',1),('125.46.204.132',1),('139.207.54.199',1),('14.17.21.58',2),('150.70.188.177',1),('171.210.194.95',1),('171.220.55.125',1),('180.153.236.101',1),('182.105.80.27',1),('182.144.47.56',1),('182.150.141.68',1),('183.56.166.228',1),('183.57.53.177',1),('183.57.53.197',1),('203.208.60.139',2),('219.146.91.114',1),('220.181.125.179',4),('220.202.152.89',1),('223.104.10.122',1),('223.104.10.27',1),('223.87.33.46',1),('39.159.244.144',1),('42.236.10.75',1),('51.255.65.19',1),('54.157.109.248',2),('54.36.148.147',1),('58.246.221.73',1),('58.247.212.139',1),('58.247.212.98',1),('59.175.21.31',1),('61.129.6.151',1),('61.129.8.203',1);

/*Table structure for table `music` */

DROP TABLE IF EXISTS `music`;

CREATE TABLE `music` (
  `name` char(100) NOT NULL COMMENT '歌曲名称',
  `uploadRemoteIP` char(16) NOT NULL COMMENT '上传歌曲远程IP',
  `uploadTime` datetime NOT NULL COMMENT '上传歌曲时间',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `music` */

insert  into `music`(`name`,`uploadRemoteIP`,`uploadTime`) values ('Approaching Nirvana-You.mp3','118.113.89.17','2017-12-15 02:12:24'),('Blackmill-Spirit Of Life.mp3','139.207.183.193','2017-11-30 23:16:41'),('Janji-Johnning-Heroes Tonight.mp3','118.113.89.16','2017-12-17 20:35:21'),('OMFG;Ephixa-Nope (Ephixa Remix).mp3','118.113.89.18','2017-12-08 20:47:13'),('Pasteboard-squall.mp3','139.207.183.193','2017-11-30 19:54:20'),('Ronald Jenkees-Guitar Sound.mp3','118.113.89.16','2017-12-17 20:15:16'),('The Rootless-One day.mp3','139.207.183.193','2017-11-30 19:54:07'),('TheFatRat-Time Lapse.mp3','171.210.228.17','2017-12-01 11:49:35'),('Vexento-Everybody (Vexento Remix).mp3','118.113.89.17','2017-12-26 15:04:26'),('【神舞幻想】主题曲 天咏 男声ver[高清版].mp3','118.113.89.17','2017-12-21 15:40:04'),('蓑部雄崇 - 游星テーマ.mp3','118.113.89.17','2017-12-01 00:30:33'),('超特急 - Burn!.mp3','118.113.89.18','2017-12-02 01:35:47'),('逃跑计划 - 夜空中最亮的星.mp3','139.207.183.193','2017-11-30 19:53:26'),('遠藤正明 - Clear Mind.mp3','118.113.89.17','2017-12-01 01:09:57');

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
