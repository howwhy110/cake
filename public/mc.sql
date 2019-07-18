SET NAMES UTF8;
DROP DATABASE IF EXISTS mc;
CREATE DATABASE mc CHARSET=UTF8;
USE mc;


/**蛋糕种类**/
CREATE TABLE mc_cake_family(
  fid INT PRIMARY KEY AUTO_INCREMENT,
  fname VARCHAR(32)
);

/**详情页蛋糕**/
CREATE TABLE mc_cake(
  lid INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(128),         #主标题
  price DECIMAL(10,2),        #价格
  spec VARCHAR(50),           #规格
  e_details VARCHAR(128),     #英文详情
  c_details VARCHAR(128)      #汉语详情
  
);

/**放大镜的蛋糕图片**/
CREATE TABLE mc_cake_pic(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  sm VARCHAR(128),            #小图片路径
  md VARCHAR(128),            #中图片路径
  lg VARCHAR(128)             #大图片路径
);

/**用户信息**/
CREATE TABLE mc_user(
  uid INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(32),
  upwd VARCHAR(32),
  email VARCHAR(64),
  phone VARCHAR(16) unique,
  avatar VARCHAR(128),        #头像图片路径
  user_name VARCHAR(32),      #用户名，如王小明
  gender INT                  #性别  0-女  1-男
);

/**收货地址信息**/
CREATE TABLE mc_receiver_address(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,                #用户编号
  receiver VARCHAR(16),       #接收人姓名
  province VARCHAR(16),       #省
  city VARCHAR(16),           #市
  county VARCHAR(16),         #县
  address VARCHAR(128),       #详细地址
  cellphone VARCHAR(16),      #手机
  fixedphone VARCHAR(16),     #固定电话
  postcode CHAR(6),           #邮编
  tag VARCHAR(16),            #标签名

  is_default BOOLEAN          #是否为当前用户的默认收货地址
);

/**购物车条目**/
CREATE TABLE mc_shoppingcart_item(
  iid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,      #用户编号
  product_id INT,   #商品编号
  count INT,        #购买数量
  is_checked BOOLEAN #是否已勾选，确定购买
);

/**用户订单**/
CREATE TABLE mc_order(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  address_id INT,
  status INT,             #订单状态  1-等待付款  2-等待发货  3-运输中  4-已签收  5-已取消
  order_time BIGINT,      #下单时间
  pay_time BIGINT,        #付款时间
  deliver_time BIGINT,    #发货时间
  received_time BIGINT    #签收时间
)AUTO_INCREMENT=10000000;

/**用户订单**/
CREATE TABLE mc_order_detail(
  did INT PRIMARY KEY AUTO_INCREMENT,
  order_id INT,           #订单编号
  product_id INT,         #产品编号
  count INT               #购买数量
);

/****首页轮播广告商品****/
CREATE TABLE mc_index_carousel(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(128),
  href VARCHAR(128)
);

/****首页蛋糕****/
CREATE TABLE mc_index_cake(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  family_id INT,              #所属蛋糕种类编号
  e_title VARCHAR(64),        #英文标题
  c_title VARCHAR(64),        #中文标题
  pic VARCHAR(128),           #图片
  href VARCHAR(128)           #地址
);

/****首页甜点****/
CREATE TABLE mc_index_sweet(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  e_title VARCHAR(64),
  c_title VARCHAR(64),
  pic VARCHAR(128),
  href VARCHAR(128)
);


/*******************/
/******数据导入******/
/*******************/
/**蛋糕种类**/
INSERT INTO mc_cake_family VALUES
(NULL,'拿破仑'),
(NULL,'鲜奶'),
(NULL,'慕斯'),
(NULL,'芝士'),
(NULL,'巧克力'),
(NULL,'咖啡'),
(NULL,'坚果'),
(NULL,'水果'),
(NULL,'冰淇淋'),
(NULL,'#小食');

/****首页蛋糕****/
INSERT INTO mc_index_cake VALUES
(NULL,4,'Floraison','花漾·年华','img/index/cake_1.jpg','product_details.html?'),
(NULL,8,'Fraise-Chantilly','鲜莓印雪','img/index/cake_2.jpg','product_details.html?'),
(NULL,2,'Nino','尼诺','img/index/cake_3.jpg','product_details.html?'),
(NULL,4,'Fromage Velouté','香溢新芝','img/index/cake_4.jpg','product_details.html?'),
(NULL,2,'Jardin dAlice','爱丽丝花境','img/index/cake_5.jpg','product_details.html?'),
(NULL,5,'Joséphine','约瑟芬玫瑰','img/index/cake_6.jpg','product_details.html?'),
(NULL,3,'Le MOJITO','Mojito 柠•漾','img/index/cake_7.jpg','product_details.html?'),
(NULL,8,'Mangue chantilly','芒果•Mangue','img/index/cake_8.jpg','product_details.html?'),
(NULL,3,'Choco Cointreau','君度可可','img/index/cake_9.jpg','product_details.html?'),
(NULL,3,'Sablé parfait','沙布蕾芭菲','img/index/cake_10.jpg','product_details.html?'),
(NULL,5,'Forêt de canneberge au choco','巧克力莓林','img/index/cake_11.jpg','product_details.html?'),
(NULL,9,'Côte dAzur','海岸蓝调','img/index/cake_12.jpg','product_details.html?'),
(NULL,1,'La Forêt noir','黑森林拿破仑','img/index/cake_13.jpg','product_details.html?'),
(NULL,5,'Lotus Noir','巧克力黑兰','img/index/cake_14.jpg','product_details.html?'),
(NULL,7,'Mont Blanc','朗姆醇栗','img/index/cake_15.jpg','product_details.html?'),
(NULL,2,'Gâteau de crêpes','法香奶油可丽','img/index/cake_16.jpg','product_details.html?'),
(NULL,1,'Napoléon vanille','经典香草拿破仑','img/index/cake_17.jpg','product_details.html?'),
(NULL,1,'Genoise café','卡法香缇','img/index/cake_18.jpg','product_details.html?'),
(NULL,8,'Tarte au durian','榴莲雪塔','img/index/cake_19.jpg','product_details.html?'),
(NULL,5,'Gâteau des anges','天使巧克力','img/index/cake_20.jpg','product_details.html?'),
(NULL,5,'Diable chocolat','魔鬼巧克力','img/index/cake_21.jpg','product_details.html?'),
(NULL,3,'Le Thé','摩登茶道','img/index/cake_22.jpg','product_details.html?'),
(NULL,9,'Luke et dondon','卢克和咚咚冰淇淋蛋糕','img/index/cake_23.jpg','product_details.html?'),
(NULL,6,'Moka praline noisette','榛果摩卡布拉吉','img/index/cake_24.jpg','product_details.html?'),
(NULL,3,'Tiramisu','提拉米苏','img/index/cake_25.jpg','product_details.html?'),
(NULL,8,'Histoire de pêche','蜜桃物语','img/index/cake_26.jpg','product_details.html?'),
(NULL,8,'Le Soleil','阳光心芒','img/index/cake_27.jpg','product_details.html?'),
(NULL,3,'Mousse aux fruits de la passio','百香果慕斯','img/index/cake_28.jpg','product_details.html?'),
(NULL,2,'Soirée Bailay’s','百利派对','img/index/cake_29.jpg','product_details.html?'),
(NULL,3,'Coco banana','coco芭娜娜','img/index/cake_30jpg','product_details.html?'),
(NULL,9,'Choco ~ Mariage','浓巧·迷情冰淇淋蛋糕','img/index/cake_31.jpg','product_details.html?'),
(NULL,9,'Liliane ~ Gâteau glacée','恋恋·草莓冰淇淋蛋糕','img/index/cake_32','product_details.html?'),
(NULL,3,'lapin détendu','安逸兔','img/index/cake_33','product_details.html?'),
(NULL,2,'Voyage de Daisy','黛西的旅行','img/index/cake_34','product_details.html?'),
(NULL,2,'Velour rouge','蔓越莓红丝绒','img/index/cake_35','product_details.html?'),
(NULL,1,'Napoléon aux myrtilles','蓝莓轻乳拿破仑','img/index/cake_36','product_details.html?');

/****首页甜点****/
INSERT INTO mc_index_sweet VALUES
(NULL,'Croissant français','法香可颂','img/index/cake_37','product_details.html?'),
(NULL,'fromage semi-fermenté original','半熟芝士(原味）','img/index/cake_38','product_details.html?'),
(NULL,'fleurette(original)','萝拉小朵(原味）','img/index/cake_39','product_details.html?'),
(NULL,'1/4 chocolat au lait','1/4牛奶生巧','img/index/cake_40','product_details.html?'),
(NULL,'M·chocolat','V.S.O.P生巧','img/index/cake_41','product_details.html?'),
(NULL,'Dimsum intelligent','知识小生','img/index/cake_42','product_details.html?'),
(NULL,'Dimsum aux canneberge','塔尼小红莓','img/index/cake_43','product_details.html?'),
(NULL,'Gâteaux à l·ananas','一口安娜酥','img/index/cake_44','product_details.html?'),
(NULL,'fromage semi-fermenté (fraise)','半熟芝士(草莓味）','img/index/cake_45','product_details.html?'),
(NULL,'fleurette(Motcha)','萝拉小朵(抹茶味）','img/index/cake_46','product_details.html?'),
(NULL,'fleurette( choc)','萝拉小朵(巧克力味）','img/index/cake_47','product_details.html?'),
(NULL,'Fèves moka au chocolat noir','马克西姆摩卡黑巧克力制品豆','img/index/cake_48','product_details.html?'),
(NULL,'les crêpes dentelles de Maxim','马克西姆牛奶巧克力脆饼','img/index/cake_49','product_details.html?'),
(NULL,'Earl Grey de Maxim','马克西姆伯爵茶','img/index/cake_50','product_details.html?');


INSERT INTO mc_index_carousel VALUES
(NULL,'img/index/banner1.png','product_details.html?lid=?'),
(NULL,'img/index/banner2.png','product_details.html?lid=?'),
(NULL,'img/index/banner3.png','product_details.html?lid=?'),
(NULL,'img/index/banner4.png','product_details.html?lid=?');

INSERT INTO mc_cake_pic VALUES
(NULL,'img/detail/cake1_1_sm.jpg','img/detail/cake1_1_md.jpg','img/detail/cake1_1_bg.jpg'),
(NULL,'img/detail/cake1_2_sm.jpg','img/detail/cake1_2_md.jpg','img/detail/cake1_2_bg.jpg'),
(NULL,'img/detail/cake1_3_sm.jpg','img/detail/cake1_3_md.jpg','img/detail/cake1_3_bg.jpg'),
(NULL,'img/detail/cake2_1_sm.jpg','img/detail/cake2_1_md.jpg','img/detail/cake2_1_bg.jpg'),
(NULL,'img/detail/cake2_2_sm.jpg','img/detail/cake2_2_md.jpg','img/detail/cake2_2_bg.jpg'),
(NULL,'img/detail/cake2_3_sm.jpg','img/detail/cake2_3_md.jpg','img/detail/cake2_3_bg.jpg'),
(NULL,'img/detail/cake3_1_sm.jpg','img/detail/cake3_1_md.jpg','img/detail/cake3_1_bg.jpg'),
(NULL,'img/detail/cake3_2_sm.jpg','img/detail/cake3_2_md.jpg','img/detail/cake3_2_bg.jpg'),
(NULL,'img/detail/cake3_3_sm.jpg','img/detail/cake3_3_md.jpg','img/detail/cake3_3_bg.jpg'),
(NULL,'img/detail/cake4_1_sm.jpg','img/detail/cake4_1_md.jpg','img/detail/cake4_1_bg.jpg'),
(NULL,'img/detail/cake4_2_sm.jpg','img/detail/cake4_2_md.jpg','img/detail/cake4_2_bg.jpg'),
(NULL,'img/detail/cake4_3_sm.jpg','img/detail/cake4_3_md.jpg','img/detail/cake4_3_bg.jpg'),
(NULL,'img/detail/cake5_1_sm.jpg','img/detail/cake5_1_md.jpg','img/detail/cake5_1_bg.jpg'),
(NULL,'img/detail/cake5_2_sm.jpg','img/detail/cake5_2_md.jpg','img/detail/cake5_2_bg.jpg'),
(NULL,'img/detail/cake5_3_sm.jpg','img/detail/cake5_3_md.jpg','img/detail/cake5_3_bg.jpg'),
(NULL,'img/detail/cake6_1_sm.jpg','img/detail/cake6_1_md.jpg','img/detail/cake6_1_bg.jpg'),
(NULL,'img/detail/cake6_2_sm.jpg','img/detail/cake6_2_md.jpg','img/detail/cake6_2_bg.jpg'),
(NULL,'img/detail/cake6_3_sm.jpg','img/detail/cake6_3_md.jpg','img/detail/cake6_3_bg.jpg'),
(NULL,'img/detail/cake7_1_sm.jpg','img/detail/cake7_1_md.jpg','img/detail/cake7_1_bg.jpg'),
(NULL,'img/detail/cake7_2_sm.jpg','img/detail/cake7_2_md.jpg','img/detail/cake7_2_bg.jpg'),
(NULL,'img/detail/cake7_3_sm.jpg','img/detail/cake7_3_md.jpg','img/detail/cake7_3_bg.jpg'),
(NULL,'img/detail/cake8_1_sm.jpg','img/detail/cake8_1_md.jpg','img/detail/cake8_1_bg.jpg'),
(NULL,'img/detail/cake8_2_sm.jpg','img/detail/cake8_2_md.jpg','img/detail/cake8_2_bg.jpg'),
(NULL,'img/detail/cake8_3_sm.jpg','img/detail/cake8_3_md.jpg','img/detail/cake8_3_bg.jpg'),
(NULL,'img/detail/cake9_1_sm.jpg','img/detail/cake9_1_md.jpg','img/detail/cake9_1_bg.jpg'),
(NULL,'img/detail/cake9_2_sm.jpg','img/detail/cake9_2_md.jpg','img/detail/cake9_2_bg.jpg'),
(NULL,'img/detail/cake9_3_sm.jpg','img/detail/cake9_3_md.jpg','img/detail/cake9_3_bg.jpg'),
(NULL,'img/detail/cake10_1_sm.jpg','img/detail/cake10_1_md.jpg','img/detail/cake10_1_bg.jpg'),
(NULL,'img/detail/cake10_2_sm.jpg','img/detail/cake10_2_md.jpg','img/detail/cake10_2_bg.jpg'),
(NULL,'img/detail/cake10_3_sm.jpg','img/detail/cake10_3_md.jpg','img/detail/cake10_3_bg.jpg'),
(NULL,'img/detail/cake11_1_sm.jpg','img/detail/cake11_1_md.jpg','img/detail/cake11_1_bg.jpg'),
(NULL,'img/detail/cake11_2_sm.jpg','img/detail/cake11_2_md.jpg','img/detail/cake11_2_bg.jpg'),
(NULL,'img/detail/cake11_3_sm.jpg','img/detail/cake11_3_md.jpg','img/detail/cake11_3_bg.jpg'),
(NULL,'img/detail/cake12_1_sm.jpg','img/detail/cake12_1_md.jpg','img/detail/cake12_1_bg.jpg'),
(NULL,'img/detail/cake12_2_sm.jpg','img/detail/cake12_2_md.jpg','img/detail/cake12_2_bg.jpg'),
(NULL,'img/detail/cake12_3_sm.jpg','img/detail/cake12_3_md.jpg','img/detail/cake12_3_bg.jpg'),
(NULL,'img/detail/cake13_1_sm.jpg','img/detail/cake13_1_md.jpg','img/detail/cake13_1_bg.jpg'),
(NULL,'img/detail/cake13_2_sm.jpg','img/detail/cake13_2_md.jpg','img/detail/cake13_2_bg.jpg'),
(NULL,'img/detail/cake13_3_sm.jpg','img/detail/cake13_3_md.jpg','img/detail/cake13_3_bg.jpg'),
(NULL,'img/detail/cake14_1_sm.jpg','img/detail/cake14_1_md.jpg','img/detail/cake14_1_bg.jpg'),
(NULL,'img/detail/cake14_2_sm.jpg','img/detail/cake14_2_md.jpg','img/detail/cake14_2_bg.jpg'),
(NULL,'img/detail/cake14_3_sm.jpg','img/detail/cake14_3_md.jpg','img/detail/cake14_3_bg.jpg'),
(NULL,'img/detail/cake15_1_sm.jpg','img/detail/cake15_1_md.jpg','img/detail/cake15_1_bg.jpg'),
(NULL,'img/detail/cake15_2_sm.jpg','img/detail/cake15_2_md.jpg','img/detail/cake15_2_bg.jpg'),
(NULL,'img/detail/cake15_3_sm.jpg','img/detail/cake15_3_md.jpg','img/detail/cake15_3_bg.jpg'),
(NULL,'img/detail/cake16_1_sm.jpg','img/detail/cake16_1_md.jpg','img/detail/cake16_1_bg.jpg'),
(NULL,'img/detail/cake16_2_sm.jpg','img/detail/cake16_2_md.jpg','img/detail/cake16_2_bg.jpg'),
(NULL,'img/detail/cake16_3_sm.jpg','img/detail/cake16_3_md.jpg','img/detail/cake16_3_bg.jpg'),
(NULL,'img/detail/cake17_1_sm.jpg','img/detail/cake17_1_md.jpg','img/detail/cake17_1_bg.jpg'),
(NULL,'img/detail/cake17_2_sm.jpg','img/detail/cake17_2_md.jpg','img/detail/cake17_2_bg.jpg'),
(NULL,'img/detail/cake17_3_sm.jpg','img/detail/cake17_3_md.jpg','img/detail/cake17_3_bg.jpg'),
(NULL,'img/detail/cake18_1_sm.jpg','img/detail/cake18_1_md.jpg','img/detail/cake18_1_bg.jpg'),
(NULL,'img/detail/cake18_2_sm.jpg','img/detail/cake18_2_md.jpg','img/detail/cake18_2_bg.jpg'),
(NULL,'img/detail/cake18_3_sm.jpg','img/detail/cake18_3_md.jpg','img/detail/cake18_3_bg.jpg'),
(NULL,'img/detail/cake19_1_sm.jpg','img/detail/cake19_1_md.jpg','img/detail/cake19_1_bg.jpg'),
(NULL,'img/detail/cake19_2_sm.jpg','img/detail/cake19_2_md.jpg','img/detail/cake19_2_bg.jpg'),
(NULL,'img/detail/cake19_3_sm.jpg','img/detail/cake19_3_md.jpg','img/detail/cake19_3_bg.jpg'),
(NULL,'img/detail/cake20_1_sm.jpg','img/detail/cake20_1_md.jpg','img/detail/cake20_1_bg.jpg'),
(NULL,'img/detail/cake20_2_sm.jpg','img/detail/cake20_2_md.jpg','img/detail/cake20_2_bg.jpg'),
(NULL,'img/detail/cake20_3_sm.jpg','img/detail/cake20_3_md.jpg','img/detail/cake20_3_bg.jpg'),
(NULL,'img/detail/cake21_1_sm.jpg','img/detail/cake21_1_md.jpg','img/detail/cake21_1_bg.jpg'),
(NULL,'img/detail/cake21_2_sm.jpg','img/detail/cake21_2_md.jpg','img/detail/cake21_2_bg.jpg'),
(NULL,'img/detail/cake21_3_sm.jpg','img/detail/cake21_3_md.jpg','img/detail/cake21_3_bg.jpg'),
(NULL,'img/detail/cake22_1_sm.jpg','img/detail/cake22_1_md.jpg','img/detail/cake22_1_bg.jpg'),
(NULL,'img/detail/cake22_2_sm.jpg','img/detail/cake22_2_md.jpg','img/detail/cake22_2_bg.jpg'),
(NULL,'img/detail/cake22_3_sm.jpg','img/detail/cake22_3_md.jpg','img/detail/cake22_3_bg.jpg'),
(NULL,'img/detail/cake23_1_sm.jpg','img/detail/cake23_1_md.jpg','img/detail/cake23_1_bg.jpg'),
(NULL,'img/detail/cake23_2_sm.jpg','img/detail/cake23_2_md.jpg','img/detail/cake23_2_bg.jpg'),
(NULL,'img/detail/cake23_3_sm.jpg','img/detail/cake23_3_md.jpg','img/detail/cake23_3_bg.jpg'),
(NULL,'img/detail/cake24_1_sm.jpg','img/detail/cake24_1_md.jpg','img/detail/cake24_1_bg.jpg'),
(NULL,'img/detail/cake24_2_sm.jpg','img/detail/cake24_2_md.jpg','img/detail/cake24_2_bg.jpg'),
(NULL,'img/detail/cake24_3_sm.jpg','img/detail/cake24_3_md.jpg','img/detail/cake24_3_bg.jpg'),
(NULL,'img/detail/cake25_1_sm.jpg','img/detail/cake25_1_md.jpg','img/detail/cake25_1_bg.jpg'),
(NULL,'img/detail/cake25_2_sm.jpg','img/detail/cake25_2_md.jpg','img/detail/cake25_2_bg.jpg'),
(NULL,'img/detail/cake25_3_sm.jpg','img/detail/cake25_3_md.jpg','img/detail/cake25_3_bg.jpg'),
(NULL,'img/detail/cake26_1_sm.jpg','img/detail/cake26_1_md.jpg','img/detail/cake26_1_bg.jpg'),
(NULL,'img/detail/cake26_2_sm.jpg','img/detail/cake26_2_md.jpg','img/detail/cake26_2_bg.jpg'),
(NULL,'img/detail/cake26_3_sm.jpg','img/detail/cake26_3_md.jpg','img/detail/cake26_3_bg.jpg'),
(NULL,'img/detail/cake27_1_sm.jpg','img/detail/cake27_1_md.jpg','img/detail/cake27_1_bg.jpg'),
(NULL,'img/detail/cake27_2_sm.jpg','img/detail/cake27_2_md.jpg','img/detail/cake27_2_bg.jpg'),
(NULL,'img/detail/cake27_3_sm.jpg','img/detail/cake27_3_md.jpg','img/detail/cake27_3_bg.jpg'),
(NULL,'img/detail/cake28_1_sm.jpg','img/detail/cake28_1_md.jpg','img/detail/cake28_1_bg.jpg'),
(NULL,'img/detail/cake28_2_sm.jpg','img/detail/cake28_2_md.jpg','img/detail/cake28_2_bg.jpg'),
(NULL,'img/detail/cake28_3_sm.jpg','img/detail/cake28_3_md.jpg','img/detail/cake28_3_bg.jpg'),
(NULL,'img/detail/cake29_1_sm.jpg','img/detail/cake29_1_md.jpg','img/detail/cake29_1_bg.jpg'),
(NULL,'img/detail/cake29_2_sm.jpg','img/detail/cake29_2_md.jpg','img/detail/cake29_2_bg.jpg'),
(NULL,'img/detail/cake29_3_sm.jpg','img/detail/cake29_3_md.jpg','img/detail/cake29_3_bg.jpg'),
(NULL,'img/detail/cake30_1_sm.jpg','img/detail/cake30_1_md.jpg','img/detail/cake30_1_bg.jpg'),
(NULL,'img/detail/cake30_2_sm.jpg','img/detail/cake30_2_md.jpg','img/detail/cake30_2_bg.jpg'),
(NULL,'img/detail/cake30_3_sm.jpg','img/detail/cake30_3_md.jpg','img/detail/cake30_3_bg.jpg'),
(NULL,'img/detail/cake31_1_sm.jpg','img/detail/cake31_1_md.jpg','img/detail/cake31_1_bg.jpg'),
(NULL,'img/detail/cake31_2_sm.jpg','img/detail/cake31_2_md.jpg','img/detail/cake31_2_bg.jpg'),
(NULL,'img/detail/cake31_3_sm.jpg','img/detail/cake31_3_md.jpg','img/detail/cake31_3_bg.jpg'),
(NULL,'img/detail/cake32_1_sm.jpg','img/detail/cake32_1_md.jpg','img/detail/cake32_1_bg.jpg'),
(NULL,'img/detail/cake32_2_sm.jpg','img/detail/cake32_2_md.jpg','img/detail/cake32_2_bg.jpg'),
(NULL,'img/detail/cake32_3_sm.jpg','img/detail/cake32_3_md.jpg','img/detail/cake32_3_bg.jpg'),
(NULL,'img/detail/cake33_1_sm.jpg','img/detail/cake33_1_md.jpg','img/detail/cake33_1_bg.jpg'),
(NULL,'img/detail/cake33_2_sm.jpg','img/detail/cake33_2_md.jpg','img/detail/cake33_2_bg.jpg'),
(NULL,'img/detail/cake33_3_sm.jpg','img/detail/cake33_3_md.jpg','img/detail/cake33_3_bg.jpg'),
(NULL,'img/detail/cake34_1_sm.jpg','img/detail/cake34_1_md.jpg','img/detail/cake34_1_bg.jpg'),
(NULL,'img/detail/cake34_2_sm.jpg','img/detail/cake34_2_md.jpg','img/detail/cake34_2_bg.jpg'),
(NULL,'img/detail/cake34_3_sm.jpg','img/detail/cake34_3_md.jpg','img/detail/cake34_3_bg.jpg'),
(NULL,'img/detail/cake35_1_sm.jpg','img/detail/cake35_1_md.jpg','img/detail/cake35_1_bg.jpg'),
(NULL,'img/detail/cake35_2_sm.jpg','img/detail/cake35_2_md.jpg','img/detail/cake35_2_bg.jpg'),
(NULL,'img/detail/cake35_3_sm.jpg','img/detail/cake35_3_md.jpg','img/detail/cake35_3_bg.jpg'),
(NULL,'img/detail/cake36_1_sm.jpg','img/detail/cake36_1_md.jpg','img/detail/cake36_1_bg.jpg'),
(NULL,'img/detail/cake36_2_sm.jpg','img/detail/cake36_2_md.jpg','img/detail/cake36_2_bg.jpg'),
(NULL,'img/detail/cake36_3_sm.jpg','img/detail/cake36_3_md.jpg','img/detail/cake36_3_bg.jpg'),
(NULL,'img/detail/cake37_1_sm.jpg','img/detail/cake37_1_md.jpg','img/detail/cake37_1_bg.jpg'),
(NULL,'img/detail/cake37_2_sm.jpg','img/detail/cake37_2_md.jpg','img/detail/cake37_2_bg.jpg'),
(NULL,'img/detail/cake37_3_sm.jpg','img/detail/cake37_3_md.jpg','img/detail/cake37_3_bg.jpg'),
(NULL,'img/detail/cake38_1_sm.jpg','img/detail/cake38_1_md.jpg','img/detail/cake38_1_bg.jpg'),
(NULL,'img/detail/cake38_2_sm.jpg','img/detail/cake38_2_md.jpg','img/detail/cake38_2_bg.jpg'),
(NULL,'img/detail/cake38_3_sm.jpg','img/detail/cake38_3_md.jpg','img/detail/cake38_3_bg.jpg'),
(NULL,'img/detail/cake39_1_sm.jpg','img/detail/cake39_1_md.jpg','img/detail/cake39_1_bg.jpg'),
(NULL,'img/detail/cake39_2_sm.jpg','img/detail/cake39_2_md.jpg','img/detail/cake39_2_bg.jpg'),
(NULL,'img/detail/cake39_3_sm.jpg','img/detail/cake39_3_md.jpg','img/detail/cake39_3_bg.jpg'),
(NULL,'img/detail/cake40_1_sm.jpg','img/detail/cake40_1_md.jpg','img/detail/cake40_1_bg.jpg'),
(NULL,'img/detail/cake40_2_sm.jpg','img/detail/cake40_2_md.jpg','img/detail/cake40_2_bg.jpg'),
(NULL,'img/detail/cake40_3_sm.jpg','img/detail/cake40_3_md.jpg','img/detail/cake40_3_bg.jpg'),
(NULL,'img/detail/cake41_1_sm.jpg','img/detail/cake41_1_md.jpg','img/detail/cake41_1_bg.jpg'),
(NULL,'img/detail/cake41_2_sm.jpg','img/detail/cake41_2_md.jpg','img/detail/cake41_2_bg.jpg'),
(NULL,'img/detail/cake41_3_sm.jpg','img/detail/cake41_3_md.jpg','img/detail/cake41_3_bg.jpg'),
(NULL,'img/detail/cake42_1_sm.jpg','img/detail/cake42_1_md.jpg','img/detail/cake42_1_bg.jpg'),
(NULL,'img/detail/cake42_2_sm.jpg','img/detail/cake42_2_md.jpg','img/detail/cake42_2_bg.jpg'),
(NULL,'img/detail/cake42_3_sm.jpg','img/detail/cake42_3_md.jpg','img/detail/cake42_3_bg.jpg'),
(NULL,'img/detail/cake43_1_sm.jpg','img/detail/cake43_1_md.jpg','img/detail/cake43_1_bg.jpg'),
(NULL,'img/detail/cake43_2_sm.jpg','img/detail/cake43_2_md.jpg','img/detail/cake43_2_bg.jpg'),
(NULL,'img/detail/cake43_3_sm.jpg','img/detail/cake43_3_md.jpg','img/detail/cake43_3_bg.jpg'),
(NULL,'img/detail/cake44_1_sm.jpg','img/detail/cake44_1_md.jpg','img/detail/cake44_1_bg.jpg'),
(NULL,'img/detail/cake44_2_sm.jpg','img/detail/cake44_2_md.jpg','img/detail/cake44_2_bg.jpg'),
(NULL,'img/detail/cake44_3_sm.jpg','img/detail/cake44_3_md.jpg','img/detail/cake44_3_bg.jpg'),
(NULL,'img/detail/cake45_1_sm.jpg','img/detail/cake45_1_md.jpg','img/detail/cake45_1_bg.jpg'),
(NULL,'img/detail/cake45_2_sm.jpg','img/detail/cake45_2_md.jpg','img/detail/cake45_2_bg.jpg'),
(NULL,'img/detail/cake45_3_sm.jpg','img/detail/cake45_3_md.jpg','img/detail/cake45_3_bg.jpg'),
(NULL,'img/detail/cake46_1_sm.jpg','img/detail/cake46_1_md.jpg','img/detail/cake46_1_bg.jpg'),
(NULL,'img/detail/cake46_2_sm.jpg','img/detail/cake46_2_md.jpg','img/detail/cake46_2_bg.jpg'),
(NULL,'img/detail/cake46_3_sm.jpg','img/detail/cake46_3_md.jpg','img/detail/cake46_3_bg.jpg'),
(NULL,'img/detail/cake47_1_sm.jpg','img/detail/cake47_1_md.jpg','img/detail/cake47_1_bg.jpg'),
(NULL,'img/detail/cake47_2_sm.jpg','img/detail/cake47_2_md.jpg','img/detail/cake47_2_bg.jpg'),
(NULL,'img/detail/cake47_3_sm.jpg','img/detail/cake47_3_md.jpg','img/detail/cake47_3_bg.jpg'),
(NULL,'img/detail/cake48_1_sm.jpg','img/detail/cake48_1_md.jpg','img/detail/cake48_1_bg.jpg'),
(NULL,'img/detail/cake48_2_sm.jpg','img/detail/cake48_2_md.jpg','img/detail/cake48_2_bg.jpg'),
(NULL,'img/detail/cake48_3_sm.jpg','img/detail/cake48_3_md.jpg','img/detail/cake48_3_bg.jpg'),
(NULL,'img/detail/cake49_1_sm.jpg','img/detail/cake49_1_md.jpg','img/detail/cake49_1_bg.jpg'),
(NULL,'img/detail/cake49_2_sm.jpg','img/detail/cake49_2_md.jpg','img/detail/cake49_2_bg.jpg'),
(NULL,'img/detail/cake49_3_sm.jpg','img/detail/cake49_3_md.jpg','img/detail/cake49_3_bg.jpg'),
(NULL,'img/detail/cake50_1_sm.jpg','img/detail/cake50_1_md.jpg','img/detail/cake50_1_bg.jpg'),
(NULL,'img/detail/cake50_2_sm.jpg','img/detail/cake50_2_md.jpg','img/detail/cake50_2_bg.jpg'),
(NULL,'img/detail/cake50_3_sm.jpg','img/detail/cake50_3_md.jpg','img/detail/cake50_3_bg.jpg');

/**用户信息**/
INSERT INTO mc_user VALUES
(NULL, 'kele', '123456', 'ding@qq.com', '13501234567', 'img/avatar/one.png', '丁伟', '1'),
(NULL, 'kafei', '123456', 'dang@qq.com', '13501234568','img/avatar/one.png', '林当', '1'),
(NULL, 'naicha', '123456', 'dou@qq.com', '13501234569','img/avatar/one.png', '窦志强', '1'),
(NULL, 'guozhi', '123456', 'ya@qq.com', '13501234560', 'img/avatar/one.png', '秦小雅', '0');
