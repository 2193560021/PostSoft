use lxbishe;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

/*动物种类表*/
DROP TABLE IF EXISTS `kinds`;
CREATE TABLE `kinds`  (
      `id` bigint(30) NOT NULL COMMENT '主键',
      `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '种类名称',
      `intro` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '种类介绍',
      PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

INSERT INTO `kinds` VALUES (1397849417888346113, '虎', '大型猫科动物；毛色浅黄或棕黄色，满身黑色横纹；头圆、耳短，耳背面黑色，中央有一白斑甚显著；四肢健壮有力；尾粗长，具黑色环纹，尾端黑色。');
INSERT INTO `kinds` VALUES (1397849739297861633, '狼', '保护等级有“三有”保护动物。共46个亚种，体型中等、匀称，四肢修长，趾行性，利于快速奔跑。头腭尖形，颜面部长，鼻端突出，耳尖且直立，嗅觉灵敏，听觉发达。');
INSERT INTO `kinds` VALUES (1397849739323027458, '狗', '属于脊索动物门、脊椎动物亚门、哺乳纲、真兽亚纲、食肉目、裂脚亚目、犬科动物。中文亦称“犬”，狗分布于世界各地，被称为“人类最忠实的朋友”，是饲养率最高的宠物，其寿命大约在12~18年。');
INSERT INTO `kinds` VALUES (1397849936421761025, '猫', '属于猫科动物，是全世界家庭中较为广泛的宠物，头圆、颜面部短，前肢五趾，后肢四趾，趾端具锐利而弯曲的爪，爪能伸缩，具有夜视性，以伏击的方式猎捕其它动物，大多能攀援上树。猫的趾底有脂肪质肉垫，以免在行走时发出声响，捕猎时也不会惊跑鼠。行进时爪子处于收缩状态，防止爪被磨钝，在捕鼠和攀岩时会伸出来。');


/*动物品种表*/
DROP TABLE IF EXISTS `kind`;
CREATE TABLE `kind`  (
     `id` bigint(30) NOT NULL COMMENT '主键',
     `img` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片',
     `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品种名称',
     `intro` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '品种介绍',
     `belong` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属种类',
     `create_time` datetime(0) NOT NULL COMMENT '创建时间',
     `update_time` datetime(0) NOT NULL COMMENT '更新时间',
     PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

INSERT INTO `kind` VALUES (1397849417888346138, 'http://localhost:8080/dogs/hsq/hsq.png' , '哈士奇', '原产于西伯利亚的雪橇犬犬种，也叫哈士奇、二哈。该犬脚步轻快，动作优美，身体紧凑，有着很厚的被毛，耳朵直立，尾如毛刷，显示出北方地区的遗传特征。该犬是和狼的血统非常近的犬种，所以外形非常的像狼，有着比大多数犬种都要厚的毛发。','狗', '2023-04-13 16:20:56', '2023-04-13 16:20:56');
INSERT INTO `kind` VALUES (1397849739297861633, 'http://localhost:8080/cars/hqo.png', '阿拉斯加', '原产北美阿拉斯加，是最古老的极地雪橇犬之一。该犬结实、有力、肌肉发达而且胸很深；当它们站立时，头部竖直，眼神显得警惕、好奇，给人的感觉是充满活力而且非常傲娇；头部宽阔，耳朵呈三角形，警惕状态时保持竖立；被毛浓密，披毛有足够的长度以保护内层柔软的底毛；毛色多样，有灰、黑白、红棕等。','狗', '2023-04-13 16:20:56', '2023-04-13 16:20:56');
INSERT INTO `kind` VALUES (1397849739323027458, 'http://localhost:8080/cars/hqo.png', '蓝猫', '传统英国本地猫纯种版本，具有鲜明的矮胖的身体，浓密的毛发和广阔的脸。早期中国人称之为英短蓝猫，学名应该称为英国蓝色短毛猫。最熟悉的彩色变种是“英国蓝”，一个坚实的蓝灰色的外衣和铜颜色的眼睛，但该品种也已在范围广泛的其他颜色和图案。最典型的特征是此猫有五短，即：毛短、身材短、尾巴短、四肢短、耳朵短。','猫', '2023-04-13 16:20:56', '2023-04-13 16:20:56');
INSERT INTO `kind` VALUES (1397849936421761025, 'http://localhost:8080/cars/hqo.png', '金丝熊', '叙利亚仓鼠。在生物分类学上是中仓鼠属的中型仓鼠。和许多仓鼠一样，黄金仓鼠有一个钝的口鼻部，相对较小的眼睛，大耳朵和一条短的约1.5厘米的尾巴。毛发金黄，背部中央颜色较深，耳朵下方可见黑色条纹，有些前额上可能有一片黑色的部分，面部两侧各有一条黑色条纹从颊囊延伸到脖子上。','鼠', '2023-04-13 16:20:56', '2023-04-13 16:20:56');


INSERT INTO `kind` VALUES (1397849417888346101, 'http://localhost:8080/狗/哈士奇/哈士奇.png' , '哈士奇', '原产于西伯利亚的雪橇犬犬种，也叫哈士奇、二哈。该犬脚步轻快，动作优美，身体紧凑，有着很厚的被毛，耳朵直立，尾如毛刷，显示出北方地区的遗传特征。该犬是和狼的血统非常近的犬种，所以外形非常的像狼，有着比大多数犬种都要厚的毛发。','狗', '2023-04-13 16:20:56', '2023-04-13 16:20:56');
INSERT INTO `kind` VALUES (1397849417888346102, 'http://localhost:8080/狗/巴哥/巴哥.png' , '巴哥', '巴哥犬（pug）是体贴、可爱的小型犬种，此犬具备优良的爱干净的个性，这些特点是其广受喜爱的原因。头部大、粗重，不上拱，呈苹果型。前额不后缩，非常亮，兴奋时充满热情。皱纹大而深。眼睛大颜色非常深．突出醒目。眼神安详且充满渴望。有专家认为，此犬产于苏格兰低地，传到亚洲后又由荷兰商人从远东地区带回西方 [1]  。','狗', '2023-04-13 16:20:56', '2023-04-13 16:20:56');
INSERT INTO `kind` VALUES (1397849417888346103, 'http://localhost:8080/狗/博士/博美.png' , '博美', '养过博美的人都知道，这个小家伙是非常的粘人的，而且它的占有欲会非常的强，喜欢长期呆在主人的身边，也喜欢让主人抱着，因为博美的毛发较长，而且是独特的双层毛发，所以打理起来会非常的麻烦。','狗', '2023-04-13 16:20:56', '2023-04-13 16:20:56');
INSERT INTO `kind` VALUES (1397849417888346104, 'http://localhost:8080/狗/藏獒/藏獒.png' , '藏獒', '藏獒（藏语：Dokhyi，英语：Tibetan Mastiff）是由藏族牧民所培育的高大凶猛的护卫犬，又名西藏獒犬。该犬体形高大，体格强壮，结构匀称，肌肉发达；成年藏獒体重45～70千克，体高60～72厘米，体长70～82厘米。广泛分布在海拔2700米以上青藏高原及其周边区域，适应高寒缺氧气候，短跑时速较快，偏肉食。该犬性格倔犟，攻击能力强，对陌生人有强烈的敌意；忠于主人，记忆力强。 [9] 藏獒力大，足以使只小金钱豹或三只恶狼败阵，这使它们赢得“神犬”美誉，藏獒也是世界上唯一敢与猛兽搏斗的犬类。藏獒在藏族家庭中普遍受重视。在荒无人烟的高原上，一旦出现野兽侵袭，唯有藏獒能助一臂之力，救助牧主。藏獒可作为畜牧犬、护卫犬和伴侣犬，是中国优秀的原始地方品种。 [9-10]  ','狗', '2023-04-13 16:20:56', '2023-04-13 16:20:56');
INSERT INTO `kind` VALUES (1397849417888346105, 'http://localhost:8080/狗/法斗/法斗.png' , '法斗', '性格安静、不爱叫，法斗虽然顶着一个“斗牛犬”的名号，但是它从出生就自带“陪伴犬”的身份，性格很温顺，对小孩子很有耐心，让它成为孩子童年的玩伴也是没问题的，适合有小孩的家庭。','狗', '2023-04-13 16:20:56', '2023-04-13 16:20:56');
INSERT INTO `kind` VALUES (1397849417888346106, 'http://localhost:8080/狗/贵宾/贵宾.png' , '贵宾', '贵宾犬也称贵妇犬，活泼，性情优良，极易近人，是一种忠实的犬种。非常敏捷，聪明而优雅的狗，步伐有力而自信，肚皮对于贵宾犬来说，是非常敏感和脆弱的部位，一般它都会有一个保护意识，不让人碰，如果它主动躺开让你碰，说明它非常信任你。。','狗', '2023-04-13 16:20:56', '2023-04-13 16:20:56');
INSERT INTO `kind` VALUES (1397849417888346107, 'http://localhost:8080/狗/吉娃娃/吉娃娃.png' , '吉娃娃', '吉娃娃犬属于小型犬中体型最小的，但是这并不能说明它们是最娇弱的，相反，吉娃娃有着坚韧的意志，非常忠诚于主人，灵活度极高，是一种聪明的宠物。','狗', '2023-04-13 16:20:56', '2023-04-13 16:20:56');
INSERT INTO `kind` VALUES (1397849417888346108, 'http://localhost:8080/狗/金毛/金毛.png' , '金毛', '金毛犬是大型寻回猎犬，运动细胞非常强，运动量大，主人养了之后要天天遛狗，定时遛狗，准时遛狗，性格善良友好、对主人十分忠诚。','狗', '2023-04-13 16:20:56', '2023-04-13 16:20:56');
INSERT INTO `kind` VALUES (1397849417888346109, 'http://localhost:8080/狗/柯基/柯基.png' , '柯基', '柯基犬是一只优秀的护卫犬，柯基腿短，是自然演变，遗传下来的，柯基犬的眼睛非常脆弱，所以眼睛经常都会出现炎症等疾病，柯基犬的叫唤声，响亮而刺激，作为牧羊犬时能对牛羊起到震慑作用。','狗', '2023-04-13 16:20:56', '2023-04-13 16:20:56');
INSERT INTO `kind` VALUES (1397849417888346110, 'http://localhost:8080/狗/拉布拉多/拉布拉多.png' , '拉布拉多', '拉布拉多又称寻回犬，是一种非常好的引导犬，拉布拉多犬的可训练性和服从性很好，因为它通常很贪吃，对小孩尤其的友善，对犬主人略粘人。','狗', '2023-04-13 16:20:56', '2023-04-13 16:20:56');
INSERT INTO `kind` VALUES (1397849417888346111, 'http://localhost:8080/狗/拉萨犬/拉萨犬.png' , '拉萨犬', '拉萨犬 又称 拉萨狮子犬、西藏狮子犬 等，是原产于青藏高原的小型伴侣犬，被毛长而厚密，形似一只小雄狮，特别是头部、耳部和尾部的被毛最为发达，可拖至地面。毛色有金黄、朱砂、黑、白、灰、茶等各种颜色。尾上翘，呈菊花形。拉萨犬一般体重 6－7 kg，体高 25－28 cm，虽然体型不大且性情不凶猛，但身躯强健，对恶劣条件的忍耐力极佳，因此一直是西藏达赖喇嘛的护卫犬。其藏语名中文音译为“阿普索”（或“亚布苏” “阿富早”），英文音译为“Apso”，原意是山羊，表示它们宛如山羊一般（因其下颔的长毛类似山羊胡须），而山羊在西藏神话中扮演着特殊的角色。','狗', '2023-04-13 16:20:56', '2023-04-13 16:20:56');
INSERT INTO `kind` VALUES (1397849417888346112, 'http://localhost:8080/狗/青川犬/青川犬.png' , '青川犬', '青川犬是天生的山地猎犬，当地人叫它撵山狗，成群狩猎威力无穷，移动灵活、凶猛无比。分布于四川广元地区的青川县农村，属于半野生状态。狩猎方面合作性很好，兴奋度中等，但一旦兴奋起来则能维持很久。速度非常快，灵活度较高。','狗', '2023-04-13 16:20:56', '2023-04-13 16:20:56');
INSERT INTO `kind` VALUES (1397849417888346113, 'http://localhost:8080/狗/陕西细犬/陕西细犬.png' , '陕西细犬', '陕西细犬有着悠久的历史，在我国是被真正当作猎犬用的犬种之一，主要生长在陕西关中地区的渭南、西安、咸阳等地，主要用来追逐狩猎，也可看家护卫。。','狗', '2023-04-13 16:20:56', '2023-04-13 16:20:56');
INSERT INTO `kind` VALUES (1397849417888346114, 'http://localhost:8080/狗/松狮犬/松狮犬.png' , '松狮犬', '松狮犬是一种非常时髦的宠物和守护犬，原产中国，有2000多年的历史。据说唐朝时它最受皇帝宠爱，也最为繁盛。过去，曾有一个中国皇帝拥有10万猎人和2500头松狮犬的说法 [1]  。松狮犬集美丽、高贵和自然于一身，拥有独特的蓝舌头、愁苦的表情和夸张的步伐，但不是很听话，有时会非常独立，而且眼睛深陷，视力范围有限 [1]  。在古代曾名为獢獢。 [2] ','狗', '2023-04-13 16:20:56', '2023-04-13 16:20:56');
INSERT INTO `kind` VALUES (1397849417888346115, 'http://localhost:8080/狗/泰迪/泰迪.png' , '泰迪', '泰迪优点聪明，缺点喜欢粘人，泰迪优点运动量少，缺点骨骼脆弱，泰迪因其造型多变，颜色种类多，打扮起来颜值非常高，但是泰迪有一个行为，很多人都比较讨厌，那就是经常会做骑跨的动作，也有了“泰日天”的小称号。','狗', '2023-04-13 16:20:56', '2023-04-13 16:20:56');
INSERT INTO `kind` VALUES (1397849417888346116, 'http://localhost:8080/狗/西藏猎犬/西藏猎犬.png' , '西藏猎犬', '西藏猎犬（Tibetan Spaniel)，人们通常称之为“袖狗”，原产喜马拉雅山脉的西藏，是中国一种古老犬种之一，也是一种带神秘色彩的优良犬种。以后从西藏传入京城，在清朝皇宫中饲养，因此也称宫廷犬。这种犬性格独立、自信，是令人满意的伴侣犬。西藏猎犬属于我国亟待拯救的本土犬种，纯种已经十分少见，现处于濒危的情况。','狗', '2023-04-13 16:20:56', '2023-04-13 16:20:56');
INSERT INTO `kind` VALUES (1397849417888346117, 'http://localhost:8080/狗/雪纳瑞/雪纳瑞.png' , '雪纳瑞', '雪纳瑞的体型可以分为小型、标准型和大型，雪纳瑞的智商，相比于其他狗狗来说，是很优秀的存在，在犬类智商排名中，它的智商可是排在第12位的哦。','狗', '2023-04-13 16:20:56', '2023-04-13 16:20:56');
INSERT INTO `kind` VALUES (1397849417888346118, 'http://localhost:8080/狗/重庆犬/重庆犬.png' , '重庆犬', '重庆犬是古老而稀有的中国特有犬种，国际上的正式名称为：中国重庆犬(Chinese Chongqing dog)。重庆日报和2005年第3期《养犬》杂志上看到,重庆宠物协会将邻水狗改为川东猎犬,重庆直辖后又改为重庆犬 [1]  。据相关考证，重庆犬的历史至少可以追溯到中国汉代。重庆犬原产于今天的中国重庆及四川东部地区。由于地处山区，与外界相对隔离，重庆犬在长期的自然繁衍进化中，逐渐形成了独特的品貌特征和性格气质，同时也鲜为外人所知，即便是本地人也了解得不多。鉴于具有气质高贵、忠诚、勇敢和优秀搏击能力的特性，重庆犬在旧时代主要是由当地的达官贵人豢养，用于看家护院、狩猎和地位的炫耀；20世纪中后期以来，重庆犬的数量逐渐减少。','狗', '2023-04-13 16:20:56', '2023-04-13 16:20:56');
INSERT INTO `kind` VALUES (1397849417888346119, 'http://localhost:8080/猫/安哥拉猫/安哥拉猫.png' , '安哥拉猫', '安哥拉猫是最古老的品种之一，源于土耳其。16世纪传入欧洲，进入意大利和法国，而后传入英国，主要分布在法国和英国，是当时最受欢迎的长毛品种。19世纪中叶，由于波斯猫的出现，安哥拉猫的地位逐渐降低。目前，安哥拉猫主要分布在土耳其，其他地方数量已很少 。 全身有丝般的长毛，有褐、红、黑、白四种毛色，通常认为白色的安哥拉猫最纯正。 该品种猫动作敏捷，性格特立独行，不喜欢人抚、抱。安哥拉猫会生仔，一窝有4仔，小猫出生后就能睁眼，而且顽皮可爱。该猫最逗人之处是特别喜欢水，能在小溪或浴池中畅游且憩态可掬。','猫', '2023-04-13 16:20:56', '2023-04-13 16:20:56');
INSERT INTO `kind` VALUES (1397849417888346120, 'http://localhost:8080/猫/白猫/白猫.png' , '白猫', '白猫通常指毛色为白色的猫，身形像狸，外貌像老虎，毛柔而齿利。以尾长腰短，目光如金银，上腭棱多的最好','猫', '2023-04-13 16:20:56', '2023-04-13 16:20:56');
INSERT INTO `kind` VALUES (1397849417888346121, 'http://localhost:8080/猫/布偶猫/布偶猫.png' , '布偶猫', '布偶猫，发源于美国，又称"布拉多尔猫"，是一种杂交品种。是现存体型最大、体重最重的猫之一。头呈楔形，眼大而圆，被毛丰厚，四肢较长且富有肉感，尾长，身体柔软，毛色有重点色、手套色或双色等等。布偶猫较为温顺好静，对人友善。其美丽优雅又非常类似于狗的性格而又被称为"仙女猫"，"小狗猫"。特殊的外貌和温和的性格是布偶猫最大的特点之一。','猫', '2023-04-13 16:20:56', '2023-04-13 16:20:56');
INSERT INTO `kind` VALUES (1397849417888346122, 'http://localhost:8080/猫/玳瑁猫/玳瑁猫.png' , '玳瑁猫', '玳瑁猫（tortoiseshell cat）的名字来源于海龟的一种——玳瑁，因其皮毛颜色与海龟玳瑁非常相似，故称为玳瑁猫。玳瑁猫一名称是由“玳瑁色猫”简化而来的，因此玳瑁猫并不是猫的一个品种，只是对一种颜色的猫的统称。','猫', '2023-04-13 16:20:56', '2023-04-13 16:20:56');
INSERT INTO `kind` VALUES (1397849417888346123, 'http://localhost:8080/猫/德文卷毛猫/德文卷毛猫.png' , '德文卷毛猫', '德文卷毛猫，别名 德文帝王猫，英文名 Devon Rex。1960年，在英国德文郡又发现了一只卷毛猫。它是继1950年在英国柯尼斯郡发现的柯尼斯猫后的又一卷毛猫。ET是以德文卷毛猫为原型设计出来的。卷毛猫的智商较高，能适应乘车旅行，或居住在汽车房子或单元房间里。无论对老年人还是孩子来说，都不失为理想的宠物。','猫', '2023-04-13 16:20:56', '2023-04-13 16:20:56');
INSERT INTO `kind` VALUES (1397849417888346124, 'http://localhost:8080/猫/加菲猫/加菲猫.png' , '加菲猫', '1960年左右，美国的育种专家将美国短毛猫和波斯猫进行交配繁育，期待改进美国猫的被毛颜色并增加其体重，这样就诞生了异国短毛猫。在1966年被 CFA 承认为新品种。在育种期间，它还和俄罗斯蓝猫及缅甸猫杂交。 1987 年以来，该品种的允许杂交品种被限定为波斯猫一种。FIFE 在 1986 年承认了异国短毛猫。该品种在美国已经非常普遍，在欧洲也在逐渐风行起来。异国短毛猫除拥有浓密皮毛外，还保留了波斯猫独特的可爱表情与圆滚滚的体型。性格也如波斯猫般文静、亲切，能慰藉主人的心，体形为中型到大型的短脚型，头部宽而圆，鼻子有明显的凹陷，皮毛有柔和的光泽性情独立，不爱吵闹。','猫', '2023-04-13 16:20:56', '2023-04-13 16:20:56');
INSERT INTO `kind` VALUES (1397849417888346125, 'http://localhost:8080/猫/金渐层/金渐层.png' , '金渐层', '金色渐层猫底层绒毛为浅蜜黄色到亮杏黄色。背部、两肋、头部和尾巴的被毛的毛尖被充分地染成黑色，增强了外观呈现的金黄色。四肢和尾巴端部有毛尖染色阴影。面颊、耳簇、腹部和胸部是协调的淡色，色调上比底层绒毛还浅一些。由于毛尖染色较少，外观整体效果比阴影金黄色偏浅。眼睛边缘轮廓是黑色。鼻尖:粉红色。眼睛颜色:绿色或蓝绿色。','猫', '2023-04-13 16:20:56', '2023-04-13 16:20:56');
INSERT INTO `kind` VALUES (1397849417888346126, 'http://localhost:8080/猫/橘猫/橘猫.png' , '橘猫', '大胖橘不用多说，大家都认识，十橘九胖就是它了。橘猫（orange cats），也叫橘子猫、桔猫，拥有家猫中常见的一种毛色，普遍存在于混种猫和不具独特规定毛色的注册纯种猫种，与品种无关，与被毛基因有关。国内大部分橘猫都是狸花猫，因此也称为橘狸、黄狸。','猫', '2023-04-13 16:20:56', '2023-04-13 16:20:56');
INSERT INTO `kind` VALUES (1397849417888346127, 'http://localhost:8080/猫/蓝猫/蓝猫.png' , '蓝猫', '英国短毛猫是传统英国本地猫纯种版本，具有鲜明的矮胖的身体，密集的外衣和广阔的脸。早期中国人称之为英短蓝猫，学名应该称为英国蓝色短毛猫。最熟悉的彩色变种是"英国蓝"，一个坚实的蓝灰色的外衣和铜颜色的眼睛，但该品种也已在范围广泛的其他颜色和图案。最典型的特征是此猫有五短，即:毛短、身材短、尾巴短、四肢短、耳朵短。','猫', '2023-04-13 16:20:56', '2023-04-13 16:20:56');
INSERT INTO `kind` VALUES (1397849417888346128, 'http://localhost:8080/猫/狸花猫/狸花猫.png' , '狸花猫', '狸花猫是一种体格健壮的大型猫咪，长有美丽的斑纹被毛。尽管它感情不太外露，但还是能成为忠实友好的宠物。狸花猫以聪明的捕猎技巧而著称，需要较大的运动空间，所以不适宜小公寓的圈养生活 ','猫', '2023-04-13 16:20:56', '2023-04-13 16:20:56');
INSERT INTO `kind` VALUES (1397849417888346129, 'http://localhost:8080/猫/美国短毛猫/美国短毛猫.png' , '美国短毛猫', '美国短毛猫(American Shorthair)是原产美国的一种猫，其祖先为欧洲早期移民带到北美的猫种，与英国短毛猫和欧洲短毛猫同类。据记载，五月花号上携带了数只猫以帮助除鼠。该品种的猫是在街头巷尾收集来的猫当中选种、并和进口品种如英国短毛猫、缅甸猫和波斯猫杂交培育而成。美国短毛猫素以体格魁伟，骨胳粗壮，肌肉发达，生性聪明，性格温顺而著称，是短毛猫类中大型品种。被毛厚密，毛色多达30余种，其中银色条纹品种尤为名贵。','猫', '2023-04-13 16:20:56', '2023-04-13 16:20:56');
INSERT INTO `kind` VALUES (1397849417888346130, 'http://localhost:8080/猫/缅因猫/缅因猫.png' , '缅因猫', '缅因猫因原产于美国缅因州而得名。是北美自然产生的第一个长毛品种，约于18世纪中叶形成较稳定品种。缅因猫体格强壮，被毛厚密，长像与西伯利亚森林猫相似，在猫类中亦属大体型的品种。','猫', '2023-04-13 16:20:56', '2023-04-13 16:20:56');
INSERT INTO `kind` VALUES (1397849417888346131, 'http://localhost:8080/猫/牛奶猫/牛奶猫.png' , '牛奶猫', '奶牛猫就是平时所说的黑白花。因为看起来像奶牛，所以就这么叫。 奶牛猫是普通的家猫属杂交血统。','猫', '2023-04-13 16:20:56', '2023-04-13 16:20:56');
INSERT INTO `kind` VALUES (1397849417888346132, 'http://localhost:8080/猫/三花猫/三花猫.png' , '三花猫', '三花猫是身上有黑、橘、白三种颜色的猫。三花猫指的是花色，并不区分种类。绝大多数三花猫都是母猫。','猫', '2023-04-13 16:20:56', '2023-04-13 16:20:56');
INSERT INTO `kind` VALUES (1397849417888346133, 'http://localhost:8080/猫/山东狮子猫/山东狮子猫.png' , '山东狮子猫', '临清狮猫，俗称狮猫、临清猫 [7]  。临清狮猫是清末临清城区回族群众用波斯猫与本地猫杂交选育的稀世品种，其貌酷似小狮子，故名临清狮猫。临清狮猫主产于山东省临清市，是一个极具观赏价值的优质猫类品种，当地人多用其作为地方珍品赠予客人。北京、上海、天津等大城市居民家中饲养的临清狮猫均来源于此 [2]  。"所谓鸳鸯眼，即其眼睛一只为黄色，一只为蓝色。 在诸多品种中，以一只蓝眼、一只黄眼，雪白被毛的狮子猫最为珍贵。人们称其为“鸳鸯眼狮猫”。它的蓝眼晶莹剔透；黄眼的金光闪闪，清澈透明。性情温顺，个体巨大。毛长而柔软，头大眼圆，耳尖腿长，腰圆尾粗，喜洁净，善跃行动敏捷 [1]  。','猫', '2023-04-13 16:20:56', '2023-04-13 16:20:56');
INSERT INTO `kind` VALUES (1397849417888346134, 'http://localhost:8080/猫/无毛猫/无毛猫.png' , '无毛猫', '斯芬克斯猫（Sphynx）又称加拿大无毛猫，是加拿大安大略省多伦多市养猫爱好者在1966年从一窝几乎是无毛的猫仔中，经过近交选育，特意为对猫毛过敏的爱猫者培育成的。这种猫是自然的基因突变产生的宠物猫，除了在耳、口、鼻、尾前锻、脚等部位有些又薄又软的胎毛外，其它全身部分均无毛，皮肤多皱有弹性。加拿大无毛猫性情温顺，独立性强，无攻击性，能与其它猫狗相处。','猫', '2023-04-13 16:20:56', '2023-04-13 16:20:56');
INSERT INTO `kind` VALUES (1397849417888346135, 'http://localhost:8080/猫/暹罗猫/暹罗猫.png' , '暹罗猫', '暹(xiān)罗猫是世界著名的短毛猫，也是短毛猫的代表品种。种族历史暹罗猫原产于泰国(故名暹罗)，在 200多年前，这种珍贵的猫仅在泰国的皇宫和大寺院中饲养，是足不出户的贵族。','猫', '2023-04-13 16:20:56', '2023-04-13 16:20:56');
INSERT INTO `kind` VALUES (1397849417888346136, 'http://localhost:8080/猫/银渐层/银渐层.png' , '银渐层', '英短银渐层是由英国短毛猫(蓝灰色)与金吉拉猫繁育而出的英短品种色，具备了金吉拉猫白色的毛色，又具备了英国短毛猫重要的特征。在银渐层的繁育过程中，出现了毛色为点状色的金点、银点、金渐层、蓝金渐层等。','猫', '2023-04-13 16:20:56', '2023-04-13 16:20:56');
INSERT INTO `kind` VALUES (1397849417888346137, 'http://localhost:8080/猫/英国短毛猫/英国短毛猫.png' , '英国短毛猫', '英国短毛猫，体形圆胖，四肢粗短发达，被毛短而密，头大脸圆，温柔平静，对人友善，极易饲养。在英国本地很早就获得认可，1901年，还出现其猫种之理想形象。它原是一种体型相当大又结实的蓝猫，过了1970年代，毛色和外型都开始改变。体型越来越小，毛色的种类也变得丰富，所有的改变都朝向优雅的风格。','猫', '2023-04-13 16:20:56', '2023-04-13 16:20:56');


/*动物个体表*/
DROP TABLE IF EXISTS `unit`;
CREATE TABLE `unit`  (
    `id` bigint(20) NOT NULL COMMENT '主键',
    `img` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片',
    `name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名字',
    `age` int(120) NOT NULL COMMENT '年龄',
    `gender` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '性别',
    `live_style` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '习性',
    `price` varchar(120) NOT NULL COMMENT '价格',
    `kind` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属品种',
    `create_time` datetime(0) NOT NULL COMMENT '创建时间',
    `update_time` datetime(0) NOT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

INSERT INTO `unit` VALUES (1533638999774633901, 'http://localhost:8080/猫/橘猫/橘猫.png', '旺财',1, '公', '已打疫苗，未绝育，爱睡懒觉', '100', '橘猫', '2023-04-13 16:20:56', '2023-04-13 16:20:56');
INSERT INTO `unit` VALUES (1533639902057504702, 'http://localhost:8080/猫/蓝猫/蓝猫.png', '糖咪',2, '母', '已打疫苗，未绝育，喜欢毛球球，安静', '500', '蓝猫', '2023-04-13 16:20:56', '2023-04-13 16:20:56');
INSERT INTO `unit` VALUES (1533638999774633903, 'http://localhost:8080/猫/暹罗猫/暹罗猫.png', '润土',3, '公', '已打疫苗，未绝育，喜欢干饭', '1300', '暹罗猫', '2023-04-13 16:20:56', '2023-04-13 16:20:56');
INSERT INTO `unit` VALUES (1533638999774633904, 'http://localhost:8080/猫/缅因猫/缅因猫.png', '文安',1, '母', '已打疫苗，未绝育，喜欢猫条', '1800', '缅因猫', '2023-04-13 16:20:56', '2023-04-13 16:20:56');
INSERT INTO `unit` VALUES (1533638999774633905, 'http://localhost:8080/猫/布偶猫/布偶猫.png', '欢乐',3, '公', '已打疫苗，未绝育，爱吃鸡胸肉', '1700', '布偶猫', '2023-04-13 16:20:56', '2023-04-13 16:20:56');
INSERT INTO `unit` VALUES (1533638999774633906, 'http://localhost:8080/猫/山东狮子猫/山东狮子猫.png', '可可',1, '公', '已打疫苗，未绝育，爱睡懒觉', '900', '山东狮子猫', '2023-04-13 16:20:56', '2023-04-13 16:20:56');
INSERT INTO `unit` VALUES (1533638999774633907, 'http://localhost:8080/猫/德文卷毛猫/德文卷毛猫.png', '阳阳',3, '母', '已打疫苗，未绝育，粘人', '2500', '德文卷毛猫', '2023-04-13 16:20:56', '2023-04-13 16:20:56');
INSERT INTO `unit` VALUES (1533638999774633908, 'http://localhost:8080/狗/法斗/法斗.png', '笑笑',2, '公', '已打疫苗，未绝育', '800', '法斗', '2023-04-13 16:20:56', '2023-04-13 16:20:56');
INSERT INTO `unit` VALUES (1533638999774633909, 'http://localhost:8080/狗/哈士奇/哈士奇.png', '千千',0.5, '公', '已打疫苗，未绝育', '1500', '哈士奇', '2023-04-13 16:20:56', '2023-04-13 16:20:56');
INSERT INTO `unit` VALUES (1533638999774633910, 'http://localhost:8080/狗/拉布拉多/拉布拉多.png', '洋洋',1, '公', '已打疫苗，未绝育', '2300', '拉布拉多', '2023-04-13 16:20:56', '2023-04-13 16:20:56');
INSERT INTO `unit` VALUES (1533638999774633911, 'http://localhost:8080/狗/雪纳瑞/雪纳瑞.png', '格格',3, '母', '已打疫苗，未绝育', '500', '雪纳瑞', '2023-04-13 16:20:56', '2023-04-13 16:20:56');
INSERT INTO `unit` VALUES (1533638999774633912, 'http://localhost:8080/狗/博美/博美.png', '锤锤',1, '公', '已打疫苗，未绝育', '500', '博美', '2023-04-13 16:20:56', '2023-04-13 16:20:56');
INSERT INTO `unit` VALUES (1533638999774633913, 'http://localhost:8080/狗/柯基/柯基.png', '铁铁',0.5, '母', '已打疫苗，未绝育', '1400', '柯基', '2023-04-13 16:20:56', '2023-04-13 16:20:56');
INSERT INTO `unit` VALUES (1533638999774633914, 'http://localhost:8080/狗/巴哥/巴哥.png', '莹莹',1, '公', '已打疫苗，未绝育', '300', '巴哥', '2023-04-13 16:20:56', '2023-04-13 16:20:56');


/* 动物领养表 */
DROP TABLE IF EXISTS `adoption`;
CREATE TABLE `adoption`  (
      `id` bigint(20) NOT NULL COMMENT '主键',
      `img` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片',
      `name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
      `gender` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '性别',
      `kind` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属品种',
      `ani` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属种类',
      `finder` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发布人',
      `tel` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系电话',
      `address` varchar(220) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '领养地址',
      `note` varchar(220) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
      `state` int(10) NOT NULL COMMENT '状态',
      `create_time` datetime(0) NOT NULL COMMENT '发布时间',
      `update_time` datetime(0) NOT NULL COMMENT '更新时间',
      PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

INSERT INTO `adoption` VALUES (1531913671796604930, 'http://localhost:8080/files/yantafendian.png', '校门口的流浪狗', '公', '哈士奇','狗', '2193560021','13279505680','陕西省西安市长安区西安邮电大学东区','备注1',1, '2023-04-13 16:20:56', '2023-04-13 16:20:56');
INSERT INTO `adoption` VALUES (1531913693355327489, 'http://localhost:8080/files/dongyoufendian.png', '校门口的流浪猫', '母', '银渐层','猫', '3199432593','15929068966','陕西省西安市长安区西安邮电大学东区安美公寓','备注2',1, '2023-04-11 09:53:13', '2023-04-13 16:20:56');

INSERT INTO `adoption` VALUES (1531913671796604901, 'http://localhost:8080/猫/橘猫/橘猫.png', '校门口的流浪猫1', '公', '橘猫','猫', '2193560021','13279505680','陕西省西安市长安区西安邮电大学东区','备注1',1, '2023-04-13 16:20:56', '2023-04-13 16:20:56');
INSERT INTO `adoption` VALUES (1531913671796604902, 'http://localhost:8080/猫/牛奶猫/牛奶猫.png', '校门口的流浪猫2', '母', '牛奶猫','猫', '2193560021','13279505680','陕西省西安市长安区西安邮电大学东区','备注1',1, '2023-04-13 16:20:56', '2023-04-13 16:20:56');
INSERT INTO `adoption` VALUES (1531913671796604903, 'http://localhost:8080/猫/白猫/白猫.png', '校门口的流浪猫3', '公', '白猫','猫', '2193560021','13279505680','陕西省西安市长安区西安邮电大学东区','备注1',1, '2023-04-13 16:20:56', '2023-04-13 16:20:56');
INSERT INTO `adoption` VALUES (1531913671796604904, 'http://localhost:8080/狗/陕西细犬/陕西细犬.png', '校门口的流浪狗1', '公', '陕西细犬','狗', '2193560021','13279505680','陕西省西安市长安区西安邮电大学东区','备注1',1, '2023-04-13 16:20:56', '2023-04-13 16:20:56');
INSERT INTO `adoption` VALUES (1531913671796604905, 'http://localhost:8080/狗/柯基/柯基.png', '校门口的流浪狗2', '公', '柯基','狗', '2193560021','13279505680','陕西省西安市长安区西安邮电大学东区','备注1',1, '2023-04-13 16:20:56', '2023-04-13 16:20:56');


/* 宠物用品表 */
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
     `id` bigint(20) NOT NULL COMMENT '主键',
     `img` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '封面',
     `name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用品名称',
     `price` varchar(120) NOT NULL COMMENT '价格',
     `date` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '生产日期',
     `ddl` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '保质期',
     `sale` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '销量',
     `stock` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '库存',
     `note` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '备注',
     `create_time` datetime(0) NOT NULL COMMENT '创建时间',
     `update_time` datetime(0) NOT NULL COMMENT '更新时间',
     PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

INSERT INTO `goods` VALUES (1531913671796604901, 'http://localhost:8080/宠物用品信息/狗/狗厕所/狗厕所.png', '狗厕所', '50', '2023-04-13 16:20:56','10years','1000','2000','狗狗厕所','2023-04-13 16:20:56','2023-04-13 16:20:56');
INSERT INTO `goods` VALUES (1531913671796604902, 'http://localhost:8080/宠物用品信息/狗/狗粮/狗粮.png', '狗粮', '50', '2023-04-13 16:20:56','10years','1000','2000','狗粮','2023-04-13 16:20:56','2023-04-13 16:20:56');
INSERT INTO `goods` VALUES (1531913671796604903, 'http://localhost:8080/宠物用品信息/狗/狗窝/狗窝.png', '狗窝', '50', '2023-04-13 16:20:56','10years','1000','2000','狗窝','2023-04-13 16:20:56','2023-04-13 16:20:56');
INSERT INTO `goods` VALUES (1531913671796604904, 'http://localhost:8080/宠物用品信息/狗/零食/零食.png', '零食', '50', '2023-04-13 16:20:56','10years','1000','2000','零食','2023-04-13 16:20:56','2023-04-13 16:20:56');
INSERT INTO `goods` VALUES (1531913671796604905, 'http://localhost:8080/宠物用品信息/猫/猫背包/猫背包.png', '猫背包', '50', '2023-04-13 16:20:56','10years','1000','2000','猫背包','2023-04-13 16:20:56','2023-04-13 16:20:56');
INSERT INTO `goods` VALUES (1531913671796604906, 'http://localhost:8080/宠物用品信息/猫/猫厕所/猫厕所.png', '猫厕所', '50', '2023-04-13 16:20:56','10years','1000','2000','猫厕所','2023-04-13 16:20:56','2023-04-13 16:20:56');
INSERT INTO `goods` VALUES (1531913671796604907, 'http://localhost:8080/宠物用品信息/猫/猫咪玩具/猫咪玩具.png', '猫咪玩具', '50', '2023-04-13 16:20:56','10years','1000','2000','猫咪玩具','2023-04-13 16:20:56','2023-04-13 16:20:56');
INSERT INTO `goods` VALUES (1531913671796604908, 'http://localhost:8080/宠物用品信息/猫/猫咪指甲剪/猫咪指甲剪.png', '猫咪指甲剪', '50', '2023-04-13 16:20:56','10years','1000','2000','猫咪指甲剪','2023-04-13 16:20:56','2023-04-13 16:20:56');
INSERT INTO `goods` VALUES (1531913671796604909, 'http://localhost:8080/宠物用品信息/猫/猫砂/猫砂.png', '猫砂', '50', '2023-04-13 16:20:56','10years','1000','2000','猫砂','2023-04-13 16:20:56','2023-04-13 16:20:56');
INSERT INTO `goods` VALUES (1531913671796604910, 'http://localhost:8080/宠物用品信息/猫/猫碗/猫碗.png', '猫碗', '50', '2023-04-13 16:20:56','10years','1000','2000','猫碗','2023-04-13 16:20:56','2023-04-13 16:20:56');
INSERT INTO `goods` VALUES (1531913671796604911, 'http://localhost:8080/宠物用品信息/猫/猫饮水机/猫饮水机.png', '猫饮水机', '50', '2023-04-13 16:20:56','10years','1000','2000','猫饮水机','2023-04-13 16:20:56','2023-04-13 16:20:56');


/* 宠物医疗表 */
DROP TABLE IF EXISTS `health`;
CREATE TABLE `health`  (
    `id` bigint(20) NOT NULL COMMENT '主键',
    `img` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '封面',
    `name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '服务名称',
    `price` varchar(120) NOT NULL COMMENT '价格',
    `sale` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '销量',
    `note` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '备注',
    `create_time` datetime(0) NOT NULL COMMENT '创建时间',
    `update_time` datetime(0) NOT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

INSERT INTO `health` VALUES (1531913671796604994, 'http://localhost:8080/宠物医疗信息/猫/绝育/绝育.png', '绝育', '1388', '2000','猫咪绝育','2023-04-13 16:20:56','2023-04-13 16:20:56');
INSERT INTO `health` VALUES (1531913671796604902, 'http://localhost:8080/宠物医疗信息/猫/洗澡/洗澡.png', '洗澡', '1388', '2000','猫咪洗澡','2023-04-13 16:20:56','2023-04-13 16:20:56');
INSERT INTO `health` VALUES (1531913671796604903, 'http://localhost:8080/宠物医疗信息/猫/疫苗/疫苗.png', '疫苗', '1388', '2000','猫咪疫苗','2023-04-13 16:20:56','2023-04-13 16:20:56');
INSERT INTO `health` VALUES (1531913671796604904, 'http://localhost:8080/宠物医疗信息/狗/绝育/绝育.png', '绝育', '1388', '2000','狗狗绝育','2023-04-13 16:20:56','2023-04-13 16:20:56');
INSERT INTO `health` VALUES (1531913671796604905, 'http://localhost:8080/宠物医疗信息/狗/洗澡/洗澡.png', '洗澡', '1388', '2000','狗狗洗澡','2023-04-13 16:20:56','2023-04-13 16:20:56');
INSERT INTO `health` VALUES (1531913671796604906, 'http://localhost:8080/宠物医疗信息/狗/疫苗/疫苗.png', '疫苗', '1388', '2000','狗狗疫苗','2023-04-13 16:20:56','2023-04-13 16:20:56');


/*博客表*/
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog`  (
    `id` bigint(20) NOT NULL COMMENT '主键',
    `img` varchar(120) NOT NULL COMMENT '封面',
    `title` varchar(64) DEFAULT NULL COMMENT '标题',
    `pet` varchar(120) NOT NULL COMMENT '相关动物',
    `body` text DEFAULT NULL COMMENT '内容',
    `owner` varchar(120) NOT NULL COMMENT '发布人',
    `owner_id` bigint(20) NOT NULL COMMENT '发布人ID',
    `views` int(11) DEFAULT '0' COMMENT '浏览数量',
    `create_time` datetime(0) NOT NULL COMMENT '发布时间',
    `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

INSERT INTO `blog` VALUES (1534341375271723009, 'http://localhost:8080/files/508e348c-748b-4a9f-a4ba-47507239faa0.jpg','最受欢迎的宠物狗','狗', '一、十大最受欢迎的宠物狗：哈士奇
哈士奇：西伯利亚雪橇犬，二哈就是它了。他是原始的古老犬种，在西伯利亚东北部、格陵兰南部生活。哈士奇性格多变，有的极端温顺，也有的极端暴力。进入家庭的哈士奇，都选择温顺品种。不过它最出名的还是它能拆家，不过主人都很喜欢。
二、十大最受欢迎的宠物狗：柴犬
柴犬是体型中等并且又最古老的犬。柴犬性格活泼、好动。对自己喜欢的玩具、会玩上一整天。其对外有极强警惕性，能为户主看家护院。柴犬外观和日本秋田犬比较好像是它的缩小版。
3.柯基：柯基是一种小型犬，但性格非常稳健，完全没有一般小型犬的神经质，是非常适合小孩的守护犬。'
, '2193560021','1534341375271723009', '5', '2022-06-08 09:07:45', '2022-06-08 09:07:45');
INSERT INTO `blog` VALUES (1534341375271723088, 'http://localhost:8080/files/508e348c-748b-4a9f-a4ba-47507239faa0.jpg','最受欢迎的宠物狗','狗', '一、十大最受欢迎的宠物狗：哈士奇
哈士奇：西伯利亚雪橇犬，二哈就是它了。他是原始的古老犬种，在西伯利亚东北部、格陵兰南部生活。哈士奇性格多变，有的极端温顺，也有的极端暴力。进入家庭的哈士奇，都选择温顺品种。不过它最出名的还是它能拆家，不过主人都很喜欢。
二、十大最受欢迎的宠物狗：柴犬
柴犬是体型中等并且又最古老的犬。柴犬性格活泼、好动。对自己喜欢的玩具、会玩上一整天。其对外有极强警惕性，能为户主看家护院。柴犬外观和日本秋田犬比较好像是它的缩小版。
3.柯基：柯基是一种小型犬，但性格非常稳健，完全没有一般小型犬的神经质，是非常适合小孩的守护犬。'
, '3199432593','1532212175635058690', '3', '2022-06-09 09:07:45', '2022-06-09 09:07:45');


/* 用户表 */
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
     `id` bigint(30) NOT NULL COMMENT '主键',
     `img` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '头像',
     `name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
     `phone` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
     `id_card` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci default null COMMENT '身份证号',
     `email` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱',
     `password` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户密码',
     `create_time` datetime(0) default NULL COMMENT '创建时间',
     `update_time` datetime(0) default NULL COMMENT '更新时间',
     PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

INSERT INTO user
VALUES (1532212175635058690, 'http://localhost:8080/files/touxiang_xu.jpg', '刘璇', '15929068966', '6161627373848432', '1299605102@qq.com', 'ee7ee7d96d79d0fb40f9f5486f7bf6f6', '2022-06-02 12:07:04', '2022-06-02 12:07:24');


/*系统订单表*/
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
    `id` bigint(20) NOT NULL COMMENT '订单号',
    `img` varchar(64) NOT NULL COMMENT '图片',
    `name` varchar(64) NOT NULL COMMENT '商品名',
    `customer_id` bigint(20) NOT NULL COMMENT '买家id',
    `tel` varchar(64) NOT NULL COMMENT '联系方式',
    `count` int(20) NOT NULL COMMENT '数量',
    `address` varchar(64) NOT NULL COMMENT '地址',
    `price` varchar(120) NOT NULL COMMENT '付款金额',
    `pay_time` datetime(0) NOT NULL COMMENT '支付时间',
    `state` varchar(120) NOT NULL COMMENT '状态',
    `create_time` datetime(0) NOT NULL COMMENT '创建时间',
    `update_time` datetime(0) NOT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

INSERT INTO `orders` VALUES (1531913671796604930,'http://localhost:8080/files/布偶猫.png','布偶猫','1532212175635058690','15929068966','1','西安邮电大学','1388','2022-06-02 12:07:04','已购买','2022-06-02 12:07:04','2022-06-02 12:07:04');
