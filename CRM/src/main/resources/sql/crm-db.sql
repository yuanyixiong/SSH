# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.11)
# Database: qsx_crm
# Generation Time: 2017-03-13 04:04:12 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table qsx_campaign
# ------------------------------------------------------------

DROP TABLE IF EXISTS `qsx_campaign`;

CREATE TABLE `qsx_campaign` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '营销活动id',
  `code` varchar(50) DEFAULT NULL COMMENT '编码',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `user_id` bigint(20) DEFAULT NULL COMMENT '负责人id',
  `status_code` varchar(255) DEFAULT NULL COMMENT '状态',
  `type_code` varchar(255) DEFAULT NULL COMMENT '营销活动类型',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品id',
  `endDate` date DEFAULT NULL COMMENT '预期结束日期',
  `quantity` int(11) DEFAULT NULL COMMENT '发送数量',
  `instruction` text COMMENT '说明',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `FK_qsx_campaign_qsx_user` (`user_id`),
  KEY `FK_qsx_campaign_qsx_product` (`product_id`),
  KEY `FK_qsx_campaign_qsx_dictionary` (`status_code`),
  KEY `FK_qsx_campaign_qsx_dictionary_2` (`type_code`),
  CONSTRAINT `FK_qsx_campaign_qsx_dictionary` FOREIGN KEY (`status_code`) REFERENCES `qsx_dictionary` (`code`),
  CONSTRAINT `FK_qsx_campaign_qsx_dictionary_2` FOREIGN KEY (`type_code`) REFERENCES `qsx_dictionary` (`code`),
  CONSTRAINT `FK_qsx_campaign_qsx_product` FOREIGN KEY (`product_id`) REFERENCES `qsx_product` (`id`),
  CONSTRAINT `FK_qsx_campaign_qsx_user` FOREIGN KEY (`user_id`) REFERENCES `qsx_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='营销活动';

LOCK TABLES `qsx_campaign` WRITE;
/*!40000 ALTER TABLE `qsx_campaign` DISABLE KEYS */;

INSERT INTO `qsx_campaign` (`id`, `code`, `name`, `user_id`, `status_code`, `type_code`, `product_id`, `endDate`, `quantity`, `instruction`, `createTime`, `updateTime`)
VALUES
	(5,'CAM1488873256775','小米电视、盒子免费看奥斯卡获奖影片！',33,'CAMPAIGN_Planing','CAMPAIGN_Email',37,'2017-03-31',2000,'   第89届奥斯卡，落下了帷幕。有众多影片获奖，然而并没有中国的影片荣获殊荣！但是成龙获得了了终身成就奖也是可喜可贺的！小伙伴们，如何才能第一时间，在小米电视上收看到奥斯卡获奖影片呢？我就来教大家来看电影!','2017-03-07 15:43:46','2017-03-07 15:54:16'),
	(6,'CAM1488873333625','小米电视限时特惠-直降300',33,'CAMPAIGN_Started','CAMPAIGN_Email',36,'2017-03-11',1000,'小米电视3s 60英寸 4699元 装LG 4K IPS硬屏，超薄金属机身杜比和DTS音效双解码，内置海量影视内容','2017-03-07 15:54:23','2017-03-07 15:55:33'),
	(7,'CAM1488873442844','喜迎MIUI 8.2重大更新，升级送福利！',34,'CAMPAIGN_Finished','CAMPAIGN_Net',34,'2017-03-07',100,'MIUI第六个稳定版本发布啦！你是否升级到了最新的MIUI 8.2呢？是否体验到了这些全新的变化和功能呢？现在晒出你的MIUI8.2 系统截图，即可参与抢楼，赢取好礼！','2017-03-07 15:55:35','2017-03-07 15:57:22'),
	(8,'CAM1488873538786','试玩平衡车--让每一次出发，都成为一种期待',33,'CAMPAIGN_Stoped','CAMPAIGN_Other',43,'2017-04-01',1,'线下活动，小米之家举办试玩平衡车','2017-03-07 15:57:38','2017-03-07 15:58:58'),
	(9,'CAM1488873629925','小米笔记本Air3新品发布会',34,'CAMPAIGN_Started','CAMPAIGN_Workshop',35,'2017-03-08',1,'现场发布会','2017-03-07 15:59:02','2017-03-07 16:00:29'),
	(10,'CAM1488873714044','小白智能摄像机 大声说出你的爱',32,'CAMPAIGN_Finished','CAMPAIGN_Telemarketing',41,'2017-02-14',3000,'爱就要？ “大声说出来！” 情人节将至 这个情人节你准备和另一半甜蜜的过，还是和家中的小情人温情的过呢？爱TA就把要用行动告诉TA！快点行动起来吧！','2017-03-07 16:00:36','2017-03-07 16:01:54'),
	(11,'CAM1488873799458','你家水质怎么样？小米净水器2017水质大数据出炉',34,'CAMPAIGN_Planing','CAMPAIGN_Email',42,'2017-04-08',3000,'小米净水器发布全国水质大数据啦！全国各地区水质各不一样，有人说，北方水垢特别严重；有人说，南方水质抗生素污染不可避免。自小米净水器上市至今，小米净水器已掌握了全国13.43亿条水质大数据。快来看看你的城市水质怎么样吧！','2017-03-07 16:02:00','2017-03-07 16:03:19'),
	(12,'CAM1488873867146','你和九号平衡车去过哪些地方？分享赢取出行套装！',1,'CAMPAIGN_Planing','CAMPAIGN_Net',43,'2018-03-07',1200,'2016已经结束了，这一年，你带着轮子走过了哪些地方，遇到了哪些人？又发生了哪些让你铭记的事情呢？未曾到达的地方都叫远方，走过的路都将变成你的记忆。来小米社区和我们分享你2016年和平衡车一起留下的记忆，赢取随身出行套装！','2017-03-07 16:03:47','2017-03-07 16:04:27'),
	(13,'CAM1488873945108','小米净水器双12终极购买攻略',32,'CAMPAIGN_Started','CAMPAIGN_Telemarketing',42,'2017-12-12',1000,'剁手补刀的双12即将要拉开帷幕了，上个月的今天到现在，大家的手好了吧？今天，小米净水器当然不能错过这个“买、买、买”大潮啦！快往下滑，看看这个双12，小米净水器带给你的不同感受吧！','2017-03-07 16:04:30','2017-03-07 16:05:45'),
	(14,'CAM1488874015850','6大升级 小米平板3s震撼发布',33,'CAMPAIGN_Started','CAMPAIGN_Workshop',32,'2018-04-07',120,'发布会','2017-03-07 16:05:47','2017-03-07 16:06:55'),
	(15,'CAM1488874097965','米兔儿童手表免费领用',33,'CAMPAIGN_Planing','CAMPAIGN_Net',40,'2017-03-10',100,'小米众测 第35期「米兔手表」众测进行时，米粉们赶紧动手吧！回复本帖告诉我们你将如何评测，就有机会优先享有资格哦~','2017-03-07 16:06:57','2017-03-07 16:08:17'),
	(16,'CAM1488966025938','小米电视3s 65英寸免费申请试用',30,'CAMPAIGN_Planing','CAMPAIGN_Email',36,'2017-03-10',10,'','2017-03-08 17:39:52','2017-03-08 17:40:25');

/*!40000 ALTER TABLE `qsx_campaign` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table qsx_city
# ------------------------------------------------------------

DROP TABLE IF EXISTS `qsx_city`;

CREATE TABLE `qsx_city` (
  `code` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `province_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`code`),
  KEY `FK700049747EA546F8` (`province_code`),
  CONSTRAINT `FK700049747EA546F8` FOREIGN KEY (`province_code`) REFERENCES `qsx_province` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `qsx_city` WRITE;
/*!40000 ALTER TABLE `qsx_city` DISABLE KEYS */;

INSERT INTO `qsx_city` (`code`, `name`, `province_code`)
VALUES
	('七台河市','七台河市','黑龙江'),
	('三亚市','三亚市','海南'),
	('三明市','三明市','福建'),
	('三门峡市','三门峡市','河南'),
	('上海市','上海市','上海'),
	('上饶市','上饶市','江西'),
	('东莞市','东莞市','广东'),
	('东营市','东营市','山东'),
	('中卫市','中卫市','宁夏'),
	('中山市','中山市','广东'),
	('临夏回族自治州','临夏回族自治州','甘肃'),
	('临汾市','临汾市','山西'),
	('临沂市','临沂市','山东'),
	('临沧市','临沧市','云南'),
	('丹东市','丹东市','辽宁'),
	('丽水市','丽水市','浙江'),
	('丽江市','丽江市','云南'),
	('乌兰察布市','乌兰察布市','内蒙古'),
	('乌海市','乌海市','内蒙古'),
	('乐山市','乐山市','四川'),
	('九江市','九江市','江西'),
	('云浮市','云浮市','广东'),
	('亳州市','亳州市','安徽'),
	('伊春市','伊春市','黑龙江'),
	('伊犁哈萨克自治州','伊犁哈萨克自治州','新疆'),
	('佛山市','佛山市','广东'),
	('佳木斯市','佳木斯市','黑龙江'),
	('保定市','保定市','河北'),
	('保山市','保山市','云南'),
	('信阳市','信阳市','河南'),
	('克孜勒苏柯尔克孜自治州','克孜勒苏柯尔克孜自治州','新疆'),
	('克拉玛依市','克拉玛依市','新疆'),
	('六安市','六安市','安徽'),
	('六盘水市','六盘水市','贵州'),
	('兰州市','兰州市','甘肃'),
	('兴安盟','兴安盟','内蒙古'),
	('内江市','内江市','四川'),
	('凉山彝族自治州','凉山彝族自治州','四川'),
	('包头市','包头市','内蒙古'),
	('北京市','北京市','北京'),
	('北海市','北海市','广西'),
	('十堰市','十堰市','湖北'),
	('南京市','南京市','江苏'),
	('南充市','南充市','四川'),
	('南宁市','南宁市','广西'),
	('南平市','南平市','福建'),
	('南昌市','南昌市','江西'),
	('南通市','南通市','江苏'),
	('南阳市','南阳市','河南'),
	('博尔塔拉蒙古自治州','博尔塔拉蒙古自治州','新疆'),
	('厦门市','厦门市','福建'),
	('双鸭山市','双鸭山市','黑龙江'),
	('台州市','台州市','浙江'),
	('台湾','台湾','台湾省'),
	('合肥市','合肥市','安徽'),
	('吉安市','吉安市','江西'),
	('吉林市','吉林市','吉林'),
	('吐鲁番地区','吐鲁番地区','新疆'),
	('吕梁市','吕梁市','山西'),
	('吴忠市','吴忠市','宁夏'),
	('周口市','周口市','河南'),
	('呼伦贝尔市','呼伦贝尔市','内蒙古'),
	('呼和浩特市','呼和浩特市','内蒙古'),
	('和田地区','和田地区','新疆'),
	('咸宁市','咸宁市','湖北'),
	('咸阳市','咸阳市','陕西'),
	('哈密地区','哈密地区','新疆'),
	('哈尔滨市','哈尔滨市','黑龙江'),
	('唐山市','唐山市','河北'),
	('商丘市','商丘市','河南'),
	('商洛市','商洛市','陕西'),
	('喀什地区','喀什地区','新疆'),
	('嘉兴市','嘉兴市','浙江'),
	('嘉峪关市','嘉峪关市','甘肃'),
	('四平市','四平市','吉林'),
	('固原市','固原市','宁夏'),
	('塔城地区','塔城地区','新疆'),
	('大兴安岭地区','大兴安岭地区','黑龙江'),
	('大同市','大同市','山西'),
	('大庆市','大庆市','黑龙江'),
	('大理白族自治州','大理白族自治州','云南'),
	('大连市','大连市','辽宁'),
	('天水市','天水市','甘肃'),
	('天津市','天津市','天津'),
	('太原市','太原市','山西'),
	('威海市','威海市','山东'),
	('娄底市','娄底市','湖南'),
	('孝感市','孝感市','湖北'),
	('宁德市','宁德市','福建'),
	('宁波市','宁波市','浙江'),
	('安庆市','安庆市','安徽'),
	('安康市','安康市','陕西'),
	('安阳市','安阳市','河南'),
	('安顺市','安顺市','贵州'),
	('定西市','定西市','甘肃'),
	('宜宾市','宜宾市','四川'),
	('宜昌市','宜昌市','湖北'),
	('宜春市','宜春市','江西'),
	('宝鸡市','宝鸡市','陕西'),
	('宣城市','宣城市','安徽'),
	('宿州市','宿州市','安徽'),
	('宿迁市','宿迁市','江苏'),
	('山南地区','山南地区','西藏'),
	('岳阳市','岳阳市','湖南'),
	('崇左市','崇左市','广西'),
	('巢湖市','巢湖市','安徽'),
	('巴中市','巴中市','四川'),
	('巴彦淖尔市','巴彦淖尔市','内蒙古'),
	('巴音郭楞蒙古自治州','巴音郭楞蒙古自治州','新疆'),
	('常州市','常州市','江苏'),
	('常德市','常德市','湖南'),
	('平凉市','平凉市','甘肃'),
	('平顶山市','平顶山市','河南'),
	('广元市','广元市','四川'),
	('广安市','广安市','四川'),
	('广州市','广州市','广东'),
	('庆阳市','庆阳市','甘肃'),
	('廊坊市','廊坊市','河北'),
	('延安市','延安市','陕西'),
	('延边朝鲜族自治州','延边朝鲜族自治州','吉林'),
	('开封市','开封市','河南'),
	('张家口市','张家口市','河北'),
	('张家界市','张家界市','湖南'),
	('张掖市','张掖市','甘肃'),
	('徐州市','徐州市','江苏'),
	('德宏傣族景颇族自治州','德宏傣族景颇族自治州','云南'),
	('德州市','德州市','山东'),
	('德阳市','德阳市','四川'),
	('忻州市','忻州市','山西'),
	('怀化市','怀化市','湖南'),
	('怒江傈僳族自治州','怒江傈僳族自治州','云南'),
	('恩施土家族苗族自治州','恩施土家族苗族自治州','湖北'),
	('惠州市','惠州市','广东'),
	('成都市','成都市','四川'),
	('扬州市','扬州市','江苏'),
	('承德市','承德市','河北'),
	('抚州市','抚州市','江西'),
	('抚顺市','抚顺市','辽宁'),
	('拉萨市','拉萨市','西藏'),
	('揭阳市','揭阳市','广东'),
	('攀枝花市','攀枝花市','四川'),
	('文山壮族苗族自治州','文山壮族苗族自治州','云南'),
	('新乡市','新乡市','河南'),
	('新余市','新余市','江西'),
	('无锡市','无锡市','江苏'),
	('日喀则地区','日喀则地区','西藏'),
	('日照市','日照市','山东'),
	('昆明市','昆明市','云南'),
	('昌吉回族自治州','昌吉回族自治州','新疆'),
	('昌都地区','昌都地区','西藏'),
	('昭通市','昭通市','云南'),
	('晋中市','晋中市','山西'),
	('晋城市','晋城市','山西'),
	('普洱市','普洱市','云南'),
	('景德镇市','景德镇市','江西'),
	('曲靖市','曲靖市','云南'),
	('朔州市','朔州市','山西'),
	('朝阳市','朝阳市','辽宁'),
	('本溪市','本溪市','辽宁'),
	('来宾市','来宾市','广西'),
	('杭州市','杭州市','浙江'),
	('松原市','松原市','吉林'),
	('林芝地区','林芝地区','西藏'),
	('果洛藏族自治州','果洛藏族自治州','青海'),
	('枣庄市','枣庄市','山东'),
	('柳州市','柳州市','广西'),
	('株洲市','株洲市','湖南'),
	('桂林市','桂林市','广西'),
	('梅州市','梅州市','广东'),
	('梧州市','梧州市','广西'),
	('楚雄彝族自治州','楚雄彝族自治州','云南'),
	('榆林市','榆林市','陕西'),
	('武威市','武威市','甘肃'),
	('武汉市','武汉市','湖北'),
	('毕节地区','毕节地区','贵州'),
	('永州市','永州市','湖南'),
	('汉中市','汉中市','陕西'),
	('汕头市','汕头市','广东'),
	('汕尾市','汕尾市','广东'),
	('江门市','江门市','广东'),
	('池州市','池州市','安徽'),
	('沈阳市','沈阳市','辽宁'),
	('沧州市','沧州市','河北'),
	('河池市','河池市','广西'),
	('河源市','河源市','广东'),
	('泉州市','泉州市','福建'),
	('泰安市','泰安市','山东'),
	('泰州市','泰州市','江苏'),
	('泸州市','泸州市','四川'),
	('洛阳市','洛阳市','河南'),
	('济南市','济南市','山东'),
	('济宁市','济宁市','山东'),
	('济源市','济源市','河南'),
	('海东地区','海东地区','青海'),
	('海北藏族自治州','海北藏族自治州','青海'),
	('海南藏族自治州','海南藏族自治州','青海'),
	('海口市','海口市','海南'),
	('海西蒙古族藏族自治州','海西蒙古族藏族自治州','青海'),
	('淄博市','淄博市','山东'),
	('淮北市','淮北市','安徽'),
	('淮南市','淮南市','安徽'),
	('淮安市','淮安市','江苏'),
	('深圳市','深圳市','广东'),
	('清远市','清远市','广东'),
	('温州市','温州市','浙江'),
	('渭南市','渭南市','陕西'),
	('湖州市','湖州市','浙江'),
	('湘潭市','湘潭市','湖南'),
	('湘西土家族苗族自治州','湘西土家族苗族自治州','湖南'),
	('湛江市','湛江市','广东'),
	('滁州市','滁州市','安徽'),
	('滨州市','滨州市','山东'),
	('漯河市','漯河市','河南'),
	('漳州市','漳州市','福建'),
	('潍坊市','潍坊市','山东'),
	('潮州市','潮州市','广东'),
	('澳门特别行政区','澳门特别行政区','澳门特别行政区'),
	('濮阳市','濮阳市','河南'),
	('烟台市','烟台市','山东'),
	('焦作市','焦作市','河南'),
	('牡丹江市','牡丹江市','黑龙江'),
	('玉林市','玉林市','广西'),
	('玉树藏族自治州','玉树藏族自治州','青海'),
	('玉溪市','玉溪市','云南'),
	('珠海市','珠海市','广东'),
	('甘南藏族自治州','甘南藏族自治州','甘肃'),
	('甘孜藏族自治州','甘孜藏族自治州','四川'),
	('白城市','白城市','吉林'),
	('白山市','白山市','吉林'),
	('白银市','白银市','甘肃'),
	('百色市','百色市','广西'),
	('益阳市','益阳市','湖南'),
	('盐城市','盐城市','江苏'),
	('盘锦市','盘锦市','辽宁'),
	('眉山市','眉山市','四川'),
	('石嘴山市','石嘴山市','宁夏'),
	('石家庄市','石家庄市','河北'),
	('福州市','福州市','福建'),
	('秦皇岛市','秦皇岛市','河北'),
	('红河哈尼族彝族自治州','红河哈尼族彝族自治州','云南'),
	('绍兴市','绍兴市','浙江'),
	('绥化市','绥化市','黑龙江'),
	('绵阳市','绵阳市','四川'),
	('聊城市','聊城市','山东'),
	('肇庆市','肇庆市','广东'),
	('自贡市','自贡市','四川'),
	('舟山市','舟山市','浙江'),
	('芜湖市','芜湖市','安徽'),
	('苏州市','苏州市','江苏'),
	('茂名市','茂名市','广东'),
	('荆州市','荆州市','湖北'),
	('荆门市','荆门市','湖北'),
	('莆田市','莆田市','福建'),
	('莱芜市','莱芜市','山东'),
	('菏泽市','菏泽市','山东'),
	('萍乡市','萍乡市','江西'),
	('营口市','营口市','辽宁'),
	('葫芦岛市','葫芦岛市','辽宁'),
	('蚌埠市','蚌埠市','安徽'),
	('衡水市','衡水市','河北'),
	('衡阳市','衡阳市','湖南'),
	('衢州市','衢州市','浙江'),
	('襄樊市','襄樊市','湖北'),
	('西双版纳傣族自治州','西双版纳傣族自治州','云南'),
	('西宁市','西宁市','青海'),
	('西安市','西安市','陕西'),
	('许昌市','许昌市','河南'),
	('贵港市','贵港市','广西'),
	('贵阳市','贵阳市','贵州'),
	('贺州市','贺州市','广西'),
	('资阳市','资阳市','四川'),
	('赣州市','赣州市','江西'),
	('赤峰市','赤峰市','内蒙古'),
	('辽源市','辽源市','吉林'),
	('辽阳市','辽阳市','辽宁'),
	('达州市','达州市','四川'),
	('运城市','运城市','山西'),
	('连云港市','连云港市','江苏'),
	('迪庆藏族自治州','迪庆藏族自治州','云南'),
	('通化市','通化市','吉林'),
	('通辽市','通辽市','内蒙古'),
	('遂宁市','遂宁市','四川'),
	('遵义市','遵义市','贵州'),
	('邢台市','邢台市','河北'),
	('那曲地区','那曲地区','西藏'),
	('邯郸市','邯郸市','河北'),
	('邵阳市','邵阳市','湖南'),
	('郑州市','郑州市','河南'),
	('郴州市','郴州市','湖南'),
	('鄂尔多斯市','鄂尔多斯市','内蒙古'),
	('鄂州市','鄂州市','湖北'),
	('酒泉市','酒泉市','甘肃'),
	('重庆市','重庆市','重庆'),
	('金华市','金华市','浙江'),
	('金昌市','金昌市','甘肃'),
	('钦州市','钦州市','广西'),
	('铁岭市','铁岭市','辽宁'),
	('铜仁地区','铜仁地区','贵州'),
	('铜川市','铜川市','陕西'),
	('铜陵市','铜陵市','安徽'),
	('银川市','银川市','宁夏'),
	('锡林郭勒盟','锡林郭勒盟','内蒙古'),
	('锦州市','锦州市','辽宁'),
	('镇江市','镇江市','江苏'),
	('长春市','长春市','吉林'),
	('长沙市','长沙市','湖南'),
	('长治市','长治市','山西'),
	('阜新市','阜新市','辽宁'),
	('阜阳市','阜阳市','安徽'),
	('防城港市','防城港市','广西'),
	('阳江市','阳江市','广东'),
	('阳泉市','阳泉市','山西'),
	('阿克苏地区','阿克苏地区','新疆'),
	('阿勒泰地区','阿勒泰地区','新疆'),
	('阿坝藏族羌族自治州','阿坝藏族羌族自治州','四川'),
	('阿拉善盟','阿拉善盟','内蒙古'),
	('阿里地区','阿里地区','西藏'),
	('陇南市','陇南市','甘肃'),
	('随州市','随州市','湖北'),
	('雅安市','雅安市','四川'),
	('青岛市','青岛市','山东'),
	('鞍山市','鞍山市','辽宁'),
	('韶关市','韶关市','广东'),
	('香港特别行政区','香港特别行政区','香港特别行政区'),
	('马鞍山市','马鞍山市','安徽'),
	('驻马店市','驻马店市','河南'),
	('鸡西市','鸡西市','黑龙江'),
	('鹤壁市','鹤壁市','河南'),
	('鹤岗市','鹤岗市','黑龙江'),
	('鹰潭市','鹰潭市','江西'),
	('黄冈市','黄冈市','湖北'),
	('黄南藏族自治州','黄南藏族自治州','青海'),
	('黄山市','黄山市','安徽'),
	('黄石市','黄石市','湖北'),
	('黑河市','黑河市','黑龙江'),
	('黔东南苗族侗族自治州','黔东南苗族侗族自治州','贵州'),
	('黔南布依族苗族自治州','黔南布依族苗族自治州','贵州'),
	('黔西南布依族苗族自治州','黔西南布依族苗族自治州','贵州'),
	('齐齐哈尔市','齐齐哈尔市','黑龙江'),
	('龙岩市','龙岩市','福建');

/*!40000 ALTER TABLE `qsx_city` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table qsx_contact
# ------------------------------------------------------------

DROP TABLE IF EXISTS `qsx_contact`;

CREATE TABLE `qsx_contact` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) NOT NULL DEFAULT '',
  `birthday` datetime NOT NULL,
  `gender` varchar(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL DEFAULT '',
  `position` varchar(20) NOT NULL DEFAULT '',
  `customer_id` bigint(20) NOT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL COMMENT '负责人id',
  `description` text COMMENT '描述',
  `resource_code` varchar(50) DEFAULT NULL COMMENT '客户来源',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `code` varchar(50) DEFAULT NULL COMMENT '编号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `FKBB4B8B778317728A` (`customer_id`),
  CONSTRAINT `FKBB4B8B778317728A` FOREIGN KEY (`customer_id`) REFERENCES `qsx_customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `qsx_contact` WRITE;
/*!40000 ALTER TABLE `qsx_contact` DISABLE KEYS */;

INSERT INTO `qsx_contact` (`id`, `address`, `birthday`, `gender`, `name`, `phone`, `position`, `customer_id`, `createTime`, `updateTime`, `user_id`, `description`, `resource_code`, `email`, `code`)
VALUES
	(17,'东通园路潼港一村25号','1980-03-10 00:00:00','女','李晓','15811000000','行政助理',24,'2017-03-06 16:00:35','2017-03-06 16:02:24',27,'','CUSTOMER_Existing','lixiao@qsx.com','CON1488787344580'),
	(18,'九龙工业园半山村16号','1984-03-15 00:00:00','女','吴平','15811110000','行政主管',25,'2017-03-07 09:36:24','2017-03-07 09:37:30',12,'','CUSTOMER_Telemarketing','wuping@qsx.com','CON1488850650745'),
	(19,'北京中关村南四街4号','1995-03-06 00:00:00','女','李玉','15800000000','销售',29,'2017-03-07 09:42:18','2017-03-07 09:43:22',30,'','CUSTOMER_Telemarketing','liyu@qsx.com','CON1488851002956'),
	(20,'高新区石阳路19号 ','1984-03-22 00:00:00','女','秦月','15800000000','产品工程师',31,'2017-03-07 09:47:05','2017-03-07 09:54:51',12,'','CUSTOMER_Emaimarketing','qinyue@qsx.com','CON1488851691861'),
	(21,'拱墅区丰潭路388号','1997-07-01 00:00:00','女','李小珑','13700000000','行政助理',34,'2017-03-07 10:05:34','2017-03-07 10:06:43',31,'','CUSTOMER_Existing','lixiaolong@qsx.com','CON1488852403548'),
	(22,'丰潭路380号第四栋','1994-04-02 00:00:00','女','秦琴','15800000000','门市经理',27,'2017-03-07 10:06:53','2017-03-07 10:07:58',31,'','CUSTOMER_Existing','qinqin@qsx.com','CON1488852478418'),
	(23,'中北路咋特接12栋','1995-03-28 00:00:00','女','王家齐','15800000000','运营主管',28,'2017-03-07 16:09:01','2017-03-07 16:09:54',12,'','CUSTOMER_Telemarketing','wangjiaqi@qsx.com','CON1488874194691'),
	(24,'西安市科技六路1号','1984-03-27 00:00:00','女','秦绵绵','15800000000','行政主管',36,'2017-03-08 17:56:41','2017-03-08 17:57:22',27,'','CUSTOMER_Emaimarketing','qinmianmian@qsx.com','CON1488967042461');

/*!40000 ALTER TABLE `qsx_contact` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table qsx_customer
# ------------------------------------------------------------

DROP TABLE IF EXISTS `qsx_customer`;

CREATE TABLE `qsx_customer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `address` varchar(500) NOT NULL,
  `company` varchar(200) NOT NULL,
  `isVIP` bit(1) NOT NULL,
  `city_code` varchar(255) DEFAULT NULL,
  `owner_id` bigint(20) DEFAULT NULL,
  `province_code` varchar(255) DEFAULT NULL,
  `region_id` bigint(20) DEFAULT NULL,
  `status_code` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `account` varchar(50) DEFAULT NULL COMMENT '账号',
  `mobile` varchar(50) DEFAULT NULL COMMENT '手机号',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `description` text COMMENT '描述',
  `payAddress` text COMMENT '付款地址',
  `receiveAddress` text COMMENT '收货地址',
  PRIMARY KEY (`id`),
  KEY `FKF41A036712D6D914` (`status_code`),
  KEY `FKF41A03677EA546F8` (`province_code`),
  KEY `FKF41A036727C7FDC2` (`city_code`),
  KEY `FKF41A0367E0D5C71E` (`region_id`),
  KEY `FKF41A0367230CCD48` (`owner_id`),
  CONSTRAINT `FKF41A036712D6D914` FOREIGN KEY (`status_code`) REFERENCES `qsx_dictionary` (`code`),
  CONSTRAINT `FKF41A0367230CCD48` FOREIGN KEY (`owner_id`) REFERENCES `qsx_user` (`id`),
  CONSTRAINT `FKF41A036727C7FDC2` FOREIGN KEY (`city_code`) REFERENCES `qsx_city` (`code`),
  CONSTRAINT `FKF41A03677EA546F8` FOREIGN KEY (`province_code`) REFERENCES `qsx_province` (`code`),
  CONSTRAINT `FKF41A0367E0D5C71E` FOREIGN KEY (`region_id`) REFERENCES `qsx_region` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `qsx_customer` WRITE;
/*!40000 ALTER TABLE `qsx_customer` DISABLE KEYS */;

INSERT INTO `qsx_customer` (`id`, `name`, `address`, `company`, `isVIP`, `city_code`, `owner_id`, `province_code`, `region_id`, `status_code`, `createTime`, `updateTime`, `account`, `mobile`, `email`, `description`, `payAddress`, `receiveAddress`)
VALUES
	(24,'全绅网络','上海浦东通园路潼港三村251号 ','全绅网络科技有限公司',b'0','上海市',27,'上海',5,'USRS_Active','2017-03-06 15:57:32','2017-03-13 11:53:29','CUS1488880013128','15827000000','quanshen@qsx.com','描述','武汉市汉阳区牛家湾10号','上海浦东通园路潼港三村251号 12栋1201全深科技有限公司'),
	(25,'吴平','九龙工业园半山村16号','凯梅西美容诊所',b'0','重庆市',12,'重庆',2,'USRS_Active','2017-03-07 09:35:09','2017-03-07 10:03:23','CUS1488852089122','15811110000','wuping@qsx.com','','九龙工业园半山村16号','九龙工业园半山村16号'),
	(26,'许芊芊','江宁开发区胜太西路93号','杭州奥美装饰公司',b'0','上海市',31,'上海',3,'USRS_Active','2017-03-07 09:37:35','2017-03-07 09:42:11','CUS1488850733781','15899990000','xuqianqian@qsx.com','','江宁开发区胜太西路93号','江宁开发区胜太西路93号'),
	(27,'马涛','浦东新区沪南路5469弄126号','上海维普信息技术有限公司',b'1','上海市',30,'上海',1,'USRS_Active','2017-03-02 09:38:55','2017-03-07 09:42:13','CUS1488850784399','13677000000','matao@qsx.com','','浦东新区沪南路5469弄126号','浦东新区沪南路5469弄126号'),
	(28,'王家齐','东戴河新区','五象旅游集团有限公司',b'1','临汾市',1,'山西',6,'USRS_Active','2017-03-06 09:39:48','2017-03-07 09:42:10','CUS1488850856313','13000000000','wangjiaqi@qsx.com','','东戴河新区a12','东戴河新区a12'),
	(29,'李响','北京中关村南四街4号中科院软件园4号楼','上海银马广告有限公司',b'1','北京市',30,'北京',4,'USRS_Active','2017-03-07 09:40:58','2017-03-07 09:42:08','CUS1488850922469','13677222222','lixiang@qsx.com','','北京中关村南四街4号中科院软件园4号楼','北京中关村南四街4号中科院软件园4号楼'),
	(30,'柳时义','经开区松林路181号星家园1-7栋1101','同新信息技术开发有限责任公司',b'0','保定市',12,'河北',1,'USRS_Active','2017-03-05 09:43:29','2017-03-07 09:45:45','CUS1488851141612','15822222222','liushiyi@qsx.com','','经开区松林路181号星家园1-7栋1101','经开区松林路181号星家园1-7栋1101'),
	(31,'秦月','高新区石阳路19号 ','苏州莱心电器有限公司',b'0','苏州市',12,'江苏',1,'USRS_Active','2017-02-28 09:45:46','2017-03-07 09:47:04','CUS1488851216948','15800000000','qinyue@qsx.com','','高新区石阳路19号 ','高新区石阳路19号 '),
	(32,'周余凯','兴业路127弄6-7号十楼单元5','恩力经济咨询有限公司',b'0','台湾',31,'台湾省',7,'USRS_Active','2017-03-03 09:54:59','2017-03-07 10:01:16','CUS1488852072914','13900000000','zhouyuk@qsx.com','','兴业路127弄6-7号十楼单元5','兴业路127弄6-7号十楼单元5'),
	(33,'李耀莱','南京西路811号中创大厦8楼义面屋','俫兴餐饮管理（上海）有限公司',b'1','上海市',1,'上海',1,'USRS_Active','2017-03-01 10:01:56','2017-03-07 10:03:21','CUS1488852196920','15827111111','liyaolai@qsx.com','','南京西路811号中创大厦8楼义面屋','南京西路811号中创大厦8楼义面屋'),
	(34,'坤宁健康咨询','拱墅区丰潭路388号第四栋11楼1103室','杭州坤宁健康咨询有限公司',b'0','南京市',1,'江苏',4,'USRS_Active','2017-03-04 10:03:24','2017-03-07 10:05:26','CUS1488852313415','13700000000','kunning@qsx.com','','拱墅区丰潭路388号第四栋11楼1103室','拱墅区丰潭路388号第四栋11楼1103室'),
	(35,'魏佳','苏州市道前街26号 ','苏州龙发装饰有限公司',b'1','苏州市',29,'江苏',4,'USRS_Active','2017-03-08 17:51:34','2017-03-08 17:56:36','CUS1488966847633','13911112222','weijia@qsx.com','','苏州市道前街26号 ','苏州市道前街26号 '),
	(36,'秦舒耀','西安市科技六路1号','西安美滋滋餐饮管理有限公司',b'1','西安市',27,'陕西',4,'USRS_Active','2017-03-08 17:54:47','2017-03-08 17:56:39','CUS1488966990233','15844445555','qinshuyao@qsx.com','','西安市科技六路1号','西安市科技六路1号');

/*!40000 ALTER TABLE `qsx_customer` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table qsx_department
# ------------------------------------------------------------

DROP TABLE IF EXISTS `qsx_department`;

CREATE TABLE `qsx_department` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `qsx_department` WRITE;
/*!40000 ALTER TABLE `qsx_department` DISABLE KEYS */;

INSERT INTO `qsx_department` (`id`, `name`, `createTime`, `updateTime`)
VALUES
	(4,'财务部','2016-01-04 14:53:56','2016-10-25 10:00:57'),
	(8,'行政部','2016-03-20 16:00:32','2017-03-06 15:42:12'),
	(15,'采购部','2017-03-06 15:33:33','2017-03-06 15:33:40'),
	(16,'销售部','2017-03-06 15:41:59','2017-03-06 15:42:03'),
	(17,'市场部','2017-03-06 15:42:53','2017-03-06 15:43:03'),
	(18,'售后部','2017-03-06 15:43:05','2017-03-06 15:43:19');

/*!40000 ALTER TABLE `qsx_department` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table qsx_department_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `qsx_department_role`;

CREATE TABLE `qsx_department_role` (
  `departmentId` bigint(20) NOT NULL,
  `roleId` bigint(20) NOT NULL,
  PRIMARY KEY (`departmentId`,`roleId`),
  KEY `FKB6C0599AE27B29A7` (`departmentId`),
  KEY `FKB6C0599A888D1567` (`roleId`),
  CONSTRAINT `FKB6C0599A888D1567` FOREIGN KEY (`roleId`) REFERENCES `qsx_role` (`id`),
  CONSTRAINT `FKB6C0599AE27B29A7` FOREIGN KEY (`departmentId`) REFERENCES `qsx_department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `qsx_department_role` WRITE;
/*!40000 ALTER TABLE `qsx_department_role` DISABLE KEYS */;

INSERT INTO `qsx_department_role` (`departmentId`, `roleId`)
VALUES
	(4,10),
	(8,1),
	(8,10),
	(15,10),
	(16,11),
	(17,12),
	(18,13);

/*!40000 ALTER TABLE `qsx_department_role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table qsx_dictionary
# ------------------------------------------------------------

DROP TABLE IF EXISTS `qsx_dictionary`;

CREATE TABLE `qsx_dictionary` (
  `CategoryCode` varchar(300) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `indexNo` int(11) NOT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `dict_code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `qsx_dictionary` WRITE;
/*!40000 ALTER TABLE `qsx_dictionary` DISABLE KEYS */;

INSERT INTO `qsx_dictionary` (`CategoryCode`, `code`, `name`, `description`, `indexNo`)
VALUES
	('com.qingshixun.project.crm.model.CampaignStatus','CAMPAIGN_canceled','取消','取消',3),
	('com.qingshixun.project.crm.model.CampaignType','CAMPAIGN_Email','电子邮件','电子邮件',4),
	('com.qingshixun.project.crm.model.CampaignStatus','CAMPAIGN_Finished','已完成','已完成',3),
	('com.qingshixun.project.crm.model.CampaignType','CAMPAIGN_Net','网络发表会','网络发表会',4),
	('com.qingshixun.project.crm.model.CampaignType','CAMPAIGN_Other','其他','其他',4),
	('com.qingshixun.project.crm.model.CampaignStatus','CAMPAIGN_Planing','计划中','计划中',3),
	('com.qingshixun.project.crm.model.CampaignStatus','CAMPAIGN_Started','启用','启用',3),
	('com.qingshixun.project.crm.model.CampaignStatus','CAMPAIGN_Stoped','停用','停用',3),
	('com.qingshixun.project.crm.model.CampaignType','CAMPAIGN_Telemarketing','电话营销','电话营销',4),
	('com.qingshixun.project.crm.model.CampaignType','CAMPAIGN_Workshop','研讨会','研讨会',4),
	('com.qingshixun.project.crm.model.CustomerStatus','CUSS_Active','正常合作客户','正常合作客户',10),
	('com.qingshixun.project.crm.model.CustomerStatus','CUSS_Invalid','无效客户','无效客户',10),
	('com.qingshixun.project.crm.model.CustomerStatus','CUSS_Potential','可以发展的潜在客户','可以发展的潜在客户',10),
	('com.qingshixun.project.crm.model.CustomerResource','CUSTOMER_Emaimarketing','邮件营销','电话营销',9),
	('com.qingshixun.project.crm.model.CustomerResource','CUSTOMER_Existing ','既有客户','既有客户',9),
	('com.qingshixun.project.crm.model.CustomerResource','CUSTOMER_Other','其他','其他',9),
	('com.qingshixun.project.crm.model.CustomerResource','CUSTOMER_Telemarketing','电话营销','电话营销',9),
	('com.qingshixun.project.crm.model.Freight','FREIGHT_Postal','邮政快递','邮政快递',12),
	('com.qingshixun.project.crm.model.Freight','FREIGHT_Sf','顺丰物流','顺丰物流',12),
	('com.qingshixun.project.crm.model.Freight','FREIGHT_Sto','申通物流','申通物流',12),
	('com.qingshixun.project.crm.model.IssueStatus','ISSUE_Closed','关闭','关闭',8),
	('com.qingshixun.project.crm.model.IssuePriority','ISSUE_Common','一般','一般',7),
	('com.qingshixun.project.crm.model.IssuePriority','ISSUE_Hign','高','高',7),
	('com.qingshixun.project.crm.model.IssuePriority','ISSUE_Low','低','低',7),
	('com.qingshixun.project.crm.model.IssueStatus','ISSUE_Opended','开启','开启',8),
	('com.qingshixun.project.crm.model.IssueStatus','ISSUE_Processing','处理中','处理中',8),
	('com.qingshixun.project.crm.model.IssueStatus','ISSUE_Response','等待回应','等待回应',8),
	('com.qingshixun.project.crm.model.IssuePriority','ISSUE_Urgent','紧急','紧急',7),
	('com.qingshixun.project.crm.model.OpportunityStatus','OPPOR_Interested','有意向','有意向',11),
	('com.qingshixun.project.crm.model.OpportunityStatus','OPPOR_Lost','丢单','丢单',11),
	('com.qingshixun.project.crm.model.OpportunityStatus','OPPOR_Price','价格比较','价格比较',11),
	('com.qingshixun.project.crm.model.OpportunityStatus','OPPOR_Signed','签单','签单',11),
	('com.qingshixun.project.crm.model.OrderStatus','ORDS_Init','初始化状态','初始化状态',2),
	('com.qingshixun.project.crm.model.OrderStatus','ORDS_Paid','已经付款','已经付款状态',2),
	('com.qingshixun.project.crm.model.ProblemStatus','PROB_Draft','草稿','草稿',6),
	('com.qingshixun.project.crm.model.ProblemStatus','PROB_Expired','过期','过期',6),
	('com.qingshixun.project.crm.model.ProblemStatus','PROB_Published','已发布','已发布',6),
	('com.qingshixun.project.crm.model.ProblemStatus','PROB_Reviewed','已审阅','已审阅',6),
	('com.qingshixun.project.crm.model.ProductStatus','PROS_Sale','在售','在售状态',0),
	('com.qingshixun.project.crm.model.ProductStatus','PROS_Stop','停售','停售状态',0),
	('com.qingshixun.project.crm.model.PurchaseOrderStatus','PURCHASE_Built','已创建','已创建',14),
	('com.qingshixun.project.crm.model.PurchaseOrderStatus','PURCHASE_Canceled','已取消','已取消',14),
	('com.qingshixun.project.crm.model.PurchaseOrderStatus','PURCHASE_Delivered','已递送','已递送',14),
	('com.qingshixun.project.crm.model.PurchaseOrderStatus','PURCHASE_Received','收到发货','收到发货',14),
	('com.qingshixun.project.crm.model.PurchaseOrderStatus','PURCHASE_Reviewed','已审核','已审核',14),
	('com.qingshixun.project.crm.model.QuotationStatus','QUOTATION_Accepted','已接受','已接受',13),
	('com.qingshixun.project.crm.model.QuotationStatus','QUOTATION_Built','已建立','已建立',13),
	('com.qingshixun.project.crm.model.QuotationStatus','QUOTATION_Denied','被拒绝','被拒绝',13),
	('com.qingshixun.project.crm.model.QuotationStatus','QUOTATION_Reviewed','已审阅','已审阅',13),
	('com.qingshixun.project.crm.model.SalesOrderStatus','SALESORDER_Canceled','已取消','已取消',13),
	('com.qingshixun.project.crm.model.SalesOrderStatus','SALESORDER_Commit','已提交','已提交',13),
	('com.qingshixun.project.crm.model.SalesOrderStatus','SALESORDER_Reviewed','已审阅','已审阅',13),
	('com.qingshixun.project.crm.model.UserStatus','USRS_Active','正常','正常状态',1),
	('com.qingshixun.project.crm.model.UserStatus','USRS_Disabled','禁用','禁用状态',1);

/*!40000 ALTER TABLE `qsx_dictionary` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table qsx_issue
# ------------------------------------------------------------

DROP TABLE IF EXISTS `qsx_issue`;

CREATE TABLE `qsx_issue` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '问题单id',
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `code` varchar(50) DEFAULT NULL COMMENT '编号',
  `contact_id` bigint(20) DEFAULT NULL COMMENT '联系人Id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '负责人Id',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品Id',
  `priority_code` varchar(255) DEFAULT NULL COMMENT '优先级',
  `status_code` varchar(225) DEFAULT NULL COMMENT '状态',
  `description` text COMMENT '描述',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `FK_qsx_issue_qsx_contact` (`contact_id`),
  KEY `FK_qsx_issue_qsx_user` (`user_id`),
  KEY `FK_qsx_issue_qsx_product` (`product_id`),
  KEY `FK_qsx_issue_qsx_dictionary` (`priority_code`),
  KEY `FK_qsx_issue_qsx_dictionary_2` (`status_code`),
  CONSTRAINT `FK_qsx_issue_qsx_contact` FOREIGN KEY (`contact_id`) REFERENCES `qsx_contact` (`id`),
  CONSTRAINT `FK_qsx_issue_qsx_dictionary` FOREIGN KEY (`priority_code`) REFERENCES `qsx_dictionary` (`code`),
  CONSTRAINT `FK_qsx_issue_qsx_dictionary_2` FOREIGN KEY (`status_code`) REFERENCES `qsx_dictionary` (`code`),
  CONSTRAINT `FK_qsx_issue_qsx_product` FOREIGN KEY (`product_id`) REFERENCES `qsx_product` (`id`),
  CONSTRAINT `FK_qsx_issue_qsx_user` FOREIGN KEY (`user_id`) REFERENCES `qsx_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='问题单';

LOCK TABLES `qsx_issue` WRITE;
/*!40000 ALTER TABLE `qsx_issue` DISABLE KEYS */;

INSERT INTO `qsx_issue` (`id`, `title`, `code`, `contact_id`, `user_id`, `product_id`, `priority_code`, `status_code`, `description`, `createTime`, `updateTime`)
VALUES
	(8,'温度低，手机就充不进电','ISS1488792209561',17,28,34,'ISSUE_Common','ISSUE_Opended','插上电源，一直不显示充电状态，有时候又可以正常充电，检查过电池没有问题。','2017-03-06 17:20:49','2017-03-06 17:23:29'),
	(9,'手机摄影时，屏幕出现杂色','ISS1488792296264',17,28,34,'ISSUE_Hign','ISSUE_Processing','手机打开相机，切换到视频摄影，屏幕上出现乱七八糟的杂色，很不清晰。照片时是正常的','2017-03-06 17:23:31','2017-03-06 17:24:56'),
	(10,'噪音很大','ISS1488792377117',17,28,42,'ISSUE_Hign','ISSUE_Response','每次开机后，噪音非常大。刚开始买的时候i还是好的，用了一段时间突然就变得噪音很大','2017-03-06 17:24:57','2017-03-06 17:26:17'),
	(11,'智能手表定位不准','ISS1488792516577',17,28,40,'ISSUE_Urgent','ISSUE_Closed','在家里跟小孩子坐在一起，定位的地方显示没在一起，差了大概10米。 在室外用过，定位比较准确 ','2017-03-06 17:26:18','2017-03-06 17:35:26'),
	(12,'双轮平衡车一边不走','ISS1488793014868',17,28,43,'ISSUE_Hign','ISSUE_Processing','双轮平衡车一边不走','2017-03-06 17:36:07','2017-03-06 17:36:54'),
	(13,'笔记本屏幕有一条线','ISS1488793101295',17,32,35,'ISSUE_Common','ISSUE_Opended','小米笔记本电脑屏幕有问题，逛淘宝一会跳出来的一字直线条，一会消失了','2017-03-06 17:37:36','2017-03-06 17:38:21'),
	(14,'小白夜视模式会出现炫光？','ISS1488793517946',17,28,41,'ISSUE_Low','ISSUE_Opended','小白夜视模式会出现炫光？','2017-03-06 17:43:21','2017-03-06 17:45:37'),
	(15,'小白白天或开灯情况下为什么图像显示是黑白而不是彩色？','ISS1488793575985',17,28,41,'ISSUE_Hign','ISSUE_Processing','小白白天或开灯情况下为什么图像显示是黑白而不是彩色？','2017-03-06 17:45:52','2017-03-06 17:46:15'),
	(16,'为什么图像花屏或有不正常颜色？','ISS1488793606913',17,28,41,'ISSUE_Common','ISSUE_Response','为什么图像花屏或有不正常颜色？','2017-03-06 17:46:27','2017-03-06 17:46:46'),
	(17,'小白无法扫码连接?','ISS1488793647288',17,28,41,'ISSUE_Hign','ISSUE_Closed','小白无法扫码连接?','2017-03-06 17:46:51','2017-03-06 17:47:27'),
	(18,'有时候我遥控小白转动视角没有反应或延迟较严重？？','ISS1488793674905',17,1,41,'ISSUE_Common','ISSUE_Opended','有时候我遥控小白转动视角没有反应或延迟较严重？？','2017-03-06 17:47:36','2017-03-06 17:47:54'),
	(19,'米家，为什么添加不上空气净化器设备呢？','ISS1488793832192',17,28,42,'ISSUE_Urgent','ISSUE_Opended','米家，为什么添加不上空气净化器设备呢？按照说明的都操作了，上、侧两个键同时按下5秒，听到滴滴滴三声响后，手机里面添加设备没有。拔电源线重复了。','2017-03-06 17:49:19','2017-03-06 17:50:32');

/*!40000 ALTER TABLE `qsx_issue` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table qsx_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `qsx_menu`;

CREATE TABLE `qsx_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `indexNo` int(11) unsigned DEFAULT NULL,
  `url` varchar(100) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7004C568CC1492DD` (`parent_id`),
  CONSTRAINT `FK7004C568CC1492DD` FOREIGN KEY (`parent_id`) REFERENCES `qsx_menu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `qsx_menu` WRITE;
/*!40000 ALTER TABLE `qsx_menu` DISABLE KEYS */;

INSERT INTO `qsx_menu` (`id`, `name`, `icon`, `indexNo`, `url`, `parent_id`, `createTime`, `updateTime`)
VALUES
	(39,'系统管理','fa fa-hospital',1600,'',NULL,'2016-01-13 14:35:45','2016-01-13 14:35:45'),
	(40,'用户管理','fa icon-hospital',1610,'user/list',39,'2016-01-13 14:37:11','2016-01-13 14:37:11'),
	(41,'角色管理','fa icon-hospital',1611,'role/list',39,'2016-01-13 14:38:36','2016-01-13 14:38:36'),
	(54,'部门管理','fa fa-building',1612,'department/list',39,'2016-03-01 13:38:37','2016-03-01 13:38:37'),
	(55,'菜单管理','fa fa-medkit',1613,'menu/list',39,'2016-03-01 13:38:58','2016-03-01 13:38:58'),
	(56,'角色授权','fa fa-hospital',1614,'role/authorization',39,'2016-03-01 13:39:18','2016-03-01 13:39:18'),
	(75,'售后服务','fa fa-fighter-jet',1300,'shouhoufuwu',NULL,'2016-12-06 15:48:24','2016-12-06 15:48:24'),
	(76,'问题单','fa fa-medkit',1310,'issue/list',75,'2016-12-06 15:49:10','2016-12-06 15:49:10'),
	(77,'常见问题','fa fa-hospital',1311,'problem/list',75,'2016-12-06 15:54:03','2016-12-06 15:54:03'),
	(78,'库存管理','fa fa-building',1400,'',NULL,'2016-12-06 15:54:40','2016-12-06 15:54:40'),
	(79,'产品管理','fa fa-coffee',1411,'product/list',78,'2016-12-06 15:55:24','2016-12-06 15:55:24'),
	(80,'供应商管理','fa fa-laptop',1412,'supplier/list',78,'2016-12-06 15:56:41','2016-12-06 15:56:41'),
	(81,'采购订单','fa fa-spinner',1413,'purchaseorder/list',78,'2016-12-06 15:57:25','2016-12-06 15:57:25'),
	(87,'统计报表','fa fa-spinner',1500,'',NULL,'2016-12-29 17:36:25','2016-12-29 17:36:25'),
	(88,'潜在客户来源','',1510,'statistics/prospective',87,'2016-12-30 13:35:55','2016-12-30 13:35:55'),
	(89,'产品分类','',1410,'category/list',78,'2017-01-03 09:49:09','2017-01-03 09:49:09'),
	(108,'销售管理','fa fa-spinner',1100,'',NULL,'2017-01-13 10:58:18','2017-01-13 10:58:18'),
	(109,'客户管理','',1110,'customer/list',108,'2017-01-13 10:58:34','2017-01-13 10:58:34'),
	(111,'销售机会','',1111,'opportunity/list',108,'2017-01-13 11:15:01','2017-01-13 11:15:01'),
	(112,'报价单','',1112,'quotation/list',108,'2017-01-13 11:15:44','2017-01-13 11:15:44'),
	(113,'销售订单','',1113,'salesorder/list',108,'2017-01-13 11:17:34','2017-01-13 11:17:34'),
	(114,'市场营销','fa fa-moon-o',1200,'',NULL,'2017-01-13 13:57:49','2017-01-13 13:57:49'),
	(115,'营销活动','',1210,'campaign/list',114,'2017-01-13 14:00:26','2017-01-13 14:00:26'),
	(116,'潜在客户','fa fa-trophy',1211,'prospective/list',114,'2017-01-13 14:01:25','2017-01-13 14:01:25');

/*!40000 ALTER TABLE `qsx_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table qsx_menu_resource
# ------------------------------------------------------------

DROP TABLE IF EXISTS `qsx_menu_resource`;

CREATE TABLE `qsx_menu_resource` (
  `menuId` bigint(20) NOT NULL,
  `resourceId` bigint(20) NOT NULL,
  PRIMARY KEY (`menuId`,`resourceId`),
  KEY `FK76FC505107128C7` (`menuId`),
  KEY `FK76FC50556AAD4E7` (`resourceId`),
  CONSTRAINT `FK76FC505107128C7` FOREIGN KEY (`menuId`) REFERENCES `qsx_menu` (`id`),
  CONSTRAINT `FK76FC50556AAD4E7` FOREIGN KEY (`resourceId`) REFERENCES `qsx_resource` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `qsx_menu_resource` WRITE;
/*!40000 ALTER TABLE `qsx_menu_resource` DISABLE KEYS */;

INSERT INTO `qsx_menu_resource` (`menuId`, `resourceId`)
VALUES
	(40,50),
	(40,51),
	(40,52),
	(41,53),
	(41,54),
	(41,55),
	(54,56),
	(54,57),
	(54,58),
	(55,59),
	(55,60),
	(55,61),
	(76,33),
	(76,34),
	(76,35),
	(77,36),
	(77,37),
	(77,38),
	(79,10),
	(79,11),
	(79,12),
	(79,47),
	(80,42),
	(80,43),
	(80,44),
	(81,45),
	(81,48),
	(81,49),
	(89,39),
	(89,40),
	(89,41),
	(109,13),
	(109,14),
	(109,15),
	(109,16),
	(109,17),
	(111,18),
	(111,20),
	(111,62),
	(112,21),
	(112,22),
	(112,23),
	(112,46),
	(113,24),
	(113,25),
	(113,26),
	(115,27),
	(115,28),
	(115,29),
	(116,30),
	(116,31),
	(116,32);

/*!40000 ALTER TABLE `qsx_menu_resource` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table qsx_operate_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `qsx_operate_log`;

CREATE TABLE `qsx_operate_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `action` varchar(255) DEFAULT NULL,
  `context` varchar(255) DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  `memo` longtext,
  `name` varchar(255) DEFAULT NULL,
  `result` varchar(10) NOT NULL,
  `target` varchar(255) DEFAULT NULL,
  `timeConsume` bigint(20) DEFAULT NULL,
  `userCode` varchar(60) NOT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table qsx_opportunity
# ------------------------------------------------------------

DROP TABLE IF EXISTS `qsx_opportunity`;

CREATE TABLE `qsx_opportunity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '销售机会Id',
  `code` varchar(50) DEFAULT NULL COMMENT '销售机会编码',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `customer_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `resource_code` varchar(50) DEFAULT NULL COMMENT '潜在客户来源',
  `user_id` bigint(20) DEFAULT NULL COMMENT '负责人id',
  `status_code` varchar(225) DEFAULT NULL COMMENT '销售阶段',
  `campaign_id` bigint(20) DEFAULT NULL COMMENT '来自营销活动id',
  `total` double DEFAULT NULL COMMENT '合计',
  `probability` int(11) DEFAULT NULL COMMENT '可能性',
  `endDate` date DEFAULT NULL COMMENT '约定结束日期',
  `description` text COMMENT '描述',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `FK_qsx_opportunity_qsx_customer` (`customer_id`),
  KEY `FK_qsx_opportunity_qsx_dictionary` (`resource_code`),
  KEY `FK_qsx_opportunity_qsx_user` (`user_id`),
  KEY `FK_qsx_opportunity_qsx_dictionary_2` (`status_code`),
  KEY `FK_qsx_opportunity_qsx_campaign` (`campaign_id`),
  CONSTRAINT `FK_qsx_opportunity_qsx_campaign` FOREIGN KEY (`campaign_id`) REFERENCES `qsx_campaign` (`id`),
  CONSTRAINT `FK_qsx_opportunity_qsx_customer` FOREIGN KEY (`customer_id`) REFERENCES `qsx_customer` (`id`),
  CONSTRAINT `FK_qsx_opportunity_qsx_dictionary` FOREIGN KEY (`resource_code`) REFERENCES `qsx_dictionary` (`code`),
  CONSTRAINT `FK_qsx_opportunity_qsx_dictionary_2` FOREIGN KEY (`status_code`) REFERENCES `qsx_dictionary` (`code`),
  CONSTRAINT `FK_qsx_opportunity_qsx_user` FOREIGN KEY (`user_id`) REFERENCES `qsx_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='销售机会';

LOCK TABLES `qsx_opportunity` WRITE;
/*!40000 ALTER TABLE `qsx_opportunity` DISABLE KEYS */;

INSERT INTO `qsx_opportunity` (`id`, `code`, `name`, `customer_id`, `resource_code`, `user_id`, `status_code`, `campaign_id`, `total`, `probability`, `endDate`, `description`, `createTime`, `updateTime`)
VALUES
	(5,'OPP1488876309168','凯梅西有意向采购小米电视',25,'CUSTOMER_Telemarketing',29,'OPPOR_Price',5,340000,80,'2017-03-08','','2017-03-07 16:43:30','2017-03-07 16:47:44'),
	(6,'OPP1488876379266','奥美装饰计划采购空气净化器100台',31,'CUSTOMER_Existing',31,'OPPOR_Price',11,2800,60,'2017-03-11','','2017-03-07 16:45:12','2017-03-07 16:48:01'),
	(7,'OPP1488876442030','全坤网络购买电视30台',24,'CUSTOMER_Existing',29,'OPPOR_Signed',6,17500,100,'2017-03-07','','2017-03-07 16:46:21','2017-03-07 16:47:22'),
	(8,'OPP1488876589279','(五象旅游)王家齐采购小米笔记本',28,'CUSTOMER_Telemarketing',31,'OPPOR_Lost',9,40000,10,'2017-03-05','','2017-03-07 16:48:20','2017-03-07 16:55:29'),
	(9,'OPP1488876672057','华艺爱民广告冯经理购买5台平衡车',29,'CUSTOMER_Emaimarketing',30,'OPPOR_Interested',12,5700,55,'2017-02-19','','2017-03-07 16:49:55','2017-03-07 16:51:12'),
	(10,'OPP1488876763595','健康咨询李经理意向采购小米平板',33,'CUSTOMER_Existing',31,'OPPOR_Signed',14,5500,70,'2017-04-27','','2017-03-07 16:51:20','2017-03-07 16:52:43'),
	(11,'OPP1488876830995','银马广告采购米兔手表100',26,'CUSTOMER_Telemarketing',31,'OPPOR_Price',15,12000,55,'2017-03-02','','2017-03-07 16:52:45','2017-03-07 16:53:50'),
	(12,'OPP1488876914354','宏业科技胡先生购买智能摄像头',32,'CUSTOMER_Other',30,'OPPOR_Interested',10,40000,30,'2016-12-20','','2017-03-07 16:53:56','2017-03-07 16:55:14'),
	(13,'OPP1488877004689','维普信息技术马涛',27,'CUSTOMER_Existing',29,'OPPOR_Signed',7,8000,99,'2017-03-06','购买10台手机','2017-03-07 16:55:33','2017-03-07 16:56:44'),
	(14,'OPP1488877064487','灵起投资咨询李先生购买净水器',30,'CUSTOMER_Telemarketing',1,'OPPOR_Price',13,4800,88,'2017-03-11','','2017-03-07 16:56:49','2017-03-07 16:57:44'),
	(15,'OPP1488877122142','坤宁健康咨询购买小米平板',34,'CUSTOMER_Telemarketing',29,'OPPOR_Lost',14,30000,30,'2017-02-28','已购买','2017-03-07 16:57:48','2017-03-07 16:58:42');

/*!40000 ALTER TABLE `qsx_opportunity` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table qsx_order
# ------------------------------------------------------------

DROP TABLE IF EXISTS `qsx_order`;

CREATE TABLE `qsx_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `deliverDate` datetime DEFAULT NULL COMMENT '已发货日期',
  `memo` varchar(100) NOT NULL COMMENT '备忘录',
  `name` varchar(100) NOT NULL,
  `paidDate` datetime DEFAULT NULL,
  `totalAmount` double NOT NULL COMMENT '产品总价',
  `totalQuantity` int(11) NOT NULL COMMENT '产品总数',
  `customer_id` bigint(20) DEFAULT NULL,
  `region_id` bigint(20) DEFAULT NULL,
  `sales_id` bigint(20) DEFAULT NULL,
  `status_code` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK90B5D86566BB033D` (`status_code`),
  KEY `FK90B5D865335F2C4F` (`sales_id`),
  KEY `FK90B5D865E0D5C71E` (`region_id`),
  KEY `FK90B5D8658317728A` (`customer_id`),
  CONSTRAINT `FK90B5D865335F2C4F` FOREIGN KEY (`sales_id`) REFERENCES `qsx_user` (`id`),
  CONSTRAINT `FK90B5D86566BB033D` FOREIGN KEY (`status_code`) REFERENCES `qsx_dictionary` (`code`),
  CONSTRAINT `FK90B5D8658317728A` FOREIGN KEY (`customer_id`) REFERENCES `qsx_customer` (`id`),
  CONSTRAINT `FK90B5D865E0D5C71E` FOREIGN KEY (`region_id`) REFERENCES `qsx_region` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table qsx_order_detail
# ------------------------------------------------------------

DROP TABLE IF EXISTS `qsx_order_detail`;

CREATE TABLE `qsx_order_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品id',
  `amount` double NOT NULL COMMENT '总价',
  `quantity` int(11) NOT NULL COMMENT '数量',
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7537F16B5EC69B84` (`order_id`),
  KEY `FK7537F16BC0441A02` (`product_id`),
  CONSTRAINT `FK7537F16B5EC69B84` FOREIGN KEY (`order_id`) REFERENCES `qsx_order` (`id`),
  CONSTRAINT `FK7537F16BC0441A02` FOREIGN KEY (`product_id`) REFERENCES `qsx_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table qsx_problem
# ------------------------------------------------------------

DROP TABLE IF EXISTS `qsx_problem`;

CREATE TABLE `qsx_problem` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '常见问题id',
  `code` varchar(50) DEFAULT NULL COMMENT '问题编号',
  `problem` varchar(500) DEFAULT NULL COMMENT '问题',
  `answer` varchar(500) DEFAULT NULL COMMENT '回答',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品id',
  `status_code` varchar(225) DEFAULT NULL COMMENT '状态',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `FK_qsx_problem_qsx_product` (`product_id`),
  KEY `FK_qsx_problem_qsx_dictionary` (`status_code`),
  CONSTRAINT `FK_qsx_problem_qsx_dictionary` FOREIGN KEY (`status_code`) REFERENCES `qsx_dictionary` (`code`),
  CONSTRAINT `FK_qsx_problem_qsx_product` FOREIGN KEY (`product_id`) REFERENCES `qsx_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='常见问题';

LOCK TABLES `qsx_problem` WRITE;
/*!40000 ALTER TABLE `qsx_problem` DISABLE KEYS */;

INSERT INTO `qsx_problem` (`id`, `code`, `problem`, `answer`, `product_id`, `status_code`, `createTime`, `updateTime`)
VALUES
	(4,'PRO1488792606582','为什么米兔儿童手表定位有时候偏差比较大','现在的儿童手表大部分是采用LBS定位（即基站定位）的方式，其精准度与当地基站的密集程度有关，基站越密集，精准度越高；也有部分是GPS定位的，但也是有误差的，只是误差更小些，不可能100%精准的。',40,'PROB_Draft','2017-03-06 17:28:54','2017-03-06 17:42:10'),
	(5,'PRO1488792691158','手机充不进去电的原因','1.首先，手机系统故障，因此导致电池电量显示出现问题。这种问题最容易解决，可以直接关机重启，这样相当于数据刷新，一般电量显示就会恢复正常。\r\n2.其次，充电器出现故障。这种故障是手机充不进去电的主要原因。那么该如何判断充电器的好坏呢。其实非常简单，换上别的充电器试一下。如果能充进去电，那么就可以断定是充电器出现故障。',34,'PROB_Reviewed','2017-03-06 17:30:10','2017-03-06 17:31:31'),
	(6,'PRO1488792789677','电饭煲蒸饭时间太长','　　1.电热盘变形\r\n　　——到附近售后服务维修点更换电热盘\r\n　　2.内锅倾斜，一边悬空\r\n　　——把内锅轻轻转动，使之恢复正常\r\n　　3.内锅与电热盘之间有异物\r\n　　——将内锅与电热盘之间的异物清除干净\r\n　　4.内锅变形\r\n　　——到指定售后服务网点更换内锅\r\n　　5.主电路故障\r\n　　——将电饭锅送至指定维修网点维修\r\n　　6.主温控器异常\r\n',33,'PROB_Published','2017-03-06 17:31:37','2017-03-06 17:33:09'),
	(7,'PRO1488792884902','平衡车充不进去电,插上电源就是绿灯','充电器问题，请联系售后。正常充电充电器是变红灯的，充满或不充才变绿灯',43,'PROB_Published','2017-03-06 17:33:56','2017-03-06 17:34:44'),
	(8,'PRO1488793157675','小米平板2 16G版本的可以刷Windows10系统吗？','可以使用论坛的教程刷入，不过刷入之后内存偏少，几乎不能安装不了几个软件。',32,'PROB_Expired','2017-03-06 17:38:54','2017-03-06 17:39:17'),
	(9,'PRO1488793194145','小米平板2稳定版系统和开发版系统的区别？什么时候更新？','其实开发板和稳定版没有根本的区别，开发板升级比较快，功能更新多，有新功能你能最早体验到，但是测试比较少，所以很多漏洞会造成机器的运行不稳定或者各种毛病，稳定版就是在开发版的基础上，吸取开发版暴露出的问题，加以改进和删减，力求尽量少的出现系统问题的版本，稳定版比开发版更新要慢，其实说是稳定版，也有不稳定的版本。也就是说你可以理解成开发版的功能比稳定版的功能可以早使用1-2个月左右。开发版系统每周五更新，内测粉丝组或者其他论坛特殊组账号可以接收到内测推送升级。稳定版系统一般1-2个月左右更新一次。',32,'PROB_Draft','2017-03-06 17:39:23','2017-03-06 17:39:54'),
	(10,'PRO1488793229678','Windows10版本为什么恢复出厂设置之后无法开机？显示一堆字母。','需要使用type-C接口的otg线外接键盘按F12进入系统，即可。',32,'PROB_Published','2017-03-06 17:39:59','2017-03-06 17:40:29'),
	(11,'PRO1488793296271','平衡车突然断电','这是平衡车的超速断电保护，一般平衡车的最高时速为20公里，如果超出限速峰值，可能会突然断电停止运行。所以在使用时，请尽可能保持在限速范围内，并且温和加速，当听见平衡车报警时，应立即减速或停止使用，如果在听到报警声音时依然强行加速，则会启动断电保护导致人员被甩出去，造成危险',43,'PROB_Published','2017-03-06 17:40:32','2017-03-06 17:41:36'),
	(12,'PRO1488793359901','米兔儿童手表支持更换SIM卡吗？','考虑手表做得轻薄，采用了贴片式SIM卡，不支持更换',40,'PROB_Reviewed','2017-03-06 17:42:21','2017-03-06 17:42:39'),
	(13,'PRO1488793390157','米兔儿童手表采用什么方式连接网络，可以利用WiFi传数据吗？','米兔手表使用数据连接网络，数据流量费用为0.1元/MB；米兔手表的WiFi是用来定位的，不具备连接和数据传输功能。',40,'PROB_Published','2017-03-06 17:42:53','2017-03-06 17:43:10'),
	(14,'PRO1488793711514','小白如何与手机连接，连接的环境是什么？','请下载“小米智能家庭”APP，并将小白接通电源，耐心等待启动校准过程直到橙灯闪烁，在手机连接WIFI情况下进入APP搜索到小白智能摄像机后根据引导添加并完成连接，连接是否成功主要以小白的语音提示为主。',41,'PROB_Published','2017-03-06 17:48:07','2017-03-06 17:48:31'),
	(15,'PRO1488793745923','不插入SD卡，小白的历史回放能用吗？','小白若不插入Micro SD卡是可以正常使用的，但历史回放功能将无法使用，目前小白的历史回放时存储在SD卡，所以需要SD卡支持，请选用可靠品牌的FAT格式卡，且最大不超过32G以内。',41,'PROB_Reviewed','2017-03-06 17:48:35','2017-03-06 17:49:05');

/*!40000 ALTER TABLE `qsx_problem` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table qsx_product
# ------------------------------------------------------------

DROP TABLE IF EXISTS `qsx_product`;

CREATE TABLE `qsx_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `code` varchar(100) DEFAULT NULL,
  `description` text NOT NULL,
  `inventory` int(11) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `status_code` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `supplier_id` bigint(20) DEFAULT NULL COMMENT '供应商id',
  PRIMARY KEY (`id`),
  KEY `FK70223446767EC75E` (`status_code`),
  KEY `FK70223446A7426F35` (`category_id`),
  KEY `FK_qsx_product_qsx_supplier` (`supplier_id`),
  CONSTRAINT `FK70223446767EC75E` FOREIGN KEY (`status_code`) REFERENCES `qsx_dictionary` (`code`),
  CONSTRAINT `FK70223446A7426F35` FOREIGN KEY (`category_id`) REFERENCES `qsx_product_category` (`id`),
  CONSTRAINT `FK_qsx_product_qsx_supplier` FOREIGN KEY (`supplier_id`) REFERENCES `qsx_supplier` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品';

LOCK TABLES `qsx_product` WRITE;
/*!40000 ALTER TABLE `qsx_product` DISABLE KEYS */;

INSERT INTO `qsx_product` (`id`, `name`, `code`, `description`, `inventory`, `picture`, `price`, `category_id`, `status_code`, `createTime`, `updateTime`, `supplier_id`)
VALUES
	(32,'小米平板2','PRT1488784213753','你最熟悉的 Windows 操作系统，如今小米平板也能使用了。你可以安装 Office 软件，不仅能保持高工作效率。更重要的是使用小米平板能熟悉的像使用电脑一样。',70,'1488965705622_857367.png',999,13,'PROS_Stop','2017-03-06 15:07:11','2017-03-13 11:52:26',7),
	(33,'米家IH电饭煲','PRT1488784461981','米家 IH 电饭煲，帮你为不同的米种匹配最可口的加热方案，甚至是软硬口感也能随偏好自由调节。',11,'1488965729051_645722.png',399,13,'PROS_Sale','2017-03-06 15:12:45','2017-03-08 17:36:51',7),
	(34,'小米手机5s Plus','PRT1488784575492','迄今为止最快手机小米5s Plus，跑分高达 164119 分，它的强大性能源自骁龙 821 处理器和 6GB 超大内存,让你的每一个操作都快上加快。',1000,'1488965736672_66298.png',2599,13,'PROS_Sale','2017-03-06 15:14:38','2017-03-08 17:36:53',7),
	(35,'小米笔记本Air','PRT1488784709346','我们选择小米笔记本Air，做高性能的轻薄笔记本＊',36,'1488965744361_788078.png',4999,17,'PROS_Sale','2017-03-06 15:17:20','2017-03-08 17:36:55',7),
	(36,'小米电视3s 65英寸','PRT1488784803370','新一代的电视，应该更智能更懂你，所以全新的小米电视，有了全新的突破。高颜值的金属机身，漂亮得像一件艺术品。',185,'1488965753550_348480.png',4699,20,'PROS_Sale','2017-03-06 15:18:32','2017-03-08 17:36:57',7),
	(37,'小米盒子3s','PRT1488784870072','这是新一代的小米盒子，也是更酷更好玩的人工智能机顶盒。',20,'1488965759865_464281.png',299,22,'PROS_Sale','2017-03-06 15:20:05','2017-03-08 17:37:00',7),
	(38,'小米路由器  Pro','PRT1488784972009','全新金属机身设计 / AC2600双频 / 4x4全向性天线 / 802.11ac wave2 / 支持MU-MIMO',90,'1488965767985_226708.png',499,21,'PROS_Sale','2017-03-06 15:21:11','2017-03-08 17:37:02',7),
	(39,'米家行车记录仪','PRT1488785063290','晚上能拍清车牌的行车记录仪 F 1.8 大光圈 / SONY IMX323 图像传感器 / Mstar 1080p 图像处理芯片 / 160°超广角',50,'1488965775125_205793.png',349,23,'PROS_Sale','2017-03-06 15:22:54','2017-03-08 17:37:05',7),
	(40,'米兔儿童手表Q','PRT1488785252537','米兔儿童手表Q,如糖果般 Q 弹，给宝贝的小礼物.Q 弹糖果配色|11 重安全设计|五重精准定位|食品级材质',200,'1488965781195_54978.png',299,15,'PROS_Sale','2017-03-06 15:26:24','2017-03-08 17:37:07',7),
	(41,'米家小白智能摄像机 ','PRT1488785370215','米家小白智能摄像机为陪伴而来，坚守家的每个瞬间360° 全景拍摄|1080P 高清摄像|红外夜视|多角度看管|智能设备语音互动',780,'1488965790791_533373.png',399,14,'PROS_Sale','2017-03-06 15:28:42','2017-03-08 17:37:09',7),
	(42,'小米空气净化器 2','PRT1488785455806','10分钟，房间空气焕然一新净化能力高达310m³/h',69,'1488965797921_292714.png',699,19,'PROS_Sale','2017-03-06 15:29:33','2017-03-08 17:37:13',7),
	(43,'九号平衡车','PRT1488785559805','年轻人的酷玩具，骑行/遥控两种玩法',30,'1488965808235_213832.png',1999,23,'PROS_Sale','2017-03-06 15:31:44','2017-03-08 17:37:16',7),
	(44,'华为荣耀','PRT1489375495185','华为荣耀手机',98,'1489375495167_835580.jpg',2300,13,'PROS_Sale','2017-03-13 11:22:42','2017-03-13 11:34:35',14);

/*!40000 ALTER TABLE `qsx_product` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table qsx_product_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `qsx_product_category`;

CREATE TABLE `qsx_product_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `qsx_product_category` WRITE;
/*!40000 ALTER TABLE `qsx_product_category` DISABLE KEYS */;

INSERT INTO `qsx_product_category` (`id`, `description`, `name`, `createTime`, `updateTime`)
VALUES
	(13,'手机','手机','2017-03-06 14:43:49','2017-03-06 14:48:48'),
	(14,'相机','摄影摄像','2017-03-06 14:44:53','2017-03-06 14:45:00'),
	(15,'智能手环','智能设备','2017-03-06 14:45:01','2017-03-06 14:52:28'),
	(16,'学习机','平板电脑','2017-03-06 14:46:32','2017-03-06 14:51:33'),
	(17,'笔记本','电脑','2017-03-06 14:46:45','2017-03-06 14:53:10'),
	(18,'油烟机','厨房电器','2017-03-06 14:48:02','2017-03-06 14:48:53'),
	(19,'净化器','净化器','2017-03-06 14:48:12','2017-03-06 15:31:18'),
	(20,'电视机','电视','2017-03-06 14:48:26','2017-03-06 14:48:32'),
	(21,'路由器','路由器','2017-03-06 14:49:54','2017-03-06 14:51:11'),
	(22,'智能盒子','家庭影音','2017-03-06 14:50:05','2017-03-06 14:51:52'),
	(23,'行车记录仪','汽车用品','2017-03-06 14:52:34','2017-03-06 14:52:57');

/*!40000 ALTER TABLE `qsx_product_category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table qsx_prospective
# ------------------------------------------------------------

DROP TABLE IF EXISTS `qsx_prospective`;

CREATE TABLE `qsx_prospective` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '潜在客户id',
  `code` varchar(50) DEFAULT NULL COMMENT '编码',
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `mobile` varchar(50) DEFAULT NULL COMMENT '电话',
  `company` varchar(50) DEFAULT NULL COMMENT '公司',
  `position` varchar(50) DEFAULT NULL COMMENT '职位',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `resource_code` varchar(50) DEFAULT NULL COMMENT '潜在客户来源',
  `status_code` varchar(50) DEFAULT NULL COMMENT '潜在客户状态',
  `user_id` bigint(20) DEFAULT NULL COMMENT '负责人',
  `description` text COMMENT '描述',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `FK_qsx_prospective_qsx_dictionary` (`resource_code`),
  KEY `FK_qsx_prospective_qsx_dictionary_2` (`status_code`),
  KEY `FK_qsx_prospective_qsx_user` (`user_id`),
  CONSTRAINT `FK_qsx_prospective_qsx_dictionary` FOREIGN KEY (`resource_code`) REFERENCES `qsx_dictionary` (`code`),
  CONSTRAINT `FK_qsx_prospective_qsx_dictionary_2` FOREIGN KEY (`status_code`) REFERENCES `qsx_dictionary` (`code`),
  CONSTRAINT `FK_qsx_prospective_qsx_user` FOREIGN KEY (`user_id`) REFERENCES `qsx_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='潜在客户';

LOCK TABLES `qsx_prospective` WRITE;
/*!40000 ALTER TABLE `qsx_prospective` DISABLE KEYS */;

INSERT INTO `qsx_prospective` (`id`, `code`, `name`, `mobile`, `company`, `position`, `email`, `resource_code`, `status_code`, `user_id`, `description`, `createTime`, `updateTime`)
VALUES
	(7,'PRS1488794178171','吴平','15811110000','凯梅西美容诊所','行政主管','wuping@qsx.com','CUSTOMER_Telemarketing','CUSS_Potential',12,'对空气净化器有购买需求，想试用一下 看效果','2017-03-06 17:53:45','2017-03-06 17:56:18'),
	(8,'PRS1488794349300','黎锦杏','13600000000','武汉醉侠楼餐饮管理有限公司','采购专员','lijinxing@qsx.com','CUSTOMER_Telemarketing','CUSS_Active',12,'2017-1-1日已购买过小白智能视像头','2017-03-06 17:56:23','2017-03-06 17:59:09'),
	(9,'PRS1488795222022','肖许','13700000000','北京低调设计科技有限公司','研发经理','xiaoxu@qsx.com','CUSTOMER_Emaimarketing','CUSS_Potential',31,'回复邮件，资讯小米笔记本的产品信息','2017-03-06 18:11:30','2017-03-06 18:13:42'),
	(10,'PRS1488795317023','许芊芊','15899990000','杭州奥美装饰公司','项目经理','xuqian@qsx.com','CUSTOMER_Other','CUSS_Potential',31,'老客户介绍的用户，资讯空气净化器','2017-03-06 18:13:46','2017-03-06 18:15:17'),
	(11,'PRS1488795441847','李进','13700000000','灵起投资咨询有限公司','市场总监','lijin@qsx.com','CUSTOMER_Existing','CUSS_Invalid',32,'对小米手机感兴趣，但是价格不能接受','2017-03-06 18:15:18','2017-03-08 17:48:36'),
	(12,'PRS1488850077521','冯璇','13700000000','河南华艺爱民广告有限公司','美工','fengxuan@qsx.com','CUSTOMER_Emaimarketing','CUSS_Active',30,'','2017-03-07 09:25:01','2017-03-08 17:46:41'),
	(13,'PRS1488850146735','马涛','13677000000','上海维普信息技术有限公司','培训主管','matao@qsx.com','CUSTOMER_Telemarketing','CUSS_Potential',30,'','2017-03-07 09:28:01','2017-03-07 09:29:06'),
	(14,'PRS1488850209654','胡美','13677111111','深圳同心宏业科技有限公司','仓管管理员','humei@qsx.com','CUSTOMER_Emaimarketing','CUSS_Active',30,'','2017-03-07 09:29:08','2017-03-07 09:30:09'),
	(15,'PRS1488850315714','李响','13677222222','上海银马广告有限公司','销售','lixiang@qsx.com','CUSTOMER_Telemarketing','CUSS_Potential',30,'意愿采购平衡车作为礼品赠送','2017-03-07 09:30:13','2017-03-07 09:31:55'),
	(16,'PRS1488850392364','王家齐','13000000000','五象旅游集团有限公司','市场总监','wangjiaqi@qsx.com','CUSTOMER_Existing','CUSS_Active',30,'','2017-03-07 09:31:58','2017-03-07 09:33:12'),
	(17,'PRS1488850473522','胡鼎原','13677222222','中科方原软件有限公司','财务主管','hudingy@qsx.com','CUSTOMER_Telemarketing','CUSS_Potential',31,'','2017-03-07 09:33:14','2017-03-07 09:34:33'),
	(18,'PRS1488966231290','李福','15820000000','北京双喜临门婚庆公司','门市经理','lifu@qsx.com','CUSTOMER_Other','CUSS_Active',12,'','2017-03-08 17:42:38','2017-03-08 17:43:51'),
	(19,'PRS1488966293116','卢奇正','13888888888','厦门奇正科技有限公司','研发总监','luqizheng@qsx.com','CUSTOMER_Existing','CUSS_Active',27,'','2017-03-08 17:44:07','2017-03-08 17:44:53'),
	(20,'PRS1488966383207','肖郁','13810102222','杭州恩斯美莱美容医疗器材公司','采购经理','xiaoyu@qsx.com','CUSTOMER_Telemarketing','CUSS_Invalid',27,'','2017-03-08 17:44:58','2017-03-08 17:46:23');

/*!40000 ALTER TABLE `qsx_prospective` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table qsx_province
# ------------------------------------------------------------

DROP TABLE IF EXISTS `qsx_province`;

CREATE TABLE `qsx_province` (
  `code` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `pinyin` varchar(255) DEFAULT NULL,
  `key` varchar(255) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `qsx_province` WRITE;
/*!40000 ALTER TABLE `qsx_province` DISABLE KEYS */;

INSERT INTO `qsx_province` (`code`, `name`, `pinyin`, `key`)
VALUES
	('上海','上海','shanghai','cn-sh'),
	('云南','云南','yunnan','cn-yn'),
	('内蒙古','内蒙古','neimenggu','cn-nm'),
	('北京','北京','beijing','cn-bj'),
	('台湾省','台湾省','taiwansheng','tw-tw'),
	('吉林','吉林','jilin','cn-jl'),
	('四川','四川','sichuan','cn-sc'),
	('天津','天津','tianjin','cn-tj'),
	('宁夏','宁夏','ningxia','cn-nx'),
	('安徽','安徽','anhui','cn-ah'),
	('山东','山东','shandong','cn-sd'),
	('山西','山西','shanxi','cn-sx'),
	('广东','广东','guangdong','cn-gd'),
	('广西','广西','guangxi','cn-gx'),
	('新疆','新疆','xinjiang','cn-xj'),
	('江苏','江苏','jiangsu','cn-js'),
	('江西','江西','jiangxi','cn-jx'),
	('河北','河北','hebei','cn-hb'),
	('河南','河南','henan','cn-he'),
	('浙江','浙江','zhejiang','cn-zj'),
	('海南','海南','hainan','cn-ha'),
	('湖北','湖北','hubei','cn-hu'),
	('湖南','湖南','hunan','cn-hn'),
	('澳门特别行政区','澳门特别行政区','aomentebiexingzhengqu','cn-3681'),
	('甘肃','甘肃','gansu','cn-gs'),
	('福建','福建','fujian','cn-fj'),
	('西藏','西藏','xizang','cn-xz'),
	('贵州','贵州','guizhou','cn-gz'),
	('辽宁','辽宁','liaoning','cn-ln'),
	('重庆','重庆','zhongqing','cn-cq'),
	('陕西','陕西','shanxi','cn-sa'),
	('青海','青海','qinghai','cn-qh'),
	('香港特别行政区','香港特别行政区','xianggangtebiexingzhengqu','cn-6668'),
	('黑龙江','黑龙江','heilongjiang','cn-hl');

/*!40000 ALTER TABLE `qsx_province` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table qsx_purchase_order
# ------------------------------------------------------------

DROP TABLE IF EXISTS `qsx_purchase_order`;

CREATE TABLE `qsx_purchase_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '采购订单id',
  `code` varchar(50) DEFAULT NULL COMMENT '编码',
  `theme` varchar(50) DEFAULT NULL COMMENT '主题',
  `supplier_id` bigint(20) DEFAULT NULL COMMENT '供应商id',
  `contactName` varchar(50) DEFAULT NULL COMMENT '联系人id',
  `contactPhone` varchar(50) DEFAULT NULL COMMENT '联系人id',
  `freight_code` varchar(50) DEFAULT NULL COMMENT '货运商',
  `status_code` varchar(225) DEFAULT NULL COMMENT '状态',
  `user_id` bigint(20) DEFAULT NULL COMMENT '负责人',
  `payAddress` varchar(500) DEFAULT NULL COMMENT '付款地址',
  `receiveAddress` varchar(500) DEFAULT NULL COMMENT '送货地址',
  `instruction` varchar(500) DEFAULT NULL COMMENT '说明信息',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL COMMENT '最后更新时间',
  `totalAmount` double DEFAULT NULL COMMENT '总价',
  `totalQuantity` int(11) DEFAULT NULL COMMENT '总量',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `FK_qsx_purchase_order_qsx_supplier` (`supplier_id`),
  KEY `FK_qsx_purchase_order_qsx_dictionary` (`freight_code`),
  KEY `FK_qsx_purchase_order_qsx_dictionary_2` (`status_code`),
  KEY `FK_qsx_purchase_order_qsx_user` (`user_id`),
  CONSTRAINT `FK_qsx_purchase_order_qsx_dictionary` FOREIGN KEY (`freight_code`) REFERENCES `qsx_dictionary` (`code`),
  CONSTRAINT `FK_qsx_purchase_order_qsx_dictionary_2` FOREIGN KEY (`status_code`) REFERENCES `qsx_dictionary` (`code`),
  CONSTRAINT `FK_qsx_purchase_order_qsx_supplier` FOREIGN KEY (`supplier_id`) REFERENCES `qsx_supplier` (`id`),
  CONSTRAINT `FK_qsx_purchase_order_qsx_user` FOREIGN KEY (`user_id`) REFERENCES `qsx_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采购订单';

LOCK TABLES `qsx_purchase_order` WRITE;
/*!40000 ALTER TABLE `qsx_purchase_order` DISABLE KEYS */;

INSERT INTO `qsx_purchase_order` (`id`, `code`, `theme`, `supplier_id`, `contactName`, `contactPhone`, `freight_code`, `status_code`, `user_id`, `payAddress`, `receiveAddress`, `instruction`, `createTime`, `updateTime`, `totalAmount`, `totalQuantity`)
VALUES
	(1,'PUR1488788701295','平衡车',7,'肖先生','15911111111','FREIGHT_Sf','PURCHASE_Built',27,'武汉市汉阳区牛家湾10号','武汉市江夏区航雨园b17栋','','2017-03-06 16:04:32','2017-03-07 16:41:47',159920,80),
	(2,'PUR1488788782219','智能电饭煲第一批',7,'于小姐','15911111111','FREIGHT_Sf','PURCHASE_Received',31,'武汉市江夏区航雨园b17栋','上海浦东通园路潼港一村25号 ','','2017-03-06 16:25:04','2017-03-07 17:34:41',3990,10),
	(3,'PUR1488788841426','小米手机第二批',7,'肖先生','15911111111','FREIGHT_Sto','PURCHASE_Canceled',34,'上海浦东通园路潼港一村25号 ','上海浦东通园路潼港一村25号 ','','2017-03-06 16:26:26','2017-03-08 17:39:30',1299500,500),
	(4,'PUR1488791732593','儿童手表',13,'岳云','15911111111','FREIGHT_Sto','PURCHASE_Delivered',31,'上海浦东通园路潼港一村25号','武汉市江夏区航雨园b17栋','只要黄色/红色/蓝色','2017-03-06 17:13:39','2017-03-07 16:40:34',29900,100),
	(5,'PUR1488791896174','智能摄像机',8,'秦玺','15911111111','FREIGHT_Postal','PURCHASE_Received',29,'上海浦东通园路潼港一村25号 ','武汉市江夏区航雨园b17栋','','2017-03-06 17:16:40','2017-03-07 16:40:45',19950,50),
	(6,'PUR1488791981629','智能盒子',10,'吴小姐','15911111111','FREIGHT_Postal','PURCHASE_Delivered',30,'武汉市江夏区航雨园b17栋','武汉市江夏区航雨园b17栋','库存较多，暂时不需要购买','2017-03-06 17:18:22','2017-03-07 16:40:58',2990,10),
	(7,'PUR1488875851294','米兔手表',11,'吴晓宇','15911111111','FREIGHT_Sto','PURCHASE_Reviewed',29,'武胜路前进街1-5栋6单元','武胜路前进街1-5栋6单元','','2017-03-07 16:36:28','2017-03-07 16:41:20',119600,400),
	(8,'PUR1488967192846','采购九号平衡车',8,'小金','15911111111','FREIGHT_Sto','PURCHASE_Canceled',33,'西安市科技六路1号','西安市科技六路1号','','2017-03-08 17:58:54','2017-03-08 17:59:52',39980,20),
	(9,'PUR1488967355725','采购米家行车记录仪',11,'俞小姐','15911111111','FREIGHT_Sf','PURCHASE_Reviewed',33,'济南太白南路212','武汉光谷金融港5路12栋1001','','2017-03-08 18:01:11','2017-03-08 18:02:35',6980,20),
	(10,'PUR1488967457464','采购空气净化器20台',14,'黄小姐','15911111111','FREIGHT_Sto','PURCHASE_Delivered',34,'吉林市园艺文化街8-1号','武汉市光谷金融港15栋1501','','2017-03-08 18:02:42','2017-03-08 18:04:17',13980,20),
	(11,'PUR1488967546320','采购路由器50个',17,'黄榆生','15911111111','FREIGHT_Sf','PURCHASE_Delivered',34,' 吉林省吉林市龙潭区承德街45号','武汉市金融港6路12栋1001','','2017-03-08 18:04:26','2017-03-08 18:05:46',24950,50);

/*!40000 ALTER TABLE `qsx_purchase_order` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table qsx_purchase_order_item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `qsx_purchase_order_item`;

CREATE TABLE `qsx_purchase_order_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '采购订单条目id',
  `purchaseOrder_id` bigint(20) DEFAULT NULL COMMENT '采购订单Id',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品id',
  `quantity` int(11) DEFAULT NULL COMMENT '产品数量',
  `amount` double DEFAULT NULL COMMENT '产品总价',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`),
  KEY `FK_qsx_purchase_order_item_qsx_purchase_order` (`purchaseOrder_id`),
  KEY `FK_qsx_purchase_order_item_qsx_product` (`product_id`),
  CONSTRAINT `FK_qsx_purchase_order_item_qsx_product` FOREIGN KEY (`product_id`) REFERENCES `qsx_product` (`id`),
  CONSTRAINT `FK_qsx_purchase_order_item_qsx_purchase_order` FOREIGN KEY (`purchaseOrder_id`) REFERENCES `qsx_purchase_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采购订单条目';

LOCK TABLES `qsx_purchase_order_item` WRITE;
/*!40000 ALTER TABLE `qsx_purchase_order_item` DISABLE KEYS */;

INSERT INTO `qsx_purchase_order_item` (`id`, `purchaseOrder_id`, `product_id`, `quantity`, `amount`, `createTime`, `updateTime`)
VALUES
	(1,1,43,80,159920,'2017-03-07 16:41:47','2017-03-07 16:41:47'),
	(2,2,33,10,3990,'2017-03-07 17:34:41','2017-03-07 17:34:41'),
	(3,3,34,500,1299500,'2017-03-08 17:39:30','2017-03-08 17:39:30'),
	(4,4,40,100,29900,'2017-03-07 16:40:34','2017-03-07 16:40:34'),
	(5,5,41,50,19950,'2017-03-07 16:40:45','2017-03-07 16:40:45'),
	(6,6,37,10,2990,'2017-03-07 16:40:58','2017-03-07 16:40:58'),
	(7,7,40,400,119600,'2017-03-07 16:41:20','2017-03-07 16:41:20'),
	(8,8,43,20,39980,'2017-03-08 17:59:52','2017-03-08 17:59:52'),
	(9,9,39,20,6980,'2017-03-08 18:02:35','2017-03-08 18:02:35'),
	(10,10,42,20,13980,'2017-03-08 18:04:17','2017-03-08 18:04:17'),
	(11,11,38,50,24950,'2017-03-08 18:05:46','2017-03-08 18:05:46');

/*!40000 ALTER TABLE `qsx_purchase_order_item` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table qsx_quotation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `qsx_quotation`;

CREATE TABLE `qsx_quotation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '报价id',
  `code` varchar(50) DEFAULT NULL COMMENT '报价编码',
  `title` varchar(50) DEFAULT NULL COMMENT '报价标题',
  `status_code` varchar(50) DEFAULT NULL COMMENT '报价单状态',
  `opportunity_id` bigint(20) DEFAULT NULL COMMENT '销售机会id',
  `contact_id` bigint(20) DEFAULT NULL COMMENT '联系人Id',
  `customer_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '负责人',
  `freight_code` varchar(225) DEFAULT NULL COMMENT '货运商',
  `invoiceAddress` varchar(500) DEFAULT NULL COMMENT '发票地址',
  `receiverAddress` varchar(500) DEFAULT NULL COMMENT '收货地址',
  `description` text COMMENT '说明',
  `totalAmount` double DEFAULT NULL COMMENT '产品总价',
  `totalQuantity` int(11) DEFAULT NULL COMMENT '产品总数',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `FK_qsx_quotation_qsx_dictionary` (`status_code`),
  KEY `FK_qsx_quotation_qsx_opportunity` (`opportunity_id`),
  KEY `FK_qsx_quotation_qsx_contact` (`contact_id`),
  KEY `FK_qsx_quotation_qsx_customer` (`customer_id`),
  KEY `FK_qsx_quotation_qsx_user` (`user_id`),
  KEY `FK_qsx_quotation_qsx_dictionary_2` (`freight_code`),
  CONSTRAINT `FK_qsx_quotation_qsx_contact` FOREIGN KEY (`contact_id`) REFERENCES `qsx_contact` (`id`),
  CONSTRAINT `FK_qsx_quotation_qsx_customer` FOREIGN KEY (`customer_id`) REFERENCES `qsx_customer` (`id`),
  CONSTRAINT `FK_qsx_quotation_qsx_dictionary` FOREIGN KEY (`status_code`) REFERENCES `qsx_dictionary` (`code`),
  CONSTRAINT `FK_qsx_quotation_qsx_dictionary_2` FOREIGN KEY (`freight_code`) REFERENCES `qsx_dictionary` (`code`),
  CONSTRAINT `FK_qsx_quotation_qsx_opportunity` FOREIGN KEY (`opportunity_id`) REFERENCES `qsx_opportunity` (`id`),
  CONSTRAINT `FK_qsx_quotation_qsx_user` FOREIGN KEY (`user_id`) REFERENCES `qsx_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='报价单';

LOCK TABLES `qsx_quotation` WRITE;
/*!40000 ALTER TABLE `qsx_quotation` DISABLE KEYS */;

INSERT INTO `qsx_quotation` (`id`, `code`, `title`, `status_code`, `opportunity_id`, `contact_id`, `customer_id`, `user_id`, `freight_code`, `invoiceAddress`, `receiverAddress`, `description`, `totalAmount`, `totalQuantity`, `createTime`, `updateTime`)
VALUES
	(1,'QUO1488877256331','凯梅西第一次报价','QUOTATION_Built',5,20,26,30,'FREIGHT_Sf','武汉市硚口区张毕湖路2号','武汉市硚口区张毕湖路2号','',46990,10,'2017-03-07 16:59:00','2017-03-13 10:24:38'),
	(2,'QUO1488877329189','华艺爱民广告报价单','QUOTATION_Reviewed',9,21,27,29,'FREIGHT_Sto',' 武汉市硚口区张毕湖路2号',' 武汉市硚口区张毕湖路2号','',7996,4,'2017-03-07 17:01:11','2017-03-07 17:02:16'),
	(3,'QUO1488877393970','全坤网络订单报价','QUOTATION_Accepted',7,20,28,31,'FREIGHT_Postal',' 武汉市硚口区张毕湖路2号',' 武汉市硚口区张毕湖路2号','',46990,10,'2017-03-07 17:02:24','2017-03-07 17:03:13'),
	(4,'QUO1488877504480','全坤网络订单第二次报价','QUOTATION_Denied',7,23,24,31,'FREIGHT_Sf','武汉市硚口区张毕湖路2号\n','武汉市硚口区张毕湖路2号\n','',140970,30,'2017-03-07 17:04:13','2017-03-07 17:05:04'),
	(5,'QUO1488877558270','奥美空气净化器订单报价','QUOTATION_Reviewed',6,21,26,31,'FREIGHT_Sf','武汉市硚口区张毕湖路2号\n','武汉市硚口区张毕湖路2号\n','',6990,10,'2017-03-07 17:05:08','2017-03-07 17:05:58'),
	(6,'QUO1488877619229','银马广告采购米兔手表100订单报价','QUOTATION_Built',11,21,31,32,'FREIGHT_Sf',' 武汉市硚口区张毕湖路2号',' 武汉市硚口区张毕湖路2号','',29900,100,'2017-03-07 17:06:06','2017-03-07 17:06:59'),
	(7,'QUO1488877679949','马涛采购小米笔记本订单报价','QUOTATION_Reviewed',13,23,27,32,'FREIGHT_Sto',' 武汉市硚口区张毕湖路2号',' 武汉市硚口区张毕湖路2号','',24995,5,'2017-03-07 17:07:04','2017-03-07 17:07:59'),
	(8,'QUO1488877742070','坤宁健康采购小米平板报价单','QUOTATION_Built',15,23,34,30,'FREIGHT_Sto',' 武汉市硚口区张毕湖路2号',' 武汉市硚口区张毕湖路2号','',9990,10,'2017-03-07 17:08:09','2017-03-07 17:09:02'),
	(9,'QUO1488877808009','宏业科技采购智能摄像头订单报价','QUOTATION_Reviewed',12,18,26,31,'FREIGHT_Sf',' 武汉市硚口区张毕湖路2号',' 武汉市硚口区张毕湖路2号','',39900,100,'2017-03-07 17:09:10','2017-03-07 17:10:08'),
	(10,'QUO1488877870479','灵气投资采购净化器第一次报价','QUOTATION_Built',14,20,28,31,'FREIGHT_Sto',' 武汉市硚口区张毕湖路2号',' 武汉市硚口区张毕湖路2号','',3495,5,'2017-03-07 17:10:12','2017-03-07 17:11:10'),
	(11,'QUO1488877941340','凯梅西第二次报价','QUOTATION_Accepted',5,18,28,32,'FREIGHT_Sf','武汉市硚口区张毕湖路2号','武汉市硚口区张毕湖路2号','',140970,30,'2017-03-07 17:11:28','2017-03-07 17:12:21'),
	(12,'QUO1488965586577','奥美采购平衡车报价单','QUOTATION_Built',6,21,27,29,'FREIGHT_Sf',' 武汉市黄陂区大南街194号',' 武汉市黄陂区大南街194号','',19990,10,'2017-03-08 17:31:55','2017-03-08 17:33:06');

/*!40000 ALTER TABLE `qsx_quotation` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table qsx_quotation_item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `qsx_quotation_item`;

CREATE TABLE `qsx_quotation_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '报价单Id',
  `quotation_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品id',
  `quantity` int(11) DEFAULT NULL COMMENT '数量',
  `amount` double DEFAULT NULL COMMENT '总价',
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_qsx_quotation_item_qsx_quotation` (`quotation_id`),
  KEY `FK_qsx_quotation_item_qsx_product` (`product_id`),
  CONSTRAINT `FK_qsx_quotation_item_qsx_product` FOREIGN KEY (`product_id`) REFERENCES `qsx_product` (`id`),
  CONSTRAINT `FK_qsx_quotation_item_qsx_quotation` FOREIGN KEY (`quotation_id`) REFERENCES `qsx_quotation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='报价单条目';

LOCK TABLES `qsx_quotation_item` WRITE;
/*!40000 ALTER TABLE `qsx_quotation_item` DISABLE KEYS */;

INSERT INTO `qsx_quotation_item` (`id`, `quotation_id`, `product_id`, `quantity`, `amount`, `createTime`, `updateTime`)
VALUES
	(1,1,36,10,46990,'2017-03-13 10:24:38','2017-03-13 10:24:38'),
	(2,2,43,4,7996,'2017-03-07 17:02:16','2017-03-07 17:02:16'),
	(3,3,36,10,46990,'2017-03-07 17:03:13','2017-03-07 17:03:13'),
	(4,4,36,30,140970,'2017-03-07 17:05:04','2017-03-07 17:05:04'),
	(5,5,42,10,6990,'2017-03-07 17:05:58','2017-03-07 17:05:58'),
	(6,6,40,100,29900,'2017-03-07 17:06:59','2017-03-07 17:06:59'),
	(7,7,35,5,24995,'2017-03-07 17:07:59','2017-03-07 17:07:59'),
	(8,8,32,10,9990,'2017-03-07 17:09:02','2017-03-07 17:09:02'),
	(9,9,41,100,39900,'2017-03-07 17:10:08','2017-03-07 17:10:08'),
	(10,10,42,5,3495,'2017-03-07 17:11:10','2017-03-07 17:11:10'),
	(11,11,36,30,140970,'2017-03-07 17:12:21','2017-03-07 17:12:21'),
	(12,12,43,10,19990,'2017-03-08 17:33:06','2017-03-08 17:33:06');

/*!40000 ALTER TABLE `qsx_quotation_item` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table qsx_region
# ------------------------------------------------------------

DROP TABLE IF EXISTS `qsx_region`;

CREATE TABLE `qsx_region` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `qsx_region` WRITE;
/*!40000 ALTER TABLE `qsx_region` DISABLE KEYS */;

INSERT INTO `qsx_region` (`id`, `name`, `description`, `createTime`, `updateTime`)
VALUES
	(1,'华东地区',NULL,NULL,NULL),
	(2,'华南地区',NULL,NULL,NULL),
	(3,'华中地区',NULL,NULL,NULL),
	(4,'华北地区',NULL,NULL,NULL),
	(5,'西南地区',NULL,NULL,NULL),
	(6,'东北地区',NULL,NULL,NULL),
	(7,'台港澳地区',NULL,NULL,NULL);

/*!40000 ALTER TABLE `qsx_region` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table qsx_resource
# ------------------------------------------------------------

DROP TABLE IF EXISTS `qsx_resource`;

CREATE TABLE `qsx_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `qsx_resource` WRITE;
/*!40000 ALTER TABLE `qsx_resource` DISABLE KEYS */;

INSERT INTO `qsx_resource` (`id`, `name`, `url`, `createTime`, `updateTime`)
VALUES
	(10,'保存产品','product/save','2016-01-13 11:04:10','2016-01-13 11:04:10'),
	(11,'更新产品','product/update','2016-03-22 14:56:39','2016-03-22 14:56:39'),
	(12,'删除产品','product/delete/*','2016-03-22 15:09:34','2016-03-22 15:09:34'),
	(13,'保存客户','customer/save','2017-03-13 09:40:44','2017-03-13 09:40:44'),
	(14,'更新客户','customer/update','2017-03-13 09:41:01','2017-03-13 09:41:01'),
	(15,'删除客户','customer/delete/*','2017-03-13 09:42:35','2017-03-13 09:42:35'),
	(16,'修改客户状态','customer/change/*','2017-03-13 09:41:52','2017-03-13 09:41:52'),
	(17,'导出客户','customer/doExport/*','2017-03-13 09:42:21','2017-03-13 09:42:21'),
	(18,'保存销售机会','opportunity/save','2017-03-13 09:43:18','2017-03-13 09:43:18'),
	(19,'更新销售机会','opportunity/update','2017-03-13 09:51:25','2017-03-13 09:51:25'),
	(20,'删除销售机会','opportunity/delete/*','2017-03-13 09:51:48','2017-03-13 09:51:48'),
	(21,'保存报价单','quotation/save','2017-03-13 09:52:32','2017-03-13 09:52:32'),
	(22,'更新报价单','quotation/update','2017-03-13 09:52:46','2017-03-13 09:52:46'),
	(23,'删除报价单','quotation/delete/*','2017-03-13 09:53:00','2017-03-13 09:53:00'),
	(24,'保存销售订单','salesorder/save','2017-03-13 09:56:10','2017-03-13 09:56:10'),
	(25,'更新销售订单','salesorder/update','2017-03-13 09:56:23','2017-03-13 09:56:23'),
	(26,'删除销售订单','salesorder/delete/*','2017-03-13 09:56:43','2017-03-13 09:56:43'),
	(27,'保存营销活动','campaign/save','2017-03-13 09:57:24','2017-03-13 09:57:24'),
	(28,'更新营销活动','campaign/update','2017-03-13 09:57:41','2017-03-13 09:57:41'),
	(29,'删除营销活动','campaign/delete/*','2017-03-13 09:58:04','2017-03-13 09:58:04'),
	(30,'保存潜在客户','prospective/save','2017-03-13 09:58:31','2017-03-13 09:58:31'),
	(31,'更新潜在客户','prospective/update','2017-03-13 09:58:48','2017-03-13 09:58:48'),
	(32,'删除潜在客户','prospective/delete/*','2017-03-13 09:59:08','2017-03-13 09:59:08'),
	(33,'保存问题单','issue/save','2017-03-13 09:59:38','2017-03-13 09:59:38'),
	(34,'更新问题单','issue/update','2017-03-13 10:00:02','2017-03-13 10:00:02'),
	(35,'删除问题单','issue/delete/*','2017-03-13 10:00:15','2017-03-13 10:00:15'),
	(36,'保存常见问题','problem/save','2017-03-13 10:00:44','2017-03-13 10:00:44'),
	(37,'更新常见问题','problem/update','2017-03-13 10:01:09','2017-03-13 10:01:09'),
	(38,'删除常见问题','problem/delete/*','2017-03-13 10:01:24','2017-03-13 10:01:24'),
	(39,'保存产品分类','category/save','2017-03-13 10:01:42','2017-03-13 10:01:42'),
	(40,'更新产品分类','category/update','2017-03-13 10:01:53','2017-03-13 10:01:53'),
	(41,'删除产品分类','category/delete/*','2017-03-13 10:02:08','2017-03-13 10:02:08'),
	(42,'保存供应商','supplier/save','2017-03-13 10:02:38','2017-03-13 10:02:38'),
	(43,'更新供应商','supplier/update','2017-03-13 10:02:50','2017-03-13 10:02:50'),
	(44,'删除供应商','supplier/delete/*','2017-03-13 10:03:41','2017-03-13 10:03:41'),
	(45,'保存采购订单','purchaseorder/save','2017-03-13 10:06:14','2017-03-13 10:06:14'),
	(46,'删除报价单明细','quotationitem/delete/*','2017-03-13 10:15:24','2017-03-13 10:15:24'),
	(47,'修改产品状态','product/change/*','2017-03-13 10:16:20','2017-03-13 10:16:20'),
	(48,'更新采购订单','purchaseorder/update','2017-03-13 10:16:54','2017-03-13 10:16:54'),
	(49,'删除采购订单','purchaseorder/delete','2017-03-13 10:17:07','2017-03-13 10:17:07'),
	(50,'保存用户','user/save','2017-03-13 10:17:34','2017-03-13 10:17:34'),
	(51,'更新用户','user/update','2017-03-13 10:17:45','2017-03-13 10:17:45'),
	(52,'删除用户','user/delete/*','2017-03-13 10:18:27','2017-03-13 10:18:27'),
	(53,'保存角色','role/save','2017-03-13 10:18:49','2017-03-13 10:18:49'),
	(54,'更新角色','role/update','2017-03-13 10:18:58','2017-03-13 10:18:58'),
	(55,'删除角色','role/delete/*','2017-03-13 10:19:10','2017-03-13 10:19:10'),
	(56,'保存部门','department/save','2017-03-13 10:19:33','2017-03-13 10:19:33'),
	(57,'更新部门','department/update','2017-03-13 10:19:48','2017-03-13 10:19:48'),
	(58,'删除部门','department/delete/*','2017-03-13 10:20:00','2017-03-13 10:20:00'),
	(59,'保存菜单','menu/save','2017-03-13 10:20:48','2017-03-13 10:20:48'),
	(60,'删除菜单','menu/delete/*','2017-03-13 10:21:06','2017-03-13 10:21:06'),
	(61,'菜单资源管理','menu/resource/**','2017-03-13 10:21:39','2017-03-13 10:21:39'),
	(62,'更新销售机会','opportunity/update','2017-03-13 11:45:39','2017-03-13 11:45:39');

/*!40000 ALTER TABLE `qsx_resource` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table qsx_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `qsx_role`;

CREATE TABLE `qsx_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `qsx_role` WRITE;
/*!40000 ALTER TABLE `qsx_role` DISABLE KEYS */;

INSERT INTO `qsx_role` (`id`, `name`, `createTime`, `updateTime`)
VALUES
	(1,'管理员','2015-12-01 15:54:24','2015-12-01 15:54:25'),
	(10,'采购人员','2017-03-06 15:33:57','2017-03-06 15:34:05'),
	(11,'销售人员','2017-03-06 15:42:21','2017-03-13 10:25:07'),
	(12,'市场营销','2017-03-06 15:43:22','2017-03-13 10:25:17'),
	(13,'客服人员','2017-03-06 15:43:27','2017-03-13 10:25:22');

/*!40000 ALTER TABLE `qsx_role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table qsx_role_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `qsx_role_menu`;

CREATE TABLE `qsx_role_menu` (
  `roleId` bigint(20) NOT NULL,
  `menuId` bigint(20) NOT NULL,
  PRIMARY KEY (`roleId`,`menuId`),
  KEY `FK431C151F107128C7` (`menuId`),
  KEY `FK431C151F888D1567` (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `qsx_role_menu` WRITE;
/*!40000 ALTER TABLE `qsx_role_menu` DISABLE KEYS */;

INSERT INTO `qsx_role_menu` (`roleId`, `menuId`)
VALUES
	(1,39),
	(1,40),
	(1,41),
	(1,54),
	(1,55),
	(1,56),
	(1,75),
	(11,75),
	(12,75),
	(13,75),
	(1,76),
	(11,76),
	(12,76),
	(13,76),
	(1,77),
	(11,77),
	(12,77),
	(13,77),
	(1,78),
	(10,78),
	(12,78),
	(1,79),
	(10,79),
	(12,79),
	(1,80),
	(10,80),
	(12,80),
	(1,81),
	(10,81),
	(12,81),
	(1,87),
	(10,87),
	(1,88),
	(10,88),
	(1,89),
	(10,89),
	(12,89),
	(1,108),
	(11,108),
	(1,109),
	(11,109),
	(1,111),
	(11,111),
	(1,112),
	(11,112),
	(1,113),
	(11,113),
	(1,114),
	(12,114),
	(1,115),
	(12,115),
	(1,116),
	(12,116);

/*!40000 ALTER TABLE `qsx_role_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table qsx_role_resource
# ------------------------------------------------------------

DROP TABLE IF EXISTS `qsx_role_resource`;

CREATE TABLE `qsx_role_resource` (
  `roleId` bigint(20) NOT NULL,
  `resourceId` bigint(20) NOT NULL,
  PRIMARY KEY (`roleId`,`resourceId`),
  KEY `FK8E8EE3CE888D1567` (`roleId`),
  KEY `FK8E8EE3CE78E7B6` (`resourceId`),
  CONSTRAINT `FK8E8EE3CE78E7B6` FOREIGN KEY (`resourceId`) REFERENCES `qsx_menu` (`id`),
  CONSTRAINT `FK8E8EE3CE888D1567` FOREIGN KEY (`roleId`) REFERENCES `qsx_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table qsx_sales_order
# ------------------------------------------------------------

DROP TABLE IF EXISTS `qsx_sales_order`;

CREATE TABLE `qsx_sales_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '销售订单id',
  `code` varchar(50) DEFAULT NULL COMMENT '编码',
  `theme` varchar(50) DEFAULT NULL COMMENT '主题',
  `quotation_id` bigint(20) DEFAULT NULL COMMENT '报价单',
  `opportunity_id` bigint(20) DEFAULT NULL COMMENT '销售机会',
  `freight_code` varchar(50) DEFAULT NULL COMMENT '货运商',
  `status_code` varchar(50) DEFAULT NULL COMMENT '状态',
  `customer_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `contact_id` bigint(20) DEFAULT NULL COMMENT '联系人id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `payAddress` varchar(500) DEFAULT NULL COMMENT '付款地址',
  `receiveAddress` varchar(500) DEFAULT NULL COMMENT '送货地址',
  `instruction` text COMMENT '说明',
  `totalAmount` double DEFAULT NULL COMMENT '产品总价',
  `totalQuantity` int(11) DEFAULT NULL COMMENT '产品总数',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `FK_qsx_sales_order_qsx_quotation` (`quotation_id`),
  KEY `FK_qsx_sales_order_qsx_opportunity` (`opportunity_id`),
  KEY `FK_qsx_sales_order_qsx_dictionary` (`freight_code`),
  KEY `FK_qsx_sales_order_qsx_dictionary_2` (`status_code`),
  KEY `FK_qsx_sales_order_qsx_customer` (`customer_id`),
  KEY `FK_qsx_sales_order_qsx_contact` (`contact_id`),
  KEY `FK_qsx_sales_order_qsx_user` (`user_id`),
  CONSTRAINT `FK_qsx_sales_order_qsx_contact` FOREIGN KEY (`contact_id`) REFERENCES `qsx_contact` (`id`),
  CONSTRAINT `FK_qsx_sales_order_qsx_customer` FOREIGN KEY (`customer_id`) REFERENCES `qsx_customer` (`id`),
  CONSTRAINT `FK_qsx_sales_order_qsx_dictionary` FOREIGN KEY (`freight_code`) REFERENCES `qsx_dictionary` (`code`),
  CONSTRAINT `FK_qsx_sales_order_qsx_dictionary_2` FOREIGN KEY (`status_code`) REFERENCES `qsx_dictionary` (`code`),
  CONSTRAINT `FK_qsx_sales_order_qsx_opportunity` FOREIGN KEY (`opportunity_id`) REFERENCES `qsx_opportunity` (`id`),
  CONSTRAINT `FK_qsx_sales_order_qsx_quotation` FOREIGN KEY (`quotation_id`) REFERENCES `qsx_quotation` (`id`),
  CONSTRAINT `FK_qsx_sales_order_qsx_user` FOREIGN KEY (`user_id`) REFERENCES `qsx_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='销售订单';

LOCK TABLES `qsx_sales_order` WRITE;
/*!40000 ALTER TABLE `qsx_sales_order` DISABLE KEYS */;

INSERT INTO `qsx_sales_order` (`id`, `code`, `theme`, `quotation_id`, `opportunity_id`, `freight_code`, `status_code`, `customer_id`, `contact_id`, `user_id`, `payAddress`, `receiveAddress`, `instruction`, `totalAmount`, `totalQuantity`, `createTime`, `updateTime`)
VALUES
	(1,'SAO1488878030907','凯梅西购买小米电视30台',11,5,'FREIGHT_Sf','SALESORDER_Reviewed',31,20,30,' 武汉市硚口区张毕湖路2号',' 武汉市硚口区张毕湖路2号','',140970,30,'2017-02-28 17:12:29','2017-03-07 17:13:50'),
	(2,'SAO1488878101482','华艺爱民广告平衡车5台',2,9,'FREIGHT_Sto','SALESORDER_Reviewed',28,21,31,'武汉市硚口区张毕湖路2号','武汉市硚口区张毕湖路2号','',9995,5,'2017-03-07 17:13:55','2017-03-07 17:15:01'),
	(3,'SAO1488878176139','奥美空气购买净化器10台',5,6,'FREIGHT_Sf','SALESORDER_Reviewed',31,20,31,'武汉市硚口区张毕湖路2号','武汉市硚口区张毕湖路2号','',6990,10,'2017-01-18 17:15:04','2017-03-07 17:16:16'),
	(5,'SAO1488878373686','维普信息技术采购笔记本10',2,13,'FREIGHT_Sto','SALESORDER_Commit',32,19,32,'武汉市硚口区张毕湖路2号','武汉市硚口区张毕湖路2号','',49990,10,'2017-02-22 17:16:24','2017-03-07 17:19:33'),
	(6,'SAO1488878473206','坤宁健康采购小米平板20台',8,15,'FREIGHT_Postal','SALESORDER_Commit',34,20,32,'武汉市硚口区张毕湖路2号','武汉市硚口区张毕湖路2号','',22280,21,'2017-03-16 17:19:39','2017-03-13 11:34:54'),
	(7,'SAO1488878539735','灵气投资采购净化器5台',10,14,'FREIGHT_Sf','SALESORDER_Reviewed',28,21,30,'武汉市硚口区张毕湖路2号','武汉市硚口区张毕湖路2号','',5795,6,'2017-02-08 17:21:26','2017-03-13 11:35:34'),
	(8,'SAO1488878607225','宏业科技采购智能摄像头',9,12,'FREIGHT_Sf','SALESORDER_Commit',26,20,30,'武汉市硚口区张毕湖路2号','武汉市硚口区张毕湖路2号','',27930,70,'2017-03-07 17:22:28','2017-03-07 17:23:27'),
	(9,'SAO1488878682919','银马广告购买100个米兔手表',6,11,'FREIGHT_Sf','SALESORDER_Commit',31,21,30,'武汉市硚口区张毕湖路2号','武汉市硚口区张毕湖路2号','',29900,100,'2017-04-19 17:23:32','2017-03-07 17:24:42'),
	(10,'SAO1488878783504','冯璇采购平衡车2台',11,9,'FREIGHT_Sf','SALESORDER_Commit',31,23,29,'武汉市硚口区张毕湖路2号','武汉市硚口区张毕湖路2号','',3998,2,'2017-03-07 17:25:05','2017-03-07 17:26:23'),
	(11,'SAO1488878849409','奥美刘经理采购小米电视5台',5,6,'FREIGHT_Sf','SALESORDER_Reviewed',30,22,29,'武汉市硚口区张毕湖路2号','武汉市硚口区张毕湖路2号','',23495,5,'2017-04-13 17:26:28','2017-03-07 17:27:29'),
	(12,'SAO1488878916622','维欧马经理采购净化器20台',5,13,'FREIGHT_Sto','SALESORDER_Reviewed',27,22,31,'武汉市硚口区张毕湖路2号','武汉市硚口区张毕湖路2号','',13980,20,'2017-03-07 17:27:35','2017-03-07 17:28:36'),
	(13,'SAO1488965667200','奥美采购平衡车2台',12,6,'FREIGHT_Sf','SALESORDER_Canceled',28,21,29,' 武汉市黄陂区大南街194号',' 武汉市黄陂区大南街194号','',3998,2,'2017-03-08 17:33:21','2017-03-08 17:38:40');

/*!40000 ALTER TABLE `qsx_sales_order` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table qsx_sales_order_item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `qsx_sales_order_item`;

CREATE TABLE `qsx_sales_order_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '销售订单id',
  `salesOrder_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品id',
  `quantity` int(11) DEFAULT NULL COMMENT '数量',
  `amount` double DEFAULT NULL COMMENT '总价',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`),
  KEY `FK_qsx_sales_order_item_qsx_sales_order` (`salesOrder_id`),
  KEY `FK_qsx_sales_order_item_qsx_product` (`product_id`),
  CONSTRAINT `FK_qsx_sales_order_item_qsx_product` FOREIGN KEY (`product_id`) REFERENCES `qsx_product` (`id`),
  CONSTRAINT `FK_qsx_sales_order_item_qsx_sales_order` FOREIGN KEY (`salesOrder_id`) REFERENCES `qsx_sales_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='销售订单条目';

LOCK TABLES `qsx_sales_order_item` WRITE;
/*!40000 ALTER TABLE `qsx_sales_order_item` DISABLE KEYS */;

INSERT INTO `qsx_sales_order_item` (`id`, `salesOrder_id`, `product_id`, `quantity`, `amount`, `createTime`, `updateTime`)
VALUES
	(1,1,36,30,140970,'2017-03-07 17:13:50','2017-03-07 17:13:50'),
	(2,2,43,5,9995,'2017-03-07 17:15:01','2017-03-07 17:15:01'),
	(3,3,42,10,6990,'2017-03-07 17:16:16','2017-03-07 17:16:16'),
	(4,5,35,10,49990,'2017-03-07 17:19:33','2017-03-07 17:19:33'),
	(5,6,32,20,19980,'2017-03-13 11:34:54','2017-03-13 11:34:54'),
	(6,7,42,5,3495,'2017-03-13 11:35:34','2017-03-13 11:35:34'),
	(7,8,41,70,27930,'2017-03-07 17:23:27','2017-03-07 17:23:27'),
	(8,9,40,100,29900,'2017-03-07 17:24:42','2017-03-07 17:24:42'),
	(9,10,43,2,3998,'2017-03-07 17:26:23','2017-03-07 17:26:23'),
	(10,11,36,5,23495,'2017-03-07 17:27:29','2017-03-07 17:27:29'),
	(11,12,42,20,13980,'2017-03-07 17:28:36','2017-03-07 17:28:36'),
	(12,13,43,2,3998,'2017-03-08 17:38:40','2017-03-08 17:38:40'),
	(13,6,44,1,2300,'2017-03-13 11:34:54','2017-03-13 11:34:54'),
	(14,7,44,1,2300,'2017-03-13 11:35:34','2017-03-13 11:35:34');

/*!40000 ALTER TABLE `qsx_sales_order_item` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table qsx_supplier
# ------------------------------------------------------------

DROP TABLE IF EXISTS `qsx_supplier`;

CREATE TABLE `qsx_supplier` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(100) DEFAULT NULL COMMENT '供应商名称',
  `code` varchar(100) DEFAULT NULL COMMENT '供应商编号',
  `mobile` varchar(100) DEFAULT NULL COMMENT '电话',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `instruction` text COMMENT '说明',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='供应商';

LOCK TABLES `qsx_supplier` WRITE;
/*!40000 ALTER TABLE `qsx_supplier` DISABLE KEYS */;

INSERT INTO `qsx_supplier` (`id`, `name`, `code`, `mobile`, `email`, `instruction`, `createTime`, `updateTime`)
VALUES
	(7,'小米电器','SUP1488783509181','15800000000','xiaomi@qsx.com','小米电器','2017-03-06 14:53:51','2017-03-06 15:11:12'),
	(8,'OPPA','SUP1488783539224','15800000000','oppa@qsx.com','OPPA','2017-03-06 14:58:30','2017-03-06 15:05:12'),
	(9,'联香','SUP1488783568345','15800000000','lianxiang@qsx.com','联香','2017-03-06 14:59:00','2017-03-06 15:05:31'),
	(10,'TCK','SUP1488783592244','15800000000','tcK@qsx.com','TCK','2017-03-06 14:59:31','2017-03-06 15:04:16'),
	(11,'步步升','SUP1488783620146','15800000000','bbs@qsx.com','步步升','2017-03-06 14:59:53','2017-03-06 15:05:44'),
	(12,'三夏','SUP1488783655476','15800000000','sanxia@qsx.com','三夏','2017-03-06 15:00:21','2017-03-06 15:00:55'),
	(13,'云腾','SUP1488783684015','15800000000','yunteng@qsx.com','云腾','2017-03-06 15:00:56','2017-03-06 15:01:24'),
	(14,'华威','SUP1488783714659','15800000000','huawei@qsx.com','华为','2017-03-06 15:01:25','2017-03-06 15:03:37'),
	(15,'中新','SUP1488783740955','15800000000','zhongxin@qsx.com','中新','2017-03-06 15:01:57','2017-03-06 15:04:52'),
	(16,'Viva','SUP1488783769205','15800000000','viva@qsx.com','Viva','2017-03-06 15:02:23','2017-03-06 15:07:07'),
	(17,'SKG2','SUP1488783799936','15800000000','skg2@qsx.com','skg','2017-03-06 15:02:51','2017-03-06 15:06:50');

/*!40000 ALTER TABLE `qsx_supplier` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table qsx_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `qsx_user`;

CREATE TABLE `qsx_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `loginName` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `department_id` bigint(20) DEFAULT NULL,
  `status_code` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `loginName` (`loginName`),
  KEY `FK70089BD453BDFAE2` (`department_id`),
  KEY `FK70089BD412D6D914` (`status_code`),
  CONSTRAINT `FK70089BD412D6D914` FOREIGN KEY (`status_code`) REFERENCES `qsx_dictionary` (`code`),
  CONSTRAINT `FK70089BD453BDFAE2` FOREIGN KEY (`department_id`) REFERENCES `qsx_department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `qsx_user` WRITE;
/*!40000 ALTER TABLE `qsx_user` DISABLE KEYS */;

INSERT INTO `qsx_user` (`id`, `name`, `email`, `gender`, `loginName`, `password`, `phone`, `department_id`, `status_code`, `createTime`, `updateTime`)
VALUES
	(1,'管理员','admin@innovaee.com','男','admin','a40546cc4fd6a12572828bb803380888ad1bfdab','13115567890',NULL,'USRS_Active','2017-01-06 13:44:21','2017-01-06 13:44:21'),
	(11,'张天宇','zhang@qsx.com','男','tianyu','21232F297A57A5A743894A0E4A801FC3','15800000000',NULL,'USRS_Active','2017-01-06 14:02:15','2017-03-07 17:44:14'),
	(12,'白康','bakang@qsx.com','男','bakang','ab821952a7e19a8cfcdac2c8654de087a00dc92e','15800000000',NULL,'USRS_Disabled','2016-10-24 22:57:03','2017-03-06 15:55:03'),
	(27,'金概','jingao@qsx.com','男','jingao','075db1d8ade37b94f3dec756f9ed641de47cc398','15800000000',NULL,'USRS_Active','2017-03-06 15:34:12','2017-03-06 15:50:06'),
	(28,'馨田','xintian@qsx.com','女','xintian','5ed09e75658fd76429d2cf9d44659a6bc10ef5ed','15800000000',NULL,'USRS_Active','2017-03-06 15:35:25','2017-03-07 17:43:41'),
	(29,'马连','malian@qsx.com','女','malian','fc458f778e44a72ef88576cae88dc29493027762','15800000000',NULL,'USRS_Active','2017-03-06 15:47:36','2017-03-07 17:47:28'),
	(30,'舒刊','shukuan@qsx.com','男','shukuan','f4a6ab630ab8d45420b2bcd2bcfeaa647649ee7d','15800000000',NULL,'USRS_Active','2017-03-06 15:48:03','2017-03-06 15:49:25'),
	(31,'黄宇','huangyu@qsx.com','女','huangyu','a1df99a425699a21c8513c6e39836737be8ebe6b','15800000000',NULL,'USRS_Active','2017-03-06 15:50:11','2017-03-07 17:44:02'),
	(32,'王兴','wangxin@qsx.com','男','wangxin','f3b894eeea4601e457027e0881a63d7207e61f49','15800000000',NULL,'USRS_Active','2017-03-06 15:51:46','2017-03-07 17:43:47'),
	(33,'肖湖','xiaohu@qsx.com','男','xiaohu','0a040d8b8531a1a5f3525637efd7f9f728b57e8f','15800000000',NULL,'USRS_Active','2017-03-06 15:52:20','2017-03-07 17:43:58'),
	(34,'张鹏陈','pengchen@qsx.com','男','pengchen','d3c4e9d309ec263f546f98c62235df026425fddd','15800000000',NULL,'USRS_Active','2017-03-06 15:53:21','2017-03-07 17:44:22'),
	(35,'销售员','sales@qingshixun.com','男','sales','684bc72a4ab36146a8094256d2023abb2c1de458','13655555555',NULL,'USRS_Active','2017-03-13 10:22:02','2017-03-13 10:22:38');

/*!40000 ALTER TABLE `qsx_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table qsx_user_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `qsx_user_role`;

CREATE TABLE `qsx_user_role` (
  `userId` bigint(20) NOT NULL,
  `roleId` bigint(20) NOT NULL,
  PRIMARY KEY (`userId`,`roleId`),
  KEY `FK4353E201888D1567` (`roleId`),
  KEY `FK4353E2018E166147` (`userId`),
  CONSTRAINT `FK4353E201888D1567` FOREIGN KEY (`roleId`) REFERENCES `qsx_role` (`id`),
  CONSTRAINT `FK4353E2018E166147` FOREIGN KEY (`userId`) REFERENCES `qsx_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `qsx_user_role` WRITE;
/*!40000 ALTER TABLE `qsx_user_role` DISABLE KEYS */;

INSERT INTO `qsx_user_role` (`userId`, `roleId`)
VALUES
	(1,1),
	(11,1),
	(27,1),
	(30,1),
	(34,1),
	(11,10),
	(34,10),
	(12,11),
	(29,11),
	(31,11),
	(32,11),
	(35,11),
	(29,12),
	(31,12),
	(33,12),
	(34,12),
	(35,12),
	(28,13),
	(33,13);

/*!40000 ALTER TABLE `qsx_user_role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table qsx_user_setting
# ------------------------------------------------------------

DROP TABLE IF EXISTS `qsx_user_setting`;

CREATE TABLE `qsx_user_setting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `defaultLanguage` varchar(100) DEFAULT NULL,
  `defaultTheme` varchar(100) DEFAULT NULL,
  `fixedHeader` bit(1) DEFAULT NULL,
  `fixedNavigation` bit(1) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `FK22D83CE5B7261D30` (`user_id`),
  CONSTRAINT `FK22D83CE5B7261D30` FOREIGN KEY (`user_id`) REFERENCES `qsx_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `qsx_user_setting` WRITE;
/*!40000 ALTER TABLE `qsx_user_setting` DISABLE KEYS */;

INSERT INTO `qsx_user_setting` (`id`, `createTime`, `updateTime`, `defaultLanguage`, `defaultTheme`, `fixedHeader`, `fixedNavigation`, `user_id`)
VALUES
	(1,NULL,NULL,NULL,NULL,NULL,NULL,1);

/*!40000 ALTER TABLE `qsx_user_setting` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
