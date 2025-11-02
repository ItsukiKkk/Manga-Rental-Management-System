prompt PL/SQL Developer Export Tables for user Itsuki@ORCL
prompt Created by 95711 on 2025年11月2日
set feedback off
set define off

prompt Disabling triggers for CATEGORY...
alter table CATEGORY disable all triggers;
prompt Disabling triggers for PREFECTURE...
alter table PREFECTURE disable all triggers;
prompt Disabling triggers for CITY...
alter table CITY disable all triggers;
prompt Disabling triggers for CLERK...
alter table CLERK disable all triggers;
prompt Disabling triggers for CUSTOMER...
alter table CUSTOMER disable all triggers;
prompt Disabling triggers for DEPARTMENT...
alter table DEPARTMENT disable all triggers;
prompt Disabling triggers for D_ADMIN...
alter table D_ADMIN disable all triggers;
prompt Disabling triggers for D_CLASS...
alter table D_CLASS disable all triggers;
prompt Disabling triggers for D_DORMGRADE...
alter table D_DORMGRADE disable all triggers;
prompt Disabling triggers for D_DORMITORYINFO...
alter table D_DORMITORYINFO disable all triggers;
prompt Disabling triggers for D_DORMREPAIR...
alter table D_DORMREPAIR disable all triggers;
prompt Disabling triggers for D_STGRADE...
alter table D_STGRADE disable all triggers;
prompt Disabling triggers for D_STUDENT...
alter table D_STUDENT disable all triggers;
prompt Disabling triggers for D_VISITOR...
alter table D_VISITOR disable all triggers;
prompt Disabling triggers for EMPLOYEE...
alter table EMPLOYEE disable all triggers;
prompt Disabling triggers for STATISTICAL_LOG...
alter table STATISTICAL_LOG disable all triggers;
prompt Disabling triggers for TITLE...
alter table TITLE disable all triggers;
prompt Disabling triggers for STOCK...
alter table STOCK disable all triggers;
prompt Disabling triggers for T_USER...
alter table T_USER disable all triggers;
prompt Disabling foreign key constraints for CITY...
alter table CITY disable constraint FK_CITY_RRECD_CD;
prompt Disabling foreign key constraints for TITLE...
alter table TITLE disable constraint FK_CTG_CD;
prompt Disabling foreign key constraints for STOCK...
alter table STOCK disable constraint FK_TITLE_ID;
prompt Deleting T_USER...
delete from T_USER;
commit;
prompt Deleting STOCK...
delete from STOCK;
commit;
prompt Deleting TITLE...
delete from TITLE;
commit;
prompt Deleting STATISTICAL_LOG...
delete from STATISTICAL_LOG;
commit;
prompt Deleting EMPLOYEE...
delete from EMPLOYEE;
commit;
prompt Deleting D_VISITOR...
delete from D_VISITOR;
commit;
prompt Deleting D_STUDENT...
delete from D_STUDENT;
commit;
prompt Deleting D_STGRADE...
delete from D_STGRADE;
commit;
prompt Deleting D_DORMREPAIR...
delete from D_DORMREPAIR;
commit;
prompt Deleting D_DORMITORYINFO...
delete from D_DORMITORYINFO;
commit;
prompt Deleting D_DORMGRADE...
delete from D_DORMGRADE;
commit;
prompt Deleting D_CLASS...
delete from D_CLASS;
commit;
prompt Deleting D_ADMIN...
delete from D_ADMIN;
commit;
prompt Deleting DEPARTMENT...
delete from DEPARTMENT;
commit;
prompt Deleting CUSTOMER...
delete from CUSTOMER;
commit;
prompt Deleting CLERK...
delete from CLERK;
commit;
prompt Deleting CITY...
delete from CITY;
commit;
prompt Deleting PREFECTURE...
delete from PREFECTURE;
commit;
prompt Deleting CATEGORY...
delete from CATEGORY;
commit;
prompt Loading CATEGORY...
insert into CATEGORY (category_cd, category)
values ('001', '少年');
insert into CATEGORY (category_cd, category)
values ('002', '少女');
insert into CATEGORY (category_cd, category)
values ('003', '日常');
insert into CATEGORY (category_cd, category)
values ('004', 'ロマンス');
insert into CATEGORY (category_cd, category)
values ('005', 'スポーツ');
insert into CATEGORY (category_cd, category)
values ('006', 'アドベンチャー');
insert into CATEGORY (category_cd, category)
values ('007', '推理');
insert into CATEGORY (category_cd, category)
values ('008', '歴史');
insert into CATEGORY (category_cd, category)
values ('009', 'ファンタジー');
insert into CATEGORY (category_cd, category)
values ('010', 'コメディ');
insert into CATEGORY (category_cd, category)
values ('011', 'サスペンス');
insert into CATEGORY (category_cd, category)
values ('012', 'ホラー');
insert into CATEGORY (category_cd, category)
values ('013', '雑誌');
insert into CATEGORY (category_cd, category)
values ('028', 'dccdc');
insert into CATEGORY (category_cd, category)
values ('029', 'www');
commit;
prompt 15 records loaded
prompt Loading PREFECTURE...
insert into PREFECTURE (pre_cd, pre_name)
values ('01', '北海道');
insert into PREFECTURE (pre_cd, pre_name)
values ('02', '青森県');
insert into PREFECTURE (pre_cd, pre_name)
values ('03', '岩手県');
insert into PREFECTURE (pre_cd, pre_name)
values ('04', '宮城県');
insert into PREFECTURE (pre_cd, pre_name)
values ('05', '秋田県');
insert into PREFECTURE (pre_cd, pre_name)
values ('06', '山形県');
insert into PREFECTURE (pre_cd, pre_name)
values ('07', '福島県');
insert into PREFECTURE (pre_cd, pre_name)
values ('08', '茨城県');
insert into PREFECTURE (pre_cd, pre_name)
values ('09', '栃木県');
insert into PREFECTURE (pre_cd, pre_name)
values ('10', '群馬県');
insert into PREFECTURE (pre_cd, pre_name)
values ('11', '埼玉県');
insert into PREFECTURE (pre_cd, pre_name)
values ('12', '千葉県');
insert into PREFECTURE (pre_cd, pre_name)
values ('13', '東京都');
insert into PREFECTURE (pre_cd, pre_name)
values ('14', '神奈川県');
insert into PREFECTURE (pre_cd, pre_name)
values ('15', '新潟県');
insert into PREFECTURE (pre_cd, pre_name)
values ('16', '富山県');
insert into PREFECTURE (pre_cd, pre_name)
values ('17', '石川県');
insert into PREFECTURE (pre_cd, pre_name)
values ('18', '福井県');
insert into PREFECTURE (pre_cd, pre_name)
values ('19', '山梨県');
insert into PREFECTURE (pre_cd, pre_name)
values ('20', '長野県');
insert into PREFECTURE (pre_cd, pre_name)
values ('21', '岐阜県');
insert into PREFECTURE (pre_cd, pre_name)
values ('22', '静岡県');
insert into PREFECTURE (pre_cd, pre_name)
values ('23', '愛知県');
insert into PREFECTURE (pre_cd, pre_name)
values ('24', '三重県');
insert into PREFECTURE (pre_cd, pre_name)
values ('25', '滋賀県');
insert into PREFECTURE (pre_cd, pre_name)
values ('26', '京都府');
insert into PREFECTURE (pre_cd, pre_name)
values ('27', '大阪府');
insert into PREFECTURE (pre_cd, pre_name)
values ('28', '兵庫県');
insert into PREFECTURE (pre_cd, pre_name)
values ('29', '奈良県');
insert into PREFECTURE (pre_cd, pre_name)
values ('30', '和歌山県');
insert into PREFECTURE (pre_cd, pre_name)
values ('31', '鳥取県');
insert into PREFECTURE (pre_cd, pre_name)
values ('32', '島根県');
insert into PREFECTURE (pre_cd, pre_name)
values ('33', '岡山県');
insert into PREFECTURE (pre_cd, pre_name)
values ('34', '広島県');
insert into PREFECTURE (pre_cd, pre_name)
values ('35', '山口県');
insert into PREFECTURE (pre_cd, pre_name)
values ('36', '徳島県');
insert into PREFECTURE (pre_cd, pre_name)
values ('37', '香川県');
insert into PREFECTURE (pre_cd, pre_name)
values ('38', '愛媛県');
insert into PREFECTURE (pre_cd, pre_name)
values ('39', '高知県');
insert into PREFECTURE (pre_cd, pre_name)
values ('40', '福岡県');
insert into PREFECTURE (pre_cd, pre_name)
values ('41', '佐賀県');
insert into PREFECTURE (pre_cd, pre_name)
values ('42', '長崎県');
insert into PREFECTURE (pre_cd, pre_name)
values ('43', '熊本県');
insert into PREFECTURE (pre_cd, pre_name)
values ('44', '大分県');
insert into PREFECTURE (pre_cd, pre_name)
values ('45', '宮崎県');
insert into PREFECTURE (pre_cd, pre_name)
values ('46', '鹿児島県');
insert into PREFECTURE (pre_cd, pre_name)
values ('47', '沖縄県');
commit;
prompt 47 records loaded
prompt Loading CITY...
insert into CITY (city_id, pre_cd, city_name)
values (13, '13', '渋谷区');
insert into CITY (city_id, pre_cd, city_name)
values (14, '14', '川崎市');
insert into CITY (city_id, pre_cd, city_name)
values (15, '11', '川口市');
insert into CITY (city_id, pre_cd, city_name)
values (16, '11', '埼玉市');
insert into CITY (city_id, pre_cd, city_name)
values (1, '13', '港区');
insert into CITY (city_id, pre_cd, city_name)
values (2, '13', '中央区');
insert into CITY (city_id, pre_cd, city_name)
values (3, '26', '左京区');
insert into CITY (city_id, pre_cd, city_name)
values (4, '14', '横浜市');
insert into CITY (city_id, pre_cd, city_name)
values (5, '13', '新宿区');
insert into CITY (city_id, pre_cd, city_name)
values (6, '13', '北区');
insert into CITY (city_id, pre_cd, city_name)
values (7, '26', '右京区');
insert into CITY (city_id, pre_cd, city_name)
values (8, '13', '渋谷区');
insert into CITY (city_id, pre_cd, city_name)
values (9, '27', '阿倍野区');
insert into CITY (city_id, pre_cd, city_name)
values (10, '13', '品川区');
insert into CITY (city_id, pre_cd, city_name)
values (11, '27', '住吉区');
insert into CITY (city_id, pre_cd, city_name)
values (12, '27', '東淀川区');
commit;
prompt 16 records loaded
prompt Loading CLERK...
insert into CLERK (clerk_id, lastname, lastkana, firstname, firstkana, password)
values ('001', '平井', 'ヒライ', '桃', 'モモ', '202cb962ac59075b964b07152d234b70');
insert into CLERK (clerk_id, lastname, lastkana, firstname, firstkana, password)
values ('002', '西村', 'ニシムラ', '力', 'リキ', '202cb962ac59075b964b07152d234b70');
commit;
prompt 2 records loaded
prompt Loading CUSTOMER...
insert into CUSTOMER (mem_id, lastname, lastkana, firstname, firstkana, birthdate, post, addr1, addr2, addr3, tel1, tel2, tel3, password, id_flag, apply_date, expiry_date, del_flag)
values ('00000022', '山田', 'ヤマダ', '太郎', 'タロウ', to_date('20-08-2010', 'dd-mm-yyyy'), '1234567', '東京都', '新宿区', '1-1-1', '03', '1234', '5678', 'password123', 0, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('20-05-2026', 'dd-mm-yyyy'), 0);
insert into CUSTOMER (mem_id, lastname, lastkana, firstname, firstkana, birthdate, post, addr1, addr2, addr3, tel1, tel2, tel3, password, id_flag, apply_date, expiry_date, del_flag)
values ('00000023', '山田', 'ヤマダ', '太郎1', 'タロウ1', to_date('21-08-2010', 'dd-mm-yyyy'), '7654321', '東京都', '中央区', '2-2-2', '03', '2345', '6789', 'password123', 1, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('20-05-2026', 'dd-mm-yyyy'), 1);
insert into CUSTOMER (mem_id, lastname, lastkana, firstname, firstkana, birthdate, post, addr1, addr2, addr3, tel1, tel2, tel3, password, id_flag, apply_date, expiry_date, del_flag)
values ('00000024', '山田', 'ヤマダ', '太郎2', 'タロウ2', to_date('22-08-2010', 'dd-mm-yyyy'), '3456789', '東京都', '渋谷区', '3-3-3', '03', '3456', '7890', 'password123', 0, to_date('20-05-2022', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 0);
insert into CUSTOMER (mem_id, lastname, lastkana, firstname, firstkana, birthdate, post, addr1, addr2, addr3, tel1, tel2, tel3, password, id_flag, apply_date, expiry_date, del_flag)
values ('00000025', '田中', 'タナカ', '花子', 'ハナコ', to_date('20-10-1996', 'dd-mm-yyyy'), '5678901', '東京都', '中央区', '4-4-4', '03', '4567', '8901', 'password123', 0, to_date('20-06-2024', 'dd-mm-yyyy'), to_date('20-06-2026', 'dd-mm-yyyy'), 0);
insert into CUSTOMER (mem_id, lastname, lastkana, firstname, firstkana, birthdate, post, addr1, addr2, addr3, tel1, tel2, tel3, password, id_flag, apply_date, expiry_date, del_flag)
values ('00000026', '田中', 'タナカ', '花子1', 'ハナコ1', to_date('21-10-1996', 'dd-mm-yyyy'), '4567890', '東京都', '渋谷区', '5-5-5', '03', '5678', '9012', 'password123', 1, to_date('20-06-2024', 'dd-mm-yyyy'), to_date('20-06-2026', 'dd-mm-yyyy'), 1);
insert into CUSTOMER (mem_id, lastname, lastkana, firstname, firstkana, birthdate, post, addr1, addr2, addr3, tel1, tel2, tel3, password, id_flag, apply_date, expiry_date, del_flag)
values ('00000027', '田中', 'タナカ', '花子2', 'ハナコ2', to_date('22-10-1996', 'dd-mm-yyyy'), '6789012', '東京都', '渋谷区', '6-6-6', '03', '6789', '0123', 'password123', 0, to_date('20-05-2022', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 0);
insert into CUSTOMER (mem_id, lastname, lastkana, firstname, firstkana, birthdate, post, addr1, addr2, addr3, tel1, tel2, tel3, password, id_flag, apply_date, expiry_date, del_flag)
values ('00000028', '佐藤', 'サトウ', '美咲', 'ミサキ', to_date('20-09-1985', 'dd-mm-yyyy'), '2345678', '神奈川県', '川崎市', '7-7-7', '03', '7890', '1234', 'password123', 0, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('20-05-2026', 'dd-mm-yyyy'), 0);
insert into CUSTOMER (mem_id, lastname, lastkana, firstname, firstkana, birthdate, post, addr1, addr2, addr3, tel1, tel2, tel3, password, id_flag, apply_date, expiry_date, del_flag)
values ('00000029', '高橋', 'タカハシ', '健太', 'ケンタ', to_date('20-09-1986', 'dd-mm-yyyy'), '8901234', '神奈川県', '横浜市', '8-8-8', '03', '8901', '2345', 'password123', 0, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('20-05-2026', 'dd-mm-yyyy'), 0);
insert into CUSTOMER (mem_id, lastname, lastkana, firstname, firstkana, birthdate, post, addr1, addr2, addr3, tel1, tel2, tel3, password, id_flag, apply_date, expiry_date, del_flag)
values ('00000030', '伊藤', 'イトウ', '悠真', 'ユウマ', to_date('20-10-1996', 'dd-mm-yyyy'), '1238901', '埼玉県', '川口市', '9-9-9', '03', '9012', '3456', 'password123', 1, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('20-05-2026', 'dd-mm-yyyy'), 0);
insert into CUSTOMER (mem_id, lastname, lastkana, firstname, firstkana, birthdate, post, addr1, addr2, addr3, tel1, tel2, tel3, password, id_flag, apply_date, expiry_date, del_flag)
values ('00000031', '小林', 'コバヤシ', '桜', 'サクラ', to_date('21-10-1996', 'dd-mm-yyyy'), '5671234', '埼玉県', '埼玉市', '10-10-10', '03', '0123', '4567', 'password123', 0, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('20-05-2026', 'dd-mm-yyyy'), 0);
insert into CUSTOMER (mem_id, lastname, lastkana, firstname, firstkana, birthdate, post, addr1, addr2, addr3, tel1, tel2, tel3, password, id_flag, apply_date, expiry_date, del_flag)
values ('00000032', '渡辺', 'ワタナベ', '莉子', 'リコ', to_date('22-10-1996', 'dd-mm-yyyy'), '9012345', '埼玉県', '埼玉市', '11-11-11', '03', '1234', '5678', 'password123', 0, to_date('20-11-2022', 'dd-mm-yyyy'), to_date('20-11-2024', 'dd-mm-yyyy'), 0);
insert into CUSTOMER (mem_id, lastname, lastkana, firstname, firstkana, birthdate, post, addr1, addr2, addr3, tel1, tel2, tel3, password, id_flag, apply_date, expiry_date, del_flag)
values ('00000033', '三浦', 'ミウラ', '悠斗', 'ユウト', to_date('20-09-1985', 'dd-mm-yyyy'), '2345671', '神奈川県', '川崎市', '12-12-12', '03', '2345', '6789', 'password123', 0, to_date('10-11-2024', 'dd-mm-yyyy'), to_date('10-11-2026', 'dd-mm-yyyy'), 0);
insert into CUSTOMER (mem_id, lastname, lastkana, firstname, firstkana, birthdate, post, addr1, addr2, addr3, tel1, tel2, tel3, password, id_flag, apply_date, expiry_date, del_flag)
values ('00000034', '加藤', 'カトウ', '琴美', 'コトミ', to_date('20-12-1994', 'dd-mm-yyyy'), '3456782', '神奈川県', '横浜市', '13-13-13', '03', '3456', '7890', 'password123', 0, to_date('11-11-2024', 'dd-mm-yyyy'), to_date('11-11-2026', 'dd-mm-yyyy'), 0);
commit;
prompt 13 records loaded
prompt Loading DEPARTMENT...
insert into DEPARTMENT (id, department_name)
values (101, '技术部');
insert into DEPARTMENT (id, department_name)
values (102, '销售部');
insert into DEPARTMENT (id, department_name)
values (103, '售后部');
insert into DEPARTMENT (id, department_name)
values (104, '后勤部');
insert into DEPARTMENT (id, department_name)
values (105, '运营部');
commit;
prompt 5 records loaded
prompt Loading D_ADMIN...
insert into D_ADMIN (a_id, a_username, a_password, a_name, a_phone, a_power, a_describe)
values (1, 'zxk', '202CB962AC59075B964B07152D234B70', '周荀凯', 138138138, '1', '高');
insert into D_ADMIN (a_id, a_username, a_password, a_name, a_phone, a_power, a_describe)
values (2, 'zj', '202CB962AC59075B964B07152D234B70', '张杰', 138138138, '2', '低');
insert into D_ADMIN (a_id, a_username, a_password, a_name, a_phone, a_power, a_describe)
values (3, 'zh', '202CB962AC59075B964B07152D234B70', '张欢', 138138138, '1', '高');
insert into D_ADMIN (a_id, a_username, a_password, a_name, a_phone, a_power, a_describe)
values (4, 'zk', '202CB962AC59075B964B07152D234B70', '赵凯', 138138138, '2', '低');
insert into D_ADMIN (a_id, a_username, a_password, a_name, a_phone, a_power, a_describe)
values (5, 'ywj', '202CB962AC59075B964B07152D234B70', '杨雯雯', 138138138, '1', '高');
insert into D_ADMIN (a_id, a_username, a_password, a_name, a_phone, a_power, a_describe)
values (6, 'wh', '202CB962AC59075B964B07152D234B70', '王皓', 138138138, '1', '高');
insert into D_ADMIN (a_id, a_username, a_password, a_name, a_phone, a_power, a_describe)
values (7, 'zw', '202CB962AC59075B964B07152D234B70', '张伟', 138138138, '2', '低');
insert into D_ADMIN (a_id, a_username, a_password, a_name, a_phone, a_power, a_describe)
values (8, 'zj', '202CB962AC59075B964B07152D234B70', '赵佳', 138138138, '2', '低');
insert into D_ADMIN (a_id, a_username, a_password, a_name, a_phone, a_power, a_describe)
values (9, 'wf', '202CB962AC59075B964B07152D234B70', '王凡', 138138138, '1', '高');
insert into D_ADMIN (a_id, a_username, a_password, a_name, a_phone, a_power, a_describe)
values (10, 'zn', '202CB962AC59075B964B07152D234B70', '张娜', 138138138, '1', '高');
insert into D_ADMIN (a_id, a_username, a_password, a_name, a_phone, a_power, a_describe)
values (11, 'jzh', '202CB962AC59075B964B07152D234B70', '蒋子华', 138138138, '2', '低');
insert into D_ADMIN (a_id, a_username, a_password, a_name, a_phone, a_power, a_describe)
values (12, 'xl', '202CB962AC59075B964B07152D234B70', '薛磊', 138138138, '2', '低');
commit;
prompt 12 records loaded
prompt Loading D_CLASS...
insert into D_CLASS (c_id, c_classid, c_classname, c_counsellor)
values (1, 142, '生物', '徐超');
insert into D_CLASS (c_id, c_classid, c_classname, c_counsellor)
values (2, 151, '应化', '刘晨');
insert into D_CLASS (c_id, c_classid, c_classname, c_counsellor)
values (3, 142, '土木', '孙玲');
insert into D_CLASS (c_id, c_classid, c_classname, c_counsellor)
values (4, 161, '物流', '刘阳');
insert into D_CLASS (c_id, c_classid, c_classname, c_counsellor)
values (5, 153, '数师', '张宇');
insert into D_CLASS (c_id, c_classid, c_classname, c_counsellor)
values (6, 162, '物流', '刘阳');
insert into D_CLASS (c_id, c_classid, c_classname, c_counsellor)
values (7, 171, '自动化', '周涵涵');
insert into D_CLASS (c_id, c_classid, c_classname, c_counsellor)
values (8, 154, '土木', '孙玲');
insert into D_CLASS (c_id, c_classid, c_classname, c_counsellor)
values (9, 151, '纺织', '赵凯');
insert into D_CLASS (c_id, c_classid, c_classname, c_counsellor)
values (10, 153, '金融', '刘培');
insert into D_CLASS (c_id, c_classid, c_classname, c_counsellor)
values (21, 12312, '312', '312');
commit;
prompt 11 records loaded
prompt Loading D_DORMGRADE...
insert into D_DORMGRADE (g_id, d_id, d_dormbuilding, d_grade, create_time, update_time)
values (21, 312, '123', 123, '2024-08-12 11:30:50', null);
insert into D_DORMGRADE (g_id, d_id, d_dormbuilding, d_grade, create_time, update_time)
values (1, 123, '24号楼', 6, '2019-04-25 10:51:17', '2024-08-12 11:36:03');
insert into D_DORMGRADE (g_id, d_id, d_dormbuilding, d_grade, create_time, update_time)
values (2, 302, '24号楼', 7, '2019-05-01 16:36:47', '2019-05-01 16:36:55');
insert into D_DORMGRADE (g_id, d_id, d_dormbuilding, d_grade, create_time, update_time)
values (3, 322, '24号楼', 8, '2019-05-04 16:37:42', '2019-05-04 16:37:47');
insert into D_DORMGRADE (g_id, d_id, d_dormbuilding, d_grade, create_time, update_time)
values (4, 602, '23号楼', 7, '2019-05-08 16:38:25', '2019-05-08 16:38:30');
insert into D_DORMGRADE (g_id, d_id, d_dormbuilding, d_grade, create_time, update_time)
values (5, 112, '22号楼', 7, '2019-05-12 16:38:53', '2019-05-12 16:39:00');
insert into D_DORMGRADE (g_id, d_id, d_dormbuilding, d_grade, create_time, update_time)
values (6, 222, '27号楼', 9, '2019-05-09 16:39:37', '2019-05-09 16:39:41');
insert into D_DORMGRADE (g_id, d_id, d_dormbuilding, d_grade, create_time, update_time)
values (7, 213, '27号楼', 8, '2019-05-10 16:40:02', '2019-05-10 16:40:08');
commit;
prompt 8 records loaded
prompt Loading D_DORMITORYINFO...
insert into D_DORMITORYINFO (d_id, s_dormitoryid, d_dormbuilding, d_bedtotal, d_bed, a_name)
values (1, 310, '24号楼', '4', '3', '周荀凯');
insert into D_DORMITORYINFO (d_id, s_dormitoryid, d_dormbuilding, d_bedtotal, d_bed, a_name)
values (2, 322, '24号楼', '4', '4', '周荀凯');
insert into D_DORMITORYINFO (d_id, s_dormitoryid, d_dormbuilding, d_bedtotal, d_bed, a_name)
values (3, 601, '23号楼', '6', '6', '张杰');
insert into D_DORMITORYINFO (d_id, s_dormitoryid, d_dormbuilding, d_bedtotal, d_bed, a_name)
values (4, 602, '23号楼', '6', '5', '张杰');
insert into D_DORMITORYINFO (d_id, s_dormitoryid, d_dormbuilding, d_bedtotal, d_bed, a_name)
values (5, 111, '22号楼', '4', '4', '杨雯雯');
insert into D_DORMITORYINFO (d_id, s_dormitoryid, d_dormbuilding, d_bedtotal, d_bed, a_name)
values (6, 112, '22号楼', '4', '3', '杨雯雯');
insert into D_DORMITORYINFO (d_id, s_dormitoryid, d_dormbuilding, d_bedtotal, d_bed, a_name)
values (7, 222, '27号楼', '6', '6', '张伟');
insert into D_DORMITORYINFO (d_id, s_dormitoryid, d_dormbuilding, d_bedtotal, d_bed, a_name)
values (8, 213, '27号楼', '4', '4', '张伟');
insert into D_DORMITORYINFO (d_id, s_dormitoryid, d_dormbuilding, d_bedtotal, d_bed, a_name)
values (9, 312, '26号楼', '6', '6', '薛磊');
insert into D_DORMITORYINFO (d_id, s_dormitoryid, d_dormbuilding, d_bedtotal, d_bed, a_name)
values (10, 313, '22号楼', '4', '4', '张磊');
insert into D_DORMITORYINFO (d_id, s_dormitoryid, d_dormbuilding, d_bedtotal, d_bed, a_name)
values (11, 323, '22号楼', '6', '5', '张磊');
insert into D_DORMITORYINFO (d_id, s_dormitoryid, d_dormbuilding, d_bedtotal, d_bed, a_name)
values (12, 301, '24号楼', '6', '6', '周荀凯');
insert into D_DORMITORYINFO (d_id, s_dormitoryid, d_dormbuilding, d_bedtotal, d_bed, a_name)
values (13, 302, '24号楼', '6', '6', '周荀凯');
insert into D_DORMITORYINFO (d_id, s_dormitoryid, d_dormbuilding, d_bedtotal, d_bed, a_name)
values (14, 423, '29号楼', '4', '3', '郭浩然');
insert into D_DORMITORYINFO (d_id, s_dormitoryid, d_dormbuilding, d_bedtotal, d_bed, a_name)
values (15, 311, '24号楼', '4', '3', '周荀凯');
insert into D_DORMITORYINFO (d_id, s_dormitoryid, d_dormbuilding, d_bedtotal, d_bed, a_name)
values (16, 322, '24号楼', '4', '4', '周荀凯');
insert into D_DORMITORYINFO (d_id, s_dormitoryid, d_dormbuilding, d_bedtotal, d_bed, a_name)
values (17, 601, '23号楼', '6', '6', '张杰');
insert into D_DORMITORYINFO (d_id, s_dormitoryid, d_dormbuilding, d_bedtotal, d_bed, a_name)
values (18, 602, '23号楼', '6', '5', '张杰');
insert into D_DORMITORYINFO (d_id, s_dormitoryid, d_dormbuilding, d_bedtotal, d_bed, a_name)
values (19, 111, '22号楼', '4', '4', '杨雯雯');
insert into D_DORMITORYINFO (d_id, s_dormitoryid, d_dormbuilding, d_bedtotal, d_bed, a_name)
values (20, 112, '22号楼', '4', '3', '杨雯雯');
insert into D_DORMITORYINFO (d_id, s_dormitoryid, d_dormbuilding, d_bedtotal, d_bed, a_name)
values (21, 222, '27号楼', '6', '6', '张伟');
insert into D_DORMITORYINFO (d_id, s_dormitoryid, d_dormbuilding, d_bedtotal, d_bed, a_name)
values (22, 213, '27号楼', '4', '4', '张伟');
insert into D_DORMITORYINFO (d_id, s_dormitoryid, d_dormbuilding, d_bedtotal, d_bed, a_name)
values (23, 312, '26号楼', '6', '6', '薛磊');
insert into D_DORMITORYINFO (d_id, s_dormitoryid, d_dormbuilding, d_bedtotal, d_bed, a_name)
values (24, 313, '22号楼', '4', '4', '张磊');
insert into D_DORMITORYINFO (d_id, s_dormitoryid, d_dormbuilding, d_bedtotal, d_bed, a_name)
values (25, 323, '22号楼', '6', '5', '张磊');
insert into D_DORMITORYINFO (d_id, s_dormitoryid, d_dormbuilding, d_bedtotal, d_bed, a_name)
values (26, 301, '24号楼', '6', '6', '周荀凯');
insert into D_DORMITORYINFO (d_id, s_dormitoryid, d_dormbuilding, d_bedtotal, d_bed, a_name)
values (27, 302, '24号楼', '6', '6', '周荀凯');
insert into D_DORMITORYINFO (d_id, s_dormitoryid, d_dormbuilding, d_bedtotal, d_bed, a_name)
values (28, 423, '29号楼', '4', '3', '郭浩然');
insert into D_DORMITORYINFO (d_id, s_dormitoryid, d_dormbuilding, d_bedtotal, d_bed, a_name)
values (41, 123, '123', '312', '123', '123');
commit;
prompt 29 records loaded
prompt Loading D_DORMREPAIR...
insert into D_DORMREPAIR (r_id, d_id, d_dormbuilding, r_name, reason, create_time, update_time)
values (1, 311, '24号楼', '王涛', '水池', '2019-05-13 22:39:58', '2019-05-13 22:39:58');
insert into D_DORMREPAIR (r_id, d_id, d_dormbuilding, r_name, reason, create_time, update_time)
values (2, 322, '24号楼', '王涛', '灯管', '2019-05-11 16:29:20', '2019-05-14 16:29:35');
insert into D_DORMREPAIR (r_id, d_id, d_dormbuilding, r_name, reason, create_time, update_time)
values (3, 601, '23号楼', '冯军', '水龙头', '2019-05-15 16:31:14', '2019-05-14 16:31:20');
insert into D_DORMREPAIR (r_id, d_id, d_dormbuilding, r_name, reason, create_time, update_time)
values (4, 601, '23号楼', '冯军', '插孔', '2019-05-15 16:31:56', '2019-05-15 16:32:04');
insert into D_DORMREPAIR (r_id, d_id, d_dormbuilding, r_name, reason, create_time, update_time)
values (5, 213, '27号楼', '冯军', '排风扇', '2019-05-18 16:32:54', '2019-05-14 16:33:00');
insert into D_DORMREPAIR (r_id, d_id, d_dormbuilding, r_name, reason, create_time, update_time)
values (6, 312, '26号楼', '彭建国', '空调', '2019-05-20 16:33:56', '2019-05-20 16:34:01');
insert into D_DORMREPAIR (r_id, d_id, d_dormbuilding, r_name, reason, create_time, update_time)
values (7, 301, '24号楼', '王涛', '水池', '2019-05-13 22:39:58', '2019-05-13 22:39:58');
insert into D_DORMREPAIR (r_id, d_id, d_dormbuilding, r_name, reason, create_time, update_time)
values (8, 322, '24号楼', '王涛', '灯管', '2019-05-11 16:29:20', '2019-05-14 16:29:35');
insert into D_DORMREPAIR (r_id, d_id, d_dormbuilding, r_name, reason, create_time, update_time)
values (9, 601, '23号楼', '冯军', '水龙头', '2019-05-15 16:31:14', '2019-05-14 16:31:20');
insert into D_DORMREPAIR (r_id, d_id, d_dormbuilding, r_name, reason, create_time, update_time)
values (10, 601, '23号楼', '冯军', '插孔', '2019-05-15 16:31:56', '2019-05-15 16:32:04');
insert into D_DORMREPAIR (r_id, d_id, d_dormbuilding, r_name, reason, create_time, update_time)
values (11, 213, '27号楼', '冯军', '排风扇', '2019-05-18 16:32:54', '2019-05-14 16:33:00');
insert into D_DORMREPAIR (r_id, d_id, d_dormbuilding, r_name, reason, create_time, update_time)
values (12, 312, '26号楼', '彭建国', '空调', '2019-05-20 16:33:56', '2019-05-20 16:34:01');
insert into D_DORMREPAIR (r_id, d_id, d_dormbuilding, r_name, reason, create_time, update_time)
values (21, 123, '123', '123', '123', null, null);
commit;
prompt 13 records loaded
prompt Loading D_STGRADE...
insert into D_STGRADE (g_id, s_studentid, s_name, s_grade, s_classid, s_dormitoryid, create_time, update_time)
values (21, 123312, '123', 123, null, 123, '2024-08-11 23:24:31', null);
insert into D_STGRADE (g_id, s_studentid, s_name, s_grade, s_classid, s_dormitoryid, create_time, update_time)
values (1, 1413032001, '张', 6, 141, 301, '2019-04-26 09:56:51', '2024-08-12 11:36:30');
insert into D_STGRADE (g_id, s_studentid, s_name, s_grade, s_classid, s_dormitoryid, create_time, update_time)
values (2, 1413032002, '赵凯', 7, 141, 301, '2019-05-01 17:00:05', '2019-05-01 17:00:13');
insert into D_STGRADE (g_id, s_studentid, s_name, s_grade, s_classid, s_dormitoryid, create_time, update_time)
values (3, 1413032003, '许文文', 6, 141, 301, '2019-05-06 17:00:54', '2019-05-06 17:01:01');
insert into D_STGRADE (g_id, s_studentid, s_name, s_grade, s_classid, s_dormitoryid, create_time, update_time)
values (4, 1413032003, '许文文', 7, 141, 301, '2019-05-16 17:01:33', '2019-05-16 17:02:15');
insert into D_STGRADE (g_id, s_studentid, s_name, s_grade, s_classid, s_dormitoryid, create_time, update_time)
values (5, 1413032004, '王浩', 7, 141, 301, '2019-05-10 17:03:03', '2019-05-10 17:03:09');
insert into D_STGRADE (g_id, s_studentid, s_name, s_grade, s_classid, s_dormitoryid, create_time, update_time)
values (6, 1413032005, '张伟', 8, 141, 301, '2019-05-14 17:03:53', '2019-05-14 17:03:56');
insert into D_STGRADE (g_id, s_studentid, s_name, s_grade, s_classid, s_dormitoryid, create_time, update_time)
values (7, 1513112412, '赵跃', 9, 151, 112, '2019-05-08 17:05:04', '2019-05-08 17:05:07');
insert into D_STGRADE (g_id, s_studentid, s_name, s_grade, s_classid, s_dormitoryid, create_time, update_time)
values (8, 1513112412, '赵跃', 9, 151, 112, '2019-05-17 17:05:34', '2019-05-17 17:05:39');
insert into D_STGRADE (g_id, s_studentid, s_name, s_grade, s_classid, s_dormitoryid, create_time, update_time)
values (9, 1513122418, '田野', 8, 151, 213, '2019-05-15 17:06:28', '2019-05-15 17:06:35');
insert into D_STGRADE (g_id, s_studentid, s_name, s_grade, s_classid, s_dormitoryid, create_time, update_time)
values (10, 1513122419, '张嘉佳', 8, 151, 213, '2019-05-15 17:07:09', '2019-05-15 17:07:13');
insert into D_STGRADE (g_id, s_studentid, s_name, s_grade, s_classid, s_dormitoryid, create_time, update_time)
values (11, 1413032001, '张杰', 6, 141, 301, '2019-04-26 09:56:51', '2019-04-26 11:02:13');
insert into D_STGRADE (g_id, s_studentid, s_name, s_grade, s_classid, s_dormitoryid, create_time, update_time)
values (12, 1413032002, '赵凯', 7, 141, 301, '2019-05-01 17:00:05', '2019-05-01 17:00:13');
insert into D_STGRADE (g_id, s_studentid, s_name, s_grade, s_classid, s_dormitoryid, create_time, update_time)
values (13, 1413032003, '许文文', 6, 141, 301, '2019-05-06 17:00:54', '2019-05-06 17:01:01');
insert into D_STGRADE (g_id, s_studentid, s_name, s_grade, s_classid, s_dormitoryid, create_time, update_time)
values (14, 1413032003, '许文文', 7, 141, 301, '2019-05-16 17:01:33', '2019-05-16 17:02:15');
insert into D_STGRADE (g_id, s_studentid, s_name, s_grade, s_classid, s_dormitoryid, create_time, update_time)
values (15, 1413032004, '王浩', 7, 141, 301, '2019-05-10 17:03:03', '2019-05-10 17:03:09');
insert into D_STGRADE (g_id, s_studentid, s_name, s_grade, s_classid, s_dormitoryid, create_time, update_time)
values (16, 1413032005, '张伟', 8, 141, 301, '2019-05-14 17:03:53', '2019-05-14 17:03:56');
insert into D_STGRADE (g_id, s_studentid, s_name, s_grade, s_classid, s_dormitoryid, create_time, update_time)
values (17, 1513112412, '赵跃', 9, 151, 112, '2019-05-08 17:05:04', '2019-05-08 17:05:07');
insert into D_STGRADE (g_id, s_studentid, s_name, s_grade, s_classid, s_dormitoryid, create_time, update_time)
values (18, 1513112412, '赵跃', 9, 151, 112, '2019-05-17 17:05:34', '2019-05-17 17:05:39');
insert into D_STGRADE (g_id, s_studentid, s_name, s_grade, s_classid, s_dormitoryid, create_time, update_time)
values (19, 1513122418, '田野', 8, 151, 213, '2019-05-15 17:06:28', '2019-05-15 17:06:35');
insert into D_STGRADE (g_id, s_studentid, s_name, s_grade, s_classid, s_dormitoryid, create_time, update_time)
values (20, 1513122419, '张嘉佳', 8, 151, 213, '2019-05-15 17:07:09', '2019-05-15 17:07:13');
commit;
prompt 21 records loaded
prompt Loading D_STUDENT...
insert into D_STUDENT (s_id, s_studentid, s_name, s_sex, s_age, s_phone, s_classid, s_classname, s_dormitoryid)
values (1, 1413032001, '张杰', '男', 21, 138138138, 141, '生物', 301);
insert into D_STUDENT (s_id, s_studentid, s_name, s_sex, s_age, s_phone, s_classid, s_classname, s_dormitoryid)
values (2, 1413032002, '赵凯', '男', 22, 138138138, 141, '生物', 301);
insert into D_STUDENT (s_id, s_studentid, s_name, s_sex, s_age, s_phone, s_classid, s_classname, s_dormitoryid)
values (3, 1413032003, '许文文', '男', 21, 138138138, 141, '生物', 301);
insert into D_STUDENT (s_id, s_studentid, s_name, s_sex, s_age, s_phone, s_classid, s_classname, s_dormitoryid)
values (4, 1413032004, '王浩', '男', 22, 138138138, 141, '生物', 301);
insert into D_STUDENT (s_id, s_studentid, s_name, s_sex, s_age, s_phone, s_classid, s_classname, s_dormitoryid)
values (5, 1413032005, '张伟', '男', 22, 138138138, 141, '土木', 301);
insert into D_STUDENT (s_id, s_studentid, s_name, s_sex, s_age, s_phone, s_classid, s_classname, s_dormitoryid)
values (6, 1413032006, '郭顶', '男', 21, 138138138, 141, '土木', 301);
insert into D_STUDENT (s_id, s_studentid, s_name, s_sex, s_age, s_phone, s_classid, s_classname, s_dormitoryid)
values (7, 1513112411, '曹原', '男', 20, 138138138, 151, '应化', 112);
insert into D_STUDENT (s_id, s_studentid, s_name, s_sex, s_age, s_phone, s_classid, s_classname, s_dormitoryid)
values (8, 1513112412, '赵跃', '男', 21, 138138138, 151, '纺织', 112);
insert into D_STUDENT (s_id, s_studentid, s_name, s_sex, s_age, s_phone, s_classid, s_classname, s_dormitoryid)
values (9, 1513112413, '孙畅', '男', 21, 138138138, 151, '纺织', 112);
insert into D_STUDENT (s_id, s_studentid, s_name, s_sex, s_age, s_phone, s_classid, s_classname, s_dormitoryid)
values (10, 1513122417, '周帆', '男', 21, 138138138, 161, '物流', 213);
insert into D_STUDENT (s_id, s_studentid, s_name, s_sex, s_age, s_phone, s_classid, s_classname, s_dormitoryid)
values (11, 1513122418, '田野', '男', 21, 138138138, 153, '数师', 213);
insert into D_STUDENT (s_id, s_studentid, s_name, s_sex, s_age, s_phone, s_classid, s_classname, s_dormitoryid)
values (12, 1513122419, '张嘉佳', '男', 20, 138138138, 153, '金融', 213);
insert into D_STUDENT (s_id, s_studentid, s_name, s_sex, s_age, s_phone, s_classid, s_classname, s_dormitoryid)
values (13, 1513122420, '陈昊', '男', 21, 138138138, 153, '金融', 213);
insert into D_STUDENT (s_id, s_studentid, s_name, s_sex, s_age, s_phone, s_classid, s_classname, s_dormitoryid)
values (44, 123, '123', '女', 123, 123, 123, '231', 123);
commit;
prompt 14 records loaded
prompt Loading D_VISITOR...
insert into D_VISITOR (v_id, v_name, v_phone, v_dormitoryid, v_dormbuilding, create_time)
values (21, '123', 312, 123, '123', null);
insert into D_VISITOR (v_id, v_name, v_phone, v_dormitoryid, v_dormbuilding, create_time)
values (1, '郑杰', 138138138, 301, '24号楼', '2019-05-14 13:26:13');
insert into D_VISITOR (v_id, v_name, v_phone, v_dormitoryid, v_dormbuilding, create_time)
values (2, '李博', 138138138, 322, '24号楼', '2019-05-12 19:36:23');
insert into D_VISITOR (v_id, v_name, v_phone, v_dormitoryid, v_dormbuilding, create_time)
values (3, '张盈盈', 138138138, 601, '23号楼', '2019-05-13 19:37:11');
insert into D_VISITOR (v_id, v_name, v_phone, v_dormitoryid, v_dormbuilding, create_time)
values (4, '王涛', 138138138, 111, '22号楼', '2019-05-15 19:37:46');
insert into D_VISITOR (v_id, v_name, v_phone, v_dormitoryid, v_dormbuilding, create_time)
values (5, '胡浩', 138138138, 222, '27号楼', '2019-05-16 19:38:27');
insert into D_VISITOR (v_id, v_name, v_phone, v_dormitoryid, v_dormbuilding, create_time)
values (6, '陈昊', 138138138, 213, '27号楼', '2019-05-18 19:39:03');
insert into D_VISITOR (v_id, v_name, v_phone, v_dormitoryid, v_dormbuilding, create_time)
values (7, '刘军', 138138138, 213, '27号楼', '2019-05-20 19:39:42');
insert into D_VISITOR (v_id, v_name, v_phone, v_dormitoryid, v_dormbuilding, create_time)
values (8, '黄智', 138138138, 312, '26号楼', '2019-05-22 19:46:38');
insert into D_VISITOR (v_id, v_name, v_phone, v_dormitoryid, v_dormbuilding, create_time)
values (9, '郑杰', 123123123, 311, '24号楼', '2019-05-16 16:59:06');
commit;
prompt 10 records loaded
prompt Loading EMPLOYEE...
insert into EMPLOYEE (id, last_name, email, gender, department, birth)
values (1001, '张三', '24736743@qq.com', 1, 103, '06-3月 -20');
insert into EMPLOYEE (id, last_name, email, gender, department, birth)
values (1002, '李四', '24736743@qq.com', 1, 102, '06-3月 -20');
insert into EMPLOYEE (id, last_name, email, gender, department, birth)
values (1003, '王五', '24736743@qq.com', 0, 103, '06-3月 -20');
insert into EMPLOYEE (id, last_name, email, gender, department, birth)
values (1004, '赵六', '24736743@qq.com', 1, 104, '06-3月 -20');
insert into EMPLOYEE (id, last_name, email, gender, department, birth)
values (1005, '孙七', '24736743@qq.com', 0, 105, '06-3月 -20');
commit;
prompt 5 records loaded
prompt Loading STATISTICAL_LOG...
insert into STATISTICAL_LOG (statistical_id, statistical_name, statistical_url, statistical_number, statistical_date)
values (21, '2024-12-19.xlsx', 'D:/tempData/', 0, to_date('19-12-2024', 'dd-mm-yyyy'));
insert into STATISTICAL_LOG (statistical_id, statistical_name, statistical_url, statistical_number, statistical_date)
values (12, '2024-12-17.xlsx', 'D:/tempData/', 5, to_date('17-12-2024', 'dd-mm-yyyy'));
insert into STATISTICAL_LOG (statistical_id, statistical_name, statistical_url, statistical_number, statistical_date)
values (13, '2024-12-18.xlsx', 'D:/tempData/', 1, to_date('18-12-2024', 'dd-mm-yyyy'));
commit;
prompt 3 records loaded
prompt Loading TITLE...
insert into TITLE (title_id, title, tem_cd, ctg_cd, actor)
values ('00000031', '1', '1111111111111', '001', '1');
insert into TITLE (title_id, title, tem_cd, ctg_cd, actor)
values ('00000041', 'aaaaaaaaaaa', '2133211111111', '028', 'qa');
insert into TITLE (title_id, title, tem_cd, ctg_cd, actor)
values ('00000001', 'NARUTO-ナルト-', '1234567890001', '001', 'ナルト');
insert into TITLE (title_id, title, tem_cd, ctg_cd, actor)
values ('00000002', 'ONE PIECE-ワンピース-', '1234567890002', '001', 'ルフィ');
insert into TITLE (title_id, title, tem_cd, ctg_cd, actor)
values ('00000003', '乙女ゲームの破滅フラグしかない悪役令嬢に転生してしまった…', '1234567890003', '002', 'カタリナ');
insert into TITLE (title_id, title, tem_cd, ctg_cd, actor)
values ('00000004', '神様はじめました', '1234567890004', '002', '桃園奈々生');
insert into TITLE (title_id, title, tem_cd, ctg_cd, actor)
values ('00000005', '月刊少女野崎くん', '1234567890005', '003', '野崎梅太郎');
insert into TITLE (title_id, title, tem_cd, ctg_cd, actor)
values ('00000006', '斉木楠雄の災難', '1234567890006', '003', '斉木楠雄');
insert into TITLE (title_id, title, tem_cd, ctg_cd, actor)
values ('00000007', 'NANA―ナナ―。', '1234567890007', '004', 'なな');
insert into TITLE (title_id, title, tem_cd, ctg_cd, actor)
values ('00000008', 'かぐや様は告らせたい～天才たちの恋愛頭脳戦～', '1234567890008', '004', '四宮かぐや');
insert into TITLE (title_id, title, tem_cd, ctg_cd, actor)
values ('00000009', 'ハイキュー!!', '1234567890009', '005', '日向翔陽');
insert into TITLE (title_id, title, tem_cd, ctg_cd, actor)
values ('00000010', 'ダイヤのA', '1234567890010', '005', '沢村栄純');
insert into TITLE (title_id, title, tem_cd, ctg_cd, actor)
values ('00000011', '進撃の巨人', '1234567890011', '006', 'エレン');
insert into TITLE (title_id, title, tem_cd, ctg_cd, actor)
values ('00000012', '冒険者たち', '1234567890012', '006', 'アーリア');
insert into TITLE (title_id, title, tem_cd, ctg_cd, actor)
values ('00000013', '名探偵コナン', '1234567890013', '007', '工藤新一');
insert into TITLE (title_id, title, tem_cd, ctg_cd, actor)
values ('00000014', 'DEATH NOTE-デスノート-', '1234567890014', '007', '夜神月');
insert into TITLE (title_id, title, tem_cd, ctg_cd, actor)
values ('00000015', '三国志', '1234567890015', '008', '劉備');
insert into TITLE (title_id, title, tem_cd, ctg_cd, actor)
values ('00000016', 'るろうに剣心', '1234567890016', '008', '緋村剣心');
insert into TITLE (title_id, title, tem_cd, ctg_cd, actor)
values ('00000017', 'マッシュル-MASHLE-', '1234567890017', '009', 'マッシュ');
insert into TITLE (title_id, title, tem_cd, ctg_cd, actor)
values ('00000018', '葬送のフリーレン', '1234567890018', '009', 'フリーレン');
insert into TITLE (title_id, title, tem_cd, ctg_cd, actor)
values ('00000019', '銀魂', '1234567890019', '010', '坂田銀時');
insert into TITLE (title_id, title, tem_cd, ctg_cd, actor)
values ('00000020', 'SPY×FAMILY', '1234567890020', '010', 'ロイド');
insert into TITLE (title_id, title, tem_cd, ctg_cd, actor)
values ('00000021', '推しの子', '1234567890021', '011', '星野アイ');
insert into TITLE (title_id, title, tem_cd, ctg_cd, actor)
values ('00000022', '金田一少年の事件簿', '1234567890022', '011', '金田一一');
insert into TITLE (title_id, title, tem_cd, ctg_cd, actor)
values ('00000023', '光が死んだ夏', '1234567890023', '012', '光');
insert into TITLE (title_id, title, tem_cd, ctg_cd, actor)
values ('00000024', 'さんかく窓の外側は夜', '1234567890024', '012', '冷川理人');
insert into TITLE (title_id, title, tem_cd, ctg_cd, actor)
values ('00000025', '週刊少年ジャンプ', '1234567890025', '013', '集英社');
insert into TITLE (title_id, title, tem_cd, ctg_cd, actor)
values ('00000026', 'なかよし', '1234567890026', '013', '講談社');
commit;
prompt 28 records loaded
prompt Loading STOCK...
insert into STOCK (title_id, stock_no, stock_state)
values ('00000002', '002', 1);
insert into STOCK (title_id, stock_no, stock_state)
values ('00000005', '001', 0);
insert into STOCK (title_id, stock_no, stock_state)
values ('00000006', '001', 0);
insert into STOCK (title_id, stock_no, stock_state)
values ('00000007', '001', 0);
insert into STOCK (title_id, stock_no, stock_state)
values ('00000008', '001', 0);
insert into STOCK (title_id, stock_no, stock_state)
values ('00000009', '001', 0);
insert into STOCK (title_id, stock_no, stock_state)
values ('00000010', '001', 0);
insert into STOCK (title_id, stock_no, stock_state)
values ('00000011', '001', 0);
insert into STOCK (title_id, stock_no, stock_state)
values ('00000012', '001', 0);
insert into STOCK (title_id, stock_no, stock_state)
values ('00000013', '001', 0);
insert into STOCK (title_id, stock_no, stock_state)
values ('00000014', '001', 0);
insert into STOCK (title_id, stock_no, stock_state)
values ('00000015', '001', 0);
insert into STOCK (title_id, stock_no, stock_state)
values ('00000016', '001', 0);
insert into STOCK (title_id, stock_no, stock_state)
values ('00000017', '001', 0);
insert into STOCK (title_id, stock_no, stock_state)
values ('00000018', '001', 0);
insert into STOCK (title_id, stock_no, stock_state)
values ('00000019', '001', 0);
insert into STOCK (title_id, stock_no, stock_state)
values ('00000020', '001', 0);
insert into STOCK (title_id, stock_no, stock_state)
values ('00000021', '001', 0);
insert into STOCK (title_id, stock_no, stock_state)
values ('00000022', '001', 0);
insert into STOCK (title_id, stock_no, stock_state)
values ('00000023', '001', 0);
insert into STOCK (title_id, stock_no, stock_state)
values ('00000024', '001', 0);
insert into STOCK (title_id, stock_no, stock_state)
values ('00000025', '001', 1);
insert into STOCK (title_id, stock_no, stock_state)
values ('00000026', '001', 0);
commit;
prompt 23 records loaded
prompt Loading T_USER...
insert into T_USER (t_id, t_name, t_password)
values (11111, 'Itsuki', '2134214');
insert into T_USER (t_id, t_name, t_password)
values (2, '321', '213213');
insert into T_USER (t_id, t_name, t_password)
values (3, '321', 'gfdfghbdgh');
commit;
prompt 3 records loaded
prompt Enabling foreign key constraints for CITY...
alter table CITY enable constraint FK_CITY_RRECD_CD;
prompt Enabling foreign key constraints for TITLE...
alter table TITLE enable constraint FK_CTG_CD;
prompt Enabling foreign key constraints for STOCK...
alter table STOCK enable constraint FK_TITLE_ID;
prompt Enabling triggers for CATEGORY...
alter table CATEGORY enable all triggers;
prompt Enabling triggers for PREFECTURE...
alter table PREFECTURE enable all triggers;
prompt Enabling triggers for CITY...
alter table CITY enable all triggers;
prompt Enabling triggers for CLERK...
alter table CLERK enable all triggers;
prompt Enabling triggers for CUSTOMER...
alter table CUSTOMER enable all triggers;
prompt Enabling triggers for DEPARTMENT...
alter table DEPARTMENT enable all triggers;
prompt Enabling triggers for D_ADMIN...
alter table D_ADMIN enable all triggers;
prompt Enabling triggers for D_CLASS...
alter table D_CLASS enable all triggers;
prompt Enabling triggers for D_DORMGRADE...
alter table D_DORMGRADE enable all triggers;
prompt Enabling triggers for D_DORMITORYINFO...
alter table D_DORMITORYINFO enable all triggers;
prompt Enabling triggers for D_DORMREPAIR...
alter table D_DORMREPAIR enable all triggers;
prompt Enabling triggers for D_STGRADE...
alter table D_STGRADE enable all triggers;
prompt Enabling triggers for D_STUDENT...
alter table D_STUDENT enable all triggers;
prompt Enabling triggers for D_VISITOR...
alter table D_VISITOR enable all triggers;
prompt Enabling triggers for EMPLOYEE...
alter table EMPLOYEE enable all triggers;
prompt Enabling triggers for STATISTICAL_LOG...
alter table STATISTICAL_LOG enable all triggers;
prompt Enabling triggers for TITLE...
alter table TITLE enable all triggers;
prompt Enabling triggers for STOCK...
alter table STOCK enable all triggers;
prompt Enabling triggers for T_USER...
alter table T_USER enable all triggers;

set feedback on
set define on
prompt Done
