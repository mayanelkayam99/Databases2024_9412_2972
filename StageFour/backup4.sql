prompt PL/SQL Developer import file
prompt Created on יום ראשון 21 יולי 2024 by DELL
set feedback off
set define off
prompt Creating AMBULANS...
create table AMBULANS
(
  locaation    VARCHAR2(30) not null,
  ambulance_id INTEGER not null,
  ambulancenum INTEGER not null,
  tipe         VARCHAR2(30) not null,
  status       VARCHAR2(30) not null
)
;
alter table AMBULANS
  add primary key (AMBULANCE_ID)
 ;

prompt Creating VOLUNTEER...
create table VOLUNTEER
(
  volunteer_id VARCHAR2(20) not null,
  naame        VARCHAR2(35) not null,
  phonnum      INTEGER not null,
  address      VARCHAR2(60) not null,
  dateofbirth  DATE not null
)
;
alter table VOLUNTEER
  add primary key (VOLUNTEER_ID)
 ;

prompt Creating PARAMEDIC...
create table PARAMEDIC
(
  medical_degree VARCHAR2(30) not null,
  seniority      INTEGER not null,
  volunteer_id   VARCHAR2(20) not null
)
;
alter table PARAMEDIC
  add primary key (VOLUNTEER_ID)
  ;
alter table PARAMEDIC
  add foreign key (VOLUNTEER_ID)
  references VOLUNTEER (VOLUNTEER_ID);

prompt Creating SHIFT...
create table SHIFT
(
  shift_id_    INTEGER not null,
  daate        DATE not null,
  starttime    VARCHAR2(5) not null,
  endtime      VARCHAR2(5) not null,
  volunteer_id VARCHAR2(20) not null
)
;
alter table SHIFT
  add primary key (SHIFT_ID_)
  ;
alter table SHIFT
  add foreign key (VOLUNTEER_ID)
  references PARAMEDIC (VOLUNTEER_ID);

prompt Creating EVENT...
create table EVENT
(
  event_id     INTEGER not null,
  deescription VARCHAR2(60) not null,
  locaation    VARCHAR2(30) not null,
  date_time    DATE not null,
  shift_id_    INTEGER not null
)
;
alter table EVENT
  add primary key (EVENT_ID)
 ;
alter table EVENT
  add foreign key (SHIFT_ID_)
  references SHIFT (SHIFT_ID_);

prompt Creating AMBUTOEVENT...
create table AMBUTOEVENT
(
  ambulance_id INTEGER not null,
  event_id     INTEGER not null
)
;
alter table AMBUTOEVENT
  add primary key (AMBULANCE_ID, EVENT_ID)
 ;
alter table AMBUTOEVENT
  add foreign key (AMBULANCE_ID)
  references AMBULANS (AMBULANCE_ID);
alter table AMBUTOEVENT
  add foreign key (EVENT_ID)
  references EVENT (EVENT_ID);

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
alter table LECTURERS
  add constraint CHK_L_DATE_BEFORE_2025
  check (l_date < TO_DATE('2025-01-01','YYYY-MM-DD'));

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
  g_id         NUMBER(10) not null,
  volunteer_id VARCHAR2(20) not null
)
;
alter table BELONGS
  add constraint FK_BELONGS primary key (G_ID, VOLUNTEER_ID)
  ;
alter table BELONGS
  add constraint FK_BELONGS_VOLUNTEER foreign key (VOLUNTEER_ID)
  references VOLUNTEER (VOLUNTEER_ID);
alter table BELONGS
  add foreign key (G_ID)
  references STUDENTSGROUP (G_ID);

prompt Creating DRIVER...
create table DRIVER
(
  licensenum   INTEGER not null,
  volunteer_id VARCHAR2(20) not null
)
;
alter table DRIVER
  add primary key (VOLUNTEER_ID)
  ;
alter table DRIVER
  add foreign key (VOLUNTEER_ID)
  references VOLUNTEER (VOLUNTEER_ID);

prompt Creating DRIVERINSHIFT...
create table DRIVERINSHIFT
(
  volunteer_id VARCHAR2(20) not null,
  shift_id_    INTEGER not null
)
;
alter table DRIVERINSHIFT
  add primary key (VOLUNTEER_ID, SHIFT_ID_)
  ;
alter table DRIVERINSHIFT
  add foreign key (VOLUNTEER_ID)
  references DRIVER (VOLUNTEER_ID);
alter table DRIVERINSHIFT
  add foreign key (SHIFT_ID_)
  references SHIFT (SHIFT_ID_);

prompt Creating DRIVERTOAMBU...
create table DRIVERTOAMBU
(
  volunteer_id VARCHAR2(20) not null,
  ambulance_id INTEGER not null
)
;
alter table DRIVERTOAMBU
  add primary key (VOLUNTEER_ID, AMBULANCE_ID)
 ;
alter table DRIVERTOAMBU
  add foreign key (VOLUNTEER_ID)
  references DRIVER (VOLUNTEER_ID);
alter table DRIVERTOAMBU
  add foreign key (AMBULANCE_ID)
  references AMBULANS (AMBULANCE_ID);

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
alter table EQUIPMENT
  add constraint CHK_AMOUNT_NONNEGATIVE
  check (amount>=0);

prompt Creating HAS...
create table HAS
(
  ambulance_id INTEGER not null,
  e_id         NUMBER(10) not null
)
;
alter table HAS
  add primary key (AMBULANCE_ID, E_ID)
  ;
alter table HAS
  add foreign key (AMBULANCE_ID)
  references AMBULANS (AMBULANCE_ID);
alter table HAS
  add foreign key (E_ID)
  references EQUIPMENT (E_ID);

prompt Creating MEDIC...
create table MEDIC
(
  seniority    INTEGER not null,
  volunteer_id VARCHAR2(20) not null
)
;
alter table MEDIC
  add primary key (VOLUNTEER_ID)
  ;
alter table MEDIC
  add foreign key (VOLUNTEER_ID)
  references VOLUNTEER (VOLUNTEER_ID);

prompt Creating MADICINSHIFT...
create table MADICINSHIFT
(
  shift_id_    INTEGER not null,
  volunteer_id VARCHAR2(20) not null
)
;
alter table MADICINSHIFT
  add primary key (SHIFT_ID_, VOLUNTEER_ID)
  ;
alter table MADICINSHIFT
  add foreign key (SHIFT_ID_)
  references SHIFT (SHIFT_ID_);
alter table MADICINSHIFT
  add foreign key (VOLUNTEER_ID)
  references MEDIC (VOLUNTEER_ID);

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

prompt Disabling triggers for AMBULANS...
alter table AMBULANS disable all triggers;
prompt Disabling triggers for VOLUNTEER...
alter table VOLUNTEER disable all triggers;
prompt Disabling triggers for PARAMEDIC...
alter table PARAMEDIC disable all triggers;
prompt Disabling triggers for SHIFT...
alter table SHIFT disable all triggers;
prompt Disabling triggers for EVENT...
alter table EVENT disable all triggers;
prompt Disabling triggers for AMBUTOEVENT...
alter table AMBUTOEVENT disable all triggers;
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
prompt Disabling triggers for DRIVER...
alter table DRIVER disable all triggers;
prompt Disabling triggers for DRIVERINSHIFT...
alter table DRIVERINSHIFT disable all triggers;
prompt Disabling triggers for DRIVERTOAMBU...
alter table DRIVERTOAMBU disable all triggers;
prompt Disabling triggers for EQUIPMENT...
alter table EQUIPMENT disable all triggers;
prompt Disabling triggers for HAS...
alter table HAS disable all triggers;
prompt Disabling triggers for MEDIC...
alter table MEDIC disable all triggers;
prompt Disabling triggers for MADICINSHIFT...
alter table MADICINSHIFT disable all triggers;
prompt Disabling triggers for TEACHES_THE...
alter table TEACHES_THE disable all triggers;
prompt Disabling triggers for USES...
alter table USES disable all triggers;
prompt Disabling foreign key constraints for PARAMEDIC...
alter table PARAMEDIC disable constraint SYS_C009135;
prompt Disabling foreign key constraints for SHIFT...
alter table SHIFT disable constraint SYS_C009142;
prompt Disabling foreign key constraints for EVENT...
alter table EVENT disable constraint SYS_C009149;
prompt Disabling foreign key constraints for AMBUTOEVENT...
alter table AMBUTOEVENT disable constraint SYS_C009153;
alter table AMBUTOEVENT disable constraint SYS_C009154;
prompt Disabling foreign key constraints for STUDENTSGROUP...
alter table STUDENTSGROUP disable constraint SYS_C009036;
alter table STUDENTSGROUP disable constraint SYS_C009037;
alter table STUDENTSGROUP disable constraint SYS_C009038;
prompt Disabling foreign key constraints for BELONGS...
alter table BELONGS disable constraint FK_BELONGS_VOLUNTEER;
alter table BELONGS disable constraint SYS_C009042;
prompt Disabling foreign key constraints for DRIVER...
alter table DRIVER disable constraint SYS_C009158;
prompt Disabling foreign key constraints for DRIVERINSHIFT...
alter table DRIVERINSHIFT disable constraint SYS_C009162;
alter table DRIVERINSHIFT disable constraint SYS_C009163;
prompt Disabling foreign key constraints for DRIVERTOAMBU...
alter table DRIVERTOAMBU disable constraint SYS_C009167;
alter table DRIVERTOAMBU disable constraint SYS_C009168;
prompt Disabling foreign key constraints for HAS...
alter table HAS disable constraint SYS_C009195;
alter table HAS disable constraint SYS_C009196;
prompt Disabling foreign key constraints for MEDIC...
alter table MEDIC disable constraint SYS_C009172;
prompt Disabling foreign key constraints for MADICINSHIFT...
alter table MADICINSHIFT disable constraint SYS_C009176;
alter table MADICINSHIFT disable constraint SYS_C009177;
prompt Disabling foreign key constraints for TEACHES_THE...
alter table TEACHES_THE disable constraint SYS_C009053;
alter table TEACHES_THE disable constraint SYS_C009054;
prompt Disabling foreign key constraints for USES...
alter table USES disable constraint SYS_C009058;
alter table USES disable constraint SYS_C009059;
prompt Deleting USES...
delete from USES;
commit;
prompt Deleting TEACHES_THE...
delete from TEACHES_THE;
commit;
prompt Deleting MADICINSHIFT...
delete from MADICINSHIFT;
commit;
prompt Deleting MEDIC...
delete from MEDIC;
commit;
prompt Deleting HAS...
delete from HAS;
commit;
prompt Deleting EQUIPMENT...
delete from EQUIPMENT;
commit;
prompt Deleting DRIVERTOAMBU...
delete from DRIVERTOAMBU;
commit;
prompt Deleting DRIVERINSHIFT...
delete from DRIVERINSHIFT;
commit;
prompt Deleting DRIVER...
delete from DRIVER;
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
prompt Deleting AMBUTOEVENT...
delete from AMBUTOEVENT;
commit;
prompt Deleting EVENT...
delete from EVENT;
commit;
prompt Deleting SHIFT...
delete from SHIFT;
commit;
prompt Deleting PARAMEDIC...
delete from PARAMEDIC;
commit;
prompt Deleting VOLUNTEER...
delete from VOLUNTEER;
commit;
prompt Deleting AMBULANS...
delete from AMBULANS;
commit;
prompt Loading AMBULANS...
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Tel Aviv', 1, 101, 'TypeA', 'Available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Jerusalem', 2, 102, 'TypeB', 'Unavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Haifa', 3, 103, 'TypeC', 'Available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Beersheba', 4, 104, 'TypeD', 'Unavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Rishon LeZion', 5, 105, 'TypeA', 'Available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Petah Tikva', 6, 106, 'TypeB', 'Unavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Ashdod', 7, 107, 'TypeC', 'Available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Netanya', 8, 108, 'TypeD', 'Unavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Holon', 9, 109, 'TypeA', 'Available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Bnei Brak', 10, 110, 'TypeB', 'Unavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Gifu', 11111, 111, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Manchester', 11112, 112, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('West Lafayette', 11113, 113, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Berwyn', 11114, 114, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Courbevoie', 11115, 115, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Bruxelles', 11116, 116, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Green bay', 11117, 117, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Reisterstown', 11118, 118, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Key Biscayne', 11119, 119, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('South Hadley', 11120, 120, 'Van', 'Unavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Thessaloniki', 11121, 121, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Boucherville', 11122, 122, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Bologna', 11123, 123, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Framingham', 11124, 124, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Los Alamos', 11125, 125, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Rorschach', 11126, 126, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('High Wycombe', 11127, 127, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Lן¢•beck', 11128, 128, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Toyama', 11129, 129, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Golden', 11130, 130, 'Van', 'assigned');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Pasadena', 11131, 131, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Hong Kong', 11132, 132, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Los Angeles', 11133, 133, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Kuopio', 11134, 134, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Oak park', 11135, 135, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Claymont', 11136, 136, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Nagasaki', 11137, 137, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Adamstown', 11138, 138, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Billund', 11139, 139, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Oosterhout', 11140, 140, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Durban', 11141, 141, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Echirolles', 11142, 142, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Coburg', 11143, 143, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Le chesnay', 11144, 144, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('San Jose', 11145, 145, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Moorestown', 11146, 146, 'motorcycle', 'Unavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Gattico', 11147, 147, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Mechelen', 11148, 148, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Yogyakarta', 11149, 149, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Sidney', 11150, 150, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Johannesburg', 11151, 151, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Edenbridge', 11152, 152, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Slmea', 11153, 153, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Mason', 11154, 154, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Saudarkrokur', 11155, 155, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Stellenbosch', 11156, 156, 'motorcycle', 'Unavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Birmingham', 11157, 157, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Koppl', 11158, 158, 'Van', 'Unavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Helsingborg', 11159, 159, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Warszawa', 11160, 160, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Lyon', 11161, 161, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Hines', 11162, 162, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Ben-Gurion', 11163, 163, 'Van', 'assigned');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Barbengo', 11164, 164, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Laguna Bbeach', 11165, 165, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Enschede', 11166, 166, 'Van', 'Unavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Chirignago', 11167, 167, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Ingelheim', 11168, 168, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Utsunomiya', 11169, 169, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Kozani', 11170, 170, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Lexington', 11171, 171, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('The Woodlands', 11172, 172, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Fornacette', 11173, 173, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Bingham Farms', 11174, 174, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Arlington', 11175, 175, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Stafford', 11176, 176, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Somerset', 11177, 177, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Rockville', 11178, 178, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Syracuse', 11179, 179, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Alcobendas', 11180, 180, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Eden prairie', 11181, 181, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Dresden', 11182, 182, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Chorz׳£w', 11183, 183, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Richmond Hill', 11184, 184, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Cesena', 11185, 185, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Maarssen', 11186, 186, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Glasgow', 11187, 187, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('K׳¦ln', 11188, 188, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Boucherville', 11189, 189, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Angers', 11190, 190, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Milsons Point', 11191, 191, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Saitama', 11192, 192, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Durham', 11193, 193, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Tucson', 11194, 194, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Heiligenhaus', 11195, 195, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Manchester', 11196, 196, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Waalwijk', 11197, 197, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Miyazaki', 11198, 198, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Ipswich', 11199, 199, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Mclean', 11200, 200, 'motorcycle', 'available');
commit;
prompt 100 records committed...
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Herdecke', 11201, 201, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Farnham', 11202, 202, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Tilst', 11203, 203, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Goteborg', 11204, 204, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Hermitage', 11205, 205, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Eindhoven', 11206, 206, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Biella', 11207, 207, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Heubach', 11208, 208, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Vanderbijlpark', 11209, 209, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Fukuoka', 11210, 210, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Annandale', 11211, 211, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Yavne', 11212, 212, 'Van', 'Unavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Osaka', 11213, 213, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Taoyuan', 11214, 214, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Santa Clarita', 11215, 215, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Altamonte Sprin', 11216, 216, 'Van', 'assigned');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Ringwood', 11217, 217, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Changwon-si', 11218, 218, 'motorcycle', 'Unavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Madrid', 11219, 219, 'Van', 'Unavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Yogyakarta', 11220, 220, 'motorcycle', 'assigned');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Austin', 11221, 221, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Reston', 11222, 222, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Bruxelles', 11223, 223, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Lake Forest', 11224, 224, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Banbury', 11225, 225, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Marburg', 11226, 226, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('H׳”ssleholm', 11227, 227, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Royston', 11228, 228, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Monterrey', 11229, 229, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Bradenton', 11230, 230, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Longueuil', 11231, 231, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Ponta grossa', 11232, 232, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('durham', 11233, 233, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Sao caetano do ', 11234, 234, 'Van', 'Unavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Santa rita sapu', 11235, 235, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Charleston', 11236, 236, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Charlotte', 11237, 237, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Tottori', 11238, 238, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Pointe-claire', 11239, 239, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Sursee', 11240, 240, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Huntington', 11241, 241, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Pusan-city', 11242, 242, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Dallas', 11243, 243, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Berlin-Adlersho', 11244, 244, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Sapporo', 11245, 245, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Valencia', 11246, 246, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Kagoshima', 11247, 247, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Kagoshima', 11248, 248, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Braintree', 11249, 249, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Golden', 11250, 250, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Stavanger', 11251, 251, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Or-yehuda', 11252, 252, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Niles', 11253, 253, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Copenhagen', 11254, 254, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Herdecke', 11255, 255, 'motorcycle', 'Unavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Hyderabad', 11256, 256, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Lubbock', 11257, 257, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Ani׳˜res', 11258, 258, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Brno', 11259, 259, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Bristol', 11260, 260, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Magstadt', 11261, 261, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Pearland', 11262, 262, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Storrington', 11263, 263, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Baarn', 11264, 264, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Essen', 11265, 265, 'Van', 'Unavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Ashdod', 11266, 266, 'Van', 'Unavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Szazhalombatta', 11267, 267, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('San Ramon', 11268, 268, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Westfield', 11269, 269, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Amarillo', 11270, 270, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Greenville', 11271, 271, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Casselberry', 11272, 272, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Mount Laurel', 11273, 273, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Stockholm', 11274, 274, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Vienna', 11275, 275, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Baarn', 11276, 276, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Colombo', 11277, 277, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Altamonte Sprin', 11278, 278, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Lexington', 11279, 279, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Daejeon', 11280, 280, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Madrid', 11281, 281, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Warsaw', 11282, 282, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Bonn', 11283, 283, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Gifu', 11284, 284, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Winnipeg', 11285, 285, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Nicosia', 11286, 286, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Fuchstal-asch', 11287, 287, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Wuerzburg', 11288, 288, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Ferraz  vasconc', 11289, 289, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Lefkosa', 11290, 290, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Cobham', 11291, 291, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Clark', 11292, 292, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Bracknell', 11293, 293, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Biella', 11294, 294, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Swannanoa', 11295, 295, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Frederiksberg', 11296, 296, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('League city', 11297, 297, 'motorcycle', 'Unavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Venice', 11298, 298, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Potsdam', 11299, 299, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Holderbank', 11300, 300, 'Van', 'available');
commit;
prompt 200 records committed...
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Jun-nam', 11301, 301, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Yokohama', 11302, 302, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Edmonton', 11303, 303, 'Van', 'Unavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Thessaloniki', 11304, 304, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Courbevoie', 11305, 305, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Newnan', 11306, 306, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Annandale', 11307, 307, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Orange', 11308, 308, 'Van', 'Unavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Timonium', 11309, 309, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Lima', 11310, 310, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Birmensdorf', 11311, 311, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('L''union', 11312, 312, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Raleigh', 11313, 313, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Toledo', 11314, 314, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Leeds', 11315, 315, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Ebersberg', 11316, 316, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Coventry', 11317, 317, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Tampa', 11318, 318, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Ciudad del Este', 11319, 319, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Vallauris', 11320, 320, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Atlanta', 11321, 321, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Caguas', 11322, 322, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Colorado Spring', 11323, 323, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Aurora', 11324, 324, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Brugherio', 11325, 325, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Wellington', 11326, 326, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Stony Point', 11327, 327, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Valencia', 11328, 328, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Frankfurt', 11329, 329, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Heiligenhaus', 11330, 330, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Huntsville', 11331, 331, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Olivette', 11332, 332, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Monterrey', 11333, 333, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Johor Bahru', 11334, 334, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Yomgok-dong', 11335, 335, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Pulheim-brauwei', 11336, 336, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Rosario', 11337, 337, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Budapest', 11338, 338, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Yavne', 11339, 339, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Middleburg Heig', 11340, 340, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Marlboro', 11341, 341, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Lenexa', 11342, 342, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Hayward', 11343, 343, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Schlieren', 11344, 344, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Alleroed', 11345, 345, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Brussel', 11346, 346, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Oulu', 11347, 347, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Tbilisi', 11348, 348, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Malm׳¦', 11349, 349, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Goteborg', 11350, 350, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Blue bell', 11351, 351, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Hayward', 11352, 352, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Bern', 11353, 353, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Long Island Cit', 11354, 354, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Itu', 11355, 355, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Mainz-kastel', 11356, 356, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Oldham', 11357, 357, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Ilmenau', 11358, 358, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Leeds', 11359, 359, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Parsippany', 11360, 360, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Farnham', 11361, 361, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Bremen', 11362, 362, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Nuernberg', 11363, 363, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Kaiserslautern', 11364, 364, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Irati', 11365, 365, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Turku', 11366, 366, 'motorcycle', 'Unavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Athens', 11367, 367, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('H׳”ssleholm', 11368, 368, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Heiligenhaus', 11369, 369, 'Van', 'Unavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Rome', 11370, 370, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Green bay', 11371, 371, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Bern', 11372, 372, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Orange', 11373, 373, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Magstadt', 11374, 374, 'motorcycle', 'Unavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Sulzbach', 11375, 375, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Archbold', 11376, 376, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Middletown', 11377, 377, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Gaza', 11378, 378, 'Van', 'Unavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Niigata', 11379, 379, 'Van', 'Unavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Santorso', 11380, 380, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Koeln', 11381, 381, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Herndon', 11382, 382, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Zן¢•rich', 11383, 383, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Mumbai', 11384, 384, 'Van', 'Unavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Stocksbridge', 11385, 385, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Longview', 11386, 386, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Libertyville', 11387, 387, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Laredo', 11388, 388, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Paramus', 11389, 389, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Media', 11390, 390, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Reno', 11391, 391, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Tadley', 11392, 392, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Washington', 11393, 393, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Lucca', 11394, 394, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Duluth', 11395, 395, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Hounslow', 11396, 396, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Marburg', 11397, 397, 'Van', 'Unavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Shoreline', 11398, 398, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Vaduz', 11399, 399, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Chambersburg', 11400, 400, 'Van', 'available');
commit;
prompt 300 records committed...
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Antwerpen', 11401, 401, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Rtp', 11402, 402, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Pirmasens', 11403, 403, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Amsterdam', 11404, 404, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Brisbane', 11405, 405, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Northampton', 11406, 406, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Stony Point', 11407, 407, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Barbengo', 11408, 408, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Royersford', 11409, 409, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Herford', 11410, 410, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Toulouse', 11411, 411, 'motorcycle', 'Unavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Port Macquarie', 11412, 412, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Lund', 11413, 413, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Araras', 11414, 414, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Kanata', 11415, 415, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Yamagata', 11416, 416, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Charleston', 11417, 417, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Bekescsaba', 11418, 418, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Solikamsk', 11419, 419, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Oulu', 11420, 420, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Brisbane', 11421, 421, 'Van', 'assigned');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Hackensack', 11422, 422, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Tokyo', 11423, 423, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Hiroshima', 11424, 424, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Chinnor', 11425, 425, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('League city', 11426, 426, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('North Wales', 11427, 427, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Hjallerup', 11428, 428, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Olsztyn', 11429, 429, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Pensacola', 11430, 430, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Anchorage', 11431, 431, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Wehrheim', 11432, 432, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Uden', 11433, 433, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Pulheim-brauwei', 11434, 434, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Bras׳lia', 11435, 435, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Kaiserslautern', 11436, 436, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Odense', 11437, 437, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('New boston', 11438, 438, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Warley', 11439, 439, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Rio Rancho', 11440, 440, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Wetzlar', 11441, 441, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Lima', 11442, 442, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Chicago', 11443, 443, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Fountain Hills', 11444, 444, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Bay Shore', 11445, 445, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Maarssen', 11446, 446, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Green bay', 11447, 447, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Forest Park', 11448, 448, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Brugherio', 11449, 449, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Petach-Tikva', 11450, 450, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Geneve', 11451, 451, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Rochester', 11452, 452, 'Van', 'Unavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Taipei', 11453, 453, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Pusan', 11454, 454, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Mendoza', 11455, 455, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Bangalore', 11456, 456, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Paisley', 11457, 457, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Mechelen', 11458, 458, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Akita', 11459, 459, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Tartu', 11460, 460, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Framingham', 11461, 461, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Zן¢•rich', 11462, 462, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Rotterdam', 11463, 463, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Laredo', 11464, 464, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Crete', 11465, 465, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Altamonte Sprin', 11466, 466, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('South Jordan', 11467, 467, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Glen Cove', 11468, 468, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Maidstone', 11469, 469, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Salt Lake City', 11470, 470, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('North Point', 11471, 471, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Bad Camberg', 11472, 472, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Palma de Mallor', 11473, 473, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Carlsbad', 11474, 474, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('London', 11475, 475, 'Van', 'Unavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Belgrad', 11476, 476, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Thame', 11477, 477, 'motorcycle', 'Unavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Cottbus', 11478, 478, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Staten Island', 11479, 479, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Palo Alto', 11480, 480, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Gersthofen', 11481, 481, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Sale', 11482, 482, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('G׳”vle', 11483, 483, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Perth', 11484, 484, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Belgrad', 11485, 485, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Kungki', 11486, 486, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Clark', 11487, 487, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Tulsa', 11488, 488, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Southend on Sea', 11489, 489, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Tilst', 11490, 490, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('San Antonio', 11491, 491, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Hercules', 11492, 492, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Ramat Gan', 11493, 493, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Gaithersburg', 11494, 494, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Fredericia', 11495, 495, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Bradenton', 11496, 496, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Solikamsk', 11497, 497, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Harrisburg', 11498, 498, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Bartlesville', 11499, 499, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Arlington', 11500, 500, 'Van', 'notavailable');
commit;
prompt 400 records committed...
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('El Segundo', 11501, 501, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Mablethorpe', 11502, 502, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Ramat Gan', 11503, 503, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('N. ft. Myers', 11504, 504, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Ramat Gan', 11505, 505, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Amsterdam', 11506, 506, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Friedrichshafe', 11507, 507, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Odense', 11508, 508, 'Van', 'Unavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Ribeirao preto', 11509, 509, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Coldmeece', 11510, 510, 'Van', 'available');
commit;
prompt 410 records loaded
prompt Loading VOLUNTEER...
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('1', 'John Doe', 1234567890, '123 Herzl St, Tel Aviv', to_date('01-01-1980', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('2', 'Jane Smith', 2345678901, '456 Ben Yehuda St, Jerusalem', to_date('02-02-1985', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('3', 'Emily Jones', 3456789012, '789 Hanassi St, Haifa', to_date('03-03-1990', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('4', 'Michael Brown', 4567890123, '101 David Ben Gurion Blvd, Beersheba', to_date('04-04-1995', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('5', 'Sarah Davis', 5678901234, '202 Rothschild Blvd, Rishon LeZion', to_date('05-05-2000', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('6', 'David Wilson', 6789012345, '303 Jabotinsky St, Petah Tikva', to_date('06-06-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('7', 'Laura Martinez', 7890123456, '404 Bialik St, Ashdod', to_date('07-07-1986', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('8', 'James Garcia', 8901234567, '505 Herzl St, Netanya', to_date('08-08-1991', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('9', 'Emma Anderson', 9012345678, '606 Weizmann St, Holon', to_date('09-09-1996', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('10', 'Daniel Taylor', 1234567809, '707 Jabotinsky St, Bnei Brak', to_date('10-10-2001', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11111', 'KurtFisher', 4972396788, '41 Franks Ave', to_date('07-05-1998', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11112', 'ChazzDayne', 8763362161, '881 Brandt Street', to_date('04-05-1980', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11113', 'AntonioVicious', 8515778176, '82 Garner Drive', to_date('12-04-1991', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11114', 'IlleanaEnglund', 6755578227, '11 Douglas Road', to_date('01-06-1996', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11115', 'DenisCollette', 7632578449, '66 Calgary Road', to_date('05-03-1984', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11116', 'RobertCoburn', 3653938363, '62 Alpharetta Road', to_date('19-01-2001', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11117', 'AntonioMacNeil', 5467244281, '2 Hatfield Street', to_date('11-01-1983', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11118', 'KidMorton', 1158721895, '82 Syracuse Ave', to_date('01-07-1987', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11119', 'TemueraBroza', 8469688441, '97 Embeth Street', to_date('20-01-1985', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11120', 'NilsGano', 3826123758, '35 Spector Road', to_date('28-05-1994', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11121', 'GilbertRonstadt', 3214577468, '92 Holly Road', to_date('02-12-2000', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11122', 'JeroenShandling', 2152391251, '14 Imbruglia Street', to_date('26-09-2001', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11123', 'KaseyGreene', 6729879512, '12nd Street', to_date('29-08-1992', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11124', 'TramaineBerkeley', 6468629339, '92 Lorraine Drive', to_date('16-08-1993', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11125', 'RoscoeBeckinsale', 9425549363, '47 Hawn Drive', to_date('15-07-1996', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11126', 'BarryMichael', 8766891857, '75 Mandrell Street', to_date('21-10-1989', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11127', 'OssieLennox', 3993667811, '53 Jackson', to_date('19-02-1983', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11128', 'JuniorSoul', 6766172186, '25 Donovan Street', to_date('07-11-1994', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11129', 'MosNelson', 3655386595, '45 Judd Blvd', to_date('20-04-1996', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11130', 'CevinJackman', 1153428164, '63 Sandoval Drive', to_date('10-11-1994', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11131', 'VincentFichtner', 8541314722, '345 Schlieren', to_date('11-06-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11132', 'ChaleeSampson', 5473322267, '72 Malcolm Drive', to_date('25-10-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11133', 'CeCeDiCaprio', 9369769488, '86 Aykroyd', to_date('02-12-1993', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11134', 'JoshuaRossellini', 9845931291, '42 Chazz Road', to_date('21-03-2002', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11135', 'Bobbyde Lancie', 8572624826, '82 Lindley', to_date('28-04-1997', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11136', 'TiaChan', 7275696323, '99 Beckinsale Road', to_date('28-05-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11137', 'DonalAbraham', 7935533854, '61 Griffith', to_date('17-01-2002', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11138', 'PatriciaDiBiasio', 2516673514, '13rd Street', to_date('09-05-2001', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11139', 'DebbieHackman', 1163639298, '5 Cloris Drive', to_date('20-10-1997', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11140', 'KingLerner', 6894829446, '45 Randal Street', to_date('30-12-1997', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11141', 'WaymanCreek', 2489353759, '92nd Street', to_date('26-05-1997', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11142', 'SydneyHanks', 7273543563, '21 Orange Road', to_date('31-01-1982', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11143', 'NilsPaul', 2946561221, '37 Monterey Road', to_date('26-09-1999', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11144', 'PragaD''Onofrio', 9684852994, '90 Steven Road', to_date('24-02-1982', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11145', 'WaymanGriffin', 9627287343, '45 Cheshire Street', to_date('13-03-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11146', 'ShannynSalonga', 1687378646, '31 Morgan Ave', to_date('16-12-1991', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11147', 'JaneaneSchwarzenegge', 2714346883, '61st Street', to_date('06-02-1984', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11148', 'AngieMartin', 3446959319, '42nd Street', to_date('22-04-1998', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11149', 'LoreenaKadison', 2145286218, '37 McClinton Drive', to_date('10-05-1987', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11150', 'ThoraViterelli', 4413772679, '76 Stocksbridge Drive', to_date('02-06-1995', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11151', 'MariePayne', 6449436267, '64 Treviso Blvd', to_date('05-06-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11152', 'OlgaCara', 8326941235, '77 Butler Ave', to_date('01-08-1988', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11153', 'SeannDuvall', 2157393779, '242 Anderson Drive', to_date('03-10-2000', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11154', 'DiamondGordon', 8822363394, '121 Gin Street', to_date('10-06-2001', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11155', 'JoeyCrimson', 4348623846, '78 Bernex Ave', to_date('21-11-1997', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11156', 'KatieHolly', 8292278113, '710 Todd Street', to_date('26-03-1997', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11157', 'HilaryChecker', 6441542643, '889 Pordenone Street', to_date('15-07-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11158', 'WayneFaithfull', 3788482575, '63 Mira Blvd', to_date('19-06-1985', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11159', 'RonNielsen', 3244547162, '58 Stigers', to_date('12-05-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11160', 'JoseBarkin', 6789684185, '18 Ronstadt Street', to_date('19-06-1996', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11161', 'LaurieCoverdale', 7552524153, '978 Balin Street', to_date('13-06-2000', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11162', 'ChazzSchock', 1556341177, '37 Slmea Ave', to_date('16-07-2002', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11163', 'RichieGetty', 5596996384, '94 Crimson Road', to_date('14-09-1993', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11164', 'KennethBarrymore', 5221294875, '62 Candy Road', to_date('06-10-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11165', 'NicoleMcGregor', 7418381995, '63 Freiburg Road', to_date('28-09-1995', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11166', 'DanielMcDiarmid', 8165617832, '196 Glover Street', to_date('25-08-1994', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11167', 'MeredithHerrmann', 8225557193, '24 Gliwice Road', to_date('25-12-2000', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11168', 'JuliaWaite', 4239354138, '80 Stanley Street', to_date('03-12-1996', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11169', 'HowardGarr', 7149142836, '28 Biehn Street', to_date('04-12-1993', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11170', 'BenicioRowlands', 8367869263, '21st Street', to_date('18-10-1987', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11171', 'ThinLange', 9769361812, '96 Xander Street', to_date('12-08-1983', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11172', 'JayEdmunds', 5845211542, '63 Meyer', to_date('01-01-1997', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11173', 'PattyBalin', 9597913681, '57 Fox Drive', to_date('27-12-1997', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11174', 'ColeyNunn', 3598785369, '10 Claymont Ave', to_date('20-07-1983', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11175', 'TanyaDerringer', 6679817771, '42nd Street', to_date('25-04-2001', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11176', 'ChadRankin', 7177665352, '52 Fisher Road', to_date('13-11-1991', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11177', 'ArturoLuPone', 5938352517, '21st Street', to_date('19-12-1983', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11178', 'LanceDownie', 7218147989, '93 Irons Street', to_date('10-02-1990', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11179', 'ToshiroPalminteri', 5213982158, '57 Witt Road', to_date('31-08-1985', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11180', 'RipRizzo', 6352383651, '50 Washington Road', to_date('27-12-1983', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11181', 'EdPride', 4316819482, '1 Elizabeth Road', to_date('05-05-1983', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11182', 'NikkaJessee', 9671472531, '100 Melvin Ave', to_date('08-05-1996', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11183', 'ElisabethStormare', 4151719476, '53 Spector Street', to_date('20-04-2002', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11184', 'RobWainwright', 8877363564, '52 Forest Road', to_date('18-07-1984', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11185', 'VingHenstridge', 5412876567, '73rd Street', to_date('28-07-2002', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11186', 'MarkTodd', 2783662721, '31 Hayes Road', to_date('30-01-1988', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11187', 'FayeDonovan', 5139293981, '54 Everett Drive', to_date('28-03-1982', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11188', 'RoyKoyana', 9837565658, '7 Shelton Ave', to_date('11-12-1998', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11189', 'ChubbyLangella', 4917515341, '1 Shocked Road', to_date('13-12-2002', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11190', 'Ming-NaRapaport', 8224699672, '51 Johnson Drive', to_date('25-06-1983', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11191', 'GatesHeron', 7421569554, '13 Steagall Road', to_date('08-05-1990', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11192', 'NanciConroy', 6527669129, '430 Gertner Street', to_date('29-07-1980', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11193', 'HarryMitra', 9772537568, '27 Blanchett Drive', to_date('12-02-1995', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11194', 'JudiSanchez', 6671487736, '97 Elias Street', to_date('20-07-1987', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11195', 'Francesvon Sydow', 5599137813, '25 Cardiff Street', to_date('04-12-1987', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11196', 'BlairShannon', 2624541394, '48 Oxford Blvd', to_date('09-09-1998', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11197', 'GiancarloFord', 3118379162, '42nd Street', to_date('20-04-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11198', 'JefferyNielsen', 3474758151, '48 Palin Road', to_date('11-03-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11199', 'SallySoul', 8153733483, '12 Marburg Drive', to_date('23-12-1990', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11200', 'RuthUggams', 1422564138, '38 Kevn', to_date('24-10-1998', 'dd-mm-yyyy'));
commit;
prompt 100 records committed...
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11201', 'AngieNegbaur', 3145175935, '52nd Street', to_date('25-12-1993', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11202', 'AnnaTucker', 8646698362, '30 Holland Blvd', to_date('02-12-2001', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11203', 'Jonny LeeBarkin', 6885122299, '20 Reynolds Blvd', to_date('13-04-1983', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11204', 'WillieGray', 9149624945, '602 Stevie Drive', to_date('21-12-1994', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11205', 'LoreenaSaucedo', 8944449574, '220 Purley Road', to_date('20-11-1994', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11206', 'DustinSossamon', 3978734723, '41 Duisburg', to_date('17-08-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11207', 'EdieHynde', 8832438715, '17 Freddy', to_date('08-10-1998', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11208', 'AlexRomijn-Stamos', 8951674731, '54 Wetzlar Street', to_date('12-06-1985', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11209', 'HalleSteiger', 3854158734, '79 Helen Street', to_date('07-04-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11210', 'GarryRodriguez', 2215849864, '62nd Street', to_date('21-10-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11211', 'PhilipRomijn-Stamos', 6288647927, '33 Murray Ave', to_date('18-09-1997', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11212', 'HeatherSanta Rosa', 5265991299, '390 Mraz Drive', to_date('12-04-1986', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11213', 'JoannaGilliam', 1852182232, '25 Drogenbos', to_date('01-01-2002', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11214', 'RobertaGill', 5786942243, '95 Nivola', to_date('19-08-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11215', 'FredericSwank', 8154659574, '48 LuPone', to_date('11-03-1998', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11216', 'SteveBrando', 7899861691, '40 Loggia Road', to_date('08-02-1991', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11217', 'GiancarloWright', 7411985774, '61st Street', to_date('19-08-2000', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11218', 'JaimeCrouch', 6493982889, '59 de Lancie Street', to_date('17-09-1988', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11219', 'PowersTurner', 9783348128, '89 Lauren', to_date('05-12-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11220', 'TimSchwimmer', 5882133165, '31 Spencer', to_date('31-12-1985', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11221', 'ChetWeiland', 8515112286, '988 Boone Street', to_date('17-06-1996', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11222', 'KeanuCochran', 7629882319, '19 Helen Street', to_date('18-09-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11223', 'NikkaMcCabe', 5893866678, '45 Watson Road', to_date('13-03-1998', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11224', 'BretMould', 8429541885, '93rd Street', to_date('13-02-1998', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11225', 'SonaBreslin', 1547642358, '31 Carlisle Road', to_date('12-11-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11226', 'OliverVan Damme', 1437687231, '21 Coltrane Street', to_date('09-01-1989', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11227', 'EarlBuffalo', 1712948545, '83 Reubens Blvd', to_date('13-10-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11228', 'ReginaRoth', 2361174256, '941 Maxwell', to_date('06-05-1988', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11229', 'TreyPleasure', 6838476722, '42 Nivola Blvd', to_date('21-08-1998', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11230', 'GarySaucedo', 6198818941, '65 Avenged Blvd', to_date('18-01-1985', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11231', 'CurtisJudd', 9635435429, '44 Wilmington Blvd', to_date('24-11-1994', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11232', 'MerrileeVaughan', 6724966681, '5 Balk Street', to_date('14-08-1992', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11233', 'DanPhillips', 4917727476, '93rd Street', to_date('15-10-1988', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11234', 'LorettaDel Toro', 3427822471, '921 Edmunds Road', to_date('28-09-2002', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11235', 'WesleyLee', 7655636619, '75 Murphy Road', to_date('29-08-1988', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11236', 'HarveyCassidy', 9896611115, '13rd Street', to_date('07-10-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11237', 'PattyImperioli', 7916147822, '56 Fender Street', to_date('08-11-1992', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11238', 'Mary BethMelvin', 4284795986, '68 Chely Road', to_date('13-10-2002', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11239', 'CurtisShaw', 9846113411, '553 South Jordan Road', to_date('10-08-1987', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11240', 'SuziHoliday', 3112242554, '95 San Jose Blvd', to_date('19-06-1992', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11241', 'HoraceBeck', 4463698952, '45 Cleese Road', to_date('17-11-2002', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11242', 'BrendaKristofferson', 1276694876, '53 Donelly Road', to_date('13-06-1980', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11243', 'TemueraMargulies', 5354375995, '7 Bogguss', to_date('27-06-1994', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11244', 'NigelHorton', 6763739473, '66 Place Road', to_date('05-06-1982', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11245', 'VendettaBurton', 7871727777, '56 Juno Beach Drive', to_date('09-10-1994', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11246', 'JillShandling', 4273217477, '53 Ruth Street', to_date('10-04-1997', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11247', 'BuddyOszajca', 4145464524, '64 Bosco Road', to_date('01-09-1999', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11248', 'DaveyHagerty', 1598395588, '8 Dooley Road', to_date('02-05-1983', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11249', 'SeanMellencamp', 7682295877, '530 Baldwin Road', to_date('11-01-1994', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11250', 'CaseyMacDonald', 5413751229, '192 Rockwell Ave', to_date('30-04-2002', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11251', 'QuentinDiBiasio', 5998625929, '6 Imbruglia Ave', to_date('25-07-1988', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11252', 'DylanQuinlan', 2136157745, '91 Ebersdorf', to_date('05-01-1998', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11253', 'GaryBiehn', 2273667171, '15 Noumea Street', to_date('08-11-2001', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11254', 'MykeltiChapman', 1655332134, '866 Aida Road', to_date('13-07-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11255', 'LaurenSalonga', 5559313273, '88 Lenny Street', to_date('18-10-1987', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11256', 'JenaConnick', 2134639812, '42nd Street', to_date('28-01-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11257', 'HarveyBlaine', 9165396336, '21 Heald Street', to_date('05-12-1986', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11258', 'DorryCrow', 2182541729, '761 Reeves Street', to_date('15-01-1996', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11259', 'CarlosZellweger', 9125884925, '23rd Street', to_date('07-07-1997', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11260', 'HarrisBaez', 1127838666, '29 Bellevue Street', to_date('10-08-1990', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11261', 'ClayMohr', 5831955934, '48 Herne Drive', to_date('04-07-1987', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11262', 'PabloMoraz', 4752186163, '57 Terrence Street', to_date('06-05-1987', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11263', 'AndreaTillis', 8495142328, '13rd Street', to_date('13-04-2001', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11264', 'TomCampbell', 1835936389, '77 Fukui Street', to_date('07-04-1984', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11265', 'AlanOszajca', 6268471276, '19 Spader Road', to_date('21-10-1989', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11266', 'SallyGiannini', 7586384938, '58 Richie Street', to_date('06-06-1986', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11267', 'JulietteLucas', 7427444783, '99 DiCaprio Street', to_date('31-01-2001', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11268', 'LionelPleasence', 2962777679, '20 Luzern Blvd', to_date('07-06-1982', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11269', 'LilaQuatro', 7492925166, '951 Shearer Road', to_date('24-07-1983', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11270', 'OlgaBurton', 2757625777, '33 Edenbridge Road', to_date('10-03-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11271', 'MinniePeterson', 3383564254, '99 Bolzano Road', to_date('13-04-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11272', 'AlecPerry', 6283355638, '64 Bellevue Road', to_date('02-02-1990', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11273', 'ArmandDerringer', 5422191886, '96 Hershey Street', to_date('19-02-1998', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11274', 'Jonny LeeScaggs', 8173944586, '98 Parish Blvd', to_date('20-05-1996', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11275', 'MillaSpiner', 7631796737, '36 Murdock Drive', to_date('26-11-1999', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11276', 'TaylorSample', 3819965465, '46 Neneh Street', to_date('24-03-1983', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11277', 'ForestVannelli', 5523459959, '50 Hugo Street', to_date('20-06-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11278', 'ChubbyMalkovich', 3144761185, '53 Scarlett Road', to_date('01-10-1983', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11279', 'Ianvon Sydow', 5394219349, '92 Pamela Blvd', to_date('12-08-1984', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11280', 'JefferyCarter', 1358799943, '18 Leimen Blvd', to_date('16-06-1997', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11281', 'BelindaPosener', 1268256254, '66 Patricia Road', to_date('02-11-1988', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11282', 'JonathanCaldwell', 8759176478, '17 Fred Street', to_date('16-08-1983', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11283', 'GabrielleBonneville', 2575731157, '207 Woods Street', to_date('09-10-1994', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11284', 'ToriFarrell', 5382514257, '94 Dalley Blvd', to_date('12-11-1985', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11285', 'NinaEnglish', 2465582118, '91 Rains Road', to_date('24-10-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11286', 'RichardMcNarland', 7871984855, '56 Tempest Street', to_date('20-09-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11287', 'LeonardoBaker', 4877558791, '28 Buffalo Road', to_date('02-11-1999', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11288', 'PragaConnery', 9297455533, '737 Herne Drive', to_date('03-07-1988', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11289', 'VernSecada', 3146893443, '56 Jody Ave', to_date('05-07-1993', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11290', 'DarLawrence', 7789186592, '571 Brittany Road', to_date('04-10-1989', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11291', 'AdamSnider', 3756432823, '18 Trey Drive', to_date('27-12-1991', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11292', 'PeterIngram', 6957362885, '659 Reisterstown Drive', to_date('31-12-1990', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11293', 'LarenzJeffreys', 1947764149, '73rd Street', to_date('09-10-1982', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11294', 'RichHedaya', 3232933299, '29 Birch Road', to_date('27-09-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11295', 'NeilRispoli', 7258232966, '3 L''union Drive', to_date('12-06-1988', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11296', 'LatinBogguss', 8115399958, '31st Street', to_date('07-08-1998', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11297', 'DonnaReid', 5919799314, '49 Davidson', to_date('18-12-1991', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11298', 'GenaLineback', 8463578662, '12nd Street', to_date('19-02-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11299', 'AnthonyMcGovern', 1716749966, '38 McCready Drive', to_date('19-06-1991', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11300', 'EthanAli', 8422729418, '24 Paul Road', to_date('25-03-1982', 'dd-mm-yyyy'));
commit;
prompt 200 records committed...
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11301', 'SpencerScorsese', 4429662495, '73 Jake Street', to_date('02-07-1995', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11302', 'RemySchock', 5295472773, '49 Rocklin Blvd', to_date('28-06-1993', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11303', 'CaseyColman', 1282561492, '95 Garfunkel Street', to_date('21-10-2002', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11304', 'RichRemar', 3943557299, '41st Street', to_date('23-09-1999', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11305', 'CrystalRonstadt', 9874326721, '41 Red Blvd', to_date('16-12-1995', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11306', 'BernardMaxwell', 2841929475, '78 Baez Drive', to_date('31-10-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11307', 'AndraeMcDowall', 8148251636, '30 Fort McMurray Drive', to_date('07-01-1986', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11308', 'MickeyRush', 6475298477, '60 Zappacosta Road', to_date('09-09-1986', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11309', 'LionelGambon', 9672279979, '14 Lynne Drive', to_date('13-04-1986', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11310', 'LennyGary', 8769446872, '85 Kasey Street', to_date('08-10-1980', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11311', 'DermotRaye', 9228465537, '84 Victoria Drive', to_date('27-02-1996', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11312', 'MerrillRucker', 6313354222, '64 West Chester Road', to_date('17-08-1980', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11313', 'MelanieLucien', 4596661568, '79 Sarasota Drive', to_date('04-05-1988', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11314', 'MartinPesci', 7257274139, '98 Fort Lewis Road', to_date('10-12-1984', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11315', 'TalvinMahoney', 5889276856, '71st Street', to_date('31-01-1980', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11316', 'DorryScaggs', 3236671988, '76 Toyama Blvd', to_date('19-08-1993', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11317', 'LorenKravitz', 1858254545, '429 Adams Road', to_date('02-11-1989', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11318', 'ThinWarren', 4881941892, '786 Mint Street', to_date('10-11-1988', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11319', 'DonnaTilly', 6486443168, '83rd Street', to_date('07-01-1998', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11320', 'GaryDonovan', 7184959493, '68 Houma Road', to_date('29-10-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11321', 'OlympiaThurman', 6462441761, '69 Barkin Drive', to_date('25-03-1995', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11322', 'GeenaHaynes', 4142545916, '656 Matthau Road', to_date('19-04-1983', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11323', 'LeonBaranski', 2584643514, '15 Firth Street', to_date('17-07-1987', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11324', 'KirstenTyson', 1389634842, '35 Lisbon Road', to_date('12-08-2002', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11325', 'PaulNapolitano', 5927326367, '100 Teng Street', to_date('29-09-2000', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11326', 'AlfieHartnett', 7276235186, '4 Wainwright Ave', to_date('20-07-1996', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11327', 'StockardBuckingham', 7313873469, '84 Tate', to_date('08-04-1989', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11328', 'Carrie-AnneShort', 4295854935, '65 England Ave', to_date('12-11-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11329', 'JaniceDeGraw', 8795658114, '75 Elizabeth Street', to_date('10-10-2001', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11330', 'EmilyMinogue', 7584396887, '122 Steve Drive', to_date('14-04-1991', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11331', 'LeoCraig', 9662113697, '80 Bernard Ave', to_date('09-01-2001', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11332', 'VernFender', 9422414774, '63rd Street', to_date('17-05-1998', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11333', 'JulietteShelton', 7628275462, '150 Yorn Street', to_date('26-07-1989', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11334', 'ReneGilliam', 7638975449, '32 April Road', to_date('24-11-1992', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11335', 'RandallCraven', 7441618887, '1000 Buckingham Street', to_date('31-07-1992', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11336', 'BrothersKirshner', 6295164596, '524 Todd Drive', to_date('20-10-1995', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11337', 'BernieClarkson', 3837463883, '52 Ramat Gan Road', to_date('08-05-1987', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11338', 'KevnBachman', 9582484263, '73 Conners Road', to_date('06-11-1989', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11339', 'KurtwoodDysart', 9267278434, '19 Murray Drive', to_date('10-08-1989', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11340', 'GilbertTucker', 9387649936, '80 Page', to_date('26-10-1987', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11341', 'EmmQuaid', 9677322483, '64 Delafield Drive', to_date('16-10-1991', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11342', 'SalKlugh', 9761975322, '9 Connery Street', to_date('10-11-1988', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11343', 'EttaFlatts', 7641363399, '11st Street', to_date('05-01-1986', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11344', 'PetulaCronin', 5234197161, '35 Lang Ave', to_date('08-07-1993', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11345', 'ElizaHerrmann', 1617273648, '36 Christina Blvd', to_date('16-06-1996', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11346', 'DaryleYoung', 3624784872, '70 Newton Road', to_date('27-05-1999', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11347', 'RobbyWarden', 9491922254, '54 Sellers Street', to_date('10-01-1999', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11348', 'NikkiBeals', 1117489983, '84 Seatle Ave', to_date('20-10-1980', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11349', 'RoddyHead', 5712217264, '315 Burr Ridge Street', to_date('27-04-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11350', 'SolomonOates', 8386812531, '100 Balin Street', to_date('28-07-1995', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11351', 'ElizaJohnson', 2685736379, '16 Folds Road', to_date('22-04-2002', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11352', 'TalMacy', 3544888469, '98 Portman', to_date('21-03-1990', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11353', 'BettySteenburgen', 2283725973, '71 Reinhold Ave', to_date('06-08-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11354', 'RosieZahn', 1486716479, '53 Reykjavik Drive', to_date('11-05-1993', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11355', 'RhysDavidson', 6777199336, '33 Maria Street', to_date('06-09-1982', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11356', 'SylvesterRhymes', 9216556444, '53 Nigel Street', to_date('28-12-1984', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11357', 'HoraceTankard', 5895411356, '30 Costner Drive', to_date('12-12-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11358', 'ErnestJones', 3821348847, '59 Rachael Ave', to_date('07-01-1995', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11359', 'FrankGugino', 6566182953, '40 Andre', to_date('08-03-1989', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11360', 'AimeeSweeney', 6371142676, '95 Parm Drive', to_date('26-03-1989', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11361', 'DonnaLarter', 2236113959, '65 Huntington Blvd', to_date('30-07-1996', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11362', 'GuyFeore', 9433588399, '22 Slater Drive', to_date('18-03-1982', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11363', 'DelbertJanssen', 6547587977, '16 Westport Street', to_date('07-04-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11364', 'SelmaBurstyn', 2617453522, '83 Malone Road', to_date('06-07-1987', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11365', 'ChadTwilley', 1343883818, '419 Loring', to_date('07-11-1990', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11366', 'LionelWinter', 6266373276, '52nd Street', to_date('07-03-1983', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11367', 'GwynethBlack', 4954499392, '448 Chirignago Blvd', to_date('21-05-1985', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11368', 'WaymanHolm', 8873135368, '57 Wiest Blvd', to_date('16-03-1983', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11369', 'SimonBorgnine', 2518299446, '8 Nakai Street', to_date('30-01-1997', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11370', 'PenelopeKeener', 1283241868, '10 Miller Ave', to_date('10-08-1987', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11371', 'RowanLovitz', 1646818973, '26 Colon Street', to_date('22-10-1985', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11372', 'KyleAmos', 4723753131, '11st Street', to_date('01-02-1986', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11373', 'KimHartnett', 1341181679, '43 Rio Rancho Ave', to_date('08-05-1982', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11374', 'AnitaBedelia', 6577572478, '61 North Yorkshire', to_date('01-07-1995', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11375', 'HazelSchwimmer', 8898562559, '53 Himmelman Road', to_date('08-03-1994', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11376', 'MikiRippy', 6183324834, '10 Abbotsford Blvd', to_date('27-04-1999', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11377', 'DavyGrier', 3624266257, '35 Leon Drive', to_date('24-08-1982', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11378', 'ChristmasOsbourne', 6948672823, '34 Ali', to_date('17-01-2001', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11379', 'JavonDerringer', 8343176162, '994 Christopher Road', to_date('27-10-1982', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11380', 'RobertConnery', 4467125994, '981 Huntsville Blvd', to_date('08-08-2001', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11381', 'DeanShearer', 8323552885, '82 Conners Street', to_date('13-11-1985', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11382', 'Chant׳™Darren', 7594335184, '11st Street', to_date('19-07-1999', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11383', 'BebeFarrell', 6631199796, '63rd Street', to_date('22-09-1998', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11384', 'CubaViterelli', 2555647394, '45 Geena Drive', to_date('27-11-1993', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11385', 'CledusMcCracken', 9592564444, '21 Cromwell', to_date('07-08-1996', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11386', 'AshleyLaBelle', 6246117872, '183 Sepulveda Road', to_date('28-12-1985', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11387', 'CleaKeeslar', 6381596652, '89 Hjallerup', to_date('09-03-1997', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11388', 'NikkiLoring', 5586112378, '51 Renee', to_date('25-01-1983', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11389', 'HopeStevens', 5996151147, '245 Rain Drive', to_date('06-08-1994', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11390', 'NatalieKattan', 8638579942, '17 Vince Ave', to_date('16-10-1985', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11391', 'AniPitney', 1454122348, '973 Bush Blvd', to_date('18-07-1997', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11392', 'EdieLaurie', 8621868229, '62nd Street', to_date('29-01-1991', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11393', 'CledusUggams', 8355595454, '89 Redwood City', to_date('03-01-2000', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11394', 'VinceNuman', 7225378417, '50 Numan Street', to_date('16-12-1997', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11395', 'SamanthaDepp', 5386415138, '12 Bobby Street', to_date('08-10-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11396', 'OmarFavreau', 2819951976, '904 Bloomington Street', to_date('17-12-1999', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11397', 'MarkTobolowsky', 2127858724, '33 Warwick Road', to_date('14-12-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11398', 'TiaPollack', 2777239137, '41 Mahood Street', to_date('16-09-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11399', 'TimMcDonnell', 1343344755, '882 Moriarty Road', to_date('30-10-2001', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11400', 'HiltonPressly', 2961522612, '81 Aimee Street', to_date('21-12-1998', 'dd-mm-yyyy'));
commit;
prompt 300 records committed...
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11401', 'SydneyLoggia', 1487971931, '65 Hudson', to_date('10-12-2001', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11402', 'TerenceWinwood', 4342499797, '67 Zeta-Jones Road', to_date('02-10-1980', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11403', 'RutgerArjona', 1877526428, '736 Johansen Road', to_date('13-01-2000', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11404', 'OwenTucker', 5897674828, '79 Liev Blvd', to_date('10-02-1994', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11405', 'DelroyDuschel', 3945638395, '59 Def Road', to_date('11-06-2002', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11406', 'JonHoliday', 3237539611, '97 Chinlund Road', to_date('21-01-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11407', 'RowanFichtner', 6789626866, '55 Kumamoto Road', to_date('20-07-1980', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11408', 'MikoMcDowell', 7946729991, '41 Pelvic Drive', to_date('29-03-1997', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11409', 'IceLofgren', 8431278188, '891 Bruce Street', to_date('16-11-1997', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11410', 'DermotSedgwick', 5392224173, '9 Philip Street', to_date('30-10-1984', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11411', 'SonnyDunaway', 2912167172, '10 Hagar', to_date('05-11-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11412', 'OlgaFarrell', 5289636899, '91st Street', to_date('30-05-2001', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11413', 'AidanPatton', 7333757547, '75 Leoni Drive', to_date('04-04-1984', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11414', 'EmilyDonovan', 6632242137, '956 Oakenfold Drive', to_date('09-06-2000', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11415', 'AniWhitley', 4124678598, '386 Bradford Street', to_date('06-08-1997', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11416', 'BobbiRedgrave', 2853479799, '91 Queen Road', to_date('21-07-1999', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11417', 'MosWitherspoon', 2524577564, '40 Vega Drive', to_date('27-04-1989', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11418', 'LindaLynne', 7521772895, '51 Leon Road', to_date('25-07-1989', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11419', 'CarrieManning', 2677816988, '75 Shaw Ave', to_date('26-05-1988', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11420', 'KaronPlummer', 9266478921, '30 Dortmund Street', to_date('26-07-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11421', 'Carrie-AnneClarkson', 5526615162, '18 Root Street', to_date('27-07-1988', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11422', 'DarArmstrong', 9641483722, '862 Santa Clarat Road', to_date('06-02-1980', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11423', 'CarlKweller', 3997715137, '72 Chirignago Road', to_date('03-11-1996', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11424', 'JonathanFurtado', 3551457455, '58 Gold Street', to_date('16-04-1988', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11425', 'AliciaEngland', 4271722983, '30 Cedar Rapids Blvd', to_date('07-07-1980', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11426', 'ChadMurray', 2356816447, '97 Mifune Road', to_date('10-07-1989', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11427', 'PamButler', 4899799229, '9 Swarthmore Road', to_date('28-01-1987', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11428', 'JuniorHirsch', 5818439775, '27 Torn Street', to_date('20-06-1996', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11429', 'GoranFlemyng', 1184997153, '63 Kirkwood Road', to_date('19-04-1995', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11430', 'FatsEvans', 4661462873, '87 Cuenca Street', to_date('06-09-2001', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11431', 'DesmondO''Hara', 7996274963, '63rd Street', to_date('13-12-1992', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11432', 'SallySatriani', 8373227794, '37 Milsons Point Ave', to_date('26-02-1999', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11433', 'ShelbyClinton', 5946632286, '55 Neuwirth Drive', to_date('18-06-1989', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11434', 'BrendanSingletary', 4969159622, '29 Apple Ave', to_date('13-11-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11435', 'DrewLemmon', 1934448168, '11 Neuch׳’tel Road', to_date('06-02-1998', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11436', 'RitchieBeckinsale', 9714543366, '99 Lane Street', to_date('03-07-2002', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11437', 'KirkFisher', 8169113127, '126 Trey Blvd', to_date('24-12-1989', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11438', 'KimMorrison', 5998961519, '100 Jordan Drive', to_date('14-10-1997', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11439', 'Ming-NaCallow', 4773346726, '661 Phifer Street', to_date('28-02-1994', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11440', 'RonnyWeller', 6622778654, '63 Caine Drive', to_date('31-05-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11441', 'EdgarMcDowall', 3484764671, '324 Cross Ave', to_date('27-11-1982', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11442', 'ZooeyWells', 5292974226, '37 Indianapolis Drive', to_date('23-09-1992', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11443', 'SeannBreslin', 2278386237, '37 Mira Drive', to_date('27-01-2000', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11444', 'RutgerRapaport', 2285594435, '18 Kristin Street', to_date('16-07-1986', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11445', 'DariusPryce', 4189962718, '80 Frampton Blvd', to_date('21-08-1986', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11446', 'MirandaHeslov', 8664792159, '93rd Street', to_date('29-04-1992', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11447', 'CleaLillard', 9937994467, '48 Gelsenkirchen', to_date('11-06-1984', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11448', 'TeriRoy Parnell', 9779186136, '365 Patillo', to_date('02-02-2002', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11449', 'RhettHanks', 9731472489, '85 Hudson Street', to_date('09-08-1999', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11450', 'CyndiDunst', 8679243227, '36 Fishburne Street', to_date('20-09-1989', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11451', 'AlanRibisi', 6779135849, '72nd Street', to_date('15-06-1983', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11452', 'CampbellWard', 5827116141, '73 Charlottesville Road', to_date('25-07-1989', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11453', 'DavisDetmer', 9788369319, '77 Rhett Drive', to_date('03-02-1994', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11454', 'NoraVisnjic', 3926562483, '68 Collette Street', to_date('01-11-1985', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11455', 'SallyFrancis', 2756693523, '32 Peet Drive', to_date('06-08-1994', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11456', 'MickyNegbaur', 1468887249, '96 Sherman Blvd', to_date('23-09-2002', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11457', 'KieferDavid', 9581762796, '44 Isaac Street', to_date('12-09-1987', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11458', 'LaraMonk', 1551868771, '28 Canberra', to_date('11-07-1982', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11459', 'OzzyMars', 7178546868, '8 Nancy Drive', to_date('06-09-1994', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11460', 'RonLucas', 9431525531, '48 Horizon Street', to_date('22-11-1987', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11461', 'SherylParker', 3958122732, '99 Assante Ave', to_date('07-02-1984', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11462', 'ChaleeJay', 6843538673, '535 Andy Street', to_date('17-07-1993', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11463', 'LisaDeLuise', 8985496791, '40 El Dorado Hills', to_date('20-12-1989', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11464', 'RuebenHerrmann', 4385165991, '39 Diffie Street', to_date('07-05-1994', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11465', 'DennisGarr', 6255942223, '48 Banderas Street', to_date('19-04-1987', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11466', 'CevinDeschanel', 1464576795, '23 Murdock Street', to_date('01-10-1980', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11467', 'DebraGosdin', 9497798716, '57 Melrose Road', to_date('14-12-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11468', 'MarlonStudi', 7394463752, '23 Fiona Road', to_date('07-07-2000', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11469', 'HeathStallone', 4422893739, '13 Callow Road', to_date('26-09-1994', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11470', 'JaneaneApplegate', 3223484456, '201 Bonnie Road', to_date('27-06-1984', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11471', 'SamTripplehorn', 3832436414, '45 Cromwell Road', to_date('18-03-1992', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11472', 'NickySingh', 5827792647, '942 Frankfurt am Main Street', to_date('27-09-1999', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11473', 'ElvisWeaving', 1586734145, '57 Willie Road', to_date('20-01-1985', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11474', 'RosarioNivola', 8323556233, '20 Wheel Road', to_date('18-08-2001', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11475', 'BrianDamon', 9378135397, '58 Santa Cruz Blvd', to_date('23-12-1988', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11476', 'CarlosQuinn', 8779345262, '923 Haslam Drive', to_date('03-01-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11477', 'BuffyMidler', 9288236744, '14 Jolie Road', to_date('18-08-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11478', 'HikaruPiven', 9985311633, '68 Woods Road', to_date('29-12-1986', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11479', 'MykeltiGlenn', 3678391211, '50 Lucy Blvd', to_date('05-05-1980', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11480', 'LeonardoKidman', 5329819731, '42nd Street', to_date('25-11-1992', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11481', 'MinnieVanian', 3972943959, '90 Bacharach Street', to_date('21-03-1992', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11482', 'RickyCollie', 2621288396, '30 Stone Street', to_date('29-01-1989', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11483', 'JoanDillane', 3431264313, '98 Lewin Drive', to_date('21-03-1998', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11484', 'RemyLerner', 4355549267, '93 Elvis Road', to_date('10-09-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11485', 'RitaSteenburgen', 5249466113, '37 Cornell Road', to_date('20-08-1991', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11486', 'GuyRauhofer', 2453767318, '83 Brooks Ave', to_date('12-08-1997', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11487', 'MillieDushku', 2198356837, '96 Wichita', to_date('17-09-2000', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11488', 'JoelyColtrane', 9131126553, '87 Brock Road', to_date('10-03-1982', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11489', 'HeatherBasinger', 2782163832, '124 Rhett Drive', to_date('18-03-1983', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11490', 'MarlonWopat', 3646924699, '197 Rundgren Street', to_date('11-09-1982', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11491', 'HexHead', 8853984959, '95 Guy Drive', to_date('09-11-1992', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11492', 'SylvesterFerrer', 5859215994, '58 Brendan Road', to_date('13-01-1986', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11493', 'CarlosDiehl', 2591691236, '68 Arnold Street', to_date('19-02-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11494', 'JudgeHagerty', 9542915567, '69 Sander Road', to_date('08-12-1994', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11495', 'DanielBerry', 3852144255, '8 Gandolfini Road', to_date('20-12-1984', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11496', 'EmmaTomlin', 5986292993, '90 Affleck Street', to_date('14-04-1993', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11497', 'TomMacy', 4191231536, '87 Rhett Road', to_date('25-10-1982', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11498', 'MikiIngram', 4935644356, '4 Taipei Street', to_date('13-04-1990', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11499', 'JacksonHerrmann', 3349294234, '57 Nik Drive', to_date('03-01-1998', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11500', 'EmmaStreep', 1535352449, '92 Broderick Road', to_date('21-05-1992', 'dd-mm-yyyy'));
commit;
prompt 400 records committed...
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11501', 'JesseBarnett', 9874779884, '684 Bruxelles Drive', to_date('19-10-2001', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11502', 'HaroldBanderas', 8476693764, '3 Nuernberg Road', to_date('11-06-1991', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11503', 'AdinaBenet', 9673263494, '40 Balin Street', to_date('15-08-1990', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11504', 'DarGarofalo', 8556286819, '59 Moreno Street', to_date('22-05-1996', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11505', 'RussellRyder', 2255854576, '168 Liu Road', to_date('10-04-1982', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11506', 'JeffVai', 2455654458, '95 Herndon Road', to_date('30-12-2002', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11507', 'KimberlyGarner', 3474639121, '67 McGowan Ave', to_date('05-02-1987', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11508', 'ColmBragg', 4952148794, '55 Jessica Street', to_date('21-11-1987', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11509', 'LennyLaPaglia', 8773424341, '65 Colon Street', to_date('18-08-1997', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11510', 'BuddyBrandt', 7198876241, '52 Rooker Street', to_date('14-02-1985', 'dd-mm-yyyy'));
commit;
prompt 410 records loaded
prompt Loading PARAMEDIC...
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 5, '1');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 4, '2');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 3, '3');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Ben-Gurion University', 2, '4');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Bar-Ilan University', 1, '5');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Weizmann Institute', 6, '6');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Haifa University', 7, '7');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Ariel University', 8, '8');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('IDC Herzliya', 9, '9');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Open University', 10, '10');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 6, '11304');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 3, '11219');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 6, '11456');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 6, '11374');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 9, '11500');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 7, '11475');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 4, '11315');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 1, '11298');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 8, '11450');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 6, '11142');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 8, '11488');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 3, '11377');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 2, '11382');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 6, '11263');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 7, '11445');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 8, '11387');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 4, '11496');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 4, '11270');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 3, '11356');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 6, '11295');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 3, '11154');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 1, '11391');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 3, '11128');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 4, '11365');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 2, '11148');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 6, '11187');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 1, '11453');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 9, '11208');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 3, '11186');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 8, '11415');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 8, '11307');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 5, '11328');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 7, '11250');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 4, '11318');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 3, '11361');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 2, '11203');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 2, '11189');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 2, '11205');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 6, '11230');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 2, '11354');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 4, '11308');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 3, '11255');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 8, '11269');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 7, '11144');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 6, '11169');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 3, '11413');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 8, '11185');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 8, '11152');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 3, '11396');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 1, '11449');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 8, '11267');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 9, '11431');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 4, '11392');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 1, '11455');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 6, '11223');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 3, '11246');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 8, '11283');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 4, '11184');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 8, '11228');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 7, '11224');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 4, '11206');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 5, '11277');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 3, '11322');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 2, '11490');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 7, '11151');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 3, '11378');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 4, '11289');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 2, '11398');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 2, '11188');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 1, '11155');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 9, '11285');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 4, '11119');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 5, '11207');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 7, '11118');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 6, '11478');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 8, '11416');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 2, '11198');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 9, '11274');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 5, '11172');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 5, '11411');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 2, '11409');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 5, '11191');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 9, '11168');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 5, '11296');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 7, '11350');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 2, '11117');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 7, '11262');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 1, '11138');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 1, '11197');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 1, '11271');
commit;
prompt 100 records committed...
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 1, '11492');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 2, '11417');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 2, '11491');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 6, '11179');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 1, '11335');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 9, '11323');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 9, '11439');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 2, '11257');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 8, '11268');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 6, '11200');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 6, '11233');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 9, '11438');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 6, '11357');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 8, '11432');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 9, '11380');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 1, '11420');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 5, '11214');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 4, '11181');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 8, '11306');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 1, '11162');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 2, '11422');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 2, '11174');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 5, '11147');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 5, '11178');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 4, '11332');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 5, '11469');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 9, '11366');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 4, '11349');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 1, '11170');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 9, '11114');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 7, '11434');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 6, '11182');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 1, '11221');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 3, '11199');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 2, '11333');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 5, '11400');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 5, '11489');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 1, '11479');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 3, '11121');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 6, '11265');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 4, '11216');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 5, '11451');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 5, '11190');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 5, '11111');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 9, '11484');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 7, '11165');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 4, '11428');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 5, '11343');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 2, '11421');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 2, '11338');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 2, '11348');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 8, '11309');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 6, '11281');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 9, '11345');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 6, '11139');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 7, '11344');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 9, '11401');
commit;
prompt 157 records loaded
prompt Loading SHIFT...
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (1, to_date('01-01-2024', 'dd-mm-yyyy'), '08:00', '16:00', '1');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (2, to_date('01-02-2024', 'dd-mm-yyyy'), '08:00', '16:00', '2');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (3, to_date('01-03-2024', 'dd-mm-yyyy'), '08:00', '16:00', '3');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (4, to_date('01-04-2024', 'dd-mm-yyyy'), '08:00', '16:00', '4');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (5, to_date('01-05-2024', 'dd-mm-yyyy'), '08:00', '16:00', '5');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (6, to_date('01-06-2024', 'dd-mm-yyyy'), '08:00', '16:00', '6');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (7, to_date('01-07-2024', 'dd-mm-yyyy'), '08:00', '16:00', '7');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (8, to_date('01-08-2024', 'dd-mm-yyyy'), '08:00', '16:00', '8');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (9, to_date('01-09-2024', 'dd-mm-yyyy'), '08:00', '16:00', '9');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (10, to_date('01-10-2024', 'dd-mm-yyyy'), '08:00', '16:00', '10');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11, to_date('20-06-2024', 'dd-mm-yyyy'), '08:00', '14:00', '1');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (12, to_date('20-06-2024', 'dd-mm-yyyy'), '08:00', '14:00', '10');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (13, to_date('22-06-2024', 'dd-mm-yyyy'), '08:00', '16:00', '8');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11111, to_date('16-06-2020', 'dd-mm-yyyy'), '12:00', '16:00', '11138');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11112, to_date('17-01-2023', 'dd-mm-yyyy'), '12:00', '16:00', '11151');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11113, to_date('24-06-2020', 'dd-mm-yyyy'), '08:00', '16:00', '11338');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11114, to_date('01-08-2020', 'dd-mm-yyyy'), '08:00', '16:00', '11185');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11115, to_date('15-01-2022', 'dd-mm-yyyy'), '08:00', '18:00', '11169');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11116, to_date('02-06-2020', 'dd-mm-yyyy'), '12:00', '18:00', '11456');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11117, to_date('08-11-2023', 'dd-mm-yyyy'), '08:00', '16:00', '11451');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11118, to_date('20-06-2022', 'dd-mm-yyyy'), '08:00', '16:00', '11170');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11119, to_date('03-01-2022', 'dd-mm-yyyy'), '12:00', '18:00', '11490');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11120, to_date('01-02-2021', 'dd-mm-yyyy'), '12:00', '16:00', '11224');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11121, to_date('04-07-2020', 'dd-mm-yyyy'), '08:00', '18:00', '11348');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11122, to_date('29-01-2022', 'dd-mm-yyyy'), '12:00', '18:00', '2');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11123, to_date('21-05-2023', 'dd-mm-yyyy'), '12:00', '18:00', '11438');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11124, to_date('05-12-2023', 'dd-mm-yyyy'), '12:00', '16:00', '11343');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11125, to_date('29-01-2023', 'dd-mm-yyyy'), '12:00', '16:00', '11354');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11126, to_date('18-04-2023', 'dd-mm-yyyy'), '12:00', '16:00', '11306');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11127, to_date('12-01-2021', 'dd-mm-yyyy'), '08:00', '16:00', '11309');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11128, to_date('05-10-2020', 'dd-mm-yyyy'), '08:00', '16:00', '11151');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11129, to_date('31-07-2020', 'dd-mm-yyyy'), '08:00', '16:00', '11318');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11130, to_date('26-10-2022', 'dd-mm-yyyy'), '12:00', '16:00', '11179');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11131, to_date('23-01-2020', 'dd-mm-yyyy'), '08:00', '16:00', '11169');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11132, to_date('08-02-2020', 'dd-mm-yyyy'), '12:00', '16:00', '6');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11133, to_date('03-03-2022', 'dd-mm-yyyy'), '08:00', '16:00', '8');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11134, to_date('28-11-2021', 'dd-mm-yyyy'), '08:00', '16:00', '11147');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11135, to_date('04-08-2023', 'dd-mm-yyyy'), '12:00', '16:00', '11270');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11136, to_date('28-11-2022', 'dd-mm-yyyy'), '08:00', '18:00', '11155');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11137, to_date('11-11-2020', 'dd-mm-yyyy'), '12:00', '16:00', '11453');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11138, to_date('25-02-2022', 'dd-mm-yyyy'), '12:00', '18:00', '11188');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11139, to_date('28-06-2020', 'dd-mm-yyyy'), '08:00', '16:00', '11489');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11140, to_date('26-04-2022', 'dd-mm-yyyy'), '12:00', '16:00', '11262');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11141, to_date('26-04-2021', 'dd-mm-yyyy'), '08:00', '16:00', '11268');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11142, to_date('11-03-2021', 'dd-mm-yyyy'), '08:00', '16:00', '11354');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11143, to_date('19-02-2021', 'dd-mm-yyyy'), '12:00', '18:00', '11172');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11144, to_date('03-06-2023', 'dd-mm-yyyy'), '12:00', '18:00', '11445');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11145, to_date('26-07-2023', 'dd-mm-yyyy'), '08:00', '16:00', '11309');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11146, to_date('30-06-2020', 'dd-mm-yyyy'), '12:00', '16:00', '11354');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11147, to_date('26-02-2021', 'dd-mm-yyyy'), '08:00', '18:00', '11469');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11148, to_date('30-12-2022', 'dd-mm-yyyy'), '08:00', '18:00', '11450');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11149, to_date('08-10-2022', 'dd-mm-yyyy'), '12:00', '18:00', '11438');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11150, to_date('02-02-2021', 'dd-mm-yyyy'), '12:00', '18:00', '8');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11151, to_date('08-03-2021', 'dd-mm-yyyy'), '08:00', '16:00', '11181');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11152, to_date('07-04-2021', 'dd-mm-yyyy'), '12:00', '16:00', '11257');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11153, to_date('21-12-2020', 'dd-mm-yyyy'), '08:00', '16:00', '11489');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11154, to_date('29-04-2023', 'dd-mm-yyyy'), '08:00', '16:00', '11169');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11155, to_date('10-08-2022', 'dd-mm-yyyy'), '12:00', '16:00', '11401');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11156, to_date('20-08-2021', 'dd-mm-yyyy'), '08:00', '16:00', '11151');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11157, to_date('03-11-2022', 'dd-mm-yyyy'), '08:00', '18:00', '11338');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11158, to_date('11-08-2022', 'dd-mm-yyyy'), '08:00', '16:00', '11216');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11159, to_date('25-04-2023', 'dd-mm-yyyy'), '08:00', '16:00', '11492');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11160, to_date('17-06-2022', 'dd-mm-yyyy'), '08:00', '18:00', '11345');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11161, to_date('04-06-2023', 'dd-mm-yyyy'), '12:00', '18:00', '11488');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11162, to_date('05-03-2021', 'dd-mm-yyyy'), '12:00', '18:00', '11411');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11163, to_date('13-06-2021', 'dd-mm-yyyy'), '08:00', '18:00', '11165');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11164, to_date('13-10-2020', 'dd-mm-yyyy'), '12:00', '18:00', '11343');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11165, to_date('26-11-2023', 'dd-mm-yyyy'), '08:00', '16:00', '11315');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11166, to_date('27-10-2023', 'dd-mm-yyyy'), '12:00', '16:00', '11475');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11167, to_date('28-02-2023', 'dd-mm-yyyy'), '08:00', '18:00', '11428');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11168, to_date('03-02-2020', 'dd-mm-yyyy'), '08:00', '16:00', '11118');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11169, to_date('01-05-2023', 'dd-mm-yyyy'), '08:00', '16:00', '11422');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11170, to_date('26-08-2021', 'dd-mm-yyyy'), '08:00', '16:00', '11335');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11171, to_date('09-05-2022', 'dd-mm-yyyy'), '12:00', '16:00', '11382');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11172, to_date('22-01-2022', 'dd-mm-yyyy'), '12:00', '16:00', '11277');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11173, to_date('23-05-2022', 'dd-mm-yyyy'), '08:00', '18:00', '11496');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11174, to_date('08-11-2023', 'dd-mm-yyyy'), '12:00', '18:00', '11187');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11175, to_date('06-06-2020', 'dd-mm-yyyy'), '12:00', '18:00', '11147');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11176, to_date('23-04-2022', 'dd-mm-yyyy'), '12:00', '18:00', '11500');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11177, to_date('26-02-2023', 'dd-mm-yyyy'), '08:00', '16:00', '11221');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11178, to_date('01-06-2021', 'dd-mm-yyyy'), '12:00', '18:00', '8');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11179, to_date('20-01-2022', 'dd-mm-yyyy'), '12:00', '16:00', '11500');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11180, to_date('22-02-2022', 'dd-mm-yyyy'), '08:00', '16:00', '11323');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11181, to_date('22-10-2020', 'dd-mm-yyyy'), '08:00', '18:00', '11332');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11182, to_date('27-11-2022', 'dd-mm-yyyy'), '12:00', '18:00', '11114');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11183, to_date('21-11-2022', 'dd-mm-yyyy'), '08:00', '18:00', '11151');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11184, to_date('27-04-2020', 'dd-mm-yyyy'), '12:00', '16:00', '11205');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11185, to_date('07-06-2023', 'dd-mm-yyyy'), '08:00', '18:00', '11400');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11186, to_date('13-03-2022', 'dd-mm-yyyy'), '08:00', '18:00', '11335');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11187, to_date('08-05-2021', 'dd-mm-yyyy'), '12:00', '16:00', '11271');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11188, to_date('11-10-2020', 'dd-mm-yyyy'), '12:00', '16:00', '11270');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11189, to_date('20-09-2023', 'dd-mm-yyyy'), '12:00', '16:00', '11332');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11190, to_date('27-03-2022', 'dd-mm-yyyy'), '08:00', '16:00', '11189');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11191, to_date('13-05-2022', 'dd-mm-yyyy'), '12:00', '18:00', '11142');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11192, to_date('26-05-2020', 'dd-mm-yyyy'), '12:00', '16:00', '11380');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11193, to_date('02-10-2022', 'dd-mm-yyyy'), '12:00', '18:00', '11365');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11194, to_date('11-10-2022', 'dd-mm-yyyy'), '08:00', '18:00', '11144');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11195, to_date('05-02-2021', 'dd-mm-yyyy'), '08:00', '16:00', '11345');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11196, to_date('06-10-2020', 'dd-mm-yyyy'), '08:00', '16:00', '11230');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11197, to_date('28-09-2021', 'dd-mm-yyyy'), '08:00', '18:00', '11345');
commit;
prompt 100 records committed...
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11198, to_date('27-02-2020', 'dd-mm-yyyy'), '08:00', '16:00', '11492');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11199, to_date('28-09-2022', 'dd-mm-yyyy'), '12:00', '16:00', '11185');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11200, to_date('20-11-2023', 'dd-mm-yyyy'), '12:00', '16:00', '11309');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11201, to_date('09-10-2021', 'dd-mm-yyyy'), '08:00', '18:00', '11188');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11202, to_date('05-01-2023', 'dd-mm-yyyy'), '12:00', '18:00', '11296');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11203, to_date('23-03-2022', 'dd-mm-yyyy'), '08:00', '16:00', '11469');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11204, to_date('22-12-2023', 'dd-mm-yyyy'), '12:00', '16:00', '11200');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11205, to_date('26-07-2023', 'dd-mm-yyyy'), '08:00', '16:00', '11415');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11206, to_date('22-01-2020', 'dd-mm-yyyy'), '12:00', '18:00', '11296');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11207, to_date('24-12-2023', 'dd-mm-yyyy'), '12:00', '18:00', '11354');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11208, to_date('05-03-2023', 'dd-mm-yyyy'), '12:00', '16:00', '11450');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11209, to_date('19-03-2023', 'dd-mm-yyyy'), '08:00', '18:00', '10');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11210, to_date('26-10-2023', 'dd-mm-yyyy'), '12:00', '18:00', '3');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11211, to_date('14-09-2021', 'dd-mm-yyyy'), '08:00', '16:00', '11356');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11212, to_date('01-05-2023', 'dd-mm-yyyy'), '08:00', '18:00', '11451');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11213, to_date('10-12-2023', 'dd-mm-yyyy'), '12:00', '16:00', '11343');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11214, to_date('20-05-2022', 'dd-mm-yyyy'), '12:00', '16:00', '11262');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11215, to_date('02-02-2022', 'dd-mm-yyyy'), '12:00', '18:00', '11277');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11216, to_date('21-09-2021', 'dd-mm-yyyy'), '12:00', '18:00', '11271');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11217, to_date('08-11-2023', 'dd-mm-yyyy'), '08:00', '16:00', '11119');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11218, to_date('01-03-2023', 'dd-mm-yyyy'), '12:00', '18:00', '11475');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11219, to_date('03-08-2020', 'dd-mm-yyyy'), '12:00', '16:00', '11181');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11220, to_date('29-10-2022', 'dd-mm-yyyy'), '08:00', '18:00', '11285');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11221, to_date('06-09-2023', 'dd-mm-yyyy'), '08:00', '16:00', '11147');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11222, to_date('20-08-2020', 'dd-mm-yyyy'), '08:00', '18:00', '11257');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11223, to_date('24-02-2021', 'dd-mm-yyyy'), '08:00', '16:00', '11392');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11224, to_date('21-01-2022', 'dd-mm-yyyy'), '08:00', '18:00', '11411');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11225, to_date('14-07-2022', 'dd-mm-yyyy'), '12:00', '16:00', '11422');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11226, to_date('03-02-2020', 'dd-mm-yyyy'), '08:00', '18:00', '11449');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11227, to_date('27-12-2023', 'dd-mm-yyyy'), '08:00', '18:00', '11434');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11228, to_date('09-07-2021', 'dd-mm-yyyy'), '12:00', '18:00', '11179');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11229, to_date('28-08-2021', 'dd-mm-yyyy'), '12:00', '18:00', '11398');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11230, to_date('22-05-2021', 'dd-mm-yyyy'), '08:00', '16:00', '11265');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11231, to_date('21-04-2021', 'dd-mm-yyyy'), '08:00', '16:00', '11269');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11232, to_date('06-10-2021', 'dd-mm-yyyy'), '12:00', '18:00', '2');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11233, to_date('01-03-2020', 'dd-mm-yyyy'), '12:00', '18:00', '11181');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11234, to_date('14-09-2022', 'dd-mm-yyyy'), '08:00', '18:00', '11348');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11235, to_date('25-01-2021', 'dd-mm-yyyy'), '08:00', '18:00', '11415');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11236, to_date('11-07-2021', 'dd-mm-yyyy'), '12:00', '18:00', '11415');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11237, to_date('22-10-2022', 'dd-mm-yyyy'), '12:00', '18:00', '11257');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11238, to_date('10-04-2020', 'dd-mm-yyyy'), '12:00', '16:00', '11335');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11239, to_date('01-10-2022', 'dd-mm-yyyy'), '08:00', '16:00', '11322');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11240, to_date('27-06-2021', 'dd-mm-yyyy'), '08:00', '16:00', '11491');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11241, to_date('17-09-2023', 'dd-mm-yyyy'), '08:00', '16:00', '11348');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11242, to_date('29-02-2020', 'dd-mm-yyyy'), '12:00', '16:00', '11178');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11243, to_date('26-01-2021', 'dd-mm-yyyy'), '08:00', '16:00', '11182');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11244, to_date('08-01-2020', 'dd-mm-yyyy'), '08:00', '16:00', '11378');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11245, to_date('18-02-2022', 'dd-mm-yyyy'), '08:00', '18:00', '11271');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11246, to_date('27-12-2021', 'dd-mm-yyyy'), '12:00', '18:00', '11190');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11247, to_date('03-10-2021', 'dd-mm-yyyy'), '12:00', '18:00', '7');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11248, to_date('09-12-2020', 'dd-mm-yyyy'), '08:00', '18:00', '11197');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11249, to_date('17-03-2022', 'dd-mm-yyyy'), '08:00', '16:00', '11479');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11250, to_date('11-09-2022', 'dd-mm-yyyy'), '08:00', '18:00', '11400');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11251, to_date('15-04-2021', 'dd-mm-yyyy'), '12:00', '18:00', '11199');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11252, to_date('01-04-2021', 'dd-mm-yyyy'), '08:00', '18:00', '11155');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11253, to_date('10-09-2020', 'dd-mm-yyyy'), '08:00', '18:00', '11382');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11254, to_date('14-04-2020', 'dd-mm-yyyy'), '08:00', '18:00', '11492');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11255, to_date('25-08-2022', 'dd-mm-yyyy'), '12:00', '16:00', '11348');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11256, to_date('23-11-2022', 'dd-mm-yyyy'), '12:00', '18:00', '11182');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11257, to_date('28-09-2022', 'dd-mm-yyyy'), '12:00', '18:00', '11228');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11258, to_date('02-08-2021', 'dd-mm-yyyy'), '08:00', '18:00', '11377');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11259, to_date('28-01-2023', 'dd-mm-yyyy'), '12:00', '18:00', '11121');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11260, to_date('07-07-2020', 'dd-mm-yyyy'), '08:00', '18:00', '4');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11261, to_date('13-08-2021', 'dd-mm-yyyy'), '12:00', '16:00', '11269');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11262, to_date('26-12-2021', 'dd-mm-yyyy'), '08:00', '18:00', '11269');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11263, to_date('25-10-2021', 'dd-mm-yyyy'), '08:00', '18:00', '11189');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11264, to_date('10-03-2021', 'dd-mm-yyyy'), '08:00', '18:00', '11411');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11265, to_date('22-06-2022', 'dd-mm-yyyy'), '08:00', '16:00', '11382');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11266, to_date('11-03-2021', 'dd-mm-yyyy'), '12:00', '16:00', '11338');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11267, to_date('11-11-2023', 'dd-mm-yyyy'), '08:00', '18:00', '11345');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11268, to_date('09-03-2020', 'dd-mm-yyyy'), '12:00', '18:00', '11431');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11269, to_date('01-02-2022', 'dd-mm-yyyy'), '08:00', '18:00', '11224');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11270, to_date('22-12-2022', 'dd-mm-yyyy'), '12:00', '16:00', '11354');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11271, to_date('18-09-2023', 'dd-mm-yyyy'), '12:00', '16:00', '11350');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11272, to_date('19-09-2020', 'dd-mm-yyyy'), '12:00', '16:00', '11343');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11273, to_date('14-08-2020', 'dd-mm-yyyy'), '12:00', '16:00', '11162');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11274, to_date('03-12-2022', 'dd-mm-yyyy'), '12:00', '16:00', '11203');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11275, to_date('15-02-2021', 'dd-mm-yyyy'), '08:00', '18:00', '11489');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11276, to_date('08-09-2021', 'dd-mm-yyyy'), '08:00', '18:00', '11488');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11277, to_date('09-05-2021', 'dd-mm-yyyy'), '08:00', '18:00', '11350');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11278, to_date('11-03-2020', 'dd-mm-yyyy'), '12:00', '16:00', '11396');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11279, to_date('08-11-2020', 'dd-mm-yyyy'), '12:00', '18:00', '11306');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11280, to_date('11-06-2021', 'dd-mm-yyyy'), '12:00', '18:00', '11154');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11281, to_date('17-06-2022', 'dd-mm-yyyy'), '12:00', '16:00', '11216');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11282, to_date('04-04-2021', 'dd-mm-yyyy'), '12:00', '16:00', '11413');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11283, to_date('31-05-2020', 'dd-mm-yyyy'), '12:00', '16:00', '11496');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11284, to_date('07-07-2021', 'dd-mm-yyyy'), '12:00', '16:00', '11206');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11285, to_date('24-09-2020', 'dd-mm-yyyy'), '12:00', '16:00', '11475');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11286, to_date('26-08-2023', 'dd-mm-yyyy'), '12:00', '18:00', '11117');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11287, to_date('26-10-2021', 'dd-mm-yyyy'), '08:00', '16:00', '11323');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11288, to_date('21-05-2022', 'dd-mm-yyyy'), '08:00', '16:00', '11268');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11289, to_date('05-05-2023', 'dd-mm-yyyy'), '08:00', '18:00', '11228');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11290, to_date('24-09-2023', 'dd-mm-yyyy'), '12:00', '16:00', '11186');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11291, to_date('04-05-2023', 'dd-mm-yyyy'), '12:00', '16:00', '11338');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11292, to_date('23-03-2023', 'dd-mm-yyyy'), '08:00', '16:00', '11350');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11293, to_date('05-08-2023', 'dd-mm-yyyy'), '12:00', '18:00', '11187');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11294, to_date('01-06-2020', 'dd-mm-yyyy'), '08:00', '18:00', '11168');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11295, to_date('31-03-2023', 'dd-mm-yyyy'), '12:00', '18:00', '11263');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11296, to_date('20-08-2021', 'dd-mm-yyyy'), '08:00', '16:00', '11206');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11297, to_date('31-08-2020', 'dd-mm-yyyy'), '12:00', '18:00', '11417');
commit;
prompt 200 records committed...
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11298, to_date('12-12-2022', 'dd-mm-yyyy'), '08:00', '16:00', '11138');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11299, to_date('26-07-2023', 'dd-mm-yyyy'), '12:00', '16:00', '11382');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11300, to_date('04-06-2021', 'dd-mm-yyyy'), '12:00', '16:00', '11214');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11301, to_date('17-05-2023', 'dd-mm-yyyy'), '08:00', '16:00', '11170');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11302, to_date('16-08-2022', 'dd-mm-yyyy'), '12:00', '18:00', '11428');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11303, to_date('01-11-2021', 'dd-mm-yyyy'), '08:00', '18:00', '11354');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11304, to_date('02-05-2020', 'dd-mm-yyyy'), '12:00', '18:00', '11189');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11305, to_date('26-11-2021', 'dd-mm-yyyy'), '08:00', '18:00', '11348');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11306, to_date('26-07-2020', 'dd-mm-yyyy'), '08:00', '16:00', '11490');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11307, to_date('01-11-2022', 'dd-mm-yyyy'), '12:00', '16:00', '11139');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11308, to_date('19-10-2021', 'dd-mm-yyyy'), '12:00', '18:00', '11281');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11309, to_date('29-07-2023', 'dd-mm-yyyy'), '12:00', '18:00', '11374');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11310, to_date('20-06-2023', 'dd-mm-yyyy'), '08:00', '16:00', '4');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11311, to_date('10-05-2022', 'dd-mm-yyyy'), '12:00', '16:00', '11416');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11312, to_date('12-09-2022', 'dd-mm-yyyy'), '08:00', '18:00', '11271');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11313, to_date('01-08-2020', 'dd-mm-yyyy'), '12:00', '16:00', '11216');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11314, to_date('28-04-2023', 'dd-mm-yyyy'), '12:00', '16:00', '11348');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11315, to_date('10-12-2022', 'dd-mm-yyyy'), '08:00', '16:00', '11304');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11316, to_date('03-02-2021', 'dd-mm-yyyy'), '08:00', '18:00', '11451');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11317, to_date('04-10-2021', 'dd-mm-yyyy'), '12:00', '18:00', '11184');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11318, to_date('14-03-2021', 'dd-mm-yyyy'), '08:00', '18:00', '11438');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11319, to_date('20-08-2021', 'dd-mm-yyyy'), '12:00', '16:00', '11214');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11320, to_date('30-12-2023', 'dd-mm-yyyy'), '08:00', '16:00', '11434');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11321, to_date('20-04-2020', 'dd-mm-yyyy'), '08:00', '18:00', '11431');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11322, to_date('29-12-2022', 'dd-mm-yyyy'), '08:00', '16:00', '11155');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11323, to_date('27-09-2021', 'dd-mm-yyyy'), '08:00', '16:00', '11378');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11324, to_date('09-02-2023', 'dd-mm-yyyy'), '08:00', '16:00', '11114');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11325, to_date('19-07-2021', 'dd-mm-yyyy'), '08:00', '16:00', '11361');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11326, to_date('24-02-2023', 'dd-mm-yyyy'), '12:00', '16:00', '11398');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11327, to_date('24-07-2020', 'dd-mm-yyyy'), '08:00', '16:00', '11391');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11328, to_date('26-07-2022', 'dd-mm-yyyy'), '08:00', '16:00', '6');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11329, to_date('17-09-2022', 'dd-mm-yyyy'), '08:00', '18:00', '11277');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11330, to_date('08-06-2020', 'dd-mm-yyyy'), '08:00', '16:00', '11391');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11331, to_date('26-02-2021', 'dd-mm-yyyy'), '12:00', '16:00', '11205');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11332, to_date('16-09-2022', 'dd-mm-yyyy'), '08:00', '16:00', '11178');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11333, to_date('19-08-2020', 'dd-mm-yyyy'), '12:00', '18:00', '11228');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11334, to_date('10-09-2021', 'dd-mm-yyyy'), '12:00', '18:00', '11190');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11335, to_date('02-02-2020', 'dd-mm-yyyy'), '08:00', '18:00', '11221');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11336, to_date('22-10-2023', 'dd-mm-yyyy'), '12:00', '18:00', '11191');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11337, to_date('14-07-2023', 'dd-mm-yyyy'), '12:00', '16:00', '11138');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11338, to_date('25-07-2021', 'dd-mm-yyyy'), '08:00', '18:00', '11416');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11339, to_date('04-03-2023', 'dd-mm-yyyy'), '08:00', '18:00', '11491');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11340, to_date('29-10-2021', 'dd-mm-yyyy'), '08:00', '18:00', '11185');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11341, to_date('05-10-2022', 'dd-mm-yyyy'), '12:00', '18:00', '11148');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11342, to_date('11-04-2022', 'dd-mm-yyyy'), '08:00', '18:00', '11170');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11343, to_date('25-03-2021', 'dd-mm-yyyy'), '08:00', '18:00', '11323');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11344, to_date('04-03-2020', 'dd-mm-yyyy'), '12:00', '16:00', '11348');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11345, to_date('18-07-2020', 'dd-mm-yyyy'), '08:00', '18:00', '11490');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11346, to_date('09-05-2021', 'dd-mm-yyyy'), '12:00', '16:00', '11492');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11347, to_date('01-11-2021', 'dd-mm-yyyy'), '12:00', '18:00', '11184');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11348, to_date('14-06-2021', 'dd-mm-yyyy'), '12:00', '16:00', '11409');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11349, to_date('29-09-2021', 'dd-mm-yyyy'), '08:00', '16:00', '11170');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11350, to_date('28-05-2023', 'dd-mm-yyyy'), '12:00', '16:00', '11277');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11351, to_date('23-01-2021', 'dd-mm-yyyy'), '12:00', '16:00', '11366');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11352, to_date('13-03-2023', 'dd-mm-yyyy'), '12:00', '18:00', '11428');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11353, to_date('04-08-2021', 'dd-mm-yyyy'), '12:00', '16:00', '11415');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11354, to_date('04-11-2023', 'dd-mm-yyyy'), '12:00', '16:00', '11121');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11355, to_date('02-04-2023', 'dd-mm-yyyy'), '12:00', '16:00', '11350');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11356, to_date('22-08-2021', 'dd-mm-yyyy'), '08:00', '16:00', '11147');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11357, to_date('16-06-2021', 'dd-mm-yyyy'), '12:00', '18:00', '11187');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11358, to_date('26-08-2020', 'dd-mm-yyyy'), '08:00', '16:00', '11208');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11359, to_date('24-09-2020', 'dd-mm-yyyy'), '12:00', '16:00', '11484');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11360, to_date('16-06-2023', 'dd-mm-yyyy'), '08:00', '18:00', '11189');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11361, to_date('31-07-2020', 'dd-mm-yyyy'), '08:00', '16:00', '11411');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11362, to_date('17-02-2022', 'dd-mm-yyyy'), '08:00', '18:00', '11168');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11363, to_date('06-08-2021', 'dd-mm-yyyy'), '08:00', '18:00', '11374');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11364, to_date('04-07-2021', 'dd-mm-yyyy'), '12:00', '16:00', '11207');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11365, to_date('02-11-2023', 'dd-mm-yyyy'), '08:00', '18:00', '11274');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11366, to_date('25-08-2022', 'dd-mm-yyyy'), '12:00', '18:00', '11147');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11367, to_date('08-06-2021', 'dd-mm-yyyy'), '08:00', '18:00', '11307');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11368, to_date('07-08-2022', 'dd-mm-yyyy'), '08:00', '16:00', '11117');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11369, to_date('23-06-2021', 'dd-mm-yyyy'), '08:00', '16:00', '11308');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11370, to_date('20-05-2022', 'dd-mm-yyyy'), '08:00', '18:00', '11274');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11371, to_date('06-02-2023', 'dd-mm-yyyy'), '12:00', '16:00', '11417');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11372, to_date('26-03-2023', 'dd-mm-yyyy'), '08:00', '16:00', '11128');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11373, to_date('18-11-2020', 'dd-mm-yyyy'), '08:00', '18:00', '11274');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11374, to_date('02-02-2023', 'dd-mm-yyyy'), '12:00', '18:00', '11268');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11375, to_date('10-06-2020', 'dd-mm-yyyy'), '08:00', '18:00', '11354');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11376, to_date('05-05-2021', 'dd-mm-yyyy'), '12:00', '16:00', '11114');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11377, to_date('25-04-2022', 'dd-mm-yyyy'), '12:00', '16:00', '11172');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11378, to_date('29-10-2023', 'dd-mm-yyyy'), '08:00', '16:00', '11263');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11379, to_date('23-01-2022', 'dd-mm-yyyy'), '12:00', '18:00', '11221');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11380, to_date('22-01-2020', 'dd-mm-yyyy'), '08:00', '16:00', '11438');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11381, to_date('28-08-2022', 'dd-mm-yyyy'), '12:00', '18:00', '11203');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11382, to_date('23-09-2020', 'dd-mm-yyyy'), '08:00', '16:00', '11138');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11383, to_date('28-01-2023', 'dd-mm-yyyy'), '08:00', '16:00', '11246');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11384, to_date('15-06-2023', 'dd-mm-yyyy'), '12:00', '18:00', '11411');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11385, to_date('08-03-2023', 'dd-mm-yyyy'), '12:00', '16:00', '11187');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11386, to_date('30-09-2022', 'dd-mm-yyyy'), '08:00', '16:00', '11357');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11387, to_date('03-11-2020', 'dd-mm-yyyy'), '08:00', '16:00', '11377');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11388, to_date('15-04-2020', 'dd-mm-yyyy'), '12:00', '18:00', '11396');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11389, to_date('14-04-2021', 'dd-mm-yyyy'), '12:00', '16:00', '11283');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11390, to_date('24-05-2023', 'dd-mm-yyyy'), '08:00', '16:00', '11114');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11391, to_date('23-09-2022', 'dd-mm-yyyy'), '12:00', '16:00', '11428');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11392, to_date('08-10-2023', 'dd-mm-yyyy'), '08:00', '18:00', '11270');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11393, to_date('29-03-2022', 'dd-mm-yyyy'), '08:00', '18:00', '11380');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11394, to_date('01-07-2020', 'dd-mm-yyyy'), '12:00', '16:00', '11114');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11395, to_date('09-11-2021', 'dd-mm-yyyy'), '08:00', '18:00', '11151');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11396, to_date('16-04-2023', 'dd-mm-yyyy'), '08:00', '16:00', '11333');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11397, to_date('14-12-2022', 'dd-mm-yyyy'), '12:00', '16:00', '4');
commit;
prompt 300 records committed...
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11398, to_date('17-12-2023', 'dd-mm-yyyy'), '12:00', '18:00', '11307');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11399, to_date('07-11-2020', 'dd-mm-yyyy'), '12:00', '18:00', '11492');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11400, to_date('09-03-2020', 'dd-mm-yyyy'), '12:00', '18:00', '8');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11401, to_date('15-09-2023', 'dd-mm-yyyy'), '12:00', '16:00', '8');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11402, to_date('29-06-2023', 'dd-mm-yyyy'), '12:00', '16:00', '11348');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11403, to_date('05-08-2023', 'dd-mm-yyyy'), '08:00', '16:00', '11453');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11404, to_date('29-06-2023', 'dd-mm-yyyy'), '12:00', '16:00', '11489');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11405, to_date('28-11-2023', 'dd-mm-yyyy'), '12:00', '16:00', '11187');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11406, to_date('17-05-2020', 'dd-mm-yyyy'), '12:00', '16:00', '11484');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11407, to_date('18-12-2022', 'dd-mm-yyyy'), '12:00', '18:00', '11417');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11408, to_date('01-09-2021', 'dd-mm-yyyy'), '08:00', '18:00', '11148');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11409, to_date('09-11-2021', 'dd-mm-yyyy'), '08:00', '18:00', '11128');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11410, to_date('17-03-2023', 'dd-mm-yyyy'), '08:00', '16:00', '11354');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11411, to_date('06-08-2020', 'dd-mm-yyyy'), '12:00', '16:00', '11169');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11412, to_date('20-05-2022', 'dd-mm-yyyy'), '08:00', '16:00', '10');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11413, to_date('20-06-2022', 'dd-mm-yyyy'), '08:00', '18:00', '11144');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11414, to_date('25-08-2023', 'dd-mm-yyyy'), '08:00', '18:00', '11434');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11415, to_date('21-08-2022', 'dd-mm-yyyy'), '12:00', '18:00', '11186');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11416, to_date('27-03-2020', 'dd-mm-yyyy'), '12:00', '18:00', '11139');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11417, to_date('14-01-2021', 'dd-mm-yyyy'), '12:00', '18:00', '11187');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11418, to_date('05-03-2020', 'dd-mm-yyyy'), '08:00', '18:00', '11322');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11419, to_date('24-06-2023', 'dd-mm-yyyy'), '08:00', '16:00', '11154');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11420, to_date('09-07-2020', 'dd-mm-yyyy'), '08:00', '18:00', '11422');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11421, to_date('01-01-2023', 'dd-mm-yyyy'), '12:00', '18:00', '11479');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11422, to_date('04-11-2021', 'dd-mm-yyyy'), '08:00', '18:00', '11128');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11423, to_date('08-07-2021', 'dd-mm-yyyy'), '12:00', '16:00', '11168');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11424, to_date('23-12-2022', 'dd-mm-yyyy'), '12:00', '18:00', '4');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11425, to_date('29-08-2023', 'dd-mm-yyyy'), '12:00', '18:00', '11206');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11426, to_date('03-01-2020', 'dd-mm-yyyy'), '12:00', '16:00', '10');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11427, to_date('27-11-2022', 'dd-mm-yyyy'), '12:00', '18:00', '11456');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11428, to_date('10-07-2021', 'dd-mm-yyyy'), '12:00', '18:00', '11478');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11429, to_date('13-12-2023', 'dd-mm-yyyy'), '12:00', '18:00', '11277');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11430, to_date('05-02-2020', 'dd-mm-yyyy'), '08:00', '18:00', '11357');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11431, to_date('21-04-2021', 'dd-mm-yyyy'), '08:00', '18:00', '11263');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11432, to_date('13-01-2020', 'dd-mm-yyyy'), '08:00', '16:00', '11315');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11433, to_date('08-03-2022', 'dd-mm-yyyy'), '12:00', '18:00', '11309');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11434, to_date('11-05-2021', 'dd-mm-yyyy'), '12:00', '16:00', '11484');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11435, to_date('13-08-2021', 'dd-mm-yyyy'), '12:00', '18:00', '11289');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11436, to_date('25-01-2020', 'dd-mm-yyyy'), '12:00', '16:00', '11380');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11437, to_date('22-10-2021', 'dd-mm-yyyy'), '12:00', '18:00', '11500');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11438, to_date('09-08-2020', 'dd-mm-yyyy'), '08:00', '18:00', '11415');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11439, to_date('06-10-2023', 'dd-mm-yyyy'), '08:00', '18:00', '11413');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11440, to_date('15-08-2020', 'dd-mm-yyyy'), '12:00', '16:00', '11186');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11441, to_date('22-02-2023', 'dd-mm-yyyy'), '08:00', '18:00', '11356');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11442, to_date('18-12-2023', 'dd-mm-yyyy'), '12:00', '18:00', '11205');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11443, to_date('28-05-2022', 'dd-mm-yyyy'), '08:00', '16:00', '11492');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11444, to_date('23-11-2021', 'dd-mm-yyyy'), '12:00', '18:00', '11185');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11445, to_date('22-02-2023', 'dd-mm-yyyy'), '12:00', '16:00', '11152');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11446, to_date('16-08-2022', 'dd-mm-yyyy'), '08:00', '18:00', '11451');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11447, to_date('20-09-2022', 'dd-mm-yyyy'), '12:00', '16:00', '3');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11448, to_date('05-01-2021', 'dd-mm-yyyy'), '12:00', '16:00', '11174');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11449, to_date('18-02-2023', 'dd-mm-yyyy'), '08:00', '16:00', '11420');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11450, to_date('07-08-2020', 'dd-mm-yyyy'), '08:00', '16:00', '11265');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11451, to_date('17-02-2020', 'dd-mm-yyyy'), '12:00', '16:00', '11187');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11452, to_date('23-10-2023', 'dd-mm-yyyy'), '12:00', '16:00', '11187');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11453, to_date('29-07-2020', 'dd-mm-yyyy'), '08:00', '16:00', '11128');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11454, to_date('21-06-2022', 'dd-mm-yyyy'), '08:00', '18:00', '11318');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11455, to_date('25-01-2020', 'dd-mm-yyyy'), '12:00', '18:00', '11392');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11456, to_date('18-07-2020', 'dd-mm-yyyy'), '08:00', '18:00', '11198');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11457, to_date('22-10-2020', 'dd-mm-yyyy'), '08:00', '16:00', '11343');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11458, to_date('15-02-2021', 'dd-mm-yyyy'), '08:00', '18:00', '11411');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11459, to_date('18-09-2021', 'dd-mm-yyyy'), '08:00', '18:00', '11197');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11460, to_date('05-09-2021', 'dd-mm-yyyy'), '12:00', '16:00', '11178');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11461, to_date('17-10-2020', 'dd-mm-yyyy'), '08:00', '16:00', '11263');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11462, to_date('12-07-2021', 'dd-mm-yyyy'), '08:00', '16:00', '11350');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11463, to_date('04-10-2021', 'dd-mm-yyyy'), '08:00', '16:00', '11357');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11464, to_date('11-08-2021', 'dd-mm-yyyy'), '12:00', '16:00', '11117');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11465, to_date('19-11-2020', 'dd-mm-yyyy'), '12:00', '18:00', '11154');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11466, to_date('15-06-2020', 'dd-mm-yyyy'), '12:00', '16:00', '7');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11467, to_date('21-02-2022', 'dd-mm-yyyy'), '08:00', '16:00', '11475');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11468, to_date('07-06-2022', 'dd-mm-yyyy'), '08:00', '18:00', '11197');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11469, to_date('20-07-2020', 'dd-mm-yyyy'), '08:00', '18:00', '11174');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11470, to_date('31-03-2022', 'dd-mm-yyyy'), '12:00', '18:00', '11168');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11471, to_date('22-10-2021', 'dd-mm-yyyy'), '08:00', '18:00', '11230');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11472, to_date('03-09-2021', 'dd-mm-yyyy'), '12:00', '16:00', '11417');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11473, to_date('22-02-2022', 'dd-mm-yyyy'), '08:00', '18:00', '11484');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11474, to_date('24-07-2022', 'dd-mm-yyyy'), '12:00', '16:00', '1');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11475, to_date('15-06-2020', 'dd-mm-yyyy'), '12:00', '16:00', '4');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11476, to_date('23-01-2020', 'dd-mm-yyyy'), '08:00', '16:00', '11208');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11477, to_date('26-08-2022', 'dd-mm-yyyy'), '12:00', '18:00', '11455');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11478, to_date('16-02-2020', 'dd-mm-yyyy'), '08:00', '18:00', '11221');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11479, to_date('16-04-2022', 'dd-mm-yyyy'), '08:00', '16:00', '11265');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11480, to_date('04-04-2021', 'dd-mm-yyyy'), '12:00', '16:00', '11271');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11481, to_date('07-06-2021', 'dd-mm-yyyy'), '12:00', '18:00', '11489');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11482, to_date('26-06-2020', 'dd-mm-yyyy'), '12:00', '18:00', '11456');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11483, to_date('08-10-2023', 'dd-mm-yyyy'), '12:00', '18:00', '11199');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11484, to_date('15-08-2023', 'dd-mm-yyyy'), '12:00', '18:00', '11478');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11485, to_date('23-12-2023', 'dd-mm-yyyy'), '12:00', '18:00', '11283');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11486, to_date('29-09-2023', 'dd-mm-yyyy'), '08:00', '16:00', '11348');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11487, to_date('07-05-2021', 'dd-mm-yyyy'), '12:00', '18:00', '11205');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11488, to_date('12-12-2023', 'dd-mm-yyyy'), '12:00', '16:00', '11382');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11489, to_date('26-08-2021', 'dd-mm-yyyy'), '12:00', '18:00', '11344');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11490, to_date('28-04-2020', 'dd-mm-yyyy'), '12:00', '18:00', '11469');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11491, to_date('01-04-2023', 'dd-mm-yyyy'), '08:00', '18:00', '11306');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11492, to_date('23-03-2021', 'dd-mm-yyyy'), '08:00', '16:00', '11214');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11493, to_date('17-06-2023', 'dd-mm-yyyy'), '08:00', '18:00', '11228');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11494, to_date('22-09-2022', 'dd-mm-yyyy'), '12:00', '16:00', '11350');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11495, to_date('09-03-2021', 'dd-mm-yyyy'), '12:00', '18:00', '11283');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11496, to_date('21-05-2020', 'dd-mm-yyyy'), '12:00', '16:00', '11488');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11497, to_date('10-10-2023', 'dd-mm-yyyy'), '12:00', '16:00', '11432');
commit;
prompt 400 records committed...
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11498, to_date('31-03-2021', 'dd-mm-yyyy'), '08:00', '16:00', '11307');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11499, to_date('18-02-2022', 'dd-mm-yyyy'), '08:00', '18:00', '11255');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11500, to_date('21-01-2020', 'dd-mm-yyyy'), '08:00', '18:00', '11307');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11501, to_date('06-02-2022', 'dd-mm-yyyy'), '08:00', '18:00', '11255');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11502, to_date('08-10-2023', 'dd-mm-yyyy'), '08:00', '18:00', '11182');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11503, to_date('25-01-2020', 'dd-mm-yyyy'), '08:00', '16:00', '11224');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11504, to_date('16-04-2020', 'dd-mm-yyyy'), '12:00', '16:00', '11179');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11505, to_date('29-10-2022', 'dd-mm-yyyy'), '08:00', '18:00', '11484');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11506, to_date('23-06-2023', 'dd-mm-yyyy'), '08:00', '16:00', '11281');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11507, to_date('19-09-2023', 'dd-mm-yyyy'), '12:00', '18:00', '11307');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11508, to_date('09-05-2022', 'dd-mm-yyyy'), '08:00', '18:00', '11182');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11509, to_date('18-12-2022', 'dd-mm-yyyy'), '12:00', '16:00', '11475');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11510, to_date('18-08-2022', 'dd-mm-yyyy'), '08:00', '18:00', '11257');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11511, to_date('27-11-2021', 'dd-mm-yyyy'), '08:00', '16:00', '1');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11512, to_date('05-04-2022', 'dd-mm-yyyy'), '08:00', '16:00', '11165');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11513, to_date('29-05-2021', 'dd-mm-yyyy'), '08:00', '16:00', '11308');
commit;
prompt 416 records loaded
prompt Loading EVENT...
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (1, 'Birth', 'Tel Aviv', to_date('01-01-2024', 'dd-mm-yyyy'), 1);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (2, 'Burn', 'Jerusalem', to_date('01-02-2024', 'dd-mm-yyyy'), 2);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (3, 'Shooting Attack', 'Haifa', to_date('01-03-2024', 'dd-mm-yyyy'), 3);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (4, 'Car Accident', 'Beersheba', to_date('01-04-2024', 'dd-mm-yyyy'), 4);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (5, 'Heart Attack', 'Rishon LeZion', to_date('01-05-2024', 'dd-mm-yyyy'), 5);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (6, 'Stroke', 'Petah Tikva', to_date('01-06-2024', 'dd-mm-yyyy'), 6);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (7, 'Drowning', 'Ashdod', to_date('01-07-2024', 'dd-mm-yyyy'), 7);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (8, 'Electrocution', 'Netanya', to_date('01-08-2024', 'dd-mm-yyyy'), 8);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (9, 'Fall Injury', 'Holon', to_date('01-09-2024', 'dd-mm-yyyy'), 9);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (10, 'Poisoning', 'Bnei Brak', to_date('01-10-2024', 'dd-mm-yyyy'), 10);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11111, 'Shooting Attack', 'Biella', to_date('12-08-2020', 'dd-mm-yyyy'), 11143);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11112, 'Burn', 'Maidstone', to_date('22-11-2020', 'dd-mm-yyyy'), 11266);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11113, 'Burn', 'Recife', to_date('11-07-2023', 'dd-mm-yyyy'), 11200);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11114, 'Birth', 'Charlottesville', to_date('28-01-2020', 'dd-mm-yyyy'), 11378);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11115, 'Fall Injury', 'Lisbon', to_date('17-06-2023', 'dd-mm-yyyy'), 11243);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11116, 'Car Accident', 'Malm׳¦', to_date('10-12-2023', 'dd-mm-yyyy'), 11);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11117, 'Birth', 'Dinslaken', to_date('19-03-2021', 'dd-mm-yyyy'), 11500);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11118, 'Car Accident', 'Tallahassee', to_date('13-10-2023', 'dd-mm-yyyy'), 11346);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11119, 'Poisoning', 'Dortmund', to_date('28-04-2023', 'dd-mm-yyyy'), 11286);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11120, 'Fall Injury', 'Juazeiro', to_date('17-05-2023', 'dd-mm-yyyy'), 11305);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11121, 'Fall Injury', 'Singapore', to_date('18-09-2023', 'dd-mm-yyyy'), 11357);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11122, 'Birth', 'Foster City', to_date('10-10-2021', 'dd-mm-yyyy'), 11317);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11123, 'Poisoning', 'Media', to_date('09-09-2022', 'dd-mm-yyyy'), 11270);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11124, 'Shooting Attack', 'Colorado Springs', to_date('11-03-2020', 'dd-mm-yyyy'), 11150);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11125, 'Shooting Attack', 'The Woodlands', to_date('07-07-2020', 'dd-mm-yyyy'), 11187);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11126, 'Fall Injury', 'Hanover', to_date('06-12-2020', 'dd-mm-yyyy'), 11208);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11127, 'Birth', 'Kanazawa', to_date('20-08-2021', 'dd-mm-yyyy'), 11392);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11128, 'Car Accident', 'Di Savigliano', to_date('14-09-2020', 'dd-mm-yyyy'), 11237);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11129, 'Birth', 'Bloomington', to_date('18-10-2020', 'dd-mm-yyyy'), 11358);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11130, 'Fall Injury', 'Ramat Gan', to_date('29-12-2022', 'dd-mm-yyyy'), 11425);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11131, 'Burn', 'Sao caetano do sul', to_date('20-06-2023', 'dd-mm-yyyy'), 11469);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11132, 'Burn', 'Holderbank', to_date('05-03-2021', 'dd-mm-yyyy'), 11271);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11133, 'Birth', 'Vallauris', to_date('24-06-2021', 'dd-mm-yyyy'), 12);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11134, 'Birth', 'Marietta', to_date('06-05-2021', 'dd-mm-yyyy'), 11420);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11135, 'Fall Injury', 'Kuraby', to_date('02-09-2023', 'dd-mm-yyyy'), 11432);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11136, 'Shooting Attack', 'Johor Bahru', to_date('09-12-2021', 'dd-mm-yyyy'), 11404);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11137, 'Poisoning', 'Naestved', to_date('14-06-2021', 'dd-mm-yyyy'), 11334);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11138, 'Fall Injury', 'Portland', to_date('28-11-2020', 'dd-mm-yyyy'), 11262);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11139, 'Shooting Attack', 'Pacific Grove', to_date('02-12-2023', 'dd-mm-yyyy'), 11195);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11140, 'Car Accident', 'Darmstadt', to_date('11-12-2022', 'dd-mm-yyyy'), 11246);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11141, 'Poisoning', 'Rockland', to_date('26-12-2023', 'dd-mm-yyyy'), 11430);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11142, 'Poisoning', 'Boulogne', to_date('13-08-2021', 'dd-mm-yyyy'), 11364);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11143, 'Fall Injury', 'Wehrheim', to_date('15-04-2020', 'dd-mm-yyyy'), 11141);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11144, 'Car Accident', 'Bethesda', to_date('17-08-2022', 'dd-mm-yyyy'), 11418);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11145, 'Fall Injury', 'Courbevoie', to_date('28-04-2023', 'dd-mm-yyyy'), 11308);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11146, 'Fall Injury', 'Berlin-Adlershof', to_date('12-10-2022', 'dd-mm-yyyy'), 11159);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11147, 'Birth', 'Elche', to_date('01-09-2021', 'dd-mm-yyyy'), 11389);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11148, 'Shooting Attack', 'Chambery', to_date('19-08-2021', 'dd-mm-yyyy'), 11410);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11149, 'Shooting Attack', 'Corona', to_date('18-07-2020', 'dd-mm-yyyy'), 11286);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11150, 'Shooting Attack', 'Olympia', to_date('11-11-2021', 'dd-mm-yyyy'), 11135);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11151, 'Birth', 'Cerritos', to_date('22-11-2020', 'dd-mm-yyyy'), 11270);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11152, 'Poisoning', 'Spring City', to_date('28-01-2021', 'dd-mm-yyyy'), 11135);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11153, 'Birth', 'Knoxville', to_date('10-03-2020', 'dd-mm-yyyy'), 11434);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11154, 'Poisoning', 'Sundsvall', to_date('14-09-2022', 'dd-mm-yyyy'), 11124);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11155, 'Fall Injury', 'Istanbul', to_date('19-09-2021', 'dd-mm-yyyy'), 11262);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11156, 'Poisoning', 'Oxford', to_date('01-11-2022', 'dd-mm-yyyy'), 11427);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11157, 'Poisoning', 'Hochwald', to_date('02-06-2022', 'dd-mm-yyyy'), 11470);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11158, 'Burn', 'Warsaw', to_date('25-02-2020', 'dd-mm-yyyy'), 11343);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11159, 'Car Accident', 'Irkutsk', to_date('23-11-2020', 'dd-mm-yyyy'), 11387);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11160, 'Fall Injury', 'Mount Laurel', to_date('09-02-2020', 'dd-mm-yyyy'), 11396);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11161, 'Birth', 'Foster City', to_date('03-06-2021', 'dd-mm-yyyy'), 11134);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11162, 'Birth', 'Bristol', to_date('06-02-2020', 'dd-mm-yyyy'), 11331);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11163, 'Fall Injury', 'Hines', to_date('01-11-2023', 'dd-mm-yyyy'), 11251);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11164, 'Burn', 'Pearland', to_date('05-09-2023', 'dd-mm-yyyy'), 11387);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11165, 'Shooting Attack', 'Mantova', to_date('11-10-2022', 'dd-mm-yyyy'), 11239);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11166, 'Shooting Attack', 'Blue bell', to_date('16-01-2020', 'dd-mm-yyyy'), 11349);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11167, 'Burn', 'Manaus', to_date('10-10-2022', 'dd-mm-yyyy'), 11408);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11168, 'Birth', 'Koppl', to_date('23-06-2021', 'dd-mm-yyyy'), 11247);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11169, 'Fall Injury', 'Carson City', to_date('19-04-2022', 'dd-mm-yyyy'), 11314);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11170, 'Poisoning', 'Vancouver', to_date('27-04-2020', 'dd-mm-yyyy'), 11131);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11171, 'Poisoning', 'Casselberry', to_date('25-01-2020', 'dd-mm-yyyy'), 11242);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11172, 'Fall Injury', 'Osaka', to_date('21-09-2023', 'dd-mm-yyyy'), 11224);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11173, 'Fall Injury', 'Moorestown', to_date('06-03-2021', 'dd-mm-yyyy'), 11246);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11174, 'Car Accident', 'Salzburg', to_date('07-07-2021', 'dd-mm-yyyy'), 11255);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11175, 'Fall Injury', 'Gothenburg', to_date('19-09-2020', 'dd-mm-yyyy'), 11199);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11176, 'Poisoning', 'Matsuyama', to_date('17-01-2023', 'dd-mm-yyyy'), 11363);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11177, 'Shooting Attack', 'Clark', to_date('08-10-2022', 'dd-mm-yyyy'), 11240);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11178, 'Poisoning', 'Americana', to_date('24-05-2020', 'dd-mm-yyyy'), 11418);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11179, 'Fall Injury', 'Olympia', to_date('08-07-2021', 'dd-mm-yyyy'), 11399);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11180, 'Shooting Attack', 'Macclesfield', to_date('13-01-2021', 'dd-mm-yyyy'), 11268);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11181, 'Fall Injury', 'Gen׳˜ve', to_date('12-11-2021', 'dd-mm-yyyy'), 11404);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11182, 'Shooting Attack', 'Wן¢•rzburg', to_date('03-02-2023', 'dd-mm-yyyy'), 11269);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11183, 'Fall Injury', 'Grapevine', to_date('01-03-2020', 'dd-mm-yyyy'), 11270);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11184, 'Car Accident', 'Long Island City', to_date('15-03-2023', 'dd-mm-yyyy'), 11428);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11185, 'Car Accident', 'Regina', to_date('17-01-2020', 'dd-mm-yyyy'), 11116);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11186, 'Poisoning', 'Padova', to_date('12-04-2022', 'dd-mm-yyyy'), 11489);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11187, 'Fall Injury', 'Mainz-kastel', to_date('07-07-2020', 'dd-mm-yyyy'), 11373);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11188, 'Poisoning', 'Redwood Shores', to_date('02-05-2021', 'dd-mm-yyyy'), 11133);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11189, 'Car Accident', 'Cuenca', to_date('29-11-2022', 'dd-mm-yyyy'), 11165);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11190, 'Burn', 'Biel', to_date('24-10-2021', 'dd-mm-yyyy'), 11452);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11191, 'Birth', 'O''fallon', to_date('27-04-2020', 'dd-mm-yyyy'), 11111);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11192, 'Fall Injury', 'Sao caetano do sul', to_date('17-05-2023', 'dd-mm-yyyy'), 11198);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11193, 'Shooting Attack', 'North Yorkshire', to_date('03-06-2021', 'dd-mm-yyyy'), 11117);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11194, 'Fall Injury', 'Cherepovets', to_date('16-04-2021', 'dd-mm-yyyy'), 11449);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11195, 'Fall Injury', 'Fukui', to_date('10-06-2021', 'dd-mm-yyyy'), 11182);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11196, 'Fall Injury', 'Streamwood', to_date('19-02-2020', 'dd-mm-yyyy'), 11361);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11197, 'Birth', 'Buffalo Grove', to_date('25-12-2021', 'dd-mm-yyyy'), 11208);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11198, 'Birth', 'Oyten', to_date('25-04-2022', 'dd-mm-yyyy'), 11446);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11199, 'Fall Injury', 'Caguas', to_date('14-12-2022', 'dd-mm-yyyy'), 11432);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11200, 'Birth', 'East Peoria', to_date('15-04-2023', 'dd-mm-yyyy'), 11395);
commit;
prompt 100 records committed...
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11201, 'Burn', 'Protvino', to_date('27-08-2020', 'dd-mm-yyyy'), 11474);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11202, 'Fall Injury', 'Southampton', to_date('17-05-2020', 'dd-mm-yyyy'), 11224);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11203, 'Fall Injury', 'California', to_date('30-08-2020', 'dd-mm-yyyy'), 11214);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11204, 'Fall Injury', 'Uden', to_date('12-10-2021', 'dd-mm-yyyy'), 11336);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11205, 'Fall Injury', 'Trieste', to_date('19-07-2020', 'dd-mm-yyyy'), 11234);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11206, 'Burn', 'Fort McMurray', to_date('12-06-2020', 'dd-mm-yyyy'), 11370);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11207, 'Shooting Attack', 'Lippetal', to_date('12-01-2020', 'dd-mm-yyyy'), 11228);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11208, 'Poisoning', 'Algermissen', to_date('29-11-2023', 'dd-mm-yyyy'), 2);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11209, 'Birth', 'Fairbanks', to_date('06-03-2022', 'dd-mm-yyyy'), 11292);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11210, 'Fall Injury', 'Zuerich', to_date('13-05-2020', 'dd-mm-yyyy'), 11374);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11211, 'Birth', 'Chapeco', to_date('14-01-2021', 'dd-mm-yyyy'), 11429);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11212, 'Shooting Attack', 'Peine', to_date('18-03-2022', 'dd-mm-yyyy'), 11272);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11213, 'Shooting Attack', 'Goiania', to_date('24-04-2020', 'dd-mm-yyyy'), 11281);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11214, 'Car Accident', 'Cypress', to_date('23-05-2022', 'dd-mm-yyyy'), 11394);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11215, 'Shooting Attack', 'Hayward', to_date('29-12-2023', 'dd-mm-yyyy'), 11477);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11216, 'Car Accident', 'Raleigh', to_date('19-11-2021', 'dd-mm-yyyy'), 11270);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11217, 'Fall Injury', 'Takapuna', to_date('12-07-2021', 'dd-mm-yyyy'), 11389);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11218, 'Birth', 'Fornacette', to_date('25-05-2022', 'dd-mm-yyyy'), 13);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11219, 'Fall Injury', 'K׳¨benhavn', to_date('02-04-2023', 'dd-mm-yyyy'), 11399);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11220, 'Fall Injury', 'Buenos Aires', to_date('09-02-2020', 'dd-mm-yyyy'), 11271);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11221, 'Shooting Attack', 'Coldmeece', to_date('06-05-2021', 'dd-mm-yyyy'), 11319);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11222, 'Burn', 'Suwon-city', to_date('04-01-2021', 'dd-mm-yyyy'), 11264);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11223, 'Burn', 'Santana do parna׳ba', to_date('05-10-2023', 'dd-mm-yyyy'), 11326);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11224, 'Birth', 'San Jose', to_date('28-07-2022', 'dd-mm-yyyy'), 11433);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11225, 'Birth', 'Towson', to_date('21-05-2023', 'dd-mm-yyyy'), 11214);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11226, 'Birth', 'Gummersbach', to_date('08-02-2020', 'dd-mm-yyyy'), 11251);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11227, 'Burn', 'Paisley', to_date('15-10-2020', 'dd-mm-yyyy'), 11132);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11228, 'Poisoning', 'Milwaukee', to_date('01-12-2020', 'dd-mm-yyyy'), 11494);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11229, 'Birth', 'Brisbane', to_date('10-11-2023', 'dd-mm-yyyy'), 11367);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11230, 'Fall Injury', 'Media', to_date('18-10-2021', 'dd-mm-yyyy'), 11403);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11231, 'Shooting Attack', 'Courbevoie', to_date('04-11-2023', 'dd-mm-yyyy'), 11189);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11232, 'Burn', 'Key Biscayne', to_date('25-05-2023', 'dd-mm-yyyy'), 11265);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11233, 'Birth', 'Freising', to_date('24-07-2020', 'dd-mm-yyyy'), 11263);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11234, 'Burn', 'Juneau', to_date('01-09-2022', 'dd-mm-yyyy'), 11214);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11235, 'Car Accident', 'Pusan-city', to_date('03-03-2022', 'dd-mm-yyyy'), 11396);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11236, 'Burn', 'Wuerzburg', to_date('27-09-2023', 'dd-mm-yyyy'), 11142);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11237, 'Birth', 'Goteborg', to_date('02-06-2021', 'dd-mm-yyyy'), 11248);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11238, 'Car Accident', 'Chorz׳£w', to_date('16-03-2022', 'dd-mm-yyyy'), 11395);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11239, 'Car Accident', 'Media', to_date('10-01-2020', 'dd-mm-yyyy'), 11351);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11240, 'Fall Injury', 'Peine', to_date('23-08-2022', 'dd-mm-yyyy'), 11126);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11241, 'Burn', 'Erlangen', to_date('17-01-2023', 'dd-mm-yyyy'), 11214);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11242, 'Birth', 'Rorschach', to_date('01-10-2021', 'dd-mm-yyyy'), 11311);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11243, 'Car Accident', 'Nizhnevartovsk', to_date('07-04-2020', 'dd-mm-yyyy'), 11242);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11244, 'Shooting Attack', 'San Jose', to_date('13-11-2023', 'dd-mm-yyyy'), 11281);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11245, 'Poisoning', 'Lucca', to_date('23-02-2022', 'dd-mm-yyyy'), 11328);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11246, 'Car Accident', 'Bergara', to_date('24-07-2021', 'dd-mm-yyyy'), 11308);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11247, 'Poisoning', 'Sao paulo', to_date('20-08-2020', 'dd-mm-yyyy'), 11447);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11248, 'Car Accident', 'H׳”ssleholm', to_date('02-07-2020', 'dd-mm-yyyy'), 11418);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11249, 'Birth', 'Karachi', to_date('02-05-2023', 'dd-mm-yyyy'), 11328);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11250, 'Car Accident', 'Erlangen', to_date('22-06-2022', 'dd-mm-yyyy'), 11306);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11251, 'Fall Injury', 'Chinnor', to_date('12-06-2022', 'dd-mm-yyyy'), 11297);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11252, 'Car Accident', 'Middletown', to_date('01-01-2022', 'dd-mm-yyyy'), 11267);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11253, 'Poisoning', 'Rockland', to_date('05-04-2022', 'dd-mm-yyyy'), 11422);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11254, 'Burn', 'Ithaca', to_date('30-05-2022', 'dd-mm-yyyy'), 11202);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11255, 'Birth', 'Fremont', to_date('28-08-2022', 'dd-mm-yyyy'), 11482);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11256, 'Birth', 'Newcastle upon Tyne', to_date('07-09-2022', 'dd-mm-yyyy'), 11188);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11257, 'Poisoning', 'Maryville', to_date('29-12-2020', 'dd-mm-yyyy'), 11280);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11258, 'Birth', 'Mapo-gu', to_date('17-11-2020', 'dd-mm-yyyy'), 11198);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11259, 'Car Accident', 'Hackensack', to_date('07-10-2021', 'dd-mm-yyyy'), 11364);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11260, 'Birth', 'Carlin', to_date('23-03-2022', 'dd-mm-yyyy'), 11401);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11261, 'Fall Injury', 'St Kilda', to_date('09-06-2023', 'dd-mm-yyyy'), 11345);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11262, 'Burn', 'Shawnee', to_date('05-02-2022', 'dd-mm-yyyy'), 11481);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11263, 'Fall Injury', 'Mechanicsburg', to_date('14-12-2023', 'dd-mm-yyyy'), 11331);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11264, 'Poisoning', 'Hartford', to_date('02-07-2023', 'dd-mm-yyyy'), 11249);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11265, 'Shooting Attack', 'Varzea grande', to_date('30-07-2020', 'dd-mm-yyyy'), 11384);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11266, 'Fall Injury', 'Cambridge', to_date('02-03-2023', 'dd-mm-yyyy'), 11306);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11267, 'Fall Injury', 'Leimen', to_date('06-05-2022', 'dd-mm-yyyy'), 11239);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11268, 'Burn', 'Udine', to_date('18-04-2020', 'dd-mm-yyyy'), 11134);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11269, 'Birth', 'Long Island City', to_date('17-09-2022', 'dd-mm-yyyy'), 11382);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11270, 'Fall Injury', 'Prague', to_date('28-11-2022', 'dd-mm-yyyy'), 11443);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11271, 'Car Accident', 'Eden prairie', to_date('15-01-2023', 'dd-mm-yyyy'), 11280);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11272, 'Fall Injury', 'Bad Oeynhausen', to_date('23-09-2021', 'dd-mm-yyyy'), 11154);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11273, 'Fall Injury', 'Rothenburg', to_date('21-08-2023', 'dd-mm-yyyy'), 11139);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11274, 'Shooting Attack', 'Phoenix', to_date('08-10-2022', 'dd-mm-yyyy'), 11112);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11275, 'Poisoning', 'Leawood', to_date('11-01-2021', 'dd-mm-yyyy'), 11291);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11276, 'Shooting Attack', 'Fairfax', to_date('23-04-2023', 'dd-mm-yyyy'), 11319);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11277, 'Birth', 'St Jean de Soudain', to_date('11-05-2020', 'dd-mm-yyyy'), 11212);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11278, 'Shooting Attack', 'Albuquerque', to_date('29-06-2022', 'dd-mm-yyyy'), 11194);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11279, 'Poisoning', 'San Antonio', to_date('13-03-2022', 'dd-mm-yyyy'), 11197);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11280, 'Poisoning', 'Blacksburg', to_date('01-06-2020', 'dd-mm-yyyy'), 12);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11281, 'Poisoning', 'Goslar', to_date('27-05-2023', 'dd-mm-yyyy'), 11384);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11282, 'Car Accident', 'Prague', to_date('13-03-2023', 'dd-mm-yyyy'), 11232);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11283, 'Burn', 'Ramat Gan', to_date('27-09-2021', 'dd-mm-yyyy'), 11280);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11284, 'Shooting Attack', 'Lakewood', to_date('05-11-2023', 'dd-mm-yyyy'), 11304);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11285, 'Poisoning', 'Long Island City', to_date('17-11-2023', 'dd-mm-yyyy'), 11289);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11286, 'Fall Injury', 'Encinitas', to_date('27-10-2021', 'dd-mm-yyyy'), 11401);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11287, 'Car Accident', 'Firenze', to_date('25-09-2021', 'dd-mm-yyyy'), 11437);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11288, 'Car Accident', 'Osaka', to_date('09-07-2022', 'dd-mm-yyyy'), 11130);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11289, 'Burn', 'Media', to_date('13-01-2020', 'dd-mm-yyyy'), 11240);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11290, 'Birth', 'Mechelen', to_date('06-09-2023', 'dd-mm-yyyy'), 11338);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11291, 'Birth', 'Meerbusch', to_date('31-10-2020', 'dd-mm-yyyy'), 11220);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11292, 'Shooting Attack', 'Niigata', to_date('25-02-2022', 'dd-mm-yyyy'), 11232);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11293, 'Birth', 'Fair Lawn', to_date('27-01-2022', 'dd-mm-yyyy'), 11112);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11294, 'Birth', 'Visselh׳¦vede', to_date('01-12-2021', 'dd-mm-yyyy'), 11327);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11295, 'Burn', 'P׳™tion-ville', to_date('27-12-2020', 'dd-mm-yyyy'), 11282);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11296, 'Burn', 'Chiba', to_date('01-06-2022', 'dd-mm-yyyy'), 11459);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11297, 'Fall Injury', 'Edenbridge', to_date('15-06-2021', 'dd-mm-yyyy'), 11153);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11298, 'Car Accident', 'Mechanicsburg', to_date('08-03-2021', 'dd-mm-yyyy'), 11445);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11299, 'Birth', 'Belo Horizonte', to_date('05-06-2022', 'dd-mm-yyyy'), 11281);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11300, 'Fall Injury', 'Olsztyn', to_date('19-11-2022', 'dd-mm-yyyy'), 11352);
commit;
prompt 200 records committed...
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11301, 'Fall Injury', 'Rome', to_date('22-12-2021', 'dd-mm-yyyy'), 11224);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11302, 'Poisoning', 'Jacksonville', to_date('21-12-2022', 'dd-mm-yyyy'), 11401);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11303, 'Birth', 'Forest Park', to_date('15-05-2020', 'dd-mm-yyyy'), 11404);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11304, 'Shooting Attack', 'Edmonton', to_date('05-03-2023', 'dd-mm-yyyy'), 11217);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11305, 'Burn', 'Karachi', to_date('08-05-2022', 'dd-mm-yyyy'), 11429);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11306, 'Burn', 'Royersford', to_date('12-04-2023', 'dd-mm-yyyy'), 11205);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11307, 'Birth', 'Qu׳™bec', to_date('15-09-2020', 'dd-mm-yyyy'), 11280);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11308, 'Burn', 'Boucherville', to_date('02-11-2021', 'dd-mm-yyyy'), 11350);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11309, 'Shooting Attack', 'Rancho Palos Verdes', to_date('06-02-2020', 'dd-mm-yyyy'), 11371);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11310, 'Burn', 'Uetikon am See', to_date('25-08-2020', 'dd-mm-yyyy'), 11265);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11311, 'Birth', 'Thalwil', to_date('31-10-2022', 'dd-mm-yyyy'), 11293);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11312, 'Fall Injury', 'Rosario', to_date('03-08-2021', 'dd-mm-yyyy'), 11115);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11313, 'Shooting Attack', 'West Chester', to_date('14-02-2020', 'dd-mm-yyyy'), 11371);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11314, 'Poisoning', 'Lancaster', to_date('12-04-2020', 'dd-mm-yyyy'), 11358);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11315, 'Car Accident', 'Tualatin', to_date('03-03-2023', 'dd-mm-yyyy'), 11114);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11316, 'Birth', 'Taipei', to_date('03-12-2020', 'dd-mm-yyyy'), 11138);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11317, 'Poisoning', 'Duesseldorf', to_date('26-04-2021', 'dd-mm-yyyy'), 11396);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11318, 'Shooting Attack', 'Aiken', to_date('09-12-2021', 'dd-mm-yyyy'), 11275);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11319, 'Birth', 'North Yorkshire', to_date('03-07-2022', 'dd-mm-yyyy'), 11325);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11320, 'Birth', 'Buenos Aires', to_date('03-02-2020', 'dd-mm-yyyy'), 11391);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11321, 'Burn', 'Mן¢•nchen', to_date('30-12-2023', 'dd-mm-yyyy'), 11163);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11322, 'Birth', 'Durban', to_date('29-12-2020', 'dd-mm-yyyy'), 11184);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11323, 'Burn', 'Plymouth Meeting', to_date('23-03-2020', 'dd-mm-yyyy'), 11484);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11324, 'Burn', 'Green bay', to_date('25-09-2020', 'dd-mm-yyyy'), 11186);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11325, 'Poisoning', 'Salvador', to_date('26-10-2022', 'dd-mm-yyyy'), 11372);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11326, 'Birth', 'Menlo Park', to_date('12-11-2022', 'dd-mm-yyyy'), 11244);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11327, 'Fall Injury', 'Protvino', to_date('02-05-2023', 'dd-mm-yyyy'), 11278);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11328, 'Burn', 'San Ramon', to_date('08-03-2021', 'dd-mm-yyyy'), 13);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11329, 'Birth', 'North bethesda', to_date('31-10-2021', 'dd-mm-yyyy'), 11462);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11330, 'Shooting Attack', 'Gdansk', to_date('03-07-2020', 'dd-mm-yyyy'), 11398);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11331, 'Poisoning', 'Colombes', to_date('03-08-2020', 'dd-mm-yyyy'), 11446);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11332, 'Fall Injury', 'Eiksmarka', to_date('15-05-2020', 'dd-mm-yyyy'), 11159);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11333, 'Poisoning', 'Richmond', to_date('09-11-2021', 'dd-mm-yyyy'), 11492);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11334, 'Birth', 'Toyama', to_date('24-03-2023', 'dd-mm-yyyy'), 11140);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11335, 'Car Accident', 'Mapo-gu', to_date('17-10-2022', 'dd-mm-yyyy'), 11365);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11336, 'Poisoning', 'Gersthofen', to_date('02-12-2022', 'dd-mm-yyyy'), 11250);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11337, 'Shooting Attack', 'Fuchstal-asch', to_date('25-12-2022', 'dd-mm-yyyy'), 11237);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11338, 'Birth', 'Charlottesville', to_date('23-08-2022', 'dd-mm-yyyy'), 11416);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11339, 'Fall Injury', 'Hunt Valley', to_date('29-05-2021', 'dd-mm-yyyy'), 11370);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11340, 'Birth', 'Parma', to_date('09-09-2023', 'dd-mm-yyyy'), 10);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11341, 'Birth', 'Shizuoka', to_date('30-03-2023', 'dd-mm-yyyy'), 11440);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11342, 'Car Accident', 'Bloomington', to_date('19-01-2022', 'dd-mm-yyyy'), 11178);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11343, 'Poisoning', 'Kongserbg', to_date('21-12-2021', 'dd-mm-yyyy'), 11253);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11344, 'Car Accident', 'Fort worth', to_date('27-03-2020', 'dd-mm-yyyy'), 11340);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11345, 'Birth', 'Tadley', to_date('07-08-2020', 'dd-mm-yyyy'), 11417);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11346, 'Fall Injury', 'Ittigen', to_date('22-09-2021', 'dd-mm-yyyy'), 11344);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11347, 'Shooting Attack', 'New Delhi', to_date('01-09-2021', 'dd-mm-yyyy'), 11158);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11348, 'Burn', 'Framingaham', to_date('08-11-2020', 'dd-mm-yyyy'), 11265);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11349, 'Shooting Attack', 'Sao caetano do sul', to_date('17-05-2020', 'dd-mm-yyyy'), 11333);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11350, 'Poisoning', 'Coldmeece', to_date('10-04-2021', 'dd-mm-yyyy'), 11446);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11351, 'Car Accident', 'Paraju', to_date('04-10-2022', 'dd-mm-yyyy'), 11119);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11352, 'Shooting Attack', 'Geneva', to_date('13-05-2022', 'dd-mm-yyyy'), 11173);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11353, 'Birth', 'Leipzig', to_date('30-04-2021', 'dd-mm-yyyy'), 11355);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11354, 'Shooting Attack', 'Wetzlar', to_date('12-09-2021', 'dd-mm-yyyy'), 11260);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11355, 'Poisoning', 'Tlalpan', to_date('20-09-2021', 'dd-mm-yyyy'), 11402);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11356, 'Burn', 'Lecanto', to_date('12-06-2021', 'dd-mm-yyyy'), 11435);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11357, 'Fall Injury', 'Nancy', to_date('12-01-2023', 'dd-mm-yyyy'), 11225);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11358, 'Shooting Attack', 'East Providence', to_date('06-03-2020', 'dd-mm-yyyy'), 11234);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11359, 'Shooting Attack', 'London', to_date('21-03-2023', 'dd-mm-yyyy'), 11216);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11360, 'Fall Injury', 'Rochester', to_date('14-07-2023', 'dd-mm-yyyy'), 11122);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11361, 'Poisoning', 'Bretzfeld-Waldbach', to_date('11-02-2022', 'dd-mm-yyyy'), 11204);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11362, 'Car Accident', 'Bratislava', to_date('09-07-2022', 'dd-mm-yyyy'), 11172);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11363, 'Birth', 'Espoo', to_date('30-07-2022', 'dd-mm-yyyy'), 11396);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11364, 'Shooting Attack', 'Brookfield', to_date('19-10-2021', 'dd-mm-yyyy'), 11441);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11365, 'Birth', 'Mechanicsburg', to_date('26-11-2023', 'dd-mm-yyyy'), 11482);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11366, 'Car Accident', 'Grand Rapids', to_date('03-11-2021', 'dd-mm-yyyy'), 11427);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11367, 'Shooting Attack', 'South Weber', to_date('09-12-2020', 'dd-mm-yyyy'), 11220);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11368, 'Car Accident', 'Mainz-kastel', to_date('31-01-2023', 'dd-mm-yyyy'), 11380);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11369, 'Poisoning', 'Geneva', to_date('07-07-2021', 'dd-mm-yyyy'), 11493);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11370, 'Shooting Attack', 'Mainz-kastel', to_date('10-12-2022', 'dd-mm-yyyy'), 11435);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11371, 'Burn', 'Caguas', to_date('05-07-2020', 'dd-mm-yyyy'), 11220);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11372, 'Poisoning', 'San Mateo', to_date('11-05-2020', 'dd-mm-yyyy'), 11385);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11373, 'Car Accident', 'Battle Creek', to_date('03-04-2022', 'dd-mm-yyyy'), 11251);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11374, 'Birth', 'Maidstone', to_date('05-11-2020', 'dd-mm-yyyy'), 11196);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11375, 'Poisoning', 'Oosterhout', to_date('18-06-2022', 'dd-mm-yyyy'), 11142);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11376, 'Fall Injury', 'Nordhausen', to_date('04-06-2022', 'dd-mm-yyyy'), 11263);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11377, 'Burn', 'Ljubljana', to_date('15-06-2023', 'dd-mm-yyyy'), 11137);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11378, 'Shooting Attack', 'Holts Summit', to_date('03-11-2020', 'dd-mm-yyyy'), 11129);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11379, 'Shooting Attack', 'Pacific Grove', to_date('24-02-2020', 'dd-mm-yyyy'), 11194);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11380, 'Birth', 'Hampton', to_date('04-01-2023', 'dd-mm-yyyy'), 11254);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11381, 'Shooting Attack', 'P׳™tion-ville', to_date('30-12-2020', 'dd-mm-yyyy'), 11176);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11382, 'Shooting Attack', 'Rtp', to_date('18-02-2021', 'dd-mm-yyyy'), 11406);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11383, 'Car Accident', 'Yucca', to_date('16-01-2023', 'dd-mm-yyyy'), 11487);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11384, 'Fall Injury', 'Karachi', to_date('05-11-2022', 'dd-mm-yyyy'), 11251);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11385, 'Poisoning', 'Monroe', to_date('30-10-2020', 'dd-mm-yyyy'), 11301);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11386, 'Fall Injury', 'East Providence', to_date('25-08-2020', 'dd-mm-yyyy'), 11505);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11387, 'Birth', 'Bellerose', to_date('31-05-2022', 'dd-mm-yyyy'), 11461);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11388, 'Fall Injury', 'Harahan', to_date('10-05-2022', 'dd-mm-yyyy'), 11154);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11389, 'Fall Injury', 'Lake Forest', to_date('13-02-2021', 'dd-mm-yyyy'), 11317);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11390, 'Car Accident', 'Lן¢•beck', to_date('05-05-2023', 'dd-mm-yyyy'), 11319);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11391, 'Fall Injury', 'Altst׳”tten', to_date('12-02-2023', 'dd-mm-yyyy'), 11273);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11392, 'Birth', 'Santa rita sapuca׳', to_date('11-02-2022', 'dd-mm-yyyy'), 4);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11393, 'Shooting Attack', 'Bismarck', to_date('29-08-2020', 'dd-mm-yyyy'), 11251);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11394, 'Car Accident', 'Glen Cove', to_date('08-10-2021', 'dd-mm-yyyy'), 11336);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11395, 'Burn', 'Laredo', to_date('16-09-2021', 'dd-mm-yyyy'), 11345);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11396, 'Car Accident', 'Charlottesville', to_date('10-09-2020', 'dd-mm-yyyy'), 11320);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11397, 'Burn', 'Treviso', to_date('30-12-2023', 'dd-mm-yyyy'), 11305);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11398, 'Poisoning', 'Oslo', to_date('09-02-2022', 'dd-mm-yyyy'), 11192);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11399, 'Shooting Attack', 'Karlstad', to_date('20-09-2023', 'dd-mm-yyyy'), 11135);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11400, 'Shooting Attack', 'Boston', to_date('04-08-2022', 'dd-mm-yyyy'), 11482);
commit;
prompt 300 records committed...
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11401, 'Poisoning', 'Cary', to_date('04-11-2023', 'dd-mm-yyyy'), 11209);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11402, 'Fall Injury', 'Flushing', to_date('15-06-2020', 'dd-mm-yyyy'), 11393);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11403, 'Fall Injury', 'Hercules', to_date('13-10-2022', 'dd-mm-yyyy'), 11251);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11404, 'Birth', 'Wetzlar', to_date('10-07-2021', 'dd-mm-yyyy'), 11145);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11405, 'Car Accident', 'Santana do parna׳ba', to_date('10-11-2021', 'dd-mm-yyyy'), 11492);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11406, 'Fall Injury', 'New Hope', to_date('05-05-2023', 'dd-mm-yyyy'), 11263);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11407, 'Poisoning', 'Herdecke', to_date('09-05-2023', 'dd-mm-yyyy'), 11271);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11408, 'Birth', 'Dartmouth', to_date('14-06-2023', 'dd-mm-yyyy'), 11423);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11409, 'Birth', 'Fairview Heights', to_date('18-07-2022', 'dd-mm-yyyy'), 11422);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11410, 'Birth', 'Lummen', to_date('23-01-2020', 'dd-mm-yyyy'), 11244);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11411, 'Shooting Attack', 'Drogenbos', to_date('14-11-2023', 'dd-mm-yyyy'), 11280);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11412, 'Car Accident', 'Huntsville', to_date('24-10-2023', 'dd-mm-yyyy'), 11201);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11413, 'Fall Injury', 'Battle Creek', to_date('03-07-2022', 'dd-mm-yyyy'), 11439);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11414, 'Birth', 'Tucson', to_date('22-12-2022', 'dd-mm-yyyy'), 11398);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11415, 'Birth', 'Parsippany', to_date('11-06-2023', 'dd-mm-yyyy'), 11263);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11416, 'Fall Injury', 'Stans', to_date('26-06-2022', 'dd-mm-yyyy'), 11418);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11417, 'Car Accident', 'Neustadt', to_date('01-01-2022', 'dd-mm-yyyy'), 11322);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11418, 'Burn', 'Sulzbach', to_date('30-06-2021', 'dd-mm-yyyy'), 11331);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11419, 'Shooting Attack', 'Cromwell', to_date('24-10-2020', 'dd-mm-yyyy'), 11248);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11420, 'Car Accident', 'West Windsor', to_date('04-03-2022', 'dd-mm-yyyy'), 11444);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11421, 'Fall Injury', 'Bkk', to_date('13-07-2020', 'dd-mm-yyyy'), 11298);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11422, 'Fall Injury', 'Maidenhead', to_date('21-10-2021', 'dd-mm-yyyy'), 11128);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11423, 'Poisoning', 'Lublin', to_date('18-02-2020', 'dd-mm-yyyy'), 11126);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11424, 'Poisoning', 'Pa׳—o de Arcos', to_date('09-03-2021', 'dd-mm-yyyy'), 11347);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11425, 'Burn', 'Moreno Valley', to_date('29-03-2023', 'dd-mm-yyyy'), 11279);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11426, 'Poisoning', 'Toulouse', to_date('08-12-2022', 'dd-mm-yyyy'), 11297);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11427, 'Birth', 'Arlington', to_date('29-07-2020', 'dd-mm-yyyy'), 11348);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11428, 'Poisoning', 'Birmensdorf', to_date('20-12-2021', 'dd-mm-yyyy'), 11149);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11429, 'Birth', 'Rtp', to_date('20-03-2020', 'dd-mm-yyyy'), 11449);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11430, 'Shooting Attack', 'Riverdale', to_date('23-02-2020', 'dd-mm-yyyy'), 11231);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11431, 'Car Accident', 'Oak Park', to_date('01-09-2021', 'dd-mm-yyyy'), 11282);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11432, 'Fall Injury', 'Phoenix', to_date('01-09-2023', 'dd-mm-yyyy'), 3);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11433, 'Birth', 'Meerbusch', to_date('01-03-2021', 'dd-mm-yyyy'), 11341);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11434, 'Poisoning', 'Telford', to_date('10-03-2023', 'dd-mm-yyyy'), 11487);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11435, 'Fall Injury', 'Batavia', to_date('11-03-2021', 'dd-mm-yyyy'), 11424);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11436, 'Fall Injury', 'Farnham', to_date('31-07-2023', 'dd-mm-yyyy'), 11448);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11437, 'Burn', 'Grand Rapids', to_date('23-09-2023', 'dd-mm-yyyy'), 11482);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11438, 'Shooting Attack', 'Maidenhead', to_date('27-04-2021', 'dd-mm-yyyy'), 11325);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11439, 'Car Accident', 'Highlands Ranch', to_date('31-03-2023', 'dd-mm-yyyy'), 11351);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11440, 'Car Accident', 'Monterey', to_date('29-10-2023', 'dd-mm-yyyy'), 11313);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11441, 'Poisoning', 'Alcobendas', to_date('24-07-2020', 'dd-mm-yyyy'), 11186);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11442, 'Poisoning', 'Essen', to_date('29-10-2023', 'dd-mm-yyyy'), 11434);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11443, 'Shooting Attack', 'Zuerich', to_date('01-03-2023', 'dd-mm-yyyy'), 11281);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11444, 'Poisoning', 'Derwood', to_date('02-04-2022', 'dd-mm-yyyy'), 11477);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11445, 'Burn', 'Toyama', to_date('26-05-2023', 'dd-mm-yyyy'), 11399);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11446, 'Poisoning', 'Tsu', to_date('11-09-2022', 'dd-mm-yyyy'), 11194);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11447, 'Burn', 'Sao paulo', to_date('29-11-2020', 'dd-mm-yyyy'), 11368);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11448, 'Birth', 'Stavanger', to_date('28-05-2020', 'dd-mm-yyyy'), 11369);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11449, 'Car Accident', 'Los Angeles', to_date('28-04-2021', 'dd-mm-yyyy'), 11148);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11450, 'Shooting Attack', 'Paisley', to_date('26-09-2020', 'dd-mm-yyyy'), 11415);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11451, 'Birth', 'Mן¢•nster', to_date('27-08-2021', 'dd-mm-yyyy'), 11157);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11452, 'Shooting Attack', 'Kungens kurva', to_date('14-09-2022', 'dd-mm-yyyy'), 11136);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11453, 'Shooting Attack', 'Groton', to_date('11-05-2023', 'dd-mm-yyyy'), 11375);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11454, 'Shooting Attack', 'Zן¢•rich', to_date('09-03-2022', 'dd-mm-yyyy'), 11243);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11455, 'Shooting Attack', 'Obfelden', to_date('06-01-2020', 'dd-mm-yyyy'), 11127);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11456, 'Shooting Attack', 'El Masnou', to_date('11-05-2022', 'dd-mm-yyyy'), 11430);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11457, 'Poisoning', 'New York', to_date('10-07-2020', 'dd-mm-yyyy'), 11356);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11458, 'Fall Injury', 'Newton-le-willows', to_date('20-04-2021', 'dd-mm-yyyy'), 11119);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11459, 'Burn', 'Linz', to_date('14-07-2020', 'dd-mm-yyyy'), 11329);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11460, 'Shooting Attack', 'Edenbridge', to_date('02-12-2023', 'dd-mm-yyyy'), 11310);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11461, 'Fall Injury', 'Monument', to_date('04-01-2023', 'dd-mm-yyyy'), 11122);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11462, 'Shooting Attack', 'Coppell', to_date('28-07-2023', 'dd-mm-yyyy'), 11496);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11463, 'Birth', 'Banbury', to_date('12-06-2023', 'dd-mm-yyyy'), 11503);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11464, 'Poisoning', 'Pulheim-brauweiler', to_date('28-04-2023', 'dd-mm-yyyy'), 11257);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11465, 'Birth', 'Belo Horizonte', to_date('20-04-2020', 'dd-mm-yyyy'), 11252);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11466, 'Burn', 'Meerbusch', to_date('09-09-2020', 'dd-mm-yyyy'), 11509);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11467, 'Poisoning', 'Lippetal', to_date('28-01-2020', 'dd-mm-yyyy'), 11413);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11468, 'Car Accident', 'Horb', to_date('12-01-2022', 'dd-mm-yyyy'), 11481);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11469, 'Shooting Attack', 'Santa rita sapuca׳', to_date('16-06-2023', 'dd-mm-yyyy'), 11117);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11470, 'Burn', 'Narrows', to_date('16-08-2020', 'dd-mm-yyyy'), 11387);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11471, 'Poisoning', 'Herford', to_date('29-04-2023', 'dd-mm-yyyy'), 11464);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11472, 'Fall Injury', 'Oyten', to_date('28-08-2020', 'dd-mm-yyyy'), 11478);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11473, 'Burn', 'Berlin-Adlershof', to_date('09-02-2023', 'dd-mm-yyyy'), 11289);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11474, 'Fall Injury', 'Cedar Rapids', to_date('14-04-2021', 'dd-mm-yyyy'), 11426);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11475, 'Fall Injury', 'Reykjavik', to_date('20-04-2022', 'dd-mm-yyyy'), 11153);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11476, 'Shooting Attack', 'Woking', to_date('30-03-2020', 'dd-mm-yyyy'), 11215);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11477, 'Car Accident', 'Herzlia', to_date('13-02-2021', 'dd-mm-yyyy'), 11459);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11478, 'Birth', 'Ludbreg', to_date('29-01-2023', 'dd-mm-yyyy'), 11382);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11479, 'Poisoning', 'Kungki', to_date('28-07-2022', 'dd-mm-yyyy'), 11363);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11480, 'Poisoning', 'Odense', to_date('22-07-2020', 'dd-mm-yyyy'), 11164);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11481, 'Fall Injury', 'Maryville', to_date('30-07-2020', 'dd-mm-yyyy'), 11428);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11482, 'Burn', 'Issaquah', to_date('12-06-2022', 'dd-mm-yyyy'), 11312);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11483, 'Fall Injury', 'Uetikon am See', to_date('06-03-2022', 'dd-mm-yyyy'), 11451);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11484, 'Birth', 'St-laurent', to_date('04-07-2020', 'dd-mm-yyyy'), 11119);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11485, 'Burn', 'Suberg', to_date('06-09-2022', 'dd-mm-yyyy'), 11408);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11486, 'Poisoning', 'Carlingford', to_date('29-01-2023', 'dd-mm-yyyy'), 11375);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11487, 'Shooting Attack', 'Lathrop', to_date('27-10-2020', 'dd-mm-yyyy'), 11406);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11488, 'Car Accident', 'Wageningen', to_date('22-07-2023', 'dd-mm-yyyy'), 11486);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11489, 'Burn', 'Bloemfontein', to_date('14-05-2022', 'dd-mm-yyyy'), 11383);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11490, 'Shooting Attack', 'Pasadena', to_date('19-02-2023', 'dd-mm-yyyy'), 11426);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11491, 'Car Accident', 'Monmouth', to_date('23-06-2020', 'dd-mm-yyyy'), 11285);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11492, 'Birth', 'Ann Arbor', to_date('25-06-2023', 'dd-mm-yyyy'), 11112);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11493, 'Car Accident', 'Bradenton', to_date('19-03-2023', 'dd-mm-yyyy'), 11390);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11494, 'Car Accident', 'Towson', to_date('04-08-2022', 'dd-mm-yyyy'), 11159);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11495, 'Fall Injury', 'Gauteng', to_date('13-12-2020', 'dd-mm-yyyy'), 11209);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11496, 'Burn', 'Saint Ouen', to_date('14-06-2020', 'dd-mm-yyyy'), 11348);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11497, 'Birth', 'Groton', to_date('05-06-2021', 'dd-mm-yyyy'), 11144);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11498, 'Poisoning', 'Kanazawa', to_date('11-07-2022', 'dd-mm-yyyy'), 11467);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11499, 'Burn', 'Loveland', to_date('31-05-2023', 'dd-mm-yyyy'), 11410);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11500, 'Car Accident', 'Minneapolis', to_date('01-11-2023', 'dd-mm-yyyy'), 11344);
commit;
prompt 400 records committed...
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11501, 'Burn', 'Pirapora bom Jesus', to_date('16-02-2020', 'dd-mm-yyyy'), 11251);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11502, 'Fall Injury', 'Potsdam', to_date('20-04-2023', 'dd-mm-yyyy'), 11331);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11503, 'Car Accident', 'Koblenz', to_date('18-05-2021', 'dd-mm-yyyy'), 11127);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11504, 'Poisoning', 'Oakland', to_date('13-06-2023', 'dd-mm-yyyy'), 1);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11505, 'Fall Injury', 'Oklahoma city', to_date('02-05-2021', 'dd-mm-yyyy'), 11404);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11506, 'Fall Injury', 'Stavanger', to_date('09-12-2020', 'dd-mm-yyyy'), 11182);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11507, 'Shooting Attack', 'Radovljica', to_date('01-09-2021', 'dd-mm-yyyy'), 11311);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11508, 'Poisoning', 'Mississauga', to_date('23-08-2022', 'dd-mm-yyyy'), 11176);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11509, 'Poisoning', 'Cardiff', to_date('06-09-2020', 'dd-mm-yyyy'), 11315);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11510, 'Car Accident', 'Horb', to_date('20-11-2021', 'dd-mm-yyyy'), 11221);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11511, 'birth', 'tsrofa', to_date('01-01-2024', 'dd-mm-yyyy'), 1);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11512, 'birth', 'tsrofa', to_date('01-01-2024', 'dd-mm-yyyy'), 1);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11513, 'birth', 'tsrofa', to_date('01-03-2024', 'dd-mm-yyyy'), 3);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11514, 'Car Accident', 'Beer Sheva', to_date('02-10-2022', 'dd-mm-yyyy'), 11193);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11515, 'Shooting Attack', 'Tel Aviv', to_date('06-08-2021', 'dd-mm-yyyy'), 11363);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11516, 'burn', 'Hifa', to_date('01-04-2024', 'dd-mm-yyyy'), 4);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11517, 'burn', 'Hifa', to_date('01-04-2024', 'dd-mm-yyyy'), 4);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11518, 'Fall Injury', 'Netanya', to_date('14-06-2021', 'dd-mm-yyyy'), 11348);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11519, 'Burn', 'Haifa', to_date('18-11-2020', 'dd-mm-yyyy'), 11373);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11520, 'Fall Injury', 'Ashdod', to_date('20-04-2020', 'dd-mm-yyyy'), 11321);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11521, 'Car Accident', 'Beer Sheva', to_date('09-08-2020', 'dd-mm-yyyy'), 11438);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11522, 'Car Accident', 'Beer Sheva', to_date('04-03-2023', 'dd-mm-yyyy'), 11339);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11523, 'Shooting Attack', 'Jerusalem', to_date('06-10-2020', 'dd-mm-yyyy'), 11196);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11524, 'Birth', 'Haifa', to_date('26-10-2023', 'dd-mm-yyyy'), 11210);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11525, 'Birth', 'HIFA', to_date('01-01-2024', 'dd-mm-yyyy'), 1);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11526, 'Shooting Attack', 'Holon', to_date('15-06-2023', 'dd-mm-yyyy'), 11384);
commit;
prompt 426 records loaded
prompt Loading AMBUTOEVENT...
insert into AMBUTOEVENT (ambulance_id, event_id)
values (1, 1);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (2, 2);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (3, 3);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (4, 4);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (5, 5);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (5, 11268);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (6, 6);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (7, 7);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (7, 11112);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (7, 11497);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (8, 8);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (9, 9);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (10, 10);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (10, 11228);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11112, 11270);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11114, 11133);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11114, 11398);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11118, 11187);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11120, 11522);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11122, 11348);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11123, 11327);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11125, 7);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11126, 11299);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11126, 11442);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11131, 11305);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11135, 11405);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11136, 11413);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11139, 11360);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11139, 11439);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11139, 11442);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11146, 2);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11148, 11419);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11155, 11361);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11155, 11431);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11156, 11524);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11158, 11268);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11158, 11523);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11161, 11111);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11163, 11246);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11164, 11244);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11166, 11442);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11166, 11515);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11169, 11456);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11173, 11280);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11177, 11244);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11181, 11418);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11191, 11165);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11195, 11136);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11196, 11379);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11198, 11363);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11199, 11222);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11200, 11203);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11202, 11166);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11202, 11228);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11208, 11397);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11209, 11177);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11209, 11363);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11212, 11515);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11214, 11381);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11215, 11165);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11215, 11447);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11216, 11398);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11216, 11482);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11218, 11171);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11218, 11521);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11219, 11515);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11223, 11325);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11226, 11178);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11228, 11271);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11231, 11228);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11231, 11277);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11234, 11514);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11236, 11307);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11237, 11126);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11237, 11372);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11237, 11427);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11238, 10);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11243, 11191);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11243, 11251);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11243, 11266);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11245, 11460);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11246, 11277);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11249, 11396);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11254, 11138);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11254, 11190);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11254, 11204);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11254, 11265);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11255, 11520);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11256, 11153);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11262, 11195);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11262, 11355);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11265, 11268);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11265, 11444);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11265, 11491);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11265, 11519);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11266, 11522);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11274, 11341);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11275, 11227);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11281, 11280);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11288, 11123);
commit;
prompt 100 records committed...
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11289, 11321);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11289, 11351);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11292, 11314);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11295, 11387);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11297, 11190);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11297, 11347);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11297, 11526);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11298, 11384);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11300, 11324);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11302, 11169);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11303, 1);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11304, 11176);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11308, 10);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11309, 11336);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11310, 11327);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11312, 11499);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11314, 11444);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11315, 11223);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11315, 11238);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11317, 11369);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11322, 11417);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11327, 11163);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11330, 11493);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11331, 11472);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11336, 8);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11336, 11137);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11337, 11377);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11339, 11383);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11341, 11357);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11343, 11319);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11344, 11170);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11345, 11158);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11347, 11391);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11355, 11235);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11357, 11118);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11357, 11128);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11365, 11449);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11366, 11526);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11367, 11176);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11367, 11184);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11369, 11114);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11369, 11199);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11369, 11523);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11372, 11436);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11373, 11114);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11374, 11521);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11375, 11343);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11375, 11484);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11378, 11491);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11378, 11519);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11379, 11398);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11379, 11514);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11380, 11204);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11382, 11169);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11384, 11292);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11384, 11523);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11389, 11423);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11391, 11228);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11391, 11374);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11394, 11132);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11397, 1);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11398, 11357);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11400, 11425);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11402, 11148);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11402, 11501);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11406, 11199);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11407, 11298);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11407, 11400);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11409, 11283);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11409, 11438);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11410, 11468);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11411, 11526);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11415, 11119);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11415, 11271);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11422, 11115);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11422, 11500);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11424, 11443);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11428, 11144);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11428, 11293);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11429, 11156);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11429, 11287);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11438, 11166);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11441, 11298);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11441, 11490);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11441, 11500);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11442, 11199);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11442, 11272);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11446, 11163);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11446, 11483);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11448, 11175);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11452, 1);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11452, 11205);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11460, 11153);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11462, 11253);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11463, 11146);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11464, 11287);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11464, 11298);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11464, 11450);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11464, 11503);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11468, 11116);
commit;
prompt 200 records committed...
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11468, 11407);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11469, 11118);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11470, 11153);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11470, 11360);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11472, 11491);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11473, 11190);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11473, 11245);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11475, 11518);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11476, 11274);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11476, 11302);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11476, 11456);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11477, 2);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11479, 11386);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11479, 11500);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11481, 11150);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11481, 11465);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11483, 11181);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11483, 11203);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11486, 11296);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11487, 11420);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11490, 7);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11491, 11362);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11495, 11284);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11497, 11279);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11498, 11412);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11498, 11436);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11499, 11208);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11500, 11168);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11501, 11362);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11502, 11404);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11506, 11114);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11507, 11216);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11507, 11305);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11508, 10);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11508, 11352);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11510, 11191);
commit;
prompt 236 records loaded
prompt Loading COURSES...
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 1, 'Medical', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 2, 'Management', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 3, 'Safety', 'Optional', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 4, 'Management', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 5, 'Management', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 6, 'Medical', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 7, 'Medical', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 8, 'Safety', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 9, 'Safety', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 10, 'Medical', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 11, 'Safety', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 12, 'Management', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 13, 'Medical', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 14, 'Management', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 15, 'Safety', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 16, 'Safety', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 17, 'Medical', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 18, 'Medical', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 19, 'Management', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 20, 'Safety', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 21, 'Medical', 'Optional', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 22, 'Management', 'Optional', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 23, 'Management', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 24, 'Medical', 'Optional', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 25, 'Safety', 'Optional', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 26, 'Safety', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 27, 'Medical', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 28, 'Safety', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 29, 'Management', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 30, 'Medical', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 31, 'Medical', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 32, 'Management', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 33, 'Medical', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 34, 'Medical', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 35, 'Management', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 36, 'Management', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 37, 'Management', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 38, 'Management', 'Optional', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 39, 'Safety', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 40, 'Management', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 41, 'Management', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 42, 'Management', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 43, 'Management', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 44, 'Management', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 45, 'Safety', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 46, 'Medical', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 47, 'Management', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 48, 'Management', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 49, 'Safety', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 50, 'Medical', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 51, 'Medical', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 52, 'Medical', 'Optional', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 53, 'Management', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 54, 'Management', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 55, 'Safety', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 56, 'Medical', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 57, 'Management', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 58, 'Management', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 59, 'Management', 'Optional', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 60, 'Medical', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 61, 'Medical', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 62, 'Management', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 63, 'Safety', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 64, 'Management', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 65, 'Management', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 66, 'Management', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 67, 'Management', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 68, 'Management', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 69, 'Medical', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 70, 'Safety', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 71, 'Management', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 72, 'Safety', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 73, 'Management', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 74, 'Medical', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 75, 'Safety', 'Optional', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 76, 'Medical', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 77, 'Medical', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 78, 'Medical', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 79, 'Medical', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 80, 'Management', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 81, 'Medical', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 82, 'Management', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 83, 'Medical', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 84, 'Medical', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 85, 'Management', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 86, 'Management', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 87, 'Medical', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 88, 'Management', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 89, 'Medical', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 90, 'Management', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 91, 'Medical', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 92, 'Medical', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 93, 'Management', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 94, 'Safety', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 95, 'Medical', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 96, 'Medical', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 97, 'Medical', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 98, 'Safety', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 99, 'Management', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 100, 'Medical', 'Required', 'Emergency Response');
commit;
prompt 100 records committed...
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 101, 'Management', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 102, 'Medical', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 103, 'Medical', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 104, 'Safety', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 105, 'Medical', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 106, 'Medical', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 107, 'Management', 'Optional', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 108, 'Safety', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 109, 'Medical', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 110, 'Medical', 'Optional', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 111, 'Medical', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 112, 'Medical', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 113, 'Management', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 114, 'Management', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 115, 'Management', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 116, 'Medical', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 117, 'Medical', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 118, 'Safety', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 119, 'Management', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 120, 'Management', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 121, 'Management', 'Optional', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 122, 'Medical', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 123, 'Safety', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 124, 'Safety', 'Optional', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 125, 'Management', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 126, 'Safety', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 127, 'Medical', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 128, 'Safety', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 129, 'Safety', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 130, 'Management', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 131, 'Medical', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 132, 'Medical', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 133, 'Medical', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 134, 'Safety', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 135, 'Medical', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 136, 'Medical', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 137, 'Safety', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 138, 'Safety', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 139, 'Safety', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 140, 'Management', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 141, 'Medical', 'Optional', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 142, 'Management', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 143, 'Medical', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 144, 'Medical', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 145, 'Safety', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 146, 'Medical', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 147, 'Management', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 148, 'Medical', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 149, 'Medical', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 150, 'Management', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 151, 'Safety', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 152, 'Medical', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 153, 'Management', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 154, 'Medical', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 155, 'Safety', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 156, 'Medical', 'Optional', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 157, 'Management', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 158, 'Medical', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 159, 'Management', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 160, 'Safety', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 161, 'Medical', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 162, 'Medical', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 163, 'Safety', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 164, 'Safety', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 165, 'Management', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 166, 'Medical', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 167, 'Management', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 168, 'Safety', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 169, 'Medical', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 170, 'Medical', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 171, 'Medical', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 172, 'Management', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 173, 'Medical', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 174, 'Safety', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 175, 'Medical', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 176, 'Management', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 177, 'Management', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 178, 'Management', 'Optional', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 179, 'Safety', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 180, 'Management', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 181, 'Management', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 182, 'Management', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 183, 'Management', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 184, 'Medical', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 185, 'Medical', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 186, 'Safety', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 187, 'Safety', 'Optional', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 188, 'Safety', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 189, 'Safety', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 190, 'Medical', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 191, 'Safety', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 192, 'Management', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 193, 'Medical', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 194, 'Management', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 195, 'Management', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 196, 'Management', 'Optional', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 197, 'Safety', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 198, 'Management', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 199, 'Management', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 200, 'Management', 'Required', 'CPR');
commit;
prompt 200 records committed...
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 201, 'Medical', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 202, 'Safety', 'Optional', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 203, 'Management', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 204, 'Safety', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 205, 'Management', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 206, 'Medical', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 207, 'Management', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 208, 'Safety', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 209, 'Safety', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 210, 'Safety', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 211, 'Safety', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 212, 'Medical', 'Optional', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 213, 'Management', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 214, 'Management', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 215, 'Management', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 216, 'Safety', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 217, 'Medical', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 218, 'Medical', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 219, 'Management', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 220, 'Safety', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 221, 'Management', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 222, 'Safety', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 223, 'Management', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 224, 'Medical', 'Optional', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 225, 'Management', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 226, 'Safety', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 227, 'Management', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 228, 'Medical', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 229, 'Medical', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 230, 'Medical', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 231, 'Safety', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 232, 'Management', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 233, 'Management', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 234, 'Management', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 235, 'Safety', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 236, 'Medical', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 237, 'Management', 'Optional', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 238, 'Management', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 239, 'Management', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 240, 'Medical', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 241, 'Medical', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 242, 'Medical', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 243, 'Medical', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 244, 'Safety', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 245, 'Safety', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 246, 'Safety', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 247, 'Safety', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 248, 'Medical', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 249, 'Safety', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 250, 'Management', 'Optional', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 251, 'Safety', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 252, 'Safety', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 253, 'Safety', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 254, 'Safety', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 255, 'Safety', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 256, 'Medical', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 257, 'Management', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 258, 'Safety', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 259, 'Safety', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 260, 'Safety', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 261, 'Safety', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 262, 'Safety', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 263, 'Safety', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 264, 'Medical', 'Optional', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 265, 'Management', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 266, 'Medical', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 267, 'Safety', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 268, 'Safety', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 269, 'Medical', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 270, 'Safety', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 271, 'Safety', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 272, 'Management', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 273, 'Medical', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 274, 'Management', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 275, 'Safety', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 276, 'Medical', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 277, 'Management', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 278, 'Medical', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 279, 'Safety', 'Optional', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 280, 'Medical', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 281, 'Safety', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 282, 'Management', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 283, 'Management', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 284, 'Safety', 'Optional', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 285, 'Management', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 286, 'Medical', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 287, 'Management', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 288, 'Medical', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 289, 'Management', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 290, 'Management', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 291, 'Safety', 'Optional', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 292, 'Medical', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 293, 'Medical', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 294, 'Management', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 295, 'Medical', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 296, 'Safety', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 297, 'Management', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 298, 'Safety', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 299, 'Safety', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 300, 'Safety', 'Optional', 'Basic First Aid');
commit;
prompt 300 records committed...
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 301, 'Medical', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 302, 'Management', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 303, 'Medical', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 304, 'Management', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 305, 'Safety', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 306, 'Safety', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 307, 'Management', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 308, 'Medical', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 309, 'Management', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 310, 'Management', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 311, 'Medical', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 312, 'Management', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 313, 'Safety', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 314, 'Safety', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 315, 'Medical', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 316, 'Management', 'Optional', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 317, 'Safety', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 318, 'Safety', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 319, 'Safety', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 320, 'Medical', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 321, 'Management', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 322, 'Safety', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 323, 'Management', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 324, 'Medical', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 325, 'Management', 'Optional', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 326, 'Medical', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 327, 'Management', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 328, 'Safety', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 329, 'Medical', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 330, 'Management', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 331, 'Management', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 332, 'Medical', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 333, 'Medical', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 334, 'Management', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 335, 'Management', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 336, 'Safety', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 337, 'Safety', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 338, 'Management', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 339, 'Medical', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 340, 'Safety', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 341, 'Management', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 342, 'Safety', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 343, 'Safety', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 344, 'Safety', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 345, 'Management', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 346, 'Medical', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 347, 'Safety', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 348, 'Safety', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 349, 'Safety', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 350, 'Management', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 351, 'Safety', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 352, 'Management', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 353, 'Safety', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 354, 'Safety', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 355, 'Management', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 356, 'Management', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 357, 'Safety', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 358, 'Medical', 'Optional', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 359, 'Management', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 360, 'Medical', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 361, 'Safety', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 362, 'Management', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 363, 'Management', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 364, 'Management', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 365, 'Safety', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 366, 'Safety', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 367, 'Safety', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 368, 'Management', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 369, 'Safety', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 370, 'Management', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 371, 'Management', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 372, 'Safety', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 373, 'Management', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 374, 'Medical', 'Optional', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 375, 'Safety', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 376, 'Management', 'Optional', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 377, 'Safety', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 378, 'Safety', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 379, 'Safety', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 380, 'Management', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 381, 'Management', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 382, 'Safety', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 383, 'Safety', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 384, 'Safety', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 385, 'Medical', 'Optional', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 386, 'Safety', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 387, 'Medical', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 388, 'Management', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 389, 'Management', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 390, 'Medical', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 391, 'Safety', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 392, 'Safety', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 393, 'Medical', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 394, 'Safety', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 395, 'Management', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 396, 'Safety', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 397, 'Medical', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 398, 'Safety', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 399, 'Medical', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 400, 'Management', 'Required', 'Health and Safety');
commit;
prompt 400 records loaded
prompt Loading LECTURERS...
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (100, 'Nils Heche', to_date('14-02-1982', 'dd-mm-yyyy'), '16', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (101, 'Jill Mellencamp', to_date('28-04-1976', 'dd-mm-yyyy'), '13', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (102, 'Wallace Heche', to_date('02-05-1971', 'dd-mm-yyyy'), '12', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (103, 'Owen Bryson', to_date('23-06-1990', 'dd-mm-yyyy'), '18', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (104, 'Jose Bonneville', to_date('21-02-1982', 'dd-mm-yyyy'), '24', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (105, 'Sophie Rivers', to_date('30-12-1992', 'dd-mm-yyyy'), '9', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (106, 'Josh Caine', to_date('08-10-1983', 'dd-mm-yyyy'), '12', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (107, 'Taye Bloch', to_date('10-06-1984', 'dd-mm-yyyy'), '30', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (108, 'Johnnie Tempest', to_date('19-08-1989', 'dd-mm-yyyy'), '12', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (109, 'Freddie Shand', to_date('10-02-1999', 'dd-mm-yyyy'), '24', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (110, 'Vin Pony', to_date('06-07-1975', 'dd-mm-yyyy'), '15', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (111, 'Robby Kadison', to_date('26-02-1974', 'dd-mm-yyyy'), '12', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (112, 'Clive Herndon', to_date('08-07-1981', 'dd-mm-yyyy'), '11', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (113, 'Steven Chapman', to_date('06-03-1973', 'dd-mm-yyyy'), '2', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (114, 'Alfie Pullman', to_date('04-10-1996', 'dd-mm-yyyy'), '27', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (115, 'Hank Hurt', to_date('06-02-1987', 'dd-mm-yyyy'), '13', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (116, 'Collective Presley', to_date('07-10-1977', 'dd-mm-yyyy'), '4', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (117, 'Roy Rizzo', to_date('05-10-1980', 'dd-mm-yyyy'), '1', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (118, 'Lupe Hurt', to_date('10-11-1973', 'dd-mm-yyyy'), '24', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (119, 'Kazem Brooke', to_date('19-02-1995', 'dd-mm-yyyy'), '24', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (120, 'Hilary Senior', to_date('09-07-1970', 'dd-mm-yyyy'), '23', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (121, 'Vonda Alexander', to_date('11-07-1998', 'dd-mm-yyyy'), '19', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (122, 'Kitty Diddley', to_date('16-08-1999', 'dd-mm-yyyy'), '15', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (123, 'Mykelti Brosnan', to_date('10-10-1987', 'dd-mm-yyyy'), '23', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (124, 'Isaac Singletary', to_date('30-09-1982', 'dd-mm-yyyy'), '27', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (125, 'Laurence Pressly', to_date('13-04-1979', 'dd-mm-yyyy'), '15', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (126, 'Annette Drive', to_date('11-12-1984', 'dd-mm-yyyy'), '19', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (127, 'Wes Pollak', to_date('08-03-1971', 'dd-mm-yyyy'), '5', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (128, 'Kevin DiCaprio', to_date('07-10-1970', 'dd-mm-yyyy'), '7', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (129, 'Dustin Robards', to_date('14-05-1979', 'dd-mm-yyyy'), '22', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (130, 'Cliff Dern', to_date('21-02-1976', 'dd-mm-yyyy'), '14', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (131, 'Elisabeth Crowell', to_date('01-02-1973', 'dd-mm-yyyy'), '13', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (132, 'Bruce McConaughey', to_date('28-10-1978', 'dd-mm-yyyy'), '14', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (133, 'Oro Love', to_date('08-05-1997', 'dd-mm-yyyy'), '24', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (134, 'Chrissie MacDowell', to_date('06-02-1990', 'dd-mm-yyyy'), '28', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (135, 'Chaka Hanley', to_date('24-03-1991', 'dd-mm-yyyy'), '8', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (136, 'Tori Coburn', to_date('04-08-1971', 'dd-mm-yyyy'), '30', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (137, 'Rosco Palin', to_date('22-05-1990', 'dd-mm-yyyy'), '30', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (138, 'Danny Waits', to_date('21-10-1996', 'dd-mm-yyyy'), '6', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (139, 'Robert Murphy', to_date('22-06-1980', 'dd-mm-yyyy'), '16', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (140, 'Martin Waits', to_date('14-10-1977', 'dd-mm-yyyy'), '5', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (141, 'Jonatha Gray', to_date('10-03-1972', 'dd-mm-yyyy'), '9', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (142, 'Davy Burton', to_date('29-02-1996', 'dd-mm-yyyy'), '24', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (143, 'Catherine Travers', to_date('09-05-1981', 'dd-mm-yyyy'), '29', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (144, 'Caroline Holmes', to_date('10-10-1985', 'dd-mm-yyyy'), '14', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (145, 'Stellan Phillippe', to_date('18-12-1983', 'dd-mm-yyyy'), '10', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (146, 'Glen Harary', to_date('09-10-1993', 'dd-mm-yyyy'), '1', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (147, 'Joan Gleeson', to_date('21-01-1990', 'dd-mm-yyyy'), '19', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (148, 'David Gill', to_date('16-05-1999', 'dd-mm-yyyy'), '29', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (149, 'Jeffery Coward', to_date('17-04-1977', 'dd-mm-yyyy'), '16', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (150, 'Juliette Broderick', to_date('11-08-1987', 'dd-mm-yyyy'), '9', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (151, 'Sonny McAnally', to_date('15-08-1987', 'dd-mm-yyyy'), '1', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (152, 'Casey Lewis', to_date('26-08-1979', 'dd-mm-yyyy'), '17', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (153, 'Kid Devine', to_date('21-04-1985', 'dd-mm-yyyy'), '9', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (154, 'Azucar Khan', to_date('01-03-1995', 'dd-mm-yyyy'), '29', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (155, 'Cuba Waits', to_date('09-06-1983', 'dd-mm-yyyy'), '17', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (156, 'Tyrone Andrews', to_date('21-01-1976', 'dd-mm-yyyy'), '19', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (157, 'Campbell Day-Lewis', to_date('18-01-1976', 'dd-mm-yyyy'), '10', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (158, 'Ming-Na Vaughan', to_date('26-01-1978', 'dd-mm-yyyy'), '7', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (159, 'Mira Blaine', to_date('04-10-1995', 'dd-mm-yyyy'), '11', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (160, 'Gordie MacPherson', to_date('24-07-1977', 'dd-mm-yyyy'), '9', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (161, 'William Mills', to_date('11-07-1989', 'dd-mm-yyyy'), '1', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (162, 'Lin Flack', to_date('07-10-1978', 'dd-mm-yyyy'), '13', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (163, 'Debbie Mathis', to_date('25-04-1989', 'dd-mm-yyyy'), '5', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (164, 'Shelby Turturro', to_date('15-03-1982', 'dd-mm-yyyy'), '27', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (165, 'Miko Balaban', to_date('20-03-1997', 'dd-mm-yyyy'), '28', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (166, 'Adrien Gertner', to_date('11-03-1981', 'dd-mm-yyyy'), '5', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (167, 'Sara Sinatra', to_date('04-10-1977', 'dd-mm-yyyy'), '17', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (168, 'Merrill Murphy', to_date('18-09-1980', 'dd-mm-yyyy'), '3', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (169, 'Lupe Houston', to_date('26-07-1980', 'dd-mm-yyyy'), '9', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (170, 'Norm Hewitt', to_date('02-02-1975', 'dd-mm-yyyy'), '16', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (171, 'Gina Chung', to_date('11-01-1996', 'dd-mm-yyyy'), '16', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (172, 'Kasey Diddley', to_date('10-08-1977', 'dd-mm-yyyy'), '18', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (173, 'Emerson Mann', to_date('20-04-1982', 'dd-mm-yyyy'), '17', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (174, 'Heather Hawn', to_date('24-11-1990', 'dd-mm-yyyy'), '9', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (175, 'Keith Pantoliano', to_date('05-05-1985', 'dd-mm-yyyy'), '18', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (176, 'Nicholas von Sydow', to_date('30-05-1970', 'dd-mm-yyyy'), '11', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (177, 'Brian Orbit', to_date('29-12-1981', 'dd-mm-yyyy'), '4', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (178, 'Mickey Brandt', to_date('26-10-1999', 'dd-mm-yyyy'), '21', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (179, 'Larry Todd', to_date('10-12-1970', 'dd-mm-yyyy'), '12', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (180, 'Mira Jay', to_date('29-05-1995', 'dd-mm-yyyy'), '8', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (181, 'Curtis Stills', to_date('14-10-1994', 'dd-mm-yyyy'), '14', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (182, 'Buffy Nicks', to_date('11-01-1971', 'dd-mm-yyyy'), '15', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (183, 'Fairuza Posener', to_date('08-04-1990', 'dd-mm-yyyy'), '4', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (184, 'Rascal Evans', to_date('17-08-1995', 'dd-mm-yyyy'), '3', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (185, 'Pablo Pastore', to_date('02-09-1989', 'dd-mm-yyyy'), '12', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (186, 'Fats Starr', to_date('18-08-1995', 'dd-mm-yyyy'), '28', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (187, 'Karon Costello', to_date('15-09-1986', 'dd-mm-yyyy'), '30', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (188, 'Marie Taylor', to_date('11-05-1994', 'dd-mm-yyyy'), '8', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (189, 'Colleen Schreiber', to_date('31-03-1981', 'dd-mm-yyyy'), '26', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (190, 'Lois Goldberg', to_date('28-04-1974', 'dd-mm-yyyy'), '9', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (191, 'Dionne Moody', to_date('23-07-1981', 'dd-mm-yyyy'), '27', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (192, 'Nora Duschel', to_date('02-01-1985', 'dd-mm-yyyy'), '16', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (193, 'Oliver Waite', to_date('28-04-1996', 'dd-mm-yyyy'), '3', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (194, 'Mena Twilley', to_date('13-05-1993', 'dd-mm-yyyy'), '25', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (195, 'Domingo Negbaur', to_date('03-06-1974', 'dd-mm-yyyy'), '5', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (196, 'Jamie Addy', to_date('05-07-1975', 'dd-mm-yyyy'), '9', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (197, 'Maureen Hauer', to_date('04-05-1984', 'dd-mm-yyyy'), '16', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (198, 'Nicky Palin', to_date('25-10-1970', 'dd-mm-yyyy'), '10', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (199, 'Nils Coleman', to_date('30-07-1989', 'dd-mm-yyyy'), '13', 'Emergency Response');
commit;
prompt 100 records committed...
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (200, 'Gavin Willard', to_date('10-03-1973', 'dd-mm-yyyy'), '29', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (201, 'Jeanne McNarland', to_date('11-12-1987', 'dd-mm-yyyy'), '20', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (202, 'Sheena O''Donnell', to_date('16-08-1982', 'dd-mm-yyyy'), '27', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (203, 'Seann Parm', to_date('21-08-1973', 'dd-mm-yyyy'), '23', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (204, 'Raul Albright', to_date('21-03-1973', 'dd-mm-yyyy'), '30', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (205, 'Courtney Balaban', to_date('01-09-1997', 'dd-mm-yyyy'), '21', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (206, 'Clea Belles', to_date('01-08-1985', 'dd-mm-yyyy'), '5', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (207, 'Gerald Carlyle', to_date('25-12-1976', 'dd-mm-yyyy'), '3', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (208, 'Whoopi Dutton', to_date('20-07-1991', 'dd-mm-yyyy'), '11', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (209, 'Andy Thomas', to_date('11-02-1972', 'dd-mm-yyyy'), '18', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (210, 'Diamond Ferrell', to_date('07-09-1971', 'dd-mm-yyyy'), '16', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (211, 'Crystal Dupree', to_date('09-04-1979', 'dd-mm-yyyy'), '11', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (212, 'Alicia Downey', to_date('30-07-1980', 'dd-mm-yyyy'), '11', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (213, 'Al Napolitano', to_date('07-07-1972', 'dd-mm-yyyy'), '3', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (214, 'Lesley Malone', to_date('16-11-1975', 'dd-mm-yyyy'), '26', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (215, 'Benjamin Hynde', to_date('25-07-1986', 'dd-mm-yyyy'), '23', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (216, 'Matthew McPherson', to_date('16-04-1983', 'dd-mm-yyyy'), '10', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (217, 'Pablo Goldberg', to_date('27-02-1978', 'dd-mm-yyyy'), '21', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (218, 'Sissy Levin', to_date('27-10-1996', 'dd-mm-yyyy'), '20', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (219, 'Pelvic White', to_date('05-05-1985', 'dd-mm-yyyy'), '12', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (220, 'Leelee Blaine', to_date('15-03-1989', 'dd-mm-yyyy'), '16', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (221, 'Johnnie Harrelson', to_date('16-06-1976', 'dd-mm-yyyy'), '11', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (222, 'Cliff Gano', to_date('13-08-1987', 'dd-mm-yyyy'), '2', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (223, 'First Phoenix', to_date('10-12-1975', 'dd-mm-yyyy'), '30', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (224, 'Andrew Imbruglia', to_date('24-11-1982', 'dd-mm-yyyy'), '3', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (225, 'Lloyd Roundtree', to_date('20-03-1999', 'dd-mm-yyyy'), '7', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (226, 'Don Curfman', to_date('08-01-1991', 'dd-mm-yyyy'), '23', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (227, 'Juan Hiatt', to_date('28-08-1985', 'dd-mm-yyyy'), '10', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (228, 'Jody Cotton', to_date('15-05-1993', 'dd-mm-yyyy'), '10', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (229, 'Kyra Jenkins', to_date('11-11-1993', 'dd-mm-yyyy'), '26', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (230, 'Rick Broderick', to_date('15-04-1991', 'dd-mm-yyyy'), '21', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (231, 'Whoopi Apple', to_date('26-02-1999', 'dd-mm-yyyy'), '20', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (232, 'Ice Connick', to_date('08-01-1990', 'dd-mm-yyyy'), '8', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (233, 'Sara Campbell', to_date('27-02-1996', 'dd-mm-yyyy'), '20', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (234, 'Loreena Diddley', to_date('06-01-1992', 'dd-mm-yyyy'), '18', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (235, 'Rolando Weisz', to_date('20-04-1991', 'dd-mm-yyyy'), '17', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (236, 'Leon Preston', to_date('29-07-1988', 'dd-mm-yyyy'), '5', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (237, 'Miriam Knight', to_date('28-03-1998', 'dd-mm-yyyy'), '21', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (238, 'Chet Rea', to_date('05-03-1997', 'dd-mm-yyyy'), '4', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (239, 'Sylvester Blackmore', to_date('14-02-1985', 'dd-mm-yyyy'), '22', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (240, 'Elizabeth Plummer', to_date('02-09-1987', 'dd-mm-yyyy'), '1', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (241, 'Tyrone Borden', to_date('20-05-1993', 'dd-mm-yyyy'), '20', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (242, 'Ahmad Gambon', to_date('27-09-1999', 'dd-mm-yyyy'), '15', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (243, 'Malcolm Root', to_date('14-01-1975', 'dd-mm-yyyy'), '8', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (244, 'Neil Rhames', to_date('08-06-1994', 'dd-mm-yyyy'), '21', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (245, 'Eileen Suvari', to_date('24-06-1996', 'dd-mm-yyyy'), '3', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (246, 'Eugene Visnjic', to_date('04-01-1970', 'dd-mm-yyyy'), '28', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (247, 'Taye McGovern', to_date('20-12-1982', 'dd-mm-yyyy'), '9', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (248, 'Pamela Knight', to_date('26-10-1984', 'dd-mm-yyyy'), '8', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (249, 'Ted Marshall', to_date('01-07-1996', 'dd-mm-yyyy'), '6', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (250, 'Kevin Turturro', to_date('23-02-1993', 'dd-mm-yyyy'), '1', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (251, 'Delroy Carter', to_date('01-08-1982', 'dd-mm-yyyy'), '19', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (252, 'Gran Hopkins', to_date('19-12-1981', 'dd-mm-yyyy'), '26', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (253, 'Mitchell Underwood', to_date('26-12-1984', 'dd-mm-yyyy'), '4', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (254, 'Mira Shaw', to_date('15-12-1992', 'dd-mm-yyyy'), '6', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (255, 'Gailard Burmester', to_date('24-03-1974', 'dd-mm-yyyy'), '9', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (256, 'Ty Chao', to_date('21-05-1993', 'dd-mm-yyyy'), '16', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (257, 'Joely Wiedlin', to_date('17-11-1971', 'dd-mm-yyyy'), '12', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (258, 'Ron Craven', to_date('30-05-1986', 'dd-mm-yyyy'), '15', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (259, 'Naomi Branch', to_date('03-10-1990', 'dd-mm-yyyy'), '20', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (260, 'Meg McGregor', to_date('04-04-1975', 'dd-mm-yyyy'), '23', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (261, 'Rhona Oakenfold', to_date('20-08-1997', 'dd-mm-yyyy'), '19', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (262, 'Chad Roundtree', to_date('03-01-1991', 'dd-mm-yyyy'), '16', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (263, 'Fred Williamson', to_date('06-12-1971', 'dd-mm-yyyy'), '27', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (264, 'Adam Rispoli', to_date('28-07-1999', 'dd-mm-yyyy'), '18', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (265, 'Marina Delta', to_date('22-01-1978', 'dd-mm-yyyy'), '7', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (266, 'Stellan Brandt', to_date('18-06-1974', 'dd-mm-yyyy'), '22', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (267, 'Rutger Idol', to_date('25-06-1992', 'dd-mm-yyyy'), '28', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (268, 'Jeanne Chan', to_date('27-06-1997', 'dd-mm-yyyy'), '19', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (269, 'Cyndi O''Neal', to_date('01-09-1975', 'dd-mm-yyyy'), '17', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (270, 'Nicolas Delta', to_date('23-09-1973', 'dd-mm-yyyy'), '12', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (271, 'Hazel Rowlands', to_date('26-07-1986', 'dd-mm-yyyy'), '28', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (272, 'Arnold Meniketti', to_date('02-08-1989', 'dd-mm-yyyy'), '12', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (273, 'Sheryl Quaid', to_date('03-02-1999', 'dd-mm-yyyy'), '27', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (274, 'Isabella Herndon', to_date('17-12-1977', 'dd-mm-yyyy'), '24', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (275, 'Marina Albright', to_date('14-09-1978', 'dd-mm-yyyy'), '25', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (276, 'Avenged Phoenix', to_date('13-05-1981', 'dd-mm-yyyy'), '26', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (277, 'Tal McDonald', to_date('25-05-1999', 'dd-mm-yyyy'), '20', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (278, 'Billy Lowe', to_date('20-05-1987', 'dd-mm-yyyy'), '7', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (279, 'Stevie Arjona', to_date('27-11-1978', 'dd-mm-yyyy'), '3', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (280, 'Rodney Isaacs', to_date('01-10-1999', 'dd-mm-yyyy'), '17', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (281, 'Timothy Wright', to_date('31-08-1989', 'dd-mm-yyyy'), '4', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (282, 'Allison Walsh', to_date('07-08-1977', 'dd-mm-yyyy'), '23', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (283, 'Heather DeVita', to_date('16-02-1997', 'dd-mm-yyyy'), '8', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (284, 'Boz Blackmore', to_date('17-11-1973', 'dd-mm-yyyy'), '12', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (285, 'Laurence Kristofferson', to_date('06-11-1981', 'dd-mm-yyyy'), '11', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (286, 'Bruce Viterelli', to_date('12-06-1986', 'dd-mm-yyyy'), '29', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (287, 'Murray Bradford', to_date('16-09-1979', 'dd-mm-yyyy'), '20', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (288, 'Faye Kenoly', to_date('16-12-1980', 'dd-mm-yyyy'), '25', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (289, 'Allison Creek', to_date('12-03-1982', 'dd-mm-yyyy'), '9', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (290, 'Goldie Rydell', to_date('18-10-1977', 'dd-mm-yyyy'), '18', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (291, 'Elisabeth Braugher', to_date('28-11-1987', 'dd-mm-yyyy'), '7', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (292, 'Lena Cage', to_date('24-06-1975', 'dd-mm-yyyy'), '16', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (293, 'Freddie Astin', to_date('29-03-1994', 'dd-mm-yyyy'), '28', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (294, 'Todd MacLachlan', to_date('24-06-1984', 'dd-mm-yyyy'), '5', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (295, 'Orlando McDowell', to_date('25-04-1986', 'dd-mm-yyyy'), '16', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (296, 'Tzi Rio', to_date('15-07-1987', 'dd-mm-yyyy'), '14', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (297, 'Rascal LaPaglia', to_date('21-09-1985', 'dd-mm-yyyy'), '12', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (298, 'Scarlett Lineback', to_date('02-10-1989', 'dd-mm-yyyy'), '4', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (299, 'Miranda Dunn', to_date('14-02-1996', 'dd-mm-yyyy'), '11', 'Infection Control');
commit;
prompt 200 records committed...
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (300, 'Jason Emmerich', to_date('09-08-1983', 'dd-mm-yyyy'), '16', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (301, 'Edward Hurley', to_date('03-05-1993', 'dd-mm-yyyy'), '7', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (302, 'Andie Iglesias', to_date('22-05-1974', 'dd-mm-yyyy'), '22', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (303, 'Sally Winter', to_date('02-02-1996', 'dd-mm-yyyy'), '18', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (304, 'Alfred Ferrell', to_date('17-06-1970', 'dd-mm-yyyy'), '26', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (305, 'Louise Costner', to_date('26-09-1976', 'dd-mm-yyyy'), '17', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (306, 'Katie Morrison', to_date('29-11-1993', 'dd-mm-yyyy'), '26', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (307, 'Neneh Portman', to_date('12-03-1981', 'dd-mm-yyyy'), '30', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (308, 'Jim Mirren', to_date('09-08-1970', 'dd-mm-yyyy'), '20', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (309, 'Gerald Finn', to_date('12-09-1970', 'dd-mm-yyyy'), '12', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (310, 'Andre Reinhold', to_date('14-01-1978', 'dd-mm-yyyy'), '10', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (311, 'Julio Knight', to_date('06-10-1996', 'dd-mm-yyyy'), '6', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (312, 'Faye Li', to_date('12-12-1984', 'dd-mm-yyyy'), '30', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (313, 'Nicole Michael', to_date('01-11-1981', 'dd-mm-yyyy'), '26', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (314, 'Emilio Stills', to_date('08-10-1971', 'dd-mm-yyyy'), '11', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (315, 'Reese Lofgren', to_date('25-02-1973', 'dd-mm-yyyy'), '10', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (316, 'Don Hopkins', to_date('04-01-1976', 'dd-mm-yyyy'), '24', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (317, 'Sal Darren', to_date('15-10-1983', 'dd-mm-yyyy'), '6', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (318, 'Grace Torn', to_date('10-04-1985', 'dd-mm-yyyy'), '2', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (319, 'Merle Gates', to_date('24-08-1973', 'dd-mm-yyyy'), '12', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (320, 'Cathy Li', to_date('11-06-1972', 'dd-mm-yyyy'), '10', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (321, 'Neve Webb', to_date('13-04-1982', 'dd-mm-yyyy'), '10', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (322, 'Jessica Sartain', to_date('15-01-1977', 'dd-mm-yyyy'), '30', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (323, 'Eric Bacon', to_date('12-10-1975', 'dd-mm-yyyy'), '7', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (324, 'Ramsey Henstridge', to_date('11-03-1983', 'dd-mm-yyyy'), '22', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (325, 'Leon Chestnut', to_date('19-12-1978', 'dd-mm-yyyy'), '12', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (326, 'Mos Stiers', to_date('17-04-1992', 'dd-mm-yyyy'), '24', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (327, 'Mia Griffith', to_date('06-09-1993', 'dd-mm-yyyy'), '26', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (328, 'Rhea Popper', to_date('16-12-1986', 'dd-mm-yyyy'), '8', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (329, 'Martha Shaye', to_date('08-06-1970', 'dd-mm-yyyy'), '13', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (330, 'Mili Duchovny', to_date('10-04-1976', 'dd-mm-yyyy'), '12', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (331, 'Debby Fehr', to_date('17-08-1976', 'dd-mm-yyyy'), '29', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (332, 'Alfie Holland', to_date('01-06-1970', 'dd-mm-yyyy'), '20', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (333, 'Henry Place', to_date('06-05-1976', 'dd-mm-yyyy'), '18', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (334, 'Christmas Houston', to_date('24-05-1989', 'dd-mm-yyyy'), '10', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (335, 'Donal Sorvino', to_date('09-06-1976', 'dd-mm-yyyy'), '25', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (336, 'Ben Chandler', to_date('16-10-1995', 'dd-mm-yyyy'), '6', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (337, 'Minnie Molina', to_date('14-01-1978', 'dd-mm-yyyy'), '22', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (338, 'Teri Adler', to_date('02-10-1998', 'dd-mm-yyyy'), '15', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (339, 'Wade Stuermer', to_date('30-11-1973', 'dd-mm-yyyy'), '19', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (340, 'Chant׳™ Roy Parnell', to_date('25-03-1986', 'dd-mm-yyyy'), '28', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (341, 'Kurtwood Clooney', to_date('16-07-1986', 'dd-mm-yyyy'), '12', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (342, 'Lindsay Mewes', to_date('12-02-1988', 'dd-mm-yyyy'), '24', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (343, 'Mac Polito', to_date('01-12-1991', 'dd-mm-yyyy'), '18', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (344, 'Gates Eastwood', to_date('18-08-1974', 'dd-mm-yyyy'), '4', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (345, 'Javon Ramirez', to_date('28-05-1986', 'dd-mm-yyyy'), '1', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (346, 'Derrick Goldwyn', to_date('30-10-1995', 'dd-mm-yyyy'), '1', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (347, 'Chaka Whitmore', to_date('17-04-1990', 'dd-mm-yyyy'), '13', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (348, 'Ricardo Cassidy', to_date('09-04-1979', 'dd-mm-yyyy'), '14', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (349, 'Gabrielle Gagnon', to_date('05-04-1989', 'dd-mm-yyyy'), '24', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (350, 'Carrie-Anne Calle', to_date('24-09-1997', 'dd-mm-yyyy'), '23', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (351, 'Halle Allan', to_date('09-04-1975', 'dd-mm-yyyy'), '2', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (352, 'Nicolas Holeman', to_date('08-01-1997', 'dd-mm-yyyy'), '22', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (353, 'Miriam McFerrin', to_date('20-06-1988', 'dd-mm-yyyy'), '17', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (354, 'Dwight Tyler', to_date('09-08-1979', 'dd-mm-yyyy'), '22', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (355, 'Jamie Randal', to_date('02-07-1983', 'dd-mm-yyyy'), '25', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (356, 'Renee Stevens', to_date('25-05-1982', 'dd-mm-yyyy'), '15', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (357, 'Joy Cruz', to_date('30-10-1973', 'dd-mm-yyyy'), '1', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (358, 'Derek Sisto', to_date('18-02-1981', 'dd-mm-yyyy'), '25', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (359, 'Tara Reiner', to_date('20-05-1998', 'dd-mm-yyyy'), '1', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (360, 'Pete Paymer', to_date('23-03-1988', 'dd-mm-yyyy'), '8', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (361, 'Patricia Jackman', to_date('14-09-1992', 'dd-mm-yyyy'), '22', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (362, 'Leon Heron', to_date('03-01-1991', 'dd-mm-yyyy'), '26', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (363, 'Kid Bracco', to_date('13-11-1983', 'dd-mm-yyyy'), '14', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (364, 'Chalee Brosnan', to_date('04-04-1991', 'dd-mm-yyyy'), '15', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (365, 'Beth Lange', to_date('07-07-1981', 'dd-mm-yyyy'), '14', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (366, 'Wayman Hawthorne', to_date('31-01-1970', 'dd-mm-yyyy'), '29', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (367, 'Joaquim Anderson', to_date('29-04-1988', 'dd-mm-yyyy'), '5', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (368, 'Forest Linney', to_date('07-06-1983', 'dd-mm-yyyy'), '19', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (369, 'Jean-Luc Atkinson', to_date('07-12-1998', 'dd-mm-yyyy'), '2', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (370, 'Sammy Holy', to_date('27-03-1987', 'dd-mm-yyyy'), '19', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (371, 'Cyndi O''Keefe', to_date('21-09-1978', 'dd-mm-yyyy'), '25', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (372, 'Hector Donovan', to_date('02-03-1987', 'dd-mm-yyyy'), '22', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (373, 'Vendetta Streep', to_date('16-10-1999', 'dd-mm-yyyy'), '4', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (374, 'Johnnie Rudd', to_date('07-11-1979', 'dd-mm-yyyy'), '5', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (375, 'Joely Hatosy', to_date('07-09-1972', 'dd-mm-yyyy'), '30', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (376, 'Patricia Richter', to_date('09-05-1990', 'dd-mm-yyyy'), '13', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (377, 'Lee Ammons', to_date('30-12-1975', 'dd-mm-yyyy'), '13', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (378, 'Tom Ifans', to_date('24-07-1978', 'dd-mm-yyyy'), '24', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (379, 'Gates Cusack', to_date('28-08-1993', 'dd-mm-yyyy'), '27', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (380, 'Carrie Chaykin', to_date('03-06-1984', 'dd-mm-yyyy'), '11', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (381, 'Ramsey Brosnan', to_date('12-06-1978', 'dd-mm-yyyy'), '7', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (382, 'Trey Branch', to_date('13-03-1993', 'dd-mm-yyyy'), '25', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (383, 'Sylvester Ponty', to_date('12-10-1981', 'dd-mm-yyyy'), '17', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (384, 'Jody Evett', to_date('17-03-1996', 'dd-mm-yyyy'), '7', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (385, 'Taryn Dunaway', to_date('21-04-1991', 'dd-mm-yyyy'), '25', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (386, 'Kristin Raitt', to_date('12-07-1994', 'dd-mm-yyyy'), '7', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (387, 'Zooey Dawson', to_date('02-09-1980', 'dd-mm-yyyy'), '12', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (388, 'Bebe Pfeiffer', to_date('10-12-1981', 'dd-mm-yyyy'), '8', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (389, 'Leelee Vega', to_date('22-07-1997', 'dd-mm-yyyy'), '11', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (390, 'Randy Crystal', to_date('12-10-1983', 'dd-mm-yyyy'), '18', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (391, 'Ned Church', to_date('25-09-1997', 'dd-mm-yyyy'), '27', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (392, 'Rawlins Dooley', to_date('26-01-1999', 'dd-mm-yyyy'), '19', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (393, 'Vanessa Tinsley', to_date('06-04-1982', 'dd-mm-yyyy'), '1', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (394, 'Shannyn Janney', to_date('09-07-1999', 'dd-mm-yyyy'), '22', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (395, 'Paula Thomson', to_date('09-03-1993', 'dd-mm-yyyy'), '3', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (396, 'Connie Chandler', to_date('22-04-1999', 'dd-mm-yyyy'), '2', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (397, 'Steve Suvari', to_date('18-05-1987', 'dd-mm-yyyy'), '21', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (398, 'Christopher Parker', to_date('19-11-1978', 'dd-mm-yyyy'), '29', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (399, 'Cyndi Malkovich', to_date('08-06-1980', 'dd-mm-yyyy'), '13', 'Health and Safety');
commit;
prompt 300 records committed...
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (400, 'Allison Shorter', to_date('28-07-1973', 'dd-mm-yyyy'), '21', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (401, 'Vonda Devine', to_date('02-08-1979', 'dd-mm-yyyy'), '28', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (402, 'Bernard Oates', to_date('14-09-1997', 'dd-mm-yyyy'), '17', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (403, 'Red Ifans', to_date('17-12-1987', 'dd-mm-yyyy'), '19', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (404, 'Gino Skaggs', to_date('06-03-1987', 'dd-mm-yyyy'), '6', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (405, 'Loren Raitt', to_date('18-01-1990', 'dd-mm-yyyy'), '17', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (406, 'Rik McFadden', to_date('26-07-1981', 'dd-mm-yyyy'), '3', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (407, 'Parker Chapman', to_date('17-05-1970', 'dd-mm-yyyy'), '2', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (408, 'Ben Mazar', to_date('08-01-1981', 'dd-mm-yyyy'), '8', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (409, 'Richard Hobson', to_date('11-06-1972', 'dd-mm-yyyy'), '3', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (410, 'Josh Martinez', to_date('02-05-1997', 'dd-mm-yyyy'), '12', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (411, 'Gates Mohr', to_date('28-10-1973', 'dd-mm-yyyy'), '13', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (412, 'Carole Nielsen', to_date('25-01-1972', 'dd-mm-yyyy'), '5', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (413, 'Wesley Tucker', to_date('27-03-1973', 'dd-mm-yyyy'), '15', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (414, 'Christian King', to_date('24-02-1992', 'dd-mm-yyyy'), '17', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (415, 'Clarence Leoni', to_date('05-05-1998', 'dd-mm-yyyy'), '4', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (416, 'Art Farrell', to_date('15-11-1973', 'dd-mm-yyyy'), '9', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (417, 'Carla Weaver', to_date('20-07-1985', 'dd-mm-yyyy'), '19', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (418, 'Loretta Postlethwaite', to_date('17-06-1984', 'dd-mm-yyyy'), '5', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (419, 'Woody Polley', to_date('12-05-1997', 'dd-mm-yyyy'), '8', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (420, 'Andrea Sobieski', to_date('05-07-1985', 'dd-mm-yyyy'), '13', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (421, 'Randy Osment', to_date('10-08-1975', 'dd-mm-yyyy'), '11', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (422, 'Rhea Glenn', to_date('09-02-1979', 'dd-mm-yyyy'), '14', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (423, 'Marie Wainwright', to_date('06-01-1982', 'dd-mm-yyyy'), '8', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (424, 'Kay LaSalle', to_date('25-07-1984', 'dd-mm-yyyy'), '12', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (425, 'Harrison Broderick', to_date('20-01-1978', 'dd-mm-yyyy'), '4', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (426, 'Walter Emmett', to_date('25-12-1995', 'dd-mm-yyyy'), '27', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (427, 'Daryl Peterson', to_date('27-05-1995', 'dd-mm-yyyy'), '21', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (428, 'Aaron Moraz', to_date('05-08-1987', 'dd-mm-yyyy'), '2', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (429, 'Harold Askew', to_date('09-03-1984', 'dd-mm-yyyy'), '1', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (430, 'Dionne Rollins', to_date('26-04-1979', 'dd-mm-yyyy'), '2', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (431, 'Cameron Arden', to_date('03-06-1999', 'dd-mm-yyyy'), '22', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (432, 'Patty Kinski', to_date('30-09-1978', 'dd-mm-yyyy'), '12', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (433, 'Cesar Ticotin', to_date('12-05-1984', 'dd-mm-yyyy'), '14', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (434, 'Victor Hauer', to_date('05-02-1992', 'dd-mm-yyyy'), '24', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (435, 'Petula Rudd', to_date('05-06-1994', 'dd-mm-yyyy'), '7', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (436, 'Coley Carrey', to_date('15-11-1994', 'dd-mm-yyyy'), '21', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (437, 'Thin Mellencamp', to_date('13-08-1993', 'dd-mm-yyyy'), '6', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (438, 'Will Witt', to_date('06-09-1997', 'dd-mm-yyyy'), '4', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (439, 'Jodie Marx', to_date('03-04-1979', 'dd-mm-yyyy'), '4', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (440, 'Lindsay Serbedzija', to_date('18-11-1972', 'dd-mm-yyyy'), '26', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (441, 'Cevin Del Toro', to_date('22-10-1986', 'dd-mm-yyyy'), '7', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (442, 'Azucar McBride', to_date('10-02-1978', 'dd-mm-yyyy'), '12', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (443, 'Emm Duchovny', to_date('03-11-1996', 'dd-mm-yyyy'), '14', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (444, 'Brent Bryson', to_date('25-08-1992', 'dd-mm-yyyy'), '4', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (445, 'Rhea Dayne', to_date('01-04-1977', 'dd-mm-yyyy'), '17', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (446, 'Ving Boyle', to_date('26-02-1976', 'dd-mm-yyyy'), '23', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (447, 'Alec Trevino', to_date('03-02-1978', 'dd-mm-yyyy'), '11', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (448, 'Gladys McDowell', to_date('20-03-1996', 'dd-mm-yyyy'), '26', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (449, 'Rob Kutcher', to_date('13-03-1970', 'dd-mm-yyyy'), '4', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (450, 'Gaby Diesel', to_date('20-08-1985', 'dd-mm-yyyy'), '11', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (451, 'Alessandro Nelligan', to_date('10-02-1974', 'dd-mm-yyyy'), '28', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (452, 'Anne Atkins', to_date('20-08-1991', 'dd-mm-yyyy'), '22', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (453, 'Meg Frakes', to_date('21-02-1980', 'dd-mm-yyyy'), '11', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (454, 'Busta Ferrer', to_date('30-01-1982', 'dd-mm-yyyy'), '23', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (455, 'Miguel Hopper', to_date('27-06-1994', 'dd-mm-yyyy'), '20', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (456, 'Famke Bandy', to_date('16-02-1987', 'dd-mm-yyyy'), '16', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (457, 'Gwyneth DeGraw', to_date('31-03-1978', 'dd-mm-yyyy'), '5', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (458, 'Henry Conners', to_date('25-02-1973', 'dd-mm-yyyy'), '29', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (459, 'Hector Child', to_date('14-10-1996', 'dd-mm-yyyy'), '21', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (460, 'Shannyn Taha', to_date('24-12-1988', 'dd-mm-yyyy'), '26', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (461, 'Bridget Clooney', to_date('02-12-1973', 'dd-mm-yyyy'), '4', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (462, 'Lila Favreau', to_date('29-12-1985', 'dd-mm-yyyy'), '18', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (463, 'Olympia Harrison', to_date('26-11-1979', 'dd-mm-yyyy'), '18', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (464, 'Chris Sutherland', to_date('02-11-1983', 'dd-mm-yyyy'), '2', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (465, 'Leon Laurie', to_date('13-11-1991', 'dd-mm-yyyy'), '14', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (466, 'Jesse Coltrane', to_date('14-12-1975', 'dd-mm-yyyy'), '6', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (467, 'Richie Knight', to_date('26-05-1991', 'dd-mm-yyyy'), '26', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (468, 'Wesley King', to_date('16-09-1983', 'dd-mm-yyyy'), '18', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (469, 'Warren Vannelli', to_date('12-07-1983', 'dd-mm-yyyy'), '26', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (470, 'Ray Mann', to_date('19-09-1978', 'dd-mm-yyyy'), '29', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (471, 'Barry Crowell', to_date('23-07-1986', 'dd-mm-yyyy'), '16', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (472, 'Connie Brooks', to_date('11-07-1979', 'dd-mm-yyyy'), '12', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (473, 'Sally Brock', to_date('11-05-1989', 'dd-mm-yyyy'), '8', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (474, 'Victor Paymer', to_date('14-06-1995', 'dd-mm-yyyy'), '3', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (475, 'Jose Thomson', to_date('22-03-1994', 'dd-mm-yyyy'), '29', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (476, 'Rory Detmer', to_date('17-06-1986', 'dd-mm-yyyy'), '6', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (477, 'Adina MacIsaac', to_date('25-10-1975', 'dd-mm-yyyy'), '12', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (478, 'Heath Springfield', to_date('14-11-1977', 'dd-mm-yyyy'), '23', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (479, 'Charlie Sweeney', to_date('20-02-1972', 'dd-mm-yyyy'), '3', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (480, 'Ike Guest', to_date('18-10-1981', 'dd-mm-yyyy'), '6', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (481, 'Daryl Levy', to_date('13-06-1978', 'dd-mm-yyyy'), '9', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (482, 'Daryle Manning', to_date('20-11-1987', 'dd-mm-yyyy'), '2', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (483, 'Gabriel Nash', to_date('05-12-1971', 'dd-mm-yyyy'), '28', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (484, 'Javon Porter', to_date('08-09-1993', 'dd-mm-yyyy'), '25', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (485, 'Clay Gray', to_date('18-01-1990', 'dd-mm-yyyy'), '9', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (486, 'Tea Polley', to_date('06-10-1983', 'dd-mm-yyyy'), '27', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (487, 'Crispin Stamp', to_date('13-05-1981', 'dd-mm-yyyy'), '17', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (488, 'Collin Adkins', to_date('09-07-1976', 'dd-mm-yyyy'), '26', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (489, 'Leslie Snipes', to_date('21-03-1970', 'dd-mm-yyyy'), '11', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (490, 'Melanie Schneider', to_date('21-05-1982', 'dd-mm-yyyy'), '13', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (491, 'Saul Mortensen', to_date('03-02-1989', 'dd-mm-yyyy'), '3', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (492, 'Kitty Lyonne', to_date('08-03-1986', 'dd-mm-yyyy'), '15', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (493, 'Minnie Metcalf', to_date('09-04-1970', 'dd-mm-yyyy'), '21', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (494, 'Frances Aaron', to_date('18-08-1974', 'dd-mm-yyyy'), '12', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (495, 'Jeffrey Brock', to_date('18-06-1984', 'dd-mm-yyyy'), '25', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (496, 'Curt Kretschmann', to_date('24-01-1976', 'dd-mm-yyyy'), '13', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (497, 'Marina Gooding', to_date('27-11-1984', 'dd-mm-yyyy'), '14', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (498, 'Angie Keeslar', to_date('23-05-1998', 'dd-mm-yyyy'), '23', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (499, 'Denzel Leto', to_date('12-08-1972', 'dd-mm-yyyy'), '27', 'First Aid');
commit;
prompt 400 records loaded
prompt Loading ROOM...
insert into ROOM (r_id, r_location, numplace, r_type)
values (151, 'Building A Floor 2', 94, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (152, 'Building D Floor 3', 91, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (153, 'Building D Floor 4', 78, 'Classroom');
insert into ROOM (r_id, r_location, numplace, r_type)
values (154, 'Building E Floor 1', 95, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (155, 'Building A Floor 4', 47, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (156, 'Building E Floor 2', 71, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (157, 'Building E Floor 3', 47, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (158, 'Building E Floor 5', 69, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (159, 'Building E Floor 4', 44, 'Training Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (160, 'Building E Floor 1', 56, 'Training Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (161, 'Building C Floor 4', 50, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (162, 'Building D Floor 2', 83, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (163, 'Building D Floor 1', 84, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (164, 'Building E Floor 2', 65, 'Lecture Hall');
insert into ROOM (r_id, r_location, numplace, r_type)
values (165, 'Building D Floor 4', 94, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (1, 'Building D Floor 1', 63, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (2, 'Building C Floor 5', 39, 'Classroom');
insert into ROOM (r_id, r_location, numplace, r_type)
values (3, 'Building A Floor 2', 85, 'Classroom');
insert into ROOM (r_id, r_location, numplace, r_type)
values (4, 'Building C Floor 3', 54, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (5, 'Building D Floor 1', 42, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (6, 'Building B Floor 5', 83, 'Training Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (7, 'Building E Floor 4', 84, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (8, 'Building A Floor 1', 54, 'Classroom');
insert into ROOM (r_id, r_location, numplace, r_type)
values (9, 'Building B Floor 1', 32, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (10, 'Building C Floor 1', 49, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (11, 'Building A Floor 3', 38, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (12, 'Building E Floor 2', 98, 'Lecture Hall');
insert into ROOM (r_id, r_location, numplace, r_type)
values (13, 'Building E Floor 5', 100, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (14, 'Building D Floor 4', 95, 'Classroom');
insert into ROOM (r_id, r_location, numplace, r_type)
values (15, 'Building E Floor 2', 48, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (16, 'Building A Floor 4', 98, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (17, 'Building E Floor 3', 62, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (18, 'Building D Floor 5', 38, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (19, 'Building A Floor 4', 98, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (20, 'Building D Floor 4', 31, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (21, 'Building D Floor 5', 62, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (22, 'Building A Floor 1', 91, 'Lecture Hall');
insert into ROOM (r_id, r_location, numplace, r_type)
values (23, 'Building C Floor 3', 92, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (24, 'Building B Floor 4', 34, 'Classroom');
insert into ROOM (r_id, r_location, numplace, r_type)
values (25, 'Building A Floor 5', 34, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (26, 'Building E Floor 1', 43, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (27, 'Building D Floor 3', 90, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (28, 'Building A Floor 5', 86, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (29, 'Building E Floor 3', 88, 'Training Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (30, 'Building C Floor 2', 69, 'Classroom');
insert into ROOM (r_id, r_location, numplace, r_type)
values (31, 'Building E Floor 1', 64, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (32, 'Building A Floor 2', 37, 'Lecture Hall');
insert into ROOM (r_id, r_location, numplace, r_type)
values (33, 'Building A Floor 1', 43, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (34, 'Building A Floor 5', 55, 'Training Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (35, 'Building E Floor 4', 62, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (36, 'Building C Floor 1', 63, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (37, 'Building A Floor 3', 99, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (38, 'Building C Floor 5', 52, 'Lecture Hall');
insert into ROOM (r_id, r_location, numplace, r_type)
values (39, 'Building C Floor 1', 34, 'Lecture Hall');
insert into ROOM (r_id, r_location, numplace, r_type)
values (40, 'Building E Floor 4', 63, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (41, 'Building D Floor 2', 86, 'Training Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (42, 'Building B Floor 5', 94, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (43, 'Building B Floor 2', 71, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (44, 'Building B Floor 2', 39, 'Training Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (45, 'Building A Floor 4', 63, 'Classroom');
insert into ROOM (r_id, r_location, numplace, r_type)
values (46, 'Building E Floor 3', 91, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (47, 'Building A Floor 4', 84, 'Training Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (48, 'Building A Floor 3', 60, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (49, 'Building A Floor 4', 64, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (50, 'Building B Floor 5', 67, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (51, 'Building D Floor 1', 44, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (52, 'Building D Floor 1', 80, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (53, 'Building B Floor 5', 63, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (54, 'Building A Floor 3', 54, 'Classroom');
insert into ROOM (r_id, r_location, numplace, r_type)
values (55, 'Building B Floor 4', 90, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (56, 'Building B Floor 4', 39, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (57, 'Building B Floor 3', 67, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (58, 'Building A Floor 4', 48, 'Lecture Hall');
insert into ROOM (r_id, r_location, numplace, r_type)
values (59, 'Building B Floor 3', 58, 'Lecture Hall');
insert into ROOM (r_id, r_location, numplace, r_type)
values (60, 'Building C Floor 1', 35, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (61, 'Building A Floor 3', 86, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (62, 'Building A Floor 3', 46, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (63, 'Building E Floor 5', 83, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (64, 'Building C Floor 1', 73, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (65, 'Building D Floor 3', 87, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (66, 'Building E Floor 5', 71, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (67, 'Building B Floor 5', 59, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (68, 'Building E Floor 2', 97, 'Lecture Hall');
insert into ROOM (r_id, r_location, numplace, r_type)
values (69, 'Building E Floor 3', 95, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (70, 'Building C Floor 5', 62, 'Training Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (71, 'Building D Floor 3', 30, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (72, 'Building B Floor 5', 88, 'Training Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (73, 'Building D Floor 2', 89, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (74, 'Building C Floor 3', 52, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (75, 'Building C Floor 4', 74, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (76, 'Building A Floor 1', 99, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (77, 'Building B Floor 2', 96, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (78, 'Building C Floor 5', 51, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (79, 'Building A Floor 2', 53, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (80, 'Building B Floor 2', 70, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (81, 'Building C Floor 3', 86, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (82, 'Building A Floor 2', 80, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (83, 'Building C Floor 3', 69, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (84, 'Building A Floor 2', 76, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (85, 'Building A Floor 4', 71, 'Workshop Room');
commit;
prompt 100 records committed...
insert into ROOM (r_id, r_location, numplace, r_type)
values (86, 'Building A Floor 3', 60, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (87, 'Building D Floor 2', 70, 'Classroom');
insert into ROOM (r_id, r_location, numplace, r_type)
values (88, 'Building E Floor 3', 71, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (89, 'Building D Floor 2', 65, 'Classroom');
insert into ROOM (r_id, r_location, numplace, r_type)
values (90, 'Building C Floor 4', 56, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (91, 'Building D Floor 4', 91, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (92, 'Building A Floor 2', 60, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (93, 'Building A Floor 3', 47, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (94, 'Building D Floor 2', 95, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (95, 'Building E Floor 4', 77, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (96, 'Building C Floor 3', 62, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (97, 'Building C Floor 1', 58, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (98, 'Building D Floor 4', 54, 'Training Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (99, 'Building B Floor 3', 54, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (100, 'Building C Floor 4', 70, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (101, 'Building D Floor 1', 96, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (102, 'Building E Floor 3', 48, 'Classroom');
insert into ROOM (r_id, r_location, numplace, r_type)
values (103, 'Building A Floor 4', 85, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (104, 'Building D Floor 2', 80, 'Classroom');
insert into ROOM (r_id, r_location, numplace, r_type)
values (105, 'Building E Floor 4', 72, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (106, 'Building A Floor 2', 32, 'Training Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (107, 'Building B Floor 4', 95, 'Classroom');
insert into ROOM (r_id, r_location, numplace, r_type)
values (108, 'Building E Floor 2', 50, 'Training Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (109, 'Building B Floor 1', 53, 'Lecture Hall');
insert into ROOM (r_id, r_location, numplace, r_type)
values (110, 'Building D Floor 4', 48, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (111, 'Building C Floor 5', 40, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (112, 'Building E Floor 4', 79, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (113, 'Building B Floor 5', 87, 'Lecture Hall');
insert into ROOM (r_id, r_location, numplace, r_type)
values (114, 'Building D Floor 5', 44, 'Classroom');
insert into ROOM (r_id, r_location, numplace, r_type)
values (115, 'Building A Floor 3', 80, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (116, 'Building E Floor 2', 77, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (117, 'Building A Floor 3', 82, 'Classroom');
insert into ROOM (r_id, r_location, numplace, r_type)
values (118, 'Building C Floor 3', 43, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (119, 'Building D Floor 2', 43, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (120, 'Building E Floor 3', 81, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (121, 'Building C Floor 2', 59, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (122, 'Building C Floor 5', 35, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (123, 'Building D Floor 2', 94, 'Lecture Hall');
insert into ROOM (r_id, r_location, numplace, r_type)
values (124, 'Building E Floor 4', 77, 'Training Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (125, 'Building E Floor 5', 35, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (126, 'Building D Floor 4', 78, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (127, 'Building C Floor 2', 60, 'Lecture Hall');
insert into ROOM (r_id, r_location, numplace, r_type)
values (128, 'Building E Floor 3', 97, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (129, 'Building B Floor 4', 60, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (130, 'Building C Floor 5', 46, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (131, 'Building D Floor 4', 93, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (132, 'Building D Floor 3', 41, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (133, 'Building A Floor 3', 98, 'Classroom');
insert into ROOM (r_id, r_location, numplace, r_type)
values (134, 'Building C Floor 4', 83, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (135, 'Building A Floor 5', 69, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (136, 'Building D Floor 1', 60, 'Training Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (137, 'Building A Floor 1', 65, 'Classroom');
insert into ROOM (r_id, r_location, numplace, r_type)
values (138, 'Building E Floor 1', 73, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (139, 'Building D Floor 5', 41, 'Classroom');
insert into ROOM (r_id, r_location, numplace, r_type)
values (140, 'Building B Floor 2', 93, 'Classroom');
insert into ROOM (r_id, r_location, numplace, r_type)
values (141, 'Building B Floor 4', 72, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (142, 'Building D Floor 3', 88, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (143, 'Building C Floor 3', 57, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (144, 'Building D Floor 1', 38, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (145, 'Building B Floor 5', 96, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (146, 'Building A Floor 2', 72, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (147, 'Building E Floor 3', 54, 'Classroom');
insert into ROOM (r_id, r_location, numplace, r_type)
values (148, 'Building A Floor 1', 67, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (149, 'Building C Floor 2', 90, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (150, 'Building B Floor 5', 79, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (166, 'Building E Floor 4', 31, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (167, 'Building D Floor 3', 66, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (168, 'Building C Floor 5', 51, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (169, 'Building D Floor 1', 100, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (170, 'Building C Floor 5', 73, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (171, 'Building C Floor 4', 100, 'Training Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (172, 'Building C Floor 5', 72, 'Classroom');
insert into ROOM (r_id, r_location, numplace, r_type)
values (173, 'Building C Floor 3', 75, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (174, 'Building E Floor 1', 32, 'Classroom');
insert into ROOM (r_id, r_location, numplace, r_type)
values (175, 'Building D Floor 3', 46, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (176, 'Building E Floor 1', 39, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (177, 'Building A Floor 4', 75, 'Lecture Hall');
insert into ROOM (r_id, r_location, numplace, r_type)
values (178, 'Building E Floor 2', 59, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (179, 'Building B Floor 3', 39, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (180, 'Building C Floor 3', 34, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (181, 'Building D Floor 4', 91, 'Lecture Hall');
insert into ROOM (r_id, r_location, numplace, r_type)
values (182, 'Building A Floor 4', 99, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (183, 'Building E Floor 3', 93, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (184, 'Building C Floor 4', 50, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (185, 'Building C Floor 3', 82, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (186, 'Building C Floor 5', 63, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (187, 'Building E Floor 1', 66, 'Classroom');
insert into ROOM (r_id, r_location, numplace, r_type)
values (188, 'Building B Floor 5', 30, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (189, 'Building A Floor 4', 76, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (190, 'Building A Floor 2', 73, 'Classroom');
insert into ROOM (r_id, r_location, numplace, r_type)
values (191, 'Building D Floor 4', 41, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (192, 'Building B Floor 5', 34, 'Lecture Hall');
insert into ROOM (r_id, r_location, numplace, r_type)
values (193, 'Building D Floor 5', 60, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (194, 'Building A Floor 5', 65, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (195, 'Building D Floor 4', 75, 'Lecture Hall');
insert into ROOM (r_id, r_location, numplace, r_type)
values (196, 'Building D Floor 4', 59, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (197, 'Building B Floor 1', 81, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (198, 'Building B Floor 4', 36, 'Training Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (199, 'Building D Floor 3', 89, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (200, 'Building E Floor 2', 73, 'Computer Lab');
commit;
prompt 200 records committed...
insert into ROOM (r_id, r_location, numplace, r_type)
values (201, 'Building C Floor 3', 64, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (202, 'Building D Floor 5', 71, 'Lecture Hall');
insert into ROOM (r_id, r_location, numplace, r_type)
values (203, 'Building C Floor 1', 39, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (204, 'Building C Floor 1', 42, 'Lecture Hall');
insert into ROOM (r_id, r_location, numplace, r_type)
values (205, 'Building E Floor 3', 58, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (206, 'Building B Floor 1', 96, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (207, 'Building C Floor 1', 91, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (208, 'Building E Floor 5', 33, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (209, 'Building B Floor 2', 53, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (210, 'Building D Floor 4', 45, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (211, 'Building C Floor 5', 83, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (212, 'Building B Floor 4', 34, 'Classroom');
insert into ROOM (r_id, r_location, numplace, r_type)
values (213, 'Building B Floor 5', 80, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (214, 'Building D Floor 1', 37, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (215, 'Building C Floor 2', 54, 'Classroom');
insert into ROOM (r_id, r_location, numplace, r_type)
values (216, 'Building B Floor 3', 52, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (217, 'Building A Floor 4', 31, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (218, 'Building B Floor 1', 49, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (219, 'Building A Floor 1', 60, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (220, 'Building D Floor 3', 80, 'Training Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (221, 'Building C Floor 2', 47, 'Lecture Hall');
insert into ROOM (r_id, r_location, numplace, r_type)
values (222, 'Building A Floor 1', 93, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (223, 'Building A Floor 1', 65, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (224, 'Building C Floor 3', 50, 'Classroom');
insert into ROOM (r_id, r_location, numplace, r_type)
values (225, 'Building E Floor 2', 49, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (226, 'Building D Floor 5', 30, 'Training Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (227, 'Building E Floor 5', 43, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (228, 'Building D Floor 5', 80, 'Classroom');
insert into ROOM (r_id, r_location, numplace, r_type)
values (229, 'Building E Floor 2', 52, 'Classroom');
insert into ROOM (r_id, r_location, numplace, r_type)
values (230, 'Building D Floor 1', 31, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (231, 'Building B Floor 4', 79, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (232, 'Building B Floor 3', 79, 'Classroom');
insert into ROOM (r_id, r_location, numplace, r_type)
values (233, 'Building A Floor 2', 59, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (234, 'Building B Floor 2', 36, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (235, 'Building E Floor 4', 46, 'Classroom');
insert into ROOM (r_id, r_location, numplace, r_type)
values (236, 'Building E Floor 4', 63, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (237, 'Building D Floor 1', 87, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (238, 'Building C Floor 3', 72, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (239, 'Building E Floor 5', 62, 'Classroom');
insert into ROOM (r_id, r_location, numplace, r_type)
values (240, 'Building D Floor 2', 42, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (241, 'Building C Floor 4', 60, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (242, 'Building C Floor 5', 70, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (243, 'Building A Floor 2', 93, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (244, 'Building B Floor 2', 53, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (245, 'Building D Floor 4', 51, 'Training Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (246, 'Building D Floor 2', 38, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (247, 'Building C Floor 5', 59, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (248, 'Building B Floor 4', 48, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (249, 'Building B Floor 3', 98, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (250, 'Building D Floor 2', 92, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (251, 'Building B Floor 5', 75, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (252, 'Building B Floor 2', 67, 'Lecture Hall');
insert into ROOM (r_id, r_location, numplace, r_type)
values (253, 'Building B Floor 3', 98, 'Lecture Hall');
insert into ROOM (r_id, r_location, numplace, r_type)
values (254, 'Building B Floor 3', 62, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (255, 'Building B Floor 4', 57, 'Classroom');
insert into ROOM (r_id, r_location, numplace, r_type)
values (256, 'Building D Floor 1', 56, 'Training Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (257, 'Building B Floor 2', 47, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (258, 'Building E Floor 2', 89, 'Lecture Hall');
insert into ROOM (r_id, r_location, numplace, r_type)
values (259, 'Building E Floor 1', 36, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (260, 'Building A Floor 3', 41, 'Lecture Hall');
insert into ROOM (r_id, r_location, numplace, r_type)
values (261, 'Building A Floor 5', 75, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (262, 'Building C Floor 5', 92, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (263, 'Building E Floor 1', 50, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (264, 'Building B Floor 2', 88, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (265, 'Building A Floor 4', 45, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (266, 'Building E Floor 3', 78, 'Training Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (267, 'Building A Floor 4', 100, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (268, 'Building B Floor 5', 48, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (269, 'Building E Floor 4', 86, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (270, 'Building B Floor 3', 35, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (271, 'Building C Floor 1', 43, 'Classroom');
insert into ROOM (r_id, r_location, numplace, r_type)
values (272, 'Building B Floor 3', 87, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (273, 'Building C Floor 2', 57, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (274, 'Building E Floor 5', 31, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (275, 'Building A Floor 4', 46, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (276, 'Building D Floor 4', 78, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (277, 'Building A Floor 3', 70, 'Training Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (278, 'Building B Floor 4', 36, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (279, 'Building B Floor 1', 52, 'Training Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (280, 'Building E Floor 2', 59, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (281, 'Building C Floor 5', 99, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (282, 'Building C Floor 2', 90, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (283, 'Building C Floor 5', 90, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (284, 'Building B Floor 5', 47, 'Lecture Hall');
insert into ROOM (r_id, r_location, numplace, r_type)
values (285, 'Building D Floor 3', 80, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (286, 'Building E Floor 3', 55, 'Classroom');
insert into ROOM (r_id, r_location, numplace, r_type)
values (287, 'Building A Floor 2', 30, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (288, 'Building D Floor 3', 74, 'Lecture Hall');
insert into ROOM (r_id, r_location, numplace, r_type)
values (289, 'Building C Floor 5', 86, 'Training Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (290, 'Building D Floor 4', 69, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (291, 'Building E Floor 4', 32, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (292, 'Building E Floor 5', 73, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (293, 'Building D Floor 2', 72, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (294, 'Building A Floor 2', 81, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (295, 'Building D Floor 2', 84, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (296, 'Building A Floor 4', 52, 'Classroom');
insert into ROOM (r_id, r_location, numplace, r_type)
values (297, 'Building E Floor 5', 51, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (298, 'Building C Floor 2', 95, 'Classroom');
insert into ROOM (r_id, r_location, numplace, r_type)
values (299, 'Building C Floor 4', 35, 'Training Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (300, 'Building B Floor 3', 54, 'Lecture Hall');
commit;
prompt 300 records committed...
insert into ROOM (r_id, r_location, numplace, r_type)
values (301, 'Building D Floor 1', 50, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (302, 'Building B Floor 3', 59, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (303, 'Building D Floor 1', 47, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (304, 'Building B Floor 1', 47, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (305, 'Building D Floor 5', 74, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (306, 'Building E Floor 2', 39, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (307, 'Building B Floor 4', 61, 'Lecture Hall');
insert into ROOM (r_id, r_location, numplace, r_type)
values (308, 'Building C Floor 4', 95, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (309, 'Building B Floor 2', 62, 'Lecture Hall');
insert into ROOM (r_id, r_location, numplace, r_type)
values (310, 'Building C Floor 2', 34, 'Classroom');
insert into ROOM (r_id, r_location, numplace, r_type)
values (311, 'Building E Floor 3', 43, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (312, 'Building D Floor 1', 35, 'Classroom');
insert into ROOM (r_id, r_location, numplace, r_type)
values (313, 'Building D Floor 1', 65, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (314, 'Building C Floor 4', 82, 'Classroom');
insert into ROOM (r_id, r_location, numplace, r_type)
values (315, 'Building C Floor 2', 82, 'Classroom');
insert into ROOM (r_id, r_location, numplace, r_type)
values (316, 'Building B Floor 3', 77, 'Training Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (317, 'Building D Floor 2', 60, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (318, 'Building B Floor 3', 76, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (319, 'Building C Floor 1', 68, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (320, 'Building A Floor 5', 54, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (321, 'Building C Floor 1', 53, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (322, 'Building E Floor 5', 79, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (323, 'Building B Floor 1', 79, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (324, 'Building E Floor 4', 89, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (325, 'Building D Floor 3', 40, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (326, 'Building B Floor 4', 72, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (327, 'Building B Floor 3', 54, 'Training Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (328, 'Building B Floor 4', 64, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (329, 'Building C Floor 5', 39, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (330, 'Building C Floor 3', 54, 'Classroom');
insert into ROOM (r_id, r_location, numplace, r_type)
values (331, 'Building C Floor 4', 42, 'Classroom');
insert into ROOM (r_id, r_location, numplace, r_type)
values (332, 'Building E Floor 3', 69, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (333, 'Building B Floor 4', 46, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (334, 'Building D Floor 2', 78, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (335, 'Building D Floor 1', 86, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (336, 'Building B Floor 3', 87, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (337, 'Building D Floor 4', 70, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (338, 'Building D Floor 4', 61, 'Lecture Hall');
insert into ROOM (r_id, r_location, numplace, r_type)
values (339, 'Building D Floor 4', 45, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (340, 'Building C Floor 1', 90, 'Classroom');
insert into ROOM (r_id, r_location, numplace, r_type)
values (341, 'Building D Floor 2', 93, 'Classroom');
insert into ROOM (r_id, r_location, numplace, r_type)
values (342, 'Building D Floor 3', 36, 'Lecture Hall');
insert into ROOM (r_id, r_location, numplace, r_type)
values (343, 'Building E Floor 1', 47, 'Lecture Hall');
insert into ROOM (r_id, r_location, numplace, r_type)
values (344, 'Building B Floor 2', 69, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (345, 'Building B Floor 1', 99, 'Classroom');
insert into ROOM (r_id, r_location, numplace, r_type)
values (346, 'Building B Floor 2', 36, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (347, 'Building B Floor 3', 99, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (348, 'Building C Floor 5', 73, 'Training Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (349, 'Building C Floor 4', 33, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (350, 'Building C Floor 4', 57, 'Lecture Hall');
insert into ROOM (r_id, r_location, numplace, r_type)
values (351, 'Building A Floor 2', 42, 'Training Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (352, 'Building A Floor 5', 88, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (353, 'Building C Floor 5', 50, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (354, 'Building E Floor 4', 88, 'Training Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (355, 'Building C Floor 2', 82, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (356, 'Building A Floor 5', 76, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (357, 'Building C Floor 4', 44, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (358, 'Building E Floor 1', 69, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (359, 'Building E Floor 1', 42, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (360, 'Building C Floor 2', 73, 'Lecture Hall');
insert into ROOM (r_id, r_location, numplace, r_type)
values (361, 'Building B Floor 4', 37, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (362, 'Building D Floor 4', 67, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (363, 'Building A Floor 1', 98, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (364, 'Building A Floor 5', 78, 'Classroom');
insert into ROOM (r_id, r_location, numplace, r_type)
values (365, 'Building D Floor 2', 66, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (366, 'Building C Floor 3', 95, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (367, 'Building A Floor 3', 32, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (368, 'Building E Floor 1', 86, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (369, 'Building B Floor 4', 76, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (370, 'Building C Floor 1', 66, 'Training Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (371, 'Building A Floor 4', 45, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (372, 'Building E Floor 1', 48, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (373, 'Building C Floor 2', 87, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (374, 'Building B Floor 2', 46, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (375, 'Building D Floor 3', 76, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (376, 'Building A Floor 4', 42, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (377, 'Building E Floor 5', 87, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (378, 'Building A Floor 4', 63, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (379, 'Building C Floor 5', 46, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (380, 'Building E Floor 2', 91, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (381, 'Building B Floor 2', 65, 'Classroom');
insert into ROOM (r_id, r_location, numplace, r_type)
values (382, 'Building A Floor 2', 75, 'Training Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (383, 'Building A Floor 2', 34, 'Lecture Hall');
insert into ROOM (r_id, r_location, numplace, r_type)
values (384, 'Building A Floor 5', 57, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (385, 'Building C Floor 4', 37, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (386, 'Building D Floor 3', 64, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (387, 'Building A Floor 5', 91, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (388, 'Building D Floor 4', 92, 'Lecture Hall');
insert into ROOM (r_id, r_location, numplace, r_type)
values (389, 'Building A Floor 4', 79, 'Workshop Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (390, 'Building D Floor 5', 75, 'Discussion Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (391, 'Building A Floor 1', 62, 'Auditorium');
insert into ROOM (r_id, r_location, numplace, r_type)
values (392, 'Building B Floor 1', 31, 'Computer Lab');
insert into ROOM (r_id, r_location, numplace, r_type)
values (393, 'Building E Floor 3', 77, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (394, 'Building A Floor 4', 30, 'Training Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (395, 'Building B Floor 2', 38, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (396, 'Building A Floor 4', 67, 'Conference Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (397, 'Building A Floor 3', 37, 'Training Center');
insert into ROOM (r_id, r_location, numplace, r_type)
values (398, 'Building A Floor 2', 42, 'Lecture Hall');
insert into ROOM (r_id, r_location, numplace, r_type)
values (399, 'Building A Floor 4', 40, 'Seminar Room');
insert into ROOM (r_id, r_location, numplace, r_type)
values (400, 'Building B Floor 3', 66, 'Lecture Hall');
commit;
prompt 400 records loaded
prompt Loading STUDENTSGROUP...
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (1, 75, 8, 1, 320, 339, 490);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (2, 35, 11, 2, 249, 329, 140);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (3, 46, 20, 4, 261, 351, 195);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (4, 87, 12, 5, 307, 190, 338);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (5, 42, 12, 2, 109, 201, 158);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (6, 91, 14, 1, 134, 337, 311);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (7, 58, 17, 5, 365, 123, 187);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (8, 70, 10, 1, 243, 41, 405);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (9, 58, 17, 3, 11, 341, 483);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (10, 39, 12, 5, 136, 276, 100);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (11, 75, 16, 2, 281, 15, 302);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (12, 84, 17, 5, 332, 184, 375);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (13, 53, 18, 3, 21, 174, 461);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (14, 83, 14, 1, 181, 86, 363);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (15, 32, 9, 5, 47, 11, 222);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (16, 56, 18, 3, 302, 383, 288);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (17, 74, 16, 5, 365, 332, 372);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (18, 45, 12, 5, 169, 207, 365);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (19, 91, 18, 1, 253, 78, 459);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (20, 54, 15, 1, 275, 188, 233);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (21, 75, 10, 1, 77, 318, 178);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (22, 72, 20, 3, 17, 179, 419);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (23, 68, 10, 5, 214, 225, 273);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (24, 65, 17, 5, 117, 104, 198);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (25, 65, 14, 1, 187, 34, 357);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (26, 100, 14, 2, 124, 183, 344);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (27, 56, 19, 3, 364, 96, 409);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (28, 87, 13, 5, 19, 87, 142);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (29, 32, 16, 2, 329, 29, 353);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (30, 39, 9, 2, 261, 289, 151);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (31, 39, 16, 4, 83, 79, 269);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (32, 100, 10, 4, 301, 157, 292);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (33, 67, 19, 1, 378, 79, 258);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (34, 59, 18, 1, 92, 246, 151);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (35, 58, 9, 2, 143, 346, 298);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (36, 59, 17, 5, 40, 352, 466);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (37, 41, 16, 2, 307, 83, 114);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (38, 43, 13, 5, 110, 182, 493);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (39, 87, 10, 4, 178, 220, 405);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (40, 47, 17, 5, 127, 389, 420);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (41, 61, 10, 3, 276, 91, 443);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (42, 52, 10, 4, 206, 241, 122);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (43, 100, 8, 1, 388, 254, 400);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (44, 33, 11, 4, 340, 265, 423);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (45, 53, 10, 5, 139, 255, 400);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (46, 42, 16, 2, 263, 339, 366);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (47, 60, 15, 4, 253, 254, 465);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (48, 67, 14, 1, 53, 173, 452);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (49, 43, 8, 1, 382, 306, 352);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (50, 91, 17, 3, 367, 46, 344);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (51, 34, 10, 3, 291, 13, 442);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (52, 83, 15, 1, 165, 147, 415);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (53, 74, 9, 2, 80, 150, 484);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (54, 82, 13, 5, 251, 189, 205);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (55, 82, 12, 2, 21, 371, 351);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (56, 69, 18, 4, 249, 231, 200);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (57, 30, 15, 1, 286, 400, 223);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (58, 48, 11, 3, 362, 190, 182);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (59, 64, 10, 3, 165, 212, 131);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (60, 53, 18, 2, 136, 376, 348);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (61, 98, 14, 4, 35, 22, 498);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (62, 46, 8, 1, 154, 322, 283);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (63, 65, 17, 5, 273, 168, 206);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (64, 35, 10, 5, 316, 58, 149);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (65, 67, 17, 2, 188, 314, 415);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (66, 43, 12, 4, 400, 87, 198);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (67, 38, 14, 2, 166, 263, 476);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (68, 88, 15, 1, 369, 21, 364);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (69, 43, 17, 2, 284, 4, 361);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (70, 52, 13, 5, 335, 326, 235);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (71, 62, 13, 3, 10, 275, 137);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (72, 56, 20, 5, 217, 148, 175);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (73, 84, 16, 2, 30, 278, 334);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (74, 61, 19, 5, 26, 252, 481);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (75, 94, 20, 4, 218, 23, 316);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (76, 43, 18, 1, 204, 257, 357);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (77, 34, 8, 4, 208, 129, 299);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (78, 68, 17, 1, 358, 204, 185);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (79, 64, 10, 1, 364, 381, 344);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (80, 93, 20, 4, 400, 219, 274);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (81, 49, 19, 3, 213, 36, 161);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (82, 62, 9, 2, 254, 132, 170);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (83, 95, 8, 4, 340, 217, 443);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (84, 85, 14, 1, 328, 201, 304);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (85, 56, 20, 2, 212, 360, 175);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (86, 94, 13, 2, 315, 202, 268);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (87, 75, 20, 1, 122, 57, 443);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (88, 87, 18, 2, 321, 238, 487);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (89, 38, 16, 3, 328, 74, 172);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (90, 93, 12, 3, 87, 329, 180);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (91, 60, 9, 3, 171, 69, 126);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (92, 94, 16, 3, 99, 327, 192);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (93, 31, 11, 2, 53, 209, 411);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (94, 56, 20, 1, 153, 233, 160);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (95, 40, 16, 1, 55, 383, 390);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (96, 65, 11, 4, 173, 246, 422);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (97, 30, 13, 1, 279, 38, 465);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (98, 43, 18, 4, 246, 23, 326);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (99, 96, 20, 1, 94, 123, 441);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (100, 61, 19, 3, 74, 298, 334);
commit;
prompt 100 records committed...
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (101, 31, 12, 2, 363, 367, 114);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (102, 63, 14, 1, 197, 104, 196);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (103, 69, 14, 5, 38, 374, 208);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (104, 45, 12, 3, 207, 181, 384);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (105, 51, 19, 5, 207, 367, 286);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (106, 39, 13, 2, 93, 3, 448);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (107, 49, 19, 5, 360, 268, 388);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (108, 58, 11, 4, 131, 386, 103);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (109, 72, 18, 5, 173, 325, 400);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (110, 92, 18, 1, 75, 137, 103);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (111, 84, 17, 3, 180, 200, 109);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (112, 70, 18, 4, 60, 108, 495);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (113, 38, 14, 3, 16, 314, 153);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (114, 58, 15, 4, 153, 85, 337);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (115, 77, 9, 3, 215, 163, 223);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (116, 59, 13, 3, 395, 101, 255);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (117, 50, 17, 4, 42, 2, 120);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (118, 96, 10, 4, 46, 201, 117);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (119, 34, 13, 3, 346, 15, 223);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (120, 40, 12, 3, 77, 38, 222);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (121, 56, 17, 2, 98, 371, 383);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (122, 39, 8, 3, 246, 141, 459);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (123, 83, 8, 4, 223, 65, 382);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (124, 55, 8, 2, 165, 14, 448);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (125, 93, 13, 4, 378, 170, 386);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (126, 45, 9, 5, 318, 328, 115);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (127, 47, 9, 1, 81, 384, 322);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (128, 31, 9, 2, 240, 158, 300);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (129, 89, 12, 1, 59, 293, 413);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (130, 65, 16, 2, 6, 324, 281);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (131, 79, 15, 1, 193, 49, 402);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (132, 95, 17, 5, 36, 383, 377);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (133, 78, 16, 3, 163, 76, 293);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (134, 40, 8, 4, 381, 145, 335);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (135, 72, 20, 5, 139, 301, 341);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (136, 54, 16, 1, 290, 252, 261);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (137, 46, 17, 2, 240, 326, 128);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (138, 50, 12, 4, 206, 89, 194);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (139, 46, 14, 1, 305, 38, 250);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (140, 39, 20, 4, 25, 175, 490);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (141, 52, 10, 1, 81, 270, 246);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (142, 63, 13, 4, 328, 295, 103);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (143, 32, 10, 3, 4, 22, 107);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (144, 96, 18, 3, 251, 328, 353);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (145, 45, 12, 5, 49, 31, 384);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (146, 57, 16, 3, 90, 25, 241);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (147, 80, 18, 5, 229, 224, 445);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (148, 96, 17, 1, 96, 96, 317);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (149, 30, 14, 1, 42, 229, 487);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (150, 95, 11, 4, 179, 267, 160);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (151, 40, 11, 2, 218, 283, 265);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (152, 84, 11, 4, 159, 45, 270);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (153, 71, 17, 4, 278, 307, 338);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (154, 63, 18, 5, 289, 73, 440);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (155, 43, 18, 3, 258, 295, 185);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (156, 85, 13, 4, 288, 13, 396);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (157, 70, 20, 5, 305, 382, 415);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (158, 78, 8, 5, 10, 213, 181);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (159, 44, 12, 2, 304, 330, 399);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (160, 73, 15, 4, 185, 133, 274);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (161, 40, 8, 1, 234, 219, 365);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (162, 59, 13, 4, 151, 157, 309);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (163, 62, 16, 1, 27, 262, 273);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (164, 39, 17, 5, 34, 376, 196);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (165, 61, 9, 4, 204, 134, 314);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (166, 32, 17, 2, 74, 381, 309);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (167, 51, 12, 4, 290, 342, 360);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (168, 69, 20, 1, 357, 222, 321);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (169, 99, 13, 5, 62, 220, 190);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (170, 30, 10, 1, 265, 3, 390);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (171, 41, 16, 5, 41, 78, 439);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (172, 35, 13, 3, 290, 51, 443);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (173, 84, 9, 1, 76, 294, 280);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (174, 90, 9, 5, 126, 135, 269);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (175, 55, 17, 1, 238, 256, 388);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (176, 70, 8, 1, 290, 267, 389);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (177, 53, 9, 4, 269, 178, 209);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (178, 56, 8, 2, 188, 169, 179);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (179, 84, 14, 3, 398, 70, 268);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (180, 91, 19, 4, 61, 138, 243);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (181, 62, 20, 4, 381, 295, 342);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (182, 44, 11, 5, 353, 182, 104);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (183, 45, 10, 1, 166, 193, 442);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (184, 36, 16, 4, 110, 370, 396);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (185, 85, 19, 1, 51, 200, 416);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (186, 76, 14, 2, 164, 268, 444);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (187, 83, 13, 5, 317, 158, 121);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (188, 64, 13, 4, 123, 198, 212);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (189, 48, 18, 3, 30, 225, 189);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (190, 95, 15, 3, 292, 396, 493);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (191, 79, 14, 3, 374, 80, 321);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (192, 67, 18, 3, 173, 208, 132);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (193, 51, 12, 2, 15, 258, 126);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (194, 66, 19, 4, 56, 392, 355);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (195, 69, 19, 2, 60, 285, 464);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (196, 45, 15, 4, 348, 79, 393);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (197, 89, 10, 2, 309, 46, 496);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (198, 38, 11, 2, 162, 45, 276);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (199, 76, 15, 4, 167, 80, 188);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (200, 94, 12, 3, 1, 56, 379);
commit;
prompt 200 records committed...
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (201, 45, 11, 4, 107, 215, 103);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (202, 77, 19, 2, 269, 139, 207);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (203, 78, 16, 1, 58, 38, 393);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (204, 43, 12, 2, 233, 140, 190);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (205, 86, 17, 3, 5, 25, 244);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (206, 86, 20, 3, 182, 13, 384);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (207, 30, 17, 4, 184, 213, 301);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (208, 56, 17, 1, 396, 213, 441);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (209, 60, 17, 3, 337, 245, 283);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (210, 67, 15, 5, 270, 37, 145);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (211, 85, 20, 5, 36, 275, 154);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (212, 98, 18, 4, 220, 277, 286);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (213, 83, 17, 3, 131, 353, 454);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (214, 57, 10, 5, 302, 227, 159);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (215, 93, 10, 1, 317, 380, 329);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (216, 84, 20, 1, 371, 27, 464);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (217, 52, 18, 5, 300, 64, 297);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (218, 80, 20, 1, 320, 169, 491);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (219, 80, 11, 2, 139, 351, 476);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (220, 35, 19, 5, 225, 146, 172);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (221, 59, 11, 4, 249, 376, 303);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (222, 53, 16, 4, 325, 283, 482);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (223, 75, 12, 2, 45, 395, 286);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (224, 46, 12, 5, 75, 121, 163);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (225, 94, 13, 2, 308, 151, 401);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (226, 72, 9, 5, 396, 398, 465);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (227, 68, 9, 4, 56, 141, 287);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (228, 71, 9, 3, 159, 191, 470);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (229, 75, 20, 4, 397, 214, 455);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (230, 73, 19, 2, 31, 67, 495);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (231, 91, 17, 3, 348, 1, 251);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (232, 77, 13, 4, 115, 215, 349);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (233, 94, 20, 2, 107, 177, 397);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (234, 94, 15, 3, 315, 192, 114);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (235, 79, 17, 5, 145, 64, 446);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (236, 79, 19, 5, 58, 266, 458);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (237, 65, 13, 4, 214, 391, 381);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (238, 54, 20, 2, 106, 385, 331);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (239, 67, 8, 5, 42, 101, 493);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (240, 59, 14, 1, 85, 153, 450);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (241, 83, 14, 3, 8, 223, 160);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (242, 51, 15, 1, 260, 49, 236);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (243, 97, 10, 1, 157, 312, 265);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (244, 48, 15, 1, 203, 262, 397);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (245, 52, 19, 1, 62, 257, 490);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (246, 52, 11, 2, 263, 385, 232);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (247, 31, 16, 3, 98, 381, 399);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (248, 83, 17, 5, 286, 129, 439);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (249, 79, 10, 2, 10, 15, 161);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (250, 91, 16, 3, 106, 122, 301);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (251, 69, 18, 3, 364, 71, 436);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (252, 55, 20, 5, 49, 332, 254);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (253, 83, 20, 3, 158, 14, 249);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (254, 71, 16, 4, 169, 180, 482);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (255, 43, 14, 2, 368, 135, 194);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (256, 62, 18, 2, 256, 110, 358);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (257, 89, 14, 4, 123, 139, 395);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (258, 81, 13, 4, 343, 45, 385);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (259, 47, 13, 5, 281, 351, 352);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (260, 91, 16, 1, 347, 313, 428);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (261, 92, 12, 1, 89, 342, 309);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (262, 100, 19, 5, 369, 280, 125);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (263, 60, 11, 1, 310, 290, 271);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (264, 58, 19, 2, 92, 63, 245);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (265, 44, 12, 5, 296, 72, 102);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (266, 73, 14, 5, 203, 356, 283);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (267, 53, 16, 3, 192, 2, 235);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (268, 32, 10, 5, 70, 355, 473);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (269, 44, 8, 1, 347, 21, 233);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (270, 84, 15, 1, 11, 209, 493);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (271, 81, 13, 1, 117, 231, 115);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (272, 36, 9, 3, 175, 176, 454);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (273, 88, 19, 1, 343, 205, 296);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (274, 57, 12, 2, 183, 323, 246);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (275, 81, 13, 5, 276, 151, 463);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (276, 100, 14, 5, 140, 345, 228);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (277, 85, 16, 1, 246, 360, 218);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (278, 35, 8, 5, 173, 336, 332);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (279, 80, 20, 5, 235, 229, 425);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (280, 44, 19, 4, 97, 289, 385);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (281, 84, 10, 1, 262, 270, 289);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (282, 74, 19, 4, 171, 171, 497);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (283, 35, 19, 3, 131, 216, 489);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (284, 59, 9, 1, 351, 130, 135);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (285, 46, 16, 5, 252, 18, 418);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (286, 71, 8, 2, 386, 95, 127);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (287, 85, 11, 3, 94, 258, 442);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (288, 45, 10, 2, 385, 114, 406);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (289, 45, 11, 3, 167, 162, 212);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (290, 46, 13, 5, 372, 102, 360);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (291, 83, 10, 5, 298, 337, 171);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (292, 97, 16, 4, 291, 144, 369);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (293, 87, 18, 4, 306, 233, 277);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (294, 99, 18, 2, 360, 215, 422);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (295, 35, 18, 4, 30, 30, 473);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (296, 95, 17, 3, 223, 262, 182);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (297, 68, 17, 3, 207, 366, 347);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (298, 92, 14, 4, 231, 125, 185);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (299, 98, 12, 4, 189, 202, 298);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (300, 93, 18, 4, 275, 33, 363);
commit;
prompt 300 records committed...
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (301, 66, 13, 2, 151, 44, 244);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (302, 73, 13, 2, 107, 142, 153);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (303, 73, 11, 3, 9, 213, 415);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (304, 99, 16, 1, 384, 69, 193);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (305, 55, 14, 4, 98, 380, 447);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (306, 79, 17, 5, 161, 279, 473);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (307, 85, 9, 2, 8, 266, 307);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (308, 80, 10, 1, 262, 76, 330);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (309, 34, 14, 5, 52, 316, 304);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (310, 31, 9, 5, 68, 262, 167);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (311, 51, 19, 2, 356, 59, 283);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (312, 68, 14, 5, 147, 219, 466);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (313, 69, 20, 1, 240, 345, 260);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (314, 83, 14, 5, 63, 58, 198);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (315, 47, 14, 3, 279, 182, 420);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (316, 71, 20, 2, 385, 218, 391);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (317, 34, 13, 1, 327, 167, 105);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (318, 63, 17, 4, 38, 134, 349);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (319, 33, 18, 3, 77, 226, 331);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (320, 81, 14, 4, 228, 169, 496);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (321, 59, 14, 5, 48, 262, 459);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (322, 77, 19, 4, 256, 237, 336);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (323, 55, 20, 3, 172, 23, 157);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (324, 99, 17, 5, 272, 287, 496);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (325, 99, 20, 4, 69, 192, 275);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (326, 67, 15, 3, 92, 304, 346);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (327, 84, 10, 5, 384, 8, 380);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (328, 47, 10, 3, 102, 376, 374);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (329, 73, 12, 5, 274, 25, 364);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (330, 37, 11, 5, 400, 293, 190);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (331, 46, 8, 1, 224, 309, 469);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (332, 48, 15, 1, 377, 224, 355);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (333, 47, 16, 2, 271, 88, 154);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (334, 77, 15, 4, 305, 138, 295);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (335, 64, 19, 3, 220, 157, 342);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (336, 98, 13, 4, 129, 121, 306);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (337, 55, 12, 2, 133, 240, 466);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (338, 61, 15, 3, 19, 236, 110);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (339, 36, 20, 2, 266, 28, 261);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (340, 41, 13, 3, 98, 305, 157);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (341, 52, 10, 1, 151, 278, 318);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (342, 83, 15, 4, 83, 46, 345);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (343, 58, 14, 2, 188, 105, 345);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (344, 60, 19, 2, 79, 132, 147);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (345, 57, 9, 3, 28, 255, 154);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (346, 47, 14, 4, 232, 30, 225);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (347, 54, 20, 5, 149, 266, 115);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (348, 60, 12, 1, 306, 169, 499);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (349, 80, 16, 4, 279, 338, 300);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (350, 77, 15, 4, 286, 103, 181);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (351, 95, 17, 2, 68, 397, 458);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (352, 62, 12, 5, 55, 14, 118);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (353, 32, 12, 3, 275, 180, 240);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (354, 89, 19, 2, 270, 220, 360);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (355, 76, 16, 1, 68, 230, 419);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (356, 55, 19, 4, 270, 240, 310);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (357, 40, 17, 1, 98, 221, 321);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (358, 92, 11, 5, 150, 278, 154);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (359, 82, 15, 1, 349, 308, 416);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (360, 79, 17, 3, 222, 67, 335);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (361, 54, 20, 3, 228, 115, 282);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (362, 95, 9, 3, 6, 154, 369);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (363, 32, 20, 1, 87, 71, 285);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (364, 52, 13, 3, 182, 354, 375);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (365, 64, 12, 1, 254, 281, 208);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (366, 96, 8, 4, 217, 257, 402);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (367, 94, 8, 2, 153, 271, 144);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (368, 40, 20, 1, 129, 319, 334);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (369, 35, 17, 5, 204, 176, 310);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (370, 34, 9, 2, 81, 212, 456);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (371, 89, 8, 2, 65, 110, 484);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (372, 56, 12, 4, 78, 383, 460);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (373, 94, 17, 5, 115, 100, 326);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (374, 36, 15, 3, 56, 69, 373);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (375, 91, 8, 4, 357, 304, 286);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (376, 88, 17, 1, 34, 342, 193);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (377, 86, 13, 4, 208, 117, 153);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (378, 54, 10, 5, 26, 29, 298);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (379, 91, 19, 4, 378, 67, 362);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (380, 87, 14, 2, 370, 60, 438);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (381, 93, 17, 4, 103, 111, 498);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (382, 89, 20, 5, 391, 310, 358);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (383, 70, 18, 1, 318, 32, 323);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (384, 42, 11, 1, 231, 287, 461);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (385, 97, 8, 4, 256, 156, 360);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (386, 88, 18, 3, 386, 319, 176);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (387, 62, 12, 2, 249, 281, 369);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (388, 80, 13, 4, 365, 5, 214);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (389, 54, 9, 4, 14, 24, 132);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (390, 64, 10, 3, 22, 369, 206);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (391, 63, 13, 3, 203, 314, 305);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (392, 87, 9, 2, 374, 299, 481);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (393, 94, 12, 4, 305, 203, 330);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (394, 42, 11, 3, 50, 302, 493);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (395, 64, 20, 4, 68, 135, 184);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (396, 67, 16, 5, 394, 349, 451);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (397, 72, 9, 2, 144, 52, 347);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (398, 81, 11, 4, 355, 253, 456);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (399, 75, 17, 5, 110, 66, 171);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (400, 93, 8, 1, 399, 351, 315);
commit;
prompt 400 records loaded
prompt Loading BELONGS...
insert into BELONGS (g_id, volunteer_id)
values (1, '11111');
insert into BELONGS (g_id, volunteer_id)
values (1, '11112');
insert into BELONGS (g_id, volunteer_id)
values (3, '11113');
insert into BELONGS (g_id, volunteer_id)
values (3, '11114');
insert into BELONGS (g_id, volunteer_id)
values (3, '11115');
insert into BELONGS (g_id, volunteer_id)
values (6, '11116');
insert into BELONGS (g_id, volunteer_id)
values (6, '11117');
insert into BELONGS (g_id, volunteer_id)
values (7, '11118');
insert into BELONGS (g_id, volunteer_id)
values (7, '11119');
insert into BELONGS (g_id, volunteer_id)
values (9, '11120');
insert into BELONGS (g_id, volunteer_id)
values (11, '11121');
insert into BELONGS (g_id, volunteer_id)
values (13, '11122');
insert into BELONGS (g_id, volunteer_id)
values (13, '11123');
insert into BELONGS (g_id, volunteer_id)
values (14, '11124');
insert into BELONGS (g_id, volunteer_id)
values (15, '11125');
insert into BELONGS (g_id, volunteer_id)
values (18, '11126');
insert into BELONGS (g_id, volunteer_id)
values (18, '11127');
insert into BELONGS (g_id, volunteer_id)
values (20, '11128');
insert into BELONGS (g_id, volunteer_id)
values (20, '11129');
insert into BELONGS (g_id, volunteer_id)
values (20, '11130');
insert into BELONGS (g_id, volunteer_id)
values (22, '11131');
insert into BELONGS (g_id, volunteer_id)
values (23, '11132');
insert into BELONGS (g_id, volunteer_id)
values (23, '11133');
insert into BELONGS (g_id, volunteer_id)
values (24, '11134');
insert into BELONGS (g_id, volunteer_id)
values (26, '11135');
insert into BELONGS (g_id, volunteer_id)
values (27, '11136');
insert into BELONGS (g_id, volunteer_id)
values (27, '11137');
insert into BELONGS (g_id, volunteer_id)
values (27, '11138');
insert into BELONGS (g_id, volunteer_id)
values (31, '11139');
insert into BELONGS (g_id, volunteer_id)
values (31, '11140');
insert into BELONGS (g_id, volunteer_id)
values (32, '11141');
insert into BELONGS (g_id, volunteer_id)
values (32, '11142');
insert into BELONGS (g_id, volunteer_id)
values (34, '11143');
insert into BELONGS (g_id, volunteer_id)
values (39, '11144');
insert into BELONGS (g_id, volunteer_id)
values (40, '11145');
insert into BELONGS (g_id, volunteer_id)
values (41, '11146');
insert into BELONGS (g_id, volunteer_id)
values (41, '11147');
insert into BELONGS (g_id, volunteer_id)
values (42, '11148');
insert into BELONGS (g_id, volunteer_id)
values (42, '11149');
insert into BELONGS (g_id, volunteer_id)
values (42, '11150');
insert into BELONGS (g_id, volunteer_id)
values (43, '11151');
insert into BELONGS (g_id, volunteer_id)
values (44, '11152');
insert into BELONGS (g_id, volunteer_id)
values (45, '11153');
insert into BELONGS (g_id, volunteer_id)
values (45, '11154');
insert into BELONGS (g_id, volunteer_id)
values (46, '11155');
insert into BELONGS (g_id, volunteer_id)
values (47, '11156');
insert into BELONGS (g_id, volunteer_id)
values (47, '11157');
insert into BELONGS (g_id, volunteer_id)
values (47, '11158');
insert into BELONGS (g_id, volunteer_id)
values (48, '11159');
insert into BELONGS (g_id, volunteer_id)
values (48, '11160');
insert into BELONGS (g_id, volunteer_id)
values (48, '11161');
insert into BELONGS (g_id, volunteer_id)
values (49, '11162');
insert into BELONGS (g_id, volunteer_id)
values (50, '11163');
insert into BELONGS (g_id, volunteer_id)
values (53, '11164');
insert into BELONGS (g_id, volunteer_id)
values (53, '11165');
insert into BELONGS (g_id, volunteer_id)
values (55, '11166');
insert into BELONGS (g_id, volunteer_id)
values (55, '11167');
insert into BELONGS (g_id, volunteer_id)
values (56, '11168');
insert into BELONGS (g_id, volunteer_id)
values (60, '11169');
insert into BELONGS (g_id, volunteer_id)
values (60, '11170');
insert into BELONGS (g_id, volunteer_id)
values (61, '11171');
insert into BELONGS (g_id, volunteer_id)
values (61, '11172');
insert into BELONGS (g_id, volunteer_id)
values (63, '11173');
insert into BELONGS (g_id, volunteer_id)
values (63, '11174');
insert into BELONGS (g_id, volunteer_id)
values (64, '11175');
insert into BELONGS (g_id, volunteer_id)
values (65, '11176');
insert into BELONGS (g_id, volunteer_id)
values (66, '11177');
insert into BELONGS (g_id, volunteer_id)
values (67, '11178');
insert into BELONGS (g_id, volunteer_id)
values (68, '11179');
insert into BELONGS (g_id, volunteer_id)
values (71, '11180');
insert into BELONGS (g_id, volunteer_id)
values (72, '11181');
insert into BELONGS (g_id, volunteer_id)
values (74, '11182');
insert into BELONGS (g_id, volunteer_id)
values (74, '11183');
insert into BELONGS (g_id, volunteer_id)
values (77, '11184');
insert into BELONGS (g_id, volunteer_id)
values (78, '11185');
insert into BELONGS (g_id, volunteer_id)
values (78, '11186');
insert into BELONGS (g_id, volunteer_id)
values (78, '11187');
insert into BELONGS (g_id, volunteer_id)
values (79, '11188');
insert into BELONGS (g_id, volunteer_id)
values (82, '11189');
insert into BELONGS (g_id, volunteer_id)
values (83, '11190');
insert into BELONGS (g_id, volunteer_id)
values (84, '11191');
insert into BELONGS (g_id, volunteer_id)
values (86, '11192');
insert into BELONGS (g_id, volunteer_id)
values (87, '11193');
insert into BELONGS (g_id, volunteer_id)
values (87, '11194');
insert into BELONGS (g_id, volunteer_id)
values (88, '11195');
insert into BELONGS (g_id, volunteer_id)
values (90, '11196');
insert into BELONGS (g_id, volunteer_id)
values (91, '11197');
insert into BELONGS (g_id, volunteer_id)
values (91, '11198');
insert into BELONGS (g_id, volunteer_id)
values (91, '11199');
insert into BELONGS (g_id, volunteer_id)
values (92, '11200');
insert into BELONGS (g_id, volunteer_id)
values (93, '11201');
insert into BELONGS (g_id, volunteer_id)
values (94, '11202');
insert into BELONGS (g_id, volunteer_id)
values (95, '11203');
insert into BELONGS (g_id, volunteer_id)
values (95, '11204');
insert into BELONGS (g_id, volunteer_id)
values (96, '11205');
insert into BELONGS (g_id, volunteer_id)
values (96, '11206');
insert into BELONGS (g_id, volunteer_id)
values (97, '11207');
insert into BELONGS (g_id, volunteer_id)
values (97, '11208');
insert into BELONGS (g_id, volunteer_id)
values (98, '11209');
insert into BELONGS (g_id, volunteer_id)
values (100, '11210');
commit;
prompt 100 records committed...
insert into BELONGS (g_id, volunteer_id)
values (101, '11211');
insert into BELONGS (g_id, volunteer_id)
values (102, '11212');
insert into BELONGS (g_id, volunteer_id)
values (102, '11213');
insert into BELONGS (g_id, volunteer_id)
values (102, '11214');
insert into BELONGS (g_id, volunteer_id)
values (104, '11215');
insert into BELONGS (g_id, volunteer_id)
values (109, '11216');
insert into BELONGS (g_id, volunteer_id)
values (110, '11217');
insert into BELONGS (g_id, volunteer_id)
values (111, '11218');
insert into BELONGS (g_id, volunteer_id)
values (112, '11219');
insert into BELONGS (g_id, volunteer_id)
values (113, '11220');
insert into BELONGS (g_id, volunteer_id)
values (118, '11221');
insert into BELONGS (g_id, volunteer_id)
values (119, '11222');
insert into BELONGS (g_id, volunteer_id)
values (119, '11223');
insert into BELONGS (g_id, volunteer_id)
values (120, '11224');
insert into BELONGS (g_id, volunteer_id)
values (121, '11225');
insert into BELONGS (g_id, volunteer_id)
values (123, '11226');
insert into BELONGS (g_id, volunteer_id)
values (124, '11227');
insert into BELONGS (g_id, volunteer_id)
values (125, '11228');
insert into BELONGS (g_id, volunteer_id)
values (125, '11229');
insert into BELONGS (g_id, volunteer_id)
values (126, '11230');
insert into BELONGS (g_id, volunteer_id)
values (126, '11231');
insert into BELONGS (g_id, volunteer_id)
values (127, '11232');
insert into BELONGS (g_id, volunteer_id)
values (128, '11233');
insert into BELONGS (g_id, volunteer_id)
values (131, '11234');
insert into BELONGS (g_id, volunteer_id)
values (134, '11235');
insert into BELONGS (g_id, volunteer_id)
values (136, '11236');
insert into BELONGS (g_id, volunteer_id)
values (136, '11237');
insert into BELONGS (g_id, volunteer_id)
values (138, '11238');
insert into BELONGS (g_id, volunteer_id)
values (139, '11239');
insert into BELONGS (g_id, volunteer_id)
values (139, '11240');
insert into BELONGS (g_id, volunteer_id)
values (140, '11241');
insert into BELONGS (g_id, volunteer_id)
values (142, '11242');
insert into BELONGS (g_id, volunteer_id)
values (150, '11243');
insert into BELONGS (g_id, volunteer_id)
values (150, '11244');
insert into BELONGS (g_id, volunteer_id)
values (151, '11245');
insert into BELONGS (g_id, volunteer_id)
values (152, '11246');
insert into BELONGS (g_id, volunteer_id)
values (153, '11247');
insert into BELONGS (g_id, volunteer_id)
values (153, '11248');
insert into BELONGS (g_id, volunteer_id)
values (155, '11249');
insert into BELONGS (g_id, volunteer_id)
values (156, '11250');
insert into BELONGS (g_id, volunteer_id)
values (156, '11251');
insert into BELONGS (g_id, volunteer_id)
values (158, '11252');
insert into BELONGS (g_id, volunteer_id)
values (158, '11253');
insert into BELONGS (g_id, volunteer_id)
values (160, '11254');
insert into BELONGS (g_id, volunteer_id)
values (161, '11255');
insert into BELONGS (g_id, volunteer_id)
values (161, '11256');
insert into BELONGS (g_id, volunteer_id)
values (161, '11257');
insert into BELONGS (g_id, volunteer_id)
values (162, '11258');
insert into BELONGS (g_id, volunteer_id)
values (164, '11259');
insert into BELONGS (g_id, volunteer_id)
values (166, '11260');
insert into BELONGS (g_id, volunteer_id)
values (167, '11261');
insert into BELONGS (g_id, volunteer_id)
values (168, '11262');
insert into BELONGS (g_id, volunteer_id)
values (169, '11263');
insert into BELONGS (g_id, volunteer_id)
values (170, '11264');
insert into BELONGS (g_id, volunteer_id)
values (170, '11265');
insert into BELONGS (g_id, volunteer_id)
values (170, '11266');
insert into BELONGS (g_id, volunteer_id)
values (171, '11267');
insert into BELONGS (g_id, volunteer_id)
values (174, '11268');
insert into BELONGS (g_id, volunteer_id)
values (175, '11269');
insert into BELONGS (g_id, volunteer_id)
values (178, '11270');
insert into BELONGS (g_id, volunteer_id)
values (180, '11271');
insert into BELONGS (g_id, volunteer_id)
values (182, '11272');
insert into BELONGS (g_id, volunteer_id)
values (183, '11273');
insert into BELONGS (g_id, volunteer_id)
values (183, '11274');
insert into BELONGS (g_id, volunteer_id)
values (185, '11275');
insert into BELONGS (g_id, volunteer_id)
values (186, '11276');
insert into BELONGS (g_id, volunteer_id)
values (186, '11277');
insert into BELONGS (g_id, volunteer_id)
values (186, '11278');
insert into BELONGS (g_id, volunteer_id)
values (187, '11279');
insert into BELONGS (g_id, volunteer_id)
values (189, '11280');
insert into BELONGS (g_id, volunteer_id)
values (189, '11281');
insert into BELONGS (g_id, volunteer_id)
values (189, '11282');
insert into BELONGS (g_id, volunteer_id)
values (190, '11283');
insert into BELONGS (g_id, volunteer_id)
values (190, '11284');
insert into BELONGS (g_id, volunteer_id)
values (191, '11285');
insert into BELONGS (g_id, volunteer_id)
values (192, '11286');
insert into BELONGS (g_id, volunteer_id)
values (194, '11287');
insert into BELONGS (g_id, volunteer_id)
values (194, '11288');
insert into BELONGS (g_id, volunteer_id)
values (195, '11289');
insert into BELONGS (g_id, volunteer_id)
values (195, '11290');
insert into BELONGS (g_id, volunteer_id)
values (195, '11291');
insert into BELONGS (g_id, volunteer_id)
values (197, '11292');
insert into BELONGS (g_id, volunteer_id)
values (197, '11293');
insert into BELONGS (g_id, volunteer_id)
values (198, '11294');
insert into BELONGS (g_id, volunteer_id)
values (199, '11295');
insert into BELONGS (g_id, volunteer_id)
values (199, '11296');
insert into BELONGS (g_id, volunteer_id)
values (200, '11297');
insert into BELONGS (g_id, volunteer_id)
values (202, '11298');
insert into BELONGS (g_id, volunteer_id)
values (202, '11299');
insert into BELONGS (g_id, volunteer_id)
values (202, '11300');
insert into BELONGS (g_id, volunteer_id)
values (203, '11301');
insert into BELONGS (g_id, volunteer_id)
values (203, '11302');
insert into BELONGS (g_id, volunteer_id)
values (203, '11303');
insert into BELONGS (g_id, volunteer_id)
values (203, '11304');
insert into BELONGS (g_id, volunteer_id)
values (205, '11305');
insert into BELONGS (g_id, volunteer_id)
values (205, '11306');
insert into BELONGS (g_id, volunteer_id)
values (205, '11307');
insert into BELONGS (g_id, volunteer_id)
values (206, '11308');
insert into BELONGS (g_id, volunteer_id)
values (206, '11309');
insert into BELONGS (g_id, volunteer_id)
values (206, '11310');
commit;
prompt 200 records committed...
insert into BELONGS (g_id, volunteer_id)
values (210, '11311');
insert into BELONGS (g_id, volunteer_id)
values (210, '11312');
insert into BELONGS (g_id, volunteer_id)
values (211, '11313');
insert into BELONGS (g_id, volunteer_id)
values (212, '11314');
insert into BELONGS (g_id, volunteer_id)
values (213, '11315');
insert into BELONGS (g_id, volunteer_id)
values (213, '11316');
insert into BELONGS (g_id, volunteer_id)
values (214, '11317');
insert into BELONGS (g_id, volunteer_id)
values (214, '11318');
insert into BELONGS (g_id, volunteer_id)
values (215, '11319');
insert into BELONGS (g_id, volunteer_id)
values (216, '11320');
insert into BELONGS (g_id, volunteer_id)
values (219, '11321');
insert into BELONGS (g_id, volunteer_id)
values (219, '11322');
insert into BELONGS (g_id, volunteer_id)
values (221, '11323');
insert into BELONGS (g_id, volunteer_id)
values (224, '11324');
insert into BELONGS (g_id, volunteer_id)
values (227, '11325');
insert into BELONGS (g_id, volunteer_id)
values (228, '11326');
insert into BELONGS (g_id, volunteer_id)
values (228, '11327');
insert into BELONGS (g_id, volunteer_id)
values (228, '11328');
insert into BELONGS (g_id, volunteer_id)
values (229, '11329');
insert into BELONGS (g_id, volunteer_id)
values (229, '11330');
insert into BELONGS (g_id, volunteer_id)
values (230, '11331');
insert into BELONGS (g_id, volunteer_id)
values (231, '11332');
insert into BELONGS (g_id, volunteer_id)
values (232, '11333');
insert into BELONGS (g_id, volunteer_id)
values (232, '11334');
insert into BELONGS (g_id, volunteer_id)
values (234, '11335');
insert into BELONGS (g_id, volunteer_id)
values (234, '11336');
insert into BELONGS (g_id, volunteer_id)
values (238, '11337');
insert into BELONGS (g_id, volunteer_id)
values (239, '11338');
insert into BELONGS (g_id, volunteer_id)
values (240, '11339');
insert into BELONGS (g_id, volunteer_id)
values (240, '11340');
insert into BELONGS (g_id, volunteer_id)
values (241, '11341');
insert into BELONGS (g_id, volunteer_id)
values (241, '11342');
insert into BELONGS (g_id, volunteer_id)
values (242, '11343');
insert into BELONGS (g_id, volunteer_id)
values (242, '11344');
insert into BELONGS (g_id, volunteer_id)
values (245, '11345');
insert into BELONGS (g_id, volunteer_id)
values (246, '11346');
insert into BELONGS (g_id, volunteer_id)
values (247, '11347');
insert into BELONGS (g_id, volunteer_id)
values (248, '11348');
insert into BELONGS (g_id, volunteer_id)
values (250, '11349');
insert into BELONGS (g_id, volunteer_id)
values (251, '11350');
insert into BELONGS (g_id, volunteer_id)
values (252, '11351');
insert into BELONGS (g_id, volunteer_id)
values (252, '11352');
insert into BELONGS (g_id, volunteer_id)
values (254, '11353');
insert into BELONGS (g_id, volunteer_id)
values (254, '11354');
insert into BELONGS (g_id, volunteer_id)
values (256, '11355');
insert into BELONGS (g_id, volunteer_id)
values (257, '11356');
insert into BELONGS (g_id, volunteer_id)
values (260, '11357');
insert into BELONGS (g_id, volunteer_id)
values (260, '11358');
insert into BELONGS (g_id, volunteer_id)
values (260, '11359');
insert into BELONGS (g_id, volunteer_id)
values (261, '11360');
insert into BELONGS (g_id, volunteer_id)
values (262, '11361');
insert into BELONGS (g_id, volunteer_id)
values (263, '11362');
insert into BELONGS (g_id, volunteer_id)
values (263, '11363');
insert into BELONGS (g_id, volunteer_id)
values (265, '11364');
insert into BELONGS (g_id, volunteer_id)
values (266, '11365');
insert into BELONGS (g_id, volunteer_id)
values (267, '11366');
insert into BELONGS (g_id, volunteer_id)
values (267, '11367');
insert into BELONGS (g_id, volunteer_id)
values (267, '11368');
insert into BELONGS (g_id, volunteer_id)
values (267, '11369');
insert into BELONGS (g_id, volunteer_id)
values (270, '11370');
insert into BELONGS (g_id, volunteer_id)
values (271, '11371');
insert into BELONGS (g_id, volunteer_id)
values (272, '11372');
insert into BELONGS (g_id, volunteer_id)
values (274, '11373');
insert into BELONGS (g_id, volunteer_id)
values (275, '11374');
insert into BELONGS (g_id, volunteer_id)
values (275, '11375');
insert into BELONGS (g_id, volunteer_id)
values (277, '11376');
insert into BELONGS (g_id, volunteer_id)
values (279, '11377');
insert into BELONGS (g_id, volunteer_id)
values (280, '11378');
insert into BELONGS (g_id, volunteer_id)
values (284, '11379');
insert into BELONGS (g_id, volunteer_id)
values (284, '11380');
insert into BELONGS (g_id, volunteer_id)
values (287, '11381');
insert into BELONGS (g_id, volunteer_id)
values (288, '11382');
insert into BELONGS (g_id, volunteer_id)
values (289, '11383');
insert into BELONGS (g_id, volunteer_id)
values (291, '11384');
insert into BELONGS (g_id, volunteer_id)
values (291, '11385');
insert into BELONGS (g_id, volunteer_id)
values (291, '11386');
insert into BELONGS (g_id, volunteer_id)
values (291, '11387');
insert into BELONGS (g_id, volunteer_id)
values (294, '11388');
insert into BELONGS (g_id, volunteer_id)
values (294, '11389');
insert into BELONGS (g_id, volunteer_id)
values (298, '11390');
insert into BELONGS (g_id, volunteer_id)
values (298, '11391');
insert into BELONGS (g_id, volunteer_id)
values (302, '11392');
insert into BELONGS (g_id, volunteer_id)
values (303, '11393');
insert into BELONGS (g_id, volunteer_id)
values (304, '11394');
insert into BELONGS (g_id, volunteer_id)
values (305, '11395');
insert into BELONGS (g_id, volunteer_id)
values (306, '11396');
insert into BELONGS (g_id, volunteer_id)
values (306, '11397');
insert into BELONGS (g_id, volunteer_id)
values (306, '11398');
insert into BELONGS (g_id, volunteer_id)
values (308, '11399');
insert into BELONGS (g_id, volunteer_id)
values (310, '11400');
insert into BELONGS (g_id, volunteer_id)
values (310, '11401');
insert into BELONGS (g_id, volunteer_id)
values (311, '11402');
insert into BELONGS (g_id, volunteer_id)
values (311, '11403');
insert into BELONGS (g_id, volunteer_id)
values (314, '11404');
insert into BELONGS (g_id, volunteer_id)
values (314, '11405');
insert into BELONGS (g_id, volunteer_id)
values (315, '11406');
insert into BELONGS (g_id, volunteer_id)
values (315, '11407');
insert into BELONGS (g_id, volunteer_id)
values (316, '11408');
insert into BELONGS (g_id, volunteer_id)
values (316, '11409');
insert into BELONGS (g_id, volunteer_id)
values (316, '11410');
commit;
prompt 300 records committed...
insert into BELONGS (g_id, volunteer_id)
values (317, '11411');
insert into BELONGS (g_id, volunteer_id)
values (318, '11412');
insert into BELONGS (g_id, volunteer_id)
values (318, '11413');
insert into BELONGS (g_id, volunteer_id)
values (320, '11414');
insert into BELONGS (g_id, volunteer_id)
values (320, '11415');
insert into BELONGS (g_id, volunteer_id)
values (323, '11416');
insert into BELONGS (g_id, volunteer_id)
values (323, '11417');
insert into BELONGS (g_id, volunteer_id)
values (323, '11418');
insert into BELONGS (g_id, volunteer_id)
values (323, '11419');
insert into BELONGS (g_id, volunteer_id)
values (327, '11420');
insert into BELONGS (g_id, volunteer_id)
values (327, '11421');
insert into BELONGS (g_id, volunteer_id)
values (327, '11422');
insert into BELONGS (g_id, volunteer_id)
values (330, '11423');
insert into BELONGS (g_id, volunteer_id)
values (332, '11424');
insert into BELONGS (g_id, volunteer_id)
values (333, '11425');
insert into BELONGS (g_id, volunteer_id)
values (333, '11426');
insert into BELONGS (g_id, volunteer_id)
values (335, '11427');
insert into BELONGS (g_id, volunteer_id)
values (336, '11428');
insert into BELONGS (g_id, volunteer_id)
values (337, '11429');
insert into BELONGS (g_id, volunteer_id)
values (338, '11430');
insert into BELONGS (g_id, volunteer_id)
values (339, '11431');
insert into BELONGS (g_id, volunteer_id)
values (339, '11432');
insert into BELONGS (g_id, volunteer_id)
values (343, '11433');
insert into BELONGS (g_id, volunteer_id)
values (345, '11434');
insert into BELONGS (g_id, volunteer_id)
values (349, '11435');
insert into BELONGS (g_id, volunteer_id)
values (349, '11436');
insert into BELONGS (g_id, volunteer_id)
values (349, '11437');
insert into BELONGS (g_id, volunteer_id)
values (350, '11438');
insert into BELONGS (g_id, volunteer_id)
values (350, '11439');
insert into BELONGS (g_id, volunteer_id)
values (351, '11440');
insert into BELONGS (g_id, volunteer_id)
values (352, '11441');
insert into BELONGS (g_id, volunteer_id)
values (354, '11442');
insert into BELONGS (g_id, volunteer_id)
values (356, '11443');
insert into BELONGS (g_id, volunteer_id)
values (356, '11444');
insert into BELONGS (g_id, volunteer_id)
values (357, '11445');
insert into BELONGS (g_id, volunteer_id)
values (358, '11446');
insert into BELONGS (g_id, volunteer_id)
values (360, '11447');
insert into BELONGS (g_id, volunteer_id)
values (361, '11448');
insert into BELONGS (g_id, volunteer_id)
values (362, '11449');
insert into BELONGS (g_id, volunteer_id)
values (362, '11450');
insert into BELONGS (g_id, volunteer_id)
values (363, '11451');
insert into BELONGS (g_id, volunteer_id)
values (363, '11452');
insert into BELONGS (g_id, volunteer_id)
values (364, '11453');
insert into BELONGS (g_id, volunteer_id)
values (364, '11454');
insert into BELONGS (g_id, volunteer_id)
values (364, '11455');
insert into BELONGS (g_id, volunteer_id)
values (364, '11456');
insert into BELONGS (g_id, volunteer_id)
values (365, '11457');
insert into BELONGS (g_id, volunteer_id)
values (366, '11458');
insert into BELONGS (g_id, volunteer_id)
values (368, '11459');
insert into BELONGS (g_id, volunteer_id)
values (369, '11460');
insert into BELONGS (g_id, volunteer_id)
values (371, '11461');
insert into BELONGS (g_id, volunteer_id)
values (375, '11462');
insert into BELONGS (g_id, volunteer_id)
values (377, '11463');
insert into BELONGS (g_id, volunteer_id)
values (378, '11464');
insert into BELONGS (g_id, volunteer_id)
values (379, '11465');
insert into BELONGS (g_id, volunteer_id)
values (383, '11466');
insert into BELONGS (g_id, volunteer_id)
values (384, '11467');
insert into BELONGS (g_id, volunteer_id)
values (384, '11468');
insert into BELONGS (g_id, volunteer_id)
values (386, '11469');
insert into BELONGS (g_id, volunteer_id)
values (387, '11470');
insert into BELONGS (g_id, volunteer_id)
values (387, '11471');
insert into BELONGS (g_id, volunteer_id)
values (389, '11472');
insert into BELONGS (g_id, volunteer_id)
values (392, '11473');
insert into BELONGS (g_id, volunteer_id)
values (392, '11474');
insert into BELONGS (g_id, volunteer_id)
values (396, '11475');
insert into BELONGS (g_id, volunteer_id)
values (400, '11476');
insert into BELONGS (g_id, volunteer_id)
values (400, '11477');
insert into BELONGS (g_id, volunteer_id)
values (400, '11478');
insert into BELONGS (g_id, volunteer_id)
values (400, '11479');
insert into BELONGS (g_id, volunteer_id)
values (400, '11480');
insert into BELONGS (g_id, volunteer_id)
values (400, '11481');
insert into BELONGS (g_id, volunteer_id)
values (400, '11482');
insert into BELONGS (g_id, volunteer_id)
values (400, '11483');
insert into BELONGS (g_id, volunteer_id)
values (400, '11484');
insert into BELONGS (g_id, volunteer_id)
values (400, '11485');
insert into BELONGS (g_id, volunteer_id)
values (400, '11486');
insert into BELONGS (g_id, volunteer_id)
values (400, '11487');
insert into BELONGS (g_id, volunteer_id)
values (400, '11488');
insert into BELONGS (g_id, volunteer_id)
values (400, '11489');
commit;
prompt 379 records loaded
prompt Loading DRIVER...
insert into DRIVER (licensenum, volunteer_id)
values (11111, '1');
insert into DRIVER (licensenum, volunteer_id)
values (22222, '2');
insert into DRIVER (licensenum, volunteer_id)
values (33333, '3');
insert into DRIVER (licensenum, volunteer_id)
values (44444, '4');
insert into DRIVER (licensenum, volunteer_id)
values (55555, '5');
insert into DRIVER (licensenum, volunteer_id)
values (66666, '6');
insert into DRIVER (licensenum, volunteer_id)
values (77777, '7');
insert into DRIVER (licensenum, volunteer_id)
values (88888, '8');
insert into DRIVER (licensenum, volunteer_id)
values (99999, '9');
insert into DRIVER (licensenum, volunteer_id)
values (101010, '10');
insert into DRIVER (licensenum, volunteer_id)
values (11111, '11413');
insert into DRIVER (licensenum, volunteer_id)
values (11112, '11381');
insert into DRIVER (licensenum, volunteer_id)
values (11113, '11331');
insert into DRIVER (licensenum, volunteer_id)
values (11114, '11268');
insert into DRIVER (licensenum, volunteer_id)
values (11115, '11473');
insert into DRIVER (licensenum, volunteer_id)
values (11116, '11495');
insert into DRIVER (licensenum, volunteer_id)
values (11117, '11242');
insert into DRIVER (licensenum, volunteer_id)
values (11118, '11421');
insert into DRIVER (licensenum, volunteer_id)
values (11119, '11293');
insert into DRIVER (licensenum, volunteer_id)
values (11120, '11121');
insert into DRIVER (licensenum, volunteer_id)
values (11121, '11179');
insert into DRIVER (licensenum, volunteer_id)
values (11122, '11435');
insert into DRIVER (licensenum, volunteer_id)
values (11123, '11352');
insert into DRIVER (licensenum, volunteer_id)
values (11124, '11367');
insert into DRIVER (licensenum, volunteer_id)
values (11125, '11321');
insert into DRIVER (licensenum, volunteer_id)
values (11126, '11188');
insert into DRIVER (licensenum, volunteer_id)
values (11127, '11223');
insert into DRIVER (licensenum, volunteer_id)
values (11128, '11312');
insert into DRIVER (licensenum, volunteer_id)
values (11129, '11423');
insert into DRIVER (licensenum, volunteer_id)
values (11130, '11402');
insert into DRIVER (licensenum, volunteer_id)
values (11131, '11463');
insert into DRIVER (licensenum, volunteer_id)
values (11132, '11498');
insert into DRIVER (licensenum, volunteer_id)
values (11133, '11497');
insert into DRIVER (licensenum, volunteer_id)
values (11134, '11297');
insert into DRIVER (licensenum, volunteer_id)
values (11135, '11191');
insert into DRIVER (licensenum, volunteer_id)
values (11137, '11329');
insert into DRIVER (licensenum, volunteer_id)
values (11138, '11443');
insert into DRIVER (licensenum, volunteer_id)
values (11139, '11140');
insert into DRIVER (licensenum, volunteer_id)
values (11140, '11506');
insert into DRIVER (licensenum, volunteer_id)
values (11141, '11465');
insert into DRIVER (licensenum, volunteer_id)
values (11142, '11315');
insert into DRIVER (licensenum, volunteer_id)
values (11143, '11158');
insert into DRIVER (licensenum, volunteer_id)
values (11145, '11481');
insert into DRIVER (licensenum, volunteer_id)
values (11146, '11265');
insert into DRIVER (licensenum, volunteer_id)
values (11148, '11213');
insert into DRIVER (licensenum, volunteer_id)
values (11149, '11258');
insert into DRIVER (licensenum, volunteer_id)
values (11150, '11489');
insert into DRIVER (licensenum, volunteer_id)
values (11151, '11129');
insert into DRIVER (licensenum, volunteer_id)
values (11152, '11325');
insert into DRIVER (licensenum, volunteer_id)
values (11153, '11260');
insert into DRIVER (licensenum, volunteer_id)
values (11154, '11353');
insert into DRIVER (licensenum, volunteer_id)
values (11155, '11400');
insert into DRIVER (licensenum, volunteer_id)
values (11156, '11131');
insert into DRIVER (licensenum, volunteer_id)
values (11157, '11199');
insert into DRIVER (licensenum, volunteer_id)
values (11158, '11285');
insert into DRIVER (licensenum, volunteer_id)
values (11159, '11235');
insert into DRIVER (licensenum, volunteer_id)
values (11160, '11408');
insert into DRIVER (licensenum, volunteer_id)
values (11161, '11478');
insert into DRIVER (licensenum, volunteer_id)
values (11162, '11374');
insert into DRIVER (licensenum, volunteer_id)
values (11163, '11160');
insert into DRIVER (licensenum, volunteer_id)
values (11164, '11430');
insert into DRIVER (licensenum, volunteer_id)
values (11165, '11266');
insert into DRIVER (licensenum, volunteer_id)
values (11166, '11138');
insert into DRIVER (licensenum, volunteer_id)
values (11167, '11442');
insert into DRIVER (licensenum, volunteer_id)
values (11170, '11369');
insert into DRIVER (licensenum, volunteer_id)
values (11171, '11327');
insert into DRIVER (licensenum, volunteer_id)
values (11172, '11449');
insert into DRIVER (licensenum, volunteer_id)
values (11173, '11508');
insert into DRIVER (licensenum, volunteer_id)
values (11174, '11244');
insert into DRIVER (licensenum, volunteer_id)
values (11175, '11280');
insert into DRIVER (licensenum, volunteer_id)
values (11176, '11190');
insert into DRIVER (licensenum, volunteer_id)
values (11177, '11509');
insert into DRIVER (licensenum, volunteer_id)
values (11178, '11231');
insert into DRIVER (licensenum, volunteer_id)
values (11180, '11384');
insert into DRIVER (licensenum, volunteer_id)
values (11181, '11460');
insert into DRIVER (licensenum, volunteer_id)
values (11183, '11236');
insert into DRIVER (licensenum, volunteer_id)
values (11184, '11182');
insert into DRIVER (licensenum, volunteer_id)
values (11185, '11344');
insert into DRIVER (licensenum, volunteer_id)
values (11186, '11335');
insert into DRIVER (licensenum, volunteer_id)
values (11188, '11230');
insert into DRIVER (licensenum, volunteer_id)
values (11189, '11431');
insert into DRIVER (licensenum, volunteer_id)
values (11190, '11456');
insert into DRIVER (licensenum, volunteer_id)
values (11191, '11311');
insert into DRIVER (licensenum, volunteer_id)
values (11192, '11137');
insert into DRIVER (licensenum, volunteer_id)
values (11193, '11157');
insert into DRIVER (licensenum, volunteer_id)
values (11194, '11452');
insert into DRIVER (licensenum, volunteer_id)
values (11196, '11499');
insert into DRIVER (licensenum, volunteer_id)
values (11197, '11153');
insert into DRIVER (licensenum, volunteer_id)
values (11198, '11185');
insert into DRIVER (licensenum, volunteer_id)
values (11199, '11232');
insert into DRIVER (licensenum, volunteer_id)
values (11200, '11496');
insert into DRIVER (licensenum, volunteer_id)
values (11201, '11114');
insert into DRIVER (licensenum, volunteer_id)
values (11202, '11224');
insert into DRIVER (licensenum, volunteer_id)
values (11204, '11186');
insert into DRIVER (licensenum, volunteer_id)
values (11208, '11349');
insert into DRIVER (licensenum, volunteer_id)
values (11209, '11307');
insert into DRIVER (licensenum, volunteer_id)
values (11211, '11362');
insert into DRIVER (licensenum, volunteer_id)
values (11212, '11205');
insert into DRIVER (licensenum, volunteer_id)
values (11213, '11264');
insert into DRIVER (licensenum, volunteer_id)
values (11215, '11278');
commit;
prompt 100 records committed...
insert into DRIVER (licensenum, volunteer_id)
values (11217, '11490');
insert into DRIVER (licensenum, volunteer_id)
values (11218, '11211');
insert into DRIVER (licensenum, volunteer_id)
values (11219, '11252');
insert into DRIVER (licensenum, volunteer_id)
values (11220, '11383');
insert into DRIVER (licensenum, volunteer_id)
values (11221, '11167');
insert into DRIVER (licensenum, volunteer_id)
values (11223, '11398');
insert into DRIVER (licensenum, volunteer_id)
values (11224, '11404');
insert into DRIVER (licensenum, volunteer_id)
values (11225, '11457');
insert into DRIVER (licensenum, volunteer_id)
values (11227, '11317');
insert into DRIVER (licensenum, volunteer_id)
values (11228, '11276');
insert into DRIVER (licensenum, volunteer_id)
values (11229, '11217');
insert into DRIVER (licensenum, volunteer_id)
values (11230, '11279');
insert into DRIVER (licensenum, volunteer_id)
values (11231, '11147');
insert into DRIVER (licensenum, volunteer_id)
values (11232, '11225');
insert into DRIVER (licensenum, volunteer_id)
values (11233, '11240');
insert into DRIVER (licensenum, volunteer_id)
values (11234, '11341');
insert into DRIVER (licensenum, volunteer_id)
values (11235, '11365');
insert into DRIVER (licensenum, volunteer_id)
values (11236, '11115');
insert into DRIVER (licensenum, volunteer_id)
values (11239, '11403');
insert into DRIVER (licensenum, volunteer_id)
values (11242, '11309');
insert into DRIVER (licensenum, volunteer_id)
values (11243, '11299');
insert into DRIVER (licensenum, volunteer_id)
values (11244, '11237');
insert into DRIVER (licensenum, volunteer_id)
values (11245, '11170');
insert into DRIVER (licensenum, volunteer_id)
values (11246, '11134');
insert into DRIVER (licensenum, volunteer_id)
values (11248, '11127');
insert into DRIVER (licensenum, volunteer_id)
values (11249, '11504');
insert into DRIVER (licensenum, volunteer_id)
values (11250, '11198');
insert into DRIVER (licensenum, volunteer_id)
values (11251, '11195');
insert into DRIVER (licensenum, volunteer_id)
values (11253, '11254');
insert into DRIVER (licensenum, volunteer_id)
values (11254, '11484');
insert into DRIVER (licensenum, volunteer_id)
values (11256, '11303');
insert into DRIVER (licensenum, volunteer_id)
values (11258, '11308');
insert into DRIVER (licensenum, volunteer_id)
values (11260, '11288');
insert into DRIVER (licensenum, volunteer_id)
values (11261, '11373');
insert into DRIVER (licensenum, volunteer_id)
values (11263, '11372');
insert into DRIVER (licensenum, volunteer_id)
values (11264, '11492');
insert into DRIVER (licensenum, volunteer_id)
values (11268, '11156');
insert into DRIVER (licensenum, volunteer_id)
values (11269, '11117');
insert into DRIVER (licensenum, volunteer_id)
values (11270, '11395');
insert into DRIVER (licensenum, volunteer_id)
values (11272, '11454');
insert into DRIVER (licensenum, volunteer_id)
values (11273, '11184');
insert into DRIVER (licensenum, volunteer_id)
values (11275, '11448');
insert into DRIVER (licensenum, volunteer_id)
values (11276, '11355');
insert into DRIVER (licensenum, volunteer_id)
values (11277, '11119');
insert into DRIVER (licensenum, volunteer_id)
values (11278, '11189');
insert into DRIVER (licensenum, volunteer_id)
values (11281, '11357');
insert into DRIVER (licensenum, volunteer_id)
values (11283, '11356');
insert into DRIVER (licensenum, volunteer_id)
values (11284, '11183');
insert into DRIVER (licensenum, volunteer_id)
values (11285, '11366');
insert into DRIVER (licensenum, volunteer_id)
values (11290, '11239');
insert into DRIVER (licensenum, volunteer_id)
values (11291, '11305');
insert into DRIVER (licensenum, volunteer_id)
values (11293, '11385');
insert into DRIVER (licensenum, volunteer_id)
values (11294, '11388');
insert into DRIVER (licensenum, volunteer_id)
values (11296, '11149');
insert into DRIVER (licensenum, volunteer_id)
values (11297, '11502');
insert into DRIVER (licensenum, volunteer_id)
values (11299, '11350');
insert into DRIVER (licensenum, volunteer_id)
values (11301, '11477');
insert into DRIVER (licensenum, volunteer_id)
values (11303, '11396');
insert into DRIVER (licensenum, volunteer_id)
values (11305, '11229');
insert into DRIVER (licensenum, volunteer_id)
values (11306, '11375');
insert into DRIVER (licensenum, volunteer_id)
values (11309, '11316');
commit;
prompt 161 records loaded
prompt Loading DRIVERINSHIFT...
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('1', 1);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('1', 11112);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('10', 10);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('10', 13);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('10', 11252);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('10', 11371);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('10', 11393);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('10', 11471);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('10', 11478);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('10', 11481);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11114', 11236);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11115', 11311);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11115', 11367);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11115', 11501);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11117', 11247);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11119', 11421);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11121', 11383);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11121', 11430);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11127', 11349);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11129', 11183);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11129', 11432);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11131', 11456);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11134', 12);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11134', 11187);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11137', 11157);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11137', 11319);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11137', 11365);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11137', 11411);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11138', 11129);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11138', 11416);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11140', 11141);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11140', 11513);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11147', 11117);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11149', 11167);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11149', 11169);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11149', 11427);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11153', 11438);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11156', 11502);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11157', 11124);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11157', 11167);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11157', 11258);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11157', 11349);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11158', 11398);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11158', 11435);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11160', 11198);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11160', 11275);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11167', 11179);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11167', 11188);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11167', 11277);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11170', 11125);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11170', 11229);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11170', 11385);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11179', 11155);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11179', 11280);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11179', 11457);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11179', 11495);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11182', 11206);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11182', 11427);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11183', 11199);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11183', 11451);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11184', 11191);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11185', 11233);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11185', 11316);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11186', 11237);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11186', 11321);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11188', 11166);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11188', 11271);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11188', 11432);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11189', 11485);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11190', 11366);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11190', 11376);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11190', 11394);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11190', 11454);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11191', 11136);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11195', 11319);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11195', 11441);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11198', 11304);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11199', 11240);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11199', 11340);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11199', 11361);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11205', 11);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11211', 11161);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11211', 11392);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11211', 11441);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11213', 11285);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11213', 11453);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11217', 11125);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11217', 11189);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11217', 11197);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11217', 11394);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11217', 11428);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11223', 11221);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11224', 6);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11224', 11168);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11224', 11322);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11224', 11334);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11224', 11399);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11225', 11433);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11229', 11272);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11230', 11223);
commit;
prompt 100 records committed...
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11230', 11467);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11231', 11316);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11232', 11295);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11232', 11387);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11232', 11427);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11236', 11275);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11236', 11315);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11236', 11329);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11236', 11437);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11236', 11449);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11237', 11339);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11239', 11360);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11240', 11253);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11242', 11238);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11242', 11340);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11242', 11415);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11244', 11336);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11252', 11157);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11252', 11334);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11252', 11337);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11254', 11506);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11258', 11121);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11258', 11427);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11264', 11327);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11264', 11380);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11265', 11121);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11265', 11211);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11265', 11288);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11265', 11308);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11266', 11407);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11276', 7);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11276', 11275);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11278', 11449);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11279', 11139);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11280', 11112);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11280', 11259);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11280', 11437);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11285', 11119);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11285', 11322);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11288', 11352);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11303', 11237);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11303', 11396);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11305', 11276);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11308', 11215);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11308', 11276);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11308', 11338);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11309', 11229);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11311', 11343);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11312', 11409);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11315', 5);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11315', 11260);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11315', 11328);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11315', 11445);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11315', 11496);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11316', 11203);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11317', 11121);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11317', 11299);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11321', 11247);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11325', 11189);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11325', 11468);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11329', 11137);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11329', 11268);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11331', 11111);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11331', 11363);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11335', 11128);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11335', 11175);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11341', 11421);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11344', 11125);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11344', 11268);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11344', 11318);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11350', 11126);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11350', 11166);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11350', 11495);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11352', 11134);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11352', 11182);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11352', 11217);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11352', 11311);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11355', 11117);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11356', 4);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11356', 11224);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11357', 11177);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11357', 11365);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11357', 11471);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11362', 11225);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11362', 11377);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11362', 11505);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11365', 11392);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11366', 11113);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11366', 11373);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11366', 11388);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11367', 11378);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11372', 11311);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11372', 11501);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11373', 11166);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11373', 11202);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11373', 11487);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11373', 11496);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11375', 11142);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11375', 11426);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11375', 11471);
commit;
prompt 200 records committed...
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11381', 11447);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11383', 11130);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11383', 11180);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11383', 11235);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11383', 11344);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11384', 4);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11385', 11171);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11385', 11246);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11385', 11254);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11388', 11240);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11388', 11459);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11395', 13);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11395', 11212);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11395', 11221);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11395', 11376);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11396', 11189);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11396', 11192);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11396', 11283);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11400', 11354);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11402', 11209);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11403', 11363);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11403', 11455);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11404', 11215);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11408', 11212);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11408', 11329);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11408', 11488);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11413', 11135);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11413', 11169);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11423', 11122);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11423', 11492);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11430', 11201);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11430', 11347);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11431', 11292);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11431', 11454);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11435', 11291);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11435', 11423);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11442', 11121);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11442', 11385);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11443', 11132);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11443', 11177);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11443', 11227);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11443', 11494);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11448', 11235);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11448', 11472);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11449', 11473);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11454', 11298);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11456', 11372);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11456', 11393);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11457', 11460);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11460', 11271);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11460', 11512);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11463', 11149);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11477', 11185);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11477', 11391);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11478', 11134);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11478', 11290);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11481', 11251);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11481', 11509);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11489', 11128);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11489', 11308);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11489', 11374);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11490', 11143);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11490', 11368);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11492', 11222);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11492', 11234);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11492', 11293);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11492', 11294);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11492', 11329);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11492', 11466);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11495', 11148);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11495', 11202);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11495', 11255);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11496', 11193);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11496', 11267);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11497', 9);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11497', 11139);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11497', 11163);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11497', 11388);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11498', 11117);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11498', 11279);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11498', 11481);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11499', 11415);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11502', 11341);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11502', 11421);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11504', 11307);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11504', 11393);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11506', 13);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11506', 11466);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11506', 11507);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11508', 11477);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11509', 11175);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11509', 11280);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11509', 11410);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('2', 2);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('2', 11149);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('2', 11299);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('3', 3);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('3', 11472);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('3', 11491);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('4', 4);
commit;
prompt 300 records committed...
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('4', 11113);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('4', 11136);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('4', 11257);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('4', 11459);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('4', 11511);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('5', 5);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('5', 11);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('5', 11175);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('5', 11398);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('5', 11412);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('6', 6);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('6', 11471);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('7', 7);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('7', 11470);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('8', 8);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('8', 12);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('8', 11269);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('9', 9);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('9', 11211);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('9', 11377);
commit;
prompt 320 records loaded
prompt Loading DRIVERTOAMBU...
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('1', 1);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('10', 10);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('10', 11222);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('10', 11261);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('10', 11509);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11115', 11386);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11119', 11451);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11121', 11208);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11121', 11227);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11127', 11165);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11129', 11164);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11129', 11476);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11131', 11162);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11131', 11350);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11134', 11297);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11134', 11370);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11137', 11443);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11137', 11454);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11138', 11286);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11138', 11394);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11138', 11430);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11140', 11130);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11140', 11206);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11147', 11252);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11149', 11164);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11149', 11390);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11153', 5);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11156', 11171);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11156', 11276);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11156', 11458);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11157', 11145);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11158', 11119);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11158', 11130);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11160', 5);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11160', 11129);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11182', 11269);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11182', 11278);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11182', 11501);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11183', 11200);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11183', 11245);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11183', 11333);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11183', 11413);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11185', 10);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11185', 11327);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11186', 11126);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11186', 11152);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11186', 11509);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11188', 11182);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11189', 11280);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11189', 11435);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11189', 11480);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11190', 11443);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11195', 11443);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11199', 11287);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11205', 11221);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11205', 11437);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11205', 11446);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11211', 11427);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11211', 11500);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11213', 11339);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11213', 11497);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11217', 11394);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11217', 11399);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11224', 11120);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11224', 11499);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11225', 11116);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11225', 11464);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11229', 11496);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11230', 11346);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11230', 11507);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11231', 4);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11231', 11424);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11232', 11289);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11235', 11478);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11236', 11255);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11237', 11316);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11237', 11382);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11240', 3);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11240', 11319);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11244', 11491);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11252', 11473);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11254', 11119);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11254', 11290);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11258', 11367);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11260', 11464);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11264', 11176);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11264', 11459);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11268', 11139);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11268', 11292);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11268', 11422);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11278', 11263);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11278', 11325);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11279', 11126);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11279', 11435);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11280', 11232);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11285', 11498);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11293', 11239);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11297', 11489);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11299', 11421);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11303', 5);
commit;
prompt 100 records committed...
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11303', 11278);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11303', 11436);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11307', 11144);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11307', 11259);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11307', 11453);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11308', 11480);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11311', 11216);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11311', 11288);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11312', 11232);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11316', 11414);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11321', 11150);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11321', 11167);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11321', 11329);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11327', 11200);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11327', 11333);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11329', 11172);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11329', 11224);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11329', 11347);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11331', 11158);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11331', 11201);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11331', 11259);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11331', 11437);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11331', 11441);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11335', 11489);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11344', 11306);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11344', 11416);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11349', 11404);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11350', 11327);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11352', 11357);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11353', 11430);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11355', 11495);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11356', 11318);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11357', 11148);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11357', 11424);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11362', 11325);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11367', 11140);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11367', 11150);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11367', 11369);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11367', 11474);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11369', 11144);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11372', 11147);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11372', 11489);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11373', 11510);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11374', 11505);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11375', 11201);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11383', 11158);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11383', 11275);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11383', 11450);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11384', 11323);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11384', 11421);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11385', 11483);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11396', 11165);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11396', 11356);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11398', 2);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11400', 11131);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11402', 11339);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11402', 11378);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11402', 11420);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11403', 11134);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11404', 11471);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11413', 11270);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11421', 11185);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11421', 11308);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11421', 11434);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11430', 11508);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11431', 11111);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11442', 11375);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11443', 11196);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11448', 11358);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11449', 6);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11449', 11195);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11449', 11269);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11449', 11344);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11449', 11370);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11452', 11359);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11452', 11503);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11457', 11219);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11457', 11378);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11460', 11220);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11460', 11242);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11460', 11358);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11463', 11508);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11465', 11385);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11473', 11163);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11481', 11165);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11484', 11209);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11489', 11118);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11490', 11140);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11492', 11187);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11492', 11494);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11496', 11283);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11496', 11390);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11497', 11149);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11498', 11332);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11499', 11508);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11502', 11183);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11502', 11329);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11504', 11198);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11506', 11168);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11506', 11247);
commit;
prompt 200 records committed...
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11508', 11373);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('2', 2);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('2', 11126);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('2', 11463);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('3', 3);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('3', 11343);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('4', 4);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('5', 5);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('6', 6);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('6', 11316);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('6', 11383);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('7', 7);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('7', 11392);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('8', 8);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('9', 9);
commit;
prompt 215 records loaded
prompt Loading EQUIPMENT...
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('03-11-2042', 'dd-mm-yyyy'), 218, 'CPR Manikin', 52);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('08-12-2031', 'dd-mm-yyyy'), 219, 'Thermometer', 71);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('11-01-2031', 'dd-mm-yyyy'), 220, 'Defibrillator', 92);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('15-12-2039', 'dd-mm-yyyy'), 221, 'First Aid Kit', 46);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('31-01-2040', 'dd-mm-yyyy'), 222, 'Face Mask', 71);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('30-05-2031', 'dd-mm-yyyy'), 223, 'Oxygen Tank', 47);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('31-10-2036', 'dd-mm-yyyy'), 224, 'Defibrillator', 84);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('28-12-2026', 'dd-mm-yyyy'), 225, 'Oxygen Tank', 44);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('20-04-2027', 'dd-mm-yyyy'), 226, 'Oxygen Tank', 47);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('10-10-2025', 'dd-mm-yyyy'), 227, 'Face Mask', 82);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('09-10-2029', 'dd-mm-yyyy'), 228, 'Oxygen Tank', 81);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('06-08-2031', 'dd-mm-yyyy'), 229, 'Stethoscope', 90);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('30-03-2042', 'dd-mm-yyyy'), 230, 'Blood Pressure Monitor', 77);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('10-09-2041', 'dd-mm-yyyy'), 231, 'Face Mask', 80);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('12-06-2031', 'dd-mm-yyyy'), 232, 'Surgical Gloves', 76);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('07-04-2030', 'dd-mm-yyyy'), 233, 'Glucose Meter', 71);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('04-07-2043', 'dd-mm-yyyy'), 234, 'Stethoscope', 86);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('04-04-2033', 'dd-mm-yyyy'), 235, 'Blood Pressure Monitor', 47);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('26-06-2037', 'dd-mm-yyyy'), 236, 'Face Mask', 69);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('21-08-2029', 'dd-mm-yyyy'), 237, 'Blood Pressure Monitor', 66);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('22-10-2038', 'dd-mm-yyyy'), 238, 'Glucose Meter', 53);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('01-11-2039', 'dd-mm-yyyy'), 239, 'Defibrillator', 95);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('24-01-2036', 'dd-mm-yyyy'), 240, 'Glucose Meter', 47);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('04-11-2034', 'dd-mm-yyyy'), 241, 'Oxygen Tank', 78);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('12-03-2028', 'dd-mm-yyyy'), 242, 'Oxygen Tank', 60);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('31-07-2031', 'dd-mm-yyyy'), 243, 'Stethoscope', 89);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('27-11-2025', 'dd-mm-yyyy'), 244, 'Thermometer', 54);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('13-12-2031', 'dd-mm-yyyy'), 245, 'Stethoscope', 100);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('08-07-2027', 'dd-mm-yyyy'), 246, 'Blood Pressure Monitor', 97);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('09-09-2026', 'dd-mm-yyyy'), 247, 'Thermometer', 50);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('15-07-2041', 'dd-mm-yyyy'), 248, 'CPR Manikin', 82);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('16-01-2041', 'dd-mm-yyyy'), 249, 'Thermometer', 103);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('15-06-2042', 'dd-mm-yyyy'), 250, 'Defibrillator', 81);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('14-06-2029', 'dd-mm-yyyy'), 251, 'Blood Pressure Monitor', 79);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('01-09-2038', 'dd-mm-yyyy'), 252, 'Blood Pressure Monitor', 93);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('07-07-2041', 'dd-mm-yyyy'), 253, 'Glucose Meter', 71);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('08-06-2028', 'dd-mm-yyyy'), 254, 'Surgical Gloves', 64);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('01-03-2043', 'dd-mm-yyyy'), 255, 'Glucose Meter', 65);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('27-06-2037', 'dd-mm-yyyy'), 256, 'Defibrillator', 59);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('13-02-2036', 'dd-mm-yyyy'), 257, 'First Aid Kit', 87);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('29-09-2036', 'dd-mm-yyyy'), 258, 'Thermometer', 69);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('19-12-2036', 'dd-mm-yyyy'), 259, 'Face Mask', 94);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('23-08-2026', 'dd-mm-yyyy'), 260, 'First Aid Kit', 69);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('14-05-2025', 'dd-mm-yyyy'), 261, 'Glucose Meter', 85);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('15-02-2032', 'dd-mm-yyyy'), 262, 'CPR Manikin', 68);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('12-09-2030', 'dd-mm-yyyy'), 263, 'Stethoscope', 95);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('23-10-2035', 'dd-mm-yyyy'), 264, 'Defibrillator', 97);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('23-10-2028', 'dd-mm-yyyy'), 265, 'CPR Manikin', 81);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('16-03-2032', 'dd-mm-yyyy'), 266, 'Defibrillator', 95);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('29-09-2026', 'dd-mm-yyyy'), 267, 'Oxygen Tank', 78);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('20-07-2029', 'dd-mm-yyyy'), 268, 'Thermometer', 63);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('15-10-2034', 'dd-mm-yyyy'), 269, 'CPR Manikin', 61);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('21-01-2024', 'dd-mm-yyyy'), 270, 'First Aid Kit', 87);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('20-01-2043', 'dd-mm-yyyy'), 271, 'Thermometer', 98);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('20-05-2040', 'dd-mm-yyyy'), 272, 'Thermometer', 77);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('07-03-2025', 'dd-mm-yyyy'), 273, 'Oxygen Tank', 40);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('06-03-2038', 'dd-mm-yyyy'), 274, 'Glucose Meter', 71);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('19-04-2026', 'dd-mm-yyyy'), 275, 'Stethoscope', 49);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('19-10-2043', 'dd-mm-yyyy'), 276, 'Oxygen Tank', 92);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('05-10-2026', 'dd-mm-yyyy'), 277, 'Thermometer', 86);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('07-04-2025', 'dd-mm-yyyy'), 278, 'Face Mask', 75);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('17-04-2029', 'dd-mm-yyyy'), 279, 'Glucose Meter', 78);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('20-01-2043', 'dd-mm-yyyy'), 280, 'Stethoscope', 68);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('04-09-2025', 'dd-mm-yyyy'), 281, 'Face Mask', 88);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('02-01-2026', 'dd-mm-yyyy'), 282, 'Thermometer', 67);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('08-09-2041', 'dd-mm-yyyy'), 283, 'CPR Manikin', 74);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('06-08-2036', 'dd-mm-yyyy'), 284, 'Surgical Gloves', 88);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('26-08-2026', 'dd-mm-yyyy'), 285, 'Surgical Gloves', 69);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('14-04-2029', 'dd-mm-yyyy'), 286, 'Defibrillator', 90);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('22-01-2028', 'dd-mm-yyyy'), 287, 'Face Mask', 73);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('10-11-2025', 'dd-mm-yyyy'), 288, 'Blood Pressure Monitor', 71);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('13-06-2043', 'dd-mm-yyyy'), 289, 'Oxygen Tank', 77);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('26-01-2039', 'dd-mm-yyyy'), 290, 'First Aid Kit', 42);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('21-05-2032', 'dd-mm-yyyy'), 291, 'Glucose Meter', 62);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('22-04-2026', 'dd-mm-yyyy'), 292, 'Blood Pressure Monitor', 49);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('01-03-2032', 'dd-mm-yyyy'), 293, 'Oxygen Tank', 46);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('18-04-2035', 'dd-mm-yyyy'), 294, 'Blood Pressure Monitor', 80);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('24-01-2033', 'dd-mm-yyyy'), 295, 'Surgical Gloves', 92);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('03-07-2029', 'dd-mm-yyyy'), 296, 'Thermometer', 53);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('04-12-2043', 'dd-mm-yyyy'), 297, 'Oxygen Tank', 40);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('27-01-2039', 'dd-mm-yyyy'), 298, 'Stethoscope', 82);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('03-06-2037', 'dd-mm-yyyy'), 299, 'Oxygen Tank', 49);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('13-01-2029', 'dd-mm-yyyy'), 300, 'Thermometer', 55);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('14-07-2038', 'dd-mm-yyyy'), 301, 'CPR Manikin', 84);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('14-07-2037', 'dd-mm-yyyy'), 302, 'Blood Pressure Monitor', 52);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('14-11-2029', 'dd-mm-yyyy'), 303, 'Surgical Gloves', 44);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('01-02-2028', 'dd-mm-yyyy'), 304, 'Face Mask', 95);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('19-08-2025', 'dd-mm-yyyy'), 305, 'Defibrillator', 72);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('03-08-2028', 'dd-mm-yyyy'), 306, 'Surgical Gloves', 98);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('01-10-2032', 'dd-mm-yyyy'), 307, 'Surgical Gloves', 55);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('29-06-2031', 'dd-mm-yyyy'), 308, 'Defibrillator', 83);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('19-12-2024', 'dd-mm-yyyy'), 309, 'CPR Manikin', 43);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('23-12-2030', 'dd-mm-yyyy'), 310, 'Surgical Gloves', 74);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('17-11-2043', 'dd-mm-yyyy'), 311, 'Surgical Gloves', 51);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('29-01-2030', 'dd-mm-yyyy'), 312, 'CPR Manikin', 40);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('07-04-2042', 'dd-mm-yyyy'), 313, 'Surgical Gloves', 57);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('05-11-2029', 'dd-mm-yyyy'), 314, 'Face Mask', 46);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('29-11-2039', 'dd-mm-yyyy'), 315, 'CPR Manikin', 77);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('03-02-2030', 'dd-mm-yyyy'), 316, 'Defibrillator', 68);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('08-05-2042', 'dd-mm-yyyy'), 317, 'Surgical Gloves', 40);
commit;
prompt 100 records committed...
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('29-03-2033', 'dd-mm-yyyy'), 318, 'CPR Manikin', 60);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('02-08-2039', 'dd-mm-yyyy'), 319, 'Surgical Gloves', 80);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('20-07-2025', 'dd-mm-yyyy'), 320, 'Oxygen Tank', 43);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('01-01-2026', 'dd-mm-yyyy'), 321, 'Blood Pressure Monitor', 47);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('06-10-2039', 'dd-mm-yyyy'), 322, 'Blood Pressure Monitor', 95);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('15-11-2025', 'dd-mm-yyyy'), 323, 'Face Mask', 79);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('20-04-2036', 'dd-mm-yyyy'), 324, 'Blood Pressure Monitor', 61);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('06-03-2042', 'dd-mm-yyyy'), 325, 'Stethoscope', 95);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('29-09-2042', 'dd-mm-yyyy'), 326, 'Thermometer', 53);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('10-02-2031', 'dd-mm-yyyy'), 327, 'Thermometer', 79);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('23-08-2039', 'dd-mm-yyyy'), 328, 'Face Mask', 74);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('31-01-2032', 'dd-mm-yyyy'), 329, 'Blood Pressure Monitor', 61);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('28-03-2041', 'dd-mm-yyyy'), 330, 'First Aid Kit', 85);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('16-03-2034', 'dd-mm-yyyy'), 331, 'Defibrillator', 44);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('01-04-2028', 'dd-mm-yyyy'), 332, 'Face Mask', 81);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('04-10-2026', 'dd-mm-yyyy'), 333, 'Thermometer', 51);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('17-02-2033', 'dd-mm-yyyy'), 334, 'Glucose Meter', 44);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('08-12-2043', 'dd-mm-yyyy'), 335, 'First Aid Kit', 42);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('20-04-2032', 'dd-mm-yyyy'), 336, 'Surgical Gloves', 81);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('16-08-2024', 'dd-mm-yyyy'), 337, 'Thermometer', 100);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('14-09-2030', 'dd-mm-yyyy'), 338, 'Defibrillator', 100);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('08-06-2027', 'dd-mm-yyyy'), 339, 'Stethoscope', 99);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('25-07-2028', 'dd-mm-yyyy'), 340, 'Surgical Gloves', 72);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('29-08-2040', 'dd-mm-yyyy'), 341, 'Defibrillator', 86);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('07-12-2043', 'dd-mm-yyyy'), 342, 'Stethoscope', 53);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('01-12-2027', 'dd-mm-yyyy'), 343, 'Thermometer', 96);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('01-04-2024', 'dd-mm-yyyy'), 344, 'CPR Manikin', 78);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('10-09-2043', 'dd-mm-yyyy'), 345, 'Stethoscope', 79);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('20-11-2041', 'dd-mm-yyyy'), 346, 'CPR Manikin', 89);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('09-09-2040', 'dd-mm-yyyy'), 347, 'Oxygen Tank', 87);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('28-06-2028', 'dd-mm-yyyy'), 348, 'Defibrillator', 89);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('28-05-2043', 'dd-mm-yyyy'), 349, 'First Aid Kit', 91);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('22-06-2027', 'dd-mm-yyyy'), 350, 'Oxygen Tank', 48);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('19-07-2041', 'dd-mm-yyyy'), 351, 'Oxygen Tank', 86);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('19-03-2029', 'dd-mm-yyyy'), 352, 'Stethoscope', 41);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('14-08-2033', 'dd-mm-yyyy'), 353, 'CPR Manikin', 90);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('17-11-2025', 'dd-mm-yyyy'), 354, 'CPR Manikin', 49);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('31-07-2026', 'dd-mm-yyyy'), 355, 'Face Mask', 65);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('27-03-2038', 'dd-mm-yyyy'), 356, 'Glucose Meter', 60);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('28-05-2043', 'dd-mm-yyyy'), 357, 'Defibrillator', 63);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('15-01-2032', 'dd-mm-yyyy'), 358, 'Oxygen Tank', 60);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('19-06-2027', 'dd-mm-yyyy'), 359, 'Surgical Gloves', 89);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('25-05-2032', 'dd-mm-yyyy'), 360, 'Oxygen Tank', 98);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('30-07-2032', 'dd-mm-yyyy'), 361, 'CPR Manikin', 42);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('26-05-2027', 'dd-mm-yyyy'), 362, 'First Aid Kit', 52);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('30-04-2031', 'dd-mm-yyyy'), 363, 'Oxygen Tank', 67);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('24-07-2043', 'dd-mm-yyyy'), 364, 'Thermometer', 65);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('03-03-2033', 'dd-mm-yyyy'), 365, 'First Aid Kit', 46);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('21-04-2041', 'dd-mm-yyyy'), 366, 'CPR Manikin', 84);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('14-03-2039', 'dd-mm-yyyy'), 367, 'Blood Pressure Monitor', 74);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('21-03-2035', 'dd-mm-yyyy'), 368, 'Stethoscope', 95);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('28-05-2043', 'dd-mm-yyyy'), 369, 'Oxygen Tank', 52);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('08-05-2037', 'dd-mm-yyyy'), 370, 'Face Mask', 96);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('26-02-2042', 'dd-mm-yyyy'), 371, 'Surgical Gloves', 60);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('24-08-2028', 'dd-mm-yyyy'), 372, 'Blood Pressure Monitor', 76);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('01-10-2025', 'dd-mm-yyyy'), 373, 'CPR Manikin', 100);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('21-12-2029', 'dd-mm-yyyy'), 374, 'Thermometer', 47);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('13-03-2039', 'dd-mm-yyyy'), 375, 'Blood Pressure Monitor', 74);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('10-04-2026', 'dd-mm-yyyy'), 376, 'Defibrillator', 67);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('27-08-2025', 'dd-mm-yyyy'), 377, 'Glucose Meter', 85);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('09-08-2041', 'dd-mm-yyyy'), 378, 'Surgical Gloves', 48);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('30-11-2025', 'dd-mm-yyyy'), 379, 'Defibrillator', 92);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('12-03-2025', 'dd-mm-yyyy'), 380, 'Blood Pressure Monitor', 91);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('05-06-2032', 'dd-mm-yyyy'), 381, 'Thermometer', 69);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('17-09-2035', 'dd-mm-yyyy'), 382, 'Glucose Meter', 47);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('22-01-2028', 'dd-mm-yyyy'), 383, 'First Aid Kit', 83);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('28-07-2038', 'dd-mm-yyyy'), 384, 'Defibrillator', 89);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('11-12-2028', 'dd-mm-yyyy'), 385, 'Thermometer', 59);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('12-01-2026', 'dd-mm-yyyy'), 386, 'First Aid Kit', 88);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('21-12-2038', 'dd-mm-yyyy'), 387, 'CPR Manikin', 70);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('08-10-2027', 'dd-mm-yyyy'), 388, 'Face Mask', 96);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('29-08-2041', 'dd-mm-yyyy'), 389, 'First Aid Kit', 44);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('21-04-2027', 'dd-mm-yyyy'), 390, 'Face Mask', 65);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('25-01-2025', 'dd-mm-yyyy'), 391, 'Oxygen Tank', 56);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('03-01-2033', 'dd-mm-yyyy'), 392, 'CPR Manikin', 51);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('06-07-2027', 'dd-mm-yyyy'), 393, 'Stethoscope', 100);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('22-10-2037', 'dd-mm-yyyy'), 394, 'Stethoscope', 78);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('01-05-2028', 'dd-mm-yyyy'), 395, 'Surgical Gloves', 98);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('26-05-2035', 'dd-mm-yyyy'), 396, 'CPR Manikin', 54);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('15-04-2039', 'dd-mm-yyyy'), 397, 'CPR Manikin', 78);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('23-01-2029', 'dd-mm-yyyy'), 398, 'Surgical Gloves', 51);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('08-12-2039', 'dd-mm-yyyy'), 399, 'Surgical Gloves', 55);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('03-02-2028', 'dd-mm-yyyy'), 400, 'Blood Pressure Monitor', 95);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('27-06-2030', 'dd-mm-yyyy'), 34, 'Blood Pressure Monitor', 84);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('14-09-2041', 'dd-mm-yyyy'), 35, 'Glucose Meter', 60);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('09-09-2036', 'dd-mm-yyyy'), 36, 'Glucose Meter', 73);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('22-05-2036', 'dd-mm-yyyy'), 37, 'First Aid Kit', 45);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('15-11-2032', 'dd-mm-yyyy'), 38, 'First Aid Kit', 85);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('19-11-2037', 'dd-mm-yyyy'), 39, 'First Aid Kit', 91);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('02-11-2024', 'dd-mm-yyyy'), 40, 'Surgical Gloves', 76);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('07-08-2038', 'dd-mm-yyyy'), 41, 'Face Mask', 63);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('07-05-2030', 'dd-mm-yyyy'), 42, 'Oxygen Tank', 82);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('28-03-2043', 'dd-mm-yyyy'), 43, 'Blood Pressure Monitor', 85);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('03-08-2043', 'dd-mm-yyyy'), 44, 'Thermometer', 58);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('17-08-2043', 'dd-mm-yyyy'), 45, 'CPR Manikin', 95);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('07-04-2029', 'dd-mm-yyyy'), 46, 'Surgical Gloves', 49);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('08-05-2031', 'dd-mm-yyyy'), 47, 'Oxygen Tank', 90);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('22-12-2027', 'dd-mm-yyyy'), 48, 'Blood Pressure Monitor', 79);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('10-06-2027', 'dd-mm-yyyy'), 49, 'First Aid Kit', 61);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('14-12-2042', 'dd-mm-yyyy'), 50, 'First Aid Kit', 81);
commit;
prompt 200 records committed...
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('21-03-2035', 'dd-mm-yyyy'), 51, 'Thermometer', 73);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('26-03-2040', 'dd-mm-yyyy'), 52, 'First Aid Kit', 61);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('19-06-2029', 'dd-mm-yyyy'), 53, 'Oxygen Tank', 68);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('20-06-2035', 'dd-mm-yyyy'), 54, 'Surgical Gloves', 41);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('20-07-2043', 'dd-mm-yyyy'), 55, 'First Aid Kit', 71);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('17-11-2037', 'dd-mm-yyyy'), 56, 'Oxygen Tank', 80);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('23-03-2037', 'dd-mm-yyyy'), 57, 'Glucose Meter', 98);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('15-12-2040', 'dd-mm-yyyy'), 58, 'Blood Pressure Monitor', 41);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('20-11-2042', 'dd-mm-yyyy'), 59, 'Face Mask', 59);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('27-11-2026', 'dd-mm-yyyy'), 60, 'First Aid Kit', 64);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('10-03-2028', 'dd-mm-yyyy'), 61, 'Glucose Meter', 98);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('21-11-2033', 'dd-mm-yyyy'), 62, 'Stethoscope', 97);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('29-07-2039', 'dd-mm-yyyy'), 63, 'Thermometer', 45);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('11-11-2037', 'dd-mm-yyyy'), 64, 'Blood Pressure Monitor', 85);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('29-05-2035', 'dd-mm-yyyy'), 65, 'Face Mask', 49);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('18-06-2030', 'dd-mm-yyyy'), 66, 'Oxygen Tank', 97);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('05-09-2040', 'dd-mm-yyyy'), 67, 'Glucose Meter', 87);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('10-09-2027', 'dd-mm-yyyy'), 68, 'First Aid Kit', 46);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('12-06-2028', 'dd-mm-yyyy'), 69, 'Surgical Gloves', 47);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('09-07-2026', 'dd-mm-yyyy'), 70, 'Defibrillator', 42);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('16-11-2037', 'dd-mm-yyyy'), 71, 'Face Mask', 46);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('23-01-2035', 'dd-mm-yyyy'), 72, 'Stethoscope', 96);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('01-04-2026', 'dd-mm-yyyy'), 73, 'CPR Manikin', 110);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('20-04-2042', 'dd-mm-yyyy'), 74, 'Stethoscope', 83);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('19-05-2043', 'dd-mm-yyyy'), 75, 'Surgical Gloves', 80);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('30-01-2042', 'dd-mm-yyyy'), 76, 'First Aid Kit', 68);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('10-06-2043', 'dd-mm-yyyy'), 77, 'Thermometer', 41);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('19-04-2029', 'dd-mm-yyyy'), 78, 'Stethoscope', 43);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('08-01-2032', 'dd-mm-yyyy'), 79, 'Blood Pressure Monitor', 77);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('28-02-2040', 'dd-mm-yyyy'), 80, 'Blood Pressure Monitor', 84);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('22-08-2036', 'dd-mm-yyyy'), 81, 'Defibrillator', 70);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('29-07-2039', 'dd-mm-yyyy'), 82, 'Face Mask', 45);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('20-06-2028', 'dd-mm-yyyy'), 83, 'Defibrillator', 87);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('30-10-2042', 'dd-mm-yyyy'), 84, 'First Aid Kit', 50);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('22-05-2042', 'dd-mm-yyyy'), 85, 'Stethoscope', 77);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('23-10-2042', 'dd-mm-yyyy'), 86, 'Stethoscope', 80);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('14-09-2043', 'dd-mm-yyyy'), 87, 'Face Mask', 67);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('17-05-2033', 'dd-mm-yyyy'), 88, 'Oxygen Tank', 88);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('05-03-2043', 'dd-mm-yyyy'), 89, 'Glucose Meter', 64);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('12-06-2041', 'dd-mm-yyyy'), 90, 'CPR Manikin', 40);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('14-10-2029', 'dd-mm-yyyy'), 91, 'Surgical Gloves', 96);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('17-01-2040', 'dd-mm-yyyy'), 92, 'Face Mask', 88);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('17-03-2043', 'dd-mm-yyyy'), 93, 'Oxygen Tank', 65);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('09-03-2039', 'dd-mm-yyyy'), 94, 'Face Mask', 42);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('01-01-2027', 'dd-mm-yyyy'), 95, 'Blood Pressure Monitor', 74);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('03-09-2036', 'dd-mm-yyyy'), 96, 'Surgical Gloves', 40);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('13-06-2040', 'dd-mm-yyyy'), 97, 'Stethoscope', 75);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('09-03-2043', 'dd-mm-yyyy'), 98, 'Defibrillator', 81);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('29-05-2042', 'dd-mm-yyyy'), 99, 'Thermometer', 46);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('19-07-2031', 'dd-mm-yyyy'), 100, 'Oxygen Tank', 76);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('18-06-2026', 'dd-mm-yyyy'), 101, 'Surgical Gloves', 55);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('09-04-2025', 'dd-mm-yyyy'), 102, 'Defibrillator', 98);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('21-11-2043', 'dd-mm-yyyy'), 103, 'Oxygen Tank', 63);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('04-04-2032', 'dd-mm-yyyy'), 104, 'Defibrillator', 83);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('02-09-2030', 'dd-mm-yyyy'), 105, 'Face Mask', 72);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('11-06-2032', 'dd-mm-yyyy'), 106, 'Glucose Meter', 93);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('05-10-2038', 'dd-mm-yyyy'), 107, 'Glucose Meter', 80);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('20-06-2039', 'dd-mm-yyyy'), 108, 'Stethoscope', 64);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('25-07-2030', 'dd-mm-yyyy'), 109, 'Surgical Gloves', 40);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('14-01-2042', 'dd-mm-yyyy'), 110, 'Face Mask', 95);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('25-12-2030', 'dd-mm-yyyy'), 111, 'Glucose Meter', 58);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('12-04-2027', 'dd-mm-yyyy'), 112, 'Face Mask', 74);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('09-06-2034', 'dd-mm-yyyy'), 113, 'Oxygen Tank', 64);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('20-10-2041', 'dd-mm-yyyy'), 114, 'Defibrillator', 84);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('13-01-2036', 'dd-mm-yyyy'), 115, 'Defibrillator', 69);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('08-02-2033', 'dd-mm-yyyy'), 116, 'Thermometer', 45);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('15-03-2028', 'dd-mm-yyyy'), 117, 'Glucose Meter', 52);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('01-04-2040', 'dd-mm-yyyy'), 118, 'Stethoscope', 87);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('24-07-2037', 'dd-mm-yyyy'), 119, 'Blood Pressure Monitor', 47);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('30-10-2024', 'dd-mm-yyyy'), 120, 'Thermometer', 56);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('03-11-2042', 'dd-mm-yyyy'), 121, 'Stethoscope', 43);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('23-07-2037', 'dd-mm-yyyy'), 122, 'Glucose Meter', 74);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('15-10-2034', 'dd-mm-yyyy'), 123, 'Defibrillator', 58);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('12-01-2038', 'dd-mm-yyyy'), 124, 'Defibrillator', 42);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('24-01-2024', 'dd-mm-yyyy'), 125, 'Thermometer', 41);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('16-05-2032', 'dd-mm-yyyy'), 126, 'Glucose Meter', 83);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('25-10-2034', 'dd-mm-yyyy'), 127, 'Face Mask', 82);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('28-02-2041', 'dd-mm-yyyy'), 128, 'Stethoscope', 44);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('06-10-2030', 'dd-mm-yyyy'), 129, 'Face Mask', 97);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('08-10-2024', 'dd-mm-yyyy'), 130, 'Thermometer', 60);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('04-11-2028', 'dd-mm-yyyy'), 131, 'First Aid Kit', 43);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('03-06-2031', 'dd-mm-yyyy'), 132, 'Stethoscope', 53);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('03-10-2033', 'dd-mm-yyyy'), 133, 'Glucose Meter', 95);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('01-10-2040', 'dd-mm-yyyy'), 134, 'CPR Manikin', 57);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('13-05-2036', 'dd-mm-yyyy'), 135, 'Thermometer', 70);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('28-02-2029', 'dd-mm-yyyy'), 136, 'Face Mask', 50);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('18-06-2031', 'dd-mm-yyyy'), 137, 'CPR Manikin', 53);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('15-07-2028', 'dd-mm-yyyy'), 138, 'Thermometer', 49);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('06-06-2026', 'dd-mm-yyyy'), 139, 'Blood Pressure Monitor', 58);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('03-09-2043', 'dd-mm-yyyy'), 140, 'Defibrillator', 57);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('04-01-2024', 'dd-mm-yyyy'), 141, 'Defibrillator', 92);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('31-12-2041', 'dd-mm-yyyy'), 142, 'CPR Manikin', 46);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('02-01-2030', 'dd-mm-yyyy'), 143, 'Blood Pressure Monitor', 63);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('31-01-2028', 'dd-mm-yyyy'), 144, 'Stethoscope', 91);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('19-05-2032', 'dd-mm-yyyy'), 145, 'Thermometer', 85);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('16-07-2031', 'dd-mm-yyyy'), 146, 'Surgical Gloves', 53);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('16-07-2042', 'dd-mm-yyyy'), 147, 'Glucose Meter', 83);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('06-04-2026', 'dd-mm-yyyy'), 148, 'Face Mask', 61);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('16-02-2034', 'dd-mm-yyyy'), 149, 'CPR Manikin', 52);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('10-09-2027', 'dd-mm-yyyy'), 150, 'Oxygen Tank', 72);
commit;
prompt 300 records committed...
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('20-09-2040', 'dd-mm-yyyy'), 151, 'Surgical Gloves', 58);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('07-07-2039', 'dd-mm-yyyy'), 152, 'First Aid Kit', 65);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('26-03-2032', 'dd-mm-yyyy'), 153, 'Face Mask', 51);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('02-11-2027', 'dd-mm-yyyy'), 154, 'Face Mask', 46);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('02-08-2042', 'dd-mm-yyyy'), 155, 'CPR Manikin', 75);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('30-10-2025', 'dd-mm-yyyy'), 156, 'CPR Manikin', 76);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('06-09-2038', 'dd-mm-yyyy'), 157, 'First Aid Kit', 96);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('03-04-2041', 'dd-mm-yyyy'), 158, 'Face Mask', 96);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('11-12-2024', 'dd-mm-yyyy'), 159, 'Stethoscope', 49);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('11-08-2029', 'dd-mm-yyyy'), 160, 'Oxygen Tank', 42);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('22-04-2039', 'dd-mm-yyyy'), 161, 'First Aid Kit', 42);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('24-11-2032', 'dd-mm-yyyy'), 162, 'First Aid Kit', 56);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('10-04-2037', 'dd-mm-yyyy'), 163, 'Glucose Meter', 66);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('18-07-2024', 'dd-mm-yyyy'), 164, 'Glucose Meter', 86);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('13-06-2031', 'dd-mm-yyyy'), 165, 'Stethoscope', 84);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('23-02-2031', 'dd-mm-yyyy'), 166, 'First Aid Kit', 41);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('24-01-2036', 'dd-mm-yyyy'), 167, 'Glucose Meter', 78);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('30-07-2037', 'dd-mm-yyyy'), 168, 'Face Mask', 57);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('14-01-2031', 'dd-mm-yyyy'), 169, 'CPR Manikin', 91);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('23-11-2029', 'dd-mm-yyyy'), 170, 'Surgical Gloves', 95);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('25-09-2028', 'dd-mm-yyyy'), 171, 'Stethoscope', 86);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('12-09-2026', 'dd-mm-yyyy'), 172, 'Thermometer', 62);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('10-08-2030', 'dd-mm-yyyy'), 173, 'CPR Manikin', 64);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('06-04-2040', 'dd-mm-yyyy'), 174, 'Defibrillator', 85);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('04-03-2041', 'dd-mm-yyyy'), 175, 'CPR Manikin', 52);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('21-05-2030', 'dd-mm-yyyy'), 176, 'Stethoscope', 75);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('04-11-2034', 'dd-mm-yyyy'), 177, 'Blood Pressure Monitor', 55);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('29-03-2032', 'dd-mm-yyyy'), 178, 'Blood Pressure Monitor', 48);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('30-11-2027', 'dd-mm-yyyy'), 179, 'Defibrillator', 77);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('22-07-2031', 'dd-mm-yyyy'), 180, 'Blood Pressure Monitor', 85);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('13-03-2025', 'dd-mm-yyyy'), 181, 'Face Mask', 95);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('09-08-2031', 'dd-mm-yyyy'), 182, 'Surgical Gloves', 55);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('04-02-2029', 'dd-mm-yyyy'), 183, 'Surgical Gloves', 47);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('02-10-2043', 'dd-mm-yyyy'), 184, 'Surgical Gloves', 64);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('05-03-2030', 'dd-mm-yyyy'), 185, 'Blood Pressure Monitor', 75);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('17-05-2042', 'dd-mm-yyyy'), 186, 'Oxygen Tank', 71);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('12-03-2043', 'dd-mm-yyyy'), 187, 'Blood Pressure Monitor', 71);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('19-06-2032', 'dd-mm-yyyy'), 188, 'Glucose Meter', 40);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('18-10-2042', 'dd-mm-yyyy'), 189, 'First Aid Kit', 44);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('09-03-2030', 'dd-mm-yyyy'), 190, 'Surgical Gloves', 64);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('16-08-2029', 'dd-mm-yyyy'), 191, 'Glucose Meter', 69);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('13-05-2029', 'dd-mm-yyyy'), 192, 'Stethoscope', 60);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('08-11-2031', 'dd-mm-yyyy'), 193, 'Surgical Gloves', 100);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('22-10-2026', 'dd-mm-yyyy'), 194, 'CPR Manikin', 127);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('13-04-2040', 'dd-mm-yyyy'), 195, 'CPR Manikin', 56);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('18-03-2042', 'dd-mm-yyyy'), 196, 'Thermometer', 76);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('24-06-2038', 'dd-mm-yyyy'), 197, 'Blood Pressure Monitor', 79);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('17-03-2041', 'dd-mm-yyyy'), 198, 'Glucose Meter', 60);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('17-01-2024', 'dd-mm-yyyy'), 199, 'CPR Manikin', 61);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('13-05-2028', 'dd-mm-yyyy'), 200, 'Defibrillator', 93);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('17-08-2034', 'dd-mm-yyyy'), 201, 'First Aid Kit', 50);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('28-05-2027', 'dd-mm-yyyy'), 202, 'CPR Manikin', 40);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('08-05-2033', 'dd-mm-yyyy'), 203, 'Glucose Meter', 93);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('04-08-2024', 'dd-mm-yyyy'), 204, 'Stethoscope', 99);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('31-12-2024', 'dd-mm-yyyy'), 205, 'Blood Pressure Monitor', 49);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('19-06-2024', 'dd-mm-yyyy'), 206, 'Face Mask', 77);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('18-11-2026', 'dd-mm-yyyy'), 207, 'Thermometer', 40);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('25-01-2031', 'dd-mm-yyyy'), 208, 'Glucose Meter', 46);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('31-12-2038', 'dd-mm-yyyy'), 209, 'Thermometer', 78);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('06-12-2028', 'dd-mm-yyyy'), 210, 'Face Mask', 41);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('29-05-2027', 'dd-mm-yyyy'), 211, 'Defibrillator', 69);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('22-04-2032', 'dd-mm-yyyy'), 212, 'Oxygen Tank', 84);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('02-04-2024', 'dd-mm-yyyy'), 213, 'Face Mask', 63);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('05-01-2025', 'dd-mm-yyyy'), 214, 'Thermometer', 69);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('15-01-2041', 'dd-mm-yyyy'), 1, 'Defibrillator', 85);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('14-09-2028', 'dd-mm-yyyy'), 2, 'Glucose Meter', 77);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('27-10-2038', 'dd-mm-yyyy'), 3, 'Oxygen Tank', 54);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('10-06-2029', 'dd-mm-yyyy'), 4, 'Thermometer', 57);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('17-10-2024', 'dd-mm-yyyy'), 5, 'Oxygen Tank', 43);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('10-04-2039', 'dd-mm-yyyy'), 6, 'Blood Pressure Monitor', 72);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('16-10-2043', 'dd-mm-yyyy'), 7, 'Defibrillator', 51);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('30-11-2027', 'dd-mm-yyyy'), 8, 'CPR Manikin', 66);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('05-12-2030', 'dd-mm-yyyy'), 9, 'Stethoscope', 96);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('23-05-2040', 'dd-mm-yyyy'), 10, 'Defibrillator', 59);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('09-08-2026', 'dd-mm-yyyy'), 11, 'Thermometer', 100);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('11-02-2040', 'dd-mm-yyyy'), 12, 'Blood Pressure Monitor', 96);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('30-11-2039', 'dd-mm-yyyy'), 13, 'First Aid Kit', 64);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('29-12-2043', 'dd-mm-yyyy'), 14, 'First Aid Kit', 71);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('06-07-2037', 'dd-mm-yyyy'), 15, 'First Aid Kit', 64);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('12-01-2041', 'dd-mm-yyyy'), 16, 'Thermometer', 96);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('02-02-2028', 'dd-mm-yyyy'), 17, 'First Aid Kit', 57);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('10-08-2031', 'dd-mm-yyyy'), 18, 'Glucose Meter', 91);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('22-12-2026', 'dd-mm-yyyy'), 19, 'Defibrillator', 95);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('06-03-2024', 'dd-mm-yyyy'), 20, 'Surgical Gloves', 96);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('11-01-2040', 'dd-mm-yyyy'), 21, 'Defibrillator', 67);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('16-11-2024', 'dd-mm-yyyy'), 22, 'Glucose Meter', 99);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('25-10-2041', 'dd-mm-yyyy'), 23, 'Thermometer', 99);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('19-02-2030', 'dd-mm-yyyy'), 24, 'Oxygen Tank', 61);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('19-10-2031', 'dd-mm-yyyy'), 25, 'First Aid Kit', 40);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('12-02-2029', 'dd-mm-yyyy'), 26, 'First Aid Kit', 78);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('11-09-2034', 'dd-mm-yyyy'), 27, 'Glucose Meter', 40);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('17-09-2037', 'dd-mm-yyyy'), 28, 'Glucose Meter', 70);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('25-11-2038', 'dd-mm-yyyy'), 29, 'Glucose Meter', 56);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('05-04-2025', 'dd-mm-yyyy'), 30, 'Blood Pressure Monitor', 46);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('02-12-2040', 'dd-mm-yyyy'), 31, 'Face Mask', 71);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('04-07-2035', 'dd-mm-yyyy'), 32, 'CPR Manikin', 71);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('26-06-2035', 'dd-mm-yyyy'), 33, 'Oxygen Tank', 40);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('27-11-2038', 'dd-mm-yyyy'), 215, 'Oxygen Tank', 46);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('10-12-2042', 'dd-mm-yyyy'), 216, 'Stethoscope', 53);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('18-04-2038', 'dd-mm-yyyy'), 217, 'Thermometer', 71);
commit;
prompt 400 records loaded
prompt Loading HAS...
insert into HAS (ambulance_id, e_id)
values (1, 220);
insert into HAS (ambulance_id, e_id)
values (2, 220);
insert into HAS (ambulance_id, e_id)
values (3, 220);
insert into HAS (ambulance_id, e_id)
values (4, 220);
insert into HAS (ambulance_id, e_id)
values (5, 220);
insert into HAS (ambulance_id, e_id)
values (6, 220);
insert into HAS (ambulance_id, e_id)
values (7, 220);
insert into HAS (ambulance_id, e_id)
values (8, 220);
insert into HAS (ambulance_id, e_id)
values (9, 220);
insert into HAS (ambulance_id, e_id)
values (10, 220);
insert into HAS (ambulance_id, e_id)
values (11111, 220);
insert into HAS (ambulance_id, e_id)
values (11112, 220);
insert into HAS (ambulance_id, e_id)
values (11113, 220);
insert into HAS (ambulance_id, e_id)
values (11114, 220);
insert into HAS (ambulance_id, e_id)
values (11115, 220);
insert into HAS (ambulance_id, e_id)
values (11116, 220);
insert into HAS (ambulance_id, e_id)
values (11117, 220);
insert into HAS (ambulance_id, e_id)
values (11118, 220);
insert into HAS (ambulance_id, e_id)
values (11119, 220);
insert into HAS (ambulance_id, e_id)
values (11120, 220);
insert into HAS (ambulance_id, e_id)
values (11121, 220);
insert into HAS (ambulance_id, e_id)
values (11122, 220);
insert into HAS (ambulance_id, e_id)
values (11123, 220);
insert into HAS (ambulance_id, e_id)
values (11124, 220);
insert into HAS (ambulance_id, e_id)
values (11125, 220);
insert into HAS (ambulance_id, e_id)
values (11126, 220);
insert into HAS (ambulance_id, e_id)
values (11127, 220);
insert into HAS (ambulance_id, e_id)
values (11128, 220);
insert into HAS (ambulance_id, e_id)
values (11129, 220);
insert into HAS (ambulance_id, e_id)
values (11130, 220);
insert into HAS (ambulance_id, e_id)
values (11131, 220);
insert into HAS (ambulance_id, e_id)
values (11132, 220);
insert into HAS (ambulance_id, e_id)
values (11133, 220);
insert into HAS (ambulance_id, e_id)
values (11134, 220);
insert into HAS (ambulance_id, e_id)
values (11135, 220);
insert into HAS (ambulance_id, e_id)
values (11136, 220);
insert into HAS (ambulance_id, e_id)
values (11137, 220);
insert into HAS (ambulance_id, e_id)
values (11138, 220);
insert into HAS (ambulance_id, e_id)
values (11139, 220);
insert into HAS (ambulance_id, e_id)
values (11140, 220);
insert into HAS (ambulance_id, e_id)
values (11141, 220);
insert into HAS (ambulance_id, e_id)
values (11142, 220);
insert into HAS (ambulance_id, e_id)
values (11143, 220);
insert into HAS (ambulance_id, e_id)
values (11144, 220);
insert into HAS (ambulance_id, e_id)
values (11145, 220);
insert into HAS (ambulance_id, e_id)
values (11146, 220);
insert into HAS (ambulance_id, e_id)
values (11147, 220);
insert into HAS (ambulance_id, e_id)
values (11148, 220);
insert into HAS (ambulance_id, e_id)
values (11149, 220);
insert into HAS (ambulance_id, e_id)
values (11150, 220);
insert into HAS (ambulance_id, e_id)
values (11151, 220);
insert into HAS (ambulance_id, e_id)
values (11152, 220);
insert into HAS (ambulance_id, e_id)
values (11153, 220);
insert into HAS (ambulance_id, e_id)
values (11154, 220);
insert into HAS (ambulance_id, e_id)
values (11155, 220);
insert into HAS (ambulance_id, e_id)
values (11156, 220);
insert into HAS (ambulance_id, e_id)
values (11157, 220);
insert into HAS (ambulance_id, e_id)
values (11158, 220);
insert into HAS (ambulance_id, e_id)
values (11159, 220);
insert into HAS (ambulance_id, e_id)
values (11160, 220);
insert into HAS (ambulance_id, e_id)
values (11161, 220);
insert into HAS (ambulance_id, e_id)
values (11162, 220);
insert into HAS (ambulance_id, e_id)
values (11163, 220);
insert into HAS (ambulance_id, e_id)
values (11164, 220);
insert into HAS (ambulance_id, e_id)
values (11165, 220);
insert into HAS (ambulance_id, e_id)
values (11166, 220);
insert into HAS (ambulance_id, e_id)
values (11167, 220);
insert into HAS (ambulance_id, e_id)
values (11168, 220);
insert into HAS (ambulance_id, e_id)
values (11169, 220);
insert into HAS (ambulance_id, e_id)
values (11170, 220);
insert into HAS (ambulance_id, e_id)
values (11171, 220);
insert into HAS (ambulance_id, e_id)
values (11172, 220);
insert into HAS (ambulance_id, e_id)
values (11173, 220);
insert into HAS (ambulance_id, e_id)
values (11174, 220);
insert into HAS (ambulance_id, e_id)
values (11175, 220);
insert into HAS (ambulance_id, e_id)
values (11176, 220);
insert into HAS (ambulance_id, e_id)
values (11177, 220);
insert into HAS (ambulance_id, e_id)
values (11178, 220);
insert into HAS (ambulance_id, e_id)
values (11179, 220);
insert into HAS (ambulance_id, e_id)
values (11180, 220);
insert into HAS (ambulance_id, e_id)
values (11181, 220);
insert into HAS (ambulance_id, e_id)
values (11182, 220);
insert into HAS (ambulance_id, e_id)
values (11183, 220);
insert into HAS (ambulance_id, e_id)
values (11184, 220);
insert into HAS (ambulance_id, e_id)
values (11185, 220);
insert into HAS (ambulance_id, e_id)
values (11186, 220);
insert into HAS (ambulance_id, e_id)
values (11187, 220);
insert into HAS (ambulance_id, e_id)
values (11188, 220);
insert into HAS (ambulance_id, e_id)
values (11189, 220);
insert into HAS (ambulance_id, e_id)
values (11190, 220);
insert into HAS (ambulance_id, e_id)
values (11191, 220);
insert into HAS (ambulance_id, e_id)
values (11192, 220);
insert into HAS (ambulance_id, e_id)
values (11193, 220);
insert into HAS (ambulance_id, e_id)
values (11194, 220);
insert into HAS (ambulance_id, e_id)
values (11195, 220);
insert into HAS (ambulance_id, e_id)
values (11196, 220);
insert into HAS (ambulance_id, e_id)
values (11197, 220);
insert into HAS (ambulance_id, e_id)
values (11198, 220);
insert into HAS (ambulance_id, e_id)
values (11199, 220);
insert into HAS (ambulance_id, e_id)
values (11200, 220);
commit;
prompt 100 records committed...
insert into HAS (ambulance_id, e_id)
values (11201, 220);
insert into HAS (ambulance_id, e_id)
values (11202, 220);
insert into HAS (ambulance_id, e_id)
values (11203, 220);
insert into HAS (ambulance_id, e_id)
values (11204, 220);
insert into HAS (ambulance_id, e_id)
values (11205, 220);
insert into HAS (ambulance_id, e_id)
values (11206, 220);
insert into HAS (ambulance_id, e_id)
values (11207, 220);
insert into HAS (ambulance_id, e_id)
values (11208, 220);
insert into HAS (ambulance_id, e_id)
values (11209, 220);
insert into HAS (ambulance_id, e_id)
values (11210, 220);
insert into HAS (ambulance_id, e_id)
values (11211, 220);
insert into HAS (ambulance_id, e_id)
values (11212, 220);
insert into HAS (ambulance_id, e_id)
values (11213, 220);
insert into HAS (ambulance_id, e_id)
values (11214, 220);
insert into HAS (ambulance_id, e_id)
values (11215, 220);
insert into HAS (ambulance_id, e_id)
values (11216, 220);
insert into HAS (ambulance_id, e_id)
values (11217, 220);
insert into HAS (ambulance_id, e_id)
values (11218, 220);
insert into HAS (ambulance_id, e_id)
values (11219, 220);
insert into HAS (ambulance_id, e_id)
values (11220, 220);
insert into HAS (ambulance_id, e_id)
values (11221, 220);
insert into HAS (ambulance_id, e_id)
values (11222, 220);
insert into HAS (ambulance_id, e_id)
values (11223, 220);
insert into HAS (ambulance_id, e_id)
values (11224, 220);
insert into HAS (ambulance_id, e_id)
values (11225, 220);
insert into HAS (ambulance_id, e_id)
values (11226, 220);
insert into HAS (ambulance_id, e_id)
values (11227, 220);
insert into HAS (ambulance_id, e_id)
values (11228, 220);
insert into HAS (ambulance_id, e_id)
values (11229, 220);
insert into HAS (ambulance_id, e_id)
values (11230, 220);
insert into HAS (ambulance_id, e_id)
values (11231, 220);
insert into HAS (ambulance_id, e_id)
values (11232, 220);
insert into HAS (ambulance_id, e_id)
values (11233, 220);
insert into HAS (ambulance_id, e_id)
values (11234, 220);
insert into HAS (ambulance_id, e_id)
values (11235, 220);
insert into HAS (ambulance_id, e_id)
values (11236, 220);
insert into HAS (ambulance_id, e_id)
values (11237, 220);
insert into HAS (ambulance_id, e_id)
values (11238, 220);
insert into HAS (ambulance_id, e_id)
values (11239, 220);
insert into HAS (ambulance_id, e_id)
values (11240, 220);
insert into HAS (ambulance_id, e_id)
values (11241, 220);
insert into HAS (ambulance_id, e_id)
values (11242, 220);
insert into HAS (ambulance_id, e_id)
values (11243, 220);
insert into HAS (ambulance_id, e_id)
values (11244, 220);
insert into HAS (ambulance_id, e_id)
values (11245, 220);
insert into HAS (ambulance_id, e_id)
values (11246, 220);
insert into HAS (ambulance_id, e_id)
values (11247, 220);
insert into HAS (ambulance_id, e_id)
values (11248, 220);
insert into HAS (ambulance_id, e_id)
values (11249, 220);
insert into HAS (ambulance_id, e_id)
values (11250, 220);
insert into HAS (ambulance_id, e_id)
values (11251, 220);
insert into HAS (ambulance_id, e_id)
values (11252, 220);
insert into HAS (ambulance_id, e_id)
values (11253, 220);
insert into HAS (ambulance_id, e_id)
values (11254, 220);
insert into HAS (ambulance_id, e_id)
values (11255, 220);
insert into HAS (ambulance_id, e_id)
values (11256, 220);
insert into HAS (ambulance_id, e_id)
values (11257, 220);
insert into HAS (ambulance_id, e_id)
values (11258, 220);
insert into HAS (ambulance_id, e_id)
values (11259, 220);
insert into HAS (ambulance_id, e_id)
values (11260, 220);
insert into HAS (ambulance_id, e_id)
values (11261, 220);
insert into HAS (ambulance_id, e_id)
values (11262, 220);
insert into HAS (ambulance_id, e_id)
values (11263, 220);
insert into HAS (ambulance_id, e_id)
values (11264, 220);
insert into HAS (ambulance_id, e_id)
values (11265, 220);
insert into HAS (ambulance_id, e_id)
values (11266, 220);
insert into HAS (ambulance_id, e_id)
values (11267, 220);
insert into HAS (ambulance_id, e_id)
values (11268, 220);
insert into HAS (ambulance_id, e_id)
values (11269, 220);
insert into HAS (ambulance_id, e_id)
values (11270, 220);
insert into HAS (ambulance_id, e_id)
values (11271, 220);
insert into HAS (ambulance_id, e_id)
values (11272, 220);
insert into HAS (ambulance_id, e_id)
values (11273, 220);
insert into HAS (ambulance_id, e_id)
values (11274, 220);
insert into HAS (ambulance_id, e_id)
values (11275, 220);
insert into HAS (ambulance_id, e_id)
values (11276, 220);
insert into HAS (ambulance_id, e_id)
values (11277, 220);
insert into HAS (ambulance_id, e_id)
values (11278, 220);
insert into HAS (ambulance_id, e_id)
values (11279, 220);
insert into HAS (ambulance_id, e_id)
values (11280, 220);
insert into HAS (ambulance_id, e_id)
values (11281, 220);
insert into HAS (ambulance_id, e_id)
values (11282, 220);
insert into HAS (ambulance_id, e_id)
values (11283, 220);
insert into HAS (ambulance_id, e_id)
values (11284, 220);
insert into HAS (ambulance_id, e_id)
values (11285, 220);
insert into HAS (ambulance_id, e_id)
values (11286, 220);
insert into HAS (ambulance_id, e_id)
values (11287, 220);
insert into HAS (ambulance_id, e_id)
values (11288, 220);
insert into HAS (ambulance_id, e_id)
values (11289, 220);
insert into HAS (ambulance_id, e_id)
values (11290, 220);
insert into HAS (ambulance_id, e_id)
values (11291, 220);
insert into HAS (ambulance_id, e_id)
values (11292, 220);
insert into HAS (ambulance_id, e_id)
values (11293, 220);
insert into HAS (ambulance_id, e_id)
values (11294, 220);
insert into HAS (ambulance_id, e_id)
values (11295, 220);
insert into HAS (ambulance_id, e_id)
values (11296, 220);
insert into HAS (ambulance_id, e_id)
values (11297, 220);
insert into HAS (ambulance_id, e_id)
values (11298, 220);
insert into HAS (ambulance_id, e_id)
values (11299, 220);
insert into HAS (ambulance_id, e_id)
values (11300, 220);
commit;
prompt 200 records committed...
insert into HAS (ambulance_id, e_id)
values (11301, 220);
insert into HAS (ambulance_id, e_id)
values (11302, 220);
insert into HAS (ambulance_id, e_id)
values (11303, 220);
insert into HAS (ambulance_id, e_id)
values (11304, 220);
insert into HAS (ambulance_id, e_id)
values (11305, 220);
insert into HAS (ambulance_id, e_id)
values (11306, 220);
insert into HAS (ambulance_id, e_id)
values (11307, 220);
insert into HAS (ambulance_id, e_id)
values (11308, 220);
insert into HAS (ambulance_id, e_id)
values (11309, 220);
insert into HAS (ambulance_id, e_id)
values (11310, 220);
insert into HAS (ambulance_id, e_id)
values (11311, 220);
insert into HAS (ambulance_id, e_id)
values (11312, 220);
insert into HAS (ambulance_id, e_id)
values (11313, 220);
insert into HAS (ambulance_id, e_id)
values (11314, 220);
insert into HAS (ambulance_id, e_id)
values (11315, 220);
insert into HAS (ambulance_id, e_id)
values (11316, 220);
insert into HAS (ambulance_id, e_id)
values (11317, 220);
insert into HAS (ambulance_id, e_id)
values (11318, 220);
insert into HAS (ambulance_id, e_id)
values (11319, 220);
insert into HAS (ambulance_id, e_id)
values (11320, 220);
insert into HAS (ambulance_id, e_id)
values (11321, 220);
insert into HAS (ambulance_id, e_id)
values (11322, 220);
insert into HAS (ambulance_id, e_id)
values (11323, 220);
insert into HAS (ambulance_id, e_id)
values (11324, 220);
insert into HAS (ambulance_id, e_id)
values (11325, 220);
insert into HAS (ambulance_id, e_id)
values (11326, 220);
insert into HAS (ambulance_id, e_id)
values (11327, 220);
insert into HAS (ambulance_id, e_id)
values (11328, 220);
insert into HAS (ambulance_id, e_id)
values (11329, 220);
insert into HAS (ambulance_id, e_id)
values (11330, 220);
insert into HAS (ambulance_id, e_id)
values (11331, 220);
insert into HAS (ambulance_id, e_id)
values (11332, 220);
insert into HAS (ambulance_id, e_id)
values (11333, 220);
insert into HAS (ambulance_id, e_id)
values (11334, 220);
insert into HAS (ambulance_id, e_id)
values (11335, 220);
insert into HAS (ambulance_id, e_id)
values (11336, 220);
insert into HAS (ambulance_id, e_id)
values (11337, 220);
insert into HAS (ambulance_id, e_id)
values (11338, 220);
insert into HAS (ambulance_id, e_id)
values (11339, 220);
insert into HAS (ambulance_id, e_id)
values (11340, 220);
insert into HAS (ambulance_id, e_id)
values (11341, 220);
insert into HAS (ambulance_id, e_id)
values (11342, 220);
insert into HAS (ambulance_id, e_id)
values (11343, 220);
insert into HAS (ambulance_id, e_id)
values (11344, 220);
insert into HAS (ambulance_id, e_id)
values (11345, 220);
insert into HAS (ambulance_id, e_id)
values (11346, 220);
insert into HAS (ambulance_id, e_id)
values (11347, 220);
insert into HAS (ambulance_id, e_id)
values (11348, 220);
insert into HAS (ambulance_id, e_id)
values (11349, 220);
insert into HAS (ambulance_id, e_id)
values (11350, 220);
insert into HAS (ambulance_id, e_id)
values (11351, 220);
insert into HAS (ambulance_id, e_id)
values (11352, 220);
insert into HAS (ambulance_id, e_id)
values (11353, 220);
insert into HAS (ambulance_id, e_id)
values (11354, 220);
insert into HAS (ambulance_id, e_id)
values (11355, 220);
insert into HAS (ambulance_id, e_id)
values (11356, 220);
insert into HAS (ambulance_id, e_id)
values (11357, 220);
insert into HAS (ambulance_id, e_id)
values (11358, 220);
insert into HAS (ambulance_id, e_id)
values (11359, 220);
insert into HAS (ambulance_id, e_id)
values (11360, 220);
insert into HAS (ambulance_id, e_id)
values (11361, 220);
insert into HAS (ambulance_id, e_id)
values (11362, 220);
insert into HAS (ambulance_id, e_id)
values (11363, 220);
insert into HAS (ambulance_id, e_id)
values (11364, 220);
insert into HAS (ambulance_id, e_id)
values (11365, 220);
insert into HAS (ambulance_id, e_id)
values (11366, 220);
insert into HAS (ambulance_id, e_id)
values (11367, 220);
insert into HAS (ambulance_id, e_id)
values (11368, 220);
insert into HAS (ambulance_id, e_id)
values (11369, 220);
insert into HAS (ambulance_id, e_id)
values (11370, 220);
insert into HAS (ambulance_id, e_id)
values (11371, 220);
insert into HAS (ambulance_id, e_id)
values (11372, 220);
insert into HAS (ambulance_id, e_id)
values (11373, 220);
insert into HAS (ambulance_id, e_id)
values (11374, 220);
insert into HAS (ambulance_id, e_id)
values (11375, 220);
insert into HAS (ambulance_id, e_id)
values (11376, 220);
insert into HAS (ambulance_id, e_id)
values (11377, 220);
insert into HAS (ambulance_id, e_id)
values (11378, 220);
insert into HAS (ambulance_id, e_id)
values (11379, 220);
insert into HAS (ambulance_id, e_id)
values (11380, 220);
insert into HAS (ambulance_id, e_id)
values (11381, 220);
insert into HAS (ambulance_id, e_id)
values (11382, 220);
insert into HAS (ambulance_id, e_id)
values (11383, 220);
insert into HAS (ambulance_id, e_id)
values (11384, 220);
insert into HAS (ambulance_id, e_id)
values (11385, 220);
insert into HAS (ambulance_id, e_id)
values (11386, 220);
insert into HAS (ambulance_id, e_id)
values (11387, 220);
insert into HAS (ambulance_id, e_id)
values (11388, 220);
insert into HAS (ambulance_id, e_id)
values (11389, 220);
insert into HAS (ambulance_id, e_id)
values (11390, 220);
insert into HAS (ambulance_id, e_id)
values (11391, 220);
insert into HAS (ambulance_id, e_id)
values (11392, 220);
insert into HAS (ambulance_id, e_id)
values (11393, 220);
insert into HAS (ambulance_id, e_id)
values (11394, 220);
insert into HAS (ambulance_id, e_id)
values (11395, 220);
insert into HAS (ambulance_id, e_id)
values (11396, 220);
insert into HAS (ambulance_id, e_id)
values (11397, 220);
insert into HAS (ambulance_id, e_id)
values (11398, 220);
insert into HAS (ambulance_id, e_id)
values (11399, 220);
insert into HAS (ambulance_id, e_id)
values (11400, 220);
commit;
prompt 300 records committed...
insert into HAS (ambulance_id, e_id)
values (11401, 220);
insert into HAS (ambulance_id, e_id)
values (11402, 220);
insert into HAS (ambulance_id, e_id)
values (11403, 220);
insert into HAS (ambulance_id, e_id)
values (11404, 220);
insert into HAS (ambulance_id, e_id)
values (11405, 220);
insert into HAS (ambulance_id, e_id)
values (11406, 220);
insert into HAS (ambulance_id, e_id)
values (11407, 220);
insert into HAS (ambulance_id, e_id)
values (11408, 220);
insert into HAS (ambulance_id, e_id)
values (11409, 220);
insert into HAS (ambulance_id, e_id)
values (11410, 220);
insert into HAS (ambulance_id, e_id)
values (11411, 220);
insert into HAS (ambulance_id, e_id)
values (11412, 220);
insert into HAS (ambulance_id, e_id)
values (11413, 220);
insert into HAS (ambulance_id, e_id)
values (11414, 220);
insert into HAS (ambulance_id, e_id)
values (11415, 220);
insert into HAS (ambulance_id, e_id)
values (11416, 220);
insert into HAS (ambulance_id, e_id)
values (11417, 220);
insert into HAS (ambulance_id, e_id)
values (11418, 220);
insert into HAS (ambulance_id, e_id)
values (11419, 220);
insert into HAS (ambulance_id, e_id)
values (11420, 220);
insert into HAS (ambulance_id, e_id)
values (11421, 220);
insert into HAS (ambulance_id, e_id)
values (11422, 220);
insert into HAS (ambulance_id, e_id)
values (11423, 220);
insert into HAS (ambulance_id, e_id)
values (11424, 220);
insert into HAS (ambulance_id, e_id)
values (11425, 220);
insert into HAS (ambulance_id, e_id)
values (11426, 220);
insert into HAS (ambulance_id, e_id)
values (11427, 220);
insert into HAS (ambulance_id, e_id)
values (11428, 220);
insert into HAS (ambulance_id, e_id)
values (11429, 220);
insert into HAS (ambulance_id, e_id)
values (11430, 220);
insert into HAS (ambulance_id, e_id)
values (11431, 220);
insert into HAS (ambulance_id, e_id)
values (11432, 220);
insert into HAS (ambulance_id, e_id)
values (11433, 220);
insert into HAS (ambulance_id, e_id)
values (11434, 220);
insert into HAS (ambulance_id, e_id)
values (11435, 220);
insert into HAS (ambulance_id, e_id)
values (11436, 220);
insert into HAS (ambulance_id, e_id)
values (11437, 220);
insert into HAS (ambulance_id, e_id)
values (11438, 220);
insert into HAS (ambulance_id, e_id)
values (11439, 220);
insert into HAS (ambulance_id, e_id)
values (11440, 220);
insert into HAS (ambulance_id, e_id)
values (11441, 220);
insert into HAS (ambulance_id, e_id)
values (11442, 220);
insert into HAS (ambulance_id, e_id)
values (11443, 220);
insert into HAS (ambulance_id, e_id)
values (11444, 220);
insert into HAS (ambulance_id, e_id)
values (11445, 220);
insert into HAS (ambulance_id, e_id)
values (11446, 220);
insert into HAS (ambulance_id, e_id)
values (11447, 220);
insert into HAS (ambulance_id, e_id)
values (11448, 220);
insert into HAS (ambulance_id, e_id)
values (11449, 220);
insert into HAS (ambulance_id, e_id)
values (11450, 220);
insert into HAS (ambulance_id, e_id)
values (11451, 220);
insert into HAS (ambulance_id, e_id)
values (11452, 220);
insert into HAS (ambulance_id, e_id)
values (11453, 220);
insert into HAS (ambulance_id, e_id)
values (11454, 220);
insert into HAS (ambulance_id, e_id)
values (11455, 220);
insert into HAS (ambulance_id, e_id)
values (11456, 220);
insert into HAS (ambulance_id, e_id)
values (11457, 220);
insert into HAS (ambulance_id, e_id)
values (11458, 220);
insert into HAS (ambulance_id, e_id)
values (11459, 220);
insert into HAS (ambulance_id, e_id)
values (11460, 220);
insert into HAS (ambulance_id, e_id)
values (11461, 220);
insert into HAS (ambulance_id, e_id)
values (11462, 220);
insert into HAS (ambulance_id, e_id)
values (11463, 220);
insert into HAS (ambulance_id, e_id)
values (11464, 220);
insert into HAS (ambulance_id, e_id)
values (11465, 220);
insert into HAS (ambulance_id, e_id)
values (11466, 220);
insert into HAS (ambulance_id, e_id)
values (11467, 220);
insert into HAS (ambulance_id, e_id)
values (11468, 220);
insert into HAS (ambulance_id, e_id)
values (11469, 220);
insert into HAS (ambulance_id, e_id)
values (11470, 220);
insert into HAS (ambulance_id, e_id)
values (11471, 220);
insert into HAS (ambulance_id, e_id)
values (11472, 220);
insert into HAS (ambulance_id, e_id)
values (11473, 220);
insert into HAS (ambulance_id, e_id)
values (11474, 220);
insert into HAS (ambulance_id, e_id)
values (11475, 220);
insert into HAS (ambulance_id, e_id)
values (11476, 220);
insert into HAS (ambulance_id, e_id)
values (11477, 220);
insert into HAS (ambulance_id, e_id)
values (11478, 220);
insert into HAS (ambulance_id, e_id)
values (11479, 220);
insert into HAS (ambulance_id, e_id)
values (11480, 220);
insert into HAS (ambulance_id, e_id)
values (11481, 220);
insert into HAS (ambulance_id, e_id)
values (11482, 220);
insert into HAS (ambulance_id, e_id)
values (11483, 220);
insert into HAS (ambulance_id, e_id)
values (11484, 220);
insert into HAS (ambulance_id, e_id)
values (11485, 220);
insert into HAS (ambulance_id, e_id)
values (11486, 220);
insert into HAS (ambulance_id, e_id)
values (11487, 220);
insert into HAS (ambulance_id, e_id)
values (11488, 220);
insert into HAS (ambulance_id, e_id)
values (11489, 220);
insert into HAS (ambulance_id, e_id)
values (11490, 220);
insert into HAS (ambulance_id, e_id)
values (11491, 220);
insert into HAS (ambulance_id, e_id)
values (11492, 220);
insert into HAS (ambulance_id, e_id)
values (11493, 220);
insert into HAS (ambulance_id, e_id)
values (11494, 220);
insert into HAS (ambulance_id, e_id)
values (11495, 220);
insert into HAS (ambulance_id, e_id)
values (11496, 220);
insert into HAS (ambulance_id, e_id)
values (11497, 220);
insert into HAS (ambulance_id, e_id)
values (11498, 220);
insert into HAS (ambulance_id, e_id)
values (11499, 220);
insert into HAS (ambulance_id, e_id)
values (11500, 220);
commit;
prompt 400 records loaded
prompt Loading MEDIC...
insert into MEDIC (seniority, volunteer_id)
values (5, '1');
insert into MEDIC (seniority, volunteer_id)
values (4, '2');
insert into MEDIC (seniority, volunteer_id)
values (3, '3');
insert into MEDIC (seniority, volunteer_id)
values (2, '4');
insert into MEDIC (seniority, volunteer_id)
values (1, '5');
insert into MEDIC (seniority, volunteer_id)
values (6, '6');
insert into MEDIC (seniority, volunteer_id)
values (7, '7');
insert into MEDIC (seniority, volunteer_id)
values (8, '8');
insert into MEDIC (seniority, volunteer_id)
values (9, '9');
insert into MEDIC (seniority, volunteer_id)
values (10, '10');
insert into MEDIC (seniority, volunteer_id)
values (7, '11432');
insert into MEDIC (seniority, volunteer_id)
values (9, '11220');
insert into MEDIC (seniority, volunteer_id)
values (9, '11274');
insert into MEDIC (seniority, volunteer_id)
values (3, '11385');
insert into MEDIC (seniority, volunteer_id)
values (3, '11221');
insert into MEDIC (seniority, volunteer_id)
values (9, '11131');
insert into MEDIC (seniority, volunteer_id)
values (5, '11320');
insert into MEDIC (seniority, volunteer_id)
values (2, '11350');
insert into MEDIC (seniority, volunteer_id)
values (6, '11488');
insert into MEDIC (seniority, volunteer_id)
values (2, '11425');
insert into MEDIC (seniority, volunteer_id)
values (3, '11273');
insert into MEDIC (seniority, volunteer_id)
values (7, '11490');
insert into MEDIC (seniority, volunteer_id)
values (6, '11206');
insert into MEDIC (seniority, volunteer_id)
values (8, '11286');
insert into MEDIC (seniority, volunteer_id)
values (6, '11301');
insert into MEDIC (seniority, volunteer_id)
values (9, '11228');
insert into MEDIC (seniority, volunteer_id)
values (4, '11342');
insert into MEDIC (seniority, volunteer_id)
values (2, '11184');
insert into MEDIC (seniority, volunteer_id)
values (6, '11165');
insert into MEDIC (seniority, volunteer_id)
values (6, '11146');
insert into MEDIC (seniority, volunteer_id)
values (5, '11291');
insert into MEDIC (seniority, volunteer_id)
values (8, '11138');
insert into MEDIC (seniority, volunteer_id)
values (9, '11485');
insert into MEDIC (seniority, volunteer_id)
values (3, '11464');
insert into MEDIC (seniority, volunteer_id)
values (9, '11493');
insert into MEDIC (seniority, volunteer_id)
values (5, '11258');
insert into MEDIC (seniority, volunteer_id)
values (3, '11346');
insert into MEDIC (seniority, volunteer_id)
values (1, '11159');
insert into MEDIC (seniority, volunteer_id)
values (8, '11150');
insert into MEDIC (seniority, volunteer_id)
values (7, '11292');
insert into MEDIC (seniority, volunteer_id)
values (2, '11256');
insert into MEDIC (seniority, volunteer_id)
values (9, '11423');
insert into MEDIC (seniority, volunteer_id)
values (1, '11297');
insert into MEDIC (seniority, volunteer_id)
values (8, '11212');
insert into MEDIC (seniority, volunteer_id)
values (2, '11140');
insert into MEDIC (seniority, volunteer_id)
values (8, '11347');
insert into MEDIC (seniority, volunteer_id)
values (1, '11257');
insert into MEDIC (seniority, volunteer_id)
values (6, '11246');
insert into MEDIC (seniority, volunteer_id)
values (7, '11394');
insert into MEDIC (seniority, volunteer_id)
values (6, '11185');
insert into MEDIC (seniority, volunteer_id)
values (7, '11324');
insert into MEDIC (seniority, volunteer_id)
values (6, '11263');
insert into MEDIC (seniority, volunteer_id)
values (1, '11259');
insert into MEDIC (seniority, volunteer_id)
values (5, '11251');
insert into MEDIC (seniority, volunteer_id)
values (3, '11447');
insert into MEDIC (seniority, volunteer_id)
values (9, '11229');
insert into MEDIC (seniority, volunteer_id)
values (8, '11203');
insert into MEDIC (seniority, volunteer_id)
values (9, '11458');
insert into MEDIC (seniority, volunteer_id)
values (5, '11113');
insert into MEDIC (seniority, volunteer_id)
values (9, '11118');
insert into MEDIC (seniority, volunteer_id)
values (2, '11198');
insert into MEDIC (seniority, volunteer_id)
values (9, '11442');
insert into MEDIC (seniority, volunteer_id)
values (5, '11382');
insert into MEDIC (seniority, volunteer_id)
values (4, '11484');
insert into MEDIC (seniority, volunteer_id)
values (4, '11374');
insert into MEDIC (seniority, volunteer_id)
values (1, '11145');
insert into MEDIC (seniority, volunteer_id)
values (2, '11300');
insert into MEDIC (seniority, volunteer_id)
values (7, '11126');
insert into MEDIC (seniority, volunteer_id)
values (6, '11232');
insert into MEDIC (seniority, volunteer_id)
values (5, '11141');
insert into MEDIC (seniority, volunteer_id)
values (1, '11182');
insert into MEDIC (seniority, volunteer_id)
values (8, '11270');
insert into MEDIC (seniority, volunteer_id)
values (5, '11132');
insert into MEDIC (seniority, volunteer_id)
values (6, '11469');
insert into MEDIC (seniority, volunteer_id)
values (6, '11139');
insert into MEDIC (seniority, volunteer_id)
values (9, '11483');
insert into MEDIC (seniority, volunteer_id)
values (4, '11486');
insert into MEDIC (seniority, volunteer_id)
values (1, '11315');
insert into MEDIC (seniority, volunteer_id)
values (4, '11175');
insert into MEDIC (seniority, volunteer_id)
values (5, '11381');
insert into MEDIC (seniority, volunteer_id)
values (4, '11451');
insert into MEDIC (seniority, volunteer_id)
values (4, '11252');
insert into MEDIC (seniority, volunteer_id)
values (9, '11124');
insert into MEDIC (seniority, volunteer_id)
values (7, '11306');
insert into MEDIC (seniority, volunteer_id)
values (1, '11412');
insert into MEDIC (seniority, volunteer_id)
values (3, '11197');
insert into MEDIC (seniority, volunteer_id)
values (6, '11116');
insert into MEDIC (seniority, volunteer_id)
values (6, '11314');
insert into MEDIC (seniority, volunteer_id)
values (4, '11402');
insert into MEDIC (seniority, volunteer_id)
values (3, '11400');
insert into MEDIC (seniority, volunteer_id)
values (6, '11503');
insert into MEDIC (seniority, volunteer_id)
values (8, '11233');
insert into MEDIC (seniority, volunteer_id)
values (1, '11217');
insert into MEDIC (seniority, volunteer_id)
values (6, '11470');
insert into MEDIC (seniority, volunteer_id)
values (3, '11456');
insert into MEDIC (seniority, volunteer_id)
values (9, '11194');
insert into MEDIC (seniority, volunteer_id)
values (4, '11144');
insert into MEDIC (seniority, volunteer_id)
values (1, '11368');
insert into MEDIC (seniority, volunteer_id)
values (4, '11336');
insert into MEDIC (seniority, volunteer_id)
values (9, '11472');
commit;
prompt 100 records committed...
insert into MEDIC (seniority, volunteer_id)
values (6, '11281');
insert into MEDIC (seniority, volunteer_id)
values (3, '11355');
insert into MEDIC (seniority, volunteer_id)
values (1, '11283');
insert into MEDIC (seniority, volunteer_id)
values (9, '11151');
insert into MEDIC (seniority, volunteer_id)
values (2, '11326');
insert into MEDIC (seniority, volunteer_id)
values (8, '11168');
insert into MEDIC (seniority, volunteer_id)
values (6, '11417');
insert into MEDIC (seniority, volunteer_id)
values (6, '11351');
insert into MEDIC (seniority, volunteer_id)
values (4, '11137');
insert into MEDIC (seniority, volunteer_id)
values (7, '11237');
insert into MEDIC (seniority, volunteer_id)
values (5, '11170');
insert into MEDIC (seniority, volunteer_id)
values (2, '11290');
insert into MEDIC (seniority, volunteer_id)
values (3, '11462');
insert into MEDIC (seniority, volunteer_id)
values (8, '11253');
insert into MEDIC (seniority, volunteer_id)
values (3, '11195');
insert into MEDIC (seniority, volunteer_id)
values (4, '11325');
insert into MEDIC (seniority, volunteer_id)
values (2, '11343');
insert into MEDIC (seniority, volunteer_id)
values (5, '11201');
insert into MEDIC (seniority, volunteer_id)
values (7, '11479');
insert into MEDIC (seniority, volunteer_id)
values (3, '11396');
insert into MEDIC (seniority, volunteer_id)
values (2, '11262');
insert into MEDIC (seniority, volunteer_id)
values (8, '11455');
insert into MEDIC (seniority, volunteer_id)
values (3, '11386');
insert into MEDIC (seniority, volunteer_id)
values (7, '11436');
insert into MEDIC (seniority, volunteer_id)
values (6, '11353');
insert into MEDIC (seniority, volunteer_id)
values (5, '11234');
insert into MEDIC (seniority, volunteer_id)
values (9, '11505');
insert into MEDIC (seniority, volunteer_id)
values (6, '11305');
insert into MEDIC (seniority, volunteer_id)
values (3, '11171');
insert into MEDIC (seniority, volunteer_id)
values (3, '11334');
insert into MEDIC (seniority, volunteer_id)
values (5, '11463');
insert into MEDIC (seniority, volunteer_id)
values (6, '11218');
insert into MEDIC (seniority, volunteer_id)
values (2, '11238');
insert into MEDIC (seniority, volunteer_id)
values (3, '11331');
insert into MEDIC (seniority, volunteer_id)
values (1, '11441');
insert into MEDIC (seniority, volunteer_id)
values (4, '11117');
insert into MEDIC (seniority, volunteer_id)
values (2, '11507');
insert into MEDIC (seniority, volunteer_id)
values (8, '11208');
insert into MEDIC (seniority, volunteer_id)
values (3, '11200');
insert into MEDIC (seniority, volunteer_id)
values (8, '11426');
insert into MEDIC (seniority, volunteer_id)
values (3, '11178');
insert into MEDIC (seniority, volunteer_id)
values (4, '11420');
insert into MEDIC (seniority, volunteer_id)
values (7, '11275');
insert into MEDIC (seniority, volunteer_id)
values (2, '11176');
insert into MEDIC (seniority, volunteer_id)
values (4, '11424');
insert into MEDIC (seniority, volunteer_id)
values (3, '11495');
insert into MEDIC (seniority, volunteer_id)
values (5, '11276');
insert into MEDIC (seniority, volunteer_id)
values (8, '11431');
insert into MEDIC (seniority, volunteer_id)
values (7, '11202');
insert into MEDIC (seniority, volunteer_id)
values (7, '11356');
insert into MEDIC (seniority, volunteer_id)
values (9, '11111');
insert into MEDIC (seniority, volunteer_id)
values (6, '11502');
insert into MEDIC (seniority, volunteer_id)
values (7, '11480');
insert into MEDIC (seniority, volunteer_id)
values (5, '11365');
insert into MEDIC (seniority, volunteer_id)
values (4, '11475');
insert into MEDIC (seniority, volunteer_id)
values (7, '11322');
insert into MEDIC (seniority, volunteer_id)
values (8, '11358');
insert into MEDIC (seniority, volunteer_id)
values (5, '11446');
insert into MEDIC (seniority, volunteer_id)
values (9, '11143');
insert into MEDIC (seniority, volunteer_id)
values (4, '11395');
insert into MEDIC (seniority, volunteer_id)
values (3, '11186');
insert into MEDIC (seniority, volunteer_id)
values (2, '11448');
insert into MEDIC (seniority, volunteer_id)
values (1, '11162');
commit;
prompt 163 records loaded
prompt Loading MADICINSHIFT...
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (1, '1');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (1, '11462');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (2, '2');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (3, '3');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (4, '4');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (5, '5');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (6, '11185');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (6, '6');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (7, '7');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (8, '11162');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (8, '8');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (9, '9');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (10, '10');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11, '10');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11, '9');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (12, '1');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (12, '4');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (13, '1');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (13, '11150');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (13, '4');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11111, '11423');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11116, '11220');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11118, '11483');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11119, '11259');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11120, '11246');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11130, '11507');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11137, '11292');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11138, '11218');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11140, '11162');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11143, '11257');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11146, '1');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11148, '11233');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11150, '11141');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11153, '11502');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11156, '11301');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11161, '11185');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11163, '11111');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11163, '11365');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11167, '11464');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11170, '11170');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11172, '11176');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11174, '11141');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11180, '11150');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11180, '11290');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11181, '11111');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11181, '11281');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11181, '11402');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11182, '11368');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11185, '11446');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11185, '11488');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11186, '11238');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11187, '11111');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11188, '11253');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11189, '11426');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11190, '11315');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11191, '11292');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11195, '11141');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11200, '11176');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11204, '11458');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11206, '11176');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11210, '11251');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11211, '11336');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11214, '11141');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11217, '11385');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11217, '11485');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11219, '11300');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11219, '11441');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11221, '11336');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11222, '11324');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11225, '11229');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11225, '11234');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11227, '11162');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11230, '11162');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11232, '8');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11234, '11425');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11235, '11200');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11236, '11456');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11241, '11186');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11245, '11262');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11246, '11305');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11246, '11365');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11249, '11124');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11251, '11505');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11254, '11151');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11257, '11229');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11260, '11228');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11264, '11200');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11264, '11472');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11265, '11132');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11266, '11368');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11268, '11331');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11269, '11462');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11270, '11503');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11276, '11118');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11277, '11232');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11278, '11252');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11280, '1');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11281, '11116');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11281, '11314');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11282, '11165');
commit;
prompt 100 records committed...
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11283, '11137');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11283, '11485');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11285, '11479');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11287, '11343');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11291, '11262');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11292, '11400');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11293, '11197');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11301, '11451');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11302, '11270');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11302, '11351');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11302, '11463');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11307, '11228');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11308, '1');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11309, '11351');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11315, '11420');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11318, '11118');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11320, '11234');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11320, '11356');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11322, '11132');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11323, '11334');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11325, '11233');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11333, '11263');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11333, '11503');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11333, '11505');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11338, '11178');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11342, '7');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11343, '11131');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11344, '11186');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11346, '11505');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11348, '11197');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11348, '4');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11349, '11170');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11350, '11116');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11350, '11281');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11352, '11176');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11354, '9');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11356, '11197');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11362, '11400');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11367, '11113');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11368, '11113');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11371, '11195');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11371, '11283');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11378, '11382');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11378, '11402');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11379, '11140');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11379, '11162');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11379, '11274');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11380, '11495');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11381, '11197');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11387, '11228');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11387, '11322');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11389, '11206');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11390, '11355');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11393, '11322');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11395, '11420');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11395, '11507');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11398, '11353');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11399, '11140');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11399, '11275');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11403, '11326');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11405, '11469');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11409, '4');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11410, '11305');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11410, '11507');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11411, '11286');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11413, '11458');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11422, '11292');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11425, '11343');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11429, '11507');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11431, '11436');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11431, '2');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11433, '11144');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11434, '3');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11435, '11140');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11436, '11324');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11437, '11446');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11438, '11144');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11438, '11420');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11439, '11286');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11440, '11336');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11441, '11178');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11445, '11131');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11445, '11200');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11445, '11203');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11445, '11402');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11446, '7');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11448, '11150');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11449, '2');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11450, '11290');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11450, '9');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11455, '11386');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11456, '11221');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11456, '11480');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11458, '11217');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11458, '11270');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11458, '11324');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11460, '11480');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11463, '11306');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11473, '11165');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11474, '11485');
commit;
prompt 200 records committed...
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11475, '11314');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11479, '11402');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11480, '11117');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11480, '11221');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11481, '11117');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11481, '11426');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11486, '11493');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11490, '11144');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11500, '11273');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11501, '11257');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11503, '11145');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11503, '11343');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11504, '11297');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11504, '11420');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11506, '11402');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11509, '11257');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11511, '2');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11511, '3');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11512, '11275');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11512, '11355');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11513, '11246');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11513, '11488');
commit;
prompt 222 records loaded
prompt Loading TEACHES_THE...
insert into TEACHES_THE (l_id, c_id)
values (100, 23);
insert into TEACHES_THE (l_id, c_id)
values (100, 221);
insert into TEACHES_THE (l_id, c_id)
values (101, 141);
insert into TEACHES_THE (l_id, c_id)
values (102, 91);
insert into TEACHES_THE (l_id, c_id)
values (106, 61);
insert into TEACHES_THE (l_id, c_id)
values (107, 39);
insert into TEACHES_THE (l_id, c_id)
values (107, 245);
insert into TEACHES_THE (l_id, c_id)
values (108, 43);
insert into TEACHES_THE (l_id, c_id)
values (108, 325);
insert into TEACHES_THE (l_id, c_id)
values (109, 290);
insert into TEACHES_THE (l_id, c_id)
values (112, 37);
insert into TEACHES_THE (l_id, c_id)
values (115, 397);
insert into TEACHES_THE (l_id, c_id)
values (116, 62);
insert into TEACHES_THE (l_id, c_id)
values (116, 385);
insert into TEACHES_THE (l_id, c_id)
values (118, 49);
insert into TEACHES_THE (l_id, c_id)
values (118, 298);
insert into TEACHES_THE (l_id, c_id)
values (119, 31);
insert into TEACHES_THE (l_id, c_id)
values (119, 116);
insert into TEACHES_THE (l_id, c_id)
values (120, 150);
insert into TEACHES_THE (l_id, c_id)
values (121, 55);
insert into TEACHES_THE (l_id, c_id)
values (124, 173);
insert into TEACHES_THE (l_id, c_id)
values (125, 196);
insert into TEACHES_THE (l_id, c_id)
values (126, 28);
insert into TEACHES_THE (l_id, c_id)
values (126, 196);
insert into TEACHES_THE (l_id, c_id)
values (128, 340);
insert into TEACHES_THE (l_id, c_id)
values (129, 307);
insert into TEACHES_THE (l_id, c_id)
values (131, 111);
insert into TEACHES_THE (l_id, c_id)
values (132, 365);
insert into TEACHES_THE (l_id, c_id)
values (133, 298);
insert into TEACHES_THE (l_id, c_id)
values (134, 277);
insert into TEACHES_THE (l_id, c_id)
values (135, 172);
insert into TEACHES_THE (l_id, c_id)
values (135, 214);
insert into TEACHES_THE (l_id, c_id)
values (136, 293);
insert into TEACHES_THE (l_id, c_id)
values (137, 118);
insert into TEACHES_THE (l_id, c_id)
values (138, 301);
insert into TEACHES_THE (l_id, c_id)
values (139, 243);
insert into TEACHES_THE (l_id, c_id)
values (139, 357);
insert into TEACHES_THE (l_id, c_id)
values (140, 158);
insert into TEACHES_THE (l_id, c_id)
values (143, 303);
insert into TEACHES_THE (l_id, c_id)
values (145, 21);
insert into TEACHES_THE (l_id, c_id)
values (146, 387);
insert into TEACHES_THE (l_id, c_id)
values (148, 15);
insert into TEACHES_THE (l_id, c_id)
values (148, 156);
insert into TEACHES_THE (l_id, c_id)
values (148, 265);
insert into TEACHES_THE (l_id, c_id)
values (150, 25);
insert into TEACHES_THE (l_id, c_id)
values (150, 73);
insert into TEACHES_THE (l_id, c_id)
values (150, 146);
insert into TEACHES_THE (l_id, c_id)
values (151, 114);
insert into TEACHES_THE (l_id, c_id)
values (154, 255);
insert into TEACHES_THE (l_id, c_id)
values (157, 151);
insert into TEACHES_THE (l_id, c_id)
values (158, 398);
insert into TEACHES_THE (l_id, c_id)
values (159, 329);
insert into TEACHES_THE (l_id, c_id)
values (160, 123);
insert into TEACHES_THE (l_id, c_id)
values (160, 382);
insert into TEACHES_THE (l_id, c_id)
values (161, 131);
insert into TEACHES_THE (l_id, c_id)
values (162, 168);
insert into TEACHES_THE (l_id, c_id)
values (164, 248);
insert into TEACHES_THE (l_id, c_id)
values (165, 168);
insert into TEACHES_THE (l_id, c_id)
values (165, 295);
insert into TEACHES_THE (l_id, c_id)
values (167, 304);
insert into TEACHES_THE (l_id, c_id)
values (168, 187);
insert into TEACHES_THE (l_id, c_id)
values (169, 271);
insert into TEACHES_THE (l_id, c_id)
values (171, 1);
insert into TEACHES_THE (l_id, c_id)
values (171, 266);
insert into TEACHES_THE (l_id, c_id)
values (173, 135);
insert into TEACHES_THE (l_id, c_id)
values (175, 338);
insert into TEACHES_THE (l_id, c_id)
values (177, 37);
insert into TEACHES_THE (l_id, c_id)
values (177, 38);
insert into TEACHES_THE (l_id, c_id)
values (177, 153);
insert into TEACHES_THE (l_id, c_id)
values (178, 161);
insert into TEACHES_THE (l_id, c_id)
values (178, 338);
insert into TEACHES_THE (l_id, c_id)
values (179, 84);
insert into TEACHES_THE (l_id, c_id)
values (184, 52);
insert into TEACHES_THE (l_id, c_id)
values (184, 191);
insert into TEACHES_THE (l_id, c_id)
values (185, 66);
insert into TEACHES_THE (l_id, c_id)
values (185, 192);
insert into TEACHES_THE (l_id, c_id)
values (186, 241);
insert into TEACHES_THE (l_id, c_id)
values (187, 328);
insert into TEACHES_THE (l_id, c_id)
values (189, 267);
insert into TEACHES_THE (l_id, c_id)
values (193, 172);
insert into TEACHES_THE (l_id, c_id)
values (195, 315);
insert into TEACHES_THE (l_id, c_id)
values (196, 100);
insert into TEACHES_THE (l_id, c_id)
values (196, 238);
insert into TEACHES_THE (l_id, c_id)
values (198, 78);
insert into TEACHES_THE (l_id, c_id)
values (198, 239);
insert into TEACHES_THE (l_id, c_id)
values (199, 104);
insert into TEACHES_THE (l_id, c_id)
values (199, 249);
insert into TEACHES_THE (l_id, c_id)
values (202, 279);
insert into TEACHES_THE (l_id, c_id)
values (203, 209);
insert into TEACHES_THE (l_id, c_id)
values (205, 43);
insert into TEACHES_THE (l_id, c_id)
values (206, 374);
insert into TEACHES_THE (l_id, c_id)
values (207, 209);
insert into TEACHES_THE (l_id, c_id)
values (207, 267);
insert into TEACHES_THE (l_id, c_id)
values (209, 283);
insert into TEACHES_THE (l_id, c_id)
values (209, 321);
insert into TEACHES_THE (l_id, c_id)
values (210, 129);
insert into TEACHES_THE (l_id, c_id)
values (210, 284);
insert into TEACHES_THE (l_id, c_id)
values (210, 341);
insert into TEACHES_THE (l_id, c_id)
values (212, 64);
insert into TEACHES_THE (l_id, c_id)
values (212, 85);
commit;
prompt 100 records committed...
insert into TEACHES_THE (l_id, c_id)
values (212, 254);
insert into TEACHES_THE (l_id, c_id)
values (213, 1);
insert into TEACHES_THE (l_id, c_id)
values (213, 286);
insert into TEACHES_THE (l_id, c_id)
values (214, 316);
insert into TEACHES_THE (l_id, c_id)
values (215, 31);
insert into TEACHES_THE (l_id, c_id)
values (215, 135);
insert into TEACHES_THE (l_id, c_id)
values (215, 191);
insert into TEACHES_THE (l_id, c_id)
values (215, 374);
insert into TEACHES_THE (l_id, c_id)
values (216, 218);
insert into TEACHES_THE (l_id, c_id)
values (219, 239);
insert into TEACHES_THE (l_id, c_id)
values (219, 362);
insert into TEACHES_THE (l_id, c_id)
values (220, 356);
insert into TEACHES_THE (l_id, c_id)
values (221, 149);
insert into TEACHES_THE (l_id, c_id)
values (221, 164);
insert into TEACHES_THE (l_id, c_id)
values (222, 352);
insert into TEACHES_THE (l_id, c_id)
values (223, 80);
insert into TEACHES_THE (l_id, c_id)
values (223, 250);
insert into TEACHES_THE (l_id, c_id)
values (224, 146);
insert into TEACHES_THE (l_id, c_id)
values (224, 218);
insert into TEACHES_THE (l_id, c_id)
values (224, 400);
insert into TEACHES_THE (l_id, c_id)
values (225, 311);
insert into TEACHES_THE (l_id, c_id)
values (226, 141);
insert into TEACHES_THE (l_id, c_id)
values (226, 230);
insert into TEACHES_THE (l_id, c_id)
values (226, 340);
insert into TEACHES_THE (l_id, c_id)
values (227, 84);
insert into TEACHES_THE (l_id, c_id)
values (227, 164);
insert into TEACHES_THE (l_id, c_id)
values (227, 392);
insert into TEACHES_THE (l_id, c_id)
values (231, 72);
insert into TEACHES_THE (l_id, c_id)
values (232, 258);
insert into TEACHES_THE (l_id, c_id)
values (236, 73);
insert into TEACHES_THE (l_id, c_id)
values (237, 400);
insert into TEACHES_THE (l_id, c_id)
values (238, 201);
insert into TEACHES_THE (l_id, c_id)
values (239, 65);
insert into TEACHES_THE (l_id, c_id)
values (240, 52);
insert into TEACHES_THE (l_id, c_id)
values (240, 86);
insert into TEACHES_THE (l_id, c_id)
values (240, 236);
insert into TEACHES_THE (l_id, c_id)
values (241, 312);
insert into TEACHES_THE (l_id, c_id)
values (241, 396);
insert into TEACHES_THE (l_id, c_id)
values (245, 48);
insert into TEACHES_THE (l_id, c_id)
values (245, 65);
insert into TEACHES_THE (l_id, c_id)
values (245, 202);
insert into TEACHES_THE (l_id, c_id)
values (245, 248);
insert into TEACHES_THE (l_id, c_id)
values (246, 197);
insert into TEACHES_THE (l_id, c_id)
values (246, 371);
insert into TEACHES_THE (l_id, c_id)
values (247, 112);
insert into TEACHES_THE (l_id, c_id)
values (248, 70);
insert into TEACHES_THE (l_id, c_id)
values (248, 350);
insert into TEACHES_THE (l_id, c_id)
values (249, 371);
insert into TEACHES_THE (l_id, c_id)
values (250, 120);
insert into TEACHES_THE (l_id, c_id)
values (252, 162);
insert into TEACHES_THE (l_id, c_id)
values (252, 173);
insert into TEACHES_THE (l_id, c_id)
values (254, 208);
insert into TEACHES_THE (l_id, c_id)
values (256, 283);
insert into TEACHES_THE (l_id, c_id)
values (257, 230);
insert into TEACHES_THE (l_id, c_id)
values (258, 125);
insert into TEACHES_THE (l_id, c_id)
values (259, 293);
insert into TEACHES_THE (l_id, c_id)
values (259, 374);
insert into TEACHES_THE (l_id, c_id)
values (261, 154);
insert into TEACHES_THE (l_id, c_id)
values (261, 324);
insert into TEACHES_THE (l_id, c_id)
values (262, 168);
insert into TEACHES_THE (l_id, c_id)
values (262, 340);
insert into TEACHES_THE (l_id, c_id)
values (263, 13);
insert into TEACHES_THE (l_id, c_id)
values (263, 314);
insert into TEACHES_THE (l_id, c_id)
values (265, 45);
insert into TEACHES_THE (l_id, c_id)
values (265, 46);
insert into TEACHES_THE (l_id, c_id)
values (267, 279);
insert into TEACHES_THE (l_id, c_id)
values (268, 183);
insert into TEACHES_THE (l_id, c_id)
values (270, 158);
insert into TEACHES_THE (l_id, c_id)
values (272, 7);
insert into TEACHES_THE (l_id, c_id)
values (273, 98);
insert into TEACHES_THE (l_id, c_id)
values (274, 195);
insert into TEACHES_THE (l_id, c_id)
values (275, 251);
insert into TEACHES_THE (l_id, c_id)
values (275, 279);
insert into TEACHES_THE (l_id, c_id)
values (276, 47);
insert into TEACHES_THE (l_id, c_id)
values (276, 191);
insert into TEACHES_THE (l_id, c_id)
values (277, 163);
insert into TEACHES_THE (l_id, c_id)
values (277, 321);
insert into TEACHES_THE (l_id, c_id)
values (279, 188);
insert into TEACHES_THE (l_id, c_id)
values (280, 118);
insert into TEACHES_THE (l_id, c_id)
values (281, 213);
insert into TEACHES_THE (l_id, c_id)
values (281, 398);
insert into TEACHES_THE (l_id, c_id)
values (283, 71);
insert into TEACHES_THE (l_id, c_id)
values (289, 312);
insert into TEACHES_THE (l_id, c_id)
values (291, 77);
insert into TEACHES_THE (l_id, c_id)
values (293, 179);
insert into TEACHES_THE (l_id, c_id)
values (293, 182);
insert into TEACHES_THE (l_id, c_id)
values (294, 1);
insert into TEACHES_THE (l_id, c_id)
values (295, 208);
insert into TEACHES_THE (l_id, c_id)
values (295, 224);
insert into TEACHES_THE (l_id, c_id)
values (295, 276);
insert into TEACHES_THE (l_id, c_id)
values (297, 270);
insert into TEACHES_THE (l_id, c_id)
values (299, 71);
insert into TEACHES_THE (l_id, c_id)
values (300, 196);
insert into TEACHES_THE (l_id, c_id)
values (301, 368);
insert into TEACHES_THE (l_id, c_id)
values (302, 22);
insert into TEACHES_THE (l_id, c_id)
values (302, 38);
insert into TEACHES_THE (l_id, c_id)
values (303, 335);
insert into TEACHES_THE (l_id, c_id)
values (304, 129);
insert into TEACHES_THE (l_id, c_id)
values (304, 305);
insert into TEACHES_THE (l_id, c_id)
values (305, 330);
commit;
prompt 200 records committed...
insert into TEACHES_THE (l_id, c_id)
values (307, 180);
insert into TEACHES_THE (l_id, c_id)
values (307, 186);
insert into TEACHES_THE (l_id, c_id)
values (307, 254);
insert into TEACHES_THE (l_id, c_id)
values (309, 132);
insert into TEACHES_THE (l_id, c_id)
values (310, 2);
insert into TEACHES_THE (l_id, c_id)
values (310, 121);
insert into TEACHES_THE (l_id, c_id)
values (310, 124);
insert into TEACHES_THE (l_id, c_id)
values (310, 265);
insert into TEACHES_THE (l_id, c_id)
values (313, 184);
insert into TEACHES_THE (l_id, c_id)
values (313, 336);
insert into TEACHES_THE (l_id, c_id)
values (315, 48);
insert into TEACHES_THE (l_id, c_id)
values (316, 299);
insert into TEACHES_THE (l_id, c_id)
values (317, 164);
insert into TEACHES_THE (l_id, c_id)
values (318, 90);
insert into TEACHES_THE (l_id, c_id)
values (318, 109);
insert into TEACHES_THE (l_id, c_id)
values (319, 160);
insert into TEACHES_THE (l_id, c_id)
values (321, 165);
insert into TEACHES_THE (l_id, c_id)
values (323, 54);
insert into TEACHES_THE (l_id, c_id)
values (323, 305);
insert into TEACHES_THE (l_id, c_id)
values (324, 21);
insert into TEACHES_THE (l_id, c_id)
values (325, 89);
insert into TEACHES_THE (l_id, c_id)
values (325, 181);
insert into TEACHES_THE (l_id, c_id)
values (325, 328);
insert into TEACHES_THE (l_id, c_id)
values (326, 332);
insert into TEACHES_THE (l_id, c_id)
values (327, 185);
insert into TEACHES_THE (l_id, c_id)
values (329, 286);
insert into TEACHES_THE (l_id, c_id)
values (331, 225);
insert into TEACHES_THE (l_id, c_id)
values (332, 107);
insert into TEACHES_THE (l_id, c_id)
values (334, 379);
insert into TEACHES_THE (l_id, c_id)
values (335, 140);
insert into TEACHES_THE (l_id, c_id)
values (335, 191);
insert into TEACHES_THE (l_id, c_id)
values (335, 263);
insert into TEACHES_THE (l_id, c_id)
values (335, 265);
insert into TEACHES_THE (l_id, c_id)
values (337, 126);
insert into TEACHES_THE (l_id, c_id)
values (338, 28);
insert into TEACHES_THE (l_id, c_id)
values (338, 75);
insert into TEACHES_THE (l_id, c_id)
values (338, 247);
insert into TEACHES_THE (l_id, c_id)
values (341, 43);
insert into TEACHES_THE (l_id, c_id)
values (341, 121);
insert into TEACHES_THE (l_id, c_id)
values (341, 396);
insert into TEACHES_THE (l_id, c_id)
values (344, 55);
insert into TEACHES_THE (l_id, c_id)
values (346, 6);
insert into TEACHES_THE (l_id, c_id)
values (347, 341);
insert into TEACHES_THE (l_id, c_id)
values (349, 326);
insert into TEACHES_THE (l_id, c_id)
values (352, 222);
insert into TEACHES_THE (l_id, c_id)
values (353, 241);
insert into TEACHES_THE (l_id, c_id)
values (355, 157);
insert into TEACHES_THE (l_id, c_id)
values (357, 81);
insert into TEACHES_THE (l_id, c_id)
values (358, 146);
insert into TEACHES_THE (l_id, c_id)
values (358, 181);
insert into TEACHES_THE (l_id, c_id)
values (359, 23);
insert into TEACHES_THE (l_id, c_id)
values (359, 24);
insert into TEACHES_THE (l_id, c_id)
values (359, 245);
insert into TEACHES_THE (l_id, c_id)
values (360, 336);
insert into TEACHES_THE (l_id, c_id)
values (361, 115);
insert into TEACHES_THE (l_id, c_id)
values (361, 284);
insert into TEACHES_THE (l_id, c_id)
values (362, 22);
insert into TEACHES_THE (l_id, c_id)
values (362, 83);
insert into TEACHES_THE (l_id, c_id)
values (365, 293);
insert into TEACHES_THE (l_id, c_id)
values (367, 154);
insert into TEACHES_THE (l_id, c_id)
values (369, 137);
insert into TEACHES_THE (l_id, c_id)
values (369, 171);
insert into TEACHES_THE (l_id, c_id)
values (369, 248);
insert into TEACHES_THE (l_id, c_id)
values (369, 399);
insert into TEACHES_THE (l_id, c_id)
values (370, 319);
insert into TEACHES_THE (l_id, c_id)
values (371, 266);
insert into TEACHES_THE (l_id, c_id)
values (372, 380);
insert into TEACHES_THE (l_id, c_id)
values (372, 388);
insert into TEACHES_THE (l_id, c_id)
values (373, 112);
insert into TEACHES_THE (l_id, c_id)
values (373, 274);
insert into TEACHES_THE (l_id, c_id)
values (375, 255);
insert into TEACHES_THE (l_id, c_id)
values (377, 179);
insert into TEACHES_THE (l_id, c_id)
values (377, 388);
insert into TEACHES_THE (l_id, c_id)
values (378, 205);
insert into TEACHES_THE (l_id, c_id)
values (380, 192);
insert into TEACHES_THE (l_id, c_id)
values (380, 247);
insert into TEACHES_THE (l_id, c_id)
values (381, 345);
insert into TEACHES_THE (l_id, c_id)
values (381, 363);
insert into TEACHES_THE (l_id, c_id)
values (382, 361);
insert into TEACHES_THE (l_id, c_id)
values (384, 262);
insert into TEACHES_THE (l_id, c_id)
values (384, 328);
insert into TEACHES_THE (l_id, c_id)
values (385, 208);
insert into TEACHES_THE (l_id, c_id)
values (388, 73);
insert into TEACHES_THE (l_id, c_id)
values (391, 27);
insert into TEACHES_THE (l_id, c_id)
values (391, 139);
insert into TEACHES_THE (l_id, c_id)
values (391, 234);
insert into TEACHES_THE (l_id, c_id)
values (391, 340);
insert into TEACHES_THE (l_id, c_id)
values (393, 169);
insert into TEACHES_THE (l_id, c_id)
values (393, 279);
insert into TEACHES_THE (l_id, c_id)
values (397, 163);
insert into TEACHES_THE (l_id, c_id)
values (397, 235);
insert into TEACHES_THE (l_id, c_id)
values (397, 374);
insert into TEACHES_THE (l_id, c_id)
values (398, 3);
insert into TEACHES_THE (l_id, c_id)
values (398, 151);
insert into TEACHES_THE (l_id, c_id)
values (400, 50);
insert into TEACHES_THE (l_id, c_id)
values (400, 367);
insert into TEACHES_THE (l_id, c_id)
values (402, 228);
insert into TEACHES_THE (l_id, c_id)
values (406, 96);
insert into TEACHES_THE (l_id, c_id)
values (407, 27);
insert into TEACHES_THE (l_id, c_id)
values (407, 120);
commit;
prompt 300 records committed...
insert into TEACHES_THE (l_id, c_id)
values (408, 89);
insert into TEACHES_THE (l_id, c_id)
values (409, 15);
insert into TEACHES_THE (l_id, c_id)
values (409, 361);
insert into TEACHES_THE (l_id, c_id)
values (409, 364);
insert into TEACHES_THE (l_id, c_id)
values (410, 5);
insert into TEACHES_THE (l_id, c_id)
values (410, 136);
insert into TEACHES_THE (l_id, c_id)
values (410, 279);
insert into TEACHES_THE (l_id, c_id)
values (411, 300);
insert into TEACHES_THE (l_id, c_id)
values (411, 379);
insert into TEACHES_THE (l_id, c_id)
values (413, 358);
insert into TEACHES_THE (l_id, c_id)
values (416, 79);
insert into TEACHES_THE (l_id, c_id)
values (416, 269);
insert into TEACHES_THE (l_id, c_id)
values (417, 309);
insert into TEACHES_THE (l_id, c_id)
values (418, 295);
insert into TEACHES_THE (l_id, c_id)
values (423, 290);
insert into TEACHES_THE (l_id, c_id)
values (425, 205);
insert into TEACHES_THE (l_id, c_id)
values (426, 119);
insert into TEACHES_THE (l_id, c_id)
values (426, 128);
insert into TEACHES_THE (l_id, c_id)
values (426, 164);
insert into TEACHES_THE (l_id, c_id)
values (427, 291);
insert into TEACHES_THE (l_id, c_id)
values (428, 62);
insert into TEACHES_THE (l_id, c_id)
values (428, 119);
insert into TEACHES_THE (l_id, c_id)
values (429, 91);
insert into TEACHES_THE (l_id, c_id)
values (429, 229);
insert into TEACHES_THE (l_id, c_id)
values (432, 389);
insert into TEACHES_THE (l_id, c_id)
values (433, 22);
insert into TEACHES_THE (l_id, c_id)
values (435, 253);
insert into TEACHES_THE (l_id, c_id)
values (436, 147);
insert into TEACHES_THE (l_id, c_id)
values (436, 328);
insert into TEACHES_THE (l_id, c_id)
values (437, 61);
insert into TEACHES_THE (l_id, c_id)
values (442, 301);
insert into TEACHES_THE (l_id, c_id)
values (443, 11);
insert into TEACHES_THE (l_id, c_id)
values (443, 351);
insert into TEACHES_THE (l_id, c_id)
values (444, 183);
insert into TEACHES_THE (l_id, c_id)
values (444, 292);
insert into TEACHES_THE (l_id, c_id)
values (445, 287);
insert into TEACHES_THE (l_id, c_id)
values (445, 314);
insert into TEACHES_THE (l_id, c_id)
values (446, 116);
insert into TEACHES_THE (l_id, c_id)
values (448, 122);
insert into TEACHES_THE (l_id, c_id)
values (448, 135);
insert into TEACHES_THE (l_id, c_id)
values (449, 25);
insert into TEACHES_THE (l_id, c_id)
values (450, 43);
insert into TEACHES_THE (l_id, c_id)
values (450, 168);
insert into TEACHES_THE (l_id, c_id)
values (450, 254);
insert into TEACHES_THE (l_id, c_id)
values (451, 165);
insert into TEACHES_THE (l_id, c_id)
values (451, 388);
insert into TEACHES_THE (l_id, c_id)
values (452, 162);
insert into TEACHES_THE (l_id, c_id)
values (452, 179);
insert into TEACHES_THE (l_id, c_id)
values (452, 357);
insert into TEACHES_THE (l_id, c_id)
values (454, 367);
insert into TEACHES_THE (l_id, c_id)
values (455, 34);
insert into TEACHES_THE (l_id, c_id)
values (455, 278);
insert into TEACHES_THE (l_id, c_id)
values (455, 382);
insert into TEACHES_THE (l_id, c_id)
values (456, 31);
insert into TEACHES_THE (l_id, c_id)
values (456, 348);
insert into TEACHES_THE (l_id, c_id)
values (457, 10);
insert into TEACHES_THE (l_id, c_id)
values (457, 257);
insert into TEACHES_THE (l_id, c_id)
values (458, 173);
insert into TEACHES_THE (l_id, c_id)
values (459, 3);
insert into TEACHES_THE (l_id, c_id)
values (460, 156);
insert into TEACHES_THE (l_id, c_id)
values (460, 211);
insert into TEACHES_THE (l_id, c_id)
values (460, 362);
insert into TEACHES_THE (l_id, c_id)
values (461, 67);
insert into TEACHES_THE (l_id, c_id)
values (464, 153);
insert into TEACHES_THE (l_id, c_id)
values (465, 51);
insert into TEACHES_THE (l_id, c_id)
values (465, 228);
insert into TEACHES_THE (l_id, c_id)
values (467, 306);
insert into TEACHES_THE (l_id, c_id)
values (468, 45);
insert into TEACHES_THE (l_id, c_id)
values (468, 302);
insert into TEACHES_THE (l_id, c_id)
values (468, 371);
insert into TEACHES_THE (l_id, c_id)
values (469, 240);
insert into TEACHES_THE (l_id, c_id)
values (470, 101);
insert into TEACHES_THE (l_id, c_id)
values (470, 235);
insert into TEACHES_THE (l_id, c_id)
values (471, 18);
insert into TEACHES_THE (l_id, c_id)
values (473, 14);
insert into TEACHES_THE (l_id, c_id)
values (474, 355);
insert into TEACHES_THE (l_id, c_id)
values (475, 197);
insert into TEACHES_THE (l_id, c_id)
values (477, 205);
insert into TEACHES_THE (l_id, c_id)
values (478, 317);
insert into TEACHES_THE (l_id, c_id)
values (479, 145);
insert into TEACHES_THE (l_id, c_id)
values (480, 60);
insert into TEACHES_THE (l_id, c_id)
values (481, 40);
insert into TEACHES_THE (l_id, c_id)
values (481, 81);
insert into TEACHES_THE (l_id, c_id)
values (481, 143);
insert into TEACHES_THE (l_id, c_id)
values (482, 189);
insert into TEACHES_THE (l_id, c_id)
values (482, 321);
insert into TEACHES_THE (l_id, c_id)
values (485, 278);
insert into TEACHES_THE (l_id, c_id)
values (487, 278);
insert into TEACHES_THE (l_id, c_id)
values (488, 226);
insert into TEACHES_THE (l_id, c_id)
values (489, 285);
insert into TEACHES_THE (l_id, c_id)
values (489, 328);
insert into TEACHES_THE (l_id, c_id)
values (490, 373);
insert into TEACHES_THE (l_id, c_id)
values (491, 135);
insert into TEACHES_THE (l_id, c_id)
values (492, 56);
insert into TEACHES_THE (l_id, c_id)
values (492, 68);
insert into TEACHES_THE (l_id, c_id)
values (496, 23);
insert into TEACHES_THE (l_id, c_id)
values (497, 94);
insert into TEACHES_THE (l_id, c_id)
values (497, 219);
insert into TEACHES_THE (l_id, c_id)
values (498, 247);
insert into TEACHES_THE (l_id, c_id)
values (499, 359);
commit;
prompt 400 records loaded
prompt Loading USES...
insert into USES (c_id, e_id)
values (1, 315);
insert into USES (c_id, e_id)
values (1, 350);
insert into USES (c_id, e_id)
values (2, 197);
insert into USES (c_id, e_id)
values (3, 128);
insert into USES (c_id, e_id)
values (6, 361);
insert into USES (c_id, e_id)
values (8, 148);
insert into USES (c_id, e_id)
values (9, 366);
insert into USES (c_id, e_id)
values (10, 273);
insert into USES (c_id, e_id)
values (10, 348);
insert into USES (c_id, e_id)
values (11, 151);
insert into USES (c_id, e_id)
values (11, 396);
insert into USES (c_id, e_id)
values (12, 157);
insert into USES (c_id, e_id)
values (13, 334);
insert into USES (c_id, e_id)
values (14, 150);
insert into USES (c_id, e_id)
values (14, 311);
insert into USES (c_id, e_id)
values (14, 382);
insert into USES (c_id, e_id)
values (15, 348);
insert into USES (c_id, e_id)
values (17, 51);
insert into USES (c_id, e_id)
values (18, 112);
insert into USES (c_id, e_id)
values (19, 125);
insert into USES (c_id, e_id)
values (21, 161);
insert into USES (c_id, e_id)
values (21, 207);
insert into USES (c_id, e_id)
values (25, 183);
insert into USES (c_id, e_id)
values (26, 29);
insert into USES (c_id, e_id)
values (26, 399);
insert into USES (c_id, e_id)
values (27, 36);
insert into USES (c_id, e_id)
values (27, 200);
insert into USES (c_id, e_id)
values (28, 64);
insert into USES (c_id, e_id)
values (29, 15);
insert into USES (c_id, e_id)
values (30, 205);
insert into USES (c_id, e_id)
values (31, 262);
insert into USES (c_id, e_id)
values (32, 215);
insert into USES (c_id, e_id)
values (32, 325);
insert into USES (c_id, e_id)
values (33, 176);
insert into USES (c_id, e_id)
values (33, 205);
insert into USES (c_id, e_id)
values (34, 160);
insert into USES (c_id, e_id)
values (34, 241);
insert into USES (c_id, e_id)
values (34, 268);
insert into USES (c_id, e_id)
values (35, 235);
insert into USES (c_id, e_id)
values (38, 112);
insert into USES (c_id, e_id)
values (38, 134);
insert into USES (c_id, e_id)
values (39, 241);
insert into USES (c_id, e_id)
values (40, 349);
insert into USES (c_id, e_id)
values (41, 276);
insert into USES (c_id, e_id)
values (42, 87);
insert into USES (c_id, e_id)
values (42, 395);
insert into USES (c_id, e_id)
values (43, 62);
insert into USES (c_id, e_id)
values (45, 375);
insert into USES (c_id, e_id)
values (46, 42);
insert into USES (c_id, e_id)
values (46, 112);
insert into USES (c_id, e_id)
values (48, 389);
insert into USES (c_id, e_id)
values (49, 263);
insert into USES (c_id, e_id)
values (50, 202);
insert into USES (c_id, e_id)
values (51, 69);
insert into USES (c_id, e_id)
values (53, 52);
insert into USES (c_id, e_id)
values (53, 161);
insert into USES (c_id, e_id)
values (54, 199);
insert into USES (c_id, e_id)
values (55, 247);
insert into USES (c_id, e_id)
values (56, 26);
insert into USES (c_id, e_id)
values (57, 58);
insert into USES (c_id, e_id)
values (57, 105);
insert into USES (c_id, e_id)
values (61, 46);
insert into USES (c_id, e_id)
values (61, 126);
insert into USES (c_id, e_id)
values (62, 203);
insert into USES (c_id, e_id)
values (64, 266);
insert into USES (c_id, e_id)
values (66, 129);
insert into USES (c_id, e_id)
values (66, 181);
insert into USES (c_id, e_id)
values (66, 377);
insert into USES (c_id, e_id)
values (68, 213);
insert into USES (c_id, e_id)
values (69, 322);
insert into USES (c_id, e_id)
values (69, 351);
insert into USES (c_id, e_id)
values (69, 361);
insert into USES (c_id, e_id)
values (70, 12);
insert into USES (c_id, e_id)
values (70, 159);
insert into USES (c_id, e_id)
values (70, 227);
insert into USES (c_id, e_id)
values (72, 257);
insert into USES (c_id, e_id)
values (74, 190);
insert into USES (c_id, e_id)
values (75, 108);
insert into USES (c_id, e_id)
values (77, 77);
insert into USES (c_id, e_id)
values (77, 257);
insert into USES (c_id, e_id)
values (81, 281);
insert into USES (c_id, e_id)
values (82, 91);
insert into USES (c_id, e_id)
values (84, 372);
insert into USES (c_id, e_id)
values (85, 37);
insert into USES (c_id, e_id)
values (85, 104);
insert into USES (c_id, e_id)
values (85, 333);
insert into USES (c_id, e_id)
values (86, 286);
insert into USES (c_id, e_id)
values (89, 12);
insert into USES (c_id, e_id)
values (89, 217);
insert into USES (c_id, e_id)
values (90, 316);
insert into USES (c_id, e_id)
values (91, 383);
insert into USES (c_id, e_id)
values (92, 7);
insert into USES (c_id, e_id)
values (94, 372);
insert into USES (c_id, e_id)
values (96, 32);
insert into USES (c_id, e_id)
values (97, 212);
insert into USES (c_id, e_id)
values (98, 390);
insert into USES (c_id, e_id)
values (101, 52);
insert into USES (c_id, e_id)
values (103, 264);
insert into USES (c_id, e_id)
values (104, 298);
insert into USES (c_id, e_id)
values (104, 334);
commit;
prompt 100 records committed...
insert into USES (c_id, e_id)
values (105, 314);
insert into USES (c_id, e_id)
values (106, 324);
insert into USES (c_id, e_id)
values (107, 70);
insert into USES (c_id, e_id)
values (107, 76);
insert into USES (c_id, e_id)
values (108, 6);
insert into USES (c_id, e_id)
values (108, 170);
insert into USES (c_id, e_id)
values (108, 392);
insert into USES (c_id, e_id)
values (109, 135);
insert into USES (c_id, e_id)
values (109, 151);
insert into USES (c_id, e_id)
values (109, 216);
insert into USES (c_id, e_id)
values (109, 400);
insert into USES (c_id, e_id)
values (111, 194);
insert into USES (c_id, e_id)
values (111, 276);
insert into USES (c_id, e_id)
values (112, 327);
insert into USES (c_id, e_id)
values (113, 216);
insert into USES (c_id, e_id)
values (113, 303);
insert into USES (c_id, e_id)
values (113, 394);
insert into USES (c_id, e_id)
values (115, 224);
insert into USES (c_id, e_id)
values (115, 363);
insert into USES (c_id, e_id)
values (118, 239);
insert into USES (c_id, e_id)
values (119, 300);
insert into USES (c_id, e_id)
values (120, 69);
insert into USES (c_id, e_id)
values (122, 229);
insert into USES (c_id, e_id)
values (127, 128);
insert into USES (c_id, e_id)
values (130, 9);
insert into USES (c_id, e_id)
values (132, 252);
insert into USES (c_id, e_id)
values (132, 300);
insert into USES (c_id, e_id)
values (132, 348);
insert into USES (c_id, e_id)
values (133, 158);
insert into USES (c_id, e_id)
values (134, 31);
insert into USES (c_id, e_id)
values (134, 107);
insert into USES (c_id, e_id)
values (134, 153);
insert into USES (c_id, e_id)
values (136, 55);
insert into USES (c_id, e_id)
values (137, 101);
insert into USES (c_id, e_id)
values (138, 10);
insert into USES (c_id, e_id)
values (139, 399);
insert into USES (c_id, e_id)
values (144, 334);
insert into USES (c_id, e_id)
values (145, 78);
insert into USES (c_id, e_id)
values (146, 280);
insert into USES (c_id, e_id)
values (148, 36);
insert into USES (c_id, e_id)
values (151, 192);
insert into USES (c_id, e_id)
values (153, 218);
insert into USES (c_id, e_id)
values (153, 239);
insert into USES (c_id, e_id)
values (154, 264);
insert into USES (c_id, e_id)
values (155, 111);
insert into USES (c_id, e_id)
values (156, 59);
insert into USES (c_id, e_id)
values (156, 310);
insert into USES (c_id, e_id)
values (159, 47);
insert into USES (c_id, e_id)
values (159, 337);
insert into USES (c_id, e_id)
values (160, 51);
insert into USES (c_id, e_id)
values (162, 241);
insert into USES (c_id, e_id)
values (163, 270);
insert into USES (c_id, e_id)
values (165, 92);
insert into USES (c_id, e_id)
values (165, 99);
insert into USES (c_id, e_id)
values (165, 377);
insert into USES (c_id, e_id)
values (168, 25);
insert into USES (c_id, e_id)
values (168, 165);
insert into USES (c_id, e_id)
values (168, 223);
insert into USES (c_id, e_id)
values (168, 262);
insert into USES (c_id, e_id)
values (168, 307);
insert into USES (c_id, e_id)
values (170, 113);
insert into USES (c_id, e_id)
values (170, 250);
insert into USES (c_id, e_id)
values (171, 14);
insert into USES (c_id, e_id)
values (173, 369);
insert into USES (c_id, e_id)
values (175, 393);
insert into USES (c_id, e_id)
values (176, 24);
insert into USES (c_id, e_id)
values (176, 181);
insert into USES (c_id, e_id)
values (177, 39);
insert into USES (c_id, e_id)
values (178, 21);
insert into USES (c_id, e_id)
values (178, 26);
insert into USES (c_id, e_id)
values (178, 206);
insert into USES (c_id, e_id)
values (183, 324);
insert into USES (c_id, e_id)
values (184, 274);
insert into USES (c_id, e_id)
values (185, 369);
insert into USES (c_id, e_id)
values (186, 18);
insert into USES (c_id, e_id)
values (188, 330);
insert into USES (c_id, e_id)
values (191, 78);
insert into USES (c_id, e_id)
values (191, 309);
insert into USES (c_id, e_id)
values (191, 375);
insert into USES (c_id, e_id)
values (191, 385);
insert into USES (c_id, e_id)
values (192, 57);
insert into USES (c_id, e_id)
values (193, 68);
insert into USES (c_id, e_id)
values (194, 48);
insert into USES (c_id, e_id)
values (194, 327);
insert into USES (c_id, e_id)
values (195, 131);
insert into USES (c_id, e_id)
values (196, 92);
insert into USES (c_id, e_id)
values (196, 344);
insert into USES (c_id, e_id)
values (197, 26);
insert into USES (c_id, e_id)
values (198, 319);
insert into USES (c_id, e_id)
values (198, 326);
insert into USES (c_id, e_id)
values (202, 274);
insert into USES (c_id, e_id)
values (203, 51);
insert into USES (c_id, e_id)
values (203, 140);
insert into USES (c_id, e_id)
values (203, 239);
insert into USES (c_id, e_id)
values (205, 190);
insert into USES (c_id, e_id)
values (205, 273);
insert into USES (c_id, e_id)
values (206, 265);
insert into USES (c_id, e_id)
values (207, 70);
insert into USES (c_id, e_id)
values (208, 246);
insert into USES (c_id, e_id)
values (209, 67);
commit;
prompt 200 records committed...
insert into USES (c_id, e_id)
values (209, 323);
insert into USES (c_id, e_id)
values (210, 234);
insert into USES (c_id, e_id)
values (212, 292);
insert into USES (c_id, e_id)
values (214, 360);
insert into USES (c_id, e_id)
values (215, 115);
insert into USES (c_id, e_id)
values (215, 265);
insert into USES (c_id, e_id)
values (218, 179);
insert into USES (c_id, e_id)
values (219, 145);
insert into USES (c_id, e_id)
values (220, 18);
insert into USES (c_id, e_id)
values (220, 280);
insert into USES (c_id, e_id)
values (223, 76);
insert into USES (c_id, e_id)
values (224, 89);
insert into USES (c_id, e_id)
values (225, 220);
insert into USES (c_id, e_id)
values (226, 65);
insert into USES (c_id, e_id)
values (227, 267);
insert into USES (c_id, e_id)
values (227, 364);
insert into USES (c_id, e_id)
values (229, 6);
insert into USES (c_id, e_id)
values (230, 188);
insert into USES (c_id, e_id)
values (230, 226);
insert into USES (c_id, e_id)
values (231, 270);
insert into USES (c_id, e_id)
values (231, 299);
insert into USES (c_id, e_id)
values (232, 92);
insert into USES (c_id, e_id)
values (232, 231);
insert into USES (c_id, e_id)
values (234, 69);
insert into USES (c_id, e_id)
values (235, 54);
insert into USES (c_id, e_id)
values (235, 57);
insert into USES (c_id, e_id)
values (235, 244);
insert into USES (c_id, e_id)
values (237, 89);
insert into USES (c_id, e_id)
values (237, 331);
insert into USES (c_id, e_id)
values (238, 27);
insert into USES (c_id, e_id)
values (238, 256);
insert into USES (c_id, e_id)
values (240, 127);
insert into USES (c_id, e_id)
values (241, 352);
insert into USES (c_id, e_id)
values (243, 353);
insert into USES (c_id, e_id)
values (244, 16);
insert into USES (c_id, e_id)
values (244, 290);
insert into USES (c_id, e_id)
values (244, 389);
insert into USES (c_id, e_id)
values (245, 222);
insert into USES (c_id, e_id)
values (249, 91);
insert into USES (c_id, e_id)
values (253, 47);
insert into USES (c_id, e_id)
values (254, 74);
insert into USES (c_id, e_id)
values (254, 110);
insert into USES (c_id, e_id)
values (256, 227);
insert into USES (c_id, e_id)
values (256, 291);
insert into USES (c_id, e_id)
values (257, 169);
insert into USES (c_id, e_id)
values (258, 146);
insert into USES (c_id, e_id)
values (259, 71);
insert into USES (c_id, e_id)
values (260, 186);
insert into USES (c_id, e_id)
values (261, 74);
insert into USES (c_id, e_id)
values (261, 343);
insert into USES (c_id, e_id)
values (262, 131);
insert into USES (c_id, e_id)
values (263, 158);
insert into USES (c_id, e_id)
values (263, 373);
insert into USES (c_id, e_id)
values (264, 234);
insert into USES (c_id, e_id)
values (264, 326);
insert into USES (c_id, e_id)
values (266, 364);
insert into USES (c_id, e_id)
values (268, 35);
insert into USES (c_id, e_id)
values (268, 168);
insert into USES (c_id, e_id)
values (268, 243);
insert into USES (c_id, e_id)
values (272, 251);
insert into USES (c_id, e_id)
values (272, 320);
insert into USES (c_id, e_id)
values (273, 83);
insert into USES (c_id, e_id)
values (275, 255);
insert into USES (c_id, e_id)
values (276, 57);
insert into USES (c_id, e_id)
values (276, 96);
insert into USES (c_id, e_id)
values (279, 125);
insert into USES (c_id, e_id)
values (280, 31);
insert into USES (c_id, e_id)
values (281, 375);
insert into USES (c_id, e_id)
values (282, 62);
insert into USES (c_id, e_id)
values (283, 72);
insert into USES (c_id, e_id)
values (287, 211);
insert into USES (c_id, e_id)
values (288, 120);
insert into USES (c_id, e_id)
values (289, 271);
insert into USES (c_id, e_id)
values (290, 148);
insert into USES (c_id, e_id)
values (290, 378);
insert into USES (c_id, e_id)
values (291, 111);
insert into USES (c_id, e_id)
values (291, 254);
insert into USES (c_id, e_id)
values (291, 346);
insert into USES (c_id, e_id)
values (292, 188);
insert into USES (c_id, e_id)
values (295, 33);
insert into USES (c_id, e_id)
values (295, 123);
insert into USES (c_id, e_id)
values (295, 310);
insert into USES (c_id, e_id)
values (297, 87);
insert into USES (c_id, e_id)
values (298, 305);
insert into USES (c_id, e_id)
values (301, 282);
insert into USES (c_id, e_id)
values (301, 382);
insert into USES (c_id, e_id)
values (303, 28);
insert into USES (c_id, e_id)
values (305, 392);
insert into USES (c_id, e_id)
values (308, 26);
insert into USES (c_id, e_id)
values (310, 124);
insert into USES (c_id, e_id)
values (312, 262);
insert into USES (c_id, e_id)
values (313, 329);
insert into USES (c_id, e_id)
values (314, 201);
insert into USES (c_id, e_id)
values (316, 89);
insert into USES (c_id, e_id)
values (317, 211);
insert into USES (c_id, e_id)
values (318, 1);
insert into USES (c_id, e_id)
values (318, 131);
insert into USES (c_id, e_id)
values (318, 253);
insert into USES (c_id, e_id)
values (318, 373);
insert into USES (c_id, e_id)
values (319, 202);
commit;
prompt 300 records committed...
insert into USES (c_id, e_id)
values (320, 396);
insert into USES (c_id, e_id)
values (321, 86);
insert into USES (c_id, e_id)
values (321, 155);
insert into USES (c_id, e_id)
values (322, 360);
insert into USES (c_id, e_id)
values (325, 289);
insert into USES (c_id, e_id)
values (327, 161);
insert into USES (c_id, e_id)
values (330, 83);
insert into USES (c_id, e_id)
values (330, 308);
insert into USES (c_id, e_id)
values (332, 112);
insert into USES (c_id, e_id)
values (332, 172);
insert into USES (c_id, e_id)
values (332, 215);
insert into USES (c_id, e_id)
values (333, 36);
insert into USES (c_id, e_id)
values (335, 201);
insert into USES (c_id, e_id)
values (335, 378);
insert into USES (c_id, e_id)
values (337, 131);
insert into USES (c_id, e_id)
values (339, 242);
insert into USES (c_id, e_id)
values (339, 272);
insert into USES (c_id, e_id)
values (340, 347);
insert into USES (c_id, e_id)
values (341, 298);
insert into USES (c_id, e_id)
values (342, 372);
insert into USES (c_id, e_id)
values (343, 218);
insert into USES (c_id, e_id)
values (345, 212);
insert into USES (c_id, e_id)
values (347, 87);
insert into USES (c_id, e_id)
values (349, 32);
insert into USES (c_id, e_id)
values (350, 85);
insert into USES (c_id, e_id)
values (350, 129);
insert into USES (c_id, e_id)
values (350, 213);
insert into USES (c_id, e_id)
values (350, 249);
insert into USES (c_id, e_id)
values (350, 375);
insert into USES (c_id, e_id)
values (350, 379);
insert into USES (c_id, e_id)
values (351, 331);
insert into USES (c_id, e_id)
values (352, 98);
insert into USES (c_id, e_id)
values (352, 287);
insert into USES (c_id, e_id)
values (353, 362);
insert into USES (c_id, e_id)
values (354, 335);
insert into USES (c_id, e_id)
values (355, 3);
insert into USES (c_id, e_id)
values (355, 7);
insert into USES (c_id, e_id)
values (355, 103);
insert into USES (c_id, e_id)
values (356, 287);
insert into USES (c_id, e_id)
values (356, 343);
insert into USES (c_id, e_id)
values (357, 21);
insert into USES (c_id, e_id)
values (358, 47);
insert into USES (c_id, e_id)
values (358, 312);
insert into USES (c_id, e_id)
values (359, 126);
insert into USES (c_id, e_id)
values (360, 125);
insert into USES (c_id, e_id)
values (360, 182);
insert into USES (c_id, e_id)
values (360, 287);
insert into USES (c_id, e_id)
values (361, 237);
insert into USES (c_id, e_id)
values (363, 400);
insert into USES (c_id, e_id)
values (365, 86);
insert into USES (c_id, e_id)
values (367, 205);
insert into USES (c_id, e_id)
values (368, 154);
insert into USES (c_id, e_id)
values (369, 220);
insert into USES (c_id, e_id)
values (370, 217);
insert into USES (c_id, e_id)
values (371, 82);
insert into USES (c_id, e_id)
values (373, 103);
insert into USES (c_id, e_id)
values (375, 55);
insert into USES (c_id, e_id)
values (376, 14);
insert into USES (c_id, e_id)
values (376, 59);
insert into USES (c_id, e_id)
values (376, 86);
insert into USES (c_id, e_id)
values (376, 268);
insert into USES (c_id, e_id)
values (377, 196);
insert into USES (c_id, e_id)
values (378, 270);
insert into USES (c_id, e_id)
values (378, 361);
insert into USES (c_id, e_id)
values (379, 124);
insert into USES (c_id, e_id)
values (379, 135);
insert into USES (c_id, e_id)
values (381, 245);
insert into USES (c_id, e_id)
values (382, 294);
insert into USES (c_id, e_id)
values (382, 391);
insert into USES (c_id, e_id)
values (383, 122);
insert into USES (c_id, e_id)
values (383, 365);
insert into USES (c_id, e_id)
values (384, 20);
insert into USES (c_id, e_id)
values (384, 64);
insert into USES (c_id, e_id)
values (384, 143);
insert into USES (c_id, e_id)
values (384, 251);
insert into USES (c_id, e_id)
values (386, 189);
insert into USES (c_id, e_id)
values (388, 84);
insert into USES (c_id, e_id)
values (388, 321);
insert into USES (c_id, e_id)
values (389, 41);
insert into USES (c_id, e_id)
values (390, 145);
insert into USES (c_id, e_id)
values (391, 152);
insert into USES (c_id, e_id)
values (393, 43);
insert into USES (c_id, e_id)
values (393, 143);
insert into USES (c_id, e_id)
values (393, 173);
insert into USES (c_id, e_id)
values (394, 43);
insert into USES (c_id, e_id)
values (396, 119);
insert into USES (c_id, e_id)
values (396, 205);
insert into USES (c_id, e_id)
values (397, 315);
insert into USES (c_id, e_id)
values (397, 347);
insert into USES (c_id, e_id)
values (398, 326);
insert into USES (c_id, e_id)
values (399, 40);
insert into USES (c_id, e_id)
values (399, 126);
insert into USES (c_id, e_id)
values (399, 149);
insert into USES (c_id, e_id)
values (399, 267);
commit;
prompt 394 records loaded
prompt Enabling foreign key constraints for PARAMEDIC...
alter table PARAMEDIC enable constraint SYS_C009135;
prompt Enabling foreign key constraints for SHIFT...
alter table SHIFT enable constraint SYS_C009142;
prompt Enabling foreign key constraints for EVENT...
alter table EVENT enable constraint SYS_C009149;
prompt Enabling foreign key constraints for AMBUTOEVENT...
alter table AMBUTOEVENT enable constraint SYS_C009153;
alter table AMBUTOEVENT enable constraint SYS_C009154;
prompt Enabling foreign key constraints for STUDENTSGROUP...
alter table STUDENTSGROUP enable constraint SYS_C009036;
alter table STUDENTSGROUP enable constraint SYS_C009037;
alter table STUDENTSGROUP enable constraint SYS_C009038;
prompt Enabling foreign key constraints for BELONGS...
alter table BELONGS enable constraint FK_BELONGS_VOLUNTEER;
alter table BELONGS enable constraint SYS_C009042;
prompt Enabling foreign key constraints for DRIVER...
alter table DRIVER enable constraint SYS_C009158;
prompt Enabling foreign key constraints for DRIVERINSHIFT...
alter table DRIVERINSHIFT enable constraint SYS_C009162;
alter table DRIVERINSHIFT enable constraint SYS_C009163;
prompt Enabling foreign key constraints for DRIVERTOAMBU...
alter table DRIVERTOAMBU enable constraint SYS_C009167;
alter table DRIVERTOAMBU enable constraint SYS_C009168;
prompt Enabling foreign key constraints for HAS...
alter table HAS enable constraint SYS_C009195;
alter table HAS enable constraint SYS_C009196;
prompt Enabling foreign key constraints for MEDIC...
alter table MEDIC enable constraint SYS_C009172;
prompt Enabling foreign key constraints for MADICINSHIFT...
alter table MADICINSHIFT enable constraint SYS_C009176;
alter table MADICINSHIFT enable constraint SYS_C009177;
prompt Enabling foreign key constraints for TEACHES_THE...
alter table TEACHES_THE enable constraint SYS_C009053;
alter table TEACHES_THE enable constraint SYS_C009054;
prompt Enabling foreign key constraints for USES...
alter table USES enable constraint SYS_C009058;
alter table USES enable constraint SYS_C009059;
prompt Enabling triggers for AMBULANS...
alter table AMBULANS enable all triggers;
prompt Enabling triggers for VOLUNTEER...
alter table VOLUNTEER enable all triggers;
prompt Enabling triggers for PARAMEDIC...
alter table PARAMEDIC enable all triggers;
prompt Enabling triggers for SHIFT...
alter table SHIFT enable all triggers;
prompt Enabling triggers for EVENT...
alter table EVENT enable all triggers;
prompt Enabling triggers for AMBUTOEVENT...
alter table AMBUTOEVENT enable all triggers;
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
prompt Enabling triggers for DRIVER...
alter table DRIVER enable all triggers;
prompt Enabling triggers for DRIVERINSHIFT...
alter table DRIVERINSHIFT enable all triggers;
prompt Enabling triggers for DRIVERTOAMBU...
alter table DRIVERTOAMBU enable all triggers;
prompt Enabling triggers for EQUIPMENT...
alter table EQUIPMENT enable all triggers;
prompt Enabling triggers for HAS...
alter table HAS enable all triggers;
prompt Enabling triggers for MEDIC...
alter table MEDIC enable all triggers;
prompt Enabling triggers for MADICINSHIFT...
alter table MADICINSHIFT enable all triggers;
prompt Enabling triggers for TEACHES_THE...
alter table TEACHES_THE enable all triggers;
prompt Enabling triggers for USES...
alter table USES enable all triggers;
set feedback on
set define on
prompt Done.
