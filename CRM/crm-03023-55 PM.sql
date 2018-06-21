# ************************************************************
# Sequel Pro SQL dump
# Version 4529
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.6.15)
# Database: qsx_crm
# Generation Time: 2016-03-02 07:55:43 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


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
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `address` varchar(11) NOT NULL,
  `birthday` datetime NOT NULL,
  `gender` varchar(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `position` varchar(11) NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKBB4B8B778317728A` (`customer_id`),
  CONSTRAINT `FKBB4B8B778317728A` FOREIGN KEY (`customer_id`) REFERENCES `qsx_customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table qsx_customer
# ------------------------------------------------------------

DROP TABLE IF EXISTS `qsx_customer`;

CREATE TABLE `qsx_customer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `address` varchar(11) NOT NULL,
  `company` varchar(200) NOT NULL,
  `isVIP` bit(1) NOT NULL,
  `name` varchar(100) NOT NULL,
  `city_code` varchar(255) DEFAULT NULL,
  `owner_id` bigint(20) DEFAULT NULL,
  `province_code` varchar(255) DEFAULT NULL,
  `region_id` bigint(20) DEFAULT NULL,
  `status_code` varchar(255) DEFAULT NULL,
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

INSERT INTO `qsx_customer` (`id`, `createTime`, `updateTime`, `address`, `company`, `isVIP`, `name`, `city_code`, `owner_id`, `province_code`, `region_id`, `status_code`)
VALUES
	(5,'2015-11-30 18:09:39','2015-12-01 11:22:36','金融港','华为',b'0','辛田修改','中卫市',NULL,'宁夏',1,'USRS_Disabled'),
	(6,'2015-12-01 10:54:31','2015-12-01 10:54:31','高雄','腾讯',b'1','周杰伦','吉林市',NULL,'吉林',2,'USRS_Active'),
	(8,'2015-12-07 11:16:11','2015-12-07 11:16:28','四十四','撒打算',b'1','搜索','上海市',NULL,'上海',1,'USRS_Disabled'),
	(9,'2016-01-28 09:44:20','2016-01-12 09:44:20','四十四','www',b'1','www111','上海市',NULL,'上海',1,'USRS_Active'),
	(10,'2016-01-12 09:59:44','2016-01-12 10:00:31','武汉','武汉顶津',b'1','脉动','台湾',NULL,'台湾省',1,'USRS_Active'),
	(11,'2016-01-29 18:12:12','2016-01-28 18:12:12','湖北武汉','武汉华为',b'0','客户1','上海市',NULL,'上海',1,'USRS_Active'),
	(12,'2016-01-29 18:13:22','2016-01-28 18:13:22','湖北呼喊','华为',b'0','客户2','乌兰察布市',NULL,'内蒙古',2,'USRS_Active'),
	(13,'2016-01-28 18:14:27','2016-01-28 18:14:27','湖北武汉','湖北华为',b'0','客户3','吉林市',NULL,'吉林',3,'USRS_Active'),
	(14,'2016-01-28 18:14:52','2016-01-28 18:14:52','上海','腾讯',b'1','客户5','上海市',NULL,'上海',4,'USRS_Active'),
	(15,'2016-01-28 18:15:24','2016-01-28 18:15:24','武汉','腾讯',b'1','客户6','上海市',NULL,'上海',5,'USRS_Active'),
	(16,'2016-01-28 18:15:47','2016-01-28 18:15:47','新疆','腾讯',b'1','客户7','北京市',NULL,'北京',6,'USRS_Active'),
	(17,'2016-01-28 18:16:31','2016-01-28 18:16:31','北京','腾讯',b'1','客户8','北京市',NULL,'北京',7,'USRS_Active');

/*!40000 ALTER TABLE `qsx_customer` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table qsx_department
# ------------------------------------------------------------

DROP TABLE IF EXISTS `qsx_department`;

CREATE TABLE `qsx_department` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `qsx_department` WRITE;
/*!40000 ALTER TABLE `qsx_department` DISABLE KEYS */;

INSERT INTO `qsx_department` (`id`, `createTime`, `updateTime`, `name`)
VALUES
	(2,'2016-01-04 14:50:39','2016-01-04 14:51:03','科技部'),
	(3,'2016-01-04 14:51:41','2016-01-04 14:52:16','文化部'),
	(4,'2016-01-04 14:53:56','2016-01-04 15:16:32','教育部1');

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
	(4,1);

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
	('com.qingshixun.project.crm.model.OrderStatus','ORDS_Init','初始化状态','初始化状态',2),
	('com.qingshixun.project.crm.model.OrderStatus','ORDS_Paid','已经付款','已经付款状态',2),
	('com.qingshixun.project.crm.model.ProductStatus','PROS_Sale','在售','在售状态',0),
	('com.qingshixun.project.crm.model.ProductStatus','PROS_Stop','停售','停售状态',0),
	('com.qingshixun.project.crm.model.UserStatus','USRS_Active','正常','正常状态',1),
	('com.qingshixun.project.crm.model.UserStatus','USRS_Disabled','禁用','禁用状态',1);

/*!40000 ALTER TABLE `qsx_dictionary` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table qsx_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `qsx_menu`;

CREATE TABLE `qsx_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `indexNo` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `url` varchar(100) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7004C568CC1492DD` (`parent_id`),
  CONSTRAINT `FK7004C568CC1492DD` FOREIGN KEY (`parent_id`) REFERENCES `qsx_menu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `qsx_menu` WRITE;
/*!40000 ALTER TABLE `qsx_menu` DISABLE KEYS */;

INSERT INTO `qsx_menu` (`id`, `createTime`, `updateTime`, `icon`, `indexNo`, `name`, `url`, `parent_id`)
VALUES
	(31,'2016-01-12 13:58:47','2016-01-12 13:58:50','fa icon-laptop',1200,'产品管理','',NULL),
	(35,'2016-01-12 14:16:20','2016-01-12 14:16:23','fa icon-laptop',1210,'产品列表','product/list',31),
	(39,'2016-01-13 14:35:45','2016-01-13 14:35:45','fa icon-laptop',1100,'系统管理','',NULL),
	(40,'2016-01-13 14:37:11','2016-01-13 14:37:11','fa icon-hospital',1111,'用户管理','user/list',39),
	(41,'2016-01-13 14:38:36','2016-01-13 14:38:36','fa icon-hospital',1110,'角色管理','role/list',39);

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
	(35,3),
	(35,4),
	(35,5),
	(35,7),
	(35,8);

/*!40000 ALTER TABLE `qsx_menu_resource` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table qsx_operate_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `qsx_operate_log`;

CREATE TABLE `qsx_operate_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `context` varchar(255) DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  `memo` longtext,
  `name` varchar(255) DEFAULT NULL,
  `result` varchar(10) NOT NULL,
  `target` varchar(255) DEFAULT NULL,
  `timeConsume` bigint(20) DEFAULT NULL,
  `userCode` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table qsx_order
# ------------------------------------------------------------

DROP TABLE IF EXISTS `qsx_order`;

CREATE TABLE `qsx_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
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

LOCK TABLES `qsx_order` WRITE;
/*!40000 ALTER TABLE `qsx_order` DISABLE KEYS */;

INSERT INTO `qsx_order` (`id`, `createTime`, `updateTime`, `deliverDate`, `memo`, `name`, `paidDate`, `totalAmount`, `totalQuantity`, `customer_id`, `region_id`, `sales_id`, `status_code`)
VALUES
	(5,'2016-11-08 11:19:46','2016-04-08 14:56:16',NULL,'请准时送到','辛田的订单','2016-01-08 14:56:16',6000,40,6,NULL,NULL,'ORDS_Paid'),
	(8,'2016-05-08 16:09:55','2016-02-08 16:14:32',NULL,'土豪的订单','支付订单','2016-01-08 16:14:32',3000,20,9,NULL,NULL,'ORDS_Paid'),
	(9,'2016-04-28 18:18:33','2016-01-28 18:18:33',NULL,'呼呼呼','测试订单1',NULL,90000,40,6,NULL,NULL,'ORDS_Init'),
	(10,'2016-12-28 18:19:31','2016-01-28 18:19:31',NULL,'问我','测试订单2',NULL,12000,20,6,NULL,NULL,'ORDS_Init'),
	(11,'2016-06-28 18:20:27','2016-01-28 18:20:27',NULL,'搜索','测试订单3',NULL,12000,20,9,NULL,NULL,'ORDS_Init'),
	(12,'2016-08-28 18:21:02','2016-01-28 18:21:02',NULL,'订单','测试订单4',NULL,11110,20,6,NULL,NULL,'ORDS_Init'),
	(13,'2016-02-28 18:21:45','2016-01-28 18:21:45',NULL,'777','测试订单5',NULL,12000,20,9,NULL,NULL,'ORDS_Init'),
	(14,'2016-03-28 18:22:26','2016-01-28 18:22:26',NULL,'www','测试订单8',NULL,23110,40,11,NULL,NULL,'ORDS_Init'),
	(15,'2016-09-28 18:23:00','2016-01-28 18:23:02',NULL,'订单','测试订单8',NULL,44000,60,12,NULL,NULL,'ORDS_Init'),
	(16,'2016-07-28 18:23:36','2016-01-28 18:23:36',NULL,'未完全','测试订单100',NULL,67400,16,11,NULL,NULL,'ORDS_Init'),
	(17,'2016-10-28 18:24:38','2016-01-28 18:24:38',NULL,'订单','测试订单11',NULL,6655,16,11,NULL,NULL,'ORDS_Init'),
	(18,'2016-01-28 18:25:05','2016-01-28 18:25:05',NULL,'33','测试订单33',NULL,17710,37,10,NULL,NULL,'ORDS_Init');

/*!40000 ALTER TABLE `qsx_order` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table qsx_order_detail
# ------------------------------------------------------------

DROP TABLE IF EXISTS `qsx_order_detail`;

CREATE TABLE `qsx_order_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `amount` double NOT NULL COMMENT '总价',
  `quantity` int(11) NOT NULL COMMENT '数量',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品id',
  PRIMARY KEY (`id`),
  KEY `FK7537F16B5EC69B84` (`order_id`),
  KEY `FK7537F16BC0441A02` (`product_id`),
  CONSTRAINT `FK7537F16B5EC69B84` FOREIGN KEY (`order_id`) REFERENCES `qsx_order` (`id`),
  CONSTRAINT `FK7537F16BC0441A02` FOREIGN KEY (`product_id`) REFERENCES `qsx_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `qsx_order_detail` WRITE;
/*!40000 ALTER TABLE `qsx_order_detail` DISABLE KEYS */;

INSERT INTO `qsx_order_detail` (`id`, `createTime`, `updateTime`, `amount`, `quantity`, `order_id`, `product_id`)
VALUES
	(5,'2016-01-08 11:19:50','2016-01-08 11:19:50',2000,20,5,15),
	(6,'2016-01-08 11:19:50','2016-01-08 11:19:50',4000,20,5,17),
	(11,'2016-01-08 16:09:55','2016-01-08 16:09:55',1000,10,8,15),
	(12,'2016-01-08 16:09:55','2016-01-08 16:09:55',2000,10,8,17),
	(13,'2016-01-28 18:18:33','2016-01-28 18:18:33',4000,40,9,15),
	(14,'2016-01-28 18:19:31','2016-01-28 18:19:31',2000,10,10,17),
	(15,'2016-01-28 18:19:31','2016-01-28 18:19:31',10000,10,10,20),
	(16,'2016-01-28 18:20:27','2016-01-28 18:20:27',2000,10,11,17),
	(17,'2016-01-28 18:20:27','2016-01-28 18:20:27',10000,10,11,20),
	(18,'2016-01-28 18:21:02','2016-01-28 18:21:02',1110,10,12,16),
	(19,'2016-01-28 18:21:02','2016-01-28 18:21:02',10000,10,12,20),
	(20,'2016-01-28 18:21:45','2016-01-28 18:21:45',10000,10,13,20),
	(21,'2016-01-28 18:21:45','2016-01-28 18:21:45',2000,10,13,17),
	(22,'2016-01-28 18:22:26','2016-01-28 18:22:26',1110,10,14,16),
	(23,'2016-01-28 18:22:26','2016-01-28 18:22:26',2000,10,14,17),
	(24,'2016-01-28 18:22:26','2016-01-28 18:22:26',20000,20,14,20),
	(25,'2016-01-28 18:23:02','2016-01-28 18:23:02',4000,20,15,17),
	(26,'2016-01-28 18:23:02','2016-01-28 18:23:02',40000,40,15,20),
	(27,'2016-01-28 18:23:36','2016-01-28 18:23:36',1400,7,16,17),
	(28,'2016-01-28 18:23:36','2016-01-28 18:23:36',9000,9,16,20),
	(29,'2016-01-28 18:24:38','2016-01-28 18:24:38',100,1,17,15),
	(30,'2016-01-28 18:24:38','2016-01-28 18:24:38',555,5,17,16),
	(31,'2016-01-28 18:24:38','2016-01-28 18:24:38',1000,5,17,17),
	(32,'2016-01-28 18:24:38','2016-01-28 18:24:38',5000,5,17,20),
	(33,'2016-01-28 18:25:05','2016-01-28 18:25:05',1110,10,18,16),
	(34,'2016-01-28 18:25:05','2016-01-28 18:25:05',2600,13,18,17),
	(35,'2016-01-28 18:25:05','2016-01-28 18:25:05',14000,14,18,20);

/*!40000 ALTER TABLE `qsx_order_detail` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table qsx_product
# ------------------------------------------------------------

DROP TABLE IF EXISTS `qsx_product`;

CREATE TABLE `qsx_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `description` text NOT NULL,
  `inventory` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `status_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK70223446767EC75E` (`status_code`),
  KEY `FK70223446A7426F35` (`category_id`),
  CONSTRAINT `FK70223446767EC75E` FOREIGN KEY (`status_code`) REFERENCES `qsx_dictionary` (`code`),
  CONSTRAINT `FK70223446A7426F35` FOREIGN KEY (`category_id`) REFERENCES `qsx_product_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `qsx_product` WRITE;
/*!40000 ALTER TABLE `qsx_product` DISABLE KEYS */;

INSERT INTO `qsx_product` (`id`, `createTime`, `updateTime`, `description`, `inventory`, `name`, `picture`, `price`, `category_id`, `status_code`)
VALUES
	(15,'2015-12-11 11:07:15','2015-12-11 11:07:17','杜兰特',4,'篮球','http://localhost:8080/crm/crm_upload/temp/1449803235179_225589.jpg',100,1,'PROS_Sale'),
	(16,'2015-12-11 11:11:07','2016-01-08 20:41:46','111111',76,'乔巴','http://localhost:8080/crm/crm_upload/temp/1449803467262_790885.jpg',111,1,'PROS_Sale'),
	(17,'2016-01-08 16:11:51','2016-01-28 18:18:53','111',115,'周杰伦','http://localhost:8080/crm/crm_upload/temp/1449814905751_759582.jpg',200,1,'PROS_Sale'),
	(18,'2016-01-28 18:11:19','2016-01-28 18:11:19','111',111,'产品1','http://localhost:8080/crm/crm_upload/temp/1450251122266_151308.jpg',10000,1,'PROS_Stop'),
	(20,'2016-01-28 18:10:54','2016-01-28 18:18:50','111',983,'产品2','http://localhost:8080/crm/crm_upload/temp/1449820025722_199904.jpg',1000,1,'PROS_Sale'),
	(22,'2015-12-16 15:41:25','2015-12-16 15:41:31','1121121221',200,'tupian','http://localhost:8080/crm/crm_upload/temp/1450251691472_285720.jpg',100,2,'PROS_Stop');

/*!40000 ALTER TABLE `qsx_product` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table qsx_product_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `qsx_product_category`;

CREATE TABLE `qsx_product_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `qsx_product_category` WRITE;
/*!40000 ALTER TABLE `qsx_product_category` DISABLE KEYS */;

INSERT INTO `qsx_product_category` (`id`, `createTime`, `updateTime`, `description`, `name`)
VALUES
	(1,'2015-12-12 10:27:24','2015-12-12 15:11:55','服装','服装'),
	(2,'2015-12-12 10:27:25','2015-12-12 10:27:27','电子产品','电子产品'),
	(3,'2015-12-12 15:24:37','2015-12-12 15:24:44','sss','sss'),
	(5,'2015-12-12 15:31:00','2015-12-12 15:31:06','ssqw','sssewqeqe');

/*!40000 ALTER TABLE `qsx_product_category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table qsx_province
# ------------------------------------------------------------

DROP TABLE IF EXISTS `qsx_province`;

CREATE TABLE `qsx_province` (
  `code` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `pinyin` varchar(255) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
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


# Dump of table qsx_region
# ------------------------------------------------------------

DROP TABLE IF EXISTS `qsx_region`;

CREATE TABLE `qsx_region` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `qsx_region` WRITE;
/*!40000 ALTER TABLE `qsx_region` DISABLE KEYS */;

INSERT INTO `qsx_region` (`id`, `createTime`, `updateTime`, `description`, `name`)
VALUES
	(1,NULL,NULL,NULL,'华东地区'),
	(2,NULL,NULL,NULL,'华南地区'),
	(3,NULL,NULL,NULL,'华中地区'),
	(4,NULL,NULL,NULL,'华北地区'),
	(5,NULL,NULL,NULL,'西南地区'),
	(6,NULL,NULL,NULL,'东北地区'),
	(7,NULL,NULL,NULL,'台港澳地区');

/*!40000 ALTER TABLE `qsx_region` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table qsx_resource
# ------------------------------------------------------------

DROP TABLE IF EXISTS `qsx_resource`;

CREATE TABLE `qsx_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `qsx_resource` WRITE;
/*!40000 ALTER TABLE `qsx_resource` DISABLE KEYS */;

INSERT INTO `qsx_resource` (`id`, `createTime`, `updateTime`, `name`, `url`)
VALUES
	(1,'2015-12-01 14:26:43',NULL,'用户查询','/user/list**'),
	(2,NULL,NULL,'客户查询','/customer/list*'),
	(3,'2016-01-13 10:24:25','2016-01-13 10:24:25','新增','product/add'),
	(4,'2016-01-13 10:30:07','2016-01-13 10:30:07','编辑','product/edit'),
	(5,'2016-01-13 10:36:47','2016-01-13 10:36:47','列表','product/list'),
	(6,'2016-01-13 11:04:10','2016-01-13 11:04:10','保存','product/save'),
	(7,'2016-01-13 14:18:53','2016-01-13 14:18:53','排序1','order'),
	(8,'2016-01-13 14:19:47','2016-01-13 14:19:47','批量新增','aads');

/*!40000 ALTER TABLE `qsx_resource` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table qsx_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `qsx_role`;

CREATE TABLE `qsx_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `qsx_role` WRITE;
/*!40000 ALTER TABLE `qsx_role` DISABLE KEYS */;

INSERT INTO `qsx_role` (`id`, `createTime`, `updateTime`, `name`)
VALUES
	(1,'2015-12-01 15:54:24','2015-12-01 15:54:25','管理员'),
	(4,'2016-01-05 10:28:54','2016-01-05 10:29:04','普通用户'),
	(5,'2016-01-05 10:32:02','2016-01-05 10:32:12','超级管理员');

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
	(1,31),
	(1,35),
	(1,39),
	(1,40),
	(1,41);

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



# Dump of table qsx_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `qsx_user`;

CREATE TABLE `qsx_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `loginName` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `department_id` bigint(20) DEFAULT NULL,
  `status_code` varchar(255) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK70089BD453BDFAE2` (`department_id`),
  KEY `FK70089BD412D6D914` (`status_code`),
  CONSTRAINT `FK70089BD412D6D914` FOREIGN KEY (`status_code`) REFERENCES `qsx_dictionary` (`code`),
  CONSTRAINT `FK70089BD453BDFAE2` FOREIGN KEY (`department_id`) REFERENCES `qsx_department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `qsx_user` WRITE;
/*!40000 ALTER TABLE `qsx_user` DISABLE KEYS */;

INSERT INTO `qsx_user` (`id`, `loginName`, `email`, `gender`, `name`, `password`, `phone`, `department_id`, `status_code`, `updateTime`, `createTime`)
VALUES
	(1,'admin','xin@qq.com','男','管理员','a40546cc4fd6a12572828bb803380888ad1bfdab','13115567890',4,'USRS_Active','2015-12-01 14:26:58','2015-12-01 14:26:56'),
	(9,'xintian','tian.xin@innovaee.com.cn','男','辛田','12345656','13114456789',NULL,'USRS_Active','2016-01-29 16:29:02','2016-01-29 16:29:02'),
	(10,'zhoujielun','tian.xin@innovaee.com.cn','男','周杰伦','774AFED60C7E2E86A288CB195801E0D1','13114456789',NULL,'USRS_Active','2016-01-29 16:37:17','2016-01-29 16:37:17'),
	(11,'super','tian.xin@innovaee.com.cn','男','crm','21232F297A57A5A743894A0E4A801FC3','13115567890',NULL,'USRS_Active','2016-01-29 16:43:53','2016-01-29 16:43:53'),
	(12,'huoqiang','tian.xin@innovaee.com.cn','男','火枪','ab821952a7e19a8cfcdac2c8654de087a00dc92e','13115567890',NULL,'USRS_Active','2016-01-29 17:55:28','2016-01-29 17:55:28');

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
	(9,1),
	(10,1),
	(11,1),
	(12,1),
	(9,4),
	(10,4);

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


# Dump of table school
# ------------------------------------------------------------

DROP TABLE IF EXISTS `school`;

CREATE TABLE `school` (
  `name` varchar(50) DEFAULT NULL COMMENT '班级名称',
  `number` int(11) DEFAULT NULL COMMENT '班级人数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学校表';




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
