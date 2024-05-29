prompt PL/SQL Developer import file
prompt Created on יום רביעי 29 מאי 2024 by DELL
set feedback off
set define off
prompt Creating PARTICIPANTS...
create table PARTICIPANTS
(
  p_name VARCHAR2(30) not null,
  p_date DATE not null,
  p_id   NUMBER(10) not null,
  p_role VARCHAR2(30) not null,
  gender VARCHAR2(30) not null
)
;
alter table PARTICIPANTS
  add primary key (P_ID)
  ;

prompt Creating COURSES...
create table COURSES
(
  c_name     VARCHAR2(30) not null,
  c_id       NUMBER(10) not null,
  categories VARCHAR2(30) not null,
  presence   VARCHAR2(30) not null,
  pre_course VARCHAR2(30) not null
)
;
alter table COURSES
  add primary key (C_ID)
  ;

prompt Creating LECTURERS...
create table LECTURERS
(
  l_id      NUMBER(10) not null,
  l_name    VARCHAR2(30) not null,
  l_date    DATE not null,
  seniority VARCHAR2(30) not null,
  training  VARCHAR2(30) not null
)
;
alter table LECTURERS
  add primary key (L_ID)
  ;

prompt Creating ROOM...
create table ROOM
(
  r_id       NUMBER(10) not null,
  r_location VARCHAR2(30) not null,
  numplace   NUMBER(5) not null,
  r_type     VARCHAR2(30) not null
)
;
alter table ROOM
  add primary key (R_ID)
  ;

prompt Creating STUDENTSGROUP...
create table STUDENTSGROUP
(
  g_id   NUMBER(10) not null,
  max_p  NUMBER(15) not null,
  g_hour NUMBER(5) not null,
  g_day  NUMBER(5) not null,
  r_id   NUMBER(10) not null,
  c_id   NUMBER(10) not null,
  l_id   NUMBER(10) not null
)
;
alter table STUDENTSGROUP
  add primary key (G_ID)
  ;
alter table STUDENTSGROUP
  add foreign key (R_ID)
  references ROOM (R_ID);
alter table STUDENTSGROUP
  add foreign key (C_ID)
  references COURSES (C_ID);
alter table STUDENTSGROUP
  add foreign key (L_ID)
  references LECTURERS (L_ID);

prompt Creating BELONGS...
create table BELONGS
(
  g_id NUMBER(10) not null,
  p_id NUMBER(10) not null
)
;
alter table BELONGS
  add primary key (G_ID, P_ID)
  ;
alter table BELONGS
  add foreign key (G_ID)
  references STUDENTSGROUP (G_ID);
alter table BELONGS
  add foreign key (P_ID)
  references PARTICIPANTS (P_ID);

prompt Creating EQUIPMENT...
create table EQUIPMENT
(
  e_date DATE not null,
  e_id   NUMBER(10) not null,
  e_name VARCHAR2(30) not null,
  amount NUMBER(5) not null
)
;
alter table EQUIPMENT
  add primary key (E_ID)
  ;

prompt Creating TEACHES_THE...
create table TEACHES_THE
(
  l_id NUMBER(10) not null,
  c_id NUMBER(10) not null
)
;
alter table TEACHES_THE
  add primary key (L_ID, C_ID)
  ;
alter table TEACHES_THE
  add foreign key (L_ID)
  references LECTURERS (L_ID);
alter table TEACHES_THE
  add foreign key (C_ID)
  references COURSES (C_ID);

prompt Creating USES...
create table USES
(
  c_id NUMBER(10) not null,
  e_id NUMBER(10) not null
)
;
alter table USES
  add primary key (C_ID, E_ID)
  ;
alter table USES
  add foreign key (C_ID)
  references COURSES (C_ID);
alter table USES
  add foreign key (E_ID)
  references EQUIPMENT (E_ID);

prompt Disabling triggers for PARTICIPANTS...
alter table PARTICIPANTS disable all triggers;
prompt Disabling triggers for COURSES...
alter table COURSES disable all triggers;
prompt Disabling triggers for LECTURERS...
alter table LECTURERS disable all triggers;
prompt Disabling triggers for ROOM...
alter table ROOM disable all triggers;
prompt Disabling triggers for STUDENTSGROUP...
alter table STUDENTSGROUP disable all triggers;
prompt Disabling triggers for BELONGS...
alter table BELONGS disable all triggers;
prompt Disabling triggers for EQUIPMENT...
alter table EQUIPMENT disable all triggers;
prompt Disabling triggers for TEACHES_THE...
alter table TEACHES_THE disable all triggers;
prompt Disabling triggers for USES...
alter table USES disable all triggers;
prompt Disabling foreign key constraints for STUDENTSGROUP...
alter table STUDENTSGROUP disable constraint SYS_C008426;
alter table STUDENTSGROUP disable constraint SYS_C008427;
alter table STUDENTSGROUP disable constraint SYS_C008428;
prompt Disabling foreign key constraints for BELONGS...
alter table BELONGS disable constraint SYS_C008437;
alter table BELONGS disable constraint SYS_C008438;
prompt Disabling foreign key constraints for TEACHES_THE...
alter table TEACHES_THE disable constraint SYS_C008442;
alter table TEACHES_THE disable constraint SYS_C008443;
prompt Disabling foreign key constraints for USES...
alter table USES disable constraint SYS_C008432;
alter table USES disable constraint SYS_C008433;
prompt Deleting USES...
delete from USES;
commit;
prompt Deleting TEACHES_THE...
delete from TEACHES_THE;
commit;
prompt Deleting EQUIPMENT...
delete from EQUIPMENT;
commit;
prompt Deleting BELONGS...
delete from BELONGS;
commit;
prompt Deleting STUDENTSGROUP...
delete from STUDENTSGROUP;
commit;
prompt Deleting ROOM...
delete from ROOM;
commit;
prompt Deleting LECTURERS...
delete from LECTURERS;
commit;
prompt Deleting COURSES...
delete from COURSES;
commit;
prompt Deleting PARTICIPANTS...
delete from PARTICIPANTS;
commit;
prompt Loading PARTICIPANTS...
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('FrancoEsposito', to_date('12-06-1973', 'dd-mm-yyyy'), 800, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('EmmArkenstone', to_date('08-10-1992', 'dd-mm-yyyy'), 801, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('PercyPigott-Smith', to_date('30-07-1986', 'dd-mm-yyyy'), 802, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MarkFisher', to_date('28-02-1974', 'dd-mm-yyyy'), 803, 'Certified Nurse', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MollyRooker', to_date('12-05-1983', 'dd-mm-yyyy'), 804, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('JohnnyTwilley', to_date('03-10-1978', 'dd-mm-yyyy'), 805, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MikaStone', to_date('15-07-1973', 'dd-mm-yyyy'), 806, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('JodyMoriarty', to_date('10-11-1986', 'dd-mm-yyyy'), 807, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('DelbertFrancis', to_date('12-01-1974', 'dd-mm-yyyy'), 808, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('EdwardBall', to_date('01-01-1972', 'dd-mm-yyyy'), 809, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('LeVarCurfman', to_date('01-01-1974', 'dd-mm-yyyy'), 810, 'Certified Nurse', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('AlessandroCreek', to_date('05-11-1994', 'dd-mm-yyyy'), 811, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('WilliamPfeiffer', to_date('17-10-1997', 'dd-mm-yyyy'), 812, 'Certified Nurse', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MaeFavreau', to_date('24-06-1993', 'dd-mm-yyyy'), 813, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('WadeFlack', to_date('21-08-1987', 'dd-mm-yyyy'), 814, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('QueenValentin', to_date('06-05-1974', 'dd-mm-yyyy'), 815, 'Certified Nurse', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MillieSummer', to_date('27-12-1991', 'dd-mm-yyyy'), 816, 'Certified Nurse', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('TimothyVinton', to_date('05-03-1991', 'dd-mm-yyyy'), 817, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('SheenaBalk', to_date('19-08-1988', 'dd-mm-yyyy'), 818, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('JaneaneSchneider', to_date('21-03-1990', 'dd-mm-yyyy'), 819, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('FrankieTravolta', to_date('01-10-1982', 'dd-mm-yyyy'), 820, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MauraTwilley', to_date('23-10-1975', 'dd-mm-yyyy'), 821, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('PeteStormare', to_date('13-01-1994', 'dd-mm-yyyy'), 822, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('LaurenDomino', to_date('26-08-1992', 'dd-mm-yyyy'), 823, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('CaseyGoldwyn', to_date('09-10-1972', 'dd-mm-yyyy'), 824, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('NickelFonda', to_date('19-03-1997', 'dd-mm-yyyy'), 825, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('RoddyKirkwood', to_date('01-10-1996', 'dd-mm-yyyy'), 826, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('ChuckDean', to_date('13-09-1971', 'dd-mm-yyyy'), 827, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MarlonGershon', to_date('30-10-1988', 'dd-mm-yyyy'), 828, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('AnnArmstrong', to_date('14-10-1977', 'dd-mm-yyyy'), 829, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('JonathanIrons', to_date('10-10-1972', 'dd-mm-yyyy'), 830, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('NikkiJohansson', to_date('14-12-1994', 'dd-mm-yyyy'), 831, 'Certified Nurse', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('JulietteRizzo', to_date('28-04-1992', 'dd-mm-yyyy'), 832, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('BernardBrowne', to_date('10-11-1996', 'dd-mm-yyyy'), 833, 'Certified Nurse', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('VerucaCalle', to_date('23-08-1999', 'dd-mm-yyyy'), 834, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('HerbieBailey', to_date('05-12-1990', 'dd-mm-yyyy'), 835, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('CurtisCrystal', to_date('26-08-1993', 'dd-mm-yyyy'), 836, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MarisaDuvall', to_date('12-07-1977', 'dd-mm-yyyy'), 837, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('ReneeVega', to_date('01-09-1990', 'dd-mm-yyyy'), 838, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('Mary BethHaysbert', to_date('28-04-1988', 'dd-mm-yyyy'), 839, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('TonyLapointe', to_date('12-09-1998', 'dd-mm-yyyy'), 840, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('ChubbyLaurie', to_date('26-08-1984', 'dd-mm-yyyy'), 841, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('DavisNegbaur', to_date('20-12-1996', 'dd-mm-yyyy'), 842, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('HoraceHatfield', to_date('09-11-1998', 'dd-mm-yyyy'), 843, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('JohnnyDickinson', to_date('02-03-1993', 'dd-mm-yyyy'), 844, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('AliceSmith', to_date('23-08-1980', 'dd-mm-yyyy'), 845, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('BozHatchet', to_date('09-11-1996', 'dd-mm-yyyy'), 846, 'Certified Nurse', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('GinaThomas', to_date('08-10-1998', 'dd-mm-yyyy'), 847, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('ColeLaBelle', to_date('12-02-1998', 'dd-mm-yyyy'), 848, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('SuzyPhillips', to_date('13-10-1992', 'dd-mm-yyyy'), 849, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MarianneMewes', to_date('17-07-1989', 'dd-mm-yyyy'), 850, 'Certified Nurse', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('CyndiGyllenhaal', to_date('16-09-1991', 'dd-mm-yyyy'), 851, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('CeiliKeeslar', to_date('29-05-1997', 'dd-mm-yyyy'), 852, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('WoodyGlenn', to_date('19-07-1973', 'dd-mm-yyyy'), 853, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('VinceAzaria', to_date('13-10-1987', 'dd-mm-yyyy'), 854, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('SeanArmstrong', to_date('11-02-1993', 'dd-mm-yyyy'), 855, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('BeverleyBlair', to_date('21-05-1995', 'dd-mm-yyyy'), 856, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MilesHoffman', to_date('09-11-1992', 'dd-mm-yyyy'), 857, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('ShelbyGunton', to_date('06-06-1991', 'dd-mm-yyyy'), 858, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('AlecPierce', to_date('17-10-1993', 'dd-mm-yyyy'), 859, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MosLeigh', to_date('29-07-1990', 'dd-mm-yyyy'), 860, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('BeverleyKristofferson', to_date('14-08-1998', 'dd-mm-yyyy'), 861, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('IanKenoly', to_date('17-06-1971', 'dd-mm-yyyy'), 862, 'Certified Nurse', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('IlleanaOsborne', to_date('13-10-1997', 'dd-mm-yyyy'), 863, 'Certified Nurse', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('JoaquimFlemyng', to_date('26-08-1988', 'dd-mm-yyyy'), 864, 'Certified Nurse', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MekhiDiffie', to_date('29-06-1979', 'dd-mm-yyyy'), 865, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('ReeseWorrell', to_date('20-06-1991', 'dd-mm-yyyy'), 866, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('ShelbyPotter', to_date('28-03-1997', 'dd-mm-yyyy'), 867, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('BurtonLevin', to_date('04-07-1975', 'dd-mm-yyyy'), 868, 'Certified Nurse', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('TraceMcIntyre', to_date('08-04-1991', 'dd-mm-yyyy'), 869, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('SalTaha', to_date('15-03-1971', 'dd-mm-yyyy'), 870, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('SigourneyKilmer', to_date('05-06-1994', 'dd-mm-yyyy'), 871, 'Certified Nurse', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('FredaVinton', to_date('06-08-1988', 'dd-mm-yyyy'), 872, 'Certified Nurse', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('LucySteiger', to_date('19-10-1995', 'dd-mm-yyyy'), 873, 'Certified Nurse', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('JeanneDunaway', to_date('23-02-1984', 'dd-mm-yyyy'), 874, 'Certified Nurse', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('DonnaPeterson', to_date('18-07-1978', 'dd-mm-yyyy'), 875, 'Certified Nurse', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('BettyMcIntosh', to_date('12-07-1982', 'dd-mm-yyyy'), 876, 'Certified Nurse', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('DarWeiland', to_date('06-11-1978', 'dd-mm-yyyy'), 877, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('AniGooding', to_date('05-09-1978', 'dd-mm-yyyy'), 878, 'Certified Nurse', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('DarylAvalon', to_date('15-06-1982', 'dd-mm-yyyy'), 879, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('GarryStallone', to_date('12-12-1971', 'dd-mm-yyyy'), 880, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('EttaWorrell', to_date('08-10-1980', 'dd-mm-yyyy'), 881, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('DarylRio', to_date('10-11-1979', 'dd-mm-yyyy'), 882, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('SineadKattan', to_date('24-01-1992', 'dd-mm-yyyy'), 883, 'Certified Nurse', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('DwightStallone', to_date('10-09-1982', 'dd-mm-yyyy'), 884, 'Certified Nurse', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('Timvon Sydow', to_date('21-06-1981', 'dd-mm-yyyy'), 885, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('PattiChung', to_date('08-05-1976', 'dd-mm-yyyy'), 886, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('VincentHolm', to_date('06-06-1998', 'dd-mm-yyyy'), 887, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MegCoward', to_date('24-05-1979', 'dd-mm-yyyy'), 888, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('JoaquinColin Young', to_date('29-06-1978', 'dd-mm-yyyy'), 889, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('ManuAlexander', to_date('12-07-1994', 'dd-mm-yyyy'), 890, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('JackGarza', to_date('27-04-1980', 'dd-mm-yyyy'), 891, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('BobWolf', to_date('06-05-1975', 'dd-mm-yyyy'), 892, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('LanceWeir', to_date('03-09-1974', 'dd-mm-yyyy'), 893, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('ChaleeDayne', to_date('17-04-1999', 'dd-mm-yyyy'), 894, 'Certified Nurse', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('SaffronBall', to_date('01-05-1972', 'dd-mm-yyyy'), 895, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('AimeeStewart', to_date('18-11-1997', 'dd-mm-yyyy'), 896, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('ErnieHead', to_date('08-04-1989', 'dd-mm-yyyy'), 897, 'Certified Nurse', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('SwoosieMolina', to_date('12-08-1988', 'dd-mm-yyyy'), 898, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('HollyHaggard', to_date('25-03-1991', 'dd-mm-yyyy'), 899, 'Certified Nurse', 'female');
commit;
prompt 100 records committed...
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('ChristianGriffin', to_date('30-11-1989', 'dd-mm-yyyy'), 650, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('LynetteD''Onofrio', to_date('13-11-1988', 'dd-mm-yyyy'), 651, 'Certified Nurse', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('CurtLizzy', to_date('22-02-1975', 'dd-mm-yyyy'), 652, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('FisherWinslet', to_date('30-09-1997', 'dd-mm-yyyy'), 653, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('AlGlenn', to_date('07-06-1970', 'dd-mm-yyyy'), 654, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('FranzStreep', to_date('04-02-1999', 'dd-mm-yyyy'), 655, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('HopeCraig', to_date('18-06-1990', 'dd-mm-yyyy'), 656, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('BenicioMueller-Stahl', to_date('14-01-1975', 'dd-mm-yyyy'), 657, 'Certified Nurse', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('BrookeMcDowall', to_date('06-03-1995', 'dd-mm-yyyy'), 658, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('JohnnieLipnicki', to_date('15-11-1976', 'dd-mm-yyyy'), 659, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('JoyKudrow', to_date('19-01-1997', 'dd-mm-yyyy'), 660, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('OroSample', to_date('10-05-1999', 'dd-mm-yyyy'), 661, 'Certified Nurse', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('BuffyRawls', to_date('27-07-1970', 'dd-mm-yyyy'), 662, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('LariCantrell', to_date('25-04-1986', 'dd-mm-yyyy'), 663, 'Certified Nurse', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('JeanneMartin', to_date('04-11-1983', 'dd-mm-yyyy'), 664, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('LariAvalon', to_date('15-03-1998', 'dd-mm-yyyy'), 665, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('ElijahRains', to_date('29-04-1983', 'dd-mm-yyyy'), 666, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('ShirleyLauper', to_date('05-03-1987', 'dd-mm-yyyy'), 667, 'Certified Nurse', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('AlbertinaBreslin', to_date('09-12-1998', 'dd-mm-yyyy'), 668, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('JulietDillane', to_date('04-08-1982', 'dd-mm-yyyy'), 669, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('KirstenDomino', to_date('20-09-1973', 'dd-mm-yyyy'), 670, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('TreyMalkovich', to_date('30-04-1991', 'dd-mm-yyyy'), 671, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('RikYorn', to_date('02-02-1998', 'dd-mm-yyyy'), 672, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('BretBeatty', to_date('20-08-1979', 'dd-mm-yyyy'), 673, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('EmilyKenoly', to_date('18-10-1988', 'dd-mm-yyyy'), 674, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('GeneLoggins', to_date('22-09-1998', 'dd-mm-yyyy'), 675, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('JessicaCaine', to_date('08-09-1975', 'dd-mm-yyyy'), 676, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MarlonWeisz', to_date('20-04-1971', 'dd-mm-yyyy'), 677, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MiraHersh', to_date('16-02-1980', 'dd-mm-yyyy'), 678, 'Certified Nurse', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('RandyCockburn', to_date('04-01-1973', 'dd-mm-yyyy'), 679, 'Certified Nurse', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('BeverleyOakenfold', to_date('18-08-1976', 'dd-mm-yyyy'), 680, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('RitchieFinney', to_date('23-02-1998', 'dd-mm-yyyy'), 681, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('JohnetteFichtner', to_date('03-02-1978', 'dd-mm-yyyy'), 682, 'Certified Nurse', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('DebbiePeniston', to_date('25-05-1974', 'dd-mm-yyyy'), 683, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('BrendaMarshall', to_date('29-10-1984', 'dd-mm-yyyy'), 684, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('LorettaVanian', to_date('19-07-1994', 'dd-mm-yyyy'), 685, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('TramaineWine', to_date('16-04-1982', 'dd-mm-yyyy'), 686, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('VendettaVassar', to_date('10-01-1975', 'dd-mm-yyyy'), 687, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('RupertHaysbert', to_date('06-08-1991', 'dd-mm-yyyy'), 688, 'Certified Nurse', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('JenaBullock', to_date('16-03-1979', 'dd-mm-yyyy'), 689, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('GrantCarmen', to_date('05-01-1995', 'dd-mm-yyyy'), 690, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('UdoUggams', to_date('06-06-1999', 'dd-mm-yyyy'), 691, 'Certified Nurse', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('SherylClinton', to_date('06-10-1984', 'dd-mm-yyyy'), 692, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('DwightClose', to_date('11-06-1972', 'dd-mm-yyyy'), 693, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('StockardShepard', to_date('30-05-1972', 'dd-mm-yyyy'), 694, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('CateSuchet', to_date('22-03-1980', 'dd-mm-yyyy'), 695, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('SwoosieDiesel', to_date('29-09-1996', 'dd-mm-yyyy'), 696, 'Certified Nurse', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('WhoopiSanders', to_date('27-02-1979', 'dd-mm-yyyy'), 697, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('BarbaraThomas', to_date('21-04-1985', 'dd-mm-yyyy'), 698, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('EthanIrons', to_date('10-10-1986', 'dd-mm-yyyy'), 699, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('JohnnieHunt', to_date('13-05-1997', 'dd-mm-yyyy'), 700, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('HikaruCamp', to_date('18-10-1993', 'dd-mm-yyyy'), 701, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('DariusSchreiber', to_date('19-03-1989', 'dd-mm-yyyy'), 702, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('NathanHershey', to_date('23-11-1991', 'dd-mm-yyyy'), 703, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('AidaMacht', to_date('26-09-1994', 'dd-mm-yyyy'), 704, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MaxSevenfold', to_date('08-05-1991', 'dd-mm-yyyy'), 705, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('GilbertoElizabeth', to_date('24-08-1990', 'dd-mm-yyyy'), 706, 'Certified Nurse', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('NeveLedger', to_date('19-04-1999', 'dd-mm-yyyy'), 707, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('ThinGriffin', to_date('07-12-1994', 'dd-mm-yyyy'), 708, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MichelleAdkins', to_date('04-09-1995', 'dd-mm-yyyy'), 709, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('KennyRed', to_date('14-02-1994', 'dd-mm-yyyy'), 710, 'Certified Nurse', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('ThomasVai', to_date('07-12-1981', 'dd-mm-yyyy'), 711, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('OzzyNielsen', to_date('16-10-1988', 'dd-mm-yyyy'), 712, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('GwynethO''Neal', to_date('14-02-1994', 'dd-mm-yyyy'), 713, 'Certified Nurse', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MachineHimmelman', to_date('17-01-1992', 'dd-mm-yyyy'), 714, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('PeaboKrabbe', to_date('11-11-1988', 'dd-mm-yyyy'), 715, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('JeremyMitra', to_date('25-07-1991', 'dd-mm-yyyy'), 716, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('EmmaSatriani', to_date('02-11-1984', 'dd-mm-yyyy'), 717, 'Certified Nurse', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('WallyKhan', to_date('07-11-1996', 'dd-mm-yyyy'), 718, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('CurtStanley', to_date('06-11-1975', 'dd-mm-yyyy'), 719, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('OrlandoCagle', to_date('29-09-1988', 'dd-mm-yyyy'), 720, 'Certified Nurse', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('BrothersMcDormand', to_date('30-08-1970', 'dd-mm-yyyy'), 721, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MerleReno', to_date('01-08-1972', 'dd-mm-yyyy'), 722, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('LindseyCross', to_date('12-04-1972', 'dd-mm-yyyy'), 723, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('LaurieEsposito', to_date('10-11-1978', 'dd-mm-yyyy'), 724, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('DesmondCruise', to_date('09-01-1991', 'dd-mm-yyyy'), 725, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('NightVaughan', to_date('26-04-1980', 'dd-mm-yyyy'), 726, 'Certified Nurse', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('DeniseTippe', to_date('25-08-1974', 'dd-mm-yyyy'), 727, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('EugeneMahood', to_date('07-06-1981', 'dd-mm-yyyy'), 728, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('Jean-ClaudeCobbs', to_date('27-09-1990', 'dd-mm-yyyy'), 729, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('DonalWagner', to_date('17-07-1989', 'dd-mm-yyyy'), 730, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('JoaquimMraz', to_date('24-02-1984', 'dd-mm-yyyy'), 731, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('LilyDef', to_date('10-01-1976', 'dd-mm-yyyy'), 732, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('TommyEvanswood', to_date('16-02-1992', 'dd-mm-yyyy'), 733, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('AllisonGill', to_date('24-12-1984', 'dd-mm-yyyy'), 734, 'Certified Nurse', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('HughMiles', to_date('21-08-1983', 'dd-mm-yyyy'), 735, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('DomWiest', to_date('27-06-1985', 'dd-mm-yyyy'), 736, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('SaffronMulroney', to_date('01-05-1994', 'dd-mm-yyyy'), 737, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('LennieQuinlan', to_date('29-11-1985', 'dd-mm-yyyy'), 738, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('HarveyUggams', to_date('24-07-1986', 'dd-mm-yyyy'), 739, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('HiltonWinwood', to_date('07-05-1984', 'dd-mm-yyyy'), 740, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('LeonardoBacon', to_date('09-04-1991', 'dd-mm-yyyy'), 741, 'Certified Nurse', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('JosephHolmes', to_date('08-07-1992', 'dd-mm-yyyy'), 742, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('CandiceFonda', to_date('11-01-1998', 'dd-mm-yyyy'), 743, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('BryanPenn', to_date('02-07-1980', 'dd-mm-yyyy'), 744, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('LonnieBosco', to_date('09-02-1997', 'dd-mm-yyyy'), 745, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('EdieAniston', to_date('09-04-1971', 'dd-mm-yyyy'), 746, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('NickelOwen', to_date('06-09-1975', 'dd-mm-yyyy'), 747, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('LievCulkin', to_date('19-01-1996', 'dd-mm-yyyy'), 748, 'Certified Nurse', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('TracyOlyphant', to_date('11-09-1975', 'dd-mm-yyyy'), 749, 'First Responder', 'female');
commit;
prompt 200 records committed...
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('NickNicks', to_date('28-11-1998', 'dd-mm-yyyy'), 750, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('EttaFrancis', to_date('29-06-1975', 'dd-mm-yyyy'), 751, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('LynnStone', to_date('23-07-1980', 'dd-mm-yyyy'), 752, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('BebeHorton', to_date('15-10-1997', 'dd-mm-yyyy'), 753, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MikoSwank', to_date('13-01-1972', 'dd-mm-yyyy'), 754, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('TanyaMazzello', to_date('15-03-1985', 'dd-mm-yyyy'), 755, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('NormPlace', to_date('29-06-1997', 'dd-mm-yyyy'), 756, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('VickieRibisi', to_date('04-08-1997', 'dd-mm-yyyy'), 757, 'Certified Nurse', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('BuffyO''Hara', to_date('07-11-1976', 'dd-mm-yyyy'), 758, 'Certified Nurse', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('RodneyKatt', to_date('09-07-1975', 'dd-mm-yyyy'), 759, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('JillLiu', to_date('21-02-1982', 'dd-mm-yyyy'), 760, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('RodneyCotton', to_date('22-05-1977', 'dd-mm-yyyy'), 761, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('JarvisRhys-Davies', to_date('02-02-1991', 'dd-mm-yyyy'), 762, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('GinaGleeson', to_date('10-09-1986', 'dd-mm-yyyy'), 763, 'Certified Nurse', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('DougAskew', to_date('14-10-1996', 'dd-mm-yyyy'), 764, 'Certified Nurse', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('LennieDean', to_date('08-10-1986', 'dd-mm-yyyy'), 765, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('GordieMorales', to_date('10-08-1997', 'dd-mm-yyyy'), 766, 'Certified Nurse', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('CathyVicious', to_date('21-09-1985', 'dd-mm-yyyy'), 767, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('KittyClose', to_date('02-06-1996', 'dd-mm-yyyy'), 768, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('VinCarmen', to_date('27-04-1990', 'dd-mm-yyyy'), 769, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('ErnieMcClinton', to_date('17-10-1976', 'dd-mm-yyyy'), 770, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('CaseyWhitmore', to_date('09-10-1986', 'dd-mm-yyyy'), 771, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('HollyMcCain', to_date('07-10-1985', 'dd-mm-yyyy'), 772, 'Certified Nurse', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('EdwinBentley', to_date('09-03-1985', 'dd-mm-yyyy'), 773, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MaxQuaid', to_date('03-03-1972', 'dd-mm-yyyy'), 774, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('TalImbruglia', to_date('17-12-1974', 'dd-mm-yyyy'), 775, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('ElijahWaits', to_date('30-11-1985', 'dd-mm-yyyy'), 776, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('HowardNiven', to_date('26-05-1987', 'dd-mm-yyyy'), 777, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('JonathaBorden', to_date('12-05-1981', 'dd-mm-yyyy'), 778, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('AliDriver', to_date('24-03-1991', 'dd-mm-yyyy'), 779, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('KathleenHarnes', to_date('01-05-1986', 'dd-mm-yyyy'), 780, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('GordieTucker', to_date('28-05-1993', 'dd-mm-yyyy'), 781, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('ReneePride', to_date('05-11-1971', 'dd-mm-yyyy'), 782, 'Certified Nurse', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MauryNorton', to_date('13-05-1993', 'dd-mm-yyyy'), 783, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('JeanneJames', to_date('12-07-1975', 'dd-mm-yyyy'), 784, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('GeoffBaldwin', to_date('09-09-1970', 'dd-mm-yyyy'), 785, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('TrickBoorem', to_date('09-08-1998', 'dd-mm-yyyy'), 786, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('IceRanger', to_date('11-12-1985', 'dd-mm-yyyy'), 787, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('RaulFarris', to_date('05-03-1971', 'dd-mm-yyyy'), 788, 'Certified Nurse', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('JudeLange', to_date('16-11-1998', 'dd-mm-yyyy'), 789, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('DeborahLeguizamo', to_date('04-03-1988', 'dd-mm-yyyy'), 790, 'Certified Nurse', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('KarenArkenstone', to_date('25-03-1989', 'dd-mm-yyyy'), 791, 'Certified Nurse', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('ChazzWahlberg', to_date('12-12-1977', 'dd-mm-yyyy'), 792, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('LloydLaPaglia', to_date('04-04-1970', 'dd-mm-yyyy'), 793, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('KirstenStudi', to_date('30-01-1991', 'dd-mm-yyyy'), 794, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('GeenaSewell', to_date('06-10-1994', 'dd-mm-yyyy'), 795, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('ChloeStoltz', to_date('13-11-1988', 'dd-mm-yyyy'), 796, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('TracyRibisi', to_date('11-02-1976', 'dd-mm-yyyy'), 797, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MikoScheider', to_date('13-04-1972', 'dd-mm-yyyy'), 798, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('CarleneShepard', to_date('16-10-1972', 'dd-mm-yyyy'), 799, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('AlfieClayton', to_date('02-03-1992', 'dd-mm-yyyy'), 551, 'Certified Nurse', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('AlWeaver', to_date('07-11-1999', 'dd-mm-yyyy'), 552, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('DougRuiz', to_date('06-08-1973', 'dd-mm-yyyy'), 553, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('FayeZevon', to_date('14-06-1976', 'dd-mm-yyyy'), 554, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MerrileeShearer', to_date('15-05-1976', 'dd-mm-yyyy'), 555, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('JayTippe', to_date('24-07-1971', 'dd-mm-yyyy'), 556, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('LarrySnow', to_date('17-11-1975', 'dd-mm-yyyy'), 557, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('BobbyDonelly', to_date('24-01-1992', 'dd-mm-yyyy'), 558, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('KeithWoodward', to_date('17-04-1993', 'dd-mm-yyyy'), 559, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('FrancoLewin', to_date('26-04-1974', 'dd-mm-yyyy'), 560, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('ArnoldWahlberg', to_date('05-04-1998', 'dd-mm-yyyy'), 561, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('RobertHenriksen', to_date('05-01-1977', 'dd-mm-yyyy'), 562, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('KatrinCook', to_date('29-09-1972', 'dd-mm-yyyy'), 563, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('ClaudeWillard', to_date('05-10-1985', 'dd-mm-yyyy'), 564, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('HarrisPullman', to_date('20-04-1971', 'dd-mm-yyyy'), 565, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('DanSkaggs', to_date('06-09-1989', 'dd-mm-yyyy'), 566, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MaxineStatham', to_date('03-06-1985', 'dd-mm-yyyy'), 567, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MichaelO''Donnell', to_date('27-02-1976', 'dd-mm-yyyy'), 568, 'Certified Nurse', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('LloydKennedy', to_date('26-07-1995', 'dd-mm-yyyy'), 569, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('BuddyDarren', to_date('02-12-1981', 'dd-mm-yyyy'), 570, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('CaryRifkin', to_date('12-08-1975', 'dd-mm-yyyy'), 571, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('ReginaCrimson', to_date('03-07-1976', 'dd-mm-yyyy'), 572, 'Certified Nurse', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('JulieHoly', to_date('16-03-1978', 'dd-mm-yyyy'), 573, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('NancyMcCormack', to_date('30-11-1991', 'dd-mm-yyyy'), 574, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('RichCusack', to_date('23-12-1976', 'dd-mm-yyyy'), 575, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('CevinLopez', to_date('04-10-1979', 'dd-mm-yyyy'), 576, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('DebraShaye', to_date('20-06-1990', 'dd-mm-yyyy'), 577, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('NataliePaul', to_date('03-04-1998', 'dd-mm-yyyy'), 578, 'Certified Nurse', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('RolandoAli', to_date('21-01-1984', 'dd-mm-yyyy'), 579, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('LarenzShatner', to_date('16-10-1985', 'dd-mm-yyyy'), 580, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('WillieCazale', to_date('14-08-1997', 'dd-mm-yyyy'), 581, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MaxinePhifer', to_date('21-10-1989', 'dd-mm-yyyy'), 582, 'Certified Nurse', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MorrisLevy', to_date('31-08-1979', 'dd-mm-yyyy'), 583, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('DevonWashington', to_date('08-07-1998', 'dd-mm-yyyy'), 584, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('GeenaFeliciano', to_date('08-02-1990', 'dd-mm-yyyy'), 585, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('TyroneVaughn', to_date('11-05-1973', 'dd-mm-yyyy'), 586, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('ShirleyWinstone', to_date('04-11-1995', 'dd-mm-yyyy'), 587, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('ToshiroVincent', to_date('07-11-1970', 'dd-mm-yyyy'), 588, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('ChetCoyote', to_date('09-06-1992', 'dd-mm-yyyy'), 589, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('JosephGarfunkel', to_date('16-08-1978', 'dd-mm-yyyy'), 590, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('JulianneFichtner', to_date('29-06-1973', 'dd-mm-yyyy'), 591, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('AmandaMeniketti', to_date('11-11-1970', 'dd-mm-yyyy'), 592, 'Certified Nurse', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('GeoffPhillips', to_date('25-08-1973', 'dd-mm-yyyy'), 593, 'Certified Nurse', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('VinSalt', to_date('04-08-1977', 'dd-mm-yyyy'), 594, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('BobbyRedgrave', to_date('21-05-1973', 'dd-mm-yyyy'), 595, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('RonnieCruz', to_date('08-11-1979', 'dd-mm-yyyy'), 596, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MiliSobieski', to_date('26-09-1990', 'dd-mm-yyyy'), 597, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('HalleMoss', to_date('13-10-1972', 'dd-mm-yyyy'), 598, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('ChubbyHagar', to_date('02-09-1978', 'dd-mm-yyyy'), 599, 'Certified Nurse', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('QueenSutherland', to_date('03-09-1970', 'dd-mm-yyyy'), 600, 'Paramedic', 'female');
commit;
prompt 300 records committed...
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('JudiWillis', to_date('17-01-1974', 'dd-mm-yyyy'), 601, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('BerniePatillo', to_date('11-06-1976', 'dd-mm-yyyy'), 602, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('EugeneBelle', to_date('25-07-1976', 'dd-mm-yyyy'), 603, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('SammyDawson', to_date('08-01-1992', 'dd-mm-yyyy'), 604, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('FranceBenson', to_date('05-12-1980', 'dd-mm-yyyy'), 605, 'Certified Nurse', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('JillVan Der Beek', to_date('05-03-1970', 'dd-mm-yyyy'), 606, 'Certified Nurse', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('NoraJordan', to_date('14-05-1994', 'dd-mm-yyyy'), 607, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('PattiDavis', to_date('24-01-1992', 'dd-mm-yyyy'), 608, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('BryanLane', to_date('20-08-1981', 'dd-mm-yyyy'), 609, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('DwightMarie', to_date('24-01-1972', 'dd-mm-yyyy'), 610, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('TobeyGlover', to_date('11-06-1982', 'dd-mm-yyyy'), 611, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('EugeneHolden', to_date('02-02-1992', 'dd-mm-yyyy'), 612, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('FirstWeston', to_date('31-10-1988', 'dd-mm-yyyy'), 613, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('SimonWeisberg', to_date('05-11-1985', 'dd-mm-yyyy'), 614, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('LupeBirch', to_date('14-05-1984', 'dd-mm-yyyy'), 615, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('KatrinBarrymore', to_date('16-07-1998', 'dd-mm-yyyy'), 616, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('JenaDushku', to_date('20-08-1999', 'dd-mm-yyyy'), 617, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('GeoffreyUnderwood', to_date('09-02-1974', 'dd-mm-yyyy'), 618, 'Certified Nurse', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('PabloBenet', to_date('04-11-1991', 'dd-mm-yyyy'), 619, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('CarlaKotto', to_date('26-02-1979', 'dd-mm-yyyy'), 620, 'Certified Nurse', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('ChristianCube', to_date('04-08-1976', 'dd-mm-yyyy'), 621, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MillaChappelle', to_date('29-01-1975', 'dd-mm-yyyy'), 622, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('CharlieReed', to_date('02-08-1999', 'dd-mm-yyyy'), 623, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('GeneDrive', to_date('15-07-1996', 'dd-mm-yyyy'), 624, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('AllanTempest', to_date('01-07-1981', 'dd-mm-yyyy'), 625, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('WilliamSpector', to_date('09-01-1980', 'dd-mm-yyyy'), 626, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('JeroenDiBiasio', to_date('21-10-1972', 'dd-mm-yyyy'), 627, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('HollyJackman', to_date('28-11-1999', 'dd-mm-yyyy'), 628, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('CameronBoyle', to_date('22-06-1983', 'dd-mm-yyyy'), 629, 'Certified Nurse', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('HugoWarren', to_date('27-10-1975', 'dd-mm-yyyy'), 630, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('CandiceMattea', to_date('17-06-1987', 'dd-mm-yyyy'), 631, 'Certified Nurse', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('AndieEl-Saher', to_date('02-05-1983', 'dd-mm-yyyy'), 632, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MoeHauser', to_date('01-03-1980', 'dd-mm-yyyy'), 633, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('LouiseCrow', to_date('29-08-1994', 'dd-mm-yyyy'), 634, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MachineLange', to_date('04-12-1970', 'dd-mm-yyyy'), 635, 'Certified Nurse', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('WayneCoyote', to_date('21-03-1996', 'dd-mm-yyyy'), 636, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('BrendanLauper', to_date('20-07-1998', 'dd-mm-yyyy'), 637, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MurrayEsposito', to_date('04-07-1990', 'dd-mm-yyyy'), 638, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('DavisArthur', to_date('25-03-1978', 'dd-mm-yyyy'), 639, 'Certified Nurse', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('BethOwen', to_date('30-04-1979', 'dd-mm-yyyy'), 640, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('ZooeyRobinson', to_date('01-03-1999', 'dd-mm-yyyy'), 641, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('RoscoePosener', to_date('10-04-1999', 'dd-mm-yyyy'), 642, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('IkeDiesel', to_date('19-07-1996', 'dd-mm-yyyy'), 643, 'Certified Nurse', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MarieO''Donnell', to_date('13-02-1977', 'dd-mm-yyyy'), 644, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('FirstQuatro', to_date('29-03-1985', 'dd-mm-yyyy'), 645, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('Jean-LucWithers', to_date('04-04-1997', 'dd-mm-yyyy'), 646, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('PeterCaan', to_date('23-01-1988', 'dd-mm-yyyy'), 647, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('ArnoldGarcia', to_date('14-09-1994', 'dd-mm-yyyy'), 648, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('JohnKnight', to_date('08-08-1995', 'dd-mm-yyyy'), 649, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('GeraldKrumholtz', to_date('07-06-1980', 'dd-mm-yyyy'), 500, 'Certified Nurse', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('CarleneMacLachlan', to_date('13-01-1974', 'dd-mm-yyyy'), 501, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('BurtonMarsden', to_date('08-02-1994', 'dd-mm-yyyy'), 502, 'Certified Nurse', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('RickyFurtado', to_date('20-10-1999', 'dd-mm-yyyy'), 503, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('RosannaOntiveros', to_date('16-12-1986', 'dd-mm-yyyy'), 504, 'Certified Nurse', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MiaRuiz', to_date('31-12-1987', 'dd-mm-yyyy'), 505, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('WesReiner', to_date('08-05-1977', 'dd-mm-yyyy'), 506, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('VondieQuaid', to_date('24-10-1984', 'dd-mm-yyyy'), 507, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('BoydMcClinton', to_date('16-11-1988', 'dd-mm-yyyy'), 508, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MegColin Young', to_date('09-06-1977', 'dd-mm-yyyy'), 509, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('HarryLachey', to_date('07-05-1991', 'dd-mm-yyyy'), 510, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('PeterMoss', to_date('23-11-1997', 'dd-mm-yyyy'), 511, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('SanderHarary', to_date('01-02-1973', 'dd-mm-yyyy'), 512, 'Certified Nurse', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('ParkerBorgnine', to_date('22-06-1979', 'dd-mm-yyyy'), 513, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('CesarCronin', to_date('30-08-1990', 'dd-mm-yyyy'), 514, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('PeterTate', to_date('09-11-1974', 'dd-mm-yyyy'), 515, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('AlfredKeener', to_date('01-12-1991', 'dd-mm-yyyy'), 516, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('PetulaGugino', to_date('18-01-1994', 'dd-mm-yyyy'), 517, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MartyHenriksen', to_date('02-07-1987', 'dd-mm-yyyy'), 518, 'Certified Nurse', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('EdwardTankard', to_date('23-07-1980', 'dd-mm-yyyy'), 519, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('KirkQuinlan', to_date('10-08-1972', 'dd-mm-yyyy'), 520, 'Certified Nurse', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('SanderLoveless', to_date('28-05-1983', 'dd-mm-yyyy'), 521, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('AimeeGraham', to_date('07-04-1978', 'dd-mm-yyyy'), 522, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('BreckinGreene', to_date('20-11-1991', 'dd-mm-yyyy'), 523, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('BethTyson', to_date('17-12-1989', 'dd-mm-yyyy'), 524, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('SamanthaHolland', to_date('16-09-1996', 'dd-mm-yyyy'), 525, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('DeborahNeill', to_date('23-12-1994', 'dd-mm-yyyy'), 526, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('KeithWinstone', to_date('02-12-1996', 'dd-mm-yyyy'), 527, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('JodyLynch', to_date('18-08-1987', 'dd-mm-yyyy'), 528, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('DonaldMcCain', to_date('30-10-1993', 'dd-mm-yyyy'), 529, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('CarlShannon', to_date('10-07-1988', 'dd-mm-yyyy'), 530, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('NataschaCarrington', to_date('24-12-1972', 'dd-mm-yyyy'), 531, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('BernieWhitman', to_date('06-11-1978', 'dd-mm-yyyy'), 532, 'Certified Nurse', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('AlbertinaCromwell', to_date('14-07-1999', 'dd-mm-yyyy'), 533, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MintLowe', to_date('28-04-1978', 'dd-mm-yyyy'), 534, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('BridgetteMcIntosh', to_date('29-08-1973', 'dd-mm-yyyy'), 535, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('NedNiven', to_date('03-12-1994', 'dd-mm-yyyy'), 536, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('BobbyCarlton', to_date('28-02-1997', 'dd-mm-yyyy'), 537, 'Certified Nurse', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('HugoKennedy', to_date('31-05-1980', 'dd-mm-yyyy'), 538, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('NicholasClark', to_date('18-07-1992', 'dd-mm-yyyy'), 539, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('Ming-NaMyers', to_date('05-03-1987', 'dd-mm-yyyy'), 540, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('FirstHersh', to_date('25-01-1998', 'dd-mm-yyyy'), 541, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('GarryBandy', to_date('06-07-1983', 'dd-mm-yyyy'), 542, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('TildaGleeson', to_date('05-10-1998', 'dd-mm-yyyy'), 543, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('BoydRoot', to_date('19-09-1985', 'dd-mm-yyyy'), 544, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('ChloeIfans', to_date('18-10-1980', 'dd-mm-yyyy'), 545, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('AvengedTomlin', to_date('11-01-1980', 'dd-mm-yyyy'), 546, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('SelmaSilverman', to_date('31-12-1976', 'dd-mm-yyyy'), 547, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('Mary BethGoldberg', to_date('09-10-1985', 'dd-mm-yyyy'), 548, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('KatrinMantegna', to_date('13-05-1971', 'dd-mm-yyyy'), 549, 'Certified Nurse', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('UmaKeaton', to_date('27-08-1976', 'dd-mm-yyyy'), 550, 'Paramedic', 'female');
commit;
prompt 400 records loaded
prompt Loading COURSES...
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 115, 'Medical', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 116, 'Management', 'Optional', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 117, 'Safety', 'Required', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 118, 'Safety', 'Required', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 119, 'Safety', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 120, 'Safety', 'Optional', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 121, 'Medical', 'Optional', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 122, 'Management', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 123, 'Management', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 124, 'Safety', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 1, 'Management', 'Optional', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 2, 'Safety', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 3, 'Safety', 'Required', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 4, 'Medical', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 5, 'Management', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 6, 'Medical', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 7, 'Management', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 8, 'Medical', 'Required', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 9, 'Safety', 'Optional', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 10, 'Safety', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 11, 'Safety', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 12, 'Safety', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 13, 'Medical', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 14, 'Medical', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 15, 'Safety', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 16, 'Management', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 17, 'Safety', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 18, 'Medical', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 19, 'Safety', 'Optional', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 20, 'Safety', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 21, 'Medical', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 22, 'Safety', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 23, 'Management', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 24, 'Management', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 25, 'Safety', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 26, 'Safety', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 27, 'Medical', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 28, 'Medical', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 29, 'Safety', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 30, 'Medical', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 31, 'Medical', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 32, 'Safety', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 33, 'Safety', 'Optional', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 34, 'Safety', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 35, 'Safety', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 36, 'Management', 'Required', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 37, 'Safety', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 38, 'Safety', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 39, 'Safety', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 40, 'Safety', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 41, 'Safety', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 42, 'Safety', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 43, 'Safety', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 44, 'Medical', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 45, 'Management', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 46, 'Management', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 47, 'Safety', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 48, 'Medical', 'Optional', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 49, 'Safety', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 50, 'Medical', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 51, 'Medical', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 52, 'Medical', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 53, 'Management', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 54, 'Medical', 'Required', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 55, 'Medical', 'Optional', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 56, 'Safety', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 57, 'Safety', 'Optional', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 58, 'Management', 'Required', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 59, 'Medical', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 60, 'Medical', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 61, 'Medical', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 62, 'Management', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 63, 'Safety', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 64, 'Management', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 65, 'Management', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 66, 'Management', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 67, 'Management', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 68, 'Management', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 69, 'Management', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 70, 'Management', 'Required', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 71, 'Management', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 72, 'Management', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 73, 'Medical', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 74, 'Medical', 'Required', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 75, 'Safety', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 76, 'Safety', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 77, 'Safety', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 78, 'Safety', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 79, 'Medical', 'Required', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 80, 'Management', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 81, 'Safety', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 82, 'Management', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 83, 'Safety', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 84, 'Management', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 85, 'Management', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 86, 'Medical', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 87, 'Medical', 'Optional', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 88, 'Management', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 89, 'Management', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 90, 'Safety', 'Optional', 'Emergency Response');
commit;
prompt 100 records committed...
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 91, 'Safety', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 92, 'Medical', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 93, 'Medical', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 94, 'Management', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 95, 'Safety', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 96, 'Management', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 97, 'Safety', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 98, 'Management', 'Optional', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 99, 'Medical', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 100, 'Medical', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 101, 'Management', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 102, 'Safety', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 103, 'Management', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 104, 'Management', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 105, 'Medical', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 106, 'Safety', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 107, 'Management', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 108, 'Safety', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 109, 'Safety', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 110, 'Safety', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 111, 'Medical', 'Required', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 112, 'Safety', 'Optional', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 113, 'Management', 'Required', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 114, 'Management', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 125, 'Medical', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 126, 'Medical', 'Required', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 127, 'Safety', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 128, 'Management', 'Required', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 129, 'Medical', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 130, 'Safety', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 131, 'Safety', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 132, 'Safety', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 133, 'Safety', 'Optional', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 134, 'Safety', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 135, 'Medical', 'Optional', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 136, 'Safety', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 137, 'Safety', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 138, 'Management', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 139, 'Safety', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 140, 'Medical', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 141, 'Safety', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 142, 'Medical', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 143, 'Management', 'Required', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 144, 'Medical', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 145, 'Safety', 'Required', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 146, 'Management', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 147, 'Medical', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 148, 'Safety', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 149, 'Medical', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 150, 'Safety', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 151, 'Safety', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 152, 'Medical', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 153, 'Safety', 'Required', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 154, 'Medical', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 155, 'Medical', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 156, 'Medical', 'Required', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 157, 'Medical', 'Optional', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 158, 'Safety', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 159, 'Safety', 'Optional', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 160, 'Management', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 161, 'Medical', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 162, 'Management', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 163, 'Management', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 164, 'Safety', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 165, 'Management', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 166, 'Safety', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 167, 'Management', 'Optional', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 168, 'Safety', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 169, 'Management', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 170, 'Medical', 'Optional', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 171, 'Safety', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 172, 'Safety', 'Required', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 173, 'Safety', 'Optional', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 174, 'Management', 'Required', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 175, 'Medical', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 176, 'Safety', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 177, 'Safety', 'Optional', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 178, 'Safety', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 179, 'Medical', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 180, 'Medical', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 181, 'Medical', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 182, 'Medical', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 183, 'Management', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 184, 'Medical', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 185, 'Safety', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 186, 'Medical', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 187, 'Medical', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 188, 'Management', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 189, 'Management', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 190, 'Management', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 191, 'Management', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 192, 'Medical', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 193, 'Management', 'Optional', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 194, 'Medical', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 195, 'Management', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 196, 'Medical', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 197, 'Management', 'Optional', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 198, 'Safety', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 199, 'Medical', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 200, 'Medical', 'Optional', 'Emergency Response');
commit;
prompt 200 records committed...
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 201, 'Medical', 'Optional', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 202, 'Medical', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 203, 'Medical', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 204, 'Management', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 205, 'Safety', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 206, 'Management', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 207, 'Medical', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 208, 'Management', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 209, 'Management', 'Required', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 210, 'Management', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 211, 'Medical', 'Optional', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 212, 'Safety', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 213, 'Safety', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 214, 'Safety', 'Required', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 215, 'Safety', 'Optional', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 216, 'Medical', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 217, 'Management', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 218, 'Management', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 219, 'Management', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 220, 'Medical', 'Optional', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 221, 'Management', 'Optional', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 222, 'Management', 'Required', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 223, 'Management', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 224, 'Safety', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 225, 'Medical', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 226, 'Medical', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 227, 'Management', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 228, 'Management', 'Optional', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 229, 'Safety', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 230, 'Safety', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 231, 'Medical', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 232, 'Management', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 233, 'Management', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 234, 'Management', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 235, 'Medical', 'Required', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 236, 'Management', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 237, 'Safety', 'Optional', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 238, 'Medical', 'Required', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 239, 'Management', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 240, 'Safety', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 241, 'Medical', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 242, 'Safety', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 243, 'Management', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 244, 'Medical', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 245, 'Safety', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 246, 'Management', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 247, 'Management', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 248, 'Management', 'Required', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 249, 'Safety', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 250, 'Medical', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 251, 'Medical', 'Optional', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 252, 'Safety', 'Optional', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 253, 'Safety', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 254, 'Medical', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 255, 'Medical', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 256, 'Medical', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 257, 'Safety', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 258, 'Medical', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 259, 'Management', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 260, 'Medical', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 261, 'Management', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 262, 'Safety', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 263, 'Safety', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 264, 'Safety', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 265, 'Medical', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 266, 'Management', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 267, 'Management', 'Optional', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 268, 'Management', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 269, 'Safety', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 270, 'Safety', 'Required', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 271, 'Safety', 'Optional', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 272, 'Safety', 'Required', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 273, 'Safety', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 274, 'Medical', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 275, 'Management', 'Required', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 276, 'Medical', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 277, 'Medical', 'Required', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 278, 'Medical', 'Required', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 279, 'Safety', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 280, 'Medical', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 281, 'Safety', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 282, 'Safety', 'Required', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 283, 'Safety', 'Required', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 284, 'Medical', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 285, 'Safety', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 286, 'Safety', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 287, 'Medical', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 288, 'Medical', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 289, 'Safety', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 290, 'Safety', 'Optional', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 291, 'Medical', 'Required', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 292, 'Management', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 293, 'Safety', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 294, 'Medical', 'Required', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 295, 'Management', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 296, 'Medical', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 297, 'Medical', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 298, 'Safety', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 299, 'Medical', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 300, 'Safety', 'Required', 'CPR''''None');
commit;
prompt 300 records committed...
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 301, 'Safety', 'Optional', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 302, 'Management', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 303, 'Medical', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 304, 'Management', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 305, 'Management', 'Optional', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 306, 'Management', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 307, 'Medical', 'Optional', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 308, 'Safety', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 309, 'Safety', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 310, 'Medical', 'Required', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 311, 'Medical', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 312, 'Medical', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 313, 'Medical', 'Optional', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 314, 'Safety', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 315, 'Safety', 'Optional', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 316, 'Safety', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 317, 'Management', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 318, 'Medical', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 319, 'Safety', 'Required', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 320, 'Medical', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 321, 'Safety', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 322, 'Safety', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 323, 'Medical', 'Optional', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 324, 'Management', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 325, 'Management', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 326, 'Medical', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 327, 'Management', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 328, 'Safety', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 329, 'Management', 'Required', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 330, 'Safety', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 331, 'Medical', 'Optional', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 332, 'Management', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 333, 'Safety', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 334, 'Safety', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 335, 'Medical', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 336, 'Medical', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 337, 'Medical', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 338, 'Medical', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 339, 'Safety', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 340, 'Safety', 'Required', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 341, 'Medical', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 342, 'Medical', 'Optional', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 343, 'Safety', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 344, 'Medical', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 345, 'Management', 'Optional', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 346, 'Safety', 'Required', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 347, 'Safety', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 348, 'Management', 'Required', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 349, 'Management', 'Required', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 350, 'Medical', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 351, 'Safety', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 352, 'Management', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 353, 'Medical', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 354, 'Medical', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 355, 'Management', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 356, 'Safety', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 357, 'Management', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 358, 'Safety', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 359, 'Safety', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 360, 'Safety', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 361, 'Management', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 362, 'Management', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 363, 'Management', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 364, 'Medical', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 365, 'Medical', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 366, 'Management', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 367, 'Medical', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 368, 'Management', 'Optional', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 369, 'Medical', 'Required', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 370, 'Management', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 371, 'Management', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 372, 'Medical', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 373, 'Safety', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 374, 'Management', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 375, 'Safety', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 376, 'Safety', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 377, 'Medical', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 378, 'Medical', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 379, 'Safety', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 380, 'Management', 'Required', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 381, 'Medical', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 382, 'Medical', 'Optional', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 383, 'Management', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 384, 'Medical', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 385, 'Management', 'Optional', 'CPR''''None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 386, 'Management', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 387, 'Management', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 388, 'Management', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 389, 'Medical', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 390, 'Medical', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 391, 'Medical', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 392, 'Medical', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 393, 'Management', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 394, 'Safety', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 395, 'Management', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 396, 'Safety', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 397, 'Medical', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 398, 'Management', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 399, 'Safety', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 400, 'Medical', 'Optional', 'CPR''''None');
commit;
prompt 400 records loaded
prompt Loading LECTURERS...
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (239, 'SamBrolin', to_date('25-04-1978', 'dd-mm-yyyy'), '3', 'Disaster Management');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (240, 'JimmyPitt', to_date('31-08-1998', 'dd-mm-yyyy'), '1', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (241, 'MickyHolmes', to_date('20-09-1985', 'dd-mm-yyyy'), '18', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (242, 'EdDevine', to_date('12-02-1984', 'dd-mm-yyyy'), '17', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (243, 'BarbaraMcFadden', to_date('17-05-1997', 'dd-mm-yyyy'), '13', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (244, 'DylanSpall', to_date('11-01-1979', 'dd-mm-yyyy'), '27', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (245, 'WadeMacht', to_date('22-07-1977', 'dd-mm-yyyy'), '18', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (246, 'VendettaQuatro', to_date('29-01-1974', 'dd-mm-yyyy'), '6', 'Disaster Management');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (247, 'GeggyCohn', to_date('19-10-1985', 'dd-mm-yyyy'), '15', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (248, 'KayFarrell', to_date('07-05-1977', 'dd-mm-yyyy'), '12', '''Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (100, 'CarlosCarter', to_date('07-01-1987', 'dd-mm-yyyy'), '15', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (101, 'SamanthaHimmelman', to_date('16-07-1984', 'dd-mm-yyyy'), '14', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (102, 'AdinaDe Niro', to_date('24-01-1990', 'dd-mm-yyyy'), '25', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (103, 'BradleyHughes', to_date('22-02-1976', 'dd-mm-yyyy'), '13', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (104, 'LucindaGordon', to_date('13-11-1989', 'dd-mm-yyyy'), '4', 'Disaster Management');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (105, 'WendyArkenstone', to_date('24-09-1993', 'dd-mm-yyyy'), '17', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (106, 'GranNielsen', to_date('15-09-1971', 'dd-mm-yyyy'), '26', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (107, 'StockardGordon', to_date('13-01-1974', 'dd-mm-yyyy'), '17', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (108, 'HugoDench', to_date('29-11-1983', 'dd-mm-yyyy'), '12', 'Pediatric Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (109, 'Mary BethBlanchett', to_date('17-06-1977', 'dd-mm-yyyy'), '23', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (110, 'VickieYorn', to_date('13-02-1972', 'dd-mm-yyyy'), '2', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (111, 'MekhiSoda', to_date('30-10-1991', 'dd-mm-yyyy'), '22', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (112, 'RandyLynch', to_date('16-10-1993', 'dd-mm-yyyy'), '15', '''Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (113, 'DanniBranagh', to_date('03-07-1999', 'dd-mm-yyyy'), '4', 'Pediatric Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (114, 'MiraO''Hara', to_date('03-01-1989', 'dd-mm-yyyy'), '12', 'Pediatric Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (115, 'CeiliRamis', to_date('08-12-1995', 'dd-mm-yyyy'), '22', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (116, 'SallyField', to_date('25-12-1972', 'dd-mm-yyyy'), '8', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (117, 'TchekyDench', to_date('22-11-1991', 'dd-mm-yyyy'), '13', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (118, 'BalthazarFaithfull', to_date('03-12-1988', 'dd-mm-yyyy'), '15', 'Disaster Management');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (119, 'WalterPhillippe', to_date('05-08-1984', 'dd-mm-yyyy'), '20', '''Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (120, 'RhysHutch', to_date('08-10-1970', 'dd-mm-yyyy'), '20', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (121, 'BernardPigott-Smith', to_date('29-04-1994', 'dd-mm-yyyy'), '26', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (122, 'ElizaDuke', to_date('12-02-1981', 'dd-mm-yyyy'), '18', 'Disaster Management');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (123, 'ReneeLove', to_date('27-10-1986', 'dd-mm-yyyy'), '4', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (124, 'FirstSinatra', to_date('01-01-1972', 'dd-mm-yyyy'), '1', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (125, 'MikaMandrell', to_date('18-07-1987', 'dd-mm-yyyy'), '6', 'Disaster Management');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (126, 'BernieGibson', to_date('14-01-1992', 'dd-mm-yyyy'), '4', 'Disaster Management');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (127, 'LennyPesci', to_date('20-01-1986', 'dd-mm-yyyy'), '28', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (128, 'DabneyCoward', to_date('26-10-1974', 'dd-mm-yyyy'), '16', 'Pediatric Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (129, 'AvengedDillane', to_date('26-06-1976', 'dd-mm-yyyy'), '23', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (130, 'MerrillMcCoy', to_date('23-11-1986', 'dd-mm-yyyy'), '3', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (131, 'HopeWeiland', to_date('31-12-1977', 'dd-mm-yyyy'), '5', '''Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (132, 'ErnestSepulveda', to_date('01-06-1981', 'dd-mm-yyyy'), '14', 'Disaster Management');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (133, 'RadeCross', to_date('16-06-1996', 'dd-mm-yyyy'), '5', 'Disaster Management');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (134, 'MarinaSanchez', to_date('13-03-1972', 'dd-mm-yyyy'), '3', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (135, 'EmilioCostner', to_date('13-09-1989', 'dd-mm-yyyy'), '23', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (136, 'MilesBancroft', to_date('22-07-1974', 'dd-mm-yyyy'), '25', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (137, 'KateCrudup', to_date('21-02-1993', 'dd-mm-yyyy'), '12', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (138, 'HalEdmunds', to_date('23-08-1980', 'dd-mm-yyyy'), '9', 'Pediatric Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (139, 'PatriciaMcCracken', to_date('03-06-1984', 'dd-mm-yyyy'), '6', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (140, 'BuffyRoth', to_date('19-12-1989', 'dd-mm-yyyy'), '12', 'Pediatric Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (141, 'WoodyIrons', to_date('06-09-1984', 'dd-mm-yyyy'), '21', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (142, 'RadeMcDowall', to_date('26-04-1977', 'dd-mm-yyyy'), '17', 'Disaster Management');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (143, 'Jonny LeeThornton', to_date('13-04-1974', 'dd-mm-yyyy'), '19', '''Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (144, 'GeorgeGooding', to_date('13-04-1982', 'dd-mm-yyyy'), '19', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (145, 'JavonHarrison', to_date('05-09-1991', 'dd-mm-yyyy'), '28', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (146, 'NigelMacy', to_date('18-07-1973', 'dd-mm-yyyy'), '7', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (147, 'IsaacHoliday', to_date('05-04-1980', 'dd-mm-yyyy'), '20', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (148, 'BelindaRowlands', to_date('10-09-1999', 'dd-mm-yyyy'), '30', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (149, 'DebbieWheel', to_date('22-04-1978', 'dd-mm-yyyy'), '17', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (150, 'CourtneyQuatro', to_date('11-05-1982', 'dd-mm-yyyy'), '5', 'Disaster Management');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (151, 'MaxineRoy Parnell', to_date('22-07-1996', 'dd-mm-yyyy'), '27', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (152, 'HectorWitt', to_date('08-12-1989', 'dd-mm-yyyy'), '23', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (153, 'PamPeniston', to_date('04-06-1995', 'dd-mm-yyyy'), '17', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (154, 'RosarioCaine', to_date('12-12-1996', 'dd-mm-yyyy'), '30', '''Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (155, 'DiamondWesterberg', to_date('03-11-1973', 'dd-mm-yyyy'), '16', 'Disaster Management');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (156, 'NoahPearce', to_date('30-10-1977', 'dd-mm-yyyy'), '22', '''Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (157, 'YolandaNeil', to_date('12-11-1973', 'dd-mm-yyyy'), '25', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (158, 'SteveSepulveda', to_date('16-01-1971', 'dd-mm-yyyy'), '15', 'Disaster Management');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (159, 'AllanStatham', to_date('07-06-1993', 'dd-mm-yyyy'), '24', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (160, 'JoshWolf', to_date('08-12-1981', 'dd-mm-yyyy'), '22', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (161, 'Mary-LouiseKeaton', to_date('03-10-1973', 'dd-mm-yyyy'), '23', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (162, 'JulietteSkarsgard', to_date('22-07-1997', 'dd-mm-yyyy'), '1', 'Pediatric Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (163, 'LarryHoly', to_date('15-12-1971', 'dd-mm-yyyy'), '7', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (164, 'ChubbyRobinson', to_date('03-08-1975', 'dd-mm-yyyy'), '2', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (165, 'JarvisTaylor', to_date('14-02-1993', 'dd-mm-yyyy'), '4', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (166, 'HugoHenstridge', to_date('30-06-1989', 'dd-mm-yyyy'), '4', '''Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (167, 'AnitaCurry', to_date('14-06-1983', 'dd-mm-yyyy'), '26', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (168, 'JayMcFadden', to_date('14-11-1994', 'dd-mm-yyyy'), '26', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (169, 'JavonGoldwyn', to_date('25-07-1976', 'dd-mm-yyyy'), '22', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (170, 'JarvisElwes', to_date('19-06-1974', 'dd-mm-yyyy'), '4', 'Pediatric Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (171, 'ChadStreet', to_date('23-07-1983', 'dd-mm-yyyy'), '15', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (172, 'JulianaMcDonald', to_date('09-10-1993', 'dd-mm-yyyy'), '2', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (173, 'GilbertMueller-Stahl', to_date('02-04-1982', 'dd-mm-yyyy'), '25', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (174, 'NicoleChung', to_date('16-09-1991', 'dd-mm-yyyy'), '26', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (175, 'JavonTurner', to_date('08-09-1977', 'dd-mm-yyyy'), '10', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (176, 'RuebenLogue', to_date('04-02-1984', 'dd-mm-yyyy'), '30', 'Disaster Management');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (177, 'MerrileeSandoval', to_date('07-02-1993', 'dd-mm-yyyy'), '28', '''Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (178, 'BurtAaron', to_date('04-02-1998', 'dd-mm-yyyy'), '17', 'Disaster Management');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (179, 'DerekMoffat', to_date('02-11-1972', 'dd-mm-yyyy'), '9', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (180, 'CeCeDawson', to_date('03-05-1985', 'dd-mm-yyyy'), '2', 'Disaster Management');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (181, 'RodneyRanger', to_date('03-05-1975', 'dd-mm-yyyy'), '6', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (182, 'LorenStarr', to_date('04-12-1986', 'dd-mm-yyyy'), '9', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (183, 'EwanCrosby', to_date('27-12-1989', 'dd-mm-yyyy'), '18', 'Pediatric Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (184, 'ReneO''Hara', to_date('08-03-1977', 'dd-mm-yyyy'), '4', 'Pediatric Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (185, 'HollandBandy', to_date('21-03-1985', 'dd-mm-yyyy'), '15', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (186, 'EddiePride', to_date('02-01-1991', 'dd-mm-yyyy'), '12', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (187, 'BenKaryo', to_date('26-08-1971', 'dd-mm-yyyy'), '22', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (188, 'JoelySchock', to_date('30-09-1994', 'dd-mm-yyyy'), '16', 'Pediatric Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (189, 'TyCalle', to_date('24-04-1982', 'dd-mm-yyyy'), '26', 'Disaster Management');
commit;
prompt 100 records committed...
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (190, 'LoreenaCrystal', to_date('11-11-1978', 'dd-mm-yyyy'), '18', '''Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (191, 'ThoraKutcher', to_date('09-08-1996', 'dd-mm-yyyy'), '20', '''Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (192, 'NatalieStreep', to_date('04-04-1974', 'dd-mm-yyyy'), '19', 'Disaster Management');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (193, 'BoPrice', to_date('10-12-1974', 'dd-mm-yyyy'), '29', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (194, 'RikEnglish', to_date('15-07-1990', 'dd-mm-yyyy'), '15', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (195, 'JaneCoolidge', to_date('05-05-1991', 'dd-mm-yyyy'), '9', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (196, 'EmmylouGryner', to_date('10-04-1984', 'dd-mm-yyyy'), '12', 'Pediatric Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (197, 'AliciaGarcia', to_date('27-03-1991', 'dd-mm-yyyy'), '2', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (198, 'LarenzGunton', to_date('28-10-1996', 'dd-mm-yyyy'), '24', 'Disaster Management');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (199, 'Jean-LucPacino', to_date('19-03-1995', 'dd-mm-yyyy'), '28', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (200, 'BrentHauser', to_date('14-03-1985', 'dd-mm-yyyy'), '20', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (201, 'JulioAli', to_date('14-06-1976', 'dd-mm-yyyy'), '25', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (202, 'HumbertoGracie', to_date('26-05-1993', 'dd-mm-yyyy'), '16', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (203, 'SpikeWillard', to_date('04-12-1973', 'dd-mm-yyyy'), '23', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (204, 'KieranWeiss', to_date('13-02-1977', 'dd-mm-yyyy'), '24', 'Pediatric Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (205, 'TerrenceRandal', to_date('10-12-1994', 'dd-mm-yyyy'), '4', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (206, 'MillaKingsley', to_date('17-09-1978', 'dd-mm-yyyy'), '7', '''Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (207, 'DarFirth', to_date('06-04-1983', 'dd-mm-yyyy'), '17', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (208, 'MarleyEaston', to_date('24-09-1993', 'dd-mm-yyyy'), '1', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (209, 'BillFlemyng', to_date('13-06-1982', 'dd-mm-yyyy'), '12', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (210, 'Mary-LouiseBrandt', to_date('28-01-1982', 'dd-mm-yyyy'), '8', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (211, 'WalterZahn', to_date('03-09-1992', 'dd-mm-yyyy'), '18', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (212, 'SolomonCockburn', to_date('13-06-1977', 'dd-mm-yyyy'), '22', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (213, 'SeanEastwood', to_date('05-02-1982', 'dd-mm-yyyy'), '3', 'Pediatric Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (214, 'ColinSarsgaard', to_date('07-11-1985', 'dd-mm-yyyy'), '14', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (215, 'ClayWalsh', to_date('01-10-1975', 'dd-mm-yyyy'), '12', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (216, 'SwoosieFuray', to_date('16-05-1998', 'dd-mm-yyyy'), '3', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (217, 'MauryMadonna', to_date('04-11-1974', 'dd-mm-yyyy'), '11', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (218, 'LorettaImperioli', to_date('14-02-1983', 'dd-mm-yyyy'), '14', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (219, 'BobbiWhitwam', to_date('14-01-1982', 'dd-mm-yyyy'), '27', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (220, 'LukeSnider', to_date('11-04-1997', 'dd-mm-yyyy'), '17', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (221, 'JoshuaPresley', to_date('04-08-1982', 'dd-mm-yyyy'), '4', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (222, 'LeonShearer', to_date('08-10-1999', 'dd-mm-yyyy'), '6', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (223, 'SineadMacy', to_date('06-05-1972', 'dd-mm-yyyy'), '18', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (224, 'MerrileeElizondo', to_date('07-04-1980', 'dd-mm-yyyy'), '12', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (225, 'DustinArden', to_date('19-11-1989', 'dd-mm-yyyy'), '28', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (226, 'ColinHeston', to_date('11-05-1977', 'dd-mm-yyyy'), '24', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (227, 'ChristopherSkarsgard', to_date('19-12-1986', 'dd-mm-yyyy'), '30', 'Disaster Management');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (228, 'FairuzaDomino', to_date('31-03-1980', 'dd-mm-yyyy'), '12', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (229, 'CyndiMifune', to_date('30-04-1987', 'dd-mm-yyyy'), '5', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (230, 'DionneBroza', to_date('09-10-1990', 'dd-mm-yyyy'), '26', 'Disaster Management');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (231, 'GinoThompson', to_date('25-11-1993', 'dd-mm-yyyy'), '20', 'Pediatric Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (232, 'QueenEl-Saher', to_date('24-11-1977', 'dd-mm-yyyy'), '1', 'Pediatric Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (233, 'MelbaQuatro', to_date('12-08-1997', 'dd-mm-yyyy'), '13', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (234, 'ThinBacharach', to_date('27-11-1991', 'dd-mm-yyyy'), '6', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (235, 'FisherLaw', to_date('11-08-1971', 'dd-mm-yyyy'), '18', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (236, 'RussellHeston', to_date('07-04-1982', 'dd-mm-yyyy'), '30', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (237, 'TemueraMills', to_date('21-05-1982', 'dd-mm-yyyy'), '23', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (238, 'AngelinaTisdale', to_date('17-06-1988', 'dd-mm-yyyy'), '12', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (249, 'DomingoBaker', to_date('06-10-1977', 'dd-mm-yyyy'), '10', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (250, 'LeonJackson', to_date('16-05-1997', 'dd-mm-yyyy'), '20', 'Pediatric Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (251, 'MosForster', to_date('17-05-1990', 'dd-mm-yyyy'), '14', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (252, 'RodO''Donnell', to_date('29-05-1990', 'dd-mm-yyyy'), '2', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (253, 'KeanuVega', to_date('02-04-1999', 'dd-mm-yyyy'), '17', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (254, 'NilsMcClinton', to_date('05-10-1984', 'dd-mm-yyyy'), '15', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (255, 'RonnieNuman', to_date('03-07-1993', 'dd-mm-yyyy'), '18', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (256, 'LaurieMadonna', to_date('04-06-1991', 'dd-mm-yyyy'), '28', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (257, 'MiraSpader', to_date('07-10-1985', 'dd-mm-yyyy'), '1', '''Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (258, 'LarryBarkin', to_date('07-10-1988', 'dd-mm-yyyy'), '13', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (259, 'AimeeHatchet', to_date('25-03-1998', 'dd-mm-yyyy'), '23', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (260, 'WilliamRifkin', to_date('26-09-1981', 'dd-mm-yyyy'), '12', '''Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (261, 'ArturoBuckingham', to_date('14-10-1987', 'dd-mm-yyyy'), '14', '''Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (262, 'ParkerBoothe', to_date('20-08-1979', 'dd-mm-yyyy'), '4', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (263, 'JuniorGershon', to_date('08-07-1999', 'dd-mm-yyyy'), '8', 'Disaster Management');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (264, 'HowardMacIsaac', to_date('16-04-1983', 'dd-mm-yyyy'), '1', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (265, 'AhmadBreslin', to_date('10-03-1987', 'dd-mm-yyyy'), '17', '''Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (266, 'HelenNorton', to_date('27-08-1988', 'dd-mm-yyyy'), '20', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (267, 'GilZappacosta', to_date('13-04-1976', 'dd-mm-yyyy'), '23', 'Pediatric Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (268, 'NedMurray', to_date('08-12-1991', 'dd-mm-yyyy'), '4', 'Pediatric Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (269, 'JudeSupernaw', to_date('16-01-1989', 'dd-mm-yyyy'), '29', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (270, 'PatriciaHaslam', to_date('24-10-1977', 'dd-mm-yyyy'), '16', 'Pediatric Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (271, 'NeveWinslet', to_date('02-04-1986', 'dd-mm-yyyy'), '21', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (272, 'JosephVega', to_date('04-05-1979', 'dd-mm-yyyy'), '3', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (273, 'YolandaCeasar', to_date('13-04-1986', 'dd-mm-yyyy'), '18', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (274, 'EthanCoughlan', to_date('26-01-1992', 'dd-mm-yyyy'), '23', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (275, 'AlbertinaSingh', to_date('20-02-1973', 'dd-mm-yyyy'), '11', '''Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (276, 'IkeDeVita', to_date('17-07-1978', 'dd-mm-yyyy'), '30', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (277, 'DesmondShalhoub', to_date('05-07-1980', 'dd-mm-yyyy'), '22', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (278, 'SophieValentin', to_date('08-04-1988', 'dd-mm-yyyy'), '29', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (279, 'MerilleeCattrall', to_date('12-03-1983', 'dd-mm-yyyy'), '20', '''Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (280, 'FamkeGary', to_date('30-11-1995', 'dd-mm-yyyy'), '30', '''Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (281, 'DebraGallagher', to_date('20-10-1979', 'dd-mm-yyyy'), '26', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (282, 'NicolasReynolds', to_date('13-01-1972', 'dd-mm-yyyy'), '30', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (283, 'RoryDafoe', to_date('20-08-1995', 'dd-mm-yyyy'), '5', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (284, 'JesusFonda', to_date('09-08-1979', 'dd-mm-yyyy'), '8', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (285, 'ThelmaAlmond', to_date('05-09-1991', 'dd-mm-yyyy'), '10', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (286, 'JonathanWalker', to_date('23-07-1971', 'dd-mm-yyyy'), '5', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (287, 'AndyBedelia', to_date('12-01-1989', 'dd-mm-yyyy'), '20', '''Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (288, 'WesAtkins', to_date('24-02-1992', 'dd-mm-yyyy'), '1', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (289, 'LennyDonelly', to_date('11-02-1977', 'dd-mm-yyyy'), '17', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (290, 'AndreGosdin', to_date('22-09-1984', 'dd-mm-yyyy'), '3', '''Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (291, 'DianeCromwell', to_date('16-02-1973', 'dd-mm-yyyy'), '25', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (292, 'FranceWeiss', to_date('12-06-1992', 'dd-mm-yyyy'), '12', '''Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (293, 'ChaleeIsaacs', to_date('02-11-1978', 'dd-mm-yyyy'), '15', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (294, 'DionneStanley', to_date('08-06-1983', 'dd-mm-yyyy'), '9', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (295, 'Jean-ClaudeMcKean', to_date('28-02-1993', 'dd-mm-yyyy'), '13', 'Disaster Management');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (296, 'StephanieWarwick', to_date('31-08-1989', 'dd-mm-yyyy'), '3', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (297, 'TildaPalmer', to_date('31-08-1984', 'dd-mm-yyyy'), '20', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (298, 'TreyHead', to_date('17-07-1976', 'dd-mm-yyyy'), '3', 'Pediatric Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (299, 'KaronStallone', to_date('18-03-1971', 'dd-mm-yyyy'), '12', 'Advanced Life Support');
commit;
prompt 200 records committed...
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (300, 'AimeeMalkovich', to_date('28-04-1989', 'dd-mm-yyyy'), '23', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (301, 'OmarVan Helden', to_date('27-03-1994', 'dd-mm-yyyy'), '7', 'Pediatric Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (302, 'CoreyHunter', to_date('07-05-1990', 'dd-mm-yyyy'), '9', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (303, 'JoeEdmunds', to_date('27-07-1976', 'dd-mm-yyyy'), '5', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (304, 'DeborahAiken', to_date('26-02-1999', 'dd-mm-yyyy'), '6', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (305, 'JenaAdams', to_date('29-10-1984', 'dd-mm-yyyy'), '12', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (306, 'DonaldAmmons', to_date('05-01-1983', 'dd-mm-yyyy'), '12', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (307, 'IvanMakeba', to_date('04-10-1994', 'dd-mm-yyyy'), '21', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (308, 'LievWhitley', to_date('05-12-1979', 'dd-mm-yyyy'), '3', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (309, 'CliveMellencamp', to_date('12-08-1989', 'dd-mm-yyyy'), '4', '''Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (310, 'TriniRain', to_date('20-10-1986', 'dd-mm-yyyy'), '6', 'Disaster Management');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (311, 'RoscoElliott', to_date('29-01-1982', 'dd-mm-yyyy'), '3', 'Pediatric Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (312, 'RufusPalin', to_date('07-11-1993', 'dd-mm-yyyy'), '7', 'Disaster Management');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (313, 'QuentinDuschel', to_date('12-02-1999', 'dd-mm-yyyy'), '27', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (314, 'GabrielleDalley', to_date('10-08-1999', 'dd-mm-yyyy'), '9', 'Disaster Management');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (315, 'ArmandEder', to_date('20-05-1980', 'dd-mm-yyyy'), '29', 'Pediatric Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (316, 'JuddBiehn', to_date('15-10-1970', 'dd-mm-yyyy'), '17', '''Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (317, 'LaraWillard', to_date('10-02-1974', 'dd-mm-yyyy'), '19', 'Pediatric Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (318, 'RadeWillis', to_date('04-08-1994', 'dd-mm-yyyy'), '9', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (319, 'CarrieNavarro', to_date('23-12-1983', 'dd-mm-yyyy'), '27', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (320, 'TomWilliamson', to_date('03-11-1989', 'dd-mm-yyyy'), '10', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (321, 'SamRed', to_date('21-10-1995', 'dd-mm-yyyy'), '23', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (322, 'BenicioShaye', to_date('31-05-1974', 'dd-mm-yyyy'), '22', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (323, 'DonBaker', to_date('01-04-1978', 'dd-mm-yyyy'), '4', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (324, 'FredericMcGill', to_date('19-07-1971', 'dd-mm-yyyy'), '30', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (325, 'JohnnieLineback', to_date('21-07-1986', 'dd-mm-yyyy'), '15', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (326, 'AndraeBotti', to_date('29-11-1973', 'dd-mm-yyyy'), '1', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (327, 'KieranHoleman', to_date('12-01-1977', 'dd-mm-yyyy'), '14', '''Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (328, 'WillemPastore', to_date('14-04-1993', 'dd-mm-yyyy'), '29', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (329, 'VanessaBridges', to_date('18-11-1971', 'dd-mm-yyyy'), '18', '''Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (330, 'KurtwoodDuvall', to_date('03-09-1982', 'dd-mm-yyyy'), '13', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (331, 'ShelbyHedaya', to_date('04-04-1983', 'dd-mm-yyyy'), '25', '''Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (332, 'GarryFehr', to_date('04-02-1988', 'dd-mm-yyyy'), '18', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (333, 'NeilTolkan', to_date('12-02-1972', 'dd-mm-yyyy'), '3', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (334, 'GinCarrington', to_date('10-05-1976', 'dd-mm-yyyy'), '22', 'Pediatric Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (335, 'CharlizeViterelli', to_date('12-11-1984', 'dd-mm-yyyy'), '9', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (336, 'MarlonTucker', to_date('01-07-1994', 'dd-mm-yyyy'), '2', 'Disaster Management');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (337, 'AlbertBeals', to_date('26-05-1999', 'dd-mm-yyyy'), '26', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (338, 'TyroneBush', to_date('26-03-1983', 'dd-mm-yyyy'), '8', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (339, 'ThomasWhitaker', to_date('12-08-1985', 'dd-mm-yyyy'), '18', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (340, 'CeliaHeatherly', to_date('03-08-1972', 'dd-mm-yyyy'), '23', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (341, 'RebekaParish', to_date('11-05-1983', 'dd-mm-yyyy'), '3', 'Disaster Management');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (342, 'ClaireMcBride', to_date('11-10-1999', 'dd-mm-yyyy'), '10', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (343, 'IlleanaChao', to_date('11-09-1987', 'dd-mm-yyyy'), '16', 'Disaster Management');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (344, 'LionelYoung', to_date('26-11-1978', 'dd-mm-yyyy'), '24', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (345, 'DonalPorter', to_date('17-03-1996', 'dd-mm-yyyy'), '21', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (346, 'JoelyKretschmann', to_date('24-10-1996', 'dd-mm-yyyy'), '1', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (347, 'KaseyZane', to_date('11-10-1970', 'dd-mm-yyyy'), '2', 'Disaster Management');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (348, 'KurtwoodHawthorne', to_date('13-05-1970', 'dd-mm-yyyy'), '12', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (349, 'ChantיMeniketti', to_date('16-08-1985', 'dd-mm-yyyy'), '27', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (350, 'AnnieFierstein', to_date('06-01-1995', 'dd-mm-yyyy'), '14', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (351, 'AmyWahlberg', to_date('24-06-1979', 'dd-mm-yyyy'), '9', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (352, 'RachidMoore', to_date('10-11-1984', 'dd-mm-yyyy'), '7', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (353, 'ClaireHawthorne', to_date('18-01-1971', 'dd-mm-yyyy'), '19', 'Pediatric Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (354, 'GloriaEaston', to_date('24-03-1986', 'dd-mm-yyyy'), '11', 'Pediatric Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (355, 'JudiBlackmore', to_date('09-10-1988', 'dd-mm-yyyy'), '14', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (356, 'DiamondCaan', to_date('05-09-1983', 'dd-mm-yyyy'), '10', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (357, 'JuddLeoni', to_date('05-11-1986', 'dd-mm-yyyy'), '9', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (358, 'GordJudd', to_date('11-07-1994', 'dd-mm-yyyy'), '28', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (359, 'VingOrlando', to_date('01-06-1974', 'dd-mm-yyyy'), '1', '''Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (360, 'GuyHenstridge', to_date('20-05-1998', 'dd-mm-yyyy'), '22', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (361, 'RuthWeber', to_date('02-01-1993', 'dd-mm-yyyy'), '18', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (362, 'SalBrowne', to_date('19-05-1978', 'dd-mm-yyyy'), '6', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (363, 'BrothersSchwimmer', to_date('15-11-1992', 'dd-mm-yyyy'), '20', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (364, 'RufusClayton', to_date('17-05-1972', 'dd-mm-yyyy'), '11', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (365, 'IceRandal', to_date('07-09-1981', 'dd-mm-yyyy'), '8', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (366, 'MickyCockburn', to_date('08-11-1972', 'dd-mm-yyyy'), '14', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (367, 'BrothersMcCain', to_date('25-10-1992', 'dd-mm-yyyy'), '28', 'Disaster Management');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (368, 'WendyMorrison', to_date('18-09-1984', 'dd-mm-yyyy'), '10', 'Disaster Management');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (369, 'JodieSmurfit', to_date('23-05-1975', 'dd-mm-yyyy'), '25', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (370, 'JoannaDaniels', to_date('27-03-1978', 'dd-mm-yyyy'), '10', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (371, 'FayeOrton', to_date('08-09-1987', 'dd-mm-yyyy'), '26', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (372, 'MikeMcCready', to_date('27-05-1991', 'dd-mm-yyyy'), '6', '''Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (373, 'JonBrooke', to_date('29-01-1980', 'dd-mm-yyyy'), '16', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (374, 'LisaWheel', to_date('04-01-1979', 'dd-mm-yyyy'), '21', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (375, 'PierceIsaacs', to_date('16-05-1996', 'dd-mm-yyyy'), '7', '''Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (376, 'SonaHolly', to_date('13-10-1996', 'dd-mm-yyyy'), '20', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (377, 'EwanMann', to_date('07-12-1993', 'dd-mm-yyyy'), '29', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (378, 'VendettaBonham', to_date('06-08-1974', 'dd-mm-yyyy'), '13', 'Disaster Management');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (379, 'SimonRockwell', to_date('27-07-1976', 'dd-mm-yyyy'), '30', '''Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (380, 'ShannonWeiss', to_date('11-03-1985', 'dd-mm-yyyy'), '8', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (381, 'JoshuaKadison', to_date('22-02-1970', 'dd-mm-yyyy'), '18', 'Pediatric Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (382, 'EricCarter', to_date('14-09-1970', 'dd-mm-yyyy'), '22', 'Pediatric Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (383, 'XanderCazale', to_date('07-10-1982', 'dd-mm-yyyy'), '1', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (384, 'DevonChesnutt', to_date('16-07-1970', 'dd-mm-yyyy'), '30', 'Pediatric Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (385, 'SolomonRichter', to_date('27-05-1999', 'dd-mm-yyyy'), '6', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (386, 'RoscoeShelton', to_date('15-10-1977', 'dd-mm-yyyy'), '12', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (387, 'JudySnipes', to_date('23-06-1978', 'dd-mm-yyyy'), '9', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (388, 'JeannePayne', to_date('12-12-1988', 'dd-mm-yyyy'), '3', 'Pediatric Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (389, 'BrianSkarsgard', to_date('22-06-1995', 'dd-mm-yyyy'), '13', 'Disaster Management');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (390, 'KayRoy Parnell', to_date('13-06-1980', 'dd-mm-yyyy'), '18', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (391, 'RitaHanks', to_date('09-09-1999', 'dd-mm-yyyy'), '15', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (392, 'LeonCurfman', to_date('26-02-1987', 'dd-mm-yyyy'), '24', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (393, 'KirkTobolowsky', to_date('24-07-1974', 'dd-mm-yyyy'), '9', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (394, 'GarthMandrell', to_date('18-03-1999', 'dd-mm-yyyy'), '22', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (395, 'JodieConnery', to_date('11-02-1994', 'dd-mm-yyyy'), '23', 'Pediatric Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (396, 'GranPalmer', to_date('10-10-1986', 'dd-mm-yyyy'), '24', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (397, 'RoddyBrothers', to_date('13-10-1986', 'dd-mm-yyyy'), '18', '''Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (398, 'BretRoot', to_date('27-07-1983', 'dd-mm-yyyy'), '12', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (399, 'AlanIrving', to_date('18-03-1988', 'dd-mm-yyyy'), '27', 'Infection Control');
commit;
prompt 300 records committed...
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (400, 'AlexBalaban', to_date('12-02-1982', 'dd-mm-yyyy'), '12', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (401, 'DaveKeen', to_date('11-07-1995', 'dd-mm-yyyy'), '26', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (402, 'BrothersHarmon', to_date('01-10-1972', 'dd-mm-yyyy'), '22', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (403, 'GrahamO''Connor', to_date('19-07-1981', 'dd-mm-yyyy'), '6', 'Pediatric Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (404, 'RobbyFarris', to_date('16-09-1996', 'dd-mm-yyyy'), '6', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (405, 'CeliaCole', to_date('14-12-1977', 'dd-mm-yyyy'), '2', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (406, 'DanniKimball', to_date('15-01-1978', 'dd-mm-yyyy'), '17', 'Pediatric Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (407, 'BarbaraAllison', to_date('19-07-1995', 'dd-mm-yyyy'), '1', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (408, 'WalterLlewelyn', to_date('05-03-1981', 'dd-mm-yyyy'), '5', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (409, 'NenehPatton', to_date('24-06-1987', 'dd-mm-yyyy'), '24', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (410, 'HollyFlatts', to_date('08-02-1978', 'dd-mm-yyyy'), '12', '''Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (411, 'JeroenSummer', to_date('09-02-1991', 'dd-mm-yyyy'), '16', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (412, 'GuyNelligan', to_date('12-08-1992', 'dd-mm-yyyy'), '24', '''Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (413, 'DebiSossamon', to_date('08-06-1986', 'dd-mm-yyyy'), '14', 'Pediatric Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (414, 'ViggoDunst', to_date('31-03-1976', 'dd-mm-yyyy'), '16', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (415, 'MarieBalk', to_date('03-03-1977', 'dd-mm-yyyy'), '4', '''Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (416, 'KelliPenders', to_date('05-03-1993', 'dd-mm-yyyy'), '22', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (417, 'ZooeyVicious', to_date('09-10-1984', 'dd-mm-yyyy'), '10', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (418, 'NikkaWilliams', to_date('08-12-1985', 'dd-mm-yyyy'), '9', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (419, 'ShawnFisher', to_date('23-09-1979', 'dd-mm-yyyy'), '27', '''Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (420, 'HopeCondition', to_date('07-12-1992', 'dd-mm-yyyy'), '20', 'Pediatric Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (421, 'NatachaCruise', to_date('15-01-1978', 'dd-mm-yyyy'), '2', 'Pediatric Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (422, 'ReneUnion', to_date('01-08-1998', 'dd-mm-yyyy'), '16', 'Disaster Management');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (423, 'SonnyPiven', to_date('30-04-1998', 'dd-mm-yyyy'), '18', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (424, 'AimeeO''Neal', to_date('08-10-1979', 'dd-mm-yyyy'), '28', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (425, 'CledusMcFadden', to_date('31-05-1995', 'dd-mm-yyyy'), '22', 'Pediatric Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (426, 'DarCarrey', to_date('06-12-1994', 'dd-mm-yyyy'), '2', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (427, 'PelvicKirkwood', to_date('15-08-1994', 'dd-mm-yyyy'), '10', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (428, 'HectorMattea', to_date('11-05-1986', 'dd-mm-yyyy'), '26', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (429, 'RussellJanssen', to_date('08-02-1976', 'dd-mm-yyyy'), '2', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (430, 'ChristmasSandoval', to_date('15-12-1978', 'dd-mm-yyyy'), '1', 'Pediatric Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (431, 'SeannHeslov', to_date('01-12-1994', 'dd-mm-yyyy'), '2', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (432, 'RosannaAmos', to_date('29-12-1991', 'dd-mm-yyyy'), '17', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (433, 'JaniceLapointe', to_date('18-11-1979', 'dd-mm-yyyy'), '19', 'Pediatric Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (434, 'KathyWood', to_date('23-09-1990', 'dd-mm-yyyy'), '25', 'Disaster Management');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (435, 'AlanaGaines', to_date('14-05-1976', 'dd-mm-yyyy'), '30', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (436, 'HoraceWinger', to_date('29-04-1994', 'dd-mm-yyyy'), '2', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (437, 'Carrie-AnneKelly', to_date('03-01-1985', 'dd-mm-yyyy'), '26', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (438, 'BurtonRivers', to_date('14-02-1972', 'dd-mm-yyyy'), '7', 'Pediatric Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (439, 'GraceShort', to_date('25-09-1993', 'dd-mm-yyyy'), '5', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (440, 'AlannahGriffiths', to_date('24-09-1993', 'dd-mm-yyyy'), '28', 'Disaster Management');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (441, 'JohnnieAdkins', to_date('17-05-1974', 'dd-mm-yyyy'), '18', 'Pediatric Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (442, 'CarolineGary', to_date('20-09-1996', 'dd-mm-yyyy'), '16', 'Pediatric Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (443, 'BernieLaMond', to_date('01-05-1991', 'dd-mm-yyyy'), '20', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (444, 'LorettaLevin', to_date('07-06-1970', 'dd-mm-yyyy'), '20', 'Disaster Management');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (445, 'AliStarr', to_date('07-02-1998', 'dd-mm-yyyy'), '7', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (446, 'BeverleyBelle', to_date('14-12-1972', 'dd-mm-yyyy'), '23', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (447, 'RobbyBryson', to_date('09-02-1982', 'dd-mm-yyyy'), '22', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (448, 'CarolGatlin', to_date('15-01-1972', 'dd-mm-yyyy'), '11', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (449, 'EricLeto', to_date('28-05-1998', 'dd-mm-yyyy'), '21', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (450, 'JulietLaurie', to_date('21-09-1976', 'dd-mm-yyyy'), '23', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (451, 'FredaRossellini', to_date('28-06-1993', 'dd-mm-yyyy'), '9', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (452, 'QueenCazale', to_date('07-09-1986', 'dd-mm-yyyy'), '26', 'Pediatric Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (453, 'AvengedMandrell', to_date('28-12-1999', 'dd-mm-yyyy'), '27', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (454, 'KarenShorter', to_date('17-07-1977', 'dd-mm-yyyy'), '6', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (455, 'SpikeWebb', to_date('26-11-1996', 'dd-mm-yyyy'), '19', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (456, 'AngelinaRucker', to_date('11-05-1974', 'dd-mm-yyyy'), '4', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (457, 'CharliePalmer', to_date('07-10-1986', 'dd-mm-yyyy'), '8', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (458, 'JoyCaviezel', to_date('12-07-1979', 'dd-mm-yyyy'), '25', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (459, 'GregMazar', to_date('18-08-1985', 'dd-mm-yyyy'), '23', 'Disaster Management');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (460, 'AhmadRosas', to_date('30-08-1986', 'dd-mm-yyyy'), '15', '''Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (461, 'GiancarloYorn', to_date('04-03-1993', 'dd-mm-yyyy'), '25', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (462, 'SharonMraz', to_date('06-03-1986', 'dd-mm-yyyy'), '9', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (463, 'WendyZellweger', to_date('26-11-1982', 'dd-mm-yyyy'), '9', 'Disaster Management');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (464, 'SpencerGriggs', to_date('05-08-1982', 'dd-mm-yyyy'), '26', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (465, 'TommyBenet', to_date('16-11-1985', 'dd-mm-yyyy'), '14', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (466, 'KennyRenfro', to_date('01-05-1985', 'dd-mm-yyyy'), '6', 'Pediatric Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (467, 'DeniseIrving', to_date('26-11-1979', 'dd-mm-yyyy'), '11', '''Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (468, 'HexSenior', to_date('12-07-1975', 'dd-mm-yyyy'), '22', 'Pediatric Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (469, 'DenzelSmith', to_date('09-02-1989', 'dd-mm-yyyy'), '24', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (470, 'HarrisonMcCain', to_date('23-03-1978', 'dd-mm-yyyy'), '25', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (471, 'JudiAtlas', to_date('21-07-1990', 'dd-mm-yyyy'), '14', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (472, 'AdamHolden', to_date('26-01-1984', 'dd-mm-yyyy'), '30', 'Pediatric Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (473, 'RodHynde', to_date('04-07-1984', 'dd-mm-yyyy'), '7', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (474, 'EmbethCassidy', to_date('14-01-1994', 'dd-mm-yyyy'), '4', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (475, 'DanniPage', to_date('07-10-1997', 'dd-mm-yyyy'), '21', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (476, 'NickyStatham', to_date('30-11-1986', 'dd-mm-yyyy'), '18', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (477, 'JonathaGibson', to_date('10-08-1993', 'dd-mm-yyyy'), '28', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (478, 'CharlesJovovich', to_date('08-11-1978', 'dd-mm-yyyy'), '26', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (479, 'RodHornsby', to_date('04-02-1993', 'dd-mm-yyyy'), '28', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (480, 'AimeeCale', to_date('15-05-1999', 'dd-mm-yyyy'), '18', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (481, 'CollinMirren', to_date('22-11-1978', 'dd-mm-yyyy'), '1', 'Pediatric Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (482, 'ThomasLyonne', to_date('04-06-1995', 'dd-mm-yyyy'), '23', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (483, 'MacWoodard', to_date('27-04-1989', 'dd-mm-yyyy'), '9', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (484, 'FrancoSobieski', to_date('17-09-1976', 'dd-mm-yyyy'), '5', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (485, 'JuliannaCeasar', to_date('11-08-1986', 'dd-mm-yyyy'), '13', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (486, 'WesLove', to_date('27-08-1977', 'dd-mm-yyyy'), '3', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (487, 'GatesMason', to_date('29-01-1983', 'dd-mm-yyyy'), '13', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (488, 'SherylAvalon', to_date('11-01-1977', 'dd-mm-yyyy'), '26', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (489, 'AaronSnow', to_date('04-03-1972', 'dd-mm-yyyy'), '22', '''Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (490, 'SusanPresley', to_date('16-03-1971', 'dd-mm-yyyy'), '16', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (491, 'EttaDeLuise', to_date('20-12-1971', 'dd-mm-yyyy'), '23', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (492, 'WangHong', to_date('12-09-1973', 'dd-mm-yyyy'), '22', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (493, 'CharlizePortman', to_date('16-05-1986', 'dd-mm-yyyy'), '4', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (494, 'NileDunn', to_date('16-02-1999', 'dd-mm-yyyy'), '15', '''Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (495, 'AnjelicaHarrison', to_date('25-03-1988', 'dd-mm-yyyy'), '13', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (496, 'BernardStamp', to_date('21-02-1975', 'dd-mm-yyyy'), '7', 'Pediatric Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (497, 'EwanRippy', to_date('09-04-1998', 'dd-mm-yyyy'), '24', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (498, 'ElizabethPonty', to_date('10-12-1988', 'dd-mm-yyyy'), '19', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (499, 'BetteConnery', to_date('04-07-1998', 'dd-mm-yyyy'), '10', 'Disaster Management');
commit;
prompt 400 records loaded
prompt Loading ROOM...
insert into ROOM (r_id, r_location, numplace, r_type)
values (154, 'Building EFloor 3', 122, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (155, 'Building BFloor 5', 97, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (156, 'Building EFloor 3', 126, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (157, 'Building DFloor 2', 178, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (158, 'Building EFloor 1', 116, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (159, 'Building DFloor 1', 156, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (160, 'Building CFloor 3', 160, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (161, 'Building EFloor 5', 123, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (162, 'Building BFloor 4', 50, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (163, 'Building AFloor 4', 127, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (1, 'Building EFloor 4', 103, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (2, 'Building EFloor 4', 108, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (3, 'Building CFloor 3', 89, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (4, 'Building DFloor 3', 115, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (5, 'Building EFloor 5', 191, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (6, 'Building BFloor 1', 53, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (7, 'Building EFloor 4', 123, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (8, 'Building AFloor 5', 59, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (9, 'Building DFloor 3', 163, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (10, 'Building CFloor 6', 170, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (11, 'Building BFloor 5', 145, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (12, 'Building BFloor 2', 71, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (13, 'Building BFloor 6', 200, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (14, 'Building EFloor 1', 173, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (15, 'Building EFloor 6', 131, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (16, 'Building EFloor 4', 90, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (17, 'Building CFloor 3', 99, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (18, 'Building AFloor 6', 117, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (19, 'Building BFloor 2', 85, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (20, 'Building AFloor 5', 106, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (21, 'Building EFloor 6', 76, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (22, 'Building EFloor 3', 126, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (23, 'Building CFloor 2', 68, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (24, 'Building CFloor 5', 193, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (25, 'Building CFloor 4', 194, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (26, 'Building CFloor 2', 118, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (27, 'Building BFloor 4', 73, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (28, 'Building AFloor 1', 84, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (29, 'Building AFloor 4', 84, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (30, 'Building DFloor 2', 137, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (31, 'Building DFloor 5', 55, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (32, 'Building CFloor 3', 101, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (33, 'Building AFloor 1', 182, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (34, 'Building BFloor 3', 74, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (35, 'Building DFloor 5', 111, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (36, 'Building DFloor 2', 131, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (37, 'Building CFloor 6', 102, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (38, 'Building CFloor 5', 157, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (39, 'Building EFloor 4', 55, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (40, 'Building CFloor 6', 103, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (41, 'Building DFloor 3', 166, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (42, 'Building BFloor 5', 65, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (43, 'Building BFloor 1', 198, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (44, 'Building EFloor 4', 173, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (45, 'Building CFloor 5', 79, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (46, 'Building AFloor 3', 169, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (47, 'Building BFloor 4', 174, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (48, 'Building EFloor 1', 143, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (49, 'Building AFloor 2', 165, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (50, 'Building BFloor 5', 50, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (51, 'Building CFloor 6', 172, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (52, 'Building AFloor 2', 94, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (53, 'Building EFloor 1', 184, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (54, 'Building BFloor 1', 186, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (55, 'Building EFloor 6', 60, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (56, 'Building AFloor 3', 118, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (57, 'Building DFloor 5', 117, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (58, 'Building EFloor 1', 172, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (59, 'Building BFloor 1', 168, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (60, 'Building AFloor 6', 186, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (61, 'Building BFloor 1', 198, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (62, 'Building DFloor 1', 102, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (63, 'Building BFloor 1', 107, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (64, 'Building AFloor 5', 184, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (65, 'Building CFloor 5', 180, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (66, 'Building EFloor 5', 150, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (67, 'Building AFloor 3', 160, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (68, 'Building CFloor 1', 89, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (69, 'Building BFloor 5', 124, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (70, 'Building CFloor 5', 141, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (71, 'Building BFloor 1', 99, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (72, 'Building EFloor 1', 149, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (73, 'Building AFloor 6', 124, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (74, 'Building AFloor 2', 187, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (75, 'Building BFloor 1', 119, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (76, 'Building BFloor 6', 157, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (77, 'Building BFloor 1', 184, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (78, 'Building BFloor 4', 108, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (79, 'Building CFloor 1', 114, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (80, 'Building BFloor 4', 81, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (81, 'Building CFloor 6', 94, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (82, 'Building AFloor 1', 66, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (83, 'Building CFloor 2', 156, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (84, 'Building CFloor 6', 93, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (85, 'Building CFloor 5', 64, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (86, 'Building DFloor 1', 139, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (87, 'Building BFloor 1', 72, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (88, 'Building CFloor 3', 149, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (89, 'Building DFloor 1', 149, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (90, 'Building DFloor 1', 200, 'Conference Room');
commit;
prompt 100 records committed...
insert into ROOM (r_id, r_location, numplace, r_type)
values (91, 'Building AFloor 6', 76, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (92, 'Building BFloor 3', 161, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (93, 'Building DFloor 4', 123, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (94, 'Building AFloor 3', 97, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (95, 'Building AFloor 1', 190, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (96, 'Building BFloor 6', 181, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (97, 'Building DFloor 1', 116, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (98, 'Building DFloor 1', 131, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (99, 'Building DFloor 4', 127, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (100, 'Building BFloor 3', 125, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (101, 'Building BFloor 2', 184, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (102, 'Building DFloor 2', 180, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (103, 'Building CFloor 3', 70, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (104, 'Building EFloor 6', 106, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (105, 'Building DFloor 6', 192, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (106, 'Building DFloor 2', 184, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (107, 'Building BFloor 1', 99, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (108, 'Building EFloor 5', 158, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (109, 'Building EFloor 1', 139, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (110, 'Building BFloor 5', 165, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (111, 'Building EFloor 1', 66, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (112, 'Building AFloor 4', 114, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (113, 'Building EFloor 1', 190, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (114, 'Building BFloor 3', 112, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (115, 'Building BFloor 1', 78, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (116, 'Building EFloor 1', 87, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (117, 'Building CFloor 3', 98, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (118, 'Building BFloor 1', 157, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (119, 'Building DFloor 4', 70, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (120, 'Building AFloor 2', 197, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (121, 'Building CFloor 2', 141, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (122, 'Building CFloor 2', 151, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (123, 'Building AFloor 1', 139, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (124, 'Building AFloor 6', 146, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (125, 'Building DFloor 4', 90, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (126, 'Building DFloor 4', 144, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (127, 'Building DFloor 2', 117, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (128, 'Building BFloor 4', 153, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (129, 'Building EFloor 5', 146, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (130, 'Building DFloor 5', 115, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (131, 'Building AFloor 2', 52, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (132, 'Building CFloor 3', 73, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (133, 'Building CFloor 6', 61, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (134, 'Building DFloor 6', 146, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (135, 'Building DFloor 2', 85, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (136, 'Building DFloor 5', 185, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (137, 'Building DFloor 2', 72, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (138, 'Building DFloor 6', 151, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (139, 'Building CFloor 1', 181, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (140, 'Building DFloor 6', 162, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (141, 'Building EFloor 1', 176, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (142, 'Building BFloor 4', 58, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (143, 'Building BFloor 1', 148, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (144, 'Building AFloor 1', 153, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (145, 'Building AFloor 4', 155, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (146, 'Building BFloor 1', 134, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (147, 'Building CFloor 4', 129, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (148, 'Building CFloor 6', 60, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (149, 'Building EFloor 2', 63, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (150, 'Building DFloor 2', 112, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (151, 'Building DFloor 5', 169, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (152, 'Building AFloor 5', 171, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (153, 'Building EFloor 2', 98, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (164, 'Building CFloor 6', 68, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (165, 'Building DFloor 6', 135, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (166, 'Building AFloor 6', 59, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (167, 'Building BFloor 1', 110, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (168, 'Building CFloor 4', 144, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (169, 'Building DFloor 4', 69, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (170, 'Building CFloor 1', 188, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (171, 'Building BFloor 1', 102, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (172, 'Building DFloor 4', 152, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (173, 'Building DFloor 3', 70, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (174, 'Building BFloor 2', 113, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (175, 'Building DFloor 5', 175, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (176, 'Building BFloor 3', 105, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (177, 'Building AFloor 2', 144, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (178, 'Building DFloor 5', 81, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (179, 'Building AFloor 4', 50, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (180, 'Building AFloor 4', 149, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (181, 'Building CFloor 5', 190, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (182, 'Building CFloor 1', 178, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (183, 'Building AFloor 2', 186, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (184, 'Building EFloor 3', 131, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (185, 'Building AFloor 4', 174, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (186, 'Building DFloor 3', 60, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (187, 'Building BFloor 1', 143, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (188, 'Building DFloor 1', 85, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (189, 'Building CFloor 6', 163, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (190, 'Building DFloor 2', 185, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (191, 'Building DFloor 3', 123, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (192, 'Building BFloor 6', 111, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (193, 'Building DFloor 5', 50, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (194, 'Building BFloor 3', 184, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (195, 'Building BFloor 4', 92, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (196, 'Building CFloor 3', 95, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (197, 'Building AFloor 3', 182, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (198, 'Building CFloor 1', 95, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (199, 'Building AFloor 4', 110, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (200, 'Building DFloor 1', 195, 'Computer Lab');
commit;
prompt 200 records committed...
insert into ROOM (r_id, r_location, numplace, r_type)
values (201, 'Building EFloor 6', 186, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (202, 'Building EFloor 4', 90, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (203, 'Building DFloor 1', 56, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (204, 'Building CFloor 2', 114, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (205, 'Building EFloor 3', 52, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (206, 'Building BFloor 3', 51, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (207, 'Building CFloor 2', 111, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (208, 'Building BFloor 2', 183, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (209, 'Building EFloor 5', 161, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (210, 'Building BFloor 3', 200, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (211, 'Building CFloor 3', 184, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (212, 'Building BFloor 2', 186, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (213, 'Building DFloor 6', 103, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (214, 'Building CFloor 2', 75, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (215, 'Building CFloor 4', 85, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (216, 'Building DFloor 1', 136, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (217, 'Building EFloor 1', 70, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (218, 'Building AFloor 3', 63, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (219, 'Building AFloor 6', 166, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (220, 'Building BFloor 2', 159, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (221, 'Building AFloor 6', 125, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (222, 'Building BFloor 4', 72, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (223, 'Building DFloor 4', 134, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (224, 'Building DFloor 6', 66, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (225, 'Building AFloor 5', 81, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (226, 'Building AFloor 1', 162, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (227, 'Building DFloor 3', 140, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (228, 'Building EFloor 1', 138, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (229, 'Building BFloor 1', 131, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (230, 'Building BFloor 3', 123, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (231, 'Building EFloor 2', 51, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (232, 'Building EFloor 5', 95, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (233, 'Building BFloor 6', 126, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (234, 'Building CFloor 2', 106, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (235, 'Building AFloor 2', 83, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (236, 'Building AFloor 6', 183, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (237, 'Building DFloor 3', 51, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (238, 'Building DFloor 3', 194, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (239, 'Building CFloor 4', 75, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (240, 'Building BFloor 4', 145, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (241, 'Building BFloor 1', 56, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (242, 'Building BFloor 1', 137, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (243, 'Building CFloor 6', 118, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (244, 'Building AFloor 1', 157, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (245, 'Building EFloor 3', 184, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (246, 'Building EFloor 6', 128, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (247, 'Building DFloor 2', 135, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (248, 'Building AFloor 2', 97, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (249, 'Building BFloor 6', 92, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (250, 'Building AFloor 1', 78, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (251, 'Building EFloor 3', 57, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (252, 'Building CFloor 6', 182, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (253, 'Building CFloor 3', 143, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (254, 'Building BFloor 3', 100, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (255, 'Building BFloor 2', 155, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (256, 'Building CFloor 1', 87, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (257, 'Building CFloor 2', 69, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (258, 'Building AFloor 5', 82, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (259, 'Building CFloor 6', 160, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (260, 'Building AFloor 6', 183, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (261, 'Building DFloor 1', 62, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (262, 'Building CFloor 4', 168, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (263, 'Building BFloor 4', 50, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (264, 'Building AFloor 3', 55, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (265, 'Building DFloor 2', 194, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (266, 'Building DFloor 3', 182, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (267, 'Building DFloor 4', 75, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (268, 'Building BFloor 6', 192, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (269, 'Building EFloor 4', 145, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (270, 'Building BFloor 5', 114, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (271, 'Building CFloor 1', 182, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (272, 'Building CFloor 6', 50, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (273, 'Building DFloor 1', 138, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (274, 'Building DFloor 3', 141, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (275, 'Building CFloor 2', 197, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (276, 'Building BFloor 3', 196, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (277, 'Building CFloor 2', 59, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (278, 'Building CFloor 3', 56, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (279, 'Building CFloor 1', 151, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (280, 'Building BFloor 5', 73, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (281, 'Building BFloor 3', 93, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (282, 'Building EFloor 3', 52, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (283, 'Building EFloor 4', 160, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (284, 'Building BFloor 3', 137, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (285, 'Building DFloor 6', 144, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (286, 'Building CFloor 2', 143, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (287, 'Building AFloor 5', 152, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (288, 'Building DFloor 1', 80, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (289, 'Building BFloor 2', 169, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (290, 'Building BFloor 2', 193, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (291, 'Building EFloor 3', 195, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (292, 'Building BFloor 2', 63, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (293, 'Building EFloor 5', 53, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (294, 'Building AFloor 1', 99, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (295, 'Building EFloor 1', 73, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (296, 'Building DFloor 5', 137, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (297, 'Building AFloor 1', 91, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (298, 'Building AFloor 4', 116, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (299, 'Building CFloor 1', 72, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (300, 'Building EFloor 1', 127, 'Auditorium');
commit;
prompt 300 records committed...
insert into ROOM (r_id, r_location, numplace, r_type)
values (301, 'Building EFloor 3', 111, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (302, 'Building BFloor 5', 134, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (303, 'Building AFloor 3', 97, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (304, 'Building CFloor 5', 110, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (305, 'Building CFloor 3', 106, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (306, 'Building DFloor 5', 158, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (307, 'Building EFloor 3', 159, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (308, 'Building DFloor 1', 139, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (309, 'Building AFloor 5', 109, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (310, 'Building EFloor 4', 185, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (311, 'Building BFloor 3', 97, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (312, 'Building CFloor 2', 124, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (313, 'Building DFloor 5', 75, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (314, 'Building BFloor 4', 83, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (315, 'Building BFloor 3', 62, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (316, 'Building BFloor 6', 161, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (317, 'Building BFloor 4', 57, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (318, 'Building BFloor 3', 70, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (319, 'Building EFloor 6', 90, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (320, 'Building DFloor 5', 108, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (321, 'Building EFloor 4', 81, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (322, 'Building AFloor 4', 140, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (323, 'Building BFloor 5', 133, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (324, 'Building EFloor 2', 64, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (325, 'Building BFloor 1', 182, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (326, 'Building BFloor 2', 91, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (327, 'Building DFloor 4', 86, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (328, 'Building BFloor 3', 98, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (329, 'Building DFloor 6', 123, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (330, 'Building BFloor 6', 155, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (331, 'Building DFloor 6', 115, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (332, 'Building DFloor 6', 124, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (333, 'Building EFloor 6', 179, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (334, 'Building DFloor 6', 125, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (335, 'Building AFloor 1', 87, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (336, 'Building BFloor 1', 83, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (337, 'Building EFloor 6', 115, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (338, 'Building BFloor 5', 135, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (339, 'Building DFloor 4', 197, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (340, 'Building BFloor 4', 120, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (341, 'Building AFloor 3', 112, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (342, 'Building DFloor 4', 84, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (343, 'Building AFloor 5', 91, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (344, 'Building BFloor 3', 160, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (345, 'Building DFloor 4', 195, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (346, 'Building EFloor 1', 118, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (347, 'Building BFloor 2', 106, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (348, 'Building DFloor 4', 88, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (349, 'Building DFloor 5', 111, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (350, 'Building BFloor 4', 56, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (351, 'Building CFloor 1', 86, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (352, 'Building EFloor 3', 79, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (353, 'Building AFloor 6', 113, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (354, 'Building EFloor 3', 172, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (355, 'Building DFloor 6', 168, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (356, 'Building BFloor 1', 172, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (357, 'Building BFloor 5', 77, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (358, 'Building AFloor 3', 166, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (359, 'Building AFloor 2', 53, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (360, 'Building EFloor 1', 149, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (361, 'Building AFloor 4', 142, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (362, 'Building AFloor 3', 96, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (363, 'Building EFloor 1', 96, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (364, 'Building CFloor 3', 166, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (365, 'Building CFloor 5', 127, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (366, 'Building DFloor 4', 111, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (367, 'Building AFloor 4', 119, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (368, 'Building DFloor 3', 180, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (369, 'Building AFloor 3', 169, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (370, 'Building DFloor 2', 171, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (371, 'Building BFloor 5', 50, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (372, 'Building DFloor 6', 124, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (373, 'Building EFloor 3', 145, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (374, 'Building BFloor 5', 76, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (375, 'Building CFloor 5', 99, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (376, 'Building EFloor 6', 90, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (377, 'Building AFloor 5', 152, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (378, 'Building BFloor 2', 103, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (379, 'Building BFloor 5', 184, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (380, 'Building EFloor 4', 53, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (381, 'Building DFloor 4', 85, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (382, 'Building BFloor 6', 123, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (383, 'Building CFloor 6', 106, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (384, 'Building CFloor 1', 53, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (385, 'Building EFloor 2', 115, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (386, 'Building CFloor 6', 85, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (387, 'Building BFloor 1', 189, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (388, 'Building EFloor 6', 68, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (389, 'Building BFloor 6', 118, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (390, 'Building DFloor 1', 195, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (391, 'Building AFloor 6', 93, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (392, 'Building EFloor 2', 199, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (393, 'Building CFloor 1', 152, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (394, 'Building EFloor 5', 188, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (395, 'Building EFloor 5', 54, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (396, 'Building BFloor 5', 88, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (397, 'Building AFloor 1', 184, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (398, 'Building BFloor 2', 114, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (399, 'Building EFloor 3', 157, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (400, 'Building DFloor 3', 159, 'Training Center');
commit;
prompt 400 records loaded
prompt Loading STUDENTSGROUP...
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (241, 73, 15, 1, 372, 54, 364);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (242, 46, 14, 4, 306, 56, 371);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (243, 53, 13, 1, 74, 330, 407);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (244, 43, 15, 1, 134, 398, 421);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (245, 36, 12, 3, 328, 323, 491);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (246, 96, 11, 4, 174, 76, 408);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (247, 70, 15, 3, 93, 306, 245);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (248, 74, 10, 1, 116, 42, 143);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (249, 92, 10, 4, 129, 105, 256);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (1, 39, 8, 2, 114, 110, 384);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (2, 81, 17, 2, 30, 336, 105);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (3, 54, 10, 5, 227, 346, 485);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (4, 90, 10, 1, 248, 165, 103);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (5, 64, 11, 2, 231, 244, 312);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (6, 87, 9, 5, 273, 20, 298);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (7, 84, 15, 1, 155, 80, 277);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (8, 69, 15, 2, 352, 263, 217);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (9, 30, 10, 4, 211, 55, 389);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (10, 99, 20, 3, 142, 260, 238);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (11, 62, 9, 1, 350, 337, 470);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (12, 57, 8, 2, 190, 136, 363);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (13, 77, 9, 2, 327, 327, 317);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (14, 59, 19, 4, 113, 355, 175);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (15, 59, 9, 2, 65, 181, 341);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (16, 83, 10, 2, 283, 111, 389);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (17, 47, 10, 3, 185, 398, 110);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (18, 86, 18, 2, 372, 359, 450);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (19, 91, 13, 2, 289, 165, 331);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (20, 43, 15, 1, 175, 258, 377);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (21, 64, 18, 3, 283, 87, 299);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (22, 87, 13, 5, 248, 284, 332);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (23, 78, 15, 5, 112, 190, 155);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (24, 81, 15, 3, 387, 155, 286);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (25, 76, 12, 5, 194, 214, 160);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (26, 32, 16, 5, 86, 238, 278);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (27, 76, 16, 4, 130, 97, 149);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (28, 81, 14, 4, 397, 388, 229);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (29, 32, 12, 4, 178, 256, 366);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (30, 35, 13, 5, 334, 276, 416);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (31, 65, 11, 2, 64, 178, 234);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (32, 94, 15, 3, 242, 165, 166);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (33, 33, 15, 4, 216, 319, 472);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (34, 35, 12, 4, 264, 384, 460);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (35, 90, 10, 4, 206, 17, 109);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (36, 85, 17, 1, 148, 266, 232);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (37, 53, 10, 1, 69, 240, 411);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (38, 68, 11, 5, 308, 190, 239);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (39, 88, 15, 1, 296, 51, 264);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (40, 51, 8, 4, 185, 109, 480);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (41, 74, 19, 4, 366, 216, 429);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (42, 58, 12, 2, 29, 389, 461);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (43, 72, 19, 1, 215, 258, 224);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (44, 97, 18, 1, 343, 145, 458);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (45, 54, 13, 4, 311, 150, 236);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (46, 63, 16, 4, 110, 306, 497);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (47, 79, 15, 1, 114, 372, 417);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (48, 30, 12, 5, 239, 380, 200);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (49, 38, 17, 4, 20, 127, 186);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (50, 40, 11, 2, 369, 374, 393);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (51, 40, 20, 4, 353, 21, 462);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (52, 49, 8, 3, 44, 216, 258);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (53, 34, 14, 5, 284, 20, 478);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (54, 66, 11, 3, 206, 344, 303);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (55, 55, 18, 1, 81, 388, 286);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (56, 93, 12, 5, 236, 21, 341);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (57, 87, 13, 2, 146, 210, 392);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (58, 76, 19, 3, 263, 16, 148);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (59, 97, 20, 1, 32, 204, 467);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (60, 84, 19, 3, 184, 27, 193);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (61, 67, 8, 2, 320, 239, 335);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (62, 53, 10, 5, 119, 94, 306);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (63, 47, 11, 4, 343, 55, 200);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (64, 33, 12, 4, 343, 147, 287);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (65, 69, 10, 2, 21, 188, 323);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (66, 32, 18, 1, 6, 371, 115);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (67, 79, 14, 1, 209, 225, 488);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (68, 31, 12, 4, 94, 318, 352);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (69, 99, 15, 2, 26, 373, 487);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (70, 42, 19, 3, 149, 36, 217);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (71, 35, 10, 2, 150, 59, 158);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (72, 56, 18, 4, 387, 172, 117);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (73, 96, 17, 5, 361, 175, 399);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (74, 84, 13, 1, 134, 102, 310);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (75, 60, 18, 4, 112, 50, 302);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (76, 77, 8, 4, 27, 34, 284);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (77, 89, 15, 2, 209, 388, 427);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (78, 55, 16, 3, 298, 368, 337);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (79, 96, 15, 2, 187, 249, 347);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (80, 44, 19, 3, 378, 36, 128);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (81, 47, 13, 3, 47, 297, 313);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (82, 45, 15, 4, 349, 100, 297);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (83, 67, 20, 3, 361, 212, 141);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (84, 35, 8, 2, 85, 162, 118);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (85, 85, 19, 3, 2, 278, 180);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (86, 96, 11, 4, 400, 33, 279);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (87, 52, 15, 3, 91, 53, 473);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (88, 84, 17, 2, 238, 24, 363);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (89, 71, 18, 1, 44, 322, 356);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (90, 46, 13, 5, 44, 112, 319);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (91, 90, 14, 4, 96, 242, 414);
commit;
prompt 100 records committed...
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (92, 87, 12, 4, 341, 347, 489);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (93, 89, 9, 2, 388, 89, 433);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (94, 42, 13, 1, 239, 140, 492);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (95, 42, 15, 1, 385, 110, 281);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (96, 92, 20, 5, 323, 198, 132);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (97, 95, 12, 2, 133, 82, 341);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (98, 75, 12, 3, 29, 165, 417);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (99, 81, 9, 3, 101, 292, 233);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (100, 45, 8, 2, 164, 321, 465);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (101, 61, 15, 3, 124, 345, 256);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (102, 41, 11, 1, 80, 189, 192);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (103, 30, 17, 2, 397, 290, 483);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (104, 54, 14, 2, 349, 217, 341);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (105, 39, 16, 5, 32, 296, 128);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (106, 96, 16, 5, 253, 392, 357);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (107, 35, 15, 2, 330, 359, 340);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (108, 32, 9, 2, 347, 129, 270);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (109, 62, 11, 3, 69, 70, 431);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (110, 55, 14, 2, 390, 299, 478);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (111, 94, 10, 3, 186, 123, 480);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (112, 77, 16, 1, 316, 366, 213);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (113, 38, 18, 5, 122, 200, 148);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (114, 79, 11, 3, 334, 55, 357);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (115, 62, 17, 5, 228, 311, 430);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (116, 93, 19, 5, 29, 348, 409);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (117, 51, 13, 3, 309, 15, 372);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (118, 42, 17, 5, 366, 234, 266);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (119, 75, 12, 3, 68, 21, 491);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (120, 68, 14, 1, 234, 176, 417);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (121, 87, 14, 4, 170, 368, 332);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (122, 48, 20, 4, 77, 171, 210);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (123, 36, 20, 4, 264, 310, 476);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (124, 94, 12, 5, 24, 322, 395);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (125, 96, 12, 5, 76, 285, 254);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (126, 63, 18, 1, 56, 20, 209);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (127, 79, 11, 2, 142, 104, 477);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (128, 57, 10, 1, 249, 254, 191);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (129, 46, 18, 2, 60, 341, 232);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (130, 46, 16, 2, 7, 137, 409);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (131, 99, 12, 5, 247, 41, 456);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (132, 48, 14, 1, 139, 378, 272);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (133, 100, 16, 2, 82, 360, 337);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (134, 46, 8, 1, 89, 181, 220);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (135, 53, 20, 2, 212, 228, 262);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (136, 30, 10, 2, 364, 106, 466);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (137, 75, 17, 1, 110, 245, 346);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (138, 32, 15, 5, 287, 355, 472);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (139, 96, 9, 1, 58, 334, 474);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (140, 81, 13, 3, 107, 53, 140);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (141, 88, 12, 5, 36, 324, 292);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (142, 30, 18, 2, 197, 356, 204);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (143, 76, 15, 5, 114, 3, 464);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (144, 32, 16, 4, 171, 359, 194);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (145, 63, 14, 4, 203, 26, 246);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (146, 67, 8, 3, 48, 59, 469);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (147, 74, 17, 1, 369, 389, 490);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (148, 45, 11, 2, 106, 325, 483);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (149, 66, 13, 3, 174, 85, 121);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (150, 70, 13, 4, 140, 326, 375);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (151, 80, 19, 5, 40, 25, 214);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (152, 72, 19, 4, 167, 191, 268);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (153, 66, 18, 2, 109, 264, 300);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (154, 67, 9, 4, 311, 336, 143);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (155, 80, 15, 1, 174, 204, 441);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (156, 59, 13, 4, 88, 228, 487);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (157, 31, 19, 2, 382, 205, 290);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (158, 59, 20, 1, 231, 242, 389);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (159, 64, 16, 5, 66, 297, 486);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (160, 88, 11, 1, 288, 355, 253);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (161, 91, 11, 4, 211, 206, 200);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (162, 55, 13, 5, 114, 353, 439);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (163, 87, 20, 1, 311, 193, 368);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (164, 51, 10, 4, 300, 287, 375);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (165, 41, 12, 1, 122, 323, 247);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (166, 55, 20, 1, 262, 45, 461);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (167, 32, 15, 1, 73, 257, 221);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (168, 58, 8, 5, 26, 201, 308);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (169, 38, 13, 5, 230, 190, 283);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (170, 61, 10, 3, 234, 384, 227);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (171, 74, 15, 3, 185, 21, 140);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (172, 79, 18, 3, 213, 334, 124);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (173, 83, 9, 3, 355, 379, 151);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (174, 36, 13, 5, 30, 94, 496);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (175, 63, 9, 3, 72, 399, 448);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (176, 41, 10, 5, 161, 302, 310);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (177, 51, 14, 5, 350, 66, 461);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (178, 93, 18, 1, 116, 31, 228);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (179, 100, 16, 1, 97, 221, 382);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (180, 88, 19, 3, 246, 141, 191);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (181, 71, 17, 1, 268, 240, 196);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (182, 81, 13, 5, 258, 193, 413);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (183, 37, 11, 4, 134, 301, 414);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (184, 76, 10, 5, 80, 282, 179);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (185, 30, 12, 3, 343, 24, 340);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (186, 100, 19, 5, 395, 52, 137);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (187, 97, 14, 3, 366, 221, 193);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (188, 94, 16, 3, 288, 40, 243);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (189, 69, 20, 5, 400, 127, 334);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (190, 57, 8, 1, 325, 211, 465);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (191, 62, 11, 3, 309, 249, 108);
commit;
prompt 200 records committed...
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (192, 77, 16, 4, 308, 238, 208);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (193, 62, 19, 5, 293, 219, 151);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (194, 88, 17, 4, 223, 185, 151);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (195, 84, 17, 3, 57, 372, 480);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (196, 81, 11, 4, 226, 349, 277);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (197, 81, 14, 1, 164, 235, 403);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (198, 83, 11, 3, 386, 310, 372);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (199, 54, 19, 1, 156, 63, 382);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (200, 88, 16, 3, 226, 165, 180);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (201, 67, 13, 2, 124, 396, 470);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (202, 86, 14, 1, 192, 174, 491);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (203, 32, 12, 1, 102, 368, 475);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (204, 40, 12, 5, 71, 396, 146);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (205, 53, 20, 3, 171, 363, 252);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (206, 74, 15, 2, 300, 371, 440);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (207, 93, 15, 5, 263, 320, 281);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (208, 40, 19, 3, 203, 184, 100);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (209, 90, 8, 2, 320, 312, 348);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (210, 46, 18, 3, 61, 390, 130);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (211, 83, 14, 4, 27, 77, 267);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (212, 81, 19, 2, 78, 349, 287);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (213, 93, 11, 2, 163, 335, 263);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (214, 64, 19, 5, 158, 216, 288);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (215, 79, 16, 3, 176, 382, 367);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (216, 72, 20, 5, 116, 361, 116);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (217, 91, 17, 2, 255, 166, 232);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (218, 96, 16, 3, 78, 63, 314);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (219, 52, 12, 3, 280, 359, 120);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (220, 44, 20, 5, 78, 234, 440);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (221, 48, 10, 4, 127, 30, 278);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (222, 34, 12, 3, 399, 235, 372);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (223, 85, 8, 2, 323, 18, 440);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (224, 76, 8, 4, 277, 141, 445);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (225, 90, 20, 4, 116, 221, 489);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (226, 79, 8, 5, 309, 301, 492);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (227, 77, 16, 4, 150, 298, 204);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (228, 42, 18, 2, 397, 164, 379);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (229, 79, 11, 5, 228, 201, 124);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (230, 93, 11, 5, 345, 11, 313);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (231, 81, 11, 1, 338, 230, 469);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (232, 89, 16, 1, 358, 163, 498);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (233, 32, 15, 5, 26, 28, 337);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (234, 97, 8, 5, 361, 318, 236);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (235, 51, 9, 3, 97, 22, 316);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (236, 69, 10, 3, 384, 165, 236);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (237, 93, 14, 2, 332, 105, 137);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (238, 94, 16, 2, 319, 143, 418);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (239, 80, 18, 4, 188, 78, 312);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (240, 56, 14, 2, 315, 92, 406);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (250, 89, 18, 2, 8, 14, 495);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (251, 71, 18, 1, 254, 316, 307);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (252, 57, 20, 5, 215, 184, 353);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (253, 36, 12, 4, 58, 393, 115);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (254, 53, 12, 1, 216, 320, 141);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (255, 90, 19, 5, 60, 165, 282);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (256, 83, 12, 3, 262, 1, 253);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (257, 42, 9, 5, 386, 152, 120);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (258, 52, 17, 4, 46, 271, 107);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (259, 73, 11, 3, 154, 195, 250);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (260, 68, 12, 4, 194, 234, 384);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (261, 55, 8, 3, 37, 25, 426);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (262, 65, 14, 3, 128, 276, 340);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (263, 95, 11, 4, 197, 243, 306);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (264, 46, 9, 1, 313, 55, 175);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (265, 34, 8, 4, 268, 353, 213);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (266, 33, 11, 5, 240, 310, 133);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (267, 87, 19, 2, 160, 130, 197);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (268, 72, 19, 3, 358, 66, 118);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (269, 33, 17, 3, 182, 333, 249);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (270, 62, 11, 1, 299, 67, 112);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (271, 98, 10, 2, 249, 80, 190);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (272, 60, 8, 5, 215, 214, 165);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (273, 54, 18, 2, 63, 284, 262);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (274, 89, 13, 2, 177, 46, 447);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (275, 61, 9, 3, 252, 252, 363);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (276, 81, 15, 4, 242, 238, 346);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (277, 36, 14, 1, 135, 258, 346);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (278, 60, 11, 1, 344, 356, 481);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (279, 36, 18, 5, 313, 204, 322);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (280, 40, 20, 5, 24, 237, 424);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (281, 36, 18, 2, 348, 158, 392);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (282, 63, 9, 4, 135, 47, 200);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (283, 82, 9, 4, 329, 287, 142);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (284, 86, 9, 4, 353, 167, 162);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (285, 48, 14, 2, 388, 193, 337);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (286, 55, 19, 4, 35, 172, 307);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (287, 55, 11, 3, 371, 151, 133);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (288, 46, 17, 1, 31, 257, 223);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (289, 86, 10, 5, 313, 53, 449);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (290, 44, 16, 5, 6, 163, 142);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (291, 93, 9, 4, 134, 385, 231);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (292, 97, 15, 3, 297, 357, 492);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (293, 46, 13, 5, 210, 9, 427);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (294, 67, 18, 3, 219, 340, 212);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (295, 94, 18, 5, 209, 86, 218);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (296, 34, 10, 2, 84, 206, 226);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (297, 51, 10, 2, 84, 337, 129);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (298, 62, 10, 4, 226, 146, 151);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (299, 43, 17, 1, 381, 340, 356);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (300, 47, 11, 1, 99, 225, 421);
commit;
prompt 300 records committed...
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (301, 72, 19, 5, 367, 276, 330);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (302, 35, 13, 3, 149, 100, 107);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (303, 97, 20, 3, 148, 38, 463);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (304, 43, 18, 4, 120, 38, 417);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (305, 31, 17, 3, 252, 93, 298);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (306, 46, 17, 5, 296, 281, 353);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (307, 32, 9, 3, 275, 15, 197);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (308, 38, 17, 3, 333, 320, 314);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (309, 32, 12, 4, 254, 293, 198);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (310, 69, 20, 1, 4, 136, 317);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (311, 90, 13, 2, 162, 314, 173);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (312, 90, 14, 1, 282, 359, 423);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (313, 89, 10, 4, 195, 340, 320);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (314, 87, 15, 1, 106, 8, 249);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (315, 33, 12, 3, 243, 171, 310);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (316, 100, 13, 1, 248, 157, 141);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (317, 46, 20, 5, 215, 111, 338);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (318, 70, 19, 3, 219, 399, 302);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (319, 44, 17, 3, 209, 333, 191);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (320, 68, 15, 3, 251, 247, 242);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (321, 53, 11, 1, 4, 66, 181);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (322, 44, 8, 1, 65, 146, 243);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (323, 36, 8, 5, 254, 90, 258);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (324, 88, 13, 3, 285, 36, 207);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (325, 36, 12, 3, 268, 157, 145);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (326, 45, 13, 3, 7, 332, 188);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (327, 94, 8, 4, 152, 245, 227);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (328, 73, 14, 4, 165, 278, 165);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (329, 78, 18, 2, 8, 247, 215);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (330, 86, 18, 4, 20, 318, 362);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (331, 52, 8, 2, 148, 398, 330);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (332, 80, 11, 2, 210, 66, 271);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (333, 77, 12, 1, 33, 62, 223);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (334, 85, 10, 2, 282, 298, 286);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (335, 44, 8, 1, 87, 160, 181);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (336, 83, 13, 3, 348, 353, 302);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (337, 92, 15, 4, 297, 270, 427);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (338, 90, 13, 3, 187, 380, 184);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (339, 51, 13, 3, 358, 292, 469);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (340, 56, 9, 5, 38, 395, 276);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (341, 52, 8, 2, 256, 281, 112);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (342, 42, 14, 3, 190, 199, 222);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (343, 80, 16, 2, 267, 169, 271);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (344, 75, 16, 5, 233, 322, 106);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (345, 76, 10, 3, 253, 368, 221);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (346, 38, 15, 3, 72, 241, 364);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (347, 32, 10, 3, 236, 366, 398);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (348, 87, 8, 2, 153, 231, 269);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (349, 81, 11, 2, 332, 123, 409);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (350, 71, 18, 1, 29, 107, 460);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (351, 69, 9, 4, 225, 373, 356);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (352, 61, 16, 1, 90, 208, 302);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (353, 76, 16, 1, 68, 32, 121);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (354, 56, 8, 5, 195, 90, 155);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (355, 31, 9, 2, 379, 233, 141);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (356, 85, 9, 3, 238, 69, 330);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (357, 98, 18, 5, 231, 174, 497);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (358, 31, 14, 5, 176, 86, 225);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (359, 58, 12, 5, 302, 105, 457);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (360, 60, 15, 1, 347, 34, 407);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (361, 58, 16, 5, 271, 46, 301);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (362, 98, 16, 5, 220, 222, 136);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (363, 54, 15, 2, 152, 152, 153);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (364, 59, 11, 2, 198, 315, 496);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (365, 70, 17, 1, 26, 320, 271);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (366, 90, 8, 2, 9, 17, 231);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (367, 65, 10, 5, 369, 357, 492);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (368, 64, 16, 1, 115, 45, 259);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (369, 60, 17, 3, 57, 109, 304);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (370, 58, 9, 3, 275, 62, 138);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (371, 78, 12, 1, 16, 255, 242);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (372, 84, 8, 3, 286, 312, 285);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (373, 72, 17, 2, 212, 176, 257);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (374, 55, 12, 5, 39, 225, 206);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (375, 84, 20, 4, 156, 204, 391);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (376, 79, 8, 3, 119, 137, 337);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (377, 55, 17, 2, 6, 57, 374);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (378, 94, 13, 3, 280, 389, 365);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (379, 61, 13, 2, 248, 167, 492);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (380, 54, 11, 5, 25, 163, 222);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (381, 78, 11, 4, 36, 309, 143);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (382, 54, 8, 5, 27, 102, 413);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (383, 88, 13, 3, 372, 29, 225);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (384, 95, 18, 4, 16, 78, 491);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (385, 91, 8, 5, 13, 291, 374);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (386, 31, 11, 5, 71, 364, 124);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (387, 85, 17, 5, 73, 234, 193);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (388, 81, 9, 2, 338, 158, 163);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (389, 38, 11, 5, 222, 261, 102);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (390, 77, 18, 5, 313, 331, 382);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (391, 38, 12, 5, 236, 349, 334);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (392, 53, 16, 4, 123, 136, 267);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (393, 90, 20, 2, 9, 203, 316);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (394, 34, 11, 2, 324, 151, 145);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (395, 75, 11, 2, 382, 350, 364);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (396, 36, 17, 5, 68, 199, 421);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (397, 93, 9, 4, 91, 178, 115);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (398, 88, 15, 1, 342, 315, 426);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (399, 94, 17, 3, 195, 238, 245);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (400, 30, 15, 4, 341, 103, 427);
commit;
prompt 400 records loaded
prompt Loading BELONGS...
insert into BELONGS (g_id, p_id)
values (112, 615);
insert into BELONGS (g_id, p_id)
values (374, 883);
insert into BELONGS (g_id, p_id)
values (186, 731);
insert into BELONGS (g_id, p_id)
values (263, 869);
insert into BELONGS (g_id, p_id)
values (78, 650);
insert into BELONGS (g_id, p_id)
values (260, 657);
insert into BELONGS (g_id, p_id)
values (189, 667);
insert into BELONGS (g_id, p_id)
values (8, 886);
insert into BELONGS (g_id, p_id)
values (335, 722);
insert into BELONGS (g_id, p_id)
values (78, 855);
insert into BELONGS (g_id, p_id)
values (49, 681);
insert into BELONGS (g_id, p_id)
values (144, 763);
insert into BELONGS (g_id, p_id)
values (322, 531);
insert into BELONGS (g_id, p_id)
values (154, 599);
insert into BELONGS (g_id, p_id)
values (222, 823);
insert into BELONGS (g_id, p_id)
values (26, 890);
insert into BELONGS (g_id, p_id)
values (25, 740);
insert into BELONGS (g_id, p_id)
values (394, 708);
insert into BELONGS (g_id, p_id)
values (257, 666);
insert into BELONGS (g_id, p_id)
values (263, 881);
insert into BELONGS (g_id, p_id)
values (354, 758);
insert into BELONGS (g_id, p_id)
values (327, 728);
insert into BELONGS (g_id, p_id)
values (263, 889);
insert into BELONGS (g_id, p_id)
values (390, 892);
insert into BELONGS (g_id, p_id)
values (17, 528);
insert into BELONGS (g_id, p_id)
values (394, 825);
insert into BELONGS (g_id, p_id)
values (312, 734);
insert into BELONGS (g_id, p_id)
values (102, 813);
insert into BELONGS (g_id, p_id)
values (394, 618);
insert into BELONGS (g_id, p_id)
values (288, 892);
insert into BELONGS (g_id, p_id)
values (214, 665);
insert into BELONGS (g_id, p_id)
values (145, 736);
insert into BELONGS (g_id, p_id)
values (119, 647);
insert into BELONGS (g_id, p_id)
values (267, 678);
insert into BELONGS (g_id, p_id)
values (204, 751);
insert into BELONGS (g_id, p_id)
values (194, 541);
insert into BELONGS (g_id, p_id)
values (369, 626);
insert into BELONGS (g_id, p_id)
values (286, 636);
insert into BELONGS (g_id, p_id)
values (357, 778);
insert into BELONGS (g_id, p_id)
values (227, 612);
insert into BELONGS (g_id, p_id)
values (307, 832);
insert into BELONGS (g_id, p_id)
values (142, 706);
insert into BELONGS (g_id, p_id)
values (64, 876);
insert into BELONGS (g_id, p_id)
values (86, 881);
insert into BELONGS (g_id, p_id)
values (382, 604);
insert into BELONGS (g_id, p_id)
values (302, 612);
insert into BELONGS (g_id, p_id)
values (28, 684);
insert into BELONGS (g_id, p_id)
values (71, 585);
insert into BELONGS (g_id, p_id)
values (302, 863);
insert into BELONGS (g_id, p_id)
values (6, 891);
insert into BELONGS (g_id, p_id)
values (109, 630);
insert into BELONGS (g_id, p_id)
values (155, 763);
insert into BELONGS (g_id, p_id)
values (297, 758);
insert into BELONGS (g_id, p_id)
values (225, 649);
insert into BELONGS (g_id, p_id)
values (128, 541);
insert into BELONGS (g_id, p_id)
values (230, 667);
insert into BELONGS (g_id, p_id)
values (393, 840);
insert into BELONGS (g_id, p_id)
values (220, 832);
insert into BELONGS (g_id, p_id)
values (261, 774);
insert into BELONGS (g_id, p_id)
values (174, 502);
insert into BELONGS (g_id, p_id)
values (99, 752);
insert into BELONGS (g_id, p_id)
values (62, 633);
insert into BELONGS (g_id, p_id)
values (196, 681);
insert into BELONGS (g_id, p_id)
values (144, 893);
insert into BELONGS (g_id, p_id)
values (172, 659);
insert into BELONGS (g_id, p_id)
values (133, 619);
insert into BELONGS (g_id, p_id)
values (69, 784);
insert into BELONGS (g_id, p_id)
values (300, 674);
insert into BELONGS (g_id, p_id)
values (316, 783);
insert into BELONGS (g_id, p_id)
values (57, 581);
insert into BELONGS (g_id, p_id)
values (29, 690);
insert into BELONGS (g_id, p_id)
values (319, 600);
insert into BELONGS (g_id, p_id)
values (151, 686);
insert into BELONGS (g_id, p_id)
values (259, 513);
insert into BELONGS (g_id, p_id)
values (383, 724);
insert into BELONGS (g_id, p_id)
values (248, 592);
insert into BELONGS (g_id, p_id)
values (302, 657);
insert into BELONGS (g_id, p_id)
values (107, 714);
insert into BELONGS (g_id, p_id)
values (52, 883);
insert into BELONGS (g_id, p_id)
values (61, 896);
insert into BELONGS (g_id, p_id)
values (86, 835);
insert into BELONGS (g_id, p_id)
values (2, 615);
insert into BELONGS (g_id, p_id)
values (245, 724);
insert into BELONGS (g_id, p_id)
values (324, 779);
insert into BELONGS (g_id, p_id)
values (306, 861);
insert into BELONGS (g_id, p_id)
values (331, 732);
insert into BELONGS (g_id, p_id)
values (89, 573);
insert into BELONGS (g_id, p_id)
values (141, 739);
insert into BELONGS (g_id, p_id)
values (183, 839);
insert into BELONGS (g_id, p_id)
values (331, 544);
insert into BELONGS (g_id, p_id)
values (148, 854);
insert into BELONGS (g_id, p_id)
values (360, 647);
insert into BELONGS (g_id, p_id)
values (189, 842);
insert into BELONGS (g_id, p_id)
values (5, 692);
insert into BELONGS (g_id, p_id)
values (139, 752);
insert into BELONGS (g_id, p_id)
values (77, 611);
insert into BELONGS (g_id, p_id)
values (280, 527);
insert into BELONGS (g_id, p_id)
values (227, 712);
insert into BELONGS (g_id, p_id)
values (9, 595);
insert into BELONGS (g_id, p_id)
values (302, 567);
commit;
prompt 100 records committed...
insert into BELONGS (g_id, p_id)
values (256, 881);
insert into BELONGS (g_id, p_id)
values (226, 680);
insert into BELONGS (g_id, p_id)
values (361, 764);
insert into BELONGS (g_id, p_id)
values (365, 592);
insert into BELONGS (g_id, p_id)
values (170, 898);
insert into BELONGS (g_id, p_id)
values (181, 798);
insert into BELONGS (g_id, p_id)
values (303, 722);
insert into BELONGS (g_id, p_id)
values (383, 747);
insert into BELONGS (g_id, p_id)
values (338, 766);
insert into BELONGS (g_id, p_id)
values (241, 888);
insert into BELONGS (g_id, p_id)
values (205, 579);
insert into BELONGS (g_id, p_id)
values (200, 837);
insert into BELONGS (g_id, p_id)
values (71, 798);
insert into BELONGS (g_id, p_id)
values (291, 625);
insert into BELONGS (g_id, p_id)
values (33, 772);
insert into BELONGS (g_id, p_id)
values (258, 506);
insert into BELONGS (g_id, p_id)
values (261, 868);
insert into BELONGS (g_id, p_id)
values (30, 886);
insert into BELONGS (g_id, p_id)
values (72, 671);
insert into BELONGS (g_id, p_id)
values (141, 848);
insert into BELONGS (g_id, p_id)
values (108, 792);
insert into BELONGS (g_id, p_id)
values (27, 631);
insert into BELONGS (g_id, p_id)
values (142, 520);
insert into BELONGS (g_id, p_id)
values (379, 750);
insert into BELONGS (g_id, p_id)
values (161, 817);
insert into BELONGS (g_id, p_id)
values (156, 502);
insert into BELONGS (g_id, p_id)
values (4, 689);
insert into BELONGS (g_id, p_id)
values (197, 753);
insert into BELONGS (g_id, p_id)
values (344, 644);
insert into BELONGS (g_id, p_id)
values (96, 750);
insert into BELONGS (g_id, p_id)
values (199, 659);
insert into BELONGS (g_id, p_id)
values (163, 846);
insert into BELONGS (g_id, p_id)
values (111, 575);
insert into BELONGS (g_id, p_id)
values (263, 691);
insert into BELONGS (g_id, p_id)
values (105, 534);
insert into BELONGS (g_id, p_id)
values (42, 577);
insert into BELONGS (g_id, p_id)
values (308, 784);
insert into BELONGS (g_id, p_id)
values (119, 881);
insert into BELONGS (g_id, p_id)
values (24, 669);
insert into BELONGS (g_id, p_id)
values (199, 697);
insert into BELONGS (g_id, p_id)
values (38, 713);
insert into BELONGS (g_id, p_id)
values (45, 816);
insert into BELONGS (g_id, p_id)
values (99, 635);
insert into BELONGS (g_id, p_id)
values (398, 720);
insert into BELONGS (g_id, p_id)
values (218, 592);
insert into BELONGS (g_id, p_id)
values (341, 735);
insert into BELONGS (g_id, p_id)
values (254, 743);
insert into BELONGS (g_id, p_id)
values (105, 656);
insert into BELONGS (g_id, p_id)
values (76, 539);
insert into BELONGS (g_id, p_id)
values (300, 716);
insert into BELONGS (g_id, p_id)
values (30, 580);
insert into BELONGS (g_id, p_id)
values (259, 833);
insert into BELONGS (g_id, p_id)
values (388, 719);
insert into BELONGS (g_id, p_id)
values (400, 655);
insert into BELONGS (g_id, p_id)
values (81, 851);
insert into BELONGS (g_id, p_id)
values (63, 594);
insert into BELONGS (g_id, p_id)
values (238, 806);
insert into BELONGS (g_id, p_id)
values (309, 731);
insert into BELONGS (g_id, p_id)
values (102, 535);
insert into BELONGS (g_id, p_id)
values (18, 562);
insert into BELONGS (g_id, p_id)
values (55, 799);
insert into BELONGS (g_id, p_id)
values (353, 640);
insert into BELONGS (g_id, p_id)
values (122, 688);
insert into BELONGS (g_id, p_id)
values (300, 500);
insert into BELONGS (g_id, p_id)
values (255, 790);
insert into BELONGS (g_id, p_id)
values (259, 518);
insert into BELONGS (g_id, p_id)
values (287, 514);
insert into BELONGS (g_id, p_id)
values (326, 688);
insert into BELONGS (g_id, p_id)
values (128, 605);
insert into BELONGS (g_id, p_id)
values (118, 575);
insert into BELONGS (g_id, p_id)
values (210, 757);
insert into BELONGS (g_id, p_id)
values (168, 820);
insert into BELONGS (g_id, p_id)
values (32, 752);
insert into BELONGS (g_id, p_id)
values (9, 660);
insert into BELONGS (g_id, p_id)
values (83, 827);
insert into BELONGS (g_id, p_id)
values (163, 836);
insert into BELONGS (g_id, p_id)
values (236, 714);
insert into BELONGS (g_id, p_id)
values (166, 554);
insert into BELONGS (g_id, p_id)
values (42, 843);
insert into BELONGS (g_id, p_id)
values (301, 874);
insert into BELONGS (g_id, p_id)
values (339, 552);
insert into BELONGS (g_id, p_id)
values (263, 585);
insert into BELONGS (g_id, p_id)
values (82, 605);
insert into BELONGS (g_id, p_id)
values (285, 747);
insert into BELONGS (g_id, p_id)
values (203, 642);
insert into BELONGS (g_id, p_id)
values (33, 562);
insert into BELONGS (g_id, p_id)
values (358, 690);
insert into BELONGS (g_id, p_id)
values (256, 542);
insert into BELONGS (g_id, p_id)
values (259, 730);
insert into BELONGS (g_id, p_id)
values (255, 646);
insert into BELONGS (g_id, p_id)
values (272, 872);
insert into BELONGS (g_id, p_id)
values (54, 754);
insert into BELONGS (g_id, p_id)
values (15, 720);
insert into BELONGS (g_id, p_id)
values (140, 540);
insert into BELONGS (g_id, p_id)
values (68, 673);
insert into BELONGS (g_id, p_id)
values (398, 731);
insert into BELONGS (g_id, p_id)
values (50, 777);
insert into BELONGS (g_id, p_id)
values (7, 598);
insert into BELONGS (g_id, p_id)
values (6, 827);
insert into BELONGS (g_id, p_id)
values (148, 659);
commit;
prompt 200 records committed...
insert into BELONGS (g_id, p_id)
values (199, 766);
insert into BELONGS (g_id, p_id)
values (363, 869);
insert into BELONGS (g_id, p_id)
values (325, 879);
insert into BELONGS (g_id, p_id)
values (9, 655);
insert into BELONGS (g_id, p_id)
values (324, 608);
insert into BELONGS (g_id, p_id)
values (94, 864);
insert into BELONGS (g_id, p_id)
values (60, 509);
insert into BELONGS (g_id, p_id)
values (238, 605);
insert into BELONGS (g_id, p_id)
values (192, 765);
insert into BELONGS (g_id, p_id)
values (165, 841);
insert into BELONGS (g_id, p_id)
values (378, 575);
insert into BELONGS (g_id, p_id)
values (328, 707);
insert into BELONGS (g_id, p_id)
values (340, 845);
insert into BELONGS (g_id, p_id)
values (173, 622);
insert into BELONGS (g_id, p_id)
values (120, 684);
insert into BELONGS (g_id, p_id)
values (8, 755);
insert into BELONGS (g_id, p_id)
values (330, 741);
insert into BELONGS (g_id, p_id)
values (59, 732);
insert into BELONGS (g_id, p_id)
values (34, 889);
insert into BELONGS (g_id, p_id)
values (218, 535);
insert into BELONGS (g_id, p_id)
values (57, 684);
insert into BELONGS (g_id, p_id)
values (244, 668);
insert into BELONGS (g_id, p_id)
values (248, 709);
insert into BELONGS (g_id, p_id)
values (120, 561);
insert into BELONGS (g_id, p_id)
values (173, 631);
insert into BELONGS (g_id, p_id)
values (96, 682);
insert into BELONGS (g_id, p_id)
values (22, 679);
insert into BELONGS (g_id, p_id)
values (75, 718);
insert into BELONGS (g_id, p_id)
values (105, 573);
insert into BELONGS (g_id, p_id)
values (379, 702);
insert into BELONGS (g_id, p_id)
values (3, 815);
insert into BELONGS (g_id, p_id)
values (399, 847);
insert into BELONGS (g_id, p_id)
values (177, 564);
insert into BELONGS (g_id, p_id)
values (82, 766);
insert into BELONGS (g_id, p_id)
values (339, 813);
insert into BELONGS (g_id, p_id)
values (306, 840);
insert into BELONGS (g_id, p_id)
values (112, 887);
insert into BELONGS (g_id, p_id)
values (145, 594);
insert into BELONGS (g_id, p_id)
values (109, 774);
insert into BELONGS (g_id, p_id)
values (369, 675);
insert into BELONGS (g_id, p_id)
values (380, 731);
insert into BELONGS (g_id, p_id)
values (145, 671);
insert into BELONGS (g_id, p_id)
values (209, 843);
insert into BELONGS (g_id, p_id)
values (316, 763);
insert into BELONGS (g_id, p_id)
values (322, 603);
insert into BELONGS (g_id, p_id)
values (384, 865);
insert into BELONGS (g_id, p_id)
values (347, 585);
insert into BELONGS (g_id, p_id)
values (290, 627);
insert into BELONGS (g_id, p_id)
values (392, 863);
insert into BELONGS (g_id, p_id)
values (111, 568);
insert into BELONGS (g_id, p_id)
values (141, 878);
insert into BELONGS (g_id, p_id)
values (331, 706);
insert into BELONGS (g_id, p_id)
values (331, 777);
insert into BELONGS (g_id, p_id)
values (100, 759);
insert into BELONGS (g_id, p_id)
values (337, 738);
insert into BELONGS (g_id, p_id)
values (76, 879);
insert into BELONGS (g_id, p_id)
values (204, 507);
insert into BELONGS (g_id, p_id)
values (79, 794);
insert into BELONGS (g_id, p_id)
values (217, 660);
insert into BELONGS (g_id, p_id)
values (330, 519);
insert into BELONGS (g_id, p_id)
values (309, 814);
insert into BELONGS (g_id, p_id)
values (119, 719);
insert into BELONGS (g_id, p_id)
values (113, 895);
insert into BELONGS (g_id, p_id)
values (335, 872);
insert into BELONGS (g_id, p_id)
values (162, 897);
insert into BELONGS (g_id, p_id)
values (193, 717);
insert into BELONGS (g_id, p_id)
values (107, 640);
insert into BELONGS (g_id, p_id)
values (228, 555);
insert into BELONGS (g_id, p_id)
values (135, 747);
insert into BELONGS (g_id, p_id)
values (376, 863);
insert into BELONGS (g_id, p_id)
values (98, 564);
insert into BELONGS (g_id, p_id)
values (39, 590);
insert into BELONGS (g_id, p_id)
values (97, 834);
insert into BELONGS (g_id, p_id)
values (21, 820);
insert into BELONGS (g_id, p_id)
values (250, 652);
insert into BELONGS (g_id, p_id)
values (79, 548);
insert into BELONGS (g_id, p_id)
values (216, 712);
insert into BELONGS (g_id, p_id)
values (89, 654);
insert into BELONGS (g_id, p_id)
values (227, 574);
insert into BELONGS (g_id, p_id)
values (27, 635);
insert into BELONGS (g_id, p_id)
values (140, 557);
insert into BELONGS (g_id, p_id)
values (337, 771);
insert into BELONGS (g_id, p_id)
values (177, 587);
insert into BELONGS (g_id, p_id)
values (204, 887);
insert into BELONGS (g_id, p_id)
values (206, 820);
insert into BELONGS (g_id, p_id)
values (14, 584);
insert into BELONGS (g_id, p_id)
values (377, 549);
insert into BELONGS (g_id, p_id)
values (289, 703);
insert into BELONGS (g_id, p_id)
values (291, 819);
insert into BELONGS (g_id, p_id)
values (52, 700);
insert into BELONGS (g_id, p_id)
values (182, 671);
insert into BELONGS (g_id, p_id)
values (199, 691);
insert into BELONGS (g_id, p_id)
values (220, 636);
insert into BELONGS (g_id, p_id)
values (130, 639);
insert into BELONGS (g_id, p_id)
values (289, 784);
insert into BELONGS (g_id, p_id)
values (141, 854);
insert into BELONGS (g_id, p_id)
values (361, 763);
insert into BELONGS (g_id, p_id)
values (77, 872);
insert into BELONGS (g_id, p_id)
values (4, 538);
insert into BELONGS (g_id, p_id)
values (308, 684);
commit;
prompt 300 records committed...
insert into BELONGS (g_id, p_id)
values (246, 651);
insert into BELONGS (g_id, p_id)
values (270, 784);
insert into BELONGS (g_id, p_id)
values (243, 520);
insert into BELONGS (g_id, p_id)
values (83, 795);
insert into BELONGS (g_id, p_id)
values (244, 598);
insert into BELONGS (g_id, p_id)
values (209, 565);
insert into BELONGS (g_id, p_id)
values (47, 704);
insert into BELONGS (g_id, p_id)
values (365, 871);
insert into BELONGS (g_id, p_id)
values (76, 557);
insert into BELONGS (g_id, p_id)
values (251, 627);
insert into BELONGS (g_id, p_id)
values (182, 618);
insert into BELONGS (g_id, p_id)
values (291, 747);
insert into BELONGS (g_id, p_id)
values (55, 565);
insert into BELONGS (g_id, p_id)
values (45, 695);
insert into BELONGS (g_id, p_id)
values (381, 818);
insert into BELONGS (g_id, p_id)
values (133, 686);
insert into BELONGS (g_id, p_id)
values (71, 718);
insert into BELONGS (g_id, p_id)
values (115, 622);
insert into BELONGS (g_id, p_id)
values (368, 831);
insert into BELONGS (g_id, p_id)
values (152, 666);
insert into BELONGS (g_id, p_id)
values (378, 664);
insert into BELONGS (g_id, p_id)
values (82, 622);
insert into BELONGS (g_id, p_id)
values (74, 810);
insert into BELONGS (g_id, p_id)
values (20, 706);
insert into BELONGS (g_id, p_id)
values (270, 794);
insert into BELONGS (g_id, p_id)
values (264, 802);
insert into BELONGS (g_id, p_id)
values (56, 682);
insert into BELONGS (g_id, p_id)
values (391, 701);
insert into BELONGS (g_id, p_id)
values (201, 629);
insert into BELONGS (g_id, p_id)
values (115, 748);
insert into BELONGS (g_id, p_id)
values (378, 636);
insert into BELONGS (g_id, p_id)
values (339, 818);
insert into BELONGS (g_id, p_id)
values (113, 871);
insert into BELONGS (g_id, p_id)
values (173, 836);
insert into BELONGS (g_id, p_id)
values (356, 643);
insert into BELONGS (g_id, p_id)
values (181, 562);
insert into BELONGS (g_id, p_id)
values (356, 581);
insert into BELONGS (g_id, p_id)
values (271, 863);
insert into BELONGS (g_id, p_id)
values (166, 694);
insert into BELONGS (g_id, p_id)
values (283, 777);
insert into BELONGS (g_id, p_id)
values (63, 681);
insert into BELONGS (g_id, p_id)
values (256, 809);
insert into BELONGS (g_id, p_id)
values (232, 561);
insert into BELONGS (g_id, p_id)
values (194, 561);
insert into BELONGS (g_id, p_id)
values (231, 582);
insert into BELONGS (g_id, p_id)
values (366, 518);
insert into BELONGS (g_id, p_id)
values (1, 693);
insert into BELONGS (g_id, p_id)
values (22, 718);
insert into BELONGS (g_id, p_id)
values (66, 736);
insert into BELONGS (g_id, p_id)
values (364, 709);
insert into BELONGS (g_id, p_id)
values (221, 628);
insert into BELONGS (g_id, p_id)
values (8, 528);
insert into BELONGS (g_id, p_id)
values (80, 712);
insert into BELONGS (g_id, p_id)
values (328, 507);
insert into BELONGS (g_id, p_id)
values (202, 531);
insert into BELONGS (g_id, p_id)
values (282, 638);
insert into BELONGS (g_id, p_id)
values (166, 802);
insert into BELONGS (g_id, p_id)
values (262, 703);
insert into BELONGS (g_id, p_id)
values (108, 662);
insert into BELONGS (g_id, p_id)
values (129, 891);
insert into BELONGS (g_id, p_id)
values (309, 744);
insert into BELONGS (g_id, p_id)
values (129, 736);
insert into BELONGS (g_id, p_id)
values (282, 765);
insert into BELONGS (g_id, p_id)
values (234, 665);
insert into BELONGS (g_id, p_id)
values (283, 778);
insert into BELONGS (g_id, p_id)
values (354, 606);
insert into BELONGS (g_id, p_id)
values (357, 580);
insert into BELONGS (g_id, p_id)
values (368, 549);
insert into BELONGS (g_id, p_id)
values (50, 619);
insert into BELONGS (g_id, p_id)
values (210, 501);
insert into BELONGS (g_id, p_id)
values (274, 688);
insert into BELONGS (g_id, p_id)
values (243, 536);
insert into BELONGS (g_id, p_id)
values (351, 765);
insert into BELONGS (g_id, p_id)
values (60, 563);
insert into BELONGS (g_id, p_id)
values (231, 872);
insert into BELONGS (g_id, p_id)
values (168, 745);
insert into BELONGS (g_id, p_id)
values (218, 519);
insert into BELONGS (g_id, p_id)
values (193, 764);
insert into BELONGS (g_id, p_id)
values (149, 807);
insert into BELONGS (g_id, p_id)
values (99, 669);
insert into BELONGS (g_id, p_id)
values (137, 746);
insert into BELONGS (g_id, p_id)
values (230, 520);
insert into BELONGS (g_id, p_id)
values (55, 676);
insert into BELONGS (g_id, p_id)
values (278, 543);
insert into BELONGS (g_id, p_id)
values (245, 545);
insert into BELONGS (g_id, p_id)
values (101, 823);
insert into BELONGS (g_id, p_id)
values (243, 512);
insert into BELONGS (g_id, p_id)
values (333, 844);
insert into BELONGS (g_id, p_id)
values (218, 658);
insert into BELONGS (g_id, p_id)
values (269, 500);
insert into BELONGS (g_id, p_id)
values (105, 657);
insert into BELONGS (g_id, p_id)
values (197, 705);
insert into BELONGS (g_id, p_id)
values (262, 790);
insert into BELONGS (g_id, p_id)
values (327, 595);
insert into BELONGS (g_id, p_id)
values (144, 557);
insert into BELONGS (g_id, p_id)
values (54, 871);
insert into BELONGS (g_id, p_id)
values (110, 868);
insert into BELONGS (g_id, p_id)
values (107, 879);
insert into BELONGS (g_id, p_id)
values (24, 675);
insert into BELONGS (g_id, p_id)
values (286, 761);
commit;
prompt 400 records loaded
prompt Loading EQUIPMENT...
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('22-01-2016', 'dd-mm-yyyy'), 209, 'First Aid Kit', 42);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('20-02-1999', 'dd-mm-yyyy'), 210, 'Defibrillator', 40);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('11-01-1993', 'dd-mm-yyyy'), 211, 'Defibrillator', 42);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('15-07-2013', 'dd-mm-yyyy'), 212, 'Thermometer', 45);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('08-12-2000', 'dd-mm-yyyy'), 213, 'CPR Manikin', 52);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('19-03-2005', 'dd-mm-yyyy'), 214, 'Face Mask', 77);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('26-10-2017', 'dd-mm-yyyy'), 215, 'Oxygen Tank', 41);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('07-06-2020', 'dd-mm-yyyy'), 216, 'Surgical Gloves', 68);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('03-09-1971', 'dd-mm-yyyy'), 217, 'Oxygen Tank', 94);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('25-11-2013', 'dd-mm-yyyy'), 218, 'First Aid Kit', 71);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('28-02-1973', 'dd-mm-yyyy'), 1, 'CPR Manikin', 60);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('02-04-2010', 'dd-mm-yyyy'), 2, 'Oxygen Tank', 88);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('24-10-1973', 'dd-mm-yyyy'), 3, 'Blood Pressure Monitor', 78);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('08-06-1974', 'dd-mm-yyyy'), 4, 'Blood Pressure Monitor', 42);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('31-10-2000', 'dd-mm-yyyy'), 5, 'Thermometer', 42);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('18-03-1999', 'dd-mm-yyyy'), 6, 'Surgical Gloves', 58);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('02-05-1989', 'dd-mm-yyyy'), 7, 'Face Mask', 79);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('20-04-1977', 'dd-mm-yyyy'), 8, 'Oxygen Tank', 99);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('18-08-1984', 'dd-mm-yyyy'), 9, 'Stethoscope', 90);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('09-09-1972', 'dd-mm-yyyy'), 10, 'Face Mask', 70);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('20-03-2007', 'dd-mm-yyyy'), 11, 'Defibrillator', 55);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('03-10-1971', 'dd-mm-yyyy'), 12, 'First Aid Kit', 37);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('06-05-1981', 'dd-mm-yyyy'), 13, 'Stethoscope', 72);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('05-09-2001', 'dd-mm-yyyy'), 14, 'Glucose Meter', 52);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('28-08-1972', 'dd-mm-yyyy'), 15, 'Surgical Gloves', 33);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('17-09-2016', 'dd-mm-yyyy'), 16, 'Face Mask', 59);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('16-12-2022', 'dd-mm-yyyy'), 17, 'Oxygen Tank', 36);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('24-05-1984', 'dd-mm-yyyy'), 18, 'Face Mask', 53);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('17-05-1994', 'dd-mm-yyyy'), 19, 'Defibrillator', 77);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('11-03-2019', 'dd-mm-yyyy'), 20, 'Thermometer', 99);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('15-12-1975', 'dd-mm-yyyy'), 21, 'Defibrillator', 78);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('27-06-2022', 'dd-mm-yyyy'), 22, 'CPR Manikin', 57);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('19-11-2007', 'dd-mm-yyyy'), 23, 'Oxygen Tank', 55);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('09-12-1988', 'dd-mm-yyyy'), 24, 'Thermometer', 36);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('15-03-2018', 'dd-mm-yyyy'), 25, 'Defibrillator', 98);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('11-03-2020', 'dd-mm-yyyy'), 26, 'Blood Pressure Monitor', 86);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('21-08-1994', 'dd-mm-yyyy'), 27, 'Face Mask', 75);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('03-03-2009', 'dd-mm-yyyy'), 28, 'Oxygen Tank', 89);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('06-03-1976', 'dd-mm-yyyy'), 29, 'Surgical Gloves', 60);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('03-03-1982', 'dd-mm-yyyy'), 30, 'Defibrillator', 63);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('15-11-2001', 'dd-mm-yyyy'), 31, 'Oxygen Tank', 39);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('03-12-1974', 'dd-mm-yyyy'), 32, 'Glucose Meter', 38);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('03-03-2014', 'dd-mm-yyyy'), 33, 'Oxygen Tank', 48);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('25-03-2015', 'dd-mm-yyyy'), 34, 'Blood Pressure Monitor', 90);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('22-07-1977', 'dd-mm-yyyy'), 35, 'Face Mask', 91);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('21-12-1973', 'dd-mm-yyyy'), 36, 'Glucose Meter', 36);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('03-07-1996', 'dd-mm-yyyy'), 37, 'First Aid Kit', 75);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('05-09-1970', 'dd-mm-yyyy'), 38, 'Surgical Gloves', 61);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('04-03-1988', 'dd-mm-yyyy'), 39, 'Face Mask', 75);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('12-10-1984', 'dd-mm-yyyy'), 40, 'CPR Manikin', 63);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('03-06-1987', 'dd-mm-yyyy'), 41, 'CPR Manikin', 86);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('02-07-1973', 'dd-mm-yyyy'), 42, 'Face Mask', 96);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('26-10-1996', 'dd-mm-yyyy'), 43, 'First Aid Kit', 100);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('22-06-2009', 'dd-mm-yyyy'), 44, 'Glucose Meter', 46);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('03-09-1992', 'dd-mm-yyyy'), 45, 'CPR Manikin', 31);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('02-02-2020', 'dd-mm-yyyy'), 46, 'Blood Pressure Monitor', 33);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('12-05-2012', 'dd-mm-yyyy'), 47, 'Thermometer', 89);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('03-04-1991', 'dd-mm-yyyy'), 48, 'Stethoscope', 62);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('20-06-1976', 'dd-mm-yyyy'), 49, 'CPR Manikin', 40);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('01-10-1971', 'dd-mm-yyyy'), 50, 'Face Mask', 83);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('13-01-1976', 'dd-mm-yyyy'), 51, 'Defibrillator', 71);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('14-04-2013', 'dd-mm-yyyy'), 52, 'Defibrillator', 71);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('21-10-2012', 'dd-mm-yyyy'), 53, 'Oxygen Tank', 43);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('10-09-1988', 'dd-mm-yyyy'), 54, 'Glucose Meter', 43);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('21-04-2007', 'dd-mm-yyyy'), 55, 'CPR Manikin', 74);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('29-06-1993', 'dd-mm-yyyy'), 56, 'Defibrillator', 45);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('07-11-2011', 'dd-mm-yyyy'), 57, 'Thermometer', 55);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('29-09-2004', 'dd-mm-yyyy'), 58, 'CPR Manikin', 80);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('22-05-1970', 'dd-mm-yyyy'), 59, 'Thermometer', 47);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('22-03-1993', 'dd-mm-yyyy'), 60, 'Oxygen Tank', 38);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('30-05-1987', 'dd-mm-yyyy'), 61, 'CPR Manikin', 60);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('21-06-1988', 'dd-mm-yyyy'), 62, 'CPR Manikin', 88);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('21-03-1982', 'dd-mm-yyyy'), 63, 'First Aid Kit', 58);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('08-04-2003', 'dd-mm-yyyy'), 64, 'First Aid Kit', 53);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('01-02-2009', 'dd-mm-yyyy'), 65, 'First Aid Kit', 53);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('13-12-1995', 'dd-mm-yyyy'), 66, 'Stethoscope', 87);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('19-03-1986', 'dd-mm-yyyy'), 67, 'CPR Manikin', 34);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('15-03-1974', 'dd-mm-yyyy'), 68, 'Stethoscope', 52);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('10-04-2022', 'dd-mm-yyyy'), 69, 'First Aid Kit', 51);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('02-12-2005', 'dd-mm-yyyy'), 70, 'First Aid Kit', 62);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('14-09-1985', 'dd-mm-yyyy'), 71, 'Glucose Meter', 93);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('05-07-2007', 'dd-mm-yyyy'), 72, 'First Aid Kit', 69);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('29-06-2002', 'dd-mm-yyyy'), 73, 'Stethoscope', 36);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('07-07-1973', 'dd-mm-yyyy'), 74, 'CPR Manikin', 40);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('19-05-2006', 'dd-mm-yyyy'), 75, 'Thermometer', 60);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('18-06-1989', 'dd-mm-yyyy'), 76, 'Defibrillator', 44);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('27-03-2006', 'dd-mm-yyyy'), 77, 'Blood Pressure Monitor', 33);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('09-04-2012', 'dd-mm-yyyy'), 78, 'Blood Pressure Monitor', 41);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('21-07-2004', 'dd-mm-yyyy'), 79, 'CPR Manikin', 54);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('30-03-2015', 'dd-mm-yyyy'), 80, 'Blood Pressure Monitor', 64);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('19-11-2017', 'dd-mm-yyyy'), 81, 'Oxygen Tank', 92);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('17-09-1979', 'dd-mm-yyyy'), 82, 'Stethoscope', 100);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('11-08-2005', 'dd-mm-yyyy'), 83, 'Defibrillator', 34);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('20-03-1994', 'dd-mm-yyyy'), 84, 'Glucose Meter', 46);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('19-10-1991', 'dd-mm-yyyy'), 85, 'Face Mask', 87);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('03-02-2023', 'dd-mm-yyyy'), 86, 'First Aid Kit', 39);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('05-07-2014', 'dd-mm-yyyy'), 87, 'Thermometer', 32);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('29-11-1972', 'dd-mm-yyyy'), 88, 'First Aid Kit', 55);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('25-02-2016', 'dd-mm-yyyy'), 89, 'Thermometer', 99);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('12-09-1983', 'dd-mm-yyyy'), 90, 'Glucose Meter', 57);
commit;
prompt 100 records committed...
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('19-08-2009', 'dd-mm-yyyy'), 91, 'First Aid Kit', 60);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('12-08-1971', 'dd-mm-yyyy'), 92, 'Stethoscope', 62);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('29-08-1998', 'dd-mm-yyyy'), 93, 'Oxygen Tank', 76);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('26-03-1999', 'dd-mm-yyyy'), 94, 'Surgical Gloves', 92);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('11-11-2020', 'dd-mm-yyyy'), 95, 'Blood Pressure Monitor', 100);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('15-01-1980', 'dd-mm-yyyy'), 96, 'Defibrillator', 93);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('18-09-2015', 'dd-mm-yyyy'), 97, 'Face Mask', 60);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('31-08-2013', 'dd-mm-yyyy'), 98, 'First Aid Kit', 51);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('24-03-1982', 'dd-mm-yyyy'), 99, 'First Aid Kit', 59);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('16-02-2015', 'dd-mm-yyyy'), 100, 'First Aid Kit', 75);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('05-02-1996', 'dd-mm-yyyy'), 101, 'Surgical Gloves', 61);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('04-03-2021', 'dd-mm-yyyy'), 102, 'Surgical Gloves', 95);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('06-12-1980', 'dd-mm-yyyy'), 103, 'Oxygen Tank', 46);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('23-04-1995', 'dd-mm-yyyy'), 104, 'CPR Manikin', 47);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('29-10-2015', 'dd-mm-yyyy'), 105, 'Surgical Gloves', 67);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('21-05-2022', 'dd-mm-yyyy'), 106, 'First Aid Kit', 63);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('25-02-1972', 'dd-mm-yyyy'), 107, 'Stethoscope', 59);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('25-04-2009', 'dd-mm-yyyy'), 108, 'First Aid Kit', 59);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('22-03-2010', 'dd-mm-yyyy'), 109, 'Surgical Gloves', 63);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('29-09-1980', 'dd-mm-yyyy'), 110, 'Oxygen Tank', 34);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('31-05-1986', 'dd-mm-yyyy'), 111, 'First Aid Kit', 33);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('22-12-2004', 'dd-mm-yyyy'), 112, 'Oxygen Tank', 100);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('20-10-1990', 'dd-mm-yyyy'), 113, 'Surgical Gloves', 40);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('01-02-1972', 'dd-mm-yyyy'), 114, 'Thermometer', 70);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('01-12-1979', 'dd-mm-yyyy'), 115, 'CPR Manikin', 71);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('29-11-1988', 'dd-mm-yyyy'), 116, 'Defibrillator', 73);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('12-02-1978', 'dd-mm-yyyy'), 117, 'Thermometer', 97);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('21-03-1978', 'dd-mm-yyyy'), 118, 'Surgical Gloves', 44);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('16-08-2003', 'dd-mm-yyyy'), 119, 'Blood Pressure Monitor', 89);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('11-09-2005', 'dd-mm-yyyy'), 120, 'Face Mask', 37);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('25-01-2009', 'dd-mm-yyyy'), 121, 'Surgical Gloves', 92);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('28-09-1976', 'dd-mm-yyyy'), 122, 'Thermometer', 43);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('24-06-1976', 'dd-mm-yyyy'), 123, 'Thermometer', 68);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('07-05-1988', 'dd-mm-yyyy'), 124, 'Defibrillator', 64);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('09-11-1996', 'dd-mm-yyyy'), 125, 'Surgical Gloves', 49);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('03-10-2020', 'dd-mm-yyyy'), 126, 'Face Mask', 87);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('08-08-1981', 'dd-mm-yyyy'), 127, 'Defibrillator', 38);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('13-09-2017', 'dd-mm-yyyy'), 128, 'First Aid Kit', 36);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('16-02-1991', 'dd-mm-yyyy'), 129, 'Defibrillator', 96);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('26-09-2015', 'dd-mm-yyyy'), 130, 'First Aid Kit', 46);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('07-10-2019', 'dd-mm-yyyy'), 131, 'CPR Manikin', 47);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('08-08-1975', 'dd-mm-yyyy'), 132, 'Face Mask', 44);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('23-05-1995', 'dd-mm-yyyy'), 133, 'CPR Manikin', 39);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('07-04-1994', 'dd-mm-yyyy'), 134, 'Blood Pressure Monitor', 87);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('29-01-2004', 'dd-mm-yyyy'), 135, 'Stethoscope', 94);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('09-05-2020', 'dd-mm-yyyy'), 136, 'Blood Pressure Monitor', 45);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('16-05-1970', 'dd-mm-yyyy'), 137, 'First Aid Kit', 94);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('13-11-1974', 'dd-mm-yyyy'), 138, 'Face Mask', 93);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('05-02-1983', 'dd-mm-yyyy'), 139, 'Blood Pressure Monitor', 57);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('19-06-1978', 'dd-mm-yyyy'), 140, 'Blood Pressure Monitor', 45);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('17-04-2017', 'dd-mm-yyyy'), 141, 'Blood Pressure Monitor', 59);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('11-08-2016', 'dd-mm-yyyy'), 142, 'Stethoscope', 41);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('06-05-1999', 'dd-mm-yyyy'), 143, 'Defibrillator', 55);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('31-01-1972', 'dd-mm-yyyy'), 144, 'First Aid Kit', 73);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('14-10-1992', 'dd-mm-yyyy'), 145, 'Glucose Meter', 55);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('09-10-2014', 'dd-mm-yyyy'), 146, 'CPR Manikin', 45);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('23-06-1975', 'dd-mm-yyyy'), 147, 'Thermometer', 88);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('24-02-1971', 'dd-mm-yyyy'), 148, 'First Aid Kit', 89);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('02-06-1980', 'dd-mm-yyyy'), 149, 'Stethoscope', 93);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('14-03-1984', 'dd-mm-yyyy'), 150, 'Face Mask', 93);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('23-12-1979', 'dd-mm-yyyy'), 151, 'Face Mask', 84);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('11-09-2022', 'dd-mm-yyyy'), 152, 'Defibrillator', 79);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('14-07-1979', 'dd-mm-yyyy'), 153, 'Thermometer', 43);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('07-09-1970', 'dd-mm-yyyy'), 154, 'Stethoscope', 48);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('05-10-1995', 'dd-mm-yyyy'), 155, 'Defibrillator', 73);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('16-04-2007', 'dd-mm-yyyy'), 156, 'CPR Manikin', 80);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('27-05-1993', 'dd-mm-yyyy'), 157, 'Thermometer', 90);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('13-12-1985', 'dd-mm-yyyy'), 158, 'CPR Manikin', 86);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('11-06-2002', 'dd-mm-yyyy'), 159, 'Blood Pressure Monitor', 95);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('23-01-2000', 'dd-mm-yyyy'), 160, 'Defibrillator', 59);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('18-05-1984', 'dd-mm-yyyy'), 161, 'CPR Manikin', 87);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('07-08-1997', 'dd-mm-yyyy'), 162, 'First Aid Kit', 80);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('17-09-2008', 'dd-mm-yyyy'), 163, 'Face Mask', 36);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('25-04-2005', 'dd-mm-yyyy'), 164, 'Face Mask', 70);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('17-01-1987', 'dd-mm-yyyy'), 165, 'Oxygen Tank', 52);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('18-08-2018', 'dd-mm-yyyy'), 166, 'Thermometer', 75);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('01-08-2008', 'dd-mm-yyyy'), 167, 'Oxygen Tank', 73);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('02-03-2007', 'dd-mm-yyyy'), 168, 'Thermometer', 83);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('15-01-1982', 'dd-mm-yyyy'), 169, 'First Aid Kit', 40);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('20-10-1976', 'dd-mm-yyyy'), 170, 'Blood Pressure Monitor', 43);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('28-11-2010', 'dd-mm-yyyy'), 171, 'CPR Manikin', 63);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('10-03-1996', 'dd-mm-yyyy'), 172, 'Oxygen Tank', 88);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('02-08-2010', 'dd-mm-yyyy'), 173, 'Blood Pressure Monitor', 50);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('28-07-1975', 'dd-mm-yyyy'), 174, 'Surgical Gloves', 95);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('20-12-1980', 'dd-mm-yyyy'), 175, 'Thermometer', 75);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('18-07-2023', 'dd-mm-yyyy'), 176, 'Glucose Meter', 38);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('16-05-1997', 'dd-mm-yyyy'), 177, 'CPR Manikin', 65);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('04-10-2005', 'dd-mm-yyyy'), 178, 'Oxygen Tank', 99);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('11-07-1978', 'dd-mm-yyyy'), 179, 'Stethoscope', 77);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('15-07-2023', 'dd-mm-yyyy'), 180, 'Glucose Meter', 59);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('29-10-2004', 'dd-mm-yyyy'), 181, 'Glucose Meter', 80);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('04-10-2016', 'dd-mm-yyyy'), 182, 'Face Mask', 44);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('13-02-1980', 'dd-mm-yyyy'), 183, 'Surgical Gloves', 30);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('05-02-2023', 'dd-mm-yyyy'), 184, 'Face Mask', 100);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('11-06-1981', 'dd-mm-yyyy'), 185, 'CPR Manikin', 37);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('29-05-1973', 'dd-mm-yyyy'), 186, 'Glucose Meter', 66);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('07-01-2021', 'dd-mm-yyyy'), 187, 'First Aid Kit', 57);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('21-02-2020', 'dd-mm-yyyy'), 188, 'CPR Manikin', 69);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('27-02-1970', 'dd-mm-yyyy'), 189, 'CPR Manikin', 44);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('23-04-1970', 'dd-mm-yyyy'), 190, 'Blood Pressure Monitor', 32);
commit;
prompt 200 records committed...
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('15-08-2009', 'dd-mm-yyyy'), 191, 'Face Mask', 64);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('08-04-2014', 'dd-mm-yyyy'), 192, 'Oxygen Tank', 61);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('27-06-1974', 'dd-mm-yyyy'), 193, 'Glucose Meter', 71);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('18-10-2002', 'dd-mm-yyyy'), 194, 'Glucose Meter', 42);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('02-09-1984', 'dd-mm-yyyy'), 195, 'Glucose Meter', 76);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('21-10-1984', 'dd-mm-yyyy'), 196, 'Defibrillator', 77);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('02-06-1989', 'dd-mm-yyyy'), 197, 'Defibrillator', 81);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('12-04-1979', 'dd-mm-yyyy'), 198, 'CPR Manikin', 59);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('12-02-1979', 'dd-mm-yyyy'), 199, 'CPR Manikin', 65);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('08-08-2002', 'dd-mm-yyyy'), 200, 'Thermometer', 86);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('21-09-2015', 'dd-mm-yyyy'), 201, 'CPR Manikin', 49);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('15-02-1979', 'dd-mm-yyyy'), 202, 'Blood Pressure Monitor', 93);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('28-12-2017', 'dd-mm-yyyy'), 203, 'Surgical Gloves', 67);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('12-08-1973', 'dd-mm-yyyy'), 204, 'Oxygen Tank', 53);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('12-09-1997', 'dd-mm-yyyy'), 205, 'Face Mask', 93);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('29-11-2017', 'dd-mm-yyyy'), 206, 'CPR Manikin', 85);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('16-02-1981', 'dd-mm-yyyy'), 207, 'Glucose Meter', 45);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('07-09-1983', 'dd-mm-yyyy'), 208, 'Blood Pressure Monitor', 61);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('10-07-1996', 'dd-mm-yyyy'), 219, 'Defibrillator', 53);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('10-06-1992', 'dd-mm-yyyy'), 220, 'Glucose Meter', 51);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('16-06-1987', 'dd-mm-yyyy'), 221, 'Defibrillator', 68);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('02-12-1975', 'dd-mm-yyyy'), 222, 'First Aid Kit', 83);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('04-08-1987', 'dd-mm-yyyy'), 223, 'Defibrillator', 92);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('25-10-1972', 'dd-mm-yyyy'), 224, 'Blood Pressure Monitor', 94);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('08-06-1978', 'dd-mm-yyyy'), 225, 'Oxygen Tank', 57);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('17-12-2014', 'dd-mm-yyyy'), 226, 'CPR Manikin', 48);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('16-12-2000', 'dd-mm-yyyy'), 227, 'Oxygen Tank', 94);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('15-06-2011', 'dd-mm-yyyy'), 228, 'Oxygen Tank', 90);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('04-05-2018', 'dd-mm-yyyy'), 229, 'Face Mask', 96);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('29-10-1984', 'dd-mm-yyyy'), 230, 'Thermometer', 77);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('19-07-1985', 'dd-mm-yyyy'), 231, 'CPR Manikin', 41);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('14-11-2013', 'dd-mm-yyyy'), 232, 'Face Mask', 97);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('08-04-1993', 'dd-mm-yyyy'), 233, 'Face Mask', 52);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('14-11-2007', 'dd-mm-yyyy'), 234, 'Surgical Gloves', 51);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('23-06-2011', 'dd-mm-yyyy'), 235, 'Face Mask', 36);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('14-09-2011', 'dd-mm-yyyy'), 236, 'Blood Pressure Monitor', 80);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('13-09-2010', 'dd-mm-yyyy'), 237, 'CPR Manikin', 52);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('11-07-2014', 'dd-mm-yyyy'), 238, 'Face Mask', 47);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('18-11-1999', 'dd-mm-yyyy'), 239, 'Face Mask', 57);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('29-02-1988', 'dd-mm-yyyy'), 240, 'Thermometer', 74);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('28-04-1990', 'dd-mm-yyyy'), 241, 'CPR Manikin', 65);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('30-01-1989', 'dd-mm-yyyy'), 242, 'First Aid Kit', 47);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('03-09-1986', 'dd-mm-yyyy'), 243, 'Face Mask', 76);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('15-06-1971', 'dd-mm-yyyy'), 244, 'Thermometer', 69);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('22-10-2023', 'dd-mm-yyyy'), 245, 'Thermometer', 62);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('22-06-1994', 'dd-mm-yyyy'), 246, 'CPR Manikin', 52);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('27-01-1976', 'dd-mm-yyyy'), 247, 'Face Mask', 52);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('01-08-1988', 'dd-mm-yyyy'), 248, 'First Aid Kit', 62);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('22-01-1972', 'dd-mm-yyyy'), 249, 'CPR Manikin', 98);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('29-03-1980', 'dd-mm-yyyy'), 250, 'Surgical Gloves', 97);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('05-04-2019', 'dd-mm-yyyy'), 251, 'Thermometer', 70);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('02-08-1971', 'dd-mm-yyyy'), 252, 'Blood Pressure Monitor', 40);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('07-02-2022', 'dd-mm-yyyy'), 253, 'Defibrillator', 56);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('19-06-1985', 'dd-mm-yyyy'), 254, 'Blood Pressure Monitor', 42);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('05-01-1979', 'dd-mm-yyyy'), 255, 'Defibrillator', 36);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('18-07-1991', 'dd-mm-yyyy'), 256, 'Glucose Meter', 79);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('08-03-1997', 'dd-mm-yyyy'), 257, 'First Aid Kit', 94);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('27-10-2011', 'dd-mm-yyyy'), 258, 'Blood Pressure Monitor', 96);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('13-08-2020', 'dd-mm-yyyy'), 259, 'Oxygen Tank', 98);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('25-06-2021', 'dd-mm-yyyy'), 260, 'Face Mask', 89);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('07-02-1979', 'dd-mm-yyyy'), 261, 'Defibrillator', 55);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('25-06-1989', 'dd-mm-yyyy'), 262, 'Thermometer', 62);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('24-12-2020', 'dd-mm-yyyy'), 263, 'Surgical Gloves', 76);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('08-07-2008', 'dd-mm-yyyy'), 264, 'Thermometer', 61);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('04-07-2009', 'dd-mm-yyyy'), 265, 'Face Mask', 62);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('28-02-2002', 'dd-mm-yyyy'), 266, 'Surgical Gloves', 65);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('15-03-1989', 'dd-mm-yyyy'), 267, 'Blood Pressure Monitor', 61);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('08-04-2023', 'dd-mm-yyyy'), 268, 'First Aid Kit', 92);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('16-02-1998', 'dd-mm-yyyy'), 269, 'Stethoscope', 99);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('21-11-1978', 'dd-mm-yyyy'), 270, 'Face Mask', 85);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('04-07-1987', 'dd-mm-yyyy'), 271, 'First Aid Kit', 55);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('29-12-1997', 'dd-mm-yyyy'), 272, 'Defibrillator', 92);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('08-08-2007', 'dd-mm-yyyy'), 273, 'Defibrillator', 46);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('14-11-2017', 'dd-mm-yyyy'), 274, 'Thermometer', 39);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('06-11-1998', 'dd-mm-yyyy'), 275, 'CPR Manikin', 72);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('05-06-1982', 'dd-mm-yyyy'), 276, 'CPR Manikin', 34);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('18-12-2017', 'dd-mm-yyyy'), 277, 'Defibrillator', 80);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('15-01-1983', 'dd-mm-yyyy'), 278, 'Surgical Gloves', 81);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('28-01-1985', 'dd-mm-yyyy'), 279, 'Oxygen Tank', 100);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('07-10-2023', 'dd-mm-yyyy'), 280, 'Blood Pressure Monitor', 70);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('28-05-2015', 'dd-mm-yyyy'), 281, 'First Aid Kit', 80);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('07-08-1997', 'dd-mm-yyyy'), 282, 'Stethoscope', 85);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('06-12-2014', 'dd-mm-yyyy'), 283, 'CPR Manikin', 98);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('19-10-1978', 'dd-mm-yyyy'), 284, 'Face Mask', 42);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('17-05-2021', 'dd-mm-yyyy'), 285, 'Defibrillator', 67);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('24-03-2016', 'dd-mm-yyyy'), 286, 'Surgical Gloves', 68);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('10-10-1976', 'dd-mm-yyyy'), 287, 'Glucose Meter', 36);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('18-08-2011', 'dd-mm-yyyy'), 288, 'CPR Manikin', 89);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('28-08-2015', 'dd-mm-yyyy'), 289, 'First Aid Kit', 58);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('11-03-2019', 'dd-mm-yyyy'), 290, 'First Aid Kit', 58);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('28-05-1970', 'dd-mm-yyyy'), 291, 'First Aid Kit', 42);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('17-12-2005', 'dd-mm-yyyy'), 292, 'Surgical Gloves', 82);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('21-06-1990', 'dd-mm-yyyy'), 293, 'CPR Manikin', 46);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('17-01-2009', 'dd-mm-yyyy'), 294, 'Defibrillator', 55);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('24-09-2001', 'dd-mm-yyyy'), 295, 'Blood Pressure Monitor', 65);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('09-06-2022', 'dd-mm-yyyy'), 296, 'Face Mask', 39);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('23-03-2008', 'dd-mm-yyyy'), 297, 'First Aid Kit', 94);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('19-03-1976', 'dd-mm-yyyy'), 298, 'Thermometer', 50);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('26-09-1993', 'dd-mm-yyyy'), 299, 'CPR Manikin', 65);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('18-12-2002', 'dd-mm-yyyy'), 300, 'CPR Manikin', 73);
commit;
prompt 300 records committed...
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('27-12-1986', 'dd-mm-yyyy'), 301, 'CPR Manikin', 74);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('29-01-2013', 'dd-mm-yyyy'), 302, 'Surgical Gloves', 94);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('01-07-2006', 'dd-mm-yyyy'), 303, 'First Aid Kit', 53);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('12-07-2015', 'dd-mm-yyyy'), 304, 'Thermometer', 67);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('21-04-1977', 'dd-mm-yyyy'), 305, 'Stethoscope', 78);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('12-11-2013', 'dd-mm-yyyy'), 306, 'Thermometer', 92);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('05-09-1978', 'dd-mm-yyyy'), 307, 'Oxygen Tank', 79);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('14-06-1970', 'dd-mm-yyyy'), 308, 'Defibrillator', 88);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('01-06-1979', 'dd-mm-yyyy'), 309, 'Stethoscope', 61);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('04-01-1977', 'dd-mm-yyyy'), 310, 'CPR Manikin', 98);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('08-04-1990', 'dd-mm-yyyy'), 311, 'Defibrillator', 44);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('17-07-2020', 'dd-mm-yyyy'), 312, 'Glucose Meter', 51);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('30-06-1983', 'dd-mm-yyyy'), 313, 'Oxygen Tank', 76);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('28-03-1996', 'dd-mm-yyyy'), 314, 'Stethoscope', 33);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('16-12-2007', 'dd-mm-yyyy'), 315, 'CPR Manikin', 35);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('28-02-2009', 'dd-mm-yyyy'), 316, 'First Aid Kit', 55);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('03-01-2011', 'dd-mm-yyyy'), 317, 'Blood Pressure Monitor', 42);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('28-01-2012', 'dd-mm-yyyy'), 318, 'CPR Manikin', 40);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('27-12-1977', 'dd-mm-yyyy'), 319, 'First Aid Kit', 85);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('08-08-2015', 'dd-mm-yyyy'), 320, 'Surgical Gloves', 63);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('30-09-2002', 'dd-mm-yyyy'), 321, 'Glucose Meter', 82);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('27-12-2002', 'dd-mm-yyyy'), 322, 'First Aid Kit', 37);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('19-10-2010', 'dd-mm-yyyy'), 323, 'Stethoscope', 36);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('20-10-2010', 'dd-mm-yyyy'), 324, 'Thermometer', 33);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('05-09-2006', 'dd-mm-yyyy'), 325, 'Face Mask', 74);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('28-11-2012', 'dd-mm-yyyy'), 326, 'Defibrillator', 60);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('03-05-1983', 'dd-mm-yyyy'), 327, 'First Aid Kit', 75);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('11-11-1997', 'dd-mm-yyyy'), 328, 'CPR Manikin', 66);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('08-03-1998', 'dd-mm-yyyy'), 329, 'Oxygen Tank', 99);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('07-05-2019', 'dd-mm-yyyy'), 330, 'Oxygen Tank', 51);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('10-05-2004', 'dd-mm-yyyy'), 331, 'Surgical Gloves', 97);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('15-04-1973', 'dd-mm-yyyy'), 332, 'First Aid Kit', 68);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('04-10-1974', 'dd-mm-yyyy'), 333, 'Thermometer', 55);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('06-10-1983', 'dd-mm-yyyy'), 334, 'Blood Pressure Monitor', 40);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('29-07-2015', 'dd-mm-yyyy'), 335, 'Defibrillator', 60);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('19-06-1976', 'dd-mm-yyyy'), 336, 'Face Mask', 35);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('22-10-2008', 'dd-mm-yyyy'), 337, 'Glucose Meter', 81);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('13-07-2007', 'dd-mm-yyyy'), 338, 'Face Mask', 89);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('31-12-2000', 'dd-mm-yyyy'), 339, 'Oxygen Tank', 89);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('11-05-2022', 'dd-mm-yyyy'), 340, 'Surgical Gloves', 48);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('14-08-2009', 'dd-mm-yyyy'), 341, 'Blood Pressure Monitor', 94);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('29-01-1990', 'dd-mm-yyyy'), 342, 'Face Mask', 73);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('15-04-2022', 'dd-mm-yyyy'), 343, 'First Aid Kit', 55);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('29-10-1995', 'dd-mm-yyyy'), 344, 'Glucose Meter', 82);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('25-01-1985', 'dd-mm-yyyy'), 345, 'Thermometer', 59);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('10-07-1981', 'dd-mm-yyyy'), 346, 'Surgical Gloves', 64);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('26-06-2013', 'dd-mm-yyyy'), 347, 'Face Mask', 42);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('05-08-1977', 'dd-mm-yyyy'), 348, 'Stethoscope', 68);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('19-03-1987', 'dd-mm-yyyy'), 349, 'Glucose Meter', 87);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('22-06-2005', 'dd-mm-yyyy'), 350, 'Thermometer', 47);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('23-12-1983', 'dd-mm-yyyy'), 351, 'Thermometer', 31);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('29-04-1973', 'dd-mm-yyyy'), 352, 'First Aid Kit', 95);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('25-04-2019', 'dd-mm-yyyy'), 353, 'Oxygen Tank', 53);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('22-03-1977', 'dd-mm-yyyy'), 354, 'Thermometer', 87);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('30-12-1995', 'dd-mm-yyyy'), 355, 'Stethoscope', 61);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('05-10-1974', 'dd-mm-yyyy'), 356, 'Surgical Gloves', 78);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('06-06-1979', 'dd-mm-yyyy'), 357, 'Surgical Gloves', 58);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('25-01-1978', 'dd-mm-yyyy'), 358, 'Defibrillator', 49);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('19-07-1998', 'dd-mm-yyyy'), 359, 'First Aid Kit', 65);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('18-05-1999', 'dd-mm-yyyy'), 360, 'Blood Pressure Monitor', 84);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('11-02-1999', 'dd-mm-yyyy'), 361, 'Blood Pressure Monitor', 33);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('17-12-1971', 'dd-mm-yyyy'), 362, 'Defibrillator', 93);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('25-01-1991', 'dd-mm-yyyy'), 363, 'Thermometer', 40);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('30-07-1984', 'dd-mm-yyyy'), 364, 'Blood Pressure Monitor', 48);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('19-05-1983', 'dd-mm-yyyy'), 365, 'Thermometer', 70);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('14-03-2008', 'dd-mm-yyyy'), 366, 'Face Mask', 31);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('02-09-1977', 'dd-mm-yyyy'), 367, 'First Aid Kit', 82);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('05-11-2019', 'dd-mm-yyyy'), 368, 'Glucose Meter', 38);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('18-06-1979', 'dd-mm-yyyy'), 369, 'Oxygen Tank', 88);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('02-06-2023', 'dd-mm-yyyy'), 370, 'Face Mask', 73);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('13-05-1996', 'dd-mm-yyyy'), 371, 'Thermometer', 38);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('30-10-2009', 'dd-mm-yyyy'), 372, 'Glucose Meter', 48);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('09-07-1991', 'dd-mm-yyyy'), 373, 'Surgical Gloves', 40);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('12-07-1989', 'dd-mm-yyyy'), 374, 'Defibrillator', 85);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('31-12-1980', 'dd-mm-yyyy'), 375, 'First Aid Kit', 55);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('12-11-1980', 'dd-mm-yyyy'), 376, 'Face Mask', 71);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('04-11-1977', 'dd-mm-yyyy'), 377, 'Stethoscope', 75);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('27-11-1979', 'dd-mm-yyyy'), 378, 'Defibrillator', 71);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('16-05-1983', 'dd-mm-yyyy'), 379, 'First Aid Kit', 44);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('08-11-1988', 'dd-mm-yyyy'), 380, 'Surgical Gloves', 64);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('01-09-1970', 'dd-mm-yyyy'), 381, 'Thermometer', 47);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('23-06-2009', 'dd-mm-yyyy'), 382, 'Stethoscope', 39);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('12-04-2000', 'dd-mm-yyyy'), 383, 'Oxygen Tank', 75);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('08-01-2004', 'dd-mm-yyyy'), 384, 'First Aid Kit', 72);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('11-03-2002', 'dd-mm-yyyy'), 385, 'Face Mask', 42);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('28-12-2003', 'dd-mm-yyyy'), 386, 'Glucose Meter', 65);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('28-11-2013', 'dd-mm-yyyy'), 387, 'Surgical Gloves', 44);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('09-06-1999', 'dd-mm-yyyy'), 388, 'Face Mask', 95);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('22-11-2019', 'dd-mm-yyyy'), 389, 'Blood Pressure Monitor', 51);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('03-02-1997', 'dd-mm-yyyy'), 390, 'Defibrillator', 30);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('05-05-2003', 'dd-mm-yyyy'), 391, 'Stethoscope', 97);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('26-11-1997', 'dd-mm-yyyy'), 392, 'Surgical Gloves', 75);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('18-09-1987', 'dd-mm-yyyy'), 393, 'Blood Pressure Monitor', 72);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('22-07-2019', 'dd-mm-yyyy'), 394, 'Surgical Gloves', 42);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('01-08-2022', 'dd-mm-yyyy'), 395, 'Stethoscope', 40);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('10-01-2007', 'dd-mm-yyyy'), 396, 'Defibrillator', 43);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('07-04-2005', 'dd-mm-yyyy'), 397, 'Thermometer', 30);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('31-03-2022', 'dd-mm-yyyy'), 398, 'CPR Manikin', 37);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('08-12-2021', 'dd-mm-yyyy'), 399, 'Blood Pressure Monitor', 52);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('19-01-2002', 'dd-mm-yyyy'), 400, 'First Aid Kit', 60);
commit;
prompt 400 records loaded
prompt Loading TEACHES_THE...
insert into TEACHES_THE (l_id, c_id)
values (484, 67);
insert into TEACHES_THE (l_id, c_id)
values (264, 10);
insert into TEACHES_THE (l_id, c_id)
values (196, 155);
insert into TEACHES_THE (l_id, c_id)
values (462, 156);
insert into TEACHES_THE (l_id, c_id)
values (145, 2);
insert into TEACHES_THE (l_id, c_id)
values (251, 107);
insert into TEACHES_THE (l_id, c_id)
values (465, 30);
insert into TEACHES_THE (l_id, c_id)
values (221, 280);
insert into TEACHES_THE (l_id, c_id)
values (432, 98);
insert into TEACHES_THE (l_id, c_id)
values (122, 21);
insert into TEACHES_THE (l_id, c_id)
values (287, 242);
insert into TEACHES_THE (l_id, c_id)
values (250, 209);
insert into TEACHES_THE (l_id, c_id)
values (146, 319);
insert into TEACHES_THE (l_id, c_id)
values (325, 21);
insert into TEACHES_THE (l_id, c_id)
values (460, 102);
insert into TEACHES_THE (l_id, c_id)
values (154, 67);
insert into TEACHES_THE (l_id, c_id)
values (447, 307);
insert into TEACHES_THE (l_id, c_id)
values (262, 14);
insert into TEACHES_THE (l_id, c_id)
values (358, 17);
insert into TEACHES_THE (l_id, c_id)
values (380, 383);
insert into TEACHES_THE (l_id, c_id)
values (404, 242);
insert into TEACHES_THE (l_id, c_id)
values (407, 21);
insert into TEACHES_THE (l_id, c_id)
values (311, 146);
insert into TEACHES_THE (l_id, c_id)
values (329, 386);
insert into TEACHES_THE (l_id, c_id)
values (104, 244);
insert into TEACHES_THE (l_id, c_id)
values (170, 377);
insert into TEACHES_THE (l_id, c_id)
values (441, 153);
insert into TEACHES_THE (l_id, c_id)
values (345, 360);
insert into TEACHES_THE (l_id, c_id)
values (123, 208);
insert into TEACHES_THE (l_id, c_id)
values (478, 134);
insert into TEACHES_THE (l_id, c_id)
values (489, 311);
insert into TEACHES_THE (l_id, c_id)
values (450, 77);
insert into TEACHES_THE (l_id, c_id)
values (116, 329);
insert into TEACHES_THE (l_id, c_id)
values (367, 15);
insert into TEACHES_THE (l_id, c_id)
values (157, 31);
insert into TEACHES_THE (l_id, c_id)
values (186, 63);
insert into TEACHES_THE (l_id, c_id)
values (315, 240);
insert into TEACHES_THE (l_id, c_id)
values (297, 181);
insert into TEACHES_THE (l_id, c_id)
values (384, 223);
insert into TEACHES_THE (l_id, c_id)
values (402, 80);
insert into TEACHES_THE (l_id, c_id)
values (496, 154);
insert into TEACHES_THE (l_id, c_id)
values (117, 168);
insert into TEACHES_THE (l_id, c_id)
values (479, 120);
insert into TEACHES_THE (l_id, c_id)
values (183, 336);
insert into TEACHES_THE (l_id, c_id)
values (142, 2);
insert into TEACHES_THE (l_id, c_id)
values (228, 143);
insert into TEACHES_THE (l_id, c_id)
values (337, 111);
insert into TEACHES_THE (l_id, c_id)
values (375, 154);
insert into TEACHES_THE (l_id, c_id)
values (257, 199);
insert into TEACHES_THE (l_id, c_id)
values (213, 353);
insert into TEACHES_THE (l_id, c_id)
values (408, 392);
insert into TEACHES_THE (l_id, c_id)
values (244, 117);
insert into TEACHES_THE (l_id, c_id)
values (224, 127);
insert into TEACHES_THE (l_id, c_id)
values (139, 108);
insert into TEACHES_THE (l_id, c_id)
values (130, 176);
insert into TEACHES_THE (l_id, c_id)
values (428, 255);
insert into TEACHES_THE (l_id, c_id)
values (398, 156);
insert into TEACHES_THE (l_id, c_id)
values (432, 41);
insert into TEACHES_THE (l_id, c_id)
values (381, 16);
insert into TEACHES_THE (l_id, c_id)
values (473, 264);
insert into TEACHES_THE (l_id, c_id)
values (276, 98);
insert into TEACHES_THE (l_id, c_id)
values (156, 296);
insert into TEACHES_THE (l_id, c_id)
values (414, 65);
insert into TEACHES_THE (l_id, c_id)
values (173, 200);
insert into TEACHES_THE (l_id, c_id)
values (397, 286);
insert into TEACHES_THE (l_id, c_id)
values (412, 338);
insert into TEACHES_THE (l_id, c_id)
values (118, 176);
insert into TEACHES_THE (l_id, c_id)
values (433, 10);
insert into TEACHES_THE (l_id, c_id)
values (359, 84);
insert into TEACHES_THE (l_id, c_id)
values (471, 391);
insert into TEACHES_THE (l_id, c_id)
values (401, 218);
insert into TEACHES_THE (l_id, c_id)
values (462, 274);
insert into TEACHES_THE (l_id, c_id)
values (166, 212);
insert into TEACHES_THE (l_id, c_id)
values (221, 99);
insert into TEACHES_THE (l_id, c_id)
values (496, 216);
insert into TEACHES_THE (l_id, c_id)
values (485, 183);
insert into TEACHES_THE (l_id, c_id)
values (102, 108);
insert into TEACHES_THE (l_id, c_id)
values (146, 14);
insert into TEACHES_THE (l_id, c_id)
values (196, 325);
insert into TEACHES_THE (l_id, c_id)
values (384, 340);
insert into TEACHES_THE (l_id, c_id)
values (324, 301);
insert into TEACHES_THE (l_id, c_id)
values (431, 307);
insert into TEACHES_THE (l_id, c_id)
values (216, 215);
insert into TEACHES_THE (l_id, c_id)
values (264, 380);
insert into TEACHES_THE (l_id, c_id)
values (183, 223);
insert into TEACHES_THE (l_id, c_id)
values (384, 302);
insert into TEACHES_THE (l_id, c_id)
values (269, 296);
insert into TEACHES_THE (l_id, c_id)
values (141, 222);
insert into TEACHES_THE (l_id, c_id)
values (473, 235);
insert into TEACHES_THE (l_id, c_id)
values (194, 43);
insert into TEACHES_THE (l_id, c_id)
values (482, 360);
insert into TEACHES_THE (l_id, c_id)
values (356, 141);
insert into TEACHES_THE (l_id, c_id)
values (199, 284);
insert into TEACHES_THE (l_id, c_id)
values (205, 277);
insert into TEACHES_THE (l_id, c_id)
values (125, 42);
insert into TEACHES_THE (l_id, c_id)
values (319, 71);
insert into TEACHES_THE (l_id, c_id)
values (275, 385);
insert into TEACHES_THE (l_id, c_id)
values (118, 66);
insert into TEACHES_THE (l_id, c_id)
values (474, 324);
insert into TEACHES_THE (l_id, c_id)
values (369, 126);
commit;
prompt 100 records committed...
insert into TEACHES_THE (l_id, c_id)
values (144, 124);
insert into TEACHES_THE (l_id, c_id)
values (122, 25);
insert into TEACHES_THE (l_id, c_id)
values (189, 42);
insert into TEACHES_THE (l_id, c_id)
values (366, 349);
insert into TEACHES_THE (l_id, c_id)
values (123, 391);
insert into TEACHES_THE (l_id, c_id)
values (342, 382);
insert into TEACHES_THE (l_id, c_id)
values (427, 239);
insert into TEACHES_THE (l_id, c_id)
values (209, 89);
insert into TEACHES_THE (l_id, c_id)
values (280, 132);
insert into TEACHES_THE (l_id, c_id)
values (218, 268);
insert into TEACHES_THE (l_id, c_id)
values (472, 326);
insert into TEACHES_THE (l_id, c_id)
values (268, 197);
insert into TEACHES_THE (l_id, c_id)
values (220, 133);
insert into TEACHES_THE (l_id, c_id)
values (208, 226);
insert into TEACHES_THE (l_id, c_id)
values (299, 75);
insert into TEACHES_THE (l_id, c_id)
values (157, 53);
insert into TEACHES_THE (l_id, c_id)
values (217, 223);
insert into TEACHES_THE (l_id, c_id)
values (214, 345);
insert into TEACHES_THE (l_id, c_id)
values (450, 242);
insert into TEACHES_THE (l_id, c_id)
values (219, 214);
insert into TEACHES_THE (l_id, c_id)
values (451, 307);
insert into TEACHES_THE (l_id, c_id)
values (338, 29);
insert into TEACHES_THE (l_id, c_id)
values (452, 206);
insert into TEACHES_THE (l_id, c_id)
values (143, 286);
insert into TEACHES_THE (l_id, c_id)
values (385, 17);
insert into TEACHES_THE (l_id, c_id)
values (353, 179);
insert into TEACHES_THE (l_id, c_id)
values (140, 239);
insert into TEACHES_THE (l_id, c_id)
values (303, 28);
insert into TEACHES_THE (l_id, c_id)
values (260, 199);
insert into TEACHES_THE (l_id, c_id)
values (312, 203);
insert into TEACHES_THE (l_id, c_id)
values (324, 397);
insert into TEACHES_THE (l_id, c_id)
values (222, 74);
insert into TEACHES_THE (l_id, c_id)
values (311, 211);
insert into TEACHES_THE (l_id, c_id)
values (269, 257);
insert into TEACHES_THE (l_id, c_id)
values (370, 38);
insert into TEACHES_THE (l_id, c_id)
values (163, 278);
insert into TEACHES_THE (l_id, c_id)
values (123, 262);
insert into TEACHES_THE (l_id, c_id)
values (337, 305);
insert into TEACHES_THE (l_id, c_id)
values (307, 367);
insert into TEACHES_THE (l_id, c_id)
values (244, 97);
insert into TEACHES_THE (l_id, c_id)
values (491, 358);
insert into TEACHES_THE (l_id, c_id)
values (261, 5);
insert into TEACHES_THE (l_id, c_id)
values (262, 4);
insert into TEACHES_THE (l_id, c_id)
values (278, 181);
insert into TEACHES_THE (l_id, c_id)
values (225, 290);
insert into TEACHES_THE (l_id, c_id)
values (126, 221);
insert into TEACHES_THE (l_id, c_id)
values (418, 374);
insert into TEACHES_THE (l_id, c_id)
values (336, 5);
insert into TEACHES_THE (l_id, c_id)
values (267, 237);
insert into TEACHES_THE (l_id, c_id)
values (175, 161);
insert into TEACHES_THE (l_id, c_id)
values (299, 128);
insert into TEACHES_THE (l_id, c_id)
values (440, 312);
insert into TEACHES_THE (l_id, c_id)
values (335, 394);
insert into TEACHES_THE (l_id, c_id)
values (173, 136);
insert into TEACHES_THE (l_id, c_id)
values (176, 184);
insert into TEACHES_THE (l_id, c_id)
values (174, 392);
insert into TEACHES_THE (l_id, c_id)
values (101, 31);
insert into TEACHES_THE (l_id, c_id)
values (272, 350);
insert into TEACHES_THE (l_id, c_id)
values (204, 196);
insert into TEACHES_THE (l_id, c_id)
values (226, 177);
insert into TEACHES_THE (l_id, c_id)
values (480, 373);
insert into TEACHES_THE (l_id, c_id)
values (225, 110);
insert into TEACHES_THE (l_id, c_id)
values (478, 48);
insert into TEACHES_THE (l_id, c_id)
values (255, 371);
insert into TEACHES_THE (l_id, c_id)
values (254, 104);
insert into TEACHES_THE (l_id, c_id)
values (106, 262);
insert into TEACHES_THE (l_id, c_id)
values (417, 368);
insert into TEACHES_THE (l_id, c_id)
values (276, 191);
insert into TEACHES_THE (l_id, c_id)
values (418, 296);
insert into TEACHES_THE (l_id, c_id)
values (163, 55);
insert into TEACHES_THE (l_id, c_id)
values (272, 77);
insert into TEACHES_THE (l_id, c_id)
values (379, 349);
insert into TEACHES_THE (l_id, c_id)
values (253, 369);
insert into TEACHES_THE (l_id, c_id)
values (198, 24);
insert into TEACHES_THE (l_id, c_id)
values (364, 150);
insert into TEACHES_THE (l_id, c_id)
values (365, 47);
insert into TEACHES_THE (l_id, c_id)
values (318, 269);
insert into TEACHES_THE (l_id, c_id)
values (468, 106);
insert into TEACHES_THE (l_id, c_id)
values (434, 16);
insert into TEACHES_THE (l_id, c_id)
values (116, 2);
insert into TEACHES_THE (l_id, c_id)
values (374, 73);
insert into TEACHES_THE (l_id, c_id)
values (112, 174);
insert into TEACHES_THE (l_id, c_id)
values (337, 170);
insert into TEACHES_THE (l_id, c_id)
values (279, 297);
insert into TEACHES_THE (l_id, c_id)
values (230, 218);
insert into TEACHES_THE (l_id, c_id)
values (304, 200);
insert into TEACHES_THE (l_id, c_id)
values (441, 220);
insert into TEACHES_THE (l_id, c_id)
values (486, 251);
insert into TEACHES_THE (l_id, c_id)
values (313, 361);
insert into TEACHES_THE (l_id, c_id)
values (131, 41);
insert into TEACHES_THE (l_id, c_id)
values (168, 354);
insert into TEACHES_THE (l_id, c_id)
values (290, 324);
insert into TEACHES_THE (l_id, c_id)
values (365, 56);
insert into TEACHES_THE (l_id, c_id)
values (391, 50);
insert into TEACHES_THE (l_id, c_id)
values (247, 231);
insert into TEACHES_THE (l_id, c_id)
values (434, 35);
insert into TEACHES_THE (l_id, c_id)
values (262, 60);
insert into TEACHES_THE (l_id, c_id)
values (128, 115);
insert into TEACHES_THE (l_id, c_id)
values (302, 100);
insert into TEACHES_THE (l_id, c_id)
values (434, 318);
commit;
prompt 200 records committed...
insert into TEACHES_THE (l_id, c_id)
values (164, 265);
insert into TEACHES_THE (l_id, c_id)
values (277, 318);
insert into TEACHES_THE (l_id, c_id)
values (158, 146);
insert into TEACHES_THE (l_id, c_id)
values (103, 289);
insert into TEACHES_THE (l_id, c_id)
values (382, 251);
insert into TEACHES_THE (l_id, c_id)
values (446, 24);
insert into TEACHES_THE (l_id, c_id)
values (475, 54);
insert into TEACHES_THE (l_id, c_id)
values (181, 50);
insert into TEACHES_THE (l_id, c_id)
values (178, 67);
insert into TEACHES_THE (l_id, c_id)
values (416, 191);
insert into TEACHES_THE (l_id, c_id)
values (308, 2);
insert into TEACHES_THE (l_id, c_id)
values (109, 314);
insert into TEACHES_THE (l_id, c_id)
values (282, 40);
insert into TEACHES_THE (l_id, c_id)
values (369, 109);
insert into TEACHES_THE (l_id, c_id)
values (387, 283);
insert into TEACHES_THE (l_id, c_id)
values (112, 49);
insert into TEACHES_THE (l_id, c_id)
values (341, 400);
insert into TEACHES_THE (l_id, c_id)
values (241, 159);
insert into TEACHES_THE (l_id, c_id)
values (131, 343);
insert into TEACHES_THE (l_id, c_id)
values (418, 158);
insert into TEACHES_THE (l_id, c_id)
values (489, 340);
insert into TEACHES_THE (l_id, c_id)
values (199, 201);
insert into TEACHES_THE (l_id, c_id)
values (377, 52);
insert into TEACHES_THE (l_id, c_id)
values (396, 374);
insert into TEACHES_THE (l_id, c_id)
values (244, 93);
insert into TEACHES_THE (l_id, c_id)
values (242, 385);
insert into TEACHES_THE (l_id, c_id)
values (241, 397);
insert into TEACHES_THE (l_id, c_id)
values (420, 187);
insert into TEACHES_THE (l_id, c_id)
values (329, 40);
insert into TEACHES_THE (l_id, c_id)
values (131, 389);
insert into TEACHES_THE (l_id, c_id)
values (499, 398);
insert into TEACHES_THE (l_id, c_id)
values (462, 191);
insert into TEACHES_THE (l_id, c_id)
values (214, 41);
insert into TEACHES_THE (l_id, c_id)
values (438, 282);
insert into TEACHES_THE (l_id, c_id)
values (300, 254);
insert into TEACHES_THE (l_id, c_id)
values (203, 260);
insert into TEACHES_THE (l_id, c_id)
values (195, 185);
insert into TEACHES_THE (l_id, c_id)
values (327, 205);
insert into TEACHES_THE (l_id, c_id)
values (395, 306);
insert into TEACHES_THE (l_id, c_id)
values (276, 148);
insert into TEACHES_THE (l_id, c_id)
values (384, 179);
insert into TEACHES_THE (l_id, c_id)
values (452, 90);
insert into TEACHES_THE (l_id, c_id)
values (100, 237);
insert into TEACHES_THE (l_id, c_id)
values (230, 109);
insert into TEACHES_THE (l_id, c_id)
values (230, 147);
insert into TEACHES_THE (l_id, c_id)
values (191, 192);
insert into TEACHES_THE (l_id, c_id)
values (374, 82);
insert into TEACHES_THE (l_id, c_id)
values (416, 350);
insert into TEACHES_THE (l_id, c_id)
values (170, 62);
insert into TEACHES_THE (l_id, c_id)
values (390, 50);
insert into TEACHES_THE (l_id, c_id)
values (233, 279);
insert into TEACHES_THE (l_id, c_id)
values (210, 105);
insert into TEACHES_THE (l_id, c_id)
values (194, 201);
insert into TEACHES_THE (l_id, c_id)
values (447, 279);
insert into TEACHES_THE (l_id, c_id)
values (482, 331);
insert into TEACHES_THE (l_id, c_id)
values (144, 333);
insert into TEACHES_THE (l_id, c_id)
values (147, 230);
insert into TEACHES_THE (l_id, c_id)
values (110, 376);
insert into TEACHES_THE (l_id, c_id)
values (370, 100);
insert into TEACHES_THE (l_id, c_id)
values (379, 42);
insert into TEACHES_THE (l_id, c_id)
values (145, 102);
insert into TEACHES_THE (l_id, c_id)
values (409, 160);
insert into TEACHES_THE (l_id, c_id)
values (380, 128);
insert into TEACHES_THE (l_id, c_id)
values (286, 240);
insert into TEACHES_THE (l_id, c_id)
values (324, 394);
insert into TEACHES_THE (l_id, c_id)
values (102, 34);
insert into TEACHES_THE (l_id, c_id)
values (333, 176);
insert into TEACHES_THE (l_id, c_id)
values (370, 307);
insert into TEACHES_THE (l_id, c_id)
values (310, 58);
insert into TEACHES_THE (l_id, c_id)
values (459, 68);
insert into TEACHES_THE (l_id, c_id)
values (421, 396);
insert into TEACHES_THE (l_id, c_id)
values (103, 396);
insert into TEACHES_THE (l_id, c_id)
values (416, 3);
insert into TEACHES_THE (l_id, c_id)
values (360, 315);
insert into TEACHES_THE (l_id, c_id)
values (370, 321);
insert into TEACHES_THE (l_id, c_id)
values (492, 255);
insert into TEACHES_THE (l_id, c_id)
values (162, 104);
insert into TEACHES_THE (l_id, c_id)
values (124, 345);
insert into TEACHES_THE (l_id, c_id)
values (319, 83);
insert into TEACHES_THE (l_id, c_id)
values (167, 81);
insert into TEACHES_THE (l_id, c_id)
values (123, 24);
insert into TEACHES_THE (l_id, c_id)
values (459, 10);
insert into TEACHES_THE (l_id, c_id)
values (232, 257);
insert into TEACHES_THE (l_id, c_id)
values (199, 187);
insert into TEACHES_THE (l_id, c_id)
values (297, 280);
insert into TEACHES_THE (l_id, c_id)
values (144, 225);
insert into TEACHES_THE (l_id, c_id)
values (229, 330);
insert into TEACHES_THE (l_id, c_id)
values (437, 308);
insert into TEACHES_THE (l_id, c_id)
values (203, 314);
insert into TEACHES_THE (l_id, c_id)
values (428, 186);
insert into TEACHES_THE (l_id, c_id)
values (246, 192);
insert into TEACHES_THE (l_id, c_id)
values (173, 121);
insert into TEACHES_THE (l_id, c_id)
values (303, 6);
insert into TEACHES_THE (l_id, c_id)
values (157, 203);
insert into TEACHES_THE (l_id, c_id)
values (220, 254);
insert into TEACHES_THE (l_id, c_id)
values (333, 197);
insert into TEACHES_THE (l_id, c_id)
values (347, 197);
insert into TEACHES_THE (l_id, c_id)
values (427, 161);
insert into TEACHES_THE (l_id, c_id)
values (393, 192);
insert into TEACHES_THE (l_id, c_id)
values (392, 172);
commit;
prompt 300 records committed...
insert into TEACHES_THE (l_id, c_id)
values (242, 252);
insert into TEACHES_THE (l_id, c_id)
values (364, 11);
insert into TEACHES_THE (l_id, c_id)
values (151, 316);
insert into TEACHES_THE (l_id, c_id)
values (412, 149);
insert into TEACHES_THE (l_id, c_id)
values (253, 235);
insert into TEACHES_THE (l_id, c_id)
values (421, 277);
insert into TEACHES_THE (l_id, c_id)
values (179, 359);
insert into TEACHES_THE (l_id, c_id)
values (208, 121);
insert into TEACHES_THE (l_id, c_id)
values (120, 118);
insert into TEACHES_THE (l_id, c_id)
values (411, 195);
insert into TEACHES_THE (l_id, c_id)
values (346, 101);
insert into TEACHES_THE (l_id, c_id)
values (441, 221);
insert into TEACHES_THE (l_id, c_id)
values (304, 10);
insert into TEACHES_THE (l_id, c_id)
values (255, 276);
insert into TEACHES_THE (l_id, c_id)
values (112, 205);
insert into TEACHES_THE (l_id, c_id)
values (425, 196);
insert into TEACHES_THE (l_id, c_id)
values (163, 210);
insert into TEACHES_THE (l_id, c_id)
values (261, 90);
insert into TEACHES_THE (l_id, c_id)
values (266, 91);
insert into TEACHES_THE (l_id, c_id)
values (274, 104);
insert into TEACHES_THE (l_id, c_id)
values (241, 293);
insert into TEACHES_THE (l_id, c_id)
values (128, 78);
insert into TEACHES_THE (l_id, c_id)
values (379, 26);
insert into TEACHES_THE (l_id, c_id)
values (166, 242);
insert into TEACHES_THE (l_id, c_id)
values (295, 9);
insert into TEACHES_THE (l_id, c_id)
values (270, 191);
insert into TEACHES_THE (l_id, c_id)
values (390, 242);
insert into TEACHES_THE (l_id, c_id)
values (328, 292);
insert into TEACHES_THE (l_id, c_id)
values (237, 20);
insert into TEACHES_THE (l_id, c_id)
values (271, 151);
insert into TEACHES_THE (l_id, c_id)
values (316, 278);
insert into TEACHES_THE (l_id, c_id)
values (156, 98);
insert into TEACHES_THE (l_id, c_id)
values (409, 51);
insert into TEACHES_THE (l_id, c_id)
values (461, 134);
insert into TEACHES_THE (l_id, c_id)
values (483, 153);
insert into TEACHES_THE (l_id, c_id)
values (453, 64);
insert into TEACHES_THE (l_id, c_id)
values (374, 71);
insert into TEACHES_THE (l_id, c_id)
values (218, 288);
insert into TEACHES_THE (l_id, c_id)
values (288, 153);
insert into TEACHES_THE (l_id, c_id)
values (394, 375);
insert into TEACHES_THE (l_id, c_id)
values (244, 100);
insert into TEACHES_THE (l_id, c_id)
values (199, 266);
insert into TEACHES_THE (l_id, c_id)
values (277, 50);
insert into TEACHES_THE (l_id, c_id)
values (414, 253);
insert into TEACHES_THE (l_id, c_id)
values (118, 240);
insert into TEACHES_THE (l_id, c_id)
values (486, 386);
insert into TEACHES_THE (l_id, c_id)
values (361, 150);
insert into TEACHES_THE (l_id, c_id)
values (226, 26);
insert into TEACHES_THE (l_id, c_id)
values (459, 125);
insert into TEACHES_THE (l_id, c_id)
values (268, 22);
insert into TEACHES_THE (l_id, c_id)
values (143, 154);
insert into TEACHES_THE (l_id, c_id)
values (358, 27);
insert into TEACHES_THE (l_id, c_id)
values (191, 211);
insert into TEACHES_THE (l_id, c_id)
values (243, 13);
insert into TEACHES_THE (l_id, c_id)
values (179, 255);
insert into TEACHES_THE (l_id, c_id)
values (422, 322);
insert into TEACHES_THE (l_id, c_id)
values (112, 72);
insert into TEACHES_THE (l_id, c_id)
values (143, 300);
insert into TEACHES_THE (l_id, c_id)
values (164, 57);
insert into TEACHES_THE (l_id, c_id)
values (498, 56);
insert into TEACHES_THE (l_id, c_id)
values (449, 136);
insert into TEACHES_THE (l_id, c_id)
values (190, 389);
insert into TEACHES_THE (l_id, c_id)
values (437, 114);
insert into TEACHES_THE (l_id, c_id)
values (453, 30);
insert into TEACHES_THE (l_id, c_id)
values (127, 40);
insert into TEACHES_THE (l_id, c_id)
values (469, 237);
insert into TEACHES_THE (l_id, c_id)
values (416, 100);
insert into TEACHES_THE (l_id, c_id)
values (380, 96);
insert into TEACHES_THE (l_id, c_id)
values (159, 8);
insert into TEACHES_THE (l_id, c_id)
values (234, 362);
insert into TEACHES_THE (l_id, c_id)
values (357, 5);
insert into TEACHES_THE (l_id, c_id)
values (161, 186);
insert into TEACHES_THE (l_id, c_id)
values (376, 59);
insert into TEACHES_THE (l_id, c_id)
values (331, 381);
insert into TEACHES_THE (l_id, c_id)
values (437, 347);
insert into TEACHES_THE (l_id, c_id)
values (162, 157);
insert into TEACHES_THE (l_id, c_id)
values (268, 235);
insert into TEACHES_THE (l_id, c_id)
values (358, 375);
insert into TEACHES_THE (l_id, c_id)
values (363, 220);
insert into TEACHES_THE (l_id, c_id)
values (240, 69);
insert into TEACHES_THE (l_id, c_id)
values (353, 259);
insert into TEACHES_THE (l_id, c_id)
values (134, 270);
insert into TEACHES_THE (l_id, c_id)
values (306, 358);
insert into TEACHES_THE (l_id, c_id)
values (290, 82);
insert into TEACHES_THE (l_id, c_id)
values (481, 216);
insert into TEACHES_THE (l_id, c_id)
values (304, 52);
insert into TEACHES_THE (l_id, c_id)
values (357, 32);
insert into TEACHES_THE (l_id, c_id)
values (305, 380);
insert into TEACHES_THE (l_id, c_id)
values (246, 253);
insert into TEACHES_THE (l_id, c_id)
values (472, 4);
insert into TEACHES_THE (l_id, c_id)
values (115, 164);
insert into TEACHES_THE (l_id, c_id)
values (369, 320);
insert into TEACHES_THE (l_id, c_id)
values (338, 116);
insert into TEACHES_THE (l_id, c_id)
values (443, 164);
insert into TEACHES_THE (l_id, c_id)
values (391, 275);
insert into TEACHES_THE (l_id, c_id)
values (170, 10);
insert into TEACHES_THE (l_id, c_id)
values (413, 103);
insert into TEACHES_THE (l_id, c_id)
values (210, 219);
insert into TEACHES_THE (l_id, c_id)
values (246, 47);
insert into TEACHES_THE (l_id, c_id)
values (442, 302);
commit;
prompt 400 records loaded
prompt Loading USES...
insert into USES (c_id, e_id)
values (265, 128);
insert into USES (c_id, e_id)
values (215, 104);
insert into USES (c_id, e_id)
values (251, 214);
insert into USES (c_id, e_id)
values (275, 58);
insert into USES (c_id, e_id)
values (107, 30);
insert into USES (c_id, e_id)
values (242, 137);
insert into USES (c_id, e_id)
values (96, 245);
insert into USES (c_id, e_id)
values (100, 17);
insert into USES (c_id, e_id)
values (99, 252);
insert into USES (c_id, e_id)
values (225, 113);
insert into USES (c_id, e_id)
values (311, 358);
insert into USES (c_id, e_id)
values (202, 1);
insert into USES (c_id, e_id)
values (42, 97);
insert into USES (c_id, e_id)
values (248, 371);
insert into USES (c_id, e_id)
values (76, 268);
insert into USES (c_id, e_id)
values (372, 300);
insert into USES (c_id, e_id)
values (331, 106);
insert into USES (c_id, e_id)
values (23, 378);
insert into USES (c_id, e_id)
values (267, 12);
insert into USES (c_id, e_id)
values (355, 352);
insert into USES (c_id, e_id)
values (373, 294);
insert into USES (c_id, e_id)
values (90, 217);
insert into USES (c_id, e_id)
values (397, 64);
insert into USES (c_id, e_id)
values (62, 294);
insert into USES (c_id, e_id)
values (40, 194);
insert into USES (c_id, e_id)
values (55, 267);
insert into USES (c_id, e_id)
values (379, 88);
insert into USES (c_id, e_id)
values (16, 336);
insert into USES (c_id, e_id)
values (344, 325);
insert into USES (c_id, e_id)
values (240, 365);
insert into USES (c_id, e_id)
values (310, 318);
insert into USES (c_id, e_id)
values (20, 98);
insert into USES (c_id, e_id)
values (134, 351);
insert into USES (c_id, e_id)
values (363, 334);
insert into USES (c_id, e_id)
values (285, 158);
insert into USES (c_id, e_id)
values (49, 331);
insert into USES (c_id, e_id)
values (20, 4);
insert into USES (c_id, e_id)
values (48, 341);
insert into USES (c_id, e_id)
values (232, 272);
insert into USES (c_id, e_id)
values (170, 400);
insert into USES (c_id, e_id)
values (326, 15);
insert into USES (c_id, e_id)
values (352, 352);
insert into USES (c_id, e_id)
values (173, 151);
insert into USES (c_id, e_id)
values (280, 305);
insert into USES (c_id, e_id)
values (260, 349);
insert into USES (c_id, e_id)
values (321, 92);
insert into USES (c_id, e_id)
values (115, 86);
insert into USES (c_id, e_id)
values (81, 57);
insert into USES (c_id, e_id)
values (315, 191);
insert into USES (c_id, e_id)
values (170, 191);
insert into USES (c_id, e_id)
values (355, 235);
insert into USES (c_id, e_id)
values (68, 302);
insert into USES (c_id, e_id)
values (292, 153);
insert into USES (c_id, e_id)
values (291, 359);
insert into USES (c_id, e_id)
values (225, 314);
insert into USES (c_id, e_id)
values (347, 315);
insert into USES (c_id, e_id)
values (152, 27);
insert into USES (c_id, e_id)
values (79, 340);
insert into USES (c_id, e_id)
values (46, 252);
insert into USES (c_id, e_id)
values (82, 100);
insert into USES (c_id, e_id)
values (88, 218);
insert into USES (c_id, e_id)
values (194, 28);
insert into USES (c_id, e_id)
values (317, 81);
insert into USES (c_id, e_id)
values (358, 336);
insert into USES (c_id, e_id)
values (223, 352);
insert into USES (c_id, e_id)
values (234, 282);
insert into USES (c_id, e_id)
values (132, 39);
insert into USES (c_id, e_id)
values (76, 136);
insert into USES (c_id, e_id)
values (338, 29);
insert into USES (c_id, e_id)
values (246, 359);
insert into USES (c_id, e_id)
values (8, 305);
insert into USES (c_id, e_id)
values (75, 177);
insert into USES (c_id, e_id)
values (18, 296);
insert into USES (c_id, e_id)
values (55, 271);
insert into USES (c_id, e_id)
values (354, 103);
insert into USES (c_id, e_id)
values (265, 321);
insert into USES (c_id, e_id)
values (28, 270);
insert into USES (c_id, e_id)
values (16, 99);
insert into USES (c_id, e_id)
values (353, 225);
insert into USES (c_id, e_id)
values (207, 47);
insert into USES (c_id, e_id)
values (111, 16);
insert into USES (c_id, e_id)
values (2, 147);
insert into USES (c_id, e_id)
values (76, 261);
insert into USES (c_id, e_id)
values (297, 113);
insert into USES (c_id, e_id)
values (13, 58);
insert into USES (c_id, e_id)
values (201, 109);
insert into USES (c_id, e_id)
values (219, 174);
insert into USES (c_id, e_id)
values (388, 349);
insert into USES (c_id, e_id)
values (132, 174);
insert into USES (c_id, e_id)
values (152, 269);
insert into USES (c_id, e_id)
values (263, 312);
insert into USES (c_id, e_id)
values (231, 288);
insert into USES (c_id, e_id)
values (191, 10);
insert into USES (c_id, e_id)
values (1, 124);
insert into USES (c_id, e_id)
values (262, 252);
insert into USES (c_id, e_id)
values (145, 141);
insert into USES (c_id, e_id)
values (341, 161);
insert into USES (c_id, e_id)
values (375, 291);
insert into USES (c_id, e_id)
values (255, 359);
insert into USES (c_id, e_id)
values (309, 66);
commit;
prompt 100 records committed...
insert into USES (c_id, e_id)
values (279, 198);
insert into USES (c_id, e_id)
values (95, 86);
insert into USES (c_id, e_id)
values (101, 107);
insert into USES (c_id, e_id)
values (280, 104);
insert into USES (c_id, e_id)
values (6, 9);
insert into USES (c_id, e_id)
values (103, 128);
insert into USES (c_id, e_id)
values (142, 250);
insert into USES (c_id, e_id)
values (335, 136);
insert into USES (c_id, e_id)
values (190, 75);
insert into USES (c_id, e_id)
values (17, 202);
insert into USES (c_id, e_id)
values (291, 145);
insert into USES (c_id, e_id)
values (241, 112);
insert into USES (c_id, e_id)
values (177, 270);
insert into USES (c_id, e_id)
values (113, 18);
insert into USES (c_id, e_id)
values (341, 259);
insert into USES (c_id, e_id)
values (246, 229);
insert into USES (c_id, e_id)
values (4, 349);
insert into USES (c_id, e_id)
values (328, 232);
insert into USES (c_id, e_id)
values (303, 96);
insert into USES (c_id, e_id)
values (299, 164);
insert into USES (c_id, e_id)
values (59, 248);
insert into USES (c_id, e_id)
values (295, 152);
insert into USES (c_id, e_id)
values (368, 151);
insert into USES (c_id, e_id)
values (290, 215);
insert into USES (c_id, e_id)
values (347, 10);
insert into USES (c_id, e_id)
values (393, 324);
insert into USES (c_id, e_id)
values (94, 139);
insert into USES (c_id, e_id)
values (122, 44);
insert into USES (c_id, e_id)
values (192, 336);
insert into USES (c_id, e_id)
values (231, 394);
insert into USES (c_id, e_id)
values (15, 309);
insert into USES (c_id, e_id)
values (399, 386);
insert into USES (c_id, e_id)
values (363, 312);
insert into USES (c_id, e_id)
values (154, 347);
insert into USES (c_id, e_id)
values (83, 380);
insert into USES (c_id, e_id)
values (150, 197);
insert into USES (c_id, e_id)
values (19, 250);
insert into USES (c_id, e_id)
values (170, 309);
insert into USES (c_id, e_id)
values (124, 308);
insert into USES (c_id, e_id)
values (366, 369);
insert into USES (c_id, e_id)
values (89, 101);
insert into USES (c_id, e_id)
values (309, 331);
insert into USES (c_id, e_id)
values (329, 282);
insert into USES (c_id, e_id)
values (171, 203);
insert into USES (c_id, e_id)
values (266, 103);
insert into USES (c_id, e_id)
values (1, 86);
insert into USES (c_id, e_id)
values (162, 80);
insert into USES (c_id, e_id)
values (16, 333);
insert into USES (c_id, e_id)
values (34, 249);
insert into USES (c_id, e_id)
values (83, 135);
insert into USES (c_id, e_id)
values (102, 193);
insert into USES (c_id, e_id)
values (295, 56);
insert into USES (c_id, e_id)
values (116, 334);
insert into USES (c_id, e_id)
values (229, 226);
insert into USES (c_id, e_id)
values (198, 177);
insert into USES (c_id, e_id)
values (187, 97);
insert into USES (c_id, e_id)
values (349, 167);
insert into USES (c_id, e_id)
values (205, 377);
insert into USES (c_id, e_id)
values (262, 21);
insert into USES (c_id, e_id)
values (328, 246);
insert into USES (c_id, e_id)
values (384, 277);
insert into USES (c_id, e_id)
values (150, 323);
insert into USES (c_id, e_id)
values (75, 1);
insert into USES (c_id, e_id)
values (100, 239);
insert into USES (c_id, e_id)
values (6, 244);
insert into USES (c_id, e_id)
values (282, 215);
insert into USES (c_id, e_id)
values (30, 268);
insert into USES (c_id, e_id)
values (351, 182);
insert into USES (c_id, e_id)
values (289, 132);
insert into USES (c_id, e_id)
values (27, 32);
insert into USES (c_id, e_id)
values (187, 113);
insert into USES (c_id, e_id)
values (336, 69);
insert into USES (c_id, e_id)
values (368, 366);
insert into USES (c_id, e_id)
values (175, 75);
insert into USES (c_id, e_id)
values (165, 305);
insert into USES (c_id, e_id)
values (89, 381);
insert into USES (c_id, e_id)
values (236, 25);
insert into USES (c_id, e_id)
values (62, 344);
insert into USES (c_id, e_id)
values (252, 104);
insert into USES (c_id, e_id)
values (211, 250);
insert into USES (c_id, e_id)
values (371, 310);
insert into USES (c_id, e_id)
values (174, 191);
insert into USES (c_id, e_id)
values (140, 299);
insert into USES (c_id, e_id)
values (292, 209);
insert into USES (c_id, e_id)
values (183, 246);
insert into USES (c_id, e_id)
values (176, 368);
insert into USES (c_id, e_id)
values (91, 64);
insert into USES (c_id, e_id)
values (351, 325);
insert into USES (c_id, e_id)
values (91, 359);
insert into USES (c_id, e_id)
values (371, 153);
insert into USES (c_id, e_id)
values (116, 245);
insert into USES (c_id, e_id)
values (105, 228);
insert into USES (c_id, e_id)
values (21, 324);
insert into USES (c_id, e_id)
values (178, 310);
insert into USES (c_id, e_id)
values (397, 63);
insert into USES (c_id, e_id)
values (65, 88);
insert into USES (c_id, e_id)
values (327, 394);
insert into USES (c_id, e_id)
values (38, 61);
insert into USES (c_id, e_id)
values (116, 253);
insert into USES (c_id, e_id)
values (48, 295);
commit;
prompt 200 records committed...
insert into USES (c_id, e_id)
values (347, 140);
insert into USES (c_id, e_id)
values (345, 295);
insert into USES (c_id, e_id)
values (318, 20);
insert into USES (c_id, e_id)
values (324, 55);
insert into USES (c_id, e_id)
values (171, 157);
insert into USES (c_id, e_id)
values (200, 395);
insert into USES (c_id, e_id)
values (400, 13);
insert into USES (c_id, e_id)
values (185, 377);
insert into USES (c_id, e_id)
values (42, 203);
insert into USES (c_id, e_id)
values (393, 43);
insert into USES (c_id, e_id)
values (222, 392);
insert into USES (c_id, e_id)
values (334, 293);
insert into USES (c_id, e_id)
values (182, 373);
insert into USES (c_id, e_id)
values (210, 36);
insert into USES (c_id, e_id)
values (243, 317);
insert into USES (c_id, e_id)
values (305, 45);
insert into USES (c_id, e_id)
values (240, 288);
insert into USES (c_id, e_id)
values (57, 186);
insert into USES (c_id, e_id)
values (82, 217);
insert into USES (c_id, e_id)
values (108, 91);
insert into USES (c_id, e_id)
values (366, 122);
insert into USES (c_id, e_id)
values (325, 42);
insert into USES (c_id, e_id)
values (306, 30);
insert into USES (c_id, e_id)
values (93, 209);
insert into USES (c_id, e_id)
values (310, 95);
insert into USES (c_id, e_id)
values (61, 288);
insert into USES (c_id, e_id)
values (243, 215);
insert into USES (c_id, e_id)
values (246, 118);
insert into USES (c_id, e_id)
values (146, 45);
insert into USES (c_id, e_id)
values (281, 24);
insert into USES (c_id, e_id)
values (216, 99);
insert into USES (c_id, e_id)
values (106, 34);
insert into USES (c_id, e_id)
values (224, 17);
insert into USES (c_id, e_id)
values (295, 115);
insert into USES (c_id, e_id)
values (204, 54);
insert into USES (c_id, e_id)
values (107, 5);
insert into USES (c_id, e_id)
values (341, 119);
insert into USES (c_id, e_id)
values (266, 281);
insert into USES (c_id, e_id)
values (133, 122);
insert into USES (c_id, e_id)
values (349, 42);
insert into USES (c_id, e_id)
values (140, 119);
insert into USES (c_id, e_id)
values (390, 198);
insert into USES (c_id, e_id)
values (185, 284);
insert into USES (c_id, e_id)
values (386, 66);
insert into USES (c_id, e_id)
values (337, 381);
insert into USES (c_id, e_id)
values (299, 224);
insert into USES (c_id, e_id)
values (334, 280);
insert into USES (c_id, e_id)
values (49, 213);
insert into USES (c_id, e_id)
values (369, 55);
insert into USES (c_id, e_id)
values (294, 207);
insert into USES (c_id, e_id)
values (309, 276);
insert into USES (c_id, e_id)
values (86, 162);
insert into USES (c_id, e_id)
values (67, 362);
insert into USES (c_id, e_id)
values (400, 104);
insert into USES (c_id, e_id)
values (382, 364);
insert into USES (c_id, e_id)
values (231, 56);
insert into USES (c_id, e_id)
values (156, 139);
insert into USES (c_id, e_id)
values (46, 289);
insert into USES (c_id, e_id)
values (176, 223);
insert into USES (c_id, e_id)
values (296, 182);
insert into USES (c_id, e_id)
values (380, 219);
insert into USES (c_id, e_id)
values (369, 290);
insert into USES (c_id, e_id)
values (304, 99);
insert into USES (c_id, e_id)
values (290, 263);
insert into USES (c_id, e_id)
values (51, 19);
insert into USES (c_id, e_id)
values (349, 289);
insert into USES (c_id, e_id)
values (32, 360);
insert into USES (c_id, e_id)
values (363, 108);
insert into USES (c_id, e_id)
values (221, 159);
insert into USES (c_id, e_id)
values (359, 52);
insert into USES (c_id, e_id)
values (163, 231);
insert into USES (c_id, e_id)
values (171, 148);
insert into USES (c_id, e_id)
values (286, 150);
insert into USES (c_id, e_id)
values (350, 289);
insert into USES (c_id, e_id)
values (352, 42);
insert into USES (c_id, e_id)
values (72, 102);
insert into USES (c_id, e_id)
values (204, 374);
insert into USES (c_id, e_id)
values (252, 172);
insert into USES (c_id, e_id)
values (38, 310);
insert into USES (c_id, e_id)
values (140, 115);
insert into USES (c_id, e_id)
values (351, 70);
insert into USES (c_id, e_id)
values (209, 239);
insert into USES (c_id, e_id)
values (210, 52);
insert into USES (c_id, e_id)
values (214, 169);
insert into USES (c_id, e_id)
values (187, 7);
insert into USES (c_id, e_id)
values (232, 109);
insert into USES (c_id, e_id)
values (393, 264);
insert into USES (c_id, e_id)
values (160, 225);
insert into USES (c_id, e_id)
values (165, 287);
insert into USES (c_id, e_id)
values (79, 35);
insert into USES (c_id, e_id)
values (56, 22);
insert into USES (c_id, e_id)
values (367, 253);
insert into USES (c_id, e_id)
values (47, 378);
insert into USES (c_id, e_id)
values (163, 124);
insert into USES (c_id, e_id)
values (55, 226);
insert into USES (c_id, e_id)
values (66, 279);
insert into USES (c_id, e_id)
values (57, 100);
insert into USES (c_id, e_id)
values (279, 35);
insert into USES (c_id, e_id)
values (90, 356);
insert into USES (c_id, e_id)
values (270, 263);
commit;
prompt 300 records committed...
insert into USES (c_id, e_id)
values (55, 305);
insert into USES (c_id, e_id)
values (162, 148);
insert into USES (c_id, e_id)
values (191, 9);
insert into USES (c_id, e_id)
values (142, 346);
insert into USES (c_id, e_id)
values (335, 387);
insert into USES (c_id, e_id)
values (268, 279);
insert into USES (c_id, e_id)
values (236, 45);
insert into USES (c_id, e_id)
values (393, 204);
insert into USES (c_id, e_id)
values (52, 85);
insert into USES (c_id, e_id)
values (376, 262);
insert into USES (c_id, e_id)
values (280, 231);
insert into USES (c_id, e_id)
values (92, 394);
insert into USES (c_id, e_id)
values (65, 129);
insert into USES (c_id, e_id)
values (22, 158);
insert into USES (c_id, e_id)
values (121, 251);
insert into USES (c_id, e_id)
values (118, 259);
insert into USES (c_id, e_id)
values (221, 154);
insert into USES (c_id, e_id)
values (353, 336);
insert into USES (c_id, e_id)
values (88, 78);
insert into USES (c_id, e_id)
values (20, 379);
insert into USES (c_id, e_id)
values (244, 37);
insert into USES (c_id, e_id)
values (207, 180);
insert into USES (c_id, e_id)
values (247, 34);
insert into USES (c_id, e_id)
values (313, 376);
insert into USES (c_id, e_id)
values (267, 112);
insert into USES (c_id, e_id)
values (20, 152);
insert into USES (c_id, e_id)
values (44, 122);
insert into USES (c_id, e_id)
values (199, 319);
insert into USES (c_id, e_id)
values (175, 323);
insert into USES (c_id, e_id)
values (356, 350);
insert into USES (c_id, e_id)
values (364, 386);
insert into USES (c_id, e_id)
values (304, 28);
insert into USES (c_id, e_id)
values (186, 254);
insert into USES (c_id, e_id)
values (260, 290);
insert into USES (c_id, e_id)
values (16, 83);
insert into USES (c_id, e_id)
values (52, 366);
insert into USES (c_id, e_id)
values (245, 178);
insert into USES (c_id, e_id)
values (242, 261);
insert into USES (c_id, e_id)
values (249, 354);
insert into USES (c_id, e_id)
values (52, 298);
insert into USES (c_id, e_id)
values (247, 176);
insert into USES (c_id, e_id)
values (281, 102);
insert into USES (c_id, e_id)
values (85, 366);
insert into USES (c_id, e_id)
values (322, 76);
insert into USES (c_id, e_id)
values (294, 136);
insert into USES (c_id, e_id)
values (55, 3);
insert into USES (c_id, e_id)
values (80, 230);
insert into USES (c_id, e_id)
values (327, 252);
insert into USES (c_id, e_id)
values (161, 368);
insert into USES (c_id, e_id)
values (197, 337);
insert into USES (c_id, e_id)
values (117, 286);
insert into USES (c_id, e_id)
values (51, 119);
insert into USES (c_id, e_id)
values (398, 259);
insert into USES (c_id, e_id)
values (176, 255);
insert into USES (c_id, e_id)
values (10, 160);
insert into USES (c_id, e_id)
values (87, 323);
insert into USES (c_id, e_id)
values (256, 345);
insert into USES (c_id, e_id)
values (1, 269);
insert into USES (c_id, e_id)
values (145, 209);
insert into USES (c_id, e_id)
values (354, 307);
insert into USES (c_id, e_id)
values (35, 13);
insert into USES (c_id, e_id)
values (151, 262);
insert into USES (c_id, e_id)
values (142, 75);
insert into USES (c_id, e_id)
values (245, 333);
insert into USES (c_id, e_id)
values (258, 231);
insert into USES (c_id, e_id)
values (136, 277);
insert into USES (c_id, e_id)
values (338, 351);
insert into USES (c_id, e_id)
values (190, 60);
insert into USES (c_id, e_id)
values (69, 243);
insert into USES (c_id, e_id)
values (68, 7);
insert into USES (c_id, e_id)
values (103, 310);
insert into USES (c_id, e_id)
values (252, 376);
insert into USES (c_id, e_id)
values (60, 178);
insert into USES (c_id, e_id)
values (76, 274);
insert into USES (c_id, e_id)
values (176, 338);
insert into USES (c_id, e_id)
values (143, 168);
insert into USES (c_id, e_id)
values (318, 94);
insert into USES (c_id, e_id)
values (331, 281);
insert into USES (c_id, e_id)
values (224, 283);
insert into USES (c_id, e_id)
values (269, 85);
insert into USES (c_id, e_id)
values (100, 298);
insert into USES (c_id, e_id)
values (100, 180);
insert into USES (c_id, e_id)
values (30, 194);
insert into USES (c_id, e_id)
values (195, 376);
insert into USES (c_id, e_id)
values (332, 252);
insert into USES (c_id, e_id)
values (233, 273);
insert into USES (c_id, e_id)
values (308, 11);
insert into USES (c_id, e_id)
values (140, 360);
insert into USES (c_id, e_id)
values (134, 27);
insert into USES (c_id, e_id)
values (263, 39);
insert into USES (c_id, e_id)
values (333, 96);
insert into USES (c_id, e_id)
values (296, 272);
insert into USES (c_id, e_id)
values (168, 265);
insert into USES (c_id, e_id)
values (137, 128);
insert into USES (c_id, e_id)
values (10, 389);
insert into USES (c_id, e_id)
values (369, 125);
insert into USES (c_id, e_id)
values (14, 145);
insert into USES (c_id, e_id)
values (173, 29);
insert into USES (c_id, e_id)
values (355, 391);
insert into USES (c_id, e_id)
values (148, 200);
commit;
prompt 400 records loaded
prompt Enabling foreign key constraints for STUDENTSGROUP...
alter table STUDENTSGROUP enable constraint SYS_C008426;
alter table STUDENTSGROUP enable constraint SYS_C008427;
alter table STUDENTSGROUP enable constraint SYS_C008428;
prompt Enabling foreign key constraints for BELONGS...
alter table BELONGS enable constraint SYS_C008437;
alter table BELONGS enable constraint SYS_C008438;
prompt Enabling foreign key constraints for TEACHES_THE...
alter table TEACHES_THE enable constraint SYS_C008442;
alter table TEACHES_THE enable constraint SYS_C008443;
prompt Enabling foreign key constraints for USES...
alter table USES enable constraint SYS_C008432;
alter table USES enable constraint SYS_C008433;
prompt Enabling triggers for PARTICIPANTS...
alter table PARTICIPANTS enable all triggers;
prompt Enabling triggers for COURSES...
alter table COURSES enable all triggers;
prompt Enabling triggers for LECTURERS...
alter table LECTURERS enable all triggers;
prompt Enabling triggers for ROOM...
alter table ROOM enable all triggers;
prompt Enabling triggers for STUDENTSGROUP...
alter table STUDENTSGROUP enable all triggers;
prompt Enabling triggers for BELONGS...
alter table BELONGS enable all triggers;
prompt Enabling triggers for EQUIPMENT...
alter table EQUIPMENT enable all triggers;
prompt Enabling triggers for TEACHES_THE...
alter table TEACHES_THE enable all triggers;
prompt Enabling triggers for USES...
alter table USES enable all triggers;
set feedback on
set define on
prompt Done.
