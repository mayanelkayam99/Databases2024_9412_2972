prompt PL/SQL Developer import file
prompt Created on יום שני 27 מאי 2024 by mayan
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
  add foreign key (P_ID)
  references PARTICIPANTS (P_ID);

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

prompt Creating LECTURERS...
create table LECTURERS
(
  l_id      NUMBER(10) not null,
  l_name    VARCHAR2(30) not null,
  l_date    DATE not null,
  seniority VARCHAR2(30) not null,
  training  VARCHAR2(30) not null
);
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
);
alter table ROOM
  add primary key (R_ID)
  ;

prompt Creating STUDENTSGROUP...
create table STUDENTSGROUP
(
  g_id   NUMBER(10) not null,
  max_p  NUMBER(15) not null,
  g_hour INTEGER not null,
  g_day  INTEGER not null,
  r_id   NUMBER(5) not null,
  c_id   INTEGER not null,
  l_id   NUMBER(5) not null
)
;
alter table STUDENTSGROUP
  add primary key (G_ID)
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
);
alter table USES
  add primary key (C_ID, E_ID)
  using index 
 ;
alter table USES
  add foreign key (C_ID)
  references COURSES (C_ID);
alter table USES
  add foreign key (E_ID)
  references EQUIPMENT (E_ID);

prompt Disabling triggers for PARTICIPANTS...
alter table PARTICIPANTS disable all triggers;
prompt Disabling triggers for BELONGS...
alter table BELONGS disable all triggers;
prompt Disabling triggers for COURSES...
alter table COURSES disable all triggers;
prompt Disabling triggers for EQUIPMENT...
alter table EQUIPMENT disable all triggers;
prompt Disabling triggers for LECTURERS...
alter table LECTURERS disable all triggers;
prompt Disabling triggers for ROOM...
alter table ROOM disable all triggers;
prompt Disabling triggers for STUDENTSGROUP...
alter table STUDENTSGROUP disable all triggers;
prompt Disabling triggers for TEACHES_THE...
alter table TEACHES_THE disable all triggers;
prompt Disabling triggers for USES...
alter table USES disable all triggers;
prompt Disabling foreign key constraints for BELONGS...
alter table BELONGS disable constraint SYS_C007210;
prompt Disabling foreign key constraints for TEACHES_THE...
alter table TEACHES_THE disable constraint SYS_C007185;
alter table TEACHES_THE disable constraint SYS_C007186;
prompt Disabling foreign key constraints for USES...
alter table USES disable constraint SYS_C007114;
alter table USES disable constraint SYS_C007115;
prompt Deleting USES...
delete from USES;
commit;
prompt Deleting TEACHES_THE...
delete from TEACHES_THE;
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
prompt Deleting EQUIPMENT...
delete from EQUIPMENT;
commit;
prompt Deleting COURSES...
delete from COURSES;
commit;
prompt Deleting BELONGS...
delete from BELONGS;
commit;
prompt Deleting PARTICIPANTS...
delete from PARTICIPANTS;
commit;
prompt Loading PARTICIPANTS...
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('CarolynTomlin', to_date('10-02-1990', 'dd-mm-yyyy'), 100, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('IceSoda', to_date('27-08-2008', 'dd-mm-yyyy'), 101, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('AdrienLynne', to_date('23-10-1999', 'dd-mm-yyyy'), 102, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('LauraSavage', to_date('26-05-1983', 'dd-mm-yyyy'), 103, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MaceoCarnes', to_date('23-11-1979', 'dd-mm-yyyy'), 104, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('DebbyOrlando', to_date('11-07-1970', 'dd-mm-yyyy'), 105, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('BenicioPastore', to_date('27-10-1974', 'dd-mm-yyyy'), 106, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('RutgerRussell', to_date('09-01-2006', 'dd-mm-yyyy'), 107, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('SophieWatley', to_date('07-05-2018', 'dd-mm-yyyy'), 108, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('LilyPiven', to_date('01-09-1974', 'dd-mm-yyyy'), 109, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('YolandaPalmer', to_date('11-10-2015', 'dd-mm-yyyy'), 110, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('FamkePlowright', to_date('29-12-1972', 'dd-mm-yyyy'), 111, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('ViennaRickles', to_date('01-12-2017', 'dd-mm-yyyy'), 112, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('AndreCross', to_date('13-04-1993', 'dd-mm-yyyy'), 113, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('GoranPayne', to_date('22-05-1974', 'dd-mm-yyyy'), 114, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('CharlieBriscoe', to_date('17-02-2005', 'dd-mm-yyyy'), 115, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('BeverleyIrving', to_date('26-06-1981', 'dd-mm-yyyy'), 116, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MekhiKimball', to_date('21-02-1993', 'dd-mm-yyyy'), 117, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('BretHagar', to_date('27-05-2019', 'dd-mm-yyyy'), 118, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('KevnSevenfold', to_date('05-09-1974', 'dd-mm-yyyy'), 119, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('GlenFranks', to_date('07-05-2004', 'dd-mm-yyyy'), 120, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('ElvisDeLuise', to_date('06-08-1999', 'dd-mm-yyyy'), 121, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('CarolynMcGregor', to_date('10-07-2003', 'dd-mm-yyyy'), 122, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('KurtwoodFrost', to_date('31-10-1976', 'dd-mm-yyyy'), 123, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('OlympiaCromwell', to_date('15-12-1990', 'dd-mm-yyyy'), 124, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('SonaMcLachlan', to_date('13-01-2009', 'dd-mm-yyyy'), 125, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('AnnetteDoucette', to_date('02-02-2000', 'dd-mm-yyyy'), 126, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('SherylWong', to_date('27-05-1999', 'dd-mm-yyyy'), 127, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('CarolMattea', to_date('21-09-1970', 'dd-mm-yyyy'), 128, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('DomMeniketti', to_date('29-03-2002', 'dd-mm-yyyy'), 129, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('AndraeJeffreys', to_date('13-10-1983', 'dd-mm-yyyy'), 130, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('EdwinKeener', to_date('11-02-1974', 'dd-mm-yyyy'), 131, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('SallyZane', to_date('25-05-1993', 'dd-mm-yyyy'), 132, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('RobbieThomas', to_date('02-05-1973', 'dd-mm-yyyy'), 133, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('SammyMetcalf', to_date('02-01-1992', 'dd-mm-yyyy'), 134, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('ScarlettTicotin', to_date('26-09-2005', 'dd-mm-yyyy'), 135, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('GregParsons', to_date('05-12-1996', 'dd-mm-yyyy'), 136, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('LaurenSoda', to_date('23-10-2001', 'dd-mm-yyyy'), 137, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('JeremyFichtner', to_date('20-03-2016', 'dd-mm-yyyy'), 138, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('ElijahFoley', to_date('26-07-1987', 'dd-mm-yyyy'), 139, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('ChrisStudi', to_date('20-04-2003', 'dd-mm-yyyy'), 140, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('WaymanHawthorne', to_date('27-05-2007', 'dd-mm-yyyy'), 141, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MindySilverman', to_date('03-12-1984', 'dd-mm-yyyy'), 142, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('ToshiroMcAnally', to_date('17-05-1974', 'dd-mm-yyyy'), 143, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('ChadMcCabe', to_date('03-05-2010', 'dd-mm-yyyy'), 144, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('TerriCoyote', to_date('20-02-1990', 'dd-mm-yyyy'), 145, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('Allisonurban', to_date('04-07-2012', 'dd-mm-yyyy'), 146, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('WinonaSilverman', to_date('13-06-1996', 'dd-mm-yyyy'), 147, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('RebeccaMartinez', to_date('28-11-2009', 'dd-mm-yyyy'), 148, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('GarlandAkins', to_date('27-06-1970', 'dd-mm-yyyy'), 149, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('KyraWalsh', to_date('08-09-2000', 'dd-mm-yyyy'), 150, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('NedCohn', to_date('05-10-2010', 'dd-mm-yyyy'), 151, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('BurtonVaughan', to_date('14-07-1975', 'dd-mm-yyyy'), 152, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('LukeHauser', to_date('04-11-2006', 'dd-mm-yyyy'), 153, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('BoMoorer', to_date('30-09-1991', 'dd-mm-yyyy'), 154, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('GiovanniUnderwood', to_date('26-11-1997', 'dd-mm-yyyy'), 155, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('ChristinaKelly', to_date('22-10-1974', 'dd-mm-yyyy'), 156, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('AlbertAtkins', to_date('20-04-1980', 'dd-mm-yyyy'), 157, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('SeannChaplin', to_date('22-04-1985', 'dd-mm-yyyy'), 158, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('AngieBlossoms', to_date('14-11-1975', 'dd-mm-yyyy'), 159, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('JannO''Sullivan', to_date('12-09-1974', 'dd-mm-yyyy'), 160, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('DeborahHagar', to_date('24-12-1998', 'dd-mm-yyyy'), 161, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('PamelaBelushi', to_date('04-11-1992', 'dd-mm-yyyy'), 162, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('OwenHector', to_date('08-04-2014', 'dd-mm-yyyy'), 163, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('JoseCurfman', to_date('02-02-1970', 'dd-mm-yyyy'), 164, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('VanessaHolbrook', to_date('09-10-1986', 'dd-mm-yyyy'), 165, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('PamIrving', to_date('29-08-2016', 'dd-mm-yyyy'), 166, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('KelliHoffman', to_date('28-01-1995', 'dd-mm-yyyy'), 167, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('TiaBerenger', to_date('10-08-1978', 'dd-mm-yyyy'), 168, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('HarrisonPatillo', to_date('12-11-1983', 'dd-mm-yyyy'), 169, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('SpencerColtrane', to_date('21-07-2002', 'dd-mm-yyyy'), 170, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('BenicioGugino', to_date('09-07-1978', 'dd-mm-yyyy'), 171, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('ClaireRifkin', to_date('04-03-2007', 'dd-mm-yyyy'), 172, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('RicardoTaylor', to_date('16-11-1998', 'dd-mm-yyyy'), 173, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('BrittanyGracie', to_date('06-11-1977', 'dd-mm-yyyy'), 174, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MaxPressly', to_date('05-03-1995', 'dd-mm-yyyy'), 175, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('NickyGuest', to_date('29-03-2008', 'dd-mm-yyyy'), 176, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('LindsayReinhold', to_date('14-12-2014', 'dd-mm-yyyy'), 177, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('AlfredCocker', to_date('11-02-1999', 'dd-mm-yyyy'), 178, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('WesleyStevenson', to_date('14-11-1997', 'dd-mm-yyyy'), 179, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('VendettaCarrey', to_date('24-03-2006', 'dd-mm-yyyy'), 180, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('JulietTankard', to_date('22-08-2014', 'dd-mm-yyyy'), 181, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('NicoleParish', to_date('23-02-1996', 'dd-mm-yyyy'), 182, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('FranzBenoit', to_date('09-07-2019', 'dd-mm-yyyy'), 183, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('ThelmaBaker', to_date('15-01-1987', 'dd-mm-yyyy'), 184, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('ThoraWeir', to_date('03-12-2000', 'dd-mm-yyyy'), 185, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('SamanthaLi', to_date('21-07-2011', 'dd-mm-yyyy'), 186, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('TriniSinise', to_date('11-06-1995', 'dd-mm-yyyy'), 187, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('AliceMay', to_date('29-03-2006', 'dd-mm-yyyy'), 188, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('KazemDownie', to_date('27-03-2004', 'dd-mm-yyyy'), 189, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('RosarioEmmerich', to_date('07-08-1997', 'dd-mm-yyyy'), 190, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('FrankGooding', to_date('13-04-1971', 'dd-mm-yyyy'), 191, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('VondieLaPaglia', to_date('08-10-1983', 'dd-mm-yyyy'), 192, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('FairuzaLoveless', to_date('24-10-1977', 'dd-mm-yyyy'), 193, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MikoButler', to_date('22-07-1994', 'dd-mm-yyyy'), 194, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('LeoHedaya', to_date('10-02-1980', 'dd-mm-yyyy'), 195, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MarianneHorizon', to_date('12-09-2015', 'dd-mm-yyyy'), 196, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('JodieSchwarzenegger', to_date('17-03-1996', 'dd-mm-yyyy'), 197, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('SissyWitherspoon', to_date('30-03-1977', 'dd-mm-yyyy'), 198, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('RikBridges', to_date('30-10-1984', 'dd-mm-yyyy'), 199, 'EMT', 'female');
commit;
prompt 100 records committed...
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('UmaKinski', to_date('07-01-1996', 'dd-mm-yyyy'), 200, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('AnnetteDzundza', to_date('29-04-1984', 'dd-mm-yyyy'), 201, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MaryHampton', to_date('08-01-2019', 'dd-mm-yyyy'), 202, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('ShannonJamal', to_date('09-06-1994', 'dd-mm-yyyy'), 203, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('SydneyHubbard', to_date('20-11-2003', 'dd-mm-yyyy'), 204, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('JannPhoenix', to_date('01-11-2016', 'dd-mm-yyyy'), 205, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('RichLoring', to_date('06-12-1984', 'dd-mm-yyyy'), 206, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('TyroneGarber', to_date('05-04-1975', 'dd-mm-yyyy'), 207, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('JavonThorton', to_date('29-04-1974', 'dd-mm-yyyy'), 208, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('GeraldZahn', to_date('03-04-1990', 'dd-mm-yyyy'), 209, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('RemyLerner', to_date('14-03-1978', 'dd-mm-yyyy'), 210, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('OliverLynn', to_date('05-10-1990', 'dd-mm-yyyy'), 211, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('ChelyPitt', to_date('02-11-1982', 'dd-mm-yyyy'), 212, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('RandallMcCain', to_date('12-08-1982', 'dd-mm-yyyy'), 213, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('DerekMcCoy', to_date('25-10-1976', 'dd-mm-yyyy'), 214, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('LouiseWomack', to_date('03-01-2016', 'dd-mm-yyyy'), 215, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('LarenzGold', to_date('30-11-1986', 'dd-mm-yyyy'), 216, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('YolandaWalker', to_date('01-01-1978', 'dd-mm-yyyy'), 217, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('ToniSanta Rosa', to_date('18-06-2009', 'dd-mm-yyyy'), 218, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('ElizaChurch', to_date('19-05-1985', 'dd-mm-yyyy'), 219, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('EdDay', to_date('18-11-1979', 'dd-mm-yyyy'), 220, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('LatinMatarazzo', to_date('07-11-1995', 'dd-mm-yyyy'), 221, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('LucindaRickman', to_date('03-06-1982', 'dd-mm-yyyy'), 222, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('TonyKirkwood', to_date('20-08-1994', 'dd-mm-yyyy'), 223, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('IanBrickell', to_date('28-01-1975', 'dd-mm-yyyy'), 224, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('TracyStudi', to_date('13-04-1977', 'dd-mm-yyyy'), 225, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('FatsTorino', to_date('25-09-1981', 'dd-mm-yyyy'), 226, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('JamesCollie', to_date('24-11-1990', 'dd-mm-yyyy'), 227, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('KimberlySnider', to_date('27-10-2000', 'dd-mm-yyyy'), 228, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('JeroenBorden', to_date('29-05-1993', 'dd-mm-yyyy'), 229, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('RodSellers', to_date('13-05-1987', 'dd-mm-yyyy'), 230, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('HeatherNorton', to_date('12-09-1996', 'dd-mm-yyyy'), 231, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('RogerNortham', to_date('26-02-1999', 'dd-mm-yyyy'), 232, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('ClaudeAtkins', to_date('18-11-2002', 'dd-mm-yyyy'), 233, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('WinonaGreenwood', to_date('26-06-1998', 'dd-mm-yyyy'), 234, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('IanRain', to_date('22-08-1976', 'dd-mm-yyyy'), 235, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('ReneeWeaver', to_date('09-10-1983', 'dd-mm-yyyy'), 236, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('GabrielleHead', to_date('21-07-1998', 'dd-mm-yyyy'), 237, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('AniSample', to_date('14-09-1981', 'dd-mm-yyyy'), 238, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('GeneBachman', to_date('07-10-2017', 'dd-mm-yyyy'), 239, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('FionnulaWiedlin', to_date('08-03-1975', 'dd-mm-yyyy'), 240, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('GeggyStevens', to_date('06-08-1995', 'dd-mm-yyyy'), 241, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('GeraldineWells', to_date('26-05-2016', 'dd-mm-yyyy'), 242, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('JenaHolland', to_date('08-04-2007', 'dd-mm-yyyy'), 243, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('SharonMorton', to_date('17-07-1993', 'dd-mm-yyyy'), 244, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('EmbethBullock', to_date('06-12-1975', 'dd-mm-yyyy'), 245, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('BetteFisher', to_date('23-11-1973', 'dd-mm-yyyy'), 246, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('ChakaHarnes', to_date('25-07-2003', 'dd-mm-yyyy'), 247, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('JesseBruce', to_date('06-02-2002', 'dd-mm-yyyy'), 248, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('RitchiePeniston', to_date('08-04-2016', 'dd-mm-yyyy'), 249, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('VickieGraham', to_date('01-09-1979', 'dd-mm-yyyy'), 250, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('IsaiahOsment', to_date('09-06-2009', 'dd-mm-yyyy'), 251, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('NicolasMyles', to_date('07-11-2019', 'dd-mm-yyyy'), 258, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MarisaMinogue', to_date('31-08-2016', 'dd-mm-yyyy'), 259, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('JasonJeter', to_date('22-06-1987', 'dd-mm-yyyy'), 260, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('LatinSandler', to_date('02-09-2014', 'dd-mm-yyyy'), 261, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('IvanChurch', to_date('19-10-1970', 'dd-mm-yyyy'), 262, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('FredaRichardson', to_date('29-08-1990', 'dd-mm-yyyy'), 263, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('LorenSheen', to_date('01-12-2016', 'dd-mm-yyyy'), 264, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MatthewPleasure', to_date('26-03-1971', 'dd-mm-yyyy'), 265, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('HazelWilson', to_date('14-06-1971', 'dd-mm-yyyy'), 266, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('LynetteCarlyle', to_date('28-03-1992', 'dd-mm-yyyy'), 267, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('OssiePhillippe', to_date('21-07-2003', 'dd-mm-yyyy'), 268, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('TomMoriarty', to_date('30-10-2000', 'dd-mm-yyyy'), 269, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('WhoopiPeterson', to_date('07-11-1978', 'dd-mm-yyyy'), 270, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('Carrie-AnneVan Der Beek', to_date('16-02-1989', 'dd-mm-yyyy'), 271, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('KatrinHaslam', to_date('23-04-1981', 'dd-mm-yyyy'), 272, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('JayCattrall', to_date('28-07-2017', 'dd-mm-yyyy'), 273, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('ErnestHawke', to_date('10-01-2003', 'dd-mm-yyyy'), 274, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('AlannahDickinson', to_date('26-04-1980', 'dd-mm-yyyy'), 275, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('KurtwoodAlexander', to_date('21-07-1983', 'dd-mm-yyyy'), 276, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MinnieBonneville', to_date('28-08-1990', 'dd-mm-yyyy'), 277, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('KevnCassel', to_date('24-09-1978', 'dd-mm-yyyy'), 278, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('WallaceNakai', to_date('23-10-1973', 'dd-mm-yyyy'), 279, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('RobertBarnett', to_date('15-06-1988', 'dd-mm-yyyy'), 280, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MaceoStanton', to_date('13-12-1975', 'dd-mm-yyyy'), 281, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MadelineLachey', to_date('30-12-2013', 'dd-mm-yyyy'), 282, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('LoisStone', to_date('11-02-1985', 'dd-mm-yyyy'), 283, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('AlbertinaElizondo', to_date('17-04-2014', 'dd-mm-yyyy'), 284, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('AnneYulin', to_date('21-10-1989', 'dd-mm-yyyy'), 285, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('DwightTolkan', to_date('27-03-1977', 'dd-mm-yyyy'), 286, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('PeaboCornell', to_date('06-08-1977', 'dd-mm-yyyy'), 287, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('JeremyRucker', to_date('02-07-1982', 'dd-mm-yyyy'), 288, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('NicoleGold', to_date('15-06-1977', 'dd-mm-yyyy'), 289, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('KieranGuest', to_date('13-01-1997', 'dd-mm-yyyy'), 290, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('BretSlater', to_date('29-03-1978', 'dd-mm-yyyy'), 291, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('JulietWincott', to_date('21-01-1979', 'dd-mm-yyyy'), 292, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('TerryBruce', to_date('28-10-1990', 'dd-mm-yyyy'), 293, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('SolomonSteenburgen', to_date('23-06-2011', 'dd-mm-yyyy'), 294, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('AnthonyAzaria', to_date('23-12-2014', 'dd-mm-yyyy'), 295, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('AniRichards', to_date('11-02-2007', 'dd-mm-yyyy'), 296, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('LeoHeald', to_date('11-02-2003', 'dd-mm-yyyy'), 297, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('DonnaKahn', to_date('31-01-2016', 'dd-mm-yyyy'), 298, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('JulieDavis', to_date('16-02-1984', 'dd-mm-yyyy'), 299, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('BernardEnglish', to_date('17-05-1986', 'dd-mm-yyyy'), 300, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('ParkerCamp', to_date('04-01-2000', 'dd-mm-yyyy'), 301, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('LynnWells', to_date('19-03-1972', 'dd-mm-yyyy'), 302, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('LindsayMaguire', to_date('17-01-2019', 'dd-mm-yyyy'), 303, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('JeffWhitley', to_date('13-02-2017', 'dd-mm-yyyy'), 304, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('EmbethHershey', to_date('22-10-1999', 'dd-mm-yyyy'), 305, 'Paramedic', 'female');
commit;
prompt 200 records committed...
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('RodMatheson', to_date('11-01-2000', 'dd-mm-yyyy'), 306, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('VerticalWinslet', to_date('16-08-1993', 'dd-mm-yyyy'), 307, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('LesleyPonce', to_date('23-06-1989', 'dd-mm-yyyy'), 308, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('BridgetteParm', to_date('21-05-2017', 'dd-mm-yyyy'), 309, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('ChristopherAlbright', to_date('31-10-1992', 'dd-mm-yyyy'), 310, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('JoyBrolin', to_date('23-08-2006', 'dd-mm-yyyy'), 311, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('KatieIrving', to_date('25-09-1980', 'dd-mm-yyyy'), 312, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('TeriJessee', to_date('18-04-1999', 'dd-mm-yyyy'), 313, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MattSylvian', to_date('15-12-2001', 'dd-mm-yyyy'), 314, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('ChelyWheel', to_date('09-09-2005', 'dd-mm-yyyy'), 315, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('OmarHolland', to_date('05-05-1996', 'dd-mm-yyyy'), 316, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('UmaBerenger', to_date('26-10-2019', 'dd-mm-yyyy'), 317, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('LouiseKramer', to_date('01-12-2003', 'dd-mm-yyyy'), 318, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('SusanGoldblum', to_date('13-08-1971', 'dd-mm-yyyy'), 319, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('GenaAtkinson', to_date('07-06-1972', 'dd-mm-yyyy'), 320, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MarieConnery', to_date('27-05-1990', 'dd-mm-yyyy'), 321, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('VivicaBlades', to_date('27-01-1974', 'dd-mm-yyyy'), 322, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('JoanCocker', to_date('19-03-1997', 'dd-mm-yyyy'), 323, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('SarahVanian', to_date('23-05-1970', 'dd-mm-yyyy'), 324, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('DesmondPuckett', to_date('23-03-1997', 'dd-mm-yyyy'), 325, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('OrlandoJane', to_date('25-06-2003', 'dd-mm-yyyy'), 326, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('JannBale', to_date('10-03-2006', 'dd-mm-yyyy'), 327, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MikiPosey', to_date('16-06-2006', 'dd-mm-yyyy'), 328, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('GrantLang', to_date('22-04-1994', 'dd-mm-yyyy'), 329, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('ChristopherImperioli', to_date('19-03-2008', 'dd-mm-yyyy'), 330, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('ElisabethFoxx', to_date('19-12-1970', 'dd-mm-yyyy'), 331, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MartyMcCabe', to_date('12-10-1971', 'dd-mm-yyyy'), 332, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('DavePeet', to_date('15-12-1991', 'dd-mm-yyyy'), 333, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MirandaHunter', to_date('18-10-1992', 'dd-mm-yyyy'), 334, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('RheaTravers', to_date('04-07-2000', 'dd-mm-yyyy'), 335, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MorrisMaguire', to_date('06-12-2010', 'dd-mm-yyyy'), 336, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('EthanBrooke', to_date('13-12-1992', 'dd-mm-yyyy'), 337, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MillaColon', to_date('09-01-1992', 'dd-mm-yyyy'), 338, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('JeanneSandler', to_date('04-09-1981', 'dd-mm-yyyy'), 339, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('FionaHaslam', to_date('04-05-1989', 'dd-mm-yyyy'), 340, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('DwightPatrick', to_date('01-04-1991', 'dd-mm-yyyy'), 341, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('ViggoKrieger', to_date('12-11-1977', 'dd-mm-yyyy'), 342, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('JenniferBentley', to_date('02-04-1970', 'dd-mm-yyyy'), 343, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('CarlosBlack', to_date('09-08-1992', 'dd-mm-yyyy'), 344, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('KyraRossellini', to_date('04-08-2010', 'dd-mm-yyyy'), 345, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('SineadMiller', to_date('10-09-1980', 'dd-mm-yyyy'), 346, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MattSmurfit', to_date('23-03-1990', 'dd-mm-yyyy'), 347, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('DarrenMarley', to_date('24-02-2013', 'dd-mm-yyyy'), 348, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('EmmCazale', to_date('09-11-1972', 'dd-mm-yyyy'), 349, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('LucindaDolenz', to_date('02-07-1986', 'dd-mm-yyyy'), 350, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('GenaLuPone', to_date('25-05-2012', 'dd-mm-yyyy'), 351, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MikoGandolfini', to_date('26-03-1992', 'dd-mm-yyyy'), 352, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MorganMcCann', to_date('22-06-1998', 'dd-mm-yyyy'), 353, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('SamMidler', to_date('26-05-1984', 'dd-mm-yyyy'), 354, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('TaylorBroderick', to_date('22-12-1995', 'dd-mm-yyyy'), 355, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('LizzyMcAnally', to_date('14-09-1997', 'dd-mm-yyyy'), 356, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('NaomiWills', to_date('09-10-2003', 'dd-mm-yyyy'), 357, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('RonnieBale', to_date('21-01-2001', 'dd-mm-yyyy'), 358, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MintFlack', to_date('12-02-1989', 'dd-mm-yyyy'), 359, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MaryLang', to_date('24-07-1980', 'dd-mm-yyyy'), 360, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('NormRedgrave', to_date('08-08-1972', 'dd-mm-yyyy'), 361, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('PhilVaughan', to_date('28-04-1971', 'dd-mm-yyyy'), 362, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('EdHoleman', to_date('19-03-1997', 'dd-mm-yyyy'), 363, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MaxRed', to_date('19-09-2015', 'dd-mm-yyyy'), 364, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('ShirleyDay-Lewis', to_date('25-01-1992', 'dd-mm-yyyy'), 365, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('RowanBright', to_date('02-10-2006', 'dd-mm-yyyy'), 366, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('ReneeJenkins', to_date('13-10-1989', 'dd-mm-yyyy'), 367, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('AngelaAdams', to_date('15-12-1994', 'dd-mm-yyyy'), 368, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MelKier', to_date('07-09-2004', 'dd-mm-yyyy'), 369, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('ColinRea', to_date('11-04-1986', 'dd-mm-yyyy'), 370, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('DevonBeckham', to_date('29-09-1979', 'dd-mm-yyyy'), 371, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('ArminHouston', to_date('28-07-2002', 'dd-mm-yyyy'), 372, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('GeenaHurley', to_date('24-11-1991', 'dd-mm-yyyy'), 373, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('CledusSanchez', to_date('24-08-2005', 'dd-mm-yyyy'), 374, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('AndreaRowlands', to_date('04-02-1971', 'dd-mm-yyyy'), 375, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('TracyDe Niro', to_date('21-08-2016', 'dd-mm-yyyy'), 376, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('KevnLane', to_date('28-02-2016', 'dd-mm-yyyy'), 377, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('DougCartlidge', to_date('05-01-1985', 'dd-mm-yyyy'), 378, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MickeyCale', to_date('23-07-1983', 'dd-mm-yyyy'), 379, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('NickyRhodes', to_date('16-05-1991', 'dd-mm-yyyy'), 380, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('FionnulaThomson', to_date('03-08-2011', 'dd-mm-yyyy'), 381, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('AnnetteAddy', to_date('21-03-1996', 'dd-mm-yyyy'), 382, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('RawlinsPastore', to_date('12-05-1975', 'dd-mm-yyyy'), 383, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('BernieSampson', to_date('29-07-1988', 'dd-mm-yyyy'), 384, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('DanniKirshner', to_date('14-05-1975', 'dd-mm-yyyy'), 385, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('KieferQuinlan', to_date('14-02-1984', 'dd-mm-yyyy'), 386, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('GeggyGooding', to_date('05-09-1997', 'dd-mm-yyyy'), 387, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('NigelWeber', to_date('15-08-1988', 'dd-mm-yyyy'), 388, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('ViggoQuaid', to_date('18-11-1974', 'dd-mm-yyyy'), 389, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('GeggyHudson', to_date('08-08-2018', 'dd-mm-yyyy'), 390, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('IsaacFogerty', to_date('14-11-1976', 'dd-mm-yyyy'), 391, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('RosarioHawthorne', to_date('15-12-1973', 'dd-mm-yyyy'), 392, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('LeslieCurry', to_date('03-11-1997', 'dd-mm-yyyy'), 393, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('NileGoldwyn', to_date('15-07-1976', 'dd-mm-yyyy'), 394, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('TildaDawson', to_date('08-02-1983', 'dd-mm-yyyy'), 395, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('RodneyCraddock', to_date('18-07-1990', 'dd-mm-yyyy'), 396, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('DebbyParker', to_date('11-04-1985', 'dd-mm-yyyy'), 397, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('KidBorgnine', to_date('25-05-2015', 'dd-mm-yyyy'), 398, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('JoshBlackwell', to_date('01-06-2006', 'dd-mm-yyyy'), 399, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('KateConley', to_date('27-04-2005', 'dd-mm-yyyy'), 400, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('EdwinMifune', to_date('25-09-1999', 'dd-mm-yyyy'), 401, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('EmmaQuaid', to_date('17-09-2012', 'dd-mm-yyyy'), 402, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('RodneyFrost', to_date('19-11-1973', 'dd-mm-yyyy'), 403, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('BlairAaron', to_date('01-01-1990', 'dd-mm-yyyy'), 404, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('AllanSizemore', to_date('08-07-1993', 'dd-mm-yyyy'), 405, 'Paramedic', 'male');
commit;
prompt 300 records committed...
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('HugoRoot', to_date('26-02-2008', 'dd-mm-yyyy'), 406, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('RosarioJudd', to_date('01-12-2003', 'dd-mm-yyyy'), 407, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('TyPresley', to_date('25-04-1974', 'dd-mm-yyyy'), 408, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('CliveMcConaughey', to_date('06-05-2004', 'dd-mm-yyyy'), 409, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('RascalFlanagan', to_date('21-05-1997', 'dd-mm-yyyy'), 410, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('AlexBroadbent', to_date('26-04-2006', 'dd-mm-yyyy'), 411, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('StevieEstevez', to_date('24-01-1974', 'dd-mm-yyyy'), 412, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('ElvisBrody', to_date('15-03-2018', 'dd-mm-yyyy'), 413, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('LindseyPeterson', to_date('20-06-1989', 'dd-mm-yyyy'), 414, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('RonnyChristie', to_date('11-03-1999', 'dd-mm-yyyy'), 415, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('JaredMaguire', to_date('15-01-2012', 'dd-mm-yyyy'), 416, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('EileenMolina', to_date('24-10-2001', 'dd-mm-yyyy'), 417, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('TziBlige', to_date('26-12-2001', 'dd-mm-yyyy'), 418, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('DeniseSpiner', to_date('10-04-1976', 'dd-mm-yyyy'), 419, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('DebiStevens', to_date('09-03-2012', 'dd-mm-yyyy'), 420, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('EthanJessee', to_date('05-07-2019', 'dd-mm-yyyy'), 421, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('RaymondBacon', to_date('02-09-1980', 'dd-mm-yyyy'), 422, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MerrileeKleinenberg', to_date('01-11-1970', 'dd-mm-yyyy'), 423, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('SalmaDe Niro', to_date('26-01-2010', 'dd-mm-yyyy'), 424, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('BrendaEllis', to_date('18-11-2011', 'dd-mm-yyyy'), 425, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('RupertLandau', to_date('28-08-1992', 'dd-mm-yyyy'), 426, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('SolomonCheadle', to_date('25-08-1974', 'dd-mm-yyyy'), 427, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('GabyMcKean', to_date('11-01-1985', 'dd-mm-yyyy'), 428, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('RitchieBurns', to_date('17-01-1976', 'dd-mm-yyyy'), 429, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('AliciaOrlando', to_date('12-03-2005', 'dd-mm-yyyy'), 430, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MickyCarrey', to_date('31-03-1983', 'dd-mm-yyyy'), 431, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('EmilioWheel', to_date('24-01-1982', 'dd-mm-yyyy'), 432, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('StellanHumphrey', to_date('01-11-1999', 'dd-mm-yyyy'), 433, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('JodieKelly', to_date('02-12-1973', 'dd-mm-yyyy'), 434, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('DennyHaggard', to_date('06-12-2000', 'dd-mm-yyyy'), 435, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MacBaranski', to_date('16-11-2003', 'dd-mm-yyyy'), 436, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('LinHoffman', to_date('01-11-2014', 'dd-mm-yyyy'), 437, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('LeonVance', to_date('10-07-1977', 'dd-mm-yyyy'), 438, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('RamseyDonovan', to_date('30-09-2001', 'dd-mm-yyyy'), 439, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('RupertSwank', to_date('06-01-2016', 'dd-mm-yyyy'), 440, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('BuffyGibson', to_date('13-07-1995', 'dd-mm-yyyy'), 441, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('JulietteHall', to_date('06-12-1997', 'dd-mm-yyyy'), 442, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MeredithRowlands', to_date('28-11-2004', 'dd-mm-yyyy'), 443, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('TamalaPolley', to_date('11-09-1970', 'dd-mm-yyyy'), 444, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('KatrinMarie', to_date('08-06-1994', 'dd-mm-yyyy'), 445, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MarianneHurley', to_date('14-10-2007', 'dd-mm-yyyy'), 446, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('VerucaRydell', to_date('09-11-1985', 'dd-mm-yyyy'), 447, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('RadneyRenfro', to_date('09-02-2017', 'dd-mm-yyyy'), 448, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('NikMcAnally', to_date('30-07-2015', 'dd-mm-yyyy'), 449, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MillieCollins', to_date('28-05-1989', 'dd-mm-yyyy'), 450, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('PragaRain', to_date('27-06-2006', 'dd-mm-yyyy'), 451, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('AvrilStreep', to_date('03-11-1978', 'dd-mm-yyyy'), 452, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('HowardConley', to_date('21-02-1991', 'dd-mm-yyyy'), 453, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('WillieUnion', to_date('22-12-1971', 'dd-mm-yyyy'), 454, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('RhysCruise', to_date('02-09-2010', 'dd-mm-yyyy'), 455, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('WallaceGarofalo', to_date('31-03-1991', 'dd-mm-yyyy'), 456, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('RicardoO''Sullivan', to_date('15-08-1988', 'dd-mm-yyyy'), 457, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('WarrenMadsen', to_date('18-02-1986', 'dd-mm-yyyy'), 458, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('SaulFlack', to_date('24-08-1993', 'dd-mm-yyyy'), 459, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('RandyTrejo', to_date('03-05-2004', 'dd-mm-yyyy'), 460, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('ChristinaMoriarty', to_date('12-05-1988', 'dd-mm-yyyy'), 461, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('JillDuchovny', to_date('09-10-1997', 'dd-mm-yyyy'), 462, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('AlIsaacs', to_date('17-05-2016', 'dd-mm-yyyy'), 463, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('RebeccaDuvall', to_date('15-02-2019', 'dd-mm-yyyy'), 464, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('VernOldman', to_date('09-10-1983', 'dd-mm-yyyy'), 465, 'EMT', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('RayCornell', to_date('17-02-1995', 'dd-mm-yyyy'), 466, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('DebbieCostner', to_date('02-07-1998', 'dd-mm-yyyy'), 467, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('RalphDreyfuss', to_date('31-10-1987', 'dd-mm-yyyy'), 468, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('NicoleDean', to_date('05-02-2019', 'dd-mm-yyyy'), 469, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('TamalaHatosy', to_date('14-01-2016', 'dd-mm-yyyy'), 470, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('DaveyDysart', to_date('21-11-1985', 'dd-mm-yyyy'), 471, 'EMT', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('WinonaMadonna', to_date('13-01-1971', 'dd-mm-yyyy'), 472, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('ChrisHoliday', to_date('14-02-1992', 'dd-mm-yyyy'), 473, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('LizzyWillis', to_date('04-06-2014', 'dd-mm-yyyy'), 474, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('MachineTempest', to_date('08-07-2001', 'dd-mm-yyyy'), 475, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('GeorgeStone', to_date('20-02-2007', 'dd-mm-yyyy'), 476, 'First Responder', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('FamkeDafoe', to_date('15-07-2011', 'dd-mm-yyyy'), 477, 'First Responder', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('JenaHumphrey', to_date('17-11-1977', 'dd-mm-yyyy'), 478, 'Paramedic', 'female');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('LisaStoltz', to_date('12-08-2000', 'dd-mm-yyyy'), 479, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('GlennMac', to_date('07-03-2012', 'dd-mm-yyyy'), 480, 'Paramedic', 'male');
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender)
values ('CatherineRichardson', to_date('14-06-2011', 'dd-mm-yyyy'), 481, 'EMT', 'male');
commit;
prompt 376 records loaded
prompt Loading BELONGS...
insert into BELONGS (g_id, p_id)
values (11, 305);
insert into BELONGS (g_id, p_id)
values (17, 148);
insert into BELONGS (g_id, p_id)
values (268, 220);
insert into BELONGS (g_id, p_id)
values (65, 147);
insert into BELONGS (g_id, p_id)
values (212, 161);
insert into BELONGS (g_id, p_id)
values (37, 436);
insert into BELONGS (g_id, p_id)
values (22, 137);
insert into BELONGS (g_id, p_id)
values (89, 182);
insert into BELONGS (g_id, p_id)
values (143, 423);
insert into BELONGS (g_id, p_id)
values (20, 285);
insert into BELONGS (g_id, p_id)
values (98, 140);
insert into BELONGS (g_id, p_id)
values (129, 236);
insert into BELONGS (g_id, p_id)
values (12, 120);
insert into BELONGS (g_id, p_id)
values (123, 125);
insert into BELONGS (g_id, p_id)
values (77, 448);
insert into BELONGS (g_id, p_id)
values (132, 404);
insert into BELONGS (g_id, p_id)
values (39, 131);
insert into BELONGS (g_id, p_id)
values (305, 147);
insert into BELONGS (g_id, p_id)
values (283, 200);
insert into BELONGS (g_id, p_id)
values (141, 448);
insert into BELONGS (g_id, p_id)
values (25, 246);
insert into BELONGS (g_id, p_id)
values (275, 323);
insert into BELONGS (g_id, p_id)
values (148, 260);
insert into BELONGS (g_id, p_id)
values (103, 123);
insert into BELONGS (g_id, p_id)
values (242, 208);
insert into BELONGS (g_id, p_id)
values (220, 388);
insert into BELONGS (g_id, p_id)
values (265, 346);
insert into BELONGS (g_id, p_id)
values (147, 153);
insert into BELONGS (g_id, p_id)
values (222, 455);
insert into BELONGS (g_id, p_id)
values (179, 144);
insert into BELONGS (g_id, p_id)
values (182, 172);
insert into BELONGS (g_id, p_id)
values (118, 104);
insert into BELONGS (g_id, p_id)
values (289, 335);
insert into BELONGS (g_id, p_id)
values (203, 438);
insert into BELONGS (g_id, p_id)
values (184, 287);
insert into BELONGS (g_id, p_id)
values (209, 372);
insert into BELONGS (g_id, p_id)
values (83, 246);
insert into BELONGS (g_id, p_id)
values (67, 229);
insert into BELONGS (g_id, p_id)
values (47, 331);
insert into BELONGS (g_id, p_id)
values (223, 294);
insert into BELONGS (g_id, p_id)
values (133, 102);
insert into BELONGS (g_id, p_id)
values (83, 137);
insert into BELONGS (g_id, p_id)
values (245, 157);
insert into BELONGS (g_id, p_id)
values (238, 377);
insert into BELONGS (g_id, p_id)
values (105, 150);
insert into BELONGS (g_id, p_id)
values (239, 117);
insert into BELONGS (g_id, p_id)
values (129, 263);
insert into BELONGS (g_id, p_id)
values (222, 274);
insert into BELONGS (g_id, p_id)
values (121, 451);
insert into BELONGS (g_id, p_id)
values (132, 177);
insert into BELONGS (g_id, p_id)
values (91, 404);
insert into BELONGS (g_id, p_id)
values (120, 465);
insert into BELONGS (g_id, p_id)
values (255, 428);
insert into BELONGS (g_id, p_id)
values (284, 229);
insert into BELONGS (g_id, p_id)
values (87, 320);
insert into BELONGS (g_id, p_id)
values (119, 108);
insert into BELONGS (g_id, p_id)
values (63, 469);
insert into BELONGS (g_id, p_id)
values (281, 266);
insert into BELONGS (g_id, p_id)
values (6, 107);
insert into BELONGS (g_id, p_id)
values (162, 106);
insert into BELONGS (g_id, p_id)
values (257, 204);
insert into BELONGS (g_id, p_id)
values (128, 432);
insert into BELONGS (g_id, p_id)
values (60, 402);
insert into BELONGS (g_id, p_id)
values (249, 414);
insert into BELONGS (g_id, p_id)
values (129, 345);
insert into BELONGS (g_id, p_id)
values (254, 330);
insert into BELONGS (g_id, p_id)
values (281, 334);
insert into BELONGS (g_id, p_id)
values (303, 310);
insert into BELONGS (g_id, p_id)
values (183, 414);
insert into BELONGS (g_id, p_id)
values (164, 462);
insert into BELONGS (g_id, p_id)
values (32, 218);
insert into BELONGS (g_id, p_id)
values (193, 125);
insert into BELONGS (g_id, p_id)
values (213, 468);
insert into BELONGS (g_id, p_id)
values (5, 228);
insert into BELONGS (g_id, p_id)
values (284, 169);
insert into BELONGS (g_id, p_id)
values (253, 247);
insert into BELONGS (g_id, p_id)
values (131, 213);
insert into BELONGS (g_id, p_id)
values (171, 407);
insert into BELONGS (g_id, p_id)
values (121, 323);
insert into BELONGS (g_id, p_id)
values (127, 405);
insert into BELONGS (g_id, p_id)
values (226, 183);
insert into BELONGS (g_id, p_id)
values (161, 201);
insert into BELONGS (g_id, p_id)
values (271, 447);
insert into BELONGS (g_id, p_id)
values (235, 413);
insert into BELONGS (g_id, p_id)
values (202, 341);
insert into BELONGS (g_id, p_id)
values (54, 379);
insert into BELONGS (g_id, p_id)
values (258, 442);
insert into BELONGS (g_id, p_id)
values (48, 113);
insert into BELONGS (g_id, p_id)
values (77, 337);
insert into BELONGS (g_id, p_id)
values (15, 158);
insert into BELONGS (g_id, p_id)
values (144, 162);
insert into BELONGS (g_id, p_id)
values (203, 357);
insert into BELONGS (g_id, p_id)
values (180, 282);
insert into BELONGS (g_id, p_id)
values (281, 203);
insert into BELONGS (g_id, p_id)
values (160, 153);
insert into BELONGS (g_id, p_id)
values (206, 481);
insert into BELONGS (g_id, p_id)
values (257, 467);
insert into BELONGS (g_id, p_id)
values (101, 149);
insert into BELONGS (g_id, p_id)
values (43, 195);
insert into BELONGS (g_id, p_id)
values (280, 321);
commit;
prompt 100 records committed...
insert into BELONGS (g_id, p_id)
values (117, 467);
insert into BELONGS (g_id, p_id)
values (192, 277);
insert into BELONGS (g_id, p_id)
values (233, 277);
insert into BELONGS (g_id, p_id)
values (20, 201);
insert into BELONGS (g_id, p_id)
values (301, 241);
insert into BELONGS (g_id, p_id)
values (195, 436);
insert into BELONGS (g_id, p_id)
values (25, 125);
insert into BELONGS (g_id, p_id)
values (281, 146);
insert into BELONGS (g_id, p_id)
values (18, 243);
insert into BELONGS (g_id, p_id)
values (260, 450);
insert into BELONGS (g_id, p_id)
values (25, 449);
insert into BELONGS (g_id, p_id)
values (41, 481);
insert into BELONGS (g_id, p_id)
values (294, 470);
insert into BELONGS (g_id, p_id)
values (57, 407);
insert into BELONGS (g_id, p_id)
values (40, 402);
insert into BELONGS (g_id, p_id)
values (154, 123);
insert into BELONGS (g_id, p_id)
values (119, 419);
insert into BELONGS (g_id, p_id)
values (96, 144);
insert into BELONGS (g_id, p_id)
values (39, 183);
insert into BELONGS (g_id, p_id)
values (255, 127);
insert into BELONGS (g_id, p_id)
values (239, 303);
insert into BELONGS (g_id, p_id)
values (172, 186);
insert into BELONGS (g_id, p_id)
values (221, 319);
insert into BELONGS (g_id, p_id)
values (111, 286);
insert into BELONGS (g_id, p_id)
values (261, 465);
insert into BELONGS (g_id, p_id)
values (105, 312);
insert into BELONGS (g_id, p_id)
values (185, 251);
insert into BELONGS (g_id, p_id)
values (220, 222);
insert into BELONGS (g_id, p_id)
values (39, 171);
insert into BELONGS (g_id, p_id)
values (56, 331);
insert into BELONGS (g_id, p_id)
values (252, 185);
insert into BELONGS (g_id, p_id)
values (152, 477);
insert into BELONGS (g_id, p_id)
values (175, 324);
insert into BELONGS (g_id, p_id)
values (91, 441);
insert into BELONGS (g_id, p_id)
values (68, 290);
insert into BELONGS (g_id, p_id)
values (107, 369);
insert into BELONGS (g_id, p_id)
values (88, 163);
insert into BELONGS (g_id, p_id)
values (221, 344);
insert into BELONGS (g_id, p_id)
values (267, 454);
insert into BELONGS (g_id, p_id)
values (200, 451);
insert into BELONGS (g_id, p_id)
values (76, 273);
insert into BELONGS (g_id, p_id)
values (8, 180);
insert into BELONGS (g_id, p_id)
values (193, 175);
insert into BELONGS (g_id, p_id)
values (231, 279);
insert into BELONGS (g_id, p_id)
values (33, 248);
insert into BELONGS (g_id, p_id)
values (169, 310);
insert into BELONGS (g_id, p_id)
values (217, 432);
insert into BELONGS (g_id, p_id)
values (231, 295);
insert into BELONGS (g_id, p_id)
values (28, 431);
insert into BELONGS (g_id, p_id)
values (85, 161);
insert into BELONGS (g_id, p_id)
values (108, 346);
insert into BELONGS (g_id, p_id)
values (265, 235);
insert into BELONGS (g_id, p_id)
values (279, 189);
insert into BELONGS (g_id, p_id)
values (54, 178);
insert into BELONGS (g_id, p_id)
values (161, 473);
insert into BELONGS (g_id, p_id)
values (106, 127);
insert into BELONGS (g_id, p_id)
values (238, 267);
insert into BELONGS (g_id, p_id)
values (52, 155);
insert into BELONGS (g_id, p_id)
values (221, 472);
insert into BELONGS (g_id, p_id)
values (292, 421);
insert into BELONGS (g_id, p_id)
values (138, 167);
insert into BELONGS (g_id, p_id)
values (203, 235);
insert into BELONGS (g_id, p_id)
values (241, 326);
insert into BELONGS (g_id, p_id)
values (8, 184);
insert into BELONGS (g_id, p_id)
values (114, 362);
insert into BELONGS (g_id, p_id)
values (183, 302);
insert into BELONGS (g_id, p_id)
values (253, 148);
insert into BELONGS (g_id, p_id)
values (17, 178);
insert into BELONGS (g_id, p_id)
values (255, 294);
insert into BELONGS (g_id, p_id)
values (32, 399);
insert into BELONGS (g_id, p_id)
values (57, 149);
insert into BELONGS (g_id, p_id)
values (269, 110);
insert into BELONGS (g_id, p_id)
values (79, 412);
insert into BELONGS (g_id, p_id)
values (212, 400);
insert into BELONGS (g_id, p_id)
values (138, 282);
insert into BELONGS (g_id, p_id)
values (128, 423);
insert into BELONGS (g_id, p_id)
values (144, 472);
insert into BELONGS (g_id, p_id)
values (9, 286);
insert into BELONGS (g_id, p_id)
values (174, 418);
insert into BELONGS (g_id, p_id)
values (288, 178);
insert into BELONGS (g_id, p_id)
values (30, 233);
insert into BELONGS (g_id, p_id)
values (75, 390);
insert into BELONGS (g_id, p_id)
values (302, 290);
insert into BELONGS (g_id, p_id)
values (291, 236);
insert into BELONGS (g_id, p_id)
values (305, 311);
insert into BELONGS (g_id, p_id)
values (258, 438);
insert into BELONGS (g_id, p_id)
values (268, 243);
insert into BELONGS (g_id, p_id)
values (182, 223);
insert into BELONGS (g_id, p_id)
values (231, 422);
insert into BELONGS (g_id, p_id)
values (45, 395);
insert into BELONGS (g_id, p_id)
values (125, 296);
insert into BELONGS (g_id, p_id)
values (196, 414);
insert into BELONGS (g_id, p_id)
values (73, 112);
insert into BELONGS (g_id, p_id)
values (90, 111);
insert into BELONGS (g_id, p_id)
values (27, 345);
insert into BELONGS (g_id, p_id)
values (11, 472);
insert into BELONGS (g_id, p_id)
values (71, 305);
insert into BELONGS (g_id, p_id)
values (256, 430);
insert into BELONGS (g_id, p_id)
values (54, 226);
insert into BELONGS (g_id, p_id)
values (305, 440);
commit;
prompt 200 records committed...
insert into BELONGS (g_id, p_id)
values (35, 404);
insert into BELONGS (g_id, p_id)
values (265, 387);
insert into BELONGS (g_id, p_id)
values (43, 212);
insert into BELONGS (g_id, p_id)
values (216, 467);
insert into BELONGS (g_id, p_id)
values (186, 126);
insert into BELONGS (g_id, p_id)
values (222, 464);
insert into BELONGS (g_id, p_id)
values (60, 478);
insert into BELONGS (g_id, p_id)
values (154, 121);
insert into BELONGS (g_id, p_id)
values (182, 270);
insert into BELONGS (g_id, p_id)
values (79, 424);
insert into BELONGS (g_id, p_id)
values (271, 335);
insert into BELONGS (g_id, p_id)
values (221, 291);
insert into BELONGS (g_id, p_id)
values (301, 170);
insert into BELONGS (g_id, p_id)
values (196, 114);
insert into BELONGS (g_id, p_id)
values (230, 235);
insert into BELONGS (g_id, p_id)
values (9, 409);
insert into BELONGS (g_id, p_id)
values (198, 291);
insert into BELONGS (g_id, p_id)
values (240, 216);
insert into BELONGS (g_id, p_id)
values (9, 111);
insert into BELONGS (g_id, p_id)
values (101, 240);
insert into BELONGS (g_id, p_id)
values (128, 246);
insert into BELONGS (g_id, p_id)
values (81, 242);
insert into BELONGS (g_id, p_id)
values (134, 444);
insert into BELONGS (g_id, p_id)
values (87, 408);
insert into BELONGS (g_id, p_id)
values (47, 138);
insert into BELONGS (g_id, p_id)
values (259, 282);
insert into BELONGS (g_id, p_id)
values (11, 458);
insert into BELONGS (g_id, p_id)
values (97, 168);
insert into BELONGS (g_id, p_id)
values (260, 344);
insert into BELONGS (g_id, p_id)
values (172, 363);
insert into BELONGS (g_id, p_id)
values (31, 223);
insert into BELONGS (g_id, p_id)
values (78, 133);
insert into BELONGS (g_id, p_id)
values (260, 374);
insert into BELONGS (g_id, p_id)
values (106, 178);
insert into BELONGS (g_id, p_id)
values (34, 214);
insert into BELONGS (g_id, p_id)
values (145, 280);
insert into BELONGS (g_id, p_id)
values (18, 110);
insert into BELONGS (g_id, p_id)
values (73, 213);
insert into BELONGS (g_id, p_id)
values (236, 210);
insert into BELONGS (g_id, p_id)
values (196, 197);
insert into BELONGS (g_id, p_id)
values (86, 393);
insert into BELONGS (g_id, p_id)
values (42, 151);
insert into BELONGS (g_id, p_id)
values (33, 245);
insert into BELONGS (g_id, p_id)
values (5, 451);
insert into BELONGS (g_id, p_id)
values (178, 295);
insert into BELONGS (g_id, p_id)
values (46, 258);
insert into BELONGS (g_id, p_id)
values (187, 133);
insert into BELONGS (g_id, p_id)
values (89, 355);
insert into BELONGS (g_id, p_id)
values (220, 237);
insert into BELONGS (g_id, p_id)
values (138, 401);
insert into BELONGS (g_id, p_id)
values (145, 263);
insert into BELONGS (g_id, p_id)
values (10, 326);
insert into BELONGS (g_id, p_id)
values (202, 303);
insert into BELONGS (g_id, p_id)
values (233, 167);
insert into BELONGS (g_id, p_id)
values (259, 216);
insert into BELONGS (g_id, p_id)
values (195, 323);
insert into BELONGS (g_id, p_id)
values (37, 480);
insert into BELONGS (g_id, p_id)
values (105, 403);
insert into BELONGS (g_id, p_id)
values (60, 211);
insert into BELONGS (g_id, p_id)
values (278, 112);
insert into BELONGS (g_id, p_id)
values (58, 390);
insert into BELONGS (g_id, p_id)
values (178, 102);
insert into BELONGS (g_id, p_id)
values (214, 318);
insert into BELONGS (g_id, p_id)
values (43, 258);
insert into BELONGS (g_id, p_id)
values (11, 167);
insert into BELONGS (g_id, p_id)
values (40, 132);
insert into BELONGS (g_id, p_id)
values (220, 198);
insert into BELONGS (g_id, p_id)
values (240, 310);
insert into BELONGS (g_id, p_id)
values (192, 392);
insert into BELONGS (g_id, p_id)
values (181, 356);
insert into BELONGS (g_id, p_id)
values (102, 159);
insert into BELONGS (g_id, p_id)
values (219, 430);
insert into BELONGS (g_id, p_id)
values (175, 170);
insert into BELONGS (g_id, p_id)
values (250, 130);
insert into BELONGS (g_id, p_id)
values (278, 329);
insert into BELONGS (g_id, p_id)
values (299, 215);
insert into BELONGS (g_id, p_id)
values (293, 363);
insert into BELONGS (g_id, p_id)
values (212, 294);
insert into BELONGS (g_id, p_id)
values (240, 393);
insert into BELONGS (g_id, p_id)
values (58, 157);
insert into BELONGS (g_id, p_id)
values (99, 373);
insert into BELONGS (g_id, p_id)
values (170, 429);
insert into BELONGS (g_id, p_id)
values (295, 209);
insert into BELONGS (g_id, p_id)
values (129, 330);
insert into BELONGS (g_id, p_id)
values (191, 460);
insert into BELONGS (g_id, p_id)
values (40, 340);
insert into BELONGS (g_id, p_id)
values (279, 149);
insert into BELONGS (g_id, p_id)
values (218, 164);
insert into BELONGS (g_id, p_id)
values (94, 318);
insert into BELONGS (g_id, p_id)
values (18, 234);
insert into BELONGS (g_id, p_id)
values (115, 396);
insert into BELONGS (g_id, p_id)
values (30, 471);
insert into BELONGS (g_id, p_id)
values (136, 446);
insert into BELONGS (g_id, p_id)
values (290, 136);
insert into BELONGS (g_id, p_id)
values (96, 393);
insert into BELONGS (g_id, p_id)
values (68, 364);
insert into BELONGS (g_id, p_id)
values (274, 233);
insert into BELONGS (g_id, p_id)
values (14, 315);
insert into BELONGS (g_id, p_id)
values (258, 311);
insert into BELONGS (g_id, p_id)
values (152, 276);
commit;
prompt 300 records committed...
insert into BELONGS (g_id, p_id)
values (177, 330);
insert into BELONGS (g_id, p_id)
values (126, 145);
insert into BELONGS (g_id, p_id)
values (87, 332);
insert into BELONGS (g_id, p_id)
values (261, 301);
insert into BELONGS (g_id, p_id)
values (233, 168);
insert into BELONGS (g_id, p_id)
values (212, 358);
insert into BELONGS (g_id, p_id)
values (72, 449);
insert into BELONGS (g_id, p_id)
values (9, 375);
insert into BELONGS (g_id, p_id)
values (139, 238);
insert into BELONGS (g_id, p_id)
values (139, 181);
insert into BELONGS (g_id, p_id)
values (227, 378);
insert into BELONGS (g_id, p_id)
values (125, 386);
insert into BELONGS (g_id, p_id)
values (250, 220);
insert into BELONGS (g_id, p_id)
values (18, 224);
insert into BELONGS (g_id, p_id)
values (154, 348);
insert into BELONGS (g_id, p_id)
values (145, 205);
insert into BELONGS (g_id, p_id)
values (212, 327);
insert into BELONGS (g_id, p_id)
values (35, 264);
insert into BELONGS (g_id, p_id)
values (51, 107);
insert into BELONGS (g_id, p_id)
values (233, 434);
insert into BELONGS (g_id, p_id)
values (43, 450);
insert into BELONGS (g_id, p_id)
values (156, 398);
insert into BELONGS (g_id, p_id)
values (196, 358);
insert into BELONGS (g_id, p_id)
values (130, 363);
insert into BELONGS (g_id, p_id)
values (21, 229);
insert into BELONGS (g_id, p_id)
values (294, 284);
insert into BELONGS (g_id, p_id)
values (165, 439);
insert into BELONGS (g_id, p_id)
values (98, 109);
insert into BELONGS (g_id, p_id)
values (282, 353);
insert into BELONGS (g_id, p_id)
values (57, 116);
insert into BELONGS (g_id, p_id)
values (186, 398);
insert into BELONGS (g_id, p_id)
values (215, 367);
insert into BELONGS (g_id, p_id)
values (131, 140);
insert into BELONGS (g_id, p_id)
values (171, 481);
insert into BELONGS (g_id, p_id)
values (87, 448);
insert into BELONGS (g_id, p_id)
values (136, 155);
insert into BELONGS (g_id, p_id)
values (123, 285);
insert into BELONGS (g_id, p_id)
values (127, 153);
insert into BELONGS (g_id, p_id)
values (83, 204);
insert into BELONGS (g_id, p_id)
values (252, 282);
insert into BELONGS (g_id, p_id)
values (194, 271);
insert into BELONGS (g_id, p_id)
values (264, 367);
insert into BELONGS (g_id, p_id)
values (60, 317);
insert into BELONGS (g_id, p_id)
values (276, 163);
insert into BELONGS (g_id, p_id)
values (247, 188);
insert into BELONGS (g_id, p_id)
values (51, 195);
insert into BELONGS (g_id, p_id)
values (103, 376);
insert into BELONGS (g_id, p_id)
values (129, 394);
insert into BELONGS (g_id, p_id)
values (156, 357);
insert into BELONGS (g_id, p_id)
values (215, 304);
insert into BELONGS (g_id, p_id)
values (118, 436);
insert into BELONGS (g_id, p_id)
values (91, 180);
insert into BELONGS (g_id, p_id)
values (87, 251);
insert into BELONGS (g_id, p_id)
values (145, 451);
insert into BELONGS (g_id, p_id)
values (93, 312);
insert into BELONGS (g_id, p_id)
values (205, 143);
insert into BELONGS (g_id, p_id)
values (233, 324);
insert into BELONGS (g_id, p_id)
values (57, 446);
insert into BELONGS (g_id, p_id)
values (66, 155);
insert into BELONGS (g_id, p_id)
values (155, 396);
insert into BELONGS (g_id, p_id)
values (257, 389);
insert into BELONGS (g_id, p_id)
values (269, 184);
insert into BELONGS (g_id, p_id)
values (117, 415);
insert into BELONGS (g_id, p_id)
values (231, 107);
insert into BELONGS (g_id, p_id)
values (286, 143);
insert into BELONGS (g_id, p_id)
values (46, 438);
insert into BELONGS (g_id, p_id)
values (72, 333);
insert into BELONGS (g_id, p_id)
values (35, 443);
insert into BELONGS (g_id, p_id)
values (87, 121);
insert into BELONGS (g_id, p_id)
values (269, 474);
insert into BELONGS (g_id, p_id)
values (137, 434);
insert into BELONGS (g_id, p_id)
values (88, 147);
insert into BELONGS (g_id, p_id)
values (102, 112);
insert into BELONGS (g_id, p_id)
values (182, 225);
insert into BELONGS (g_id, p_id)
values (36, 143);
insert into BELONGS (g_id, p_id)
values (263, 246);
insert into BELONGS (g_id, p_id)
values (48, 386);
insert into BELONGS (g_id, p_id)
values (105, 453);
insert into BELONGS (g_id, p_id)
values (294, 105);
insert into BELONGS (g_id, p_id)
values (224, 268);
insert into BELONGS (g_id, p_id)
values (294, 340);
insert into BELONGS (g_id, p_id)
values (42, 155);
insert into BELONGS (g_id, p_id)
values (185, 427);
insert into BELONGS (g_id, p_id)
values (23, 473);
insert into BELONGS (g_id, p_id)
values (203, 342);
insert into BELONGS (g_id, p_id)
values (297, 441);
insert into BELONGS (g_id, p_id)
values (281, 181);
insert into BELONGS (g_id, p_id)
values (270, 276);
insert into BELONGS (g_id, p_id)
values (148, 242);
insert into BELONGS (g_id, p_id)
values (126, 260);
insert into BELONGS (g_id, p_id)
values (134, 104);
insert into BELONGS (g_id, p_id)
values (30, 302);
insert into BELONGS (g_id, p_id)
values (196, 318);
insert into BELONGS (g_id, p_id)
values (219, 108);
insert into BELONGS (g_id, p_id)
values (243, 408);
insert into BELONGS (g_id, p_id)
values (80, 268);
insert into BELONGS (g_id, p_id)
values (37, 366);
insert into BELONGS (g_id, p_id)
values (168, 333);
insert into BELONGS (g_id, p_id)
values (89, 280);
insert into BELONGS (g_id, p_id)
values (228, 169);
commit;
prompt 400 records loaded
prompt Loading COURSES...
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 1, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 2, 'Emergency Response', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 3, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 4, 'Disaster Preparedness', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 5, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 6, 'Disaster Preparedness', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 7, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 8, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 9, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 10, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 11, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 12, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 13, 'Emergency Response', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 14, 'Emergency Management', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 15, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 16, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 17, 'Emergency Management', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 18, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 19, 'Emergency Response', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 20, 'Emergency Response', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 21, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 22, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 23, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 24, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 25, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 26, 'Disaster Preparedness', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 27, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 28, 'Emergency Response', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 29, 'Disaster Preparedness', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 30, 'Emergency Management', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 31, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 32, 'Trauma Care', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 33, 'Emergency Management', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 34, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 35, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 36, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 37, 'Trauma Care', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 38, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 39, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 40, 'Trauma Care', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 41, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 42, 'Emergency Response', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 43, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 44, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 45, 'Emergency Management', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 46, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 47, 'Disaster Preparedness', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 48, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 49, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 50, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 51, 'Trauma Care', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 52, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 53, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 54, 'Emergency Management', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 55, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 56, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 57, 'Trauma Care', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 58, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 59, 'Emergency Response', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 60, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 61, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 62, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 63, 'Trauma Care', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 64, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 65, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 66, 'Disaster Preparedness', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 67, 'Trauma Care', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 68, 'Emergency Management', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 69, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 70, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 71, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 72, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 73, 'Trauma Care', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 74, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 75, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 76, 'Emergency Response', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 77, 'Emergency Response', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 78, 'Disaster Preparedness', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 79, 'Disaster Preparedness', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 80, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 81, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 82, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 83, 'Disaster Preparedness', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 84, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 85, 'Disaster Preparedness', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 86, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 87, 'Emergency Management', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 88, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 89, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 90, 'Emergency Response', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 91, 'Emergency Management', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 92, 'Emergency Response', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 93, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 94, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 95, 'Disaster Preparedness', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 96, 'Disaster Preparedness', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 97, 'Disaster Preparedness', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 98, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 99, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 100, 'Disaster Preparedness', 'Optional', 'yes/none');
commit;
prompt 100 records committed...
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 101, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 102, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 103, 'Trauma Care', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 104, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 105, 'Emergency Response', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 106, 'Emergency Response', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 107, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 108, 'Emergency Response', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 109, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 110, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 111, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 112, 'Emergency Response', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 113, 'Trauma Care', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 114, 'Emergency Management', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 115, 'Emergency Response', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 116, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 117, 'Emergency Management', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 118, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 119, 'Emergency Management', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 120, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 121, 'Disaster Preparedness', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 122, 'Emergency Response', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 123, 'Trauma Care', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 124, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 125, 'Disaster Preparedness', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 126, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 127, 'Disaster Preparedness', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 128, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 129, 'Emergency Management', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 130, 'Emergency Management', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 131, 'Emergency Response', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 132, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 133, 'Emergency Management', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 134, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 135, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 136, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 137, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 138, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 139, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 140, 'Disaster Preparedness', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 141, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 142, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 143, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 144, 'Emergency Management', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 145, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 146, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 147, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 148, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 149, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 150, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 151, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 152, 'Trauma Care', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 153, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 154, 'Trauma Care', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 155, 'Emergency Response', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 156, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 157, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 158, 'Disaster Preparedness', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 159, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 160, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 161, 'Trauma Care', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 162, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 163, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 164, 'Emergency Management', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 165, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 166, 'Emergency Response', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 167, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 168, 'Trauma Care', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 169, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 170, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 171, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 172, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 173, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 174, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 175, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 176, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 177, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 178, 'Trauma Care', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 179, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 180, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 181, 'Disaster Preparedness', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 182, 'Emergency Response', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 183, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 184, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 185, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 186, 'Emergency Response', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 187, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 188, 'Emergency Management', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 189, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 190, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 191, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 192, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 193, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 194, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 195, 'Emergency Management', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 196, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 197, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 198, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 199, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 200, 'Basic Life Support', 'Mandatory', 'yes/none');
commit;
prompt 200 records committed...
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 201, 'Disaster Preparedness', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 202, 'Disaster Preparedness', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 203, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 204, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 205, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 206, 'Disaster Preparedness', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 207, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 208, 'Disaster Preparedness', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 209, 'Emergency Response', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 210, 'Emergency Response', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 211, 'Emergency Response', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 212, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 213, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 214, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 215, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 216, 'Emergency Response', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 217, 'Emergency Response', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 218, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 219, 'Emergency Management', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 220, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 221, 'Emergency Response', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 222, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 223, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 224, 'Emergency Response', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 225, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 226, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 227, 'Disaster Preparedness', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 228, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 229, 'Emergency Response', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 230, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 231, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 232, 'Trauma Care', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 233, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 234, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 235, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 236, 'Emergency Response', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 237, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 238, 'Disaster Preparedness', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 239, 'Trauma Care', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 240, 'Emergency Response', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 241, 'Emergency Response', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 242, 'Trauma Care', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 243, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 244, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 245, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 246, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 247, 'Emergency Response', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 248, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 249, 'Emergency Response', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 250, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 251, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 252, 'Emergency Management', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 253, 'Trauma Care', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 254, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 255, 'Emergency Management', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 256, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 257, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 258, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 259, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 260, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 261, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 262, 'Disaster Preparedness', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 263, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 264, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 265, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 266, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 267, 'Trauma Care', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 268, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 269, 'Trauma Care', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 270, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 271, 'Trauma Care', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 272, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 273, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 274, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 275, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 276, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 277, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 278, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 279, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 280, 'Emergency Management', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 281, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 282, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 283, 'Emergency Response', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 284, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 285, 'Emergency Response', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 286, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 287, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 288, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 289, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 290, 'Trauma Care', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 291, 'Trauma Care', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 292, 'Emergency Management', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 293, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 294, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 295, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 296, 'Disaster Preparedness', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 297, 'Disaster Preparedness', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 298, 'Disaster Preparedness', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 299, 'Emergency Management', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 300, 'Trauma Care', 'Mandatory', 'yes/none');
commit;
prompt 300 records committed...
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 301, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 302, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 303, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 304, 'Disaster Preparedness', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 305, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 306, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 307, 'Emergency Response', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 308, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 309, 'Disaster Preparedness', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 310, 'Disaster Preparedness', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 311, 'Disaster Preparedness', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 312, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 313, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 314, 'Emergency Management', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 315, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 316, 'Trauma Care', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 317, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 318, 'Emergency Management', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 319, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 320, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 321, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 322, 'Emergency Management', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 323, 'Emergency Response', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 324, 'Disaster Preparedness', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 325, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 326, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 327, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 328, 'Disaster Preparedness', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 329, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 330, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 331, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 332, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 333, 'Emergency Response', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 334, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 335, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 336, 'Emergency Management', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 337, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 338, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 339, 'Disaster Preparedness', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 340, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 341, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 342, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 343, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 344, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 345, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 346, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 347, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 348, 'Trauma Care', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 349, 'Emergency Management', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 350, 'Emergency Response', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 351, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 352, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 353, 'Disaster Preparedness', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 354, 'Trauma Care', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 355, 'Trauma Care', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 356, 'Disaster Preparedness', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 357, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 358, 'Trauma Care', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 359, 'Emergency Response', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 360, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 361, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 362, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 363, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 364, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 365, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 366, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 367, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 368, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 369, 'Disaster Preparedness', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 370, 'Trauma Care', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 371, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 372, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 373, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 374, 'Disaster Preparedness', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 375, 'Emergency Management', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 376, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 377, 'Emergency Response', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 378, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 379, 'Trauma Care', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 380, 'Disaster Preparedness', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 381, 'Emergency Response', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 382, 'Disaster Preparedness', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 383, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 384, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 385, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 386, 'Emergency Response', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 387, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 388, 'Disaster Preparedness', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 389, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 390, 'Disaster Preparedness', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 391, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 392, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 393, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 394, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 395, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 396, 'Disaster Preparedness', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 397, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 398, 'Emergency Response', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 399, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 400, 'Advanced Life Support', 'Mandatory', 'yes/none');
commit;
prompt 400 records committed...
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 401, 'Emergency Response', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 402, 'Trauma Care', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 403, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 404, 'Trauma Care', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 405, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 406, 'Disaster Preparedness', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 407, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 408, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 409, 'Disaster Preparedness', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 410, 'Emergency Management', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 411, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 412, 'Disaster Preparedness', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 413, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 414, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 415, 'Emergency Response', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 416, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 417, 'Disaster Preparedness', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 418, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 419, 'Emergency Response', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 420, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 421, 'Trauma Care', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 422, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 423, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 424, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 425, 'Emergency Management', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 426, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 427, 'Emergency Response', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 428, 'Trauma Care', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 429, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 430, 'Disaster Preparedness', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 431, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 432, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 433, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 434, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 435, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 436, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 437, 'Disaster Preparedness', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 438, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 439, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 440, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 441, 'Disaster Preparedness', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 442, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 443, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 444, 'Disaster Preparedness', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 445, 'Emergency Response', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 446, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 447, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 448, 'Disaster Preparedness', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 449, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 450, 'Emergency Response', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 451, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 452, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 453, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 454, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 455, 'Disaster Preparedness', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 456, 'Trauma Care', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 457, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 458, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 459, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 460, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 461, 'Emergency Response', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 462, 'Emergency Response', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 463, 'Trauma Care', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 464, 'Emergency Response', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 465, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 466, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 467, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 468, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 469, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 470, 'Emergency Management', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 471, 'Emergency Response', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 472, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 473, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 474, 'Trauma Care', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 475, 'Trauma Care', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 476, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 477, 'Trauma Care', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 478, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 479, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 480, 'Emergency Management', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 481, 'Trauma Care', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 482, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 483, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 484, 'Emergency Management', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 485, 'Disaster Preparedness', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 486, 'Emergency Management', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 487, 'Emergency Management', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 488, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 489, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 490, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 491, 'Emergency Management', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 492, 'Emergency Response', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 493, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 494, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 495, 'Disaster Preparedness', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 496, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 497, 'Disaster Preparedness', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 498, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 499, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 500, 'Trauma Care', 'Mandatory', 'yes/none');
commit;
prompt 500 records committed...
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 501, 'Emergency Response', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 502, 'Trauma Care', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 503, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 504, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 505, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 506, 'Disaster Preparedness', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 507, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 508, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 509, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 510, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 511, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 512, 'Emergency Management', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 513, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 514, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 515, 'Trauma Care', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 516, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 517, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 518, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 519, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 520, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 521, 'Disaster Preparedness', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 522, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 523, 'Emergency Response', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 524, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 525, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 526, 'Disaster Preparedness', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 527, 'Disaster Preparedness', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 528, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 529, 'Emergency Management', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 530, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 531, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 532, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 533, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 534, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 535, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 536, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 537, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 538, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 539, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 540, 'Disaster Preparedness', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 541, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 542, 'Emergency Management', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 543, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 544, 'Emergency Management', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 545, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 546, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 547, 'Emergency Management', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 548, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 549, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 550, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 551, 'Emergency Management', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 552, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 553, 'Disaster Preparedness', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 554, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 555, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 556, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 557, 'Emergency Management', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 558, 'Emergency Response', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 559, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 560, 'Trauma Care', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 561, 'Trauma Care', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 562, 'Emergency Response', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 563, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 564, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 565, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 566, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 567, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 568, 'Trauma Care', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 569, 'Emergency Response', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 570, 'Emergency Response', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 571, 'Emergency Response', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 572, 'Disaster Preparedness', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 573, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 574, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 575, 'Emergency Management', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 576, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 577, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 578, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 579, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 580, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 581, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 582, 'Emergency Management', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 583, 'Emergency Response', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 584, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 585, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 586, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 587, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 588, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 589, 'Disaster Preparedness', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 590, 'Emergency Management', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 591, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 592, 'Emergency Response', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 593, 'Emergency Management', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 594, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 595, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 596, 'Emergency Management', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 597, 'Emergency Response', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 598, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 599, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 600, 'Advanced Life Support', 'Mandatory', 'yes/none');
commit;
prompt 600 records committed...
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 601, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 602, 'Emergency Management', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 603, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 604, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 605, 'Emergency Management', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 606, 'Emergency Management', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 607, 'Emergency Management', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 608, 'Disaster Preparedness', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 609, 'Emergency Management', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 610, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 611, 'Emergency Response', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 612, 'Emergency Response', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 613, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 614, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 615, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 616, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 617, 'Emergency Response', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 618, 'Emergency Response', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 619, 'Disaster Preparedness', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 620, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 621, 'Trauma Care', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 622, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 623, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 624, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 625, 'Emergency Management', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 626, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 627, 'Trauma Care', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 628, 'Emergency Management', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 629, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 630, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 631, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 632, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 633, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 634, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 635, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 636, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 637, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 638, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 639, 'Emergency Response', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 640, 'Trauma Care', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 641, 'Disaster Preparedness', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 642, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 643, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 644, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 645, 'Emergency Management', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 646, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 647, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 648, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 649, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 650, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 651, 'Trauma Care', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 652, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 653, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 654, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 655, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 656, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 657, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 658, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 659, 'Emergency Response', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 660, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 661, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 662, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 663, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 664, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 665, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 666, 'Emergency Management', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 667, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 668, 'Emergency Response', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 669, 'Disaster Preparedness', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 670, 'Emergency Response', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 671, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 672, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 673, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 674, 'Trauma Care', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 675, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 676, 'Trauma Care', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 677, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 678, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 679, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 680, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 681, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 682, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 683, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 684, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 685, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 686, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 687, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 688, 'Trauma Care', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 689, 'Emergency Management', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 690, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 691, 'Emergency Response', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 692, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 693, 'Disaster Preparedness', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 694, 'Emergency Management', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 695, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 696, 'Disaster Preparedness', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 697, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 698, 'Trauma Care', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 699, 'Trauma Care', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 700, 'Advanced Life Support', 'Optional', 'yes/none');
commit;
prompt 700 records committed...
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 701, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 702, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 703, 'Trauma Care', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 704, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 705, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 706, 'Trauma Care', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 707, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 708, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 709, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 710, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 711, 'Trauma Care', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 712, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 713, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 714, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 715, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 716, 'Emergency Management', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 717, 'Emergency Management', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 718, 'Emergency Response', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 719, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 720, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 721, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 722, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 723, 'Disaster Preparedness', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 724, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 725, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 726, 'Emergency Response', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 727, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 728, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 729, 'Emergency Management', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 730, 'Emergency Management', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 731, 'Emergency Management', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 732, 'Disaster Preparedness', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 733, 'Emergency Response', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 734, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 735, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 736, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 737, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 738, 'Disaster Preparedness', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 739, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 740, 'Emergency Response', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 741, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 742, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 743, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 744, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 745, 'Emergency Management', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 746, 'Disaster Preparedness', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 747, 'Emergency Management', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 748, 'Trauma Care', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 749, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 750, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 751, 'Trauma Care', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 752, 'Emergency Response', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 753, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 754, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 755, 'Emergency Response', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 756, 'Emergency Management', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 757, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 758, 'Trauma Care', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 759, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 760, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 761, 'Disaster Preparedness', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 762, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 763, 'Disaster Preparedness', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 764, 'Trauma Care', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 765, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 766, 'Trauma Care', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 767, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 768, 'Trauma Care', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 769, 'Emergency Response', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 770, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 771, 'Trauma Care', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 772, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 773, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 774, 'Disaster Preparedness', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 775, 'Emergency Management', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 776, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 777, 'Emergency Management', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 778, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 779, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 780, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 781, 'Disaster Preparedness', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 782, 'Disaster Preparedness', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 783, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 784, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 785, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 786, 'Disaster Preparedness', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 787, 'Trauma Care', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 788, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 789, 'Trauma Care', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 790, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 791, 'Emergency Management', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 792, 'Emergency Management', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 793, 'Trauma Care', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 794, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 795, 'Trauma Care', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 796, 'Trauma Care', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 797, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 798, 'Emergency Response', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 799, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 800, 'Emergency Medical Services', 'Mandatory', 'yes/none');
commit;
prompt 800 records committed...
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 801, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 802, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 803, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 804, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 805, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 806, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 807, 'Disaster Preparedness', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('First Responder Course', 808, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 809, 'Trauma Care', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 810, 'Advanced Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 811, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR and AED Training', 812, 'Emergency Management', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 813, 'Emergency Response', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 814, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 815, 'Emergency Medical Services', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 816, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 817, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 818, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 819, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 820, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Life Support', 821, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 822, 'Advanced Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('ACLS', 823, 'Trauma Care', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('PALS', 824, 'Basic Life Support', 'Optional', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Medical Emergency Management', 825, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('BLS', 826, 'Emergency Medical Services', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 827, 'Emergency Management', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Response Training', 828, 'Emergency Response', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Medical Technician (', 829, 'Basic Life Support', 'Mandatory', 'yes/none');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Paramedic Training Program', 830, 'Emergency Management', 'Optional', 'yes/none');
commit;
prompt 830 records loaded
prompt Loading EQUIPMENT...
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('08-03-2023', 'dd-mm-yyyy'), 1, 'First aid kit', 748);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('22-12-2021', 'dd-mm-yyyy'), 2, 'Spine board', 521);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('29-11-2021', 'dd-mm-yyyy'), 3, 'Oxygen tank', 576);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('30-01-2022', 'dd-mm-yyyy'), 4, 'Ambulance stretcher', 913);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('28-04-2023', 'dd-mm-yyyy'), 5, 'Defibrillator', 226);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('11-12-2020', 'dd-mm-yyyy'), 6, 'Splints', 971);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('17-11-2020', 'dd-mm-yyyy'), 7, 'Bag valve mask', 744);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('01-01-2023', 'dd-mm-yyyy'), 8, 'Trauma shears', 773);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('08-03-2023', 'dd-mm-yyyy'), 9, 'Ambulance stretcher', 793);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('18-10-2020', 'dd-mm-yyyy'), 10, 'Oxygen tank', 439);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('07-06-2023', 'dd-mm-yyyy'), 11, 'Ambulance stretcher', 334);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('24-11-2021', 'dd-mm-yyyy'), 12, 'Tourniquet', 877);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('02-10-2022', 'dd-mm-yyyy'), 13, 'Bag valve mask', 550);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('26-09-2022', 'dd-mm-yyyy'), 14, 'Trauma shears', 353);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('09-11-2020', 'dd-mm-yyyy'), 15, 'First aid kit', 695);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('10-03-2021', 'dd-mm-yyyy'), 16, 'Trauma shears', 238);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('01-02-2021', 'dd-mm-yyyy'), 17, 'Suction unit', 906);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('01-04-2023', 'dd-mm-yyyy'), 18, 'Spine board', 747);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('08-12-2022', 'dd-mm-yyyy'), 19, 'Defibrillator', 617);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('24-12-2022', 'dd-mm-yyyy'), 20, 'Defibrillator', 332);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('30-11-2023', 'dd-mm-yyyy'), 21, 'Suction unit', 847);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('02-11-2023', 'dd-mm-yyyy'), 22, 'Defibrillator', 132);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('05-09-2022', 'dd-mm-yyyy'), 23, 'Tourniquet', 626);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('13-02-2021', 'dd-mm-yyyy'), 24, 'Suction unit', 474);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('21-08-2020', 'dd-mm-yyyy'), 25, 'Spine board', 995);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('16-06-2020', 'dd-mm-yyyy'), 26, 'Bag valve mask', 646);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('01-06-2022', 'dd-mm-yyyy'), 27, 'Bag valve mask', 594);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('03-10-2023', 'dd-mm-yyyy'), 28, 'Suction unit', 869);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('20-05-2022', 'dd-mm-yyyy'), 29, 'First aid kit', 848);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('01-07-2020', 'dd-mm-yyyy'), 30, 'Oxygen tank', 276);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('05-10-2021', 'dd-mm-yyyy'), 31, 'First aid kit', 197);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('27-08-2020', 'dd-mm-yyyy'), 32, 'Ambulance stretcher', 745);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('18-01-2022', 'dd-mm-yyyy'), 33, 'Tourniquet', 830);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('06-02-2020', 'dd-mm-yyyy'), 34, 'Suction unit', 283);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('18-01-2021', 'dd-mm-yyyy'), 35, 'Spine board', 976);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('03-10-2022', 'dd-mm-yyyy'), 36, 'Ambulance stretcher', 301);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('28-06-2022', 'dd-mm-yyyy'), 37, 'First aid kit', 55);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('24-08-2023', 'dd-mm-yyyy'), 38, 'First aid kit', 100);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('13-10-2022', 'dd-mm-yyyy'), 39, 'Tourniquet', 21);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('15-01-2022', 'dd-mm-yyyy'), 40, 'Bag valve mask', 418);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('17-11-2023', 'dd-mm-yyyy'), 41, 'Suction unit', 938);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('22-03-2020', 'dd-mm-yyyy'), 42, 'Oxygen tank', 327);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('27-08-2022', 'dd-mm-yyyy'), 43, 'Tourniquet', 547);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('08-04-2021', 'dd-mm-yyyy'), 44, 'Spine board', 318);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('20-04-2022', 'dd-mm-yyyy'), 45, 'Suction unit', 41);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('25-07-2021', 'dd-mm-yyyy'), 46, 'Trauma shears', 560);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('26-12-2023', 'dd-mm-yyyy'), 47, 'Bag valve mask', 30);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('08-05-2022', 'dd-mm-yyyy'), 48, 'Tourniquet', 243);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('30-04-2020', 'dd-mm-yyyy'), 49, 'First aid kit', 720);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('23-11-2022', 'dd-mm-yyyy'), 50, 'Suction unit', 948);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('12-08-2023', 'dd-mm-yyyy'), 51, 'Oxygen tank', 594);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('05-09-2022', 'dd-mm-yyyy'), 52, 'First aid kit', 264);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('03-07-2022', 'dd-mm-yyyy'), 53, 'First aid kit', 823);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('06-08-2023', 'dd-mm-yyyy'), 54, 'Suction unit', 648);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('21-06-2021', 'dd-mm-yyyy'), 55, 'Spine board', 57);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('23-04-2022', 'dd-mm-yyyy'), 56, 'Spine board', 376);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('27-12-2023', 'dd-mm-yyyy'), 57, 'Ambulance stretcher', 744);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('01-04-2021', 'dd-mm-yyyy'), 58, 'First aid kit', 965);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('21-10-2023', 'dd-mm-yyyy'), 59, 'Splints', 56);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('02-08-2023', 'dd-mm-yyyy'), 60, 'Defibrillator', 948);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('25-09-2020', 'dd-mm-yyyy'), 61, 'Spine board', 346);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('13-06-2022', 'dd-mm-yyyy'), 62, 'Oxygen tank', 606);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('10-05-2023', 'dd-mm-yyyy'), 63, 'Tourniquet', 511);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('30-03-2021', 'dd-mm-yyyy'), 64, 'Trauma shears', 811);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('01-02-2020', 'dd-mm-yyyy'), 65, 'Oxygen tank', 672);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('21-02-2021', 'dd-mm-yyyy'), 66, 'Trauma shears', 322);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('11-06-2020', 'dd-mm-yyyy'), 67, 'Spine board', 524);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('30-07-2023', 'dd-mm-yyyy'), 68, 'Splints', 119);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('31-01-2020', 'dd-mm-yyyy'), 69, 'Splints', 765);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('08-05-2020', 'dd-mm-yyyy'), 70, 'Suction unit', 289);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('08-11-2022', 'dd-mm-yyyy'), 71, 'First aid kit', 688);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('20-09-2021', 'dd-mm-yyyy'), 72, 'First aid kit', 99);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('09-11-2022', 'dd-mm-yyyy'), 73, 'First aid kit', 414);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('14-03-2020', 'dd-mm-yyyy'), 74, 'Tourniquet', 869);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('10-04-2021', 'dd-mm-yyyy'), 75, 'Defibrillator', 863);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('02-09-2020', 'dd-mm-yyyy'), 76, 'Spine board', 480);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('16-05-2021', 'dd-mm-yyyy'), 77, 'Defibrillator', 502);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('18-04-2022', 'dd-mm-yyyy'), 78, 'Bag valve mask', 640);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('13-03-2022', 'dd-mm-yyyy'), 79, 'Oxygen tank', 788);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('27-07-2022', 'dd-mm-yyyy'), 80, 'Suction unit', 600);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('20-11-2023', 'dd-mm-yyyy'), 81, 'Splints', 943);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('14-07-2021', 'dd-mm-yyyy'), 82, 'Ambulance stretcher', 841);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('30-12-2020', 'dd-mm-yyyy'), 83, 'Splints', 67);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('16-10-2021', 'dd-mm-yyyy'), 84, 'Suction unit', 467);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('24-05-2021', 'dd-mm-yyyy'), 85, 'Bag valve mask', 375);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('30-05-2021', 'dd-mm-yyyy'), 86, 'Splints', 612);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('02-02-2023', 'dd-mm-yyyy'), 87, 'Suction unit', 389);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('20-06-2020', 'dd-mm-yyyy'), 88, 'Trauma shears', 287);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('26-05-2020', 'dd-mm-yyyy'), 89, 'Ambulance stretcher', 98);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('12-11-2021', 'dd-mm-yyyy'), 90, 'Tourniquet', 686);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('18-11-2021', 'dd-mm-yyyy'), 91, 'Splints', 28);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('11-12-2021', 'dd-mm-yyyy'), 92, 'Spine board', 220);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('25-04-2020', 'dd-mm-yyyy'), 93, 'Trauma shears', 933);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('27-09-2021', 'dd-mm-yyyy'), 94, 'Suction unit', 406);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('12-06-2023', 'dd-mm-yyyy'), 95, 'Spine board', 991);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('30-09-2020', 'dd-mm-yyyy'), 96, 'First aid kit', 385);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('19-10-2023', 'dd-mm-yyyy'), 97, 'Ambulance stretcher', 960);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('02-12-2022', 'dd-mm-yyyy'), 98, 'Oxygen tank', 215);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('10-08-2020', 'dd-mm-yyyy'), 99, 'Bag valve mask', 349);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('03-09-2020', 'dd-mm-yyyy'), 100, 'Tourniquet', 373);
commit;
prompt 100 records committed...
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('06-05-2021', 'dd-mm-yyyy'), 101, 'Defibrillator', 358);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('20-03-2020', 'dd-mm-yyyy'), 102, 'Spine board', 20);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('13-05-2020', 'dd-mm-yyyy'), 103, 'Suction unit', 617);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('21-06-2021', 'dd-mm-yyyy'), 104, 'First aid kit', 802);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('13-06-2020', 'dd-mm-yyyy'), 105, 'Ambulance stretcher', 773);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('17-01-2022', 'dd-mm-yyyy'), 106, 'Suction unit', 50);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('16-05-2021', 'dd-mm-yyyy'), 107, 'Defibrillator', 232);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('08-10-2023', 'dd-mm-yyyy'), 108, 'Ambulance stretcher', 643);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('24-08-2022', 'dd-mm-yyyy'), 109, 'Defibrillator', 930);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('15-12-2023', 'dd-mm-yyyy'), 110, 'Spine board', 112);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('10-05-2023', 'dd-mm-yyyy'), 111, 'Oxygen tank', 479);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('01-10-2022', 'dd-mm-yyyy'), 112, 'Splints', 383);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('23-09-2020', 'dd-mm-yyyy'), 113, 'Splints', 448);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('08-02-2022', 'dd-mm-yyyy'), 114, 'First aid kit', 393);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('28-03-2023', 'dd-mm-yyyy'), 115, 'Oxygen tank', 427);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('08-03-2022', 'dd-mm-yyyy'), 116, 'Splints', 240);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('02-07-2021', 'dd-mm-yyyy'), 117, 'Tourniquet', 47);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('23-09-2022', 'dd-mm-yyyy'), 118, 'Trauma shears', 170);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('23-10-2021', 'dd-mm-yyyy'), 119, 'Bag valve mask', 711);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('26-04-2021', 'dd-mm-yyyy'), 120, 'Spine board', 980);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('23-04-2020', 'dd-mm-yyyy'), 121, 'Defibrillator', 615);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('12-08-2020', 'dd-mm-yyyy'), 122, 'Spine board', 107);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('27-09-2021', 'dd-mm-yyyy'), 123, 'Tourniquet', 238);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('03-04-2020', 'dd-mm-yyyy'), 124, 'Spine board', 89);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('24-09-2022', 'dd-mm-yyyy'), 125, 'Bag valve mask', 820);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('01-10-2020', 'dd-mm-yyyy'), 126, 'Tourniquet', 999);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('28-09-2022', 'dd-mm-yyyy'), 127, 'First aid kit', 150);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('06-05-2022', 'dd-mm-yyyy'), 128, 'Ambulance stretcher', 318);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('10-09-2021', 'dd-mm-yyyy'), 129, 'Suction unit', 242);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('09-02-2022', 'dd-mm-yyyy'), 130, 'Ambulance stretcher', 111);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('23-09-2020', 'dd-mm-yyyy'), 131, 'Bag valve mask', 601);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('20-02-2021', 'dd-mm-yyyy'), 132, 'Spine board', 863);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('07-05-2023', 'dd-mm-yyyy'), 133, 'Tourniquet', 213);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('03-09-2023', 'dd-mm-yyyy'), 134, 'Splints', 523);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('30-09-2022', 'dd-mm-yyyy'), 135, 'Bag valve mask', 204);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('08-07-2020', 'dd-mm-yyyy'), 136, 'Oxygen tank', 696);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('03-01-2020', 'dd-mm-yyyy'), 137, 'Splints', 819);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('14-10-2021', 'dd-mm-yyyy'), 138, 'Trauma shears', 81);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('27-06-2022', 'dd-mm-yyyy'), 139, 'Suction unit', 212);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('03-07-2021', 'dd-mm-yyyy'), 140, 'Trauma shears', 825);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('22-06-2021', 'dd-mm-yyyy'), 141, 'Bag valve mask', 771);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('02-11-2020', 'dd-mm-yyyy'), 142, 'Trauma shears', 893);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('29-03-2022', 'dd-mm-yyyy'), 143, 'Splints', 755);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('09-05-2022', 'dd-mm-yyyy'), 144, 'Oxygen tank', 479);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('15-01-2021', 'dd-mm-yyyy'), 145, 'Tourniquet', 99);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('23-05-2020', 'dd-mm-yyyy'), 146, 'Oxygen tank', 467);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('22-01-2020', 'dd-mm-yyyy'), 147, 'Trauma shears', 729);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('24-06-2023', 'dd-mm-yyyy'), 148, 'Splints', 494);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('07-07-2021', 'dd-mm-yyyy'), 149, 'Suction unit', 878);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('19-10-2022', 'dd-mm-yyyy'), 150, 'Trauma shears', 914);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('08-12-2021', 'dd-mm-yyyy'), 151, 'Suction unit', 143);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('07-10-2021', 'dd-mm-yyyy'), 152, 'Oxygen tank', 420);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('16-07-2023', 'dd-mm-yyyy'), 153, 'Oxygen tank', 410);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('08-05-2022', 'dd-mm-yyyy'), 154, 'Bag valve mask', 830);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('14-11-2023', 'dd-mm-yyyy'), 155, 'Splints', 28);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('06-11-2023', 'dd-mm-yyyy'), 156, 'Defibrillator', 107);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('24-07-2023', 'dd-mm-yyyy'), 157, 'Bag valve mask', 610);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('25-01-2022', 'dd-mm-yyyy'), 158, 'Oxygen tank', 777);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('22-07-2021', 'dd-mm-yyyy'), 159, 'First aid kit', 208);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('24-11-2020', 'dd-mm-yyyy'), 160, 'Bag valve mask', 785);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('23-09-2021', 'dd-mm-yyyy'), 161, 'Trauma shears', 515);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('20-02-2021', 'dd-mm-yyyy'), 162, 'Splints', 474);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('28-07-2022', 'dd-mm-yyyy'), 163, 'Defibrillator', 533);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('01-07-2020', 'dd-mm-yyyy'), 164, 'First aid kit', 909);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('20-01-2021', 'dd-mm-yyyy'), 165, 'Spine board', 126);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('15-02-2021', 'dd-mm-yyyy'), 166, 'Tourniquet', 112);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('30-10-2020', 'dd-mm-yyyy'), 167, 'Tourniquet', 391);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('06-03-2020', 'dd-mm-yyyy'), 168, 'Suction unit', 287);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('16-02-2020', 'dd-mm-yyyy'), 169, 'Bag valve mask', 52);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('08-12-2023', 'dd-mm-yyyy'), 170, 'Tourniquet', 413);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('23-02-2022', 'dd-mm-yyyy'), 171, 'Tourniquet', 589);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('12-02-2020', 'dd-mm-yyyy'), 172, 'Ambulance stretcher', 243);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('18-09-2022', 'dd-mm-yyyy'), 173, 'Oxygen tank', 635);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('08-09-2023', 'dd-mm-yyyy'), 174, 'Splints', 348);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('15-09-2022', 'dd-mm-yyyy'), 175, 'Suction unit', 903);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('26-08-2021', 'dd-mm-yyyy'), 176, 'Splints', 848);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('23-07-2020', 'dd-mm-yyyy'), 177, 'Splints', 527);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('26-06-2023', 'dd-mm-yyyy'), 178, 'Tourniquet', 629);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('02-04-2023', 'dd-mm-yyyy'), 179, 'Spine board', 919);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('12-02-2023', 'dd-mm-yyyy'), 180, 'Spine board', 465);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('05-09-2022', 'dd-mm-yyyy'), 181, 'Defibrillator', 920);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('11-03-2021', 'dd-mm-yyyy'), 182, 'Spine board', 385);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('29-10-2022', 'dd-mm-yyyy'), 183, 'Oxygen tank', 949);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('18-07-2021', 'dd-mm-yyyy'), 184, 'Trauma shears', 152);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('19-06-2021', 'dd-mm-yyyy'), 185, 'First aid kit', 867);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('30-03-2021', 'dd-mm-yyyy'), 186, 'Oxygen tank', 655);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('30-10-2020', 'dd-mm-yyyy'), 187, 'Spine board', 129);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('12-11-2021', 'dd-mm-yyyy'), 188, 'First aid kit', 656);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('10-12-2022', 'dd-mm-yyyy'), 189, 'Tourniquet', 424);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('01-08-2022', 'dd-mm-yyyy'), 190, 'Trauma shears', 583);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('08-04-2021', 'dd-mm-yyyy'), 191, 'Trauma shears', 22);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('02-02-2020', 'dd-mm-yyyy'), 192, 'Trauma shears', 34);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('06-06-2021', 'dd-mm-yyyy'), 193, 'Trauma shears', 540);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('06-10-2021', 'dd-mm-yyyy'), 194, 'Tourniquet', 469);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('15-12-2021', 'dd-mm-yyyy'), 195, 'Splints', 285);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('07-02-2020', 'dd-mm-yyyy'), 196, 'First aid kit', 164);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('02-01-2020', 'dd-mm-yyyy'), 197, 'Ambulance stretcher', 908);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('20-04-2023', 'dd-mm-yyyy'), 198, 'Tourniquet', 58);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('05-07-2020', 'dd-mm-yyyy'), 199, 'Ambulance stretcher', 259);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('01-08-2020', 'dd-mm-yyyy'), 200, 'Splints', 659);
commit;
prompt 200 records committed...
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('22-12-2022', 'dd-mm-yyyy'), 201, 'Tourniquet', 239);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('26-04-2022', 'dd-mm-yyyy'), 202, 'Defibrillator', 701);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('09-12-2021', 'dd-mm-yyyy'), 203, 'First aid kit', 539);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('25-08-2021', 'dd-mm-yyyy'), 204, 'Oxygen tank', 945);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('15-10-2023', 'dd-mm-yyyy'), 205, 'Oxygen tank', 652);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('18-07-2021', 'dd-mm-yyyy'), 206, 'Spine board', 298);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('26-08-2021', 'dd-mm-yyyy'), 207, 'Ambulance stretcher', 852);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('24-09-2021', 'dd-mm-yyyy'), 208, 'Suction unit', 530);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('03-08-2020', 'dd-mm-yyyy'), 209, 'First aid kit', 126);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('12-10-2021', 'dd-mm-yyyy'), 210, 'Trauma shears', 143);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('03-09-2022', 'dd-mm-yyyy'), 211, 'Tourniquet', 836);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('06-05-2020', 'dd-mm-yyyy'), 212, 'Trauma shears', 719);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('21-10-2020', 'dd-mm-yyyy'), 213, 'First aid kit', 241);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('13-10-2021', 'dd-mm-yyyy'), 214, 'Suction unit', 80);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('27-11-2022', 'dd-mm-yyyy'), 215, 'Oxygen tank', 528);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('11-03-2023', 'dd-mm-yyyy'), 216, 'Trauma shears', 298);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('14-01-2021', 'dd-mm-yyyy'), 217, 'Spine board', 636);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('09-10-2020', 'dd-mm-yyyy'), 218, 'Spine board', 588);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('29-03-2021', 'dd-mm-yyyy'), 219, 'Trauma shears', 665);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('04-04-2023', 'dd-mm-yyyy'), 220, 'Trauma shears', 947);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('30-07-2021', 'dd-mm-yyyy'), 221, 'Spine board', 899);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('03-07-2021', 'dd-mm-yyyy'), 222, 'Defibrillator', 714);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('26-04-2020', 'dd-mm-yyyy'), 223, 'Tourniquet', 92);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('29-05-2020', 'dd-mm-yyyy'), 224, 'Bag valve mask', 397);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('18-11-2023', 'dd-mm-yyyy'), 225, 'Ambulance stretcher', 846);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('13-01-2021', 'dd-mm-yyyy'), 226, 'Defibrillator', 967);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('07-10-2020', 'dd-mm-yyyy'), 227, 'Suction unit', 892);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('06-02-2023', 'dd-mm-yyyy'), 228, 'Spine board', 609);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('12-04-2020', 'dd-mm-yyyy'), 229, 'Defibrillator', 384);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('26-03-2021', 'dd-mm-yyyy'), 230, 'Tourniquet', 584);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('27-09-2022', 'dd-mm-yyyy'), 231, 'Oxygen tank', 30);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('07-09-2020', 'dd-mm-yyyy'), 232, 'Tourniquet', 473);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('09-04-2022', 'dd-mm-yyyy'), 233, 'Splints', 412);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('25-01-2020', 'dd-mm-yyyy'), 234, 'Suction unit', 802);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('08-07-2023', 'dd-mm-yyyy'), 235, 'Ambulance stretcher', 632);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('18-12-2023', 'dd-mm-yyyy'), 236, 'Bag valve mask', 803);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('04-09-2022', 'dd-mm-yyyy'), 237, 'Splints', 464);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('13-10-2021', 'dd-mm-yyyy'), 238, 'Ambulance stretcher', 16);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('20-01-2021', 'dd-mm-yyyy'), 239, 'Suction unit', 172);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('29-06-2020', 'dd-mm-yyyy'), 240, 'Suction unit', 644);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('30-12-2023', 'dd-mm-yyyy'), 241, 'Suction unit', 56);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('30-12-2020', 'dd-mm-yyyy'), 242, 'Defibrillator', 984);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('28-03-2022', 'dd-mm-yyyy'), 243, 'Defibrillator', 206);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('25-03-2020', 'dd-mm-yyyy'), 244, 'Bag valve mask', 150);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('09-04-2022', 'dd-mm-yyyy'), 245, 'Spine board', 928);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('07-10-2020', 'dd-mm-yyyy'), 246, 'Spine board', 449);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('31-08-2023', 'dd-mm-yyyy'), 247, 'Ambulance stretcher', 425);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('22-01-2020', 'dd-mm-yyyy'), 248, 'Oxygen tank', 559);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('04-10-2020', 'dd-mm-yyyy'), 249, 'Trauma shears', 630);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('25-09-2021', 'dd-mm-yyyy'), 250, 'Tourniquet', 841);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('14-10-2021', 'dd-mm-yyyy'), 251, 'Splints', 148);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('15-10-2020', 'dd-mm-yyyy'), 252, 'Defibrillator', 17);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('23-09-2020', 'dd-mm-yyyy'), 253, 'Trauma shears', 182);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('09-05-2020', 'dd-mm-yyyy'), 254, 'Ambulance stretcher', 921);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('17-03-2022', 'dd-mm-yyyy'), 255, 'Tourniquet', 560);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('02-03-2023', 'dd-mm-yyyy'), 256, 'Suction unit', 280);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('22-09-2021', 'dd-mm-yyyy'), 257, 'Suction unit', 727);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('01-05-2023', 'dd-mm-yyyy'), 258, 'Trauma shears', 537);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('15-12-2022', 'dd-mm-yyyy'), 259, 'Splints', 275);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('19-06-2022', 'dd-mm-yyyy'), 260, 'Ambulance stretcher', 551);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('16-07-2020', 'dd-mm-yyyy'), 261, 'Ambulance stretcher', 399);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('09-04-2022', 'dd-mm-yyyy'), 262, 'Ambulance stretcher', 866);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('15-07-2023', 'dd-mm-yyyy'), 263, 'Splints', 67);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('27-03-2022', 'dd-mm-yyyy'), 264, 'Suction unit', 969);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('23-04-2023', 'dd-mm-yyyy'), 265, 'First aid kit', 868);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('21-08-2021', 'dd-mm-yyyy'), 266, 'First aid kit', 777);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('03-08-2020', 'dd-mm-yyyy'), 267, 'Tourniquet', 825);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('25-09-2020', 'dd-mm-yyyy'), 268, 'Splints', 521);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('04-12-2021', 'dd-mm-yyyy'), 269, 'Trauma shears', 230);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('28-01-2022', 'dd-mm-yyyy'), 270, 'Trauma shears', 230);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('12-12-2023', 'dd-mm-yyyy'), 271, 'Spine board', 75);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('25-08-2020', 'dd-mm-yyyy'), 272, 'Suction unit', 386);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('17-03-2023', 'dd-mm-yyyy'), 273, 'Spine board', 245);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('01-03-2022', 'dd-mm-yyyy'), 274, 'Splints', 823);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('04-12-2023', 'dd-mm-yyyy'), 275, 'Ambulance stretcher', 651);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('24-08-2021', 'dd-mm-yyyy'), 276, 'First aid kit', 980);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('04-01-2020', 'dd-mm-yyyy'), 277, 'Oxygen tank', 79);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('25-08-2022', 'dd-mm-yyyy'), 278, 'Trauma shears', 894);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('25-08-2021', 'dd-mm-yyyy'), 279, 'Ambulance stretcher', 322);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('23-04-2020', 'dd-mm-yyyy'), 280, 'Tourniquet', 212);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('12-09-2022', 'dd-mm-yyyy'), 281, 'Defibrillator', 30);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('25-03-2022', 'dd-mm-yyyy'), 282, 'Bag valve mask', 823);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('17-03-2023', 'dd-mm-yyyy'), 283, 'Bag valve mask', 483);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('16-01-2023', 'dd-mm-yyyy'), 284, 'Ambulance stretcher', 734);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('25-03-2022', 'dd-mm-yyyy'), 285, 'Oxygen tank', 943);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('17-12-2022', 'dd-mm-yyyy'), 286, 'Spine board', 405);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('02-07-2023', 'dd-mm-yyyy'), 287, 'Defibrillator', 204);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('22-06-2022', 'dd-mm-yyyy'), 288, 'First aid kit', 169);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('04-03-2021', 'dd-mm-yyyy'), 289, 'Trauma shears', 240);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('01-05-2020', 'dd-mm-yyyy'), 290, 'Suction unit', 457);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('12-07-2022', 'dd-mm-yyyy'), 291, 'Splints', 251);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('24-12-2020', 'dd-mm-yyyy'), 292, 'Tourniquet', 625);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('02-01-2022', 'dd-mm-yyyy'), 293, 'Spine board', 810);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('28-01-2022', 'dd-mm-yyyy'), 294, 'Spine board', 31);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('25-12-2021', 'dd-mm-yyyy'), 295, 'Spine board', 875);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('22-10-2021', 'dd-mm-yyyy'), 296, 'Defibrillator', 963);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('07-12-2022', 'dd-mm-yyyy'), 297, 'Splints', 169);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('15-10-2020', 'dd-mm-yyyy'), 298, 'Splints', 890);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('07-12-2022', 'dd-mm-yyyy'), 299, 'Ambulance stretcher', 468);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('11-06-2021', 'dd-mm-yyyy'), 300, 'Suction unit', 628);
commit;
prompt 300 records committed...
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('23-08-2020', 'dd-mm-yyyy'), 301, 'Trauma shears', 625);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('30-05-2022', 'dd-mm-yyyy'), 302, 'First aid kit', 119);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('03-06-2022', 'dd-mm-yyyy'), 303, 'First aid kit', 411);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('20-09-2021', 'dd-mm-yyyy'), 304, 'Ambulance stretcher', 31);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('18-03-2020', 'dd-mm-yyyy'), 305, 'First aid kit', 385);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('15-08-2021', 'dd-mm-yyyy'), 306, 'Suction unit', 37);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('11-10-2023', 'dd-mm-yyyy'), 307, 'Splints', 678);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('13-04-2021', 'dd-mm-yyyy'), 308, 'Ambulance stretcher', 758);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('08-07-2021', 'dd-mm-yyyy'), 309, 'Suction unit', 812);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('30-03-2020', 'dd-mm-yyyy'), 310, 'Defibrillator', 771);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('20-06-2020', 'dd-mm-yyyy'), 311, 'Spine board', 43);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('04-12-2022', 'dd-mm-yyyy'), 312, 'Bag valve mask', 115);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('26-06-2020', 'dd-mm-yyyy'), 313, 'Splints', 284);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('06-09-2021', 'dd-mm-yyyy'), 314, 'Tourniquet', 151);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('24-04-2022', 'dd-mm-yyyy'), 315, 'Ambulance stretcher', 964);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('29-05-2022', 'dd-mm-yyyy'), 316, 'Trauma shears', 791);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('17-06-2020', 'dd-mm-yyyy'), 317, 'Tourniquet', 363);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('22-06-2023', 'dd-mm-yyyy'), 318, 'Ambulance stretcher', 826);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('28-10-2021', 'dd-mm-yyyy'), 319, 'Ambulance stretcher', 448);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('07-04-2021', 'dd-mm-yyyy'), 320, 'Trauma shears', 628);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('31-12-2021', 'dd-mm-yyyy'), 321, 'Suction unit', 212);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('13-01-2023', 'dd-mm-yyyy'), 322, 'Trauma shears', 706);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('24-07-2023', 'dd-mm-yyyy'), 323, 'Defibrillator', 523);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('28-03-2023', 'dd-mm-yyyy'), 324, 'First aid kit', 796);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('12-06-2020', 'dd-mm-yyyy'), 325, 'Trauma shears', 490);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('14-08-2020', 'dd-mm-yyyy'), 326, 'Splints', 164);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('22-03-2020', 'dd-mm-yyyy'), 327, 'Spine board', 95);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('15-10-2022', 'dd-mm-yyyy'), 328, 'Ambulance stretcher', 852);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('23-07-2021', 'dd-mm-yyyy'), 329, 'Spine board', 145);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('06-08-2020', 'dd-mm-yyyy'), 330, 'Defibrillator', 607);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('23-05-2020', 'dd-mm-yyyy'), 331, 'Oxygen tank', 301);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('23-05-2023', 'dd-mm-yyyy'), 332, 'Bag valve mask', 484);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('03-07-2022', 'dd-mm-yyyy'), 333, 'Ambulance stretcher', 838);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('02-02-2021', 'dd-mm-yyyy'), 334, 'Ambulance stretcher', 316);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('23-08-2021', 'dd-mm-yyyy'), 335, 'First aid kit', 671);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('17-01-2020', 'dd-mm-yyyy'), 336, 'Spine board', 933);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('26-07-2022', 'dd-mm-yyyy'), 337, 'Defibrillator', 932);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('09-01-2023', 'dd-mm-yyyy'), 338, 'Splints', 709);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('24-11-2023', 'dd-mm-yyyy'), 339, 'Trauma shears', 687);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('21-08-2021', 'dd-mm-yyyy'), 340, 'Ambulance stretcher', 363);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('09-11-2020', 'dd-mm-yyyy'), 341, 'Trauma shears', 256);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('07-09-2022', 'dd-mm-yyyy'), 342, 'Splints', 387);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('20-10-2022', 'dd-mm-yyyy'), 343, 'Ambulance stretcher', 554);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('10-09-2021', 'dd-mm-yyyy'), 344, 'Defibrillator', 702);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('27-04-2023', 'dd-mm-yyyy'), 345, 'Ambulance stretcher', 101);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('26-10-2020', 'dd-mm-yyyy'), 346, 'Splints', 644);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('22-12-2023', 'dd-mm-yyyy'), 347, 'Bag valve mask', 275);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('01-02-2023', 'dd-mm-yyyy'), 348, 'Spine board', 710);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('18-05-2022', 'dd-mm-yyyy'), 349, 'Splints', 139);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('07-05-2022', 'dd-mm-yyyy'), 350, 'Bag valve mask', 290);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('15-11-2023', 'dd-mm-yyyy'), 351, 'Trauma shears', 352);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('15-04-2023', 'dd-mm-yyyy'), 352, 'Trauma shears', 298);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('15-07-2021', 'dd-mm-yyyy'), 353, 'Bag valve mask', 233);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('30-09-2021', 'dd-mm-yyyy'), 354, 'Defibrillator', 964);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('08-03-2020', 'dd-mm-yyyy'), 355, 'Spine board', 687);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('23-08-2023', 'dd-mm-yyyy'), 356, 'Ambulance stretcher', 355);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('20-03-2022', 'dd-mm-yyyy'), 357, 'Trauma shears', 330);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('10-03-2022', 'dd-mm-yyyy'), 358, 'Trauma shears', 299);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('17-06-2023', 'dd-mm-yyyy'), 359, 'Splints', 514);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('14-05-2023', 'dd-mm-yyyy'), 360, 'Trauma shears', 608);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('28-02-2023', 'dd-mm-yyyy'), 361, 'Tourniquet', 891);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('14-06-2021', 'dd-mm-yyyy'), 362, 'Trauma shears', 599);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('11-11-2022', 'dd-mm-yyyy'), 363, 'Splints', 454);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('07-09-2023', 'dd-mm-yyyy'), 364, 'Suction unit', 274);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('25-09-2023', 'dd-mm-yyyy'), 365, 'Defibrillator', 576);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('22-09-2022', 'dd-mm-yyyy'), 366, 'Ambulance stretcher', 908);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('30-10-2023', 'dd-mm-yyyy'), 367, 'Ambulance stretcher', 990);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('08-10-2020', 'dd-mm-yyyy'), 368, 'Spine board', 520);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('21-05-2023', 'dd-mm-yyyy'), 369, 'Oxygen tank', 109);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('30-04-2021', 'dd-mm-yyyy'), 370, 'Bag valve mask', 620);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('13-06-2020', 'dd-mm-yyyy'), 371, 'Oxygen tank', 970);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('09-01-2023', 'dd-mm-yyyy'), 372, 'Tourniquet', 0);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('27-08-2022', 'dd-mm-yyyy'), 373, 'Bag valve mask', 560);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('29-05-2023', 'dd-mm-yyyy'), 374, 'Bag valve mask', 5);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('21-05-2022', 'dd-mm-yyyy'), 375, 'Tourniquet', 958);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('18-03-2021', 'dd-mm-yyyy'), 376, 'First aid kit', 986);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('14-12-2023', 'dd-mm-yyyy'), 377, 'First aid kit', 459);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('07-09-2021', 'dd-mm-yyyy'), 378, 'Splints', 322);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('12-02-2021', 'dd-mm-yyyy'), 379, 'Spine board', 494);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('05-02-2021', 'dd-mm-yyyy'), 380, 'Suction unit', 844);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('30-06-2023', 'dd-mm-yyyy'), 381, 'Tourniquet', 487);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('09-05-2022', 'dd-mm-yyyy'), 382, 'Splints', 362);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('23-05-2021', 'dd-mm-yyyy'), 383, 'Spine board', 621);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('31-01-2021', 'dd-mm-yyyy'), 384, 'Spine board', 899);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('07-09-2022', 'dd-mm-yyyy'), 385, 'Suction unit', 660);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('04-02-2022', 'dd-mm-yyyy'), 386, 'Spine board', 617);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('07-08-2020', 'dd-mm-yyyy'), 387, 'Defibrillator', 227);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('01-06-2022', 'dd-mm-yyyy'), 388, 'Defibrillator', 923);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('19-03-2020', 'dd-mm-yyyy'), 389, 'Spine board', 232);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('19-05-2023', 'dd-mm-yyyy'), 390, 'Spine board', 424);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('18-12-2023', 'dd-mm-yyyy'), 391, 'Bag valve mask', 57);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('21-07-2020', 'dd-mm-yyyy'), 392, 'Defibrillator', 785);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('12-04-2023', 'dd-mm-yyyy'), 393, 'Trauma shears', 766);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('17-01-2021', 'dd-mm-yyyy'), 394, 'Defibrillator', 738);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('22-04-2020', 'dd-mm-yyyy'), 395, 'Defibrillator', 449);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('31-03-2023', 'dd-mm-yyyy'), 396, 'Bag valve mask', 13);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('17-02-2021', 'dd-mm-yyyy'), 397, 'Oxygen tank', 58);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('31-03-2022', 'dd-mm-yyyy'), 398, 'Oxygen tank', 433);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('06-04-2020', 'dd-mm-yyyy'), 399, 'Trauma shears', 137);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('11-11-2021', 'dd-mm-yyyy'), 400, 'Bag valve mask', 302);
commit;
prompt 400 records committed...
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('07-05-2021', 'dd-mm-yyyy'), 401, 'Trauma shears', 908);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('28-10-2022', 'dd-mm-yyyy'), 402, 'Splints', 256);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('02-09-2023', 'dd-mm-yyyy'), 403, 'Splints', 707);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('27-07-2023', 'dd-mm-yyyy'), 404, 'Trauma shears', 205);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('04-02-2022', 'dd-mm-yyyy'), 405, 'Defibrillator', 886);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('02-03-2020', 'dd-mm-yyyy'), 406, 'Trauma shears', 842);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('06-01-2020', 'dd-mm-yyyy'), 407, 'Ambulance stretcher', 500);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('24-11-2020', 'dd-mm-yyyy'), 408, 'First aid kit', 557);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('14-09-2022', 'dd-mm-yyyy'), 409, 'Bag valve mask', 601);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('21-08-2023', 'dd-mm-yyyy'), 410, 'Splints', 411);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('29-09-2022', 'dd-mm-yyyy'), 411, 'Ambulance stretcher', 85);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('09-04-2020', 'dd-mm-yyyy'), 412, 'Oxygen tank', 369);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('21-11-2023', 'dd-mm-yyyy'), 413, 'Trauma shears', 133);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('28-07-2020', 'dd-mm-yyyy'), 414, 'Oxygen tank', 56);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('16-03-2023', 'dd-mm-yyyy'), 415, 'Ambulance stretcher', 597);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('13-01-2020', 'dd-mm-yyyy'), 416, 'Ambulance stretcher', 228);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('23-11-2021', 'dd-mm-yyyy'), 417, 'First aid kit', 612);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('03-01-2021', 'dd-mm-yyyy'), 418, 'Splints', 754);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('25-01-2023', 'dd-mm-yyyy'), 419, 'Ambulance stretcher', 523);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('04-08-2021', 'dd-mm-yyyy'), 420, 'Bag valve mask', 448);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('27-11-2021', 'dd-mm-yyyy'), 421, 'Oxygen tank', 120);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('07-02-2021', 'dd-mm-yyyy'), 422, 'Bag valve mask', 481);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('22-01-2021', 'dd-mm-yyyy'), 423, 'Bag valve mask', 791);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('05-03-2022', 'dd-mm-yyyy'), 424, 'Trauma shears', 512);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('04-01-2021', 'dd-mm-yyyy'), 425, 'First aid kit', 395);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('25-05-2022', 'dd-mm-yyyy'), 426, 'Oxygen tank', 102);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('02-10-2022', 'dd-mm-yyyy'), 427, 'Suction unit', 196);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('24-10-2022', 'dd-mm-yyyy'), 428, 'Trauma shears', 546);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('21-01-2020', 'dd-mm-yyyy'), 429, 'Ambulance stretcher', 24);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('21-11-2020', 'dd-mm-yyyy'), 430, 'Trauma shears', 884);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('17-04-2023', 'dd-mm-yyyy'), 431, 'Oxygen tank', 530);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('02-02-2022', 'dd-mm-yyyy'), 432, 'Suction unit', 867);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('10-09-2020', 'dd-mm-yyyy'), 433, 'Tourniquet', 80);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('03-02-2021', 'dd-mm-yyyy'), 434, 'Tourniquet', 809);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('03-11-2021', 'dd-mm-yyyy'), 435, 'Ambulance stretcher', 971);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('18-03-2023', 'dd-mm-yyyy'), 436, 'Tourniquet', 839);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('03-12-2020', 'dd-mm-yyyy'), 437, 'Bag valve mask', 412);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('14-01-2023', 'dd-mm-yyyy'), 438, 'Bag valve mask', 62);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('22-07-2023', 'dd-mm-yyyy'), 439, 'Bag valve mask', 569);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('25-12-2022', 'dd-mm-yyyy'), 440, 'Defibrillator', 585);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('16-06-2023', 'dd-mm-yyyy'), 441, 'Bag valve mask', 34);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('06-05-2023', 'dd-mm-yyyy'), 442, 'Ambulance stretcher', 338);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('28-11-2021', 'dd-mm-yyyy'), 443, 'Bag valve mask', 909);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('30-03-2020', 'dd-mm-yyyy'), 444, 'Ambulance stretcher', 295);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('13-03-2020', 'dd-mm-yyyy'), 445, 'Trauma shears', 325);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('27-05-2020', 'dd-mm-yyyy'), 446, 'Tourniquet', 843);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('07-03-2023', 'dd-mm-yyyy'), 447, 'Tourniquet', 263);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('24-04-2022', 'dd-mm-yyyy'), 448, 'Tourniquet', 163);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('14-03-2021', 'dd-mm-yyyy'), 449, 'Defibrillator', 979);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('26-09-2022', 'dd-mm-yyyy'), 450, 'Trauma shears', 163);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('29-11-2023', 'dd-mm-yyyy'), 451, 'Trauma shears', 840);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('04-01-2021', 'dd-mm-yyyy'), 452, 'Ambulance stretcher', 207);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('29-04-2021', 'dd-mm-yyyy'), 453, 'First aid kit', 928);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('02-08-2020', 'dd-mm-yyyy'), 454, 'Defibrillator', 365);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('23-02-2021', 'dd-mm-yyyy'), 455, 'Suction unit', 922);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('09-11-2022', 'dd-mm-yyyy'), 456, 'Defibrillator', 496);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('07-01-2023', 'dd-mm-yyyy'), 457, 'Trauma shears', 671);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('30-10-2021', 'dd-mm-yyyy'), 458, 'Ambulance stretcher', 970);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('15-04-2020', 'dd-mm-yyyy'), 459, 'Ambulance stretcher', 1000);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('06-12-2022', 'dd-mm-yyyy'), 460, 'Oxygen tank', 542);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('04-06-2022', 'dd-mm-yyyy'), 461, 'Trauma shears', 725);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('17-03-2022', 'dd-mm-yyyy'), 462, 'Ambulance stretcher', 705);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('29-04-2022', 'dd-mm-yyyy'), 463, 'Oxygen tank', 221);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('14-01-2021', 'dd-mm-yyyy'), 464, 'Splints', 879);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('24-03-2023', 'dd-mm-yyyy'), 465, 'Defibrillator', 147);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('16-01-2021', 'dd-mm-yyyy'), 466, 'First aid kit', 168);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('28-04-2021', 'dd-mm-yyyy'), 467, 'Defibrillator', 724);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('12-09-2023', 'dd-mm-yyyy'), 468, 'Spine board', 93);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('15-06-2023', 'dd-mm-yyyy'), 469, 'Tourniquet', 333);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('24-05-2022', 'dd-mm-yyyy'), 470, 'Suction unit', 790);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('06-12-2023', 'dd-mm-yyyy'), 471, 'Suction unit', 691);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('01-07-2020', 'dd-mm-yyyy'), 472, 'Spine board', 817);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('26-08-2021', 'dd-mm-yyyy'), 473, 'Ambulance stretcher', 535);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('14-10-2022', 'dd-mm-yyyy'), 474, 'Splints', 735);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('24-09-2023', 'dd-mm-yyyy'), 475, 'Ambulance stretcher', 209);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('21-06-2020', 'dd-mm-yyyy'), 476, 'Bag valve mask', 455);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('16-08-2021', 'dd-mm-yyyy'), 477, 'Trauma shears', 821);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('20-07-2023', 'dd-mm-yyyy'), 478, 'Ambulance stretcher', 643);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('05-04-2020', 'dd-mm-yyyy'), 479, 'Trauma shears', 246);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('29-11-2022', 'dd-mm-yyyy'), 480, 'First aid kit', 657);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('05-03-2020', 'dd-mm-yyyy'), 481, 'First aid kit', 412);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('01-11-2022', 'dd-mm-yyyy'), 482, 'First aid kit', 342);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('06-07-2021', 'dd-mm-yyyy'), 483, 'Suction unit', 336);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('01-05-2022', 'dd-mm-yyyy'), 484, 'Tourniquet', 805);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('23-01-2023', 'dd-mm-yyyy'), 485, 'First aid kit', 608);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('13-05-2023', 'dd-mm-yyyy'), 486, 'First aid kit', 924);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('06-09-2021', 'dd-mm-yyyy'), 487, 'Suction unit', 796);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('18-01-2020', 'dd-mm-yyyy'), 488, 'First aid kit', 25);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('12-07-2023', 'dd-mm-yyyy'), 489, 'Defibrillator', 749);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('23-12-2020', 'dd-mm-yyyy'), 490, 'Defibrillator', 823);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('25-01-2023', 'dd-mm-yyyy'), 491, 'Ambulance stretcher', 551);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('17-12-2023', 'dd-mm-yyyy'), 492, 'Trauma shears', 501);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('22-09-2022', 'dd-mm-yyyy'), 493, 'Suction unit', 929);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('24-01-2020', 'dd-mm-yyyy'), 494, 'Trauma shears', 796);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('01-11-2023', 'dd-mm-yyyy'), 495, 'Bag valve mask', 906);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('11-02-2023', 'dd-mm-yyyy'), 496, 'Ambulance stretcher', 81);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('23-04-2020', 'dd-mm-yyyy'), 497, 'Spine board', 395);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('20-11-2022', 'dd-mm-yyyy'), 498, 'Defibrillator', 933);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('13-07-2022', 'dd-mm-yyyy'), 499, 'Tourniquet', 819);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('04-08-2020', 'dd-mm-yyyy'), 500, 'Suction unit', 486);
commit;
prompt 500 records committed...
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('24-07-2020', 'dd-mm-yyyy'), 501, 'Splints', 858);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('04-12-2020', 'dd-mm-yyyy'), 502, 'First aid kit', 98);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('16-02-2023', 'dd-mm-yyyy'), 503, 'Ambulance stretcher', 533);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('21-04-2021', 'dd-mm-yyyy'), 504, 'Splints', 578);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('18-04-2020', 'dd-mm-yyyy'), 505, 'First aid kit', 140);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('03-04-2021', 'dd-mm-yyyy'), 506, 'Bag valve mask', 435);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('23-05-2021', 'dd-mm-yyyy'), 507, 'Suction unit', 627);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('21-03-2020', 'dd-mm-yyyy'), 508, 'Oxygen tank', 512);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('07-12-2021', 'dd-mm-yyyy'), 509, 'Bag valve mask', 898);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('12-01-2022', 'dd-mm-yyyy'), 510, 'Defibrillator', 832);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('15-06-2022', 'dd-mm-yyyy'), 511, 'Oxygen tank', 810);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('21-08-2021', 'dd-mm-yyyy'), 512, 'Tourniquet', 743);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('23-12-2023', 'dd-mm-yyyy'), 513, 'Bag valve mask', 331);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('06-03-2020', 'dd-mm-yyyy'), 514, 'Tourniquet', 486);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('27-04-2020', 'dd-mm-yyyy'), 515, 'Ambulance stretcher', 59);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('08-01-2021', 'dd-mm-yyyy'), 516, 'Oxygen tank', 173);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('09-04-2022', 'dd-mm-yyyy'), 517, 'Splints', 127);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('12-04-2023', 'dd-mm-yyyy'), 518, 'Defibrillator', 957);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('06-03-2023', 'dd-mm-yyyy'), 519, 'Oxygen tank', 902);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('03-01-2022', 'dd-mm-yyyy'), 520, 'Spine board', 965);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('29-04-2020', 'dd-mm-yyyy'), 521, 'Ambulance stretcher', 52);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('17-10-2022', 'dd-mm-yyyy'), 522, 'First aid kit', 347);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('19-04-2021', 'dd-mm-yyyy'), 523, 'Tourniquet', 936);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('27-01-2022', 'dd-mm-yyyy'), 524, 'Tourniquet', 749);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('31-12-2023', 'dd-mm-yyyy'), 525, 'Spine board', 920);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('19-08-2022', 'dd-mm-yyyy'), 526, 'Trauma shears', 508);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('09-05-2023', 'dd-mm-yyyy'), 527, 'Suction unit', 920);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('09-07-2021', 'dd-mm-yyyy'), 528, 'Trauma shears', 296);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('15-11-2020', 'dd-mm-yyyy'), 529, 'Trauma shears', 875);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('25-02-2022', 'dd-mm-yyyy'), 530, 'Trauma shears', 400);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('11-12-2023', 'dd-mm-yyyy'), 531, 'Oxygen tank', 1000);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('11-04-2023', 'dd-mm-yyyy'), 532, 'Ambulance stretcher', 865);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('05-09-2021', 'dd-mm-yyyy'), 533, 'Defibrillator', 211);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('22-08-2021', 'dd-mm-yyyy'), 534, 'Trauma shears', 14);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('12-03-2022', 'dd-mm-yyyy'), 535, 'Ambulance stretcher', 905);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('23-01-2020', 'dd-mm-yyyy'), 536, 'Splints', 773);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('17-12-2021', 'dd-mm-yyyy'), 537, 'Spine board', 157);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('11-05-2023', 'dd-mm-yyyy'), 538, 'Oxygen tank', 475);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('19-02-2020', 'dd-mm-yyyy'), 539, 'Defibrillator', 189);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('27-07-2022', 'dd-mm-yyyy'), 540, 'Suction unit', 960);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('13-06-2023', 'dd-mm-yyyy'), 541, 'Bag valve mask', 346);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('09-03-2022', 'dd-mm-yyyy'), 542, 'Defibrillator', 237);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('27-10-2022', 'dd-mm-yyyy'), 543, 'First aid kit', 861);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('09-02-2023', 'dd-mm-yyyy'), 544, 'Splints', 530);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('21-04-2023', 'dd-mm-yyyy'), 545, 'First aid kit', 920);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('13-12-2020', 'dd-mm-yyyy'), 546, 'Trauma shears', 496);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('06-11-2022', 'dd-mm-yyyy'), 547, 'Defibrillator', 950);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('14-05-2022', 'dd-mm-yyyy'), 548, 'Ambulance stretcher', 574);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('02-09-2020', 'dd-mm-yyyy'), 549, 'Spine board', 470);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('30-06-2022', 'dd-mm-yyyy'), 550, 'Tourniquet', 219);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('21-03-2021', 'dd-mm-yyyy'), 551, 'Spine board', 868);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('21-10-2023', 'dd-mm-yyyy'), 552, 'Tourniquet', 754);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('07-10-2022', 'dd-mm-yyyy'), 553, 'Bag valve mask', 270);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('16-07-2023', 'dd-mm-yyyy'), 554, 'Ambulance stretcher', 433);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('04-04-2021', 'dd-mm-yyyy'), 555, 'Splints', 625);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('02-04-2021', 'dd-mm-yyyy'), 556, 'Spine board', 443);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('07-11-2021', 'dd-mm-yyyy'), 557, 'Bag valve mask', 497);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('28-05-2020', 'dd-mm-yyyy'), 558, 'First aid kit', 647);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('21-06-2021', 'dd-mm-yyyy'), 559, 'First aid kit', 238);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('15-04-2022', 'dd-mm-yyyy'), 560, 'Ambulance stretcher', 423);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('30-05-2023', 'dd-mm-yyyy'), 561, 'Bag valve mask', 403);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('05-09-2021', 'dd-mm-yyyy'), 562, 'Ambulance stretcher', 573);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('07-02-2022', 'dd-mm-yyyy'), 563, 'Splints', 901);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('06-12-2022', 'dd-mm-yyyy'), 564, 'Trauma shears', 403);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('21-10-2022', 'dd-mm-yyyy'), 565, 'Tourniquet', 636);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('08-11-2023', 'dd-mm-yyyy'), 566, 'Spine board', 519);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('29-03-2021', 'dd-mm-yyyy'), 567, 'Oxygen tank', 753);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('31-03-2022', 'dd-mm-yyyy'), 568, 'Suction unit', 882);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('11-10-2020', 'dd-mm-yyyy'), 569, 'Suction unit', 157);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('05-01-2023', 'dd-mm-yyyy'), 570, 'Ambulance stretcher', 97);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('10-04-2021', 'dd-mm-yyyy'), 571, 'First aid kit', 317);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('29-05-2022', 'dd-mm-yyyy'), 572, 'Spine board', 114);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('22-01-2021', 'dd-mm-yyyy'), 573, 'Oxygen tank', 475);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('26-08-2020', 'dd-mm-yyyy'), 574, 'Ambulance stretcher', 141);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('27-06-2023', 'dd-mm-yyyy'), 575, 'Splints', 946);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('02-10-2020', 'dd-mm-yyyy'), 576, 'Spine board', 209);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('08-06-2022', 'dd-mm-yyyy'), 577, 'Defibrillator', 127);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('25-08-2022', 'dd-mm-yyyy'), 578, 'Trauma shears', 976);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('31-08-2021', 'dd-mm-yyyy'), 579, 'First aid kit', 837);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('16-06-2021', 'dd-mm-yyyy'), 580, 'First aid kit', 596);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('17-07-2022', 'dd-mm-yyyy'), 581, 'Defibrillator', 634);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('28-06-2023', 'dd-mm-yyyy'), 582, 'Defibrillator', 419);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('12-06-2022', 'dd-mm-yyyy'), 583, 'Oxygen tank', 464);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('29-04-2023', 'dd-mm-yyyy'), 584, 'Suction unit', 415);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('04-10-2023', 'dd-mm-yyyy'), 585, 'Splints', 354);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('15-10-2020', 'dd-mm-yyyy'), 586, 'Defibrillator', 171);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('15-04-2021', 'dd-mm-yyyy'), 587, 'Splints', 487);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('20-04-2021', 'dd-mm-yyyy'), 588, 'Ambulance stretcher', 566);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('17-06-2020', 'dd-mm-yyyy'), 589, 'Trauma shears', 977);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('07-03-2022', 'dd-mm-yyyy'), 590, 'Oxygen tank', 469);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('10-11-2023', 'dd-mm-yyyy'), 591, 'Bag valve mask', 479);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('31-03-2020', 'dd-mm-yyyy'), 592, 'Ambulance stretcher', 439);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('21-12-2023', 'dd-mm-yyyy'), 593, 'Oxygen tank', 564);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('16-08-2023', 'dd-mm-yyyy'), 594, 'First aid kit', 155);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('12-08-2023', 'dd-mm-yyyy'), 595, 'Bag valve mask', 47);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('22-07-2020', 'dd-mm-yyyy'), 596, 'Bag valve mask', 605);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('03-07-2022', 'dd-mm-yyyy'), 597, 'Ambulance stretcher', 386);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('13-03-2023', 'dd-mm-yyyy'), 598, 'Bag valve mask', 547);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('13-06-2023', 'dd-mm-yyyy'), 599, 'Defibrillator', 167);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('24-02-2020', 'dd-mm-yyyy'), 600, 'First aid kit', 964);
commit;
prompt 600 records committed...
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('09-06-2022', 'dd-mm-yyyy'), 601, 'First aid kit', 975);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('15-06-2023', 'dd-mm-yyyy'), 602, 'Spine board', 744);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('03-03-2022', 'dd-mm-yyyy'), 603, 'Defibrillator', 820);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('10-06-2022', 'dd-mm-yyyy'), 604, 'Suction unit', 126);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('23-03-2022', 'dd-mm-yyyy'), 605, 'Oxygen tank', 105);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('23-05-2020', 'dd-mm-yyyy'), 606, 'Spine board', 279);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('24-08-2023', 'dd-mm-yyyy'), 607, 'Defibrillator', 251);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('25-10-2020', 'dd-mm-yyyy'), 608, 'Bag valve mask', 44);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('16-03-2023', 'dd-mm-yyyy'), 609, 'Defibrillator', 670);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('29-01-2022', 'dd-mm-yyyy'), 610, 'Trauma shears', 232);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('29-05-2023', 'dd-mm-yyyy'), 611, 'First aid kit', 441);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('15-03-2023', 'dd-mm-yyyy'), 612, 'Spine board', 155);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('21-09-2022', 'dd-mm-yyyy'), 613, 'First aid kit', 633);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('15-01-2021', 'dd-mm-yyyy'), 614, 'Defibrillator', 215);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('24-07-2020', 'dd-mm-yyyy'), 615, 'Defibrillator', 600);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('05-04-2021', 'dd-mm-yyyy'), 616, 'Splints', 547);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('11-10-2023', 'dd-mm-yyyy'), 617, 'Splints', 525);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('06-06-2021', 'dd-mm-yyyy'), 618, 'Splints', 857);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('15-10-2023', 'dd-mm-yyyy'), 619, 'Defibrillator', 775);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('27-10-2021', 'dd-mm-yyyy'), 620, 'Defibrillator', 929);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('21-07-2020', 'dd-mm-yyyy'), 621, 'Trauma shears', 187);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('28-01-2023', 'dd-mm-yyyy'), 622, 'Spine board', 687);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('24-03-2021', 'dd-mm-yyyy'), 623, 'Suction unit', 900);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('19-01-2023', 'dd-mm-yyyy'), 624, 'Tourniquet', 400);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('03-03-2020', 'dd-mm-yyyy'), 625, 'Oxygen tank', 704);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('12-06-2021', 'dd-mm-yyyy'), 626, 'Splints', 557);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('19-02-2021', 'dd-mm-yyyy'), 627, 'Trauma shears', 856);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('21-12-2022', 'dd-mm-yyyy'), 628, 'Tourniquet', 302);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('23-11-2021', 'dd-mm-yyyy'), 629, 'Defibrillator', 736);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('10-08-2023', 'dd-mm-yyyy'), 630, 'Suction unit', 984);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('17-01-2023', 'dd-mm-yyyy'), 631, 'Spine board', 380);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('14-11-2020', 'dd-mm-yyyy'), 632, 'Defibrillator', 659);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('14-03-2020', 'dd-mm-yyyy'), 633, 'Oxygen tank', 714);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('21-03-2021', 'dd-mm-yyyy'), 634, 'Ambulance stretcher', 61);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('05-04-2020', 'dd-mm-yyyy'), 635, 'First aid kit', 899);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('08-03-2021', 'dd-mm-yyyy'), 636, 'Trauma shears', 970);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('12-12-2022', 'dd-mm-yyyy'), 637, 'Defibrillator', 578);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('03-09-2022', 'dd-mm-yyyy'), 638, 'Defibrillator', 837);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('19-07-2023', 'dd-mm-yyyy'), 639, 'Spine board', 605);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('08-05-2022', 'dd-mm-yyyy'), 640, 'First aid kit', 383);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('02-01-2021', 'dd-mm-yyyy'), 641, 'Defibrillator', 29);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('14-05-2023', 'dd-mm-yyyy'), 642, 'Oxygen tank', 275);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('09-10-2020', 'dd-mm-yyyy'), 643, 'Tourniquet', 372);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('26-04-2022', 'dd-mm-yyyy'), 644, 'Bag valve mask', 498);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('15-08-2022', 'dd-mm-yyyy'), 645, 'Oxygen tank', 498);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('02-04-2022', 'dd-mm-yyyy'), 646, 'Tourniquet', 221);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('05-05-2020', 'dd-mm-yyyy'), 647, 'Defibrillator', 325);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('14-02-2021', 'dd-mm-yyyy'), 648, 'First aid kit', 327);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('10-11-2022', 'dd-mm-yyyy'), 649, 'First aid kit', 267);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('29-08-2021', 'dd-mm-yyyy'), 650, 'Ambulance stretcher', 988);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('21-03-2023', 'dd-mm-yyyy'), 651, 'Splints', 135);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('30-03-2022', 'dd-mm-yyyy'), 652, 'Defibrillator', 172);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('06-06-2023', 'dd-mm-yyyy'), 653, 'Trauma shears', 477);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('07-07-2020', 'dd-mm-yyyy'), 654, 'Oxygen tank', 464);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('13-05-2021', 'dd-mm-yyyy'), 655, 'Spine board', 397);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('28-02-2023', 'dd-mm-yyyy'), 656, 'Tourniquet', 440);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('11-03-2023', 'dd-mm-yyyy'), 657, 'Defibrillator', 937);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('06-12-2023', 'dd-mm-yyyy'), 658, 'Tourniquet', 889);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('30-05-2021', 'dd-mm-yyyy'), 659, 'Trauma shears', 630);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('18-10-2022', 'dd-mm-yyyy'), 660, 'Defibrillator', 653);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('31-08-2020', 'dd-mm-yyyy'), 661, 'Suction unit', 972);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('05-05-2021', 'dd-mm-yyyy'), 662, 'Bag valve mask', 670);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('04-05-2021', 'dd-mm-yyyy'), 663, 'Defibrillator', 760);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('01-05-2022', 'dd-mm-yyyy'), 664, 'Tourniquet', 181);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('18-11-2022', 'dd-mm-yyyy'), 665, 'Suction unit', 742);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('03-03-2022', 'dd-mm-yyyy'), 666, 'Suction unit', 901);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('14-01-2021', 'dd-mm-yyyy'), 667, 'Oxygen tank', 144);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('18-12-2020', 'dd-mm-yyyy'), 668, 'Tourniquet', 449);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('24-10-2023', 'dd-mm-yyyy'), 669, 'Splints', 745);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('29-01-2023', 'dd-mm-yyyy'), 670, 'Trauma shears', 456);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('04-07-2020', 'dd-mm-yyyy'), 671, 'Splints', 475);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('24-03-2021', 'dd-mm-yyyy'), 672, 'Spine board', 647);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('20-10-2020', 'dd-mm-yyyy'), 673, 'Defibrillator', 451);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('10-12-2021', 'dd-mm-yyyy'), 674, 'Ambulance stretcher', 818);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('10-07-2020', 'dd-mm-yyyy'), 675, 'Bag valve mask', 133);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('03-05-2023', 'dd-mm-yyyy'), 676, 'Ambulance stretcher', 197);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('16-03-2022', 'dd-mm-yyyy'), 677, 'Defibrillator', 273);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('13-07-2022', 'dd-mm-yyyy'), 678, 'Oxygen tank', 4);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('12-08-2021', 'dd-mm-yyyy'), 679, 'Suction unit', 832);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('26-03-2021', 'dd-mm-yyyy'), 680, 'Splints', 509);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('10-08-2020', 'dd-mm-yyyy'), 681, 'Spine board', 332);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('30-12-2022', 'dd-mm-yyyy'), 682, 'Ambulance stretcher', 265);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('09-02-2022', 'dd-mm-yyyy'), 683, 'Spine board', 606);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('18-10-2021', 'dd-mm-yyyy'), 684, 'Spine board', 764);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('11-12-2022', 'dd-mm-yyyy'), 685, 'Splints', 708);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('27-03-2022', 'dd-mm-yyyy'), 686, 'Ambulance stretcher', 418);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('12-02-2021', 'dd-mm-yyyy'), 687, 'Trauma shears', 511);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('05-11-2021', 'dd-mm-yyyy'), 688, 'Tourniquet', 771);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('08-10-2021', 'dd-mm-yyyy'), 689, 'Splints', 143);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('28-02-2023', 'dd-mm-yyyy'), 690, 'Oxygen tank', 965);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('21-03-2021', 'dd-mm-yyyy'), 691, 'Oxygen tank', 569);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('22-06-2022', 'dd-mm-yyyy'), 692, 'Defibrillator', 145);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('24-01-2021', 'dd-mm-yyyy'), 693, 'First aid kit', 396);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('20-12-2020', 'dd-mm-yyyy'), 694, 'Bag valve mask', 398);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('07-09-2022', 'dd-mm-yyyy'), 695, 'Bag valve mask', 820);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('01-04-2021', 'dd-mm-yyyy'), 696, 'Ambulance stretcher', 325);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('11-11-2022', 'dd-mm-yyyy'), 697, 'Bag valve mask', 691);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('21-06-2021', 'dd-mm-yyyy'), 698, 'Tourniquet', 312);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('23-01-2022', 'dd-mm-yyyy'), 699, 'Oxygen tank', 540);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('05-12-2023', 'dd-mm-yyyy'), 700, 'Splints', 195);
commit;
prompt 700 records committed...
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('15-12-2021', 'dd-mm-yyyy'), 701, 'Trauma shears', 977);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('03-07-2023', 'dd-mm-yyyy'), 702, 'Ambulance stretcher', 231);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('26-11-2020', 'dd-mm-yyyy'), 703, 'Trauma shears', 972);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('14-02-2022', 'dd-mm-yyyy'), 704, 'Trauma shears', 336);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('10-02-2021', 'dd-mm-yyyy'), 705, 'Tourniquet', 948);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('21-07-2020', 'dd-mm-yyyy'), 706, 'Oxygen tank', 276);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('25-06-2023', 'dd-mm-yyyy'), 707, 'Bag valve mask', 116);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('09-08-2020', 'dd-mm-yyyy'), 708, 'Spine board', 155);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('01-01-2020', 'dd-mm-yyyy'), 709, 'First aid kit', 21);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('07-08-2021', 'dd-mm-yyyy'), 710, 'Defibrillator', 83);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('08-04-2023', 'dd-mm-yyyy'), 711, 'Spine board', 450);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('21-09-2022', 'dd-mm-yyyy'), 712, 'Ambulance stretcher', 427);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('08-03-2020', 'dd-mm-yyyy'), 713, 'Bag valve mask', 735);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('04-04-2020', 'dd-mm-yyyy'), 714, 'First aid kit', 595);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('17-01-2023', 'dd-mm-yyyy'), 715, 'Splints', 614);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('13-07-2023', 'dd-mm-yyyy'), 716, 'Bag valve mask', 1000);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('08-07-2021', 'dd-mm-yyyy'), 717, 'Defibrillator', 256);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('17-04-2022', 'dd-mm-yyyy'), 718, 'Splints', 619);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('24-05-2022', 'dd-mm-yyyy'), 719, 'Ambulance stretcher', 421);
commit;
prompt 719 records loaded
prompt Loading LECTURERS...
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (200, 'Ozzy Reeves', to_date('14-01-1989', 'dd-mm-yyyy'), '27', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (201, 'Danny Scheider', to_date('23-05-2013', 'dd-mm-yyyy'), '26', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (202, 'Debi Scorsese', to_date('12-07-2009', 'dd-mm-yyyy'), '15', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (203, 'Junior Whitaker', to_date('16-06-1984', 'dd-mm-yyyy'), '2', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (204, 'Hugo Cash', to_date('26-09-1995', 'dd-mm-yyyy'), '26', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (205, 'Sarah Quaid', to_date('09-12-1971', 'dd-mm-yyyy'), '24', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (206, 'Mac Ledger', to_date('07-09-2009', 'dd-mm-yyyy'), '14', 'Pediatric Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (207, 'Tanya Reeve', to_date('04-09-2006', 'dd-mm-yyyy'), '27', '''Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (208, 'Javon Rankin', to_date('04-07-2011', 'dd-mm-yyyy'), '24', 'Disaster Management');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (209, 'Andre Pierce', to_date('02-02-2019', 'dd-mm-yyyy'), '13', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (210, 'Benicio Bright', to_date('19-09-1982', 'dd-mm-yyyy'), '16', 'Disaster Management');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (211, 'Fats Crudup', to_date('13-10-2007', 'dd-mm-yyyy'), '9', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (212, 'Oro Finn', to_date('24-05-1985', 'dd-mm-yyyy'), '1', 'Disaster Management');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (213, 'Betty Cara', to_date('22-12-1975', 'dd-mm-yyyy'), '23', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (214, 'Simon McConaughey', to_date('20-05-1984', 'dd-mm-yyyy'), '8', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (215, 'Annette Midler', to_date('05-03-2003', 'dd-mm-yyyy'), '1', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (216, 'Lin Andrews', to_date('10-02-2006', 'dd-mm-yyyy'), '8', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (217, 'Keanu Morton', to_date('05-06-2000', 'dd-mm-yyyy'), '7', '''Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (218, 'Ed Unger', to_date('07-09-1995', 'dd-mm-yyyy'), '27', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (219, 'Joaquin Pleasure', to_date('15-08-2018', 'dd-mm-yyyy'), '18', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (220, 'Gina Deejay', to_date('03-07-2004', 'dd-mm-yyyy'), '20', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (221, 'Arnold Holiday', to_date('25-10-2018', 'dd-mm-yyyy'), '27', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (222, 'Michelle Latifah', to_date('27-04-1984', 'dd-mm-yyyy'), '2', '''Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (223, 'Gaby Chandler', to_date('25-07-1974', 'dd-mm-yyyy'), '22', '''Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (224, 'Garland Rollins', to_date('19-09-1995', 'dd-mm-yyyy'), '6', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (225, 'Jean Forster', to_date('21-10-1986', 'dd-mm-yyyy'), '26', 'Disaster Management');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (226, 'Brothers McGinley', to_date('05-11-2000', 'dd-mm-yyyy'), '22', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (227, 'Albert Nicks', to_date('11-03-2005', 'dd-mm-yyyy'), '17', 'Pediatric Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (228, 'Jose Kramer', to_date('21-07-2016', 'dd-mm-yyyy'), '5', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (229, 'Andie Hewitt', to_date('10-12-1993', 'dd-mm-yyyy'), '23', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (230, 'Gary Farrell', to_date('06-02-1996', 'dd-mm-yyyy'), '17', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (231, 'Trini Willard', to_date('24-06-2008', 'dd-mm-yyyy'), '23', 'Pediatric Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (232, 'Liam Benet', to_date('20-12-2000', 'dd-mm-yyyy'), '20', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (233, 'Treat Goodall', to_date('17-05-1989', 'dd-mm-yyyy'), '21', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (234, 'Kim Posener', to_date('18-03-2009', 'dd-mm-yyyy'), '27', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (235, 'Howie Rauhofer', to_date('06-09-1985', 'dd-mm-yyyy'), '24', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (236, 'Warren Peebles', to_date('24-02-1999', 'dd-mm-yyyy'), '19', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (237, 'Adina Ranger', to_date('19-07-2018', 'dd-mm-yyyy'), '26', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (238, 'Ozzy McCready', to_date('26-11-1987', 'dd-mm-yyyy'), '14', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (239, 'Angie Ripley', to_date('12-06-1991', 'dd-mm-yyyy'), '28', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (240, 'Barbara Cockburn', to_date('03-03-2008', 'dd-mm-yyyy'), '17', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (241, 'Pamela Broadbent', to_date('28-03-1973', 'dd-mm-yyyy'), '1', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (242, 'Jim Geldof', to_date('05-04-2015', 'dd-mm-yyyy'), '10', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (243, 'Neneh Luongo', to_date('05-02-1978', 'dd-mm-yyyy'), '30', 'Pediatric Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (244, 'Tobey Fisher', to_date('16-09-1994', 'dd-mm-yyyy'), '1', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (245, 'Jeffery Hornsby', to_date('06-10-2019', 'dd-mm-yyyy'), '7', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (246, 'Paul Levy', to_date('20-09-1979', 'dd-mm-yyyy'), '14', '''Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (247, 'Chantי Thewlis', to_date('29-03-1980', 'dd-mm-yyyy'), '1', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (248, 'Tzi Whitwam', to_date('01-10-2002', 'dd-mm-yyyy'), '2', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (249, 'Ramsey Getty', to_date('16-09-1982', 'dd-mm-yyyy'), '20', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (250, 'Blair Biel', to_date('02-07-1987', 'dd-mm-yyyy'), '9', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (251, 'Wally Bailey', to_date('14-03-1998', 'dd-mm-yyyy'), '21', '''Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (252, 'Josh Adler', to_date('10-10-2001', 'dd-mm-yyyy'), '6', '''Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (253, 'Kurtwood Dale', to_date('05-01-1974', 'dd-mm-yyyy'), '13', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (254, 'Miles O''Donnell', to_date('03-03-1979', 'dd-mm-yyyy'), '26', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (255, 'Samantha Keith', to_date('09-06-2001', 'dd-mm-yyyy'), '29', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (256, 'Jonathan Shocked', to_date('26-05-1993', 'dd-mm-yyyy'), '27', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (257, 'Luis Statham', to_date('03-10-2019', 'dd-mm-yyyy'), '22', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (258, 'Ted Gaynor', to_date('05-08-1974', 'dd-mm-yyyy'), '24', '''Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (259, 'Merrill Lynne', to_date('29-07-1985', 'dd-mm-yyyy'), '26', 'Pediatric Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (260, 'Angelina McKean', to_date('07-12-2006', 'dd-mm-yyyy'), '3', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (261, 'Ashton Richardson', to_date('02-07-1999', 'dd-mm-yyyy'), '21', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (262, 'Janeane Armstrong', to_date('21-12-1982', 'dd-mm-yyyy'), '20', '''Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (263, 'Irene McLean', to_date('05-01-1979', 'dd-mm-yyyy'), '13', '''Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (264, 'Busta Bassett', to_date('23-10-1976', 'dd-mm-yyyy'), '29', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (265, 'Dabney Puckett', to_date('13-07-1975', 'dd-mm-yyyy'), '25', '''Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (266, 'Loren Osbourne', to_date('27-02-1977', 'dd-mm-yyyy'), '27', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (267, 'Tilda Vassar', to_date('06-11-2007', 'dd-mm-yyyy'), '9', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (268, 'Ricardo Loring', to_date('22-05-2007', 'dd-mm-yyyy'), '3', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (269, 'Penelope Meyer', to_date('22-10-2001', 'dd-mm-yyyy'), '20', '''Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (270, 'Loretta Carrington', to_date('16-01-1994', 'dd-mm-yyyy'), '8', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (271, 'Kid Blair', to_date('13-02-1990', 'dd-mm-yyyy'), '13', 'Pediatric Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (272, 'Willem Stuermer', to_date('19-01-1993', 'dd-mm-yyyy'), '23', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (273, 'Joey Hurley', to_date('14-01-2015', 'dd-mm-yyyy'), '16', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (274, 'Lizzy Azaria', to_date('24-02-1985', 'dd-mm-yyyy'), '11', 'Disaster Management');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (275, 'Gavin Chaykin', to_date('29-12-1992', 'dd-mm-yyyy'), '28', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (276, 'Julianna Wagner', to_date('19-02-1974', 'dd-mm-yyyy'), '7', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (277, 'Donal Winger', to_date('18-08-1972', 'dd-mm-yyyy'), '2', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (278, 'Corey Clooney', to_date('17-03-2004', 'dd-mm-yyyy'), '25', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (279, 'Bernie Diehl', to_date('25-12-1998', 'dd-mm-yyyy'), '27', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (280, 'Leelee Carr', to_date('26-07-1971', 'dd-mm-yyyy'), '5', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (281, 'Brooke Speaks', to_date('09-12-2014', 'dd-mm-yyyy'), '3', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (282, 'Morgan Donovan', to_date('27-11-1980', 'dd-mm-yyyy'), '2', 'Pediatric Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (283, 'Diane Belles', to_date('16-10-1989', 'dd-mm-yyyy'), '26', 'Pediatric Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (284, 'Lorraine DeVito', to_date('09-10-2005', 'dd-mm-yyyy'), '17', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (285, 'Miranda Hatfield', to_date('17-08-1991', 'dd-mm-yyyy'), '30', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (286, 'Harry Busey', to_date('14-07-1992', 'dd-mm-yyyy'), '30', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (287, 'Ali Fishburne', to_date('22-11-2018', 'dd-mm-yyyy'), '16', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (288, 'Melba Fehr', to_date('10-10-2017', 'dd-mm-yyyy'), '24', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (289, 'Emerson Austin', to_date('15-06-2004', 'dd-mm-yyyy'), '19', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (290, 'Elias Kline', to_date('12-10-2007', 'dd-mm-yyyy'), '22', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (291, 'Lenny McNeice', to_date('25-05-2006', 'dd-mm-yyyy'), '5', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (292, 'Mindy Gano', to_date('08-12-1972', 'dd-mm-yyyy'), '23', 'Disaster Management');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (293, 'Merillee Bedelia', to_date('29-05-1981', 'dd-mm-yyyy'), '13', 'Pediatric Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (294, 'Rupert Bracco', to_date('21-04-1989', 'dd-mm-yyyy'), '12', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (295, 'Elisabeth Snipes', to_date('11-05-2002', 'dd-mm-yyyy'), '6', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (296, 'Robby Duvall', to_date('09-05-1990', 'dd-mm-yyyy'), '30', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (297, 'Millie Playboys', to_date('02-06-2009', 'dd-mm-yyyy'), '13', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (298, 'Jimmy Reid', to_date('07-06-2004', 'dd-mm-yyyy'), '15', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (299, 'Gordon Eastwood', to_date('18-01-1977', 'dd-mm-yyyy'), '16', 'Emergency Response');
commit;
prompt 100 records committed...
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (300, 'Connie Gambon', to_date('11-05-2003', 'dd-mm-yyyy'), '14', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (301, 'Vonda Chan', to_date('19-08-2015', 'dd-mm-yyyy'), '1', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (302, 'Bill McDonald', to_date('04-08-2005', 'dd-mm-yyyy'), '15', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (303, 'Mos Prinze', to_date('12-05-2009', 'dd-mm-yyyy'), '14', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (304, 'Vincent Molina', to_date('29-01-2019', 'dd-mm-yyyy'), '17', 'Pediatric Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (305, 'Cherry Rhymes', to_date('11-06-1999', 'dd-mm-yyyy'), '24', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (306, 'Vertical MacIsaac', to_date('26-09-2004', 'dd-mm-yyyy'), '22', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (307, 'Nancy Steagall', to_date('18-11-2006', 'dd-mm-yyyy'), '28', 'Disaster Management');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (308, 'Liam Stiers', to_date('19-07-2007', 'dd-mm-yyyy'), '28', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (309, 'Samuel Sawa', to_date('31-03-1980', 'dd-mm-yyyy'), '6', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (310, 'Kirk Turturro', to_date('03-07-1978', 'dd-mm-yyyy'), '8', 'Advanced Life Support');
commit;
prompt 111 records loaded
prompt Loading ROOM...
insert into ROOM (r_id, r_location, numplace, r_type)
values (1, 'Investigation and Medical Shoc', 1, 'Communication Room''');
insert into ROOM (r_id, r_location, numplace, r_type)
values (2, 'Access Control and Entrance Ro', 2, 'Laboratory Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (3, 'Emergency Treatment Room', 3, 'Access Control Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (4, 'Investigation and Medical Shoc', 4, 'Access Control Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (5, 'Investigation and Medical Shoc', 5, 'Laboratory Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (6, 'Communication and Media Distri', 6, 'Rescue Team Communication Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (7, 'Media and Information Display ', 7, 'Administration Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (8, 'Investigation and Medical Shoc', 8, 'Communication Room''');
insert into ROOM (r_id, r_location, numplace, r_type)
values (9, 'Access Control and Entrance Ro', 9, 'Triage Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (10, 'Investigation and Medical Shoc', 10, 'Communication Room''');
insert into ROOM (r_id, r_location, numplace, r_type)
values (11, 'Triage Room', 11, 'Administration Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (12, 'Crisis Management and Rehabili', 12, 'Emergency Treatment Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (13, 'Access Control and Entrance Ro', 13, 'Medical Shock Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (14, 'Access Control and Entrance Ro', 14, 'Access Control Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (15, 'Triage Room', 15, 'Communication Room''');
insert into ROOM (r_id, r_location, numplace, r_type)
values (16, 'Media and Information Display ', 16, 'Medical Shock Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (17, 'Triage Room', 17, 'Laboratory Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (18, 'Communication Room with Rescue', 18, 'Access Control Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (19, 'Access Control and Entrance Ro', 19, 'Triage Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (20, 'Access Control and Entrance Ro', 20, 'Access Control Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (21, 'Crisis Management and Rehabili', 21, 'Triage Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (22, 'Communication Room with Rescue', 22, 'Communication Room''');
insert into ROOM (r_id, r_location, numplace, r_type)
values (23, 'Administration and Medical Tea', 23, 'Communication Room''');
insert into ROOM (r_id, r_location, numplace, r_type)
values (24, 'Crisis Management and Rehabili', 24, 'Emergency Treatment Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (25, 'Media and Information Display ', 25, 'Information Display Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (26, 'Media and Information Display ', 26, 'Administration Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (27, 'Communication and Media Distri', 27, 'Crisis Management Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (28, 'Access Control and Entrance Ro', 28, 'Access Control Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (29, 'Crisis Management and Rehabili', 29, 'Triage Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (30, 'Laboratory and Testing Room', 30, 'Triage Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (31, 'Investigation and Medical Shoc', 31, 'Rescue Team Communication Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (32, 'Triage Room', 32, 'Laboratory Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (33, 'Administration and Medical Tea', 33, 'Access Control Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (34, 'Emergency Treatment Room', 34, 'Crisis Management Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (35, 'Communication and Media Distri', 35, 'Medical Shock Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (36, 'Triage Room', 36, 'Laboratory Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (37, 'Administration and Medical Tea', 37, 'Access Control Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (38, 'Administration and Medical Tea', 38, 'Triage Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (39, 'Triage Room', 39, 'Access Control Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (40, 'Emergency Treatment Room', 40, 'Communication Room''');
insert into ROOM (r_id, r_location, numplace, r_type)
values (41, 'Emergency Treatment Room', 41, 'Crisis Management Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (42, 'Emergency Treatment Room', 42, 'Medical Shock Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (43, 'Emergency Treatment Room', 43, 'Emergency Treatment Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (44, 'Emergency Treatment Room', 44, 'Rescue Team Communication Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (45, 'Triage Room', 45, 'Emergency Treatment Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (46, 'Access Control and Entrance Ro', 46, 'Emergency Treatment Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (47, 'Emergency Treatment Room', 47, 'Access Control Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (48, 'Investigation and Medical Shoc', 48, 'Emergency Treatment Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (49, 'Investigation and Medical Shoc', 49, 'Communication Room''');
insert into ROOM (r_id, r_location, numplace, r_type)
values (50, 'Access Control and Entrance Ro', 50, 'Access Control Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (51, 'Media and Information Display ', 51, 'Access Control Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (52, 'Investigation and Medical Shoc', 52, 'Information Display Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (53, 'Triage Room', 53, 'Administration Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (54, 'Administration and Medical Tea', 54, 'Medical Shock Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (55, 'Investigation and Medical Shoc', 55, 'Medical Shock Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (56, 'Investigation and Medical Shoc', 56, 'Communication Room''');
insert into ROOM (r_id, r_location, numplace, r_type)
values (57, 'Crisis Management and Rehabili', 57, 'Laboratory Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (58, 'Communication and Media Distri', 58, 'Rescue Team Communication Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (59, 'Administration and Medical Tea', 59, 'Rescue Team Communication Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (60, 'Administration and Medical Tea', 60, 'Laboratory Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (61, 'Access Control and Entrance Ro', 61, 'Access Control Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (62, 'Laboratory and Testing Room', 62, 'Laboratory Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (63, 'Emergency Treatment Room', 63, 'Administration Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (64, 'Administration and Medical Tea', 64, 'Rescue Team Communication Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (65, 'Administration and Medical Tea', 65, 'Emergency Treatment Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (66, 'Communication Room with Rescue', 66, 'Rescue Team Communication Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (67, 'Communication and Media Distri', 67, 'Crisis Management Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (68, 'Investigation and Medical Shoc', 68, 'Crisis Management Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (69, 'Triage Room', 69, 'Information Display Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (70, 'Administration and Medical Tea', 70, 'Medical Shock Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (71, 'Communication Room with Rescue', 71, 'Crisis Management Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (72, 'Crisis Management and Rehabili', 72, 'Administration Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (73, 'Crisis Management and Rehabili', 73, 'Laboratory Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (74, 'Administration and Medical Tea', 74, 'Crisis Management Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (75, 'Media and Information Display ', 75, 'Emergency Treatment Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (76, 'Access Control and Entrance Ro', 76, 'Communication Room''');
insert into ROOM (r_id, r_location, numplace, r_type)
values (77, 'Communication and Media Distri', 77, 'Crisis Management Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (78, 'Triage Room', 78, 'Communication Room''');
insert into ROOM (r_id, r_location, numplace, r_type)
values (79, 'Access Control and Entrance Ro', 79, 'Administration Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (80, 'Access Control and Entrance Ro', 80, 'Communication Room''');
insert into ROOM (r_id, r_location, numplace, r_type)
values (81, 'Communication and Media Distri', 81, 'Communication Room''');
insert into ROOM (r_id, r_location, numplace, r_type)
values (82, 'Triage Room', 82, 'Rescue Team Communication Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (83, 'Laboratory and Testing Room', 83, 'Access Control Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (84, 'Laboratory and Testing Room', 84, 'Information Display Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (85, 'Emergency Treatment Room', 85, 'Medical Shock Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (86, 'Media and Information Display ', 86, 'Access Control Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (87, 'Triage Room', 87, 'Communication Room''');
insert into ROOM (r_id, r_location, numplace, r_type)
values (88, 'Laboratory and Testing Room', 88, 'Triage Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (89, 'Communication and Media Distri', 89, 'Information Display Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (90, 'Laboratory and Testing Room', 90, 'Rescue Team Communication Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (91, 'Triage Room', 91, 'Administration Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (92, 'Communication Room with Rescue', 92, 'Medical Shock Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (93, 'Communication and Media Distri', 93, 'Access Control Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (94, 'Crisis Management and Rehabili', 94, 'Communication Room''');
insert into ROOM (r_id, r_location, numplace, r_type)
values (95, 'Investigation and Medical Shoc', 95, 'Triage Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (96, 'Administration and Medical Tea', 96, 'Rescue Team Communication Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (97, 'Media and Information Display ', 97, 'Administration Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (98, 'Media and Information Display ', 98, 'Rescue Team Communication Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (99, 'Administration and Medical Tea', 99, 'Laboratory Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (100, 'Triage Room', 100, 'Emergency Treatment Room');
commit;
prompt 100 records committed...
insert into ROOM (r_id, r_location, numplace, r_type)
values (101, 'Communication and Media Distri', 101, 'Information Display Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (102, 'Emergency Treatment Room', 102, 'Laboratory Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (103, 'Administration and Medical Tea', 103, 'Information Display Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (104, 'Communication and Media Distri', 104, 'Crisis Management Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (105, 'Investigation and Medical Shoc', 105, 'Emergency Treatment Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (106, 'Laboratory and Testing Room', 106, 'Crisis Management Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (107, 'Triage Room', 107, 'Crisis Management Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (108, 'Communication Room with Rescue', 108, 'Triage Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (109, 'Crisis Management and Rehabili', 109, 'Emergency Treatment Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (110, 'Crisis Management and Rehabili', 110, 'Medical Shock Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (111, 'Laboratory and Testing Room', 111, 'Rescue Team Communication Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (112, 'Crisis Management and Rehabili', 112, 'Triage Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (113, 'Investigation and Medical Shoc', 113, 'Information Display Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (114, 'Crisis Management and Rehabili', 114, 'Communication Room''');
insert into ROOM (r_id, r_location, numplace, r_type)
values (115, 'Administration and Medical Tea', 115, 'Crisis Management Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (116, 'Investigation and Medical Shoc', 116, 'Crisis Management Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (117, 'Media and Information Display ', 117, 'Crisis Management Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (118, 'Emergency Treatment Room', 118, 'Administration Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (119, 'Communication and Media Distri', 119, 'Triage Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (120, 'Access Control and Entrance Ro', 120, 'Access Control Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (121, 'Media and Information Display ', 121, 'Crisis Management Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (122, 'Communication and Media Distri', 122, 'Crisis Management Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (123, 'Administration and Medical Tea', 123, 'Rescue Team Communication Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (124, 'Emergency Treatment Room', 124, 'Communication Room''');
insert into ROOM (r_id, r_location, numplace, r_type)
values (125, 'Access Control and Entrance Ro', 125, 'Triage Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (126, 'Triage Room', 126, 'Administration Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (127, 'Communication Room with Rescue', 127, 'Crisis Management Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (128, 'Communication and Media Distri', 128, 'Rescue Team Communication Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (129, 'Crisis Management and Rehabili', 129, 'Communication Room''');
insert into ROOM (r_id, r_location, numplace, r_type)
values (130, 'Media and Information Display ', 130, 'Rescue Team Communication Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (131, 'Crisis Management and Rehabili', 131, 'Rescue Team Communication Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (132, 'Emergency Treatment Room', 132, 'Laboratory Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (133, 'Triage Room', 133, 'Laboratory Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (134, 'Communication Room with Rescue', 134, 'Rescue Team Communication Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (135, 'Investigation and Medical Shoc', 135, 'Emergency Treatment Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (136, 'Investigation and Medical Shoc', 136, 'Access Control Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (137, 'Triage Room', 137, 'Administration Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (138, 'Communication and Media Distri', 138, 'Rescue Team Communication Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (139, 'Laboratory and Testing Room', 139, 'Crisis Management Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (140, 'Triage Room', 140, 'Triage Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (141, 'Crisis Management and Rehabili', 141, 'Crisis Management Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (142, 'Media and Information Display ', 142, 'Access Control Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (143, 'Administration and Medical Tea', 143, 'Rescue Team Communication Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (144, 'Administration and Medical Tea', 144, 'Rescue Team Communication Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (145, 'Crisis Management and Rehabili', 145, 'Access Control Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (146, 'Laboratory and Testing Room', 146, 'Administration Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (147, 'Communication Room with Rescue', 147, 'Communication Room''');
insert into ROOM (r_id, r_location, numplace, r_type)
values (148, 'Emergency Treatment Room', 148, 'Administration Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (149, 'Crisis Management and Rehabili', 149, 'Communication Room''');
insert into ROOM (r_id, r_location, numplace, r_type)
values (150, 'Administration and Medical Tea', 150, 'Rescue Team Communication Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (151, 'Crisis Management and Rehabili', 151, 'Communication Room''');
insert into ROOM (r_id, r_location, numplace, r_type)
values (152, 'Laboratory and Testing Room', 152, 'Communication Room''');
insert into ROOM (r_id, r_location, numplace, r_type)
values (153, 'Crisis Management and Rehabili', 153, 'Administration Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (154, 'Administration and Medical Tea', 154, 'Administration Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (155, 'Access Control and Entrance Ro', 155, 'Triage Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (156, 'Laboratory and Testing Room', 156, 'Information Display Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (157, 'Crisis Management and Rehabili', 157, 'Access Control Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (158, 'Communication and Media Distri', 158, 'Medical Shock Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (159, 'Triage Room', 159, 'Administration Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (160, 'Crisis Management and Rehabili', 160, 'Emergency Treatment Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (161, 'Investigation and Medical Shoc', 161, 'Laboratory Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (162, 'Communication and Media Distri', 162, 'Access Control Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (163, 'Emergency Treatment Room', 163, 'Communication Room''');
insert into ROOM (r_id, r_location, numplace, r_type)
values (164, 'Crisis Management and Rehabili', 164, 'Triage Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (165, 'Laboratory and Testing Room', 165, 'Communication Room''');
insert into ROOM (r_id, r_location, numplace, r_type)
values (166, 'Access Control and Entrance Ro', 166, 'Triage Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (167, 'Communication and Media Distri', 167, 'Laboratory Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (168, 'Laboratory and Testing Room', 168, 'Laboratory Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (169, 'Media and Information Display ', 169, 'Administration Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (170, 'Crisis Management and Rehabili', 170, 'Crisis Management Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (171, 'Laboratory and Testing Room', 171, 'Access Control Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (172, 'Access Control and Entrance Ro', 172, 'Information Display Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (173, 'Administration and Medical Tea', 173, 'Laboratory Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (174, 'Access Control and Entrance Ro', 174, 'Medical Shock Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (175, 'Investigation and Medical Shoc', 175, 'Triage Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (176, 'Media and Information Display ', 176, 'Medical Shock Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (177, 'Crisis Management and Rehabili', 177, 'Information Display Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (178, 'Access Control and Entrance Ro', 178, 'Triage Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (179, 'Laboratory and Testing Room', 179, 'Administration Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (180, 'Triage Room', 180, 'Communication Room''');
insert into ROOM (r_id, r_location, numplace, r_type)
values (181, 'Triage Room', 181, 'Medical Shock Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (182, 'Investigation and Medical Shoc', 182, 'Crisis Management Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (183, 'Communication Room with Rescue', 183, 'Medical Shock Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (184, 'Crisis Management and Rehabili', 184, 'Medical Shock Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (185, 'Triage Room', 185, 'Communication Room''');
insert into ROOM (r_id, r_location, numplace, r_type)
values (186, 'Access Control and Entrance Ro', 186, 'Crisis Management Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (187, 'Access Control and Entrance Ro', 187, 'Information Display Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (188, 'Administration and Medical Tea', 188, 'Laboratory Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (189, 'Access Control and Entrance Ro', 189, 'Emergency Treatment Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (190, 'Access Control and Entrance Ro', 190, 'Laboratory Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (191, 'Communication and Media Distri', 191, 'Emergency Treatment Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (192, 'Administration and Medical Tea', 192, 'Information Display Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (193, 'Investigation and Medical Shoc', 193, 'Access Control Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (194, 'Emergency Treatment Room', 194, 'Emergency Treatment Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (195, 'Triage Room', 195, 'Triage Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (196, 'Triage Room', 196, 'Emergency Treatment Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (197, 'Triage Room', 197, 'Emergency Treatment Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (198, 'Investigation and Medical Shoc', 198, 'Administration Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (199, 'Media and Information Display ', 199, 'Laboratory Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (200, 'Media and Information Display ', 200, 'Access Control Room');
commit;
prompt 200 records committed...
insert into ROOM (r_id, r_location, numplace, r_type)
values (201, 'Media and Information Display ', 201, 'Access Control Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (202, 'Investigation and Medical Shoc', 202, 'Laboratory Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (203, 'Triage Room', 203, 'Administration Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (204, 'Administration and Medical Tea', 204, 'Triage Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (205, 'Investigation and Medical Shoc', 205, 'Access Control Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (206, 'Investigation and Medical Shoc', 206, 'Access Control Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (207, 'Communication and Media Distri', 207, 'Medical Shock Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (208, 'Triage Room', 208, 'Administration Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (209, 'Access Control and Entrance Ro', 209, 'Information Display Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (210, 'Communication Room with Rescue', 210, 'Crisis Management Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (211, 'Administration and Medical Tea', 211, 'Information Display Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (212, 'Communication Room with Rescue', 212, 'Triage Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (213, 'Communication and Media Distri', 213, 'Information Display Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (214, 'Emergency Treatment Room', 214, 'Crisis Management Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (215, 'Emergency Treatment Room', 215, 'Triage Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (216, 'Emergency Treatment Room', 216, 'Access Control Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (217, 'Administration and Medical Tea', 217, 'Access Control Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (218, 'Crisis Management and Rehabili', 218, 'Information Display Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (219, 'Administration and Medical Tea', 219, 'Crisis Management Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (220, 'Crisis Management and Rehabili', 220, 'Crisis Management Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (221, 'Administration and Medical Tea', 221, 'Administration Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (222, 'Access Control and Entrance Ro', 222, 'Administration Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (223, 'Emergency Treatment Room', 223, 'Communication Room''');
insert into ROOM (r_id, r_location, numplace, r_type)
values (224, 'Communication Room with Rescue', 224, 'Rescue Team Communication Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (225, 'Communication and Media Distri', 225, 'Information Display Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (226, 'Investigation and Medical Shoc', 226, 'Triage Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (227, 'Investigation and Medical Shoc', 227, 'Communication Room''');
insert into ROOM (r_id, r_location, numplace, r_type)
values (228, 'Emergency Treatment Room', 228, 'Administration Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (229, 'Crisis Management and Rehabili', 229, 'Communication Room''');
insert into ROOM (r_id, r_location, numplace, r_type)
values (230, 'Access Control and Entrance Ro', 230, 'Communication Room''');
insert into ROOM (r_id, r_location, numplace, r_type)
values (231, 'Investigation and Medical Shoc', 231, 'Information Display Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (232, 'Communication Room with Rescue', 232, 'Administration Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (233, 'Administration and Medical Tea', 233, 'Information Display Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (234, 'Investigation and Medical Shoc', 234, 'Rescue Team Communication Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (235, 'Communication and Media Distri', 235, 'Medical Shock Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (236, 'Communication Room with Rescue', 236, 'Administration Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (237, 'Laboratory and Testing Room', 237, 'Communication Room''');
insert into ROOM (r_id, r_location, numplace, r_type)
values (238, 'Triage Room', 238, 'Emergency Treatment Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (239, 'Emergency Treatment Room', 239, 'Medical Shock Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (240, 'Laboratory and Testing Room', 240, 'Rescue Team Communication Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (241, 'Communication Room with Rescue', 241, 'Laboratory Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (242, 'Media and Information Display ', 242, 'Communication Room''');
insert into ROOM (r_id, r_location, numplace, r_type)
values (243, 'Communication Room with Rescue', 243, 'Triage Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (244, 'Communication Room with Rescue', 244, 'Communication Room''');
insert into ROOM (r_id, r_location, numplace, r_type)
values (245, 'Communication Room with Rescue', 245, 'Administration Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (246, 'Access Control and Entrance Ro', 246, 'Crisis Management Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (247, 'Access Control and Entrance Ro', 247, 'Emergency Treatment Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (248, 'Administration and Medical Tea', 248, 'Triage Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (249, 'Media and Information Display ', 249, 'Rescue Team Communication Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (250, 'Laboratory and Testing Room', 250, 'Administration Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (251, 'Communication Room with Rescue', 251, 'Administration Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (252, 'Crisis Management and Rehabili', 252, 'Triage Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (253, 'Investigation and Medical Shoc', 253, 'Administration Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (254, 'Crisis Management and Rehabili', 254, 'Administration Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (255, 'Laboratory and Testing Room', 255, 'Triage Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (256, 'Access Control and Entrance Ro', 256, 'Triage Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (257, 'Communication Room with Rescue', 257, 'Emergency Treatment Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (258, 'Access Control and Entrance Ro', 258, 'Laboratory Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (259, 'Media and Information Display ', 259, 'Communication Room''');
insert into ROOM (r_id, r_location, numplace, r_type)
values (260, 'Crisis Management and Rehabili', 260, 'Communication Room''');
insert into ROOM (r_id, r_location, numplace, r_type)
values (261, 'Access Control and Entrance Ro', 261, 'Communication Room''');
insert into ROOM (r_id, r_location, numplace, r_type)
values (262, 'Investigation and Medical Shoc', 262, 'Access Control Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (263, 'Communication Room with Rescue', 263, 'Administration Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (264, 'Laboratory and Testing Room', 264, 'Crisis Management Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (265, 'Investigation and Medical Shoc', 265, 'Administration Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (266, 'Laboratory and Testing Room', 266, 'Communication Room''');
insert into ROOM (r_id, r_location, numplace, r_type)
values (267, 'Emergency Treatment Room', 267, 'Laboratory Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (268, 'Laboratory and Testing Room', 268, 'Administration Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (269, 'Communication and Media Distri', 269, 'Administration Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (270, 'Emergency Treatment Room', 270, 'Information Display Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (271, 'Crisis Management and Rehabili', 271, 'Crisis Management Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (272, 'Access Control and Entrance Ro', 272, 'Administration Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (273, 'Access Control and Entrance Ro', 273, 'Access Control Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (274, 'Investigation and Medical Shoc', 274, 'Rescue Team Communication Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (275, 'Communication and Media Distri', 275, 'Medical Shock Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (276, 'Laboratory and Testing Room', 276, 'Access Control Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (277, 'Laboratory and Testing Room', 277, 'Access Control Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (278, 'Communication and Media Distri', 278, 'Information Display Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (279, 'Communication Room with Rescue', 279, 'Medical Shock Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (280, 'Communication Room with Rescue', 280, 'Laboratory Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (281, 'Administration and Medical Tea', 281, 'Crisis Management Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (282, 'Investigation and Medical Shoc', 282, 'Rescue Team Communication Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (283, 'Investigation and Medical Shoc', 283, 'Administration Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (284, 'Triage Room', 284, 'Administration Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (285, 'Triage Room', 285, 'Triage Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (286, 'Communication and Media Distri', 286, 'Triage Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (287, 'Media and Information Display ', 287, 'Administration Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (288, 'Access Control and Entrance Ro', 288, 'Communication Room''');
insert into ROOM (r_id, r_location, numplace, r_type)
values (289, 'Investigation and Medical Shoc', 289, 'Crisis Management Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (290, 'Administration and Medical Tea', 290, 'Access Control Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (291, 'Triage Room', 291, 'Communication Room''');
insert into ROOM (r_id, r_location, numplace, r_type)
values (292, 'Access Control and Entrance Ro', 292, 'Rescue Team Communication Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (293, 'Access Control and Entrance Ro', 293, 'Communication Room''');
insert into ROOM (r_id, r_location, numplace, r_type)
values (294, 'Administration and Medical Tea', 294, 'Medical Shock Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (295, 'Communication Room with Rescue', 295, 'Information Display Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (296, 'Communication and Media Distri', 296, 'Laboratory Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (297, 'Communication Room with Rescue', 297, 'Information Display Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (298, 'Laboratory and Testing Room', 298, 'Medical Shock Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (299, 'Media and Information Display ', 299, 'Emergency Treatment Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (300, 'Investigation and Medical Shoc', 300, 'Access Control Room');
commit;
prompt 300 records committed...
insert into ROOM (r_id, r_location, numplace, r_type)
values (301, 'Communication Room with Rescue', 301, 'Emergency Treatment Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (302, 'Laboratory and Testing Room', 302, 'Rescue Team Communication Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (303, 'Media and Information Display ', 303, 'Rescue Team Communication Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (304, 'Communication and Media Distri', 304, 'Administration Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (305, 'Communication Room with Rescue', 305, 'Emergency Treatment Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (306, 'Media and Information Display ', 306, 'Laboratory Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (307, 'Media and Information Display ', 307, 'Communication Room''');
insert into ROOM (r_id, r_location, numplace, r_type)
values (308, 'Crisis Management and Rehabili', 308, 'Access Control Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (309, 'Access Control and Entrance Ro', 309, 'Access Control Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (310, 'Emergency Treatment Room', 310, 'Crisis Management Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (311, 'Emergency Treatment Room', 311, 'Crisis Management Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (312, 'Emergency Treatment Room', 312, 'Medical Shock Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (313, 'Media and Information Display ', 313, 'Emergency Treatment Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (314, 'Communication and Media Distri', 314, 'Information Display Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (315, 'Communication and Media Distri', 315, 'Communication Room''');
insert into ROOM (r_id, r_location, numplace, r_type)
values (316, 'Crisis Management and Rehabili', 316, 'Triage Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (317, 'Crisis Management and Rehabili', 317, 'Laboratory Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (318, 'Emergency Treatment Room', 318, 'Information Display Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (319, 'Administration and Medical Tea', 319, 'Access Control Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (320, 'Triage Room', 320, 'Information Display Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (321, 'Media and Information Display ', 321, 'Triage Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (322, 'Crisis Management and Rehabili', 322, 'Information Display Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (323, 'Investigation and Medical Shoc', 323, 'Laboratory Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (324, 'Access Control and Entrance Ro', 324, 'Medical Shock Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (325, 'Media and Information Display ', 325, 'Access Control Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (326, 'Communication Room with Rescue', 326, 'Triage Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (327, 'Communication and Media Distri', 327, 'Administration Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (328, 'Communication Room with Rescue', 328, 'Communication Room''');
insert into ROOM (r_id, r_location, numplace, r_type)
values (329, 'Communication and Media Distri', 329, 'Information Display Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (330, 'Emergency Treatment Room', 330, 'Access Control Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (331, 'Media and Information Display ', 331, 'Information Display Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (332, 'Media and Information Display ', 332, 'Laboratory Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (333, 'Communication Room with Rescue', 333, 'Laboratory Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (334, 'Administration and Medical Tea', 334, 'Information Display Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (335, 'Communication Room with Rescue', 335, 'Rescue Team Communication Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (336, 'Investigation and Medical Shoc', 336, 'Medical Shock Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (337, 'Communication Room with Rescue', 337, 'Communication Room''');
insert into ROOM (r_id, r_location, numplace, r_type)
values (338, 'Administration and Medical Tea', 338, 'Medical Shock Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (339, 'Communication Room with Rescue', 339, 'Medical Shock Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (340, 'Media and Information Display ', 340, 'Communication Room''');
insert into ROOM (r_id, r_location, numplace, r_type)
values (341, 'Communication Room with Rescue', 341, 'Triage Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (342, 'Communication Room with Rescue', 342, 'Administration Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (343, 'Media and Information Display ', 343, 'Information Display Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (344, 'Administration and Medical Tea', 344, 'Medical Shock Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (345, 'Laboratory and Testing Room', 345, 'Information Display Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (346, 'Administration and Medical Tea', 346, 'Medical Shock Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (347, 'Triage Room', 347, 'Access Control Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (348, 'Administration and Medical Tea', 348, 'Laboratory Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (349, 'Access Control and Entrance Ro', 349, 'Emergency Treatment Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (350, 'Communication Room with Rescue', 350, 'Laboratory Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (351, 'Administration and Medical Tea', 351, 'Administration Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (352, 'Emergency Treatment Room', 352, 'Access Control Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (353, 'Administration and Medical Tea', 353, 'Rescue Team Communication Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (354, 'Access Control and Entrance Ro', 354, 'Laboratory Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (355, 'Communication and Media Distri', 355, 'Communication Room''');
insert into ROOM (r_id, r_location, numplace, r_type)
values (356, 'Communication Room with Rescue', 356, 'Information Display Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (357, 'Communication Room with Rescue', 357, 'Access Control Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (358, 'Investigation and Medical Shoc', 358, 'Communication Room''');
insert into ROOM (r_id, r_location, numplace, r_type)
values (359, 'Laboratory and Testing Room', 359, 'Access Control Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (360, 'Access Control and Entrance Ro', 360, 'Administration Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (361, 'Laboratory and Testing Room', 361, 'Rescue Team Communication Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (362, 'Crisis Management and Rehabili', 362, 'Information Display Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (363, 'Crisis Management and Rehabili', 363, 'Triage Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (364, 'Crisis Management and Rehabili', 364, 'Access Control Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (365, 'Communication and Media Distri', 365, 'Administration Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (366, 'Crisis Management and Rehabili', 366, 'Administration Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (367, 'Access Control and Entrance Ro', 367, 'Crisis Management Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (368, 'Communication and Media Distri', 368, 'Laboratory Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (369, 'Emergency Treatment Room', 369, 'Rescue Team Communication Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (370, 'Communication and Media Distri', 370, 'Emergency Treatment Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (371, 'Access Control and Entrance Ro', 371, 'Medical Shock Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (372, 'Triage Room', 372, 'Administration Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (373, 'Emergency Treatment Room', 373, 'Rescue Team Communication Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (374, 'Administration and Medical Tea', 374, 'Emergency Treatment Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (375, 'Triage Room', 375, 'Rescue Team Communication Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (376, 'Triage Room', 376, 'Triage Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (377, 'Crisis Management and Rehabili', 377, 'Communication Room''');
insert into ROOM (r_id, r_location, numplace, r_type)
values (378, 'Crisis Management and Rehabili', 378, 'Rescue Team Communication Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (379, 'Communication and Media Distri', 379, 'Information Display Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (380, 'Media and Information Display ', 380, 'Laboratory Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (381, 'Media and Information Display ', 381, 'Access Control Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (382, 'Administration and Medical Tea', 382, 'Laboratory Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (383, 'Triage Room', 383, 'Triage Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (384, 'Laboratory and Testing Room', 384, 'Information Display Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (385, 'Emergency Treatment Room', 385, 'Emergency Treatment Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (386, 'Administration and Medical Tea', 386, 'Emergency Treatment Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (387, 'Administration and Medical Tea', 387, 'Triage Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (388, 'Triage Room', 388, 'Medical Shock Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (389, 'Media and Information Display ', 389, 'Triage Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (390, 'Laboratory and Testing Room', 390, 'Emergency Treatment Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (391, 'Administration and Medical Tea', 391, 'Emergency Treatment Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (392, 'Media and Information Display ', 392, 'Laboratory Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (393, 'Administration and Medical Tea', 393, 'Laboratory Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (394, 'Triage Room', 394, 'Crisis Management Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (395, 'Communication and Media Distri', 395, 'Emergency Treatment Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (396, 'Access Control and Entrance Ro', 396, 'Communication Room''');
insert into ROOM (r_id, r_location, numplace, r_type)
values (397, 'Administration and Medical Tea', 397, 'Emergency Treatment Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (398, 'Crisis Management and Rehabili', 398, 'Triage Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (399, 'Laboratory and Testing Room', 399, 'Medical Shock Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (400, 'Communication Room with Rescue', 400, 'Medical Shock Room');
commit;
prompt 400 records committed...
insert into ROOM (r_id, r_location, numplace, r_type)
values (401, 'Administration and Medical Tea', 401, 'Medical Shock Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (402, 'Investigation and Medical Shoc', 402, 'Rescue Team Communication Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (403, 'Triage Room', 403, 'Crisis Management Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (404, 'Communication Room with Rescue', 404, 'Communication Room''');
insert into ROOM (r_id, r_location, numplace, r_type)
values (405, 'Emergency Treatment Room', 405, 'Crisis Management Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (406, 'Access Control and Entrance Ro', 406, 'Administration Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (407, 'Media and Information Display ', 407, 'Emergency Treatment Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (408, 'Investigation and Medical Shoc', 408, 'Laboratory Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (409, 'Investigation and Medical Shoc', 409, 'Administration Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (410, 'Communication Room with Rescue', 410, 'Administration Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (411, 'Investigation and Medical Shoc', 411, 'Information Display Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (412, 'Emergency Treatment Room', 412, 'Communication Room''');
insert into ROOM (r_id, r_location, numplace, r_type)
values (413, 'Media and Information Display ', 413, 'Crisis Management Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (414, 'Communication and Media Distri', 414, 'Access Control Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (415, 'Emergency Treatment Room', 415, 'Laboratory Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (416, 'Communication Room with Rescue', 416, 'Emergency Treatment Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (417, 'Communication and Media Distri', 417, 'Communication Room''');
insert into ROOM (r_id, r_location, numplace, r_type)
values (418, 'Crisis Management and Rehabili', 418, 'Medical Shock Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (419, 'Triage Room', 419, 'Communication Room''');
insert into ROOM (r_id, r_location, numplace, r_type)
values (420, 'Crisis Management and Rehabili', 420, 'Medical Shock Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (421, 'Communication and Media Distri', 421, 'Laboratory Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (422, 'Crisis Management and Rehabili', 422, 'Medical Shock Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (423, 'Investigation and Medical Shoc', 423, 'Medical Shock Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (424, 'Crisis Management and Rehabili', 424, 'Emergency Treatment Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (425, 'Crisis Management and Rehabili', 425, 'Administration Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (426, 'Administration and Medical Tea', 426, 'Laboratory Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (427, 'Investigation and Medical Shoc', 427, 'Emergency Treatment Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (428, 'Triage Room', 428, 'Laboratory Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (429, 'Communication and Media Distri', 429, 'Medical Shock Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (430, 'Communication Room with Rescue', 430, 'Rescue Team Communication Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (431, 'Crisis Management and Rehabili', 431, 'Rescue Team Communication Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (432, 'Administration and Medical Tea', 432, 'Information Display Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (433, 'Triage Room', 433, 'Medical Shock Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (434, 'Communication and Media Distri', 434, 'Access Control Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (435, 'Administration and Medical Tea', 435, 'Triage Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (436, 'Access Control and Entrance Ro', 436, 'Crisis Management Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (437, 'Media and Information Display ', 437, 'Triage Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (438, 'Communication and Media Distri', 438, 'Medical Shock Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (439, 'Investigation and Medical Shoc', 439, 'Triage Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (440, 'Triage Room', 440, 'Information Display Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (441, 'Communication Room with Rescue', 441, 'Communication Room''');
insert into ROOM (r_id, r_location, numplace, r_type)
values (442, 'Access Control and Entrance Ro', 442, 'Crisis Management Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (443, 'Laboratory and Testing Room', 443, 'Rescue Team Communication Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (444, 'Laboratory and Testing Room', 444, 'Rescue Team Communication Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (445, 'Access Control and Entrance Ro', 445, 'Laboratory Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (446, 'Laboratory and Testing Room', 446, 'Triage Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (447, 'Emergency Treatment Room', 447, 'Information Display Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (448, 'Triage Room', 448, 'Medical Shock Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (449, 'Communication Room with Rescue', 449, 'Emergency Treatment Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (450, 'Communication and Media Distri', 450, 'Emergency Treatment Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (451, 'Crisis Management and Rehabili', 451, 'Triage Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (452, 'Communication Room with Rescue', 452, 'Administration Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (453, 'Administration and Medical Tea', 453, 'Crisis Management Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (454, 'Laboratory and Testing Room', 454, 'Information Display Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (455, 'Laboratory and Testing Room', 455, 'Crisis Management Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (456, 'Crisis Management and Rehabili', 456, 'Communication Room''');
insert into ROOM (r_id, r_location, numplace, r_type)
values (457, 'Communication and Media Distri', 457, 'Information Display Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (458, 'Communication and Media Distri', 458, 'Information Display Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (459, 'Investigation and Medical Shoc', 459, 'Information Display Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (460, 'Communication Room with Rescue', 460, 'Administration Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (461, 'Access Control and Entrance Ro', 461, 'Laboratory Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (462, 'Access Control and Entrance Ro', 462, 'Crisis Management Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (463, 'Access Control and Entrance Ro', 463, 'Laboratory Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (464, 'Media and Information Display ', 464, 'Rescue Team Communication Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (465, 'Communication and Media Distri', 465, 'Administration Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (466, 'Crisis Management and Rehabili', 466, 'Administration Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (467, 'Investigation and Medical Shoc', 467, 'Communication Room''');
insert into ROOM (r_id, r_location, numplace, r_type)
values (468, 'Administration and Medical Tea', 468, 'Triage Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (469, 'Administration and Medical Tea', 469, 'Communication Room''');
insert into ROOM (r_id, r_location, numplace, r_type)
values (470, 'Investigation and Medical Shoc', 470, 'Rescue Team Communication Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (471, 'Communication and Media Distri', 471, 'Access Control Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (472, 'Investigation and Medical Shoc', 472, 'Rescue Team Communication Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (473, 'Emergency Treatment Room', 473, 'Laboratory Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (474, 'Triage Room', 474, 'Medical Shock Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (475, 'Investigation and Medical Shoc', 475, 'Emergency Treatment Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (476, 'Crisis Management and Rehabili', 476, 'Access Control Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (477, 'Communication Room with Rescue', 477, 'Information Display Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (478, 'Administration and Medical Tea', 478, 'Medical Shock Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (479, 'Laboratory and Testing Room', 479, 'Emergency Treatment Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (480, 'Crisis Management and Rehabili', 480, 'Administration Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (481, 'Media and Information Display ', 481, 'Access Control Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (482, 'Administration and Medical Tea', 482, 'Medical Shock Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (483, 'Communication and Media Distri', 483, 'Emergency Treatment Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (484, 'Communication Room with Rescue', 484, 'Emergency Treatment Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (485, 'Media and Information Display ', 485, 'Emergency Treatment Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (486, 'Access Control and Entrance Ro', 486, 'Laboratory Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (487, 'Media and Information Display ', 487, 'Communication Room''');
insert into ROOM (r_id, r_location, numplace, r_type)
values (488, 'Laboratory and Testing Room', 488, 'Crisis Management Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (489, 'Media and Information Display ', 489, 'Access Control Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (490, 'Access Control and Entrance Ro', 490, 'Crisis Management Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (491, 'Emergency Treatment Room', 491, 'Crisis Management Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (492, 'Investigation and Medical Shoc', 492, 'Communication Room''');
insert into ROOM (r_id, r_location, numplace, r_type)
values (493, 'Media and Information Display ', 493, 'Administration Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (494, 'Access Control and Entrance Ro', 494, 'Access Control Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (495, 'Media and Information Display ', 495, 'Emergency Treatment Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (496, 'Access Control and Entrance Ro', 496, 'Laboratory Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (497, 'Crisis Management and Rehabili', 497, 'Crisis Management Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (498, 'Communication Room with Rescue', 498, 'Rescue Team Communication Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (499, 'Triage Room', 499, 'Medical Shock Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (500, 'Emergency Treatment Room', 500, 'Medical Shock Room');
commit;
prompt 500 records committed...
insert into ROOM (r_id, r_location, numplace, r_type)
values (501, 'Communication and Media Distri', 501, 'Information Display Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (502, 'Crisis Management and Rehabili', 502, 'Triage Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (503, 'Administration and Medical Tea', 503, 'Access Control Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (504, 'Crisis Management and Rehabili', 504, 'Administration Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (505, 'Administration and Medical Tea', 505, 'Laboratory Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (506, 'Media and Information Display ', 506, 'Triage Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (507, 'Investigation and Medical Shoc', 507, 'Communication Room''');
insert into ROOM (r_id, r_location, numplace, r_type)
values (508, 'Crisis Management and Rehabili', 508, 'Administration Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (509, 'Triage Room', 509, 'Rescue Team Communication Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (510, 'Laboratory and Testing Room', 510, 'Triage Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (511, 'Communication and Media Distri', 511, 'Administration Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (512, 'Access Control and Entrance Ro', 512, 'Emergency Treatment Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (513, 'Media and Information Display ', 513, 'Rescue Team Communication Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (514, 'Emergency Treatment Room', 514, 'Emergency Treatment Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (515, 'Triage Room', 515, 'Access Control Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (516, 'Triage Room', 516, 'Medical Shock Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (517, 'Investigation and Medical Shoc', 517, 'Communication Room''');
insert into ROOM (r_id, r_location, numplace, r_type)
values (518, 'Access Control and Entrance Ro', 518, 'Communication Room''');
insert into ROOM (r_id, r_location, numplace, r_type)
values (519, 'Emergency Treatment Room', 519, 'Communication Room''');
insert into ROOM (r_id, r_location, numplace, r_type)
values (520, 'Investigation and Medical Shoc', 520, 'Laboratory Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (521, 'Media and Information Display ', 521, 'Communication Room''');
insert into ROOM (r_id, r_location, numplace, r_type)
values (522, 'Laboratory and Testing Room', 522, 'Rescue Team Communication Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (523, 'Administration and Medical Tea', 523, 'Communication Room''');
insert into ROOM (r_id, r_location, numplace, r_type)
values (524, 'Media and Information Display ', 524, 'Emergency Treatment Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (525, 'Triage Room', 525, 'Triage Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (526, 'Triage Room', 526, 'Triage Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (527, 'Communication Room with Rescue', 527, 'Access Control Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (528, 'Crisis Management and Rehabili', 528, 'Laboratory Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (529, 'Crisis Management and Rehabili', 529, 'Rescue Team Communication Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (530, 'Administration and Medical Tea', 530, 'Laboratory Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (531, 'Media and Information Display ', 531, 'Crisis Management Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (532, 'Administration and Medical Tea', 532, 'Laboratory Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (533, 'Communication and Media Distri', 533, 'Crisis Management Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (534, 'Emergency Treatment Room', 534, 'Rescue Team Communication Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (535, 'Crisis Management and Rehabili', 535, 'Access Control Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (536, 'Investigation and Medical Shoc', 536, 'Crisis Management Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (537, 'Media and Information Display ', 537, 'Medical Shock Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (538, 'Crisis Management and Rehabili', 538, 'Communication Room''');
insert into ROOM (r_id, r_location, numplace, r_type)
values (539, 'Emergency Treatment Room', 539, 'Communication Room''');
commit;
prompt 539 records loaded
prompt Loading STUDENTSGROUP...
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (1, 92, 3, 13, 1, 1, 1);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (2, 173, 2, 15, 2, 2, 2);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (3, 140, 12, 16, 3, 3, 3);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (4, 91, 4, 28, 4, 4, 4);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (5, 188, 9, 28, 5, 5, 5);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (6, 196, 14, 5, 6, 6, 6);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (7, 167, 14, 21, 7, 7, 7);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (8, 125, 13, 9, 8, 8, 8);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (9, 178, 10, 31, 9, 9, 9);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (10, 174, 5, 1, 10, 10, 10);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (11, 63, 2, 19, 11, 11, 11);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (12, 127, 8, 1, 12, 12, 12);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (13, 86, 17, 11, 13, 13, 13);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (14, 71, 12, 11, 14, 14, 14);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (15, 165, 14, 30, 15, 15, 15);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (16, 199, 11, 19, 16, 16, 16);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (17, 115, 7, 6, 17, 17, 17);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (18, 139, 5, 21, 18, 18, 18);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (19, 184, 8, 10, 19, 19, 19);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (20, 71, 5, 9, 20, 20, 20);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (21, 143, 9, 8, 21, 21, 21);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (22, 69, 18, 30, 22, 22, 22);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (23, 94, 6, 14, 23, 23, 23);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (24, 62, 3, 8, 24, 24, 24);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (25, 90, 19, 30, 25, 25, 25);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (26, 85, 1, 9, 26, 26, 26);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (27, 95, 7, 27, 27, 27, 27);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (28, 196, 6, 18, 28, 28, 28);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (29, 190, 19, 4, 29, 29, 29);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (30, 56, 11, 3, 30, 30, 30);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (31, 135, 6, 9, 31, 31, 31);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (32, 170, 4, 1, 32, 32, 32);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (33, 116, 14, 19, 33, 33, 33);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (34, 115, 2, 9, 34, 34, 34);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (35, 149, 9, 19, 35, 35, 35);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (36, 93, 10, 12, 36, 36, 36);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (37, 165, 12, 8, 37, 37, 37);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (38, 123, 16, 27, 38, 38, 38);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (39, 70, 17, 17, 39, 39, 39);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (40, 94, 12, 20, 40, 40, 40);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (41, 168, 19, 6, 41, 41, 41);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (42, 188, 1, 2, 42, 42, 42);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (43, 87, 13, 1, 43, 43, 43);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (44, 115, 11, 22, 44, 44, 44);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (45, 189, 17, 11, 45, 45, 45);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (46, 117, 15, 27, 46, 46, 46);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (47, 139, 19, 21, 47, 47, 47);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (48, 72, 13, 2, 48, 48, 48);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (49, 110, 5, 23, 49, 49, 49);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (50, 78, 3, 3, 50, 50, 50);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (51, 88, 14, 17, 51, 51, 51);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (52, 81, 15, 8, 52, 52, 52);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (53, 113, 2, 1, 53, 53, 53);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (54, 119, 20, 20, 54, 54, 54);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (55, 96, 17, 28, 55, 55, 55);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (56, 112, 4, 7, 56, 56, 56);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (57, 155, 20, 27, 57, 57, 57);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (58, 148, 20, 29, 58, 58, 58);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (59, 163, 14, 19, 59, 59, 59);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (60, 63, 20, 25, 60, 60, 60);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (61, 58, 19, 22, 61, 61, 61);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (62, 65, 2, 24, 62, 62, 62);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (63, 77, 5, 27, 63, 63, 63);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (64, 122, 4, 28, 64, 64, 64);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (65, 52, 3, 30, 65, 65, 65);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (66, 198, 6, 5, 66, 66, 66);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (67, 169, 19, 22, 67, 67, 67);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (68, 92, 4, 10, 68, 68, 68);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (69, 140, 16, 6, 69, 69, 69);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (70, 168, 13, 27, 70, 70, 70);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (71, 131, 7, 31, 71, 71, 71);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (72, 168, 3, 26, 72, 72, 72);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (73, 173, 7, 1, 73, 73, 73);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (74, 175, 9, 25, 74, 74, 74);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (75, 130, 18, 18, 75, 75, 75);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (76, 130, 9, 25, 76, 76, 76);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (77, 122, 8, 17, 77, 77, 77);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (78, 181, 17, 9, 78, 78, 78);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (79, 51, 11, 12, 79, 79, 79);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (80, 95, 10, 15, 80, 80, 80);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (81, 111, 12, 4, 81, 81, 81);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (82, 174, 15, 31, 82, 82, 82);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (83, 114, 2, 6, 83, 83, 83);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (84, 176, 1, 31, 84, 84, 84);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (85, 60, 7, 2, 85, 85, 85);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (86, 61, 9, 28, 86, 86, 86);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (87, 131, 7, 12, 87, 87, 87);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (88, 177, 7, 21, 88, 88, 88);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (89, 92, 14, 2, 89, 89, 89);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (90, 192, 17, 1, 90, 90, 90);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (91, 127, 10, 8, 91, 91, 91);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (92, 180, 6, 29, 92, 92, 92);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (93, 128, 3, 4, 93, 93, 93);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (94, 87, 11, 8, 94, 94, 94);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (95, 113, 10, 13, 95, 95, 95);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (96, 84, 17, 30, 96, 96, 96);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (97, 191, 18, 3, 97, 97, 97);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (98, 68, 19, 18, 98, 98, 98);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (99, 155, 1, 7, 99, 99, 99);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (100, 87, 9, 6, 100, 100, 100);
commit;
prompt 100 records committed...
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (101, 73, 5, 6, 101, 101, 101);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (102, 106, 20, 31, 102, 102, 102);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (103, 105, 12, 23, 103, 103, 103);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (104, 77, 6, 31, 104, 104, 104);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (105, 106, 12, 24, 105, 105, 105);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (106, 81, 17, 15, 106, 106, 106);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (107, 73, 12, 1, 107, 107, 107);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (108, 158, 13, 6, 108, 108, 108);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (109, 119, 19, 29, 109, 109, 109);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (110, 196, 17, 25, 110, 110, 110);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (111, 161, 15, 16, 111, 111, 111);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (112, 64, 11, 11, 112, 112, 112);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (113, 52, 14, 24, 113, 113, 113);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (114, 89, 1, 14, 114, 114, 114);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (115, 170, 2, 4, 115, 115, 115);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (116, 194, 1, 28, 116, 116, 116);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (117, 134, 17, 12, 117, 117, 117);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (118, 159, 1, 9, 118, 118, 118);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (119, 155, 18, 17, 119, 119, 119);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (120, 142, 17, 20, 120, 120, 120);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (121, 99, 5, 27, 121, 121, 121);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (122, 64, 13, 17, 122, 122, 122);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (123, 163, 5, 9, 123, 123, 123);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (124, 104, 14, 28, 124, 124, 124);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (125, 105, 10, 2, 125, 125, 125);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (126, 128, 5, 19, 126, 126, 126);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (127, 136, 5, 17, 127, 127, 127);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (128, 197, 1, 30, 128, 128, 128);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (129, 187, 20, 23, 129, 129, 129);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (130, 78, 20, 21, 130, 130, 130);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (131, 192, 8, 30, 131, 131, 131);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (132, 132, 2, 23, 132, 132, 132);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (133, 77, 8, 8, 133, 133, 133);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (134, 157, 3, 29, 134, 134, 134);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (135, 72, 18, 31, 135, 135, 135);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (136, 86, 2, 18, 136, 136, 136);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (137, 74, 16, 6, 137, 137, 137);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (138, 185, 11, 11, 138, 138, 138);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (139, 161, 9, 2, 139, 139, 139);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (140, 158, 20, 13, 140, 140, 140);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (141, 188, 8, 12, 141, 141, 141);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (142, 163, 18, 26, 142, 142, 142);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (143, 70, 1, 15, 143, 143, 143);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (144, 89, 10, 3, 144, 144, 144);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (145, 134, 19, 7, 145, 145, 145);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (146, 193, 7, 1, 146, 146, 146);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (147, 146, 14, 15, 147, 147, 147);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (148, 172, 1, 17, 148, 148, 148);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (149, 186, 5, 12, 149, 149, 149);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (150, 61, 8, 5, 150, 150, 150);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (151, 142, 7, 21, 151, 151, 151);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (152, 128, 19, 19, 152, 152, 152);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (153, 116, 4, 5, 153, 153, 153);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (154, 94, 12, 19, 154, 154, 154);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (155, 54, 7, 31, 155, 155, 155);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (156, 121, 16, 14, 156, 156, 156);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (157, 77, 9, 2, 157, 157, 157);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (158, 109, 13, 6, 158, 158, 158);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (159, 136, 15, 1, 159, 159, 159);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (160, 160, 18, 17, 160, 160, 160);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (161, 108, 8, 24, 161, 161, 161);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (162, 88, 18, 2, 162, 162, 162);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (163, 51, 17, 27, 163, 163, 163);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (164, 175, 11, 28, 164, 164, 164);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (165, 115, 14, 23, 165, 165, 165);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (166, 81, 7, 7, 166, 166, 166);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (167, 131, 2, 17, 167, 167, 167);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (168, 97, 7, 19, 168, 168, 168);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (169, 72, 8, 26, 169, 169, 169);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (170, 191, 17, 26, 170, 170, 170);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (171, 93, 2, 1, 171, 171, 171);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (172, 64, 8, 26, 172, 172, 172);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (173, 117, 7, 22, 173, 173, 173);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (174, 151, 9, 4, 174, 174, 174);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (175, 84, 1, 21, 175, 175, 175);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (176, 141, 10, 4, 176, 176, 176);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (177, 69, 9, 7, 177, 177, 177);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (178, 56, 13, 31, 178, 178, 178);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (179, 67, 7, 20, 179, 179, 179);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (180, 199, 2, 22, 180, 180, 180);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (181, 66, 5, 28, 181, 181, 181);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (182, 166, 16, 20, 182, 182, 182);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (183, 90, 5, 16, 183, 183, 183);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (184, 194, 13, 16, 184, 184, 184);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (185, 119, 8, 15, 185, 185, 185);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (186, 193, 15, 11, 186, 186, 186);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (187, 93, 4, 11, 187, 187, 187);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (188, 190, 7, 30, 188, 188, 188);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (189, 56, 1, 20, 189, 189, 189);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (190, 173, 12, 22, 190, 190, 190);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (191, 50, 10, 14, 191, 191, 191);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (192, 140, 1, 10, 192, 192, 192);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (193, 142, 18, 8, 193, 193, 193);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (194, 60, 11, 1, 194, 194, 194);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (195, 87, 18, 9, 195, 195, 195);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (196, 64, 19, 25, 196, 196, 196);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (197, 156, 12, 13, 197, 197, 197);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (198, 84, 10, 5, 198, 198, 198);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (199, 100, 18, 18, 199, 199, 199);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (200, 99, 17, 16, 200, 200, 200);
commit;
prompt 200 records committed...
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (201, 137, 5, 24, 201, 201, 201);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (202, 136, 3, 11, 202, 202, 202);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (203, 79, 4, 3, 203, 203, 203);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (204, 87, 18, 13, 204, 204, 204);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (205, 70, 16, 15, 205, 205, 205);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (206, 148, 4, 25, 206, 206, 206);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (207, 148, 14, 20, 207, 207, 207);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (208, 51, 2, 25, 208, 208, 208);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (209, 140, 2, 18, 209, 209, 209);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (210, 112, 7, 4, 210, 210, 210);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (211, 92, 20, 8, 211, 211, 211);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (212, 110, 17, 13, 212, 212, 212);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (213, 84, 14, 3, 213, 213, 213);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (214, 111, 5, 25, 214, 214, 214);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (215, 168, 16, 11, 215, 215, 215);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (216, 185, 19, 24, 216, 216, 216);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (217, 127, 2, 3, 217, 217, 217);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (218, 149, 3, 31, 218, 218, 218);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (219, 183, 2, 7, 219, 219, 219);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (220, 94, 5, 16, 220, 220, 220);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (221, 134, 20, 5, 221, 221, 221);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (222, 75, 4, 5, 222, 222, 222);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (223, 62, 5, 19, 223, 223, 223);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (224, 163, 10, 29, 224, 224, 224);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (225, 137, 3, 10, 225, 225, 225);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (226, 65, 7, 12, 226, 226, 226);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (227, 189, 9, 22, 227, 227, 227);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (228, 151, 1, 24, 228, 228, 228);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (229, 167, 16, 12, 229, 229, 229);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (230, 61, 7, 29, 230, 230, 230);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (231, 122, 13, 30, 231, 231, 231);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (232, 170, 5, 3, 232, 232, 232);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (233, 192, 9, 25, 233, 233, 233);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (234, 89, 17, 14, 234, 234, 234);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (235, 87, 4, 7, 235, 235, 235);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (236, 107, 16, 27, 236, 236, 236);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (237, 140, 10, 10, 237, 237, 237);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (238, 59, 1, 10, 238, 238, 238);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (239, 154, 20, 24, 239, 239, 239);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (240, 116, 6, 12, 240, 240, 240);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (241, 140, 15, 9, 241, 241, 241);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (242, 143, 7, 25, 242, 242, 242);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (243, 62, 20, 8, 243, 243, 243);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (244, 91, 13, 24, 244, 244, 244);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (245, 96, 10, 17, 245, 245, 245);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (246, 127, 14, 13, 246, 246, 246);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (247, 114, 18, 29, 247, 247, 247);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (248, 182, 14, 8, 248, 248, 248);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (249, 197, 17, 23, 249, 249, 249);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (250, 82, 2, 28, 250, 250, 250);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (251, 130, 8, 2, 251, 251, 251);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (252, 191, 11, 28, 252, 252, 252);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (253, 177, 10, 25, 253, 253, 253);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (254, 95, 15, 27, 254, 254, 254);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (255, 150, 18, 6, 255, 255, 255);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (256, 116, 12, 25, 256, 256, 256);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (257, 57, 10, 10, 257, 257, 257);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (258, 127, 6, 17, 258, 258, 258);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (259, 75, 16, 29, 259, 259, 259);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (260, 81, 3, 11, 260, 260, 260);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (261, 121, 18, 6, 261, 261, 261);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (262, 55, 7, 16, 262, 262, 262);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (263, 58, 6, 28, 263, 263, 263);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (264, 169, 2, 23, 264, 264, 264);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (265, 51, 9, 11, 265, 265, 265);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (266, 149, 7, 23, 266, 266, 266);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (267, 144, 15, 31, 267, 267, 267);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (268, 133, 8, 18, 268, 268, 268);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (269, 195, 14, 20, 269, 269, 269);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (270, 157, 6, 13, 270, 270, 270);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (271, 93, 5, 17, 271, 271, 271);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (272, 190, 7, 6, 272, 272, 272);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (273, 127, 18, 16, 273, 273, 273);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (274, 190, 4, 28, 274, 274, 274);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (275, 105, 3, 26, 275, 275, 275);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (276, 77, 9, 7, 276, 276, 276);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (277, 112, 12, 9, 277, 277, 277);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (278, 140, 13, 4, 278, 278, 278);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (279, 138, 5, 17, 279, 279, 279);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (280, 53, 12, 7, 280, 280, 280);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (281, 125, 11, 31, 281, 281, 281);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (282, 145, 12, 15, 282, 282, 282);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (283, 106, 5, 8, 283, 283, 283);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (284, 60, 9, 21, 284, 284, 284);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (285, 132, 7, 22, 285, 285, 285);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (286, 126, 18, 18, 286, 286, 286);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (287, 89, 11, 29, 287, 287, 287);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (288, 199, 2, 16, 288, 288, 288);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (289, 132, 6, 20, 289, 289, 289);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (290, 77, 17, 14, 290, 290, 290);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (291, 51, 15, 2, 291, 291, 291);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (292, 152, 8, 9, 292, 292, 292);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (293, 142, 14, 23, 293, 293, 293);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (294, 99, 15, 23, 294, 294, 294);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (295, 93, 12, 9, 295, 295, 295);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (296, 197, 16, 7, 296, 296, 296);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (297, 172, 1, 12, 297, 297, 297);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (298, 143, 20, 28, 298, 298, 298);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (299, 185, 4, 30, 299, 299, 299);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (300, 144, 5, 20, 300, 300, 300);
commit;
prompt 300 records committed...
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (301, 182, 6, 24, 301, 301, 301);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (302, 183, 8, 6, 302, 302, 302);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (303, 51, 19, 16, 303, 303, 303);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (304, 141, 20, 12, 304, 304, 304);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (305, 127, 1, 15, 305, 305, 305);
commit;
prompt 305 records loaded
prompt Loading TEACHES_THE...
insert into TEACHES_THE (l_id, c_id)
values (287, 44);
insert into TEACHES_THE (l_id, c_id)
values (303, 287);
insert into TEACHES_THE (l_id, c_id)
values (219, 320);
insert into TEACHES_THE (l_id, c_id)
values (251, 704);
insert into TEACHES_THE (l_id, c_id)
values (209, 101);
insert into TEACHES_THE (l_id, c_id)
values (213, 135);
insert into TEACHES_THE (l_id, c_id)
values (261, 627);
insert into TEACHES_THE (l_id, c_id)
values (266, 584);
insert into TEACHES_THE (l_id, c_id)
values (309, 567);
insert into TEACHES_THE (l_id, c_id)
values (266, 248);
insert into TEACHES_THE (l_id, c_id)
values (206, 589);
insert into TEACHES_THE (l_id, c_id)
values (204, 685);
insert into TEACHES_THE (l_id, c_id)
values (209, 685);
insert into TEACHES_THE (l_id, c_id)
values (271, 343);
insert into TEACHES_THE (l_id, c_id)
values (225, 137);
insert into TEACHES_THE (l_id, c_id)
values (242, 220);
insert into TEACHES_THE (l_id, c_id)
values (286, 263);
insert into TEACHES_THE (l_id, c_id)
values (285, 314);
insert into TEACHES_THE (l_id, c_id)
values (308, 351);
insert into TEACHES_THE (l_id, c_id)
values (306, 615);
insert into TEACHES_THE (l_id, c_id)
values (214, 592);
insert into TEACHES_THE (l_id, c_id)
values (223, 636);
insert into TEACHES_THE (l_id, c_id)
values (202, 352);
insert into TEACHES_THE (l_id, c_id)
values (210, 30);
insert into TEACHES_THE (l_id, c_id)
values (289, 216);
insert into TEACHES_THE (l_id, c_id)
values (255, 539);
insert into TEACHES_THE (l_id, c_id)
values (301, 675);
insert into TEACHES_THE (l_id, c_id)
values (249, 582);
insert into TEACHES_THE (l_id, c_id)
values (273, 520);
insert into TEACHES_THE (l_id, c_id)
values (208, 599);
insert into TEACHES_THE (l_id, c_id)
values (267, 681);
insert into TEACHES_THE (l_id, c_id)
values (248, 71);
insert into TEACHES_THE (l_id, c_id)
values (291, 363);
insert into TEACHES_THE (l_id, c_id)
values (308, 600);
insert into TEACHES_THE (l_id, c_id)
values (267, 795);
insert into TEACHES_THE (l_id, c_id)
values (277, 548);
insert into TEACHES_THE (l_id, c_id)
values (241, 517);
insert into TEACHES_THE (l_id, c_id)
values (263, 149);
insert into TEACHES_THE (l_id, c_id)
values (272, 434);
insert into TEACHES_THE (l_id, c_id)
values (265, 559);
insert into TEACHES_THE (l_id, c_id)
values (262, 485);
insert into TEACHES_THE (l_id, c_id)
values (245, 378);
insert into TEACHES_THE (l_id, c_id)
values (200, 762);
insert into TEACHES_THE (l_id, c_id)
values (289, 88);
insert into TEACHES_THE (l_id, c_id)
values (269, 136);
insert into TEACHES_THE (l_id, c_id)
values (206, 101);
insert into TEACHES_THE (l_id, c_id)
values (227, 647);
insert into TEACHES_THE (l_id, c_id)
values (206, 781);
insert into TEACHES_THE (l_id, c_id)
values (215, 360);
insert into TEACHES_THE (l_id, c_id)
values (202, 520);
insert into TEACHES_THE (l_id, c_id)
values (275, 767);
insert into TEACHES_THE (l_id, c_id)
values (281, 624);
insert into TEACHES_THE (l_id, c_id)
values (302, 247);
insert into TEACHES_THE (l_id, c_id)
values (290, 247);
insert into TEACHES_THE (l_id, c_id)
values (233, 83);
insert into TEACHES_THE (l_id, c_id)
values (278, 495);
insert into TEACHES_THE (l_id, c_id)
values (258, 749);
insert into TEACHES_THE (l_id, c_id)
values (305, 524);
insert into TEACHES_THE (l_id, c_id)
values (230, 466);
insert into TEACHES_THE (l_id, c_id)
values (221, 186);
insert into TEACHES_THE (l_id, c_id)
values (233, 711);
insert into TEACHES_THE (l_id, c_id)
values (207, 762);
insert into TEACHES_THE (l_id, c_id)
values (204, 368);
insert into TEACHES_THE (l_id, c_id)
values (268, 499);
insert into TEACHES_THE (l_id, c_id)
values (306, 231);
insert into TEACHES_THE (l_id, c_id)
values (218, 137);
insert into TEACHES_THE (l_id, c_id)
values (305, 797);
insert into TEACHES_THE (l_id, c_id)
values (270, 618);
insert into TEACHES_THE (l_id, c_id)
values (287, 528);
insert into TEACHES_THE (l_id, c_id)
values (290, 281);
insert into TEACHES_THE (l_id, c_id)
values (247, 339);
insert into TEACHES_THE (l_id, c_id)
values (209, 716);
insert into TEACHES_THE (l_id, c_id)
values (241, 342);
insert into TEACHES_THE (l_id, c_id)
values (252, 759);
insert into TEACHES_THE (l_id, c_id)
values (288, 816);
insert into TEACHES_THE (l_id, c_id)
values (218, 682);
insert into TEACHES_THE (l_id, c_id)
values (296, 484);
insert into TEACHES_THE (l_id, c_id)
values (295, 620);
insert into TEACHES_THE (l_id, c_id)
values (261, 345);
insert into TEACHES_THE (l_id, c_id)
values (257, 758);
insert into TEACHES_THE (l_id, c_id)
values (297, 746);
insert into TEACHES_THE (l_id, c_id)
values (244, 201);
insert into TEACHES_THE (l_id, c_id)
values (233, 341);
insert into TEACHES_THE (l_id, c_id)
values (254, 780);
insert into TEACHES_THE (l_id, c_id)
values (296, 821);
insert into TEACHES_THE (l_id, c_id)
values (277, 707);
insert into TEACHES_THE (l_id, c_id)
values (216, 749);
insert into TEACHES_THE (l_id, c_id)
values (242, 505);
insert into TEACHES_THE (l_id, c_id)
values (216, 223);
insert into TEACHES_THE (l_id, c_id)
values (214, 725);
insert into TEACHES_THE (l_id, c_id)
values (285, 107);
insert into TEACHES_THE (l_id, c_id)
values (292, 201);
insert into TEACHES_THE (l_id, c_id)
values (247, 556);
insert into TEACHES_THE (l_id, c_id)
values (250, 473);
insert into TEACHES_THE (l_id, c_id)
values (306, 418);
insert into TEACHES_THE (l_id, c_id)
values (218, 666);
insert into TEACHES_THE (l_id, c_id)
values (300, 144);
insert into TEACHES_THE (l_id, c_id)
values (254, 489);
insert into TEACHES_THE (l_id, c_id)
values (285, 265);
insert into TEACHES_THE (l_id, c_id)
values (299, 184);
commit;
prompt 100 records committed...
insert into TEACHES_THE (l_id, c_id)
values (304, 134);
insert into TEACHES_THE (l_id, c_id)
values (295, 592);
insert into TEACHES_THE (l_id, c_id)
values (225, 202);
insert into TEACHES_THE (l_id, c_id)
values (229, 39);
insert into TEACHES_THE (l_id, c_id)
values (234, 479);
insert into TEACHES_THE (l_id, c_id)
values (291, 751);
insert into TEACHES_THE (l_id, c_id)
values (262, 534);
insert into TEACHES_THE (l_id, c_id)
values (288, 337);
insert into TEACHES_THE (l_id, c_id)
values (307, 747);
insert into TEACHES_THE (l_id, c_id)
values (215, 561);
insert into TEACHES_THE (l_id, c_id)
values (210, 596);
insert into TEACHES_THE (l_id, c_id)
values (308, 225);
insert into TEACHES_THE (l_id, c_id)
values (248, 777);
insert into TEACHES_THE (l_id, c_id)
values (309, 636);
insert into TEACHES_THE (l_id, c_id)
values (260, 360);
insert into TEACHES_THE (l_id, c_id)
values (308, 41);
insert into TEACHES_THE (l_id, c_id)
values (276, 343);
insert into TEACHES_THE (l_id, c_id)
values (308, 105);
insert into TEACHES_THE (l_id, c_id)
values (206, 240);
insert into TEACHES_THE (l_id, c_id)
values (245, 392);
insert into TEACHES_THE (l_id, c_id)
values (275, 328);
insert into TEACHES_THE (l_id, c_id)
values (225, 192);
insert into TEACHES_THE (l_id, c_id)
values (274, 729);
insert into TEACHES_THE (l_id, c_id)
values (220, 675);
insert into TEACHES_THE (l_id, c_id)
values (238, 420);
insert into TEACHES_THE (l_id, c_id)
values (250, 569);
insert into TEACHES_THE (l_id, c_id)
values (245, 224);
insert into TEACHES_THE (l_id, c_id)
values (245, 333);
insert into TEACHES_THE (l_id, c_id)
values (226, 805);
insert into TEACHES_THE (l_id, c_id)
values (220, 133);
insert into TEACHES_THE (l_id, c_id)
values (302, 172);
insert into TEACHES_THE (l_id, c_id)
values (240, 383);
insert into TEACHES_THE (l_id, c_id)
values (275, 376);
insert into TEACHES_THE (l_id, c_id)
values (308, 519);
insert into TEACHES_THE (l_id, c_id)
values (275, 90);
insert into TEACHES_THE (l_id, c_id)
values (257, 211);
insert into TEACHES_THE (l_id, c_id)
values (255, 611);
insert into TEACHES_THE (l_id, c_id)
values (285, 751);
insert into TEACHES_THE (l_id, c_id)
values (280, 735);
insert into TEACHES_THE (l_id, c_id)
values (270, 449);
insert into TEACHES_THE (l_id, c_id)
values (237, 148);
insert into TEACHES_THE (l_id, c_id)
values (224, 453);
insert into TEACHES_THE (l_id, c_id)
values (203, 480);
insert into TEACHES_THE (l_id, c_id)
values (300, 293);
insert into TEACHES_THE (l_id, c_id)
values (255, 12);
insert into TEACHES_THE (l_id, c_id)
values (216, 822);
insert into TEACHES_THE (l_id, c_id)
values (241, 659);
insert into TEACHES_THE (l_id, c_id)
values (222, 62);
insert into TEACHES_THE (l_id, c_id)
values (240, 372);
insert into TEACHES_THE (l_id, c_id)
values (206, 58);
insert into TEACHES_THE (l_id, c_id)
values (285, 802);
insert into TEACHES_THE (l_id, c_id)
values (234, 698);
insert into TEACHES_THE (l_id, c_id)
values (242, 468);
insert into TEACHES_THE (l_id, c_id)
values (272, 670);
insert into TEACHES_THE (l_id, c_id)
values (255, 350);
insert into TEACHES_THE (l_id, c_id)
values (233, 203);
insert into TEACHES_THE (l_id, c_id)
values (265, 47);
insert into TEACHES_THE (l_id, c_id)
values (256, 439);
insert into TEACHES_THE (l_id, c_id)
values (277, 216);
insert into TEACHES_THE (l_id, c_id)
values (305, 301);
insert into TEACHES_THE (l_id, c_id)
values (286, 633);
insert into TEACHES_THE (l_id, c_id)
values (280, 247);
insert into TEACHES_THE (l_id, c_id)
values (253, 42);
insert into TEACHES_THE (l_id, c_id)
values (217, 70);
insert into TEACHES_THE (l_id, c_id)
values (211, 12);
insert into TEACHES_THE (l_id, c_id)
values (275, 539);
insert into TEACHES_THE (l_id, c_id)
values (271, 278);
insert into TEACHES_THE (l_id, c_id)
values (256, 630);
insert into TEACHES_THE (l_id, c_id)
values (236, 663);
insert into TEACHES_THE (l_id, c_id)
values (294, 535);
insert into TEACHES_THE (l_id, c_id)
values (301, 785);
insert into TEACHES_THE (l_id, c_id)
values (296, 132);
insert into TEACHES_THE (l_id, c_id)
values (272, 610);
insert into TEACHES_THE (l_id, c_id)
values (275, 199);
insert into TEACHES_THE (l_id, c_id)
values (289, 117);
insert into TEACHES_THE (l_id, c_id)
values (202, 620);
insert into TEACHES_THE (l_id, c_id)
values (203, 713);
insert into TEACHES_THE (l_id, c_id)
values (255, 794);
insert into TEACHES_THE (l_id, c_id)
values (310, 448);
insert into TEACHES_THE (l_id, c_id)
values (244, 217);
insert into TEACHES_THE (l_id, c_id)
values (213, 185);
insert into TEACHES_THE (l_id, c_id)
values (263, 731);
insert into TEACHES_THE (l_id, c_id)
values (229, 738);
insert into TEACHES_THE (l_id, c_id)
values (295, 509);
insert into TEACHES_THE (l_id, c_id)
values (282, 259);
insert into TEACHES_THE (l_id, c_id)
values (209, 794);
insert into TEACHES_THE (l_id, c_id)
values (202, 516);
insert into TEACHES_THE (l_id, c_id)
values (256, 79);
insert into TEACHES_THE (l_id, c_id)
values (305, 217);
insert into TEACHES_THE (l_id, c_id)
values (236, 505);
insert into TEACHES_THE (l_id, c_id)
values (242, 202);
insert into TEACHES_THE (l_id, c_id)
values (270, 747);
insert into TEACHES_THE (l_id, c_id)
values (266, 747);
insert into TEACHES_THE (l_id, c_id)
values (294, 554);
insert into TEACHES_THE (l_id, c_id)
values (287, 435);
insert into TEACHES_THE (l_id, c_id)
values (271, 796);
insert into TEACHES_THE (l_id, c_id)
values (261, 496);
insert into TEACHES_THE (l_id, c_id)
values (280, 505);
insert into TEACHES_THE (l_id, c_id)
values (226, 419);
insert into TEACHES_THE (l_id, c_id)
values (214, 73);
commit;
prompt 200 records committed...
insert into TEACHES_THE (l_id, c_id)
values (246, 769);
insert into TEACHES_THE (l_id, c_id)
values (295, 87);
insert into TEACHES_THE (l_id, c_id)
values (203, 260);
insert into TEACHES_THE (l_id, c_id)
values (303, 368);
insert into TEACHES_THE (l_id, c_id)
values (289, 112);
insert into TEACHES_THE (l_id, c_id)
values (237, 743);
insert into TEACHES_THE (l_id, c_id)
values (210, 663);
insert into TEACHES_THE (l_id, c_id)
values (232, 243);
insert into TEACHES_THE (l_id, c_id)
values (223, 364);
insert into TEACHES_THE (l_id, c_id)
values (299, 795);
insert into TEACHES_THE (l_id, c_id)
values (297, 807);
insert into TEACHES_THE (l_id, c_id)
values (209, 88);
insert into TEACHES_THE (l_id, c_id)
values (247, 96);
insert into TEACHES_THE (l_id, c_id)
values (245, 5);
insert into TEACHES_THE (l_id, c_id)
values (289, 219);
insert into TEACHES_THE (l_id, c_id)
values (211, 783);
insert into TEACHES_THE (l_id, c_id)
values (259, 349);
insert into TEACHES_THE (l_id, c_id)
values (248, 235);
insert into TEACHES_THE (l_id, c_id)
values (230, 490);
insert into TEACHES_THE (l_id, c_id)
values (239, 142);
insert into TEACHES_THE (l_id, c_id)
values (249, 257);
insert into TEACHES_THE (l_id, c_id)
values (294, 569);
insert into TEACHES_THE (l_id, c_id)
values (228, 197);
insert into TEACHES_THE (l_id, c_id)
values (260, 396);
insert into TEACHES_THE (l_id, c_id)
values (200, 812);
insert into TEACHES_THE (l_id, c_id)
values (260, 155);
insert into TEACHES_THE (l_id, c_id)
values (246, 459);
insert into TEACHES_THE (l_id, c_id)
values (251, 173);
insert into TEACHES_THE (l_id, c_id)
values (271, 171);
insert into TEACHES_THE (l_id, c_id)
values (215, 477);
insert into TEACHES_THE (l_id, c_id)
values (292, 372);
insert into TEACHES_THE (l_id, c_id)
values (261, 16);
insert into TEACHES_THE (l_id, c_id)
values (274, 436);
insert into TEACHES_THE (l_id, c_id)
values (293, 426);
insert into TEACHES_THE (l_id, c_id)
values (225, 601);
insert into TEACHES_THE (l_id, c_id)
values (257, 685);
insert into TEACHES_THE (l_id, c_id)
values (308, 160);
insert into TEACHES_THE (l_id, c_id)
values (230, 744);
insert into TEACHES_THE (l_id, c_id)
values (291, 163);
insert into TEACHES_THE (l_id, c_id)
values (304, 66);
insert into TEACHES_THE (l_id, c_id)
values (254, 810);
insert into TEACHES_THE (l_id, c_id)
values (249, 445);
insert into TEACHES_THE (l_id, c_id)
values (280, 531);
insert into TEACHES_THE (l_id, c_id)
values (200, 292);
insert into TEACHES_THE (l_id, c_id)
values (201, 625);
insert into TEACHES_THE (l_id, c_id)
values (279, 120);
insert into TEACHES_THE (l_id, c_id)
values (295, 453);
insert into TEACHES_THE (l_id, c_id)
values (234, 193);
insert into TEACHES_THE (l_id, c_id)
values (285, 768);
insert into TEACHES_THE (l_id, c_id)
values (297, 534);
insert into TEACHES_THE (l_id, c_id)
values (257, 573);
insert into TEACHES_THE (l_id, c_id)
values (273, 441);
insert into TEACHES_THE (l_id, c_id)
values (243, 534);
insert into TEACHES_THE (l_id, c_id)
values (232, 640);
insert into TEACHES_THE (l_id, c_id)
values (242, 425);
insert into TEACHES_THE (l_id, c_id)
values (203, 670);
insert into TEACHES_THE (l_id, c_id)
values (263, 700);
insert into TEACHES_THE (l_id, c_id)
values (203, 18);
insert into TEACHES_THE (l_id, c_id)
values (224, 257);
insert into TEACHES_THE (l_id, c_id)
values (252, 167);
insert into TEACHES_THE (l_id, c_id)
values (224, 76);
insert into TEACHES_THE (l_id, c_id)
values (220, 725);
insert into TEACHES_THE (l_id, c_id)
values (204, 205);
insert into TEACHES_THE (l_id, c_id)
values (219, 479);
insert into TEACHES_THE (l_id, c_id)
values (221, 213);
insert into TEACHES_THE (l_id, c_id)
values (211, 291);
insert into TEACHES_THE (l_id, c_id)
values (299, 138);
insert into TEACHES_THE (l_id, c_id)
values (262, 821);
insert into TEACHES_THE (l_id, c_id)
values (263, 809);
insert into TEACHES_THE (l_id, c_id)
values (291, 732);
insert into TEACHES_THE (l_id, c_id)
values (218, 188);
insert into TEACHES_THE (l_id, c_id)
values (246, 369);
insert into TEACHES_THE (l_id, c_id)
values (261, 782);
insert into TEACHES_THE (l_id, c_id)
values (255, 401);
insert into TEACHES_THE (l_id, c_id)
values (254, 285);
insert into TEACHES_THE (l_id, c_id)
values (216, 826);
insert into TEACHES_THE (l_id, c_id)
values (295, 11);
insert into TEACHES_THE (l_id, c_id)
values (296, 204);
insert into TEACHES_THE (l_id, c_id)
values (220, 367);
insert into TEACHES_THE (l_id, c_id)
values (200, 108);
insert into TEACHES_THE (l_id, c_id)
values (276, 92);
insert into TEACHES_THE (l_id, c_id)
values (292, 116);
insert into TEACHES_THE (l_id, c_id)
values (230, 443);
insert into TEACHES_THE (l_id, c_id)
values (254, 400);
insert into TEACHES_THE (l_id, c_id)
values (233, 791);
insert into TEACHES_THE (l_id, c_id)
values (210, 105);
insert into TEACHES_THE (l_id, c_id)
values (206, 485);
insert into TEACHES_THE (l_id, c_id)
values (276, 710);
insert into TEACHES_THE (l_id, c_id)
values (214, 491);
insert into TEACHES_THE (l_id, c_id)
values (289, 490);
insert into TEACHES_THE (l_id, c_id)
values (229, 184);
insert into TEACHES_THE (l_id, c_id)
values (289, 462);
insert into TEACHES_THE (l_id, c_id)
values (243, 630);
insert into TEACHES_THE (l_id, c_id)
values (240, 64);
insert into TEACHES_THE (l_id, c_id)
values (281, 191);
insert into TEACHES_THE (l_id, c_id)
values (272, 33);
insert into TEACHES_THE (l_id, c_id)
values (242, 24);
insert into TEACHES_THE (l_id, c_id)
values (219, 286);
insert into TEACHES_THE (l_id, c_id)
values (276, 727);
insert into TEACHES_THE (l_id, c_id)
values (227, 719);
commit;
prompt 300 records committed...
insert into TEACHES_THE (l_id, c_id)
values (228, 661);
insert into TEACHES_THE (l_id, c_id)
values (262, 609);
insert into TEACHES_THE (l_id, c_id)
values (262, 28);
insert into TEACHES_THE (l_id, c_id)
values (251, 813);
insert into TEACHES_THE (l_id, c_id)
values (240, 50);
insert into TEACHES_THE (l_id, c_id)
values (275, 698);
insert into TEACHES_THE (l_id, c_id)
values (244, 109);
insert into TEACHES_THE (l_id, c_id)
values (285, 234);
commit;
prompt 308 records loaded
prompt Loading USES...
insert into USES (c_id, e_id)
values (6, 537);
insert into USES (c_id, e_id)
values (9, 566);
insert into USES (c_id, e_id)
values (9, 593);
insert into USES (c_id, e_id)
values (10, 636);
insert into USES (c_id, e_id)
values (13, 200);
insert into USES (c_id, e_id)
values (13, 438);
insert into USES (c_id, e_id)
values (14, 489);
insert into USES (c_id, e_id)
values (14, 658);
insert into USES (c_id, e_id)
values (15, 176);
insert into USES (c_id, e_id)
values (17, 212);
insert into USES (c_id, e_id)
values (17, 395);
insert into USES (c_id, e_id)
values (20, 387);
insert into USES (c_id, e_id)
values (20, 404);
insert into USES (c_id, e_id)
values (23, 229);
insert into USES (c_id, e_id)
values (28, 42);
insert into USES (c_id, e_id)
values (28, 225);
insert into USES (c_id, e_id)
values (28, 272);
insert into USES (c_id, e_id)
values (29, 39);
insert into USES (c_id, e_id)
values (30, 548);
insert into USES (c_id, e_id)
values (31, 632);
insert into USES (c_id, e_id)
values (32, 562);
insert into USES (c_id, e_id)
values (33, 13);
insert into USES (c_id, e_id)
values (33, 398);
insert into USES (c_id, e_id)
values (33, 447);
insert into USES (c_id, e_id)
values (36, 174);
insert into USES (c_id, e_id)
values (37, 123);
insert into USES (c_id, e_id)
values (37, 573);
insert into USES (c_id, e_id)
values (43, 3);
insert into USES (c_id, e_id)
values (44, 2);
insert into USES (c_id, e_id)
values (45, 66);
insert into USES (c_id, e_id)
values (47, 103);
insert into USES (c_id, e_id)
values (49, 480);
insert into USES (c_id, e_id)
values (57, 437);
insert into USES (c_id, e_id)
values (60, 549);
insert into USES (c_id, e_id)
values (61, 263);
insert into USES (c_id, e_id)
values (61, 506);
insert into USES (c_id, e_id)
values (62, 408);
insert into USES (c_id, e_id)
values (64, 343);
insert into USES (c_id, e_id)
values (65, 198);
insert into USES (c_id, e_id)
values (69, 614);
insert into USES (c_id, e_id)
values (70, 670);
insert into USES (c_id, e_id)
values (73, 378);
insert into USES (c_id, e_id)
values (75, 394);
insert into USES (c_id, e_id)
values (76, 710);
insert into USES (c_id, e_id)
values (83, 558);
insert into USES (c_id, e_id)
values (84, 622);
insert into USES (c_id, e_id)
values (85, 283);
insert into USES (c_id, e_id)
values (86, 526);
insert into USES (c_id, e_id)
values (86, 625);
insert into USES (c_id, e_id)
values (87, 167);
insert into USES (c_id, e_id)
values (88, 139);
insert into USES (c_id, e_id)
values (88, 505);
insert into USES (c_id, e_id)
values (89, 277);
insert into USES (c_id, e_id)
values (89, 474);
insert into USES (c_id, e_id)
values (95, 452);
insert into USES (c_id, e_id)
values (95, 569);
insert into USES (c_id, e_id)
values (98, 71);
insert into USES (c_id, e_id)
values (98, 410);
insert into USES (c_id, e_id)
values (101, 577);
insert into USES (c_id, e_id)
values (102, 534);
insert into USES (c_id, e_id)
values (103, 396);
insert into USES (c_id, e_id)
values (104, 138);
insert into USES (c_id, e_id)
values (104, 463);
insert into USES (c_id, e_id)
values (105, 572);
insert into USES (c_id, e_id)
values (107, 500);
insert into USES (c_id, e_id)
values (109, 188);
insert into USES (c_id, e_id)
values (114, 551);
insert into USES (c_id, e_id)
values (116, 519);
insert into USES (c_id, e_id)
values (118, 522);
insert into USES (c_id, e_id)
values (120, 460);
insert into USES (c_id, e_id)
values (122, 654);
insert into USES (c_id, e_id)
values (126, 500);
insert into USES (c_id, e_id)
values (132, 167);
insert into USES (c_id, e_id)
values (133, 77);
insert into USES (c_id, e_id)
values (136, 1);
insert into USES (c_id, e_id)
values (136, 305);
insert into USES (c_id, e_id)
values (141, 554);
insert into USES (c_id, e_id)
values (142, 360);
insert into USES (c_id, e_id)
values (142, 489);
insert into USES (c_id, e_id)
values (142, 630);
insert into USES (c_id, e_id)
values (144, 446);
insert into USES (c_id, e_id)
values (144, 524);
insert into USES (c_id, e_id)
values (147, 673);
insert into USES (c_id, e_id)
values (149, 388);
insert into USES (c_id, e_id)
values (155, 617);
insert into USES (c_id, e_id)
values (157, 527);
insert into USES (c_id, e_id)
values (164, 611);
insert into USES (c_id, e_id)
values (165, 171);
insert into USES (c_id, e_id)
values (167, 475);
insert into USES (c_id, e_id)
values (168, 133);
insert into USES (c_id, e_id)
values (170, 247);
insert into USES (c_id, e_id)
values (170, 580);
insert into USES (c_id, e_id)
values (171, 290);
insert into USES (c_id, e_id)
values (171, 452);
insert into USES (c_id, e_id)
values (175, 328);
insert into USES (c_id, e_id)
values (180, 585);
insert into USES (c_id, e_id)
values (185, 168);
insert into USES (c_id, e_id)
values (187, 28);
insert into USES (c_id, e_id)
values (189, 228);
insert into USES (c_id, e_id)
values (194, 515);
commit;
prompt 100 records committed...
insert into USES (c_id, e_id)
values (195, 548);
insert into USES (c_id, e_id)
values (196, 196);
insert into USES (c_id, e_id)
values (201, 429);
insert into USES (c_id, e_id)
values (201, 568);
insert into USES (c_id, e_id)
values (203, 459);
insert into USES (c_id, e_id)
values (206, 542);
insert into USES (c_id, e_id)
values (209, 83);
insert into USES (c_id, e_id)
values (211, 500);
insert into USES (c_id, e_id)
values (216, 321);
insert into USES (c_id, e_id)
values (216, 719);
insert into USES (c_id, e_id)
values (221, 243);
insert into USES (c_id, e_id)
values (225, 264);
insert into USES (c_id, e_id)
values (225, 521);
insert into USES (c_id, e_id)
values (226, 436);
insert into USES (c_id, e_id)
values (229, 183);
insert into USES (c_id, e_id)
values (229, 506);
insert into USES (c_id, e_id)
values (229, 557);
insert into USES (c_id, e_id)
values (230, 334);
insert into USES (c_id, e_id)
values (234, 679);
insert into USES (c_id, e_id)
values (238, 639);
insert into USES (c_id, e_id)
values (239, 63);
insert into USES (c_id, e_id)
values (239, 335);
insert into USES (c_id, e_id)
values (240, 1);
insert into USES (c_id, e_id)
values (246, 99);
insert into USES (c_id, e_id)
values (246, 141);
insert into USES (c_id, e_id)
values (246, 143);
insert into USES (c_id, e_id)
values (247, 64);
insert into USES (c_id, e_id)
values (248, 575);
insert into USES (c_id, e_id)
values (251, 330);
insert into USES (c_id, e_id)
values (252, 496);
insert into USES (c_id, e_id)
values (252, 670);
insert into USES (c_id, e_id)
values (254, 174);
insert into USES (c_id, e_id)
values (255, 9);
insert into USES (c_id, e_id)
values (255, 41);
insert into USES (c_id, e_id)
values (258, 191);
insert into USES (c_id, e_id)
values (258, 468);
insert into USES (c_id, e_id)
values (261, 298);
insert into USES (c_id, e_id)
values (267, 112);
insert into USES (c_id, e_id)
values (269, 559);
insert into USES (c_id, e_id)
values (272, 148);
insert into USES (c_id, e_id)
values (278, 100);
insert into USES (c_id, e_id)
values (278, 204);
insert into USES (c_id, e_id)
values (278, 338);
insert into USES (c_id, e_id)
values (279, 168);
insert into USES (c_id, e_id)
values (279, 407);
insert into USES (c_id, e_id)
values (291, 98);
insert into USES (c_id, e_id)
values (293, 292);
insert into USES (c_id, e_id)
values (293, 661);
insert into USES (c_id, e_id)
values (297, 359);
insert into USES (c_id, e_id)
values (299, 620);
insert into USES (c_id, e_id)
values (302, 652);
insert into USES (c_id, e_id)
values (304, 313);
insert into USES (c_id, e_id)
values (304, 521);
insert into USES (c_id, e_id)
values (304, 564);
insert into USES (c_id, e_id)
values (305, 257);
insert into USES (c_id, e_id)
values (308, 423);
insert into USES (c_id, e_id)
values (309, 655);
insert into USES (c_id, e_id)
values (314, 73);
insert into USES (c_id, e_id)
values (315, 35);
insert into USES (c_id, e_id)
values (318, 686);
insert into USES (c_id, e_id)
values (320, 216);
insert into USES (c_id, e_id)
values (323, 81);
insert into USES (c_id, e_id)
values (323, 208);
insert into USES (c_id, e_id)
values (325, 108);
insert into USES (c_id, e_id)
values (325, 188);
insert into USES (c_id, e_id)
values (328, 580);
insert into USES (c_id, e_id)
values (331, 6);
insert into USES (c_id, e_id)
values (332, 142);
insert into USES (c_id, e_id)
values (333, 344);
insert into USES (c_id, e_id)
values (334, 547);
insert into USES (c_id, e_id)
values (336, 401);
insert into USES (c_id, e_id)
values (339, 395);
insert into USES (c_id, e_id)
values (346, 550);
insert into USES (c_id, e_id)
values (352, 367);
insert into USES (c_id, e_id)
values (354, 263);
insert into USES (c_id, e_id)
values (354, 443);
insert into USES (c_id, e_id)
values (355, 703);
insert into USES (c_id, e_id)
values (357, 164);
insert into USES (c_id, e_id)
values (358, 309);
insert into USES (c_id, e_id)
values (358, 366);
insert into USES (c_id, e_id)
values (358, 453);
insert into USES (c_id, e_id)
values (358, 458);
insert into USES (c_id, e_id)
values (361, 434);
insert into USES (c_id, e_id)
values (365, 11);
insert into USES (c_id, e_id)
values (365, 537);
insert into USES (c_id, e_id)
values (366, 665);
insert into USES (c_id, e_id)
values (368, 649);
insert into USES (c_id, e_id)
values (372, 130);
insert into USES (c_id, e_id)
values (377, 374);
insert into USES (c_id, e_id)
values (379, 199);
insert into USES (c_id, e_id)
values (381, 68);
insert into USES (c_id, e_id)
values (383, 304);
insert into USES (c_id, e_id)
values (386, 34);
insert into USES (c_id, e_id)
values (388, 19);
insert into USES (c_id, e_id)
values (392, 598);
insert into USES (c_id, e_id)
values (395, 708);
insert into USES (c_id, e_id)
values (398, 175);
insert into USES (c_id, e_id)
values (399, 377);
insert into USES (c_id, e_id)
values (401, 247);
insert into USES (c_id, e_id)
values (402, 5);
commit;
prompt 200 records committed...
insert into USES (c_id, e_id)
values (402, 386);
insert into USES (c_id, e_id)
values (402, 447);
insert into USES (c_id, e_id)
values (404, 360);
insert into USES (c_id, e_id)
values (407, 409);
insert into USES (c_id, e_id)
values (408, 72);
insert into USES (c_id, e_id)
values (409, 107);
insert into USES (c_id, e_id)
values (413, 600);
insert into USES (c_id, e_id)
values (417, 548);
insert into USES (c_id, e_id)
values (418, 693);
insert into USES (c_id, e_id)
values (419, 379);
insert into USES (c_id, e_id)
values (419, 504);
insert into USES (c_id, e_id)
values (421, 629);
insert into USES (c_id, e_id)
values (422, 194);
insert into USES (c_id, e_id)
values (423, 282);
insert into USES (c_id, e_id)
values (423, 669);
insert into USES (c_id, e_id)
values (426, 291);
insert into USES (c_id, e_id)
values (429, 32);
insert into USES (c_id, e_id)
values (432, 222);
insert into USES (c_id, e_id)
values (433, 548);
insert into USES (c_id, e_id)
values (435, 471);
insert into USES (c_id, e_id)
values (442, 198);
insert into USES (c_id, e_id)
values (444, 484);
insert into USES (c_id, e_id)
values (445, 287);
insert into USES (c_id, e_id)
values (446, 621);
insert into USES (c_id, e_id)
values (447, 39);
insert into USES (c_id, e_id)
values (448, 669);
insert into USES (c_id, e_id)
values (449, 265);
insert into USES (c_id, e_id)
values (450, 190);
insert into USES (c_id, e_id)
values (450, 445);
insert into USES (c_id, e_id)
values (450, 536);
insert into USES (c_id, e_id)
values (454, 382);
insert into USES (c_id, e_id)
values (457, 589);
insert into USES (c_id, e_id)
values (459, 444);
insert into USES (c_id, e_id)
values (460, 374);
insert into USES (c_id, e_id)
values (461, 284);
insert into USES (c_id, e_id)
values (462, 426);
insert into USES (c_id, e_id)
values (462, 621);
insert into USES (c_id, e_id)
values (463, 47);
insert into USES (c_id, e_id)
values (464, 434);
insert into USES (c_id, e_id)
values (465, 208);
insert into USES (c_id, e_id)
values (466, 513);
insert into USES (c_id, e_id)
values (468, 410);
insert into USES (c_id, e_id)
values (475, 504);
insert into USES (c_id, e_id)
values (476, 229);
insert into USES (c_id, e_id)
values (476, 691);
insert into USES (c_id, e_id)
values (477, 261);
insert into USES (c_id, e_id)
values (483, 477);
insert into USES (c_id, e_id)
values (486, 12);
insert into USES (c_id, e_id)
values (489, 582);
insert into USES (c_id, e_id)
values (491, 719);
insert into USES (c_id, e_id)
values (493, 329);
insert into USES (c_id, e_id)
values (508, 589);
insert into USES (c_id, e_id)
values (509, 202);
insert into USES (c_id, e_id)
values (513, 195);
insert into USES (c_id, e_id)
values (516, 1);
insert into USES (c_id, e_id)
values (518, 582);
insert into USES (c_id, e_id)
values (520, 47);
insert into USES (c_id, e_id)
values (522, 19);
insert into USES (c_id, e_id)
values (527, 366);
insert into USES (c_id, e_id)
values (528, 429);
insert into USES (c_id, e_id)
values (531, 140);
insert into USES (c_id, e_id)
values (532, 571);
insert into USES (c_id, e_id)
values (539, 115);
insert into USES (c_id, e_id)
values (540, 235);
insert into USES (c_id, e_id)
values (540, 251);
insert into USES (c_id, e_id)
values (540, 376);
insert into USES (c_id, e_id)
values (544, 418);
insert into USES (c_id, e_id)
values (547, 395);
insert into USES (c_id, e_id)
values (551, 501);
insert into USES (c_id, e_id)
values (552, 582);
insert into USES (c_id, e_id)
values (554, 96);
insert into USES (c_id, e_id)
values (554, 272);
insert into USES (c_id, e_id)
values (564, 93);
insert into USES (c_id, e_id)
values (565, 68);
insert into USES (c_id, e_id)
values (566, 142);
insert into USES (c_id, e_id)
values (568, 572);
insert into USES (c_id, e_id)
values (570, 273);
insert into USES (c_id, e_id)
values (572, 242);
insert into USES (c_id, e_id)
values (572, 500);
insert into USES (c_id, e_id)
values (572, 600);
insert into USES (c_id, e_id)
values (573, 225);
insert into USES (c_id, e_id)
values (573, 567);
insert into USES (c_id, e_id)
values (574, 534);
insert into USES (c_id, e_id)
values (576, 144);
insert into USES (c_id, e_id)
values (580, 9);
insert into USES (c_id, e_id)
values (584, 491);
insert into USES (c_id, e_id)
values (585, 617);
insert into USES (c_id, e_id)
values (586, 389);
insert into USES (c_id, e_id)
values (588, 184);
insert into USES (c_id, e_id)
values (588, 299);
insert into USES (c_id, e_id)
values (590, 584);
insert into USES (c_id, e_id)
values (592, 74);
insert into USES (c_id, e_id)
values (595, 653);
insert into USES (c_id, e_id)
values (596, 96);
insert into USES (c_id, e_id)
values (597, 591);
insert into USES (c_id, e_id)
values (599, 96);
insert into USES (c_id, e_id)
values (600, 571);
insert into USES (c_id, e_id)
values (610, 80);
insert into USES (c_id, e_id)
values (610, 629);
insert into USES (c_id, e_id)
values (612, 561);
commit;
prompt 300 records committed...
insert into USES (c_id, e_id)
values (614, 704);
insert into USES (c_id, e_id)
values (616, 507);
insert into USES (c_id, e_id)
values (616, 534);
insert into USES (c_id, e_id)
values (621, 80);
insert into USES (c_id, e_id)
values (624, 260);
insert into USES (c_id, e_id)
values (624, 338);
insert into USES (c_id, e_id)
values (625, 265);
insert into USES (c_id, e_id)
values (625, 415);
insert into USES (c_id, e_id)
values (631, 117);
insert into USES (c_id, e_id)
values (631, 608);
insert into USES (c_id, e_id)
values (632, 442);
insert into USES (c_id, e_id)
values (633, 613);
insert into USES (c_id, e_id)
values (636, 645);
insert into USES (c_id, e_id)
values (640, 429);
insert into USES (c_id, e_id)
values (645, 583);
insert into USES (c_id, e_id)
values (649, 275);
insert into USES (c_id, e_id)
values (651, 455);
insert into USES (c_id, e_id)
values (651, 499);
insert into USES (c_id, e_id)
values (652, 526);
insert into USES (c_id, e_id)
values (653, 669);
insert into USES (c_id, e_id)
values (654, 432);
insert into USES (c_id, e_id)
values (654, 600);
insert into USES (c_id, e_id)
values (655, 601);
insert into USES (c_id, e_id)
values (656, 232);
insert into USES (c_id, e_id)
values (657, 443);
insert into USES (c_id, e_id)
values (658, 654);
insert into USES (c_id, e_id)
values (659, 499);
insert into USES (c_id, e_id)
values (660, 418);
insert into USES (c_id, e_id)
values (663, 675);
insert into USES (c_id, e_id)
values (664, 370);
insert into USES (c_id, e_id)
values (665, 139);
insert into USES (c_id, e_id)
values (669, 134);
insert into USES (c_id, e_id)
values (669, 431);
insert into USES (c_id, e_id)
values (674, 719);
insert into USES (c_id, e_id)
values (678, 432);
insert into USES (c_id, e_id)
values (679, 266);
insert into USES (c_id, e_id)
values (681, 237);
insert into USES (c_id, e_id)
values (690, 147);
insert into USES (c_id, e_id)
values (694, 90);
insert into USES (c_id, e_id)
values (695, 176);
insert into USES (c_id, e_id)
values (696, 592);
insert into USES (c_id, e_id)
values (697, 698);
insert into USES (c_id, e_id)
values (700, 570);
insert into USES (c_id, e_id)
values (702, 130);
insert into USES (c_id, e_id)
values (704, 210);
insert into USES (c_id, e_id)
values (707, 503);
insert into USES (c_id, e_id)
values (708, 498);
insert into USES (c_id, e_id)
values (711, 614);
insert into USES (c_id, e_id)
values (715, 611);
insert into USES (c_id, e_id)
values (717, 187);
insert into USES (c_id, e_id)
values (717, 229);
insert into USES (c_id, e_id)
values (718, 509);
insert into USES (c_id, e_id)
values (719, 520);
insert into USES (c_id, e_id)
values (723, 86);
insert into USES (c_id, e_id)
values (730, 503);
insert into USES (c_id, e_id)
values (731, 379);
insert into USES (c_id, e_id)
values (731, 653);
insert into USES (c_id, e_id)
values (732, 401);
insert into USES (c_id, e_id)
values (736, 478);
insert into USES (c_id, e_id)
values (739, 147);
insert into USES (c_id, e_id)
values (741, 310);
insert into USES (c_id, e_id)
values (741, 686);
insert into USES (c_id, e_id)
values (743, 509);
insert into USES (c_id, e_id)
values (744, 337);
insert into USES (c_id, e_id)
values (745, 610);
insert into USES (c_id, e_id)
values (752, 544);
insert into USES (c_id, e_id)
values (755, 21);
insert into USES (c_id, e_id)
values (755, 286);
insert into USES (c_id, e_id)
values (758, 536);
insert into USES (c_id, e_id)
values (758, 603);
insert into USES (c_id, e_id)
values (760, 295);
insert into USES (c_id, e_id)
values (760, 678);
insert into USES (c_id, e_id)
values (765, 703);
insert into USES (c_id, e_id)
values (766, 108);
insert into USES (c_id, e_id)
values (769, 402);
insert into USES (c_id, e_id)
values (769, 684);
insert into USES (c_id, e_id)
values (774, 512);
insert into USES (c_id, e_id)
values (774, 627);
insert into USES (c_id, e_id)
values (774, 690);
insert into USES (c_id, e_id)
values (779, 458);
insert into USES (c_id, e_id)
values (780, 88);
insert into USES (c_id, e_id)
values (785, 289);
insert into USES (c_id, e_id)
values (789, 376);
insert into USES (c_id, e_id)
values (789, 455);
insert into USES (c_id, e_id)
values (802, 499);
insert into USES (c_id, e_id)
values (805, 37);
insert into USES (c_id, e_id)
values (806, 357);
insert into USES (c_id, e_id)
values (808, 490);
insert into USES (c_id, e_id)
values (810, 356);
insert into USES (c_id, e_id)
values (812, 700);
insert into USES (c_id, e_id)
values (814, 265);
insert into USES (c_id, e_id)
values (817, 640);
insert into USES (c_id, e_id)
values (819, 371);
insert into USES (c_id, e_id)
values (821, 135);
insert into USES (c_id, e_id)
values (821, 599);
insert into USES (c_id, e_id)
values (823, 614);
insert into USES (c_id, e_id)
values (826, 199);
insert into USES (c_id, e_id)
values (828, 696);
insert into USES (c_id, e_id)
values (829, 6);
insert into USES (c_id, e_id)
values (829, 504);
commit;
prompt 400 records loaded
prompt Enabling foreign key constraints for BELONGS...
alter table BELONGS enable constraint SYS_C007210;
prompt Enabling foreign key constraints for TEACHES_THE...
alter table TEACHES_THE enable constraint SYS_C007185;
alter table TEACHES_THE enable constraint SYS_C007186;
prompt Enabling foreign key constraints for USES...
alter table USES enable constraint SYS_C007114;
alter table USES enable constraint SYS_C007115;
prompt Enabling triggers for PARTICIPANTS...
alter table PARTICIPANTS enable all triggers;
prompt Enabling triggers for BELONGS...
alter table BELONGS enable all triggers;
prompt Enabling triggers for COURSES...
alter table COURSES enable all triggers;
prompt Enabling triggers for EQUIPMENT...
alter table EQUIPMENT enable all triggers;
prompt Enabling triggers for LECTURERS...
alter table LECTURERS enable all triggers;
prompt Enabling triggers for ROOM...
alter table ROOM enable all triggers;
prompt Enabling triggers for STUDENTSGROUP...
alter table STUDENTSGROUP enable all triggers;
prompt Enabling triggers for TEACHES_THE...
alter table TEACHES_THE enable all triggers;
prompt Enabling triggers for USES...
alter table USES enable all triggers;
set feedback on
set define on
prompt Done.
