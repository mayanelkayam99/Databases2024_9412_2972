prompt PL/SQL Developer import file
prompt Created on יום שישי 14 יוני 2024 by DELL
set feedback off
set define off
prompt Creating PARTICIPANTS...
create table PARTICIPANTS
(
  p_name VARCHAR2(30) not null,
  p_date DATE not null,
  p_id   NUMBER(10) not null,
  p_role VARCHAR2(30) not null,
  gender VARCHAR2(30) not null,
  age    NUMBER
);
alter table PARTICIPANTS
  add primary key (P_ID)
  ;
alter table PARTICIPANTS
  add constraint CHK_P_ROLE_VALUES
  check (p_role IN ('Certified Nurse','First Responder','EMT','Paramedic'));

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
alter table EQUIPMENT
  add constraint CHK_AMOUNT_NONNEGATIVE
  check (amount>=0);

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
alter table STUDENTSGROUP disable constraint SYS_C008489;
alter table STUDENTSGROUP disable constraint SYS_C008490;
alter table STUDENTSGROUP disable constraint SYS_C008491;
prompt Disabling foreign key constraints for BELONGS...
alter table BELONGS disable constraint SYS_C008500;
alter table BELONGS disable constraint SYS_C008501;
prompt Disabling foreign key constraints for TEACHES_THE...
alter table TEACHES_THE disable constraint SYS_C008505;
alter table TEACHES_THE disable constraint SYS_C008506;
prompt Disabling foreign key constraints for USES...
alter table USES disable constraint SYS_C008495;
alter table USES disable constraint SYS_C008496;
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
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Antonio Satriani', to_date('20-06-1972', 'dd-mm-yyyy'), 500, 'Paramedic', 'female', 52);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Percy Bonham', to_date('18-07-1976', 'dd-mm-yyyy'), 501, 'First Responder', 'male', 48);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('James Hall', to_date('30-06-1981', 'dd-mm-yyyy'), 502, 'Paramedic', 'female', 43);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Nicole Pleasure', to_date('08-11-1993', 'dd-mm-yyyy'), 503, 'Certified Nurse', 'male', 31);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Sean Applegate', to_date('30-05-1985', 'dd-mm-yyyy'), 504, 'Paramedic', 'male', 39);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Kate Head', to_date('25-05-1979', 'dd-mm-yyyy'), 505, 'First Responder', 'female', 45);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Emmylou Orlando', to_date('23-01-1976', 'dd-mm-yyyy'), 506, 'First Responder', 'female', 48);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Maria Giamatti', to_date('05-01-1972', 'dd-mm-yyyy'), 507, 'Certified Nurse', 'male', 52);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Jake Krumholtz', to_date('15-02-1979', 'dd-mm-yyyy'), 508, 'EMT', 'female', 45);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Avenged Gambon', to_date('18-06-1986', 'dd-mm-yyyy'), 509, 'Certified Nurse', 'female', 38);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Tommy Lunch', to_date('31-08-1984', 'dd-mm-yyyy'), 510, 'EMT', 'male', 40);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Carol Mueller-Stahl', to_date('11-02-1978', 'dd-mm-yyyy'), 511, 'EMT', 'female', 46);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Martin Trejo', to_date('13-05-1984', 'dd-mm-yyyy'), 512, 'Certified Nurse', 'female', 40);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Freddie Hartnett', to_date('23-01-1985', 'dd-mm-yyyy'), 513, 'First Responder', 'male', 39);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Angela Bedelia', to_date('07-06-1990', 'dd-mm-yyyy'), 514, 'First Responder', 'male', 34);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Roberta Hauser', to_date('19-02-1970', 'dd-mm-yyyy'), 515, 'Certified Nurse', 'male', 54);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Parker Herndon', to_date('18-07-1982', 'dd-mm-yyyy'), 516, 'EMT', 'male', 42);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Herbie English', to_date('15-06-1999', 'dd-mm-yyyy'), 517, 'First Responder', 'female', 25);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Harris Kenoly', to_date('02-07-1990', 'dd-mm-yyyy'), 518, 'First Responder', 'female', 34);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Woody Sossamon', to_date('25-04-1976', 'dd-mm-yyyy'), 519, 'Paramedic', 'female', 48);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Eugene Moss', to_date('10-05-1973', 'dd-mm-yyyy'), 520, 'First Responder', 'male', 51);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Samantha Kattan', to_date('01-12-1997', 'dd-mm-yyyy'), 521, 'First Responder', 'female', 27);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Anna Loring', to_date('12-03-1977', 'dd-mm-yyyy'), 522, 'Paramedic', 'male', 47);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Terrence Hatfield', to_date('25-10-1982', 'dd-mm-yyyy'), 523, 'EMT', 'male', 42);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Sam Cherry', to_date('18-09-1975', 'dd-mm-yyyy'), 524, 'First Responder', 'male', 49);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Nigel Levert', to_date('01-10-1987', 'dd-mm-yyyy'), 525, 'EMT', 'male', 37);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Kirsten Wheel', to_date('24-11-1976', 'dd-mm-yyyy'), 526, 'Certified Nurse', 'female', 48);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Desmond Aiken', to_date('20-09-1998', 'dd-mm-yyyy'), 527, 'Certified Nurse', 'female', 26);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Leon Conners', to_date('24-05-1977', 'dd-mm-yyyy'), 528, 'First Responder', 'female', 47);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Miriam Shaw', to_date('24-05-1971', 'dd-mm-yyyy'), 529, 'First Responder', 'male', 53);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Domingo Isaacs', to_date('08-07-1990', 'dd-mm-yyyy'), 530, 'Certified Nurse', 'female', 34);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Kid Osborne', to_date('27-05-1975', 'dd-mm-yyyy'), 531, 'First Responder', 'male', 49);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Ani Fiennes', to_date('17-01-1996', 'dd-mm-yyyy'), 532, 'Paramedic', 'female', 28);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Hank Crowe', to_date('10-07-1984', 'dd-mm-yyyy'), 533, 'Certified Nurse', 'female', 40);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Lily Satriani', to_date('06-12-1986', 'dd-mm-yyyy'), 534, 'First Responder', 'male', 38);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Kiefer Reilly', to_date('01-10-1984', 'dd-mm-yyyy'), 535, 'EMT', 'male', 40);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Seth Studi', to_date('09-09-1971', 'dd-mm-yyyy'), 536, 'Paramedic', 'male', 53);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Lenny Gore', to_date('12-05-1994', 'dd-mm-yyyy'), 537, 'Paramedic', 'female', 30);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Howard Crouse', to_date('08-05-1988', 'dd-mm-yyyy'), 538, 'First Responder', 'male', 36);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Jet Christie', to_date('22-05-1988', 'dd-mm-yyyy'), 539, 'Paramedic', 'female', 36);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Mena Buckingham', to_date('02-06-1998', 'dd-mm-yyyy'), 540, 'Certified Nurse', 'female', 26);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Lari Hyde', to_date('28-12-1983', 'dd-mm-yyyy'), 541, 'Paramedic', 'male', 41);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Richard Hubbard', to_date('04-01-1994', 'dd-mm-yyyy'), 542, 'Certified Nurse', 'male', 30);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Joseph Tsettos', to_date('17-04-1977', 'dd-mm-yyyy'), 543, 'First Responder', 'male', 47);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Nigel Wariner', to_date('29-05-1970', 'dd-mm-yyyy'), 544, 'Paramedic', 'male', 54);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Fats Zane', to_date('10-12-1985', 'dd-mm-yyyy'), 545, 'Certified Nurse', 'female', 39);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Fred Paul', to_date('13-01-1976', 'dd-mm-yyyy'), 546, 'EMT', 'female', 48);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Coley Fiennes', to_date('04-12-1978', 'dd-mm-yyyy'), 547, 'Certified Nurse', 'male', 46);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Maceo Latifah', to_date('24-11-1974', 'dd-mm-yyyy'), 548, 'EMT', 'female', 50);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('William Caviezel', to_date('20-11-1985', 'dd-mm-yyyy'), 549, 'Certified Nurse', 'female', 39);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Terry Kinnear', to_date('17-12-1978', 'dd-mm-yyyy'), 550, 'First Responder', 'male', 46);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Pierce Randal', to_date('25-05-1976', 'dd-mm-yyyy'), 551, 'First Responder', 'male', 48);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Armin Hidalgo', to_date('03-05-1982', 'dd-mm-yyyy'), 552, 'First Responder', 'female', 42);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Toni Osment', to_date('22-08-1984', 'dd-mm-yyyy'), 553, 'First Responder', 'female', 40);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Pamela Hiatt', to_date('13-10-1971', 'dd-mm-yyyy'), 554, 'Paramedic', 'male', 53);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Annie Brody', to_date('02-09-1971', 'dd-mm-yyyy'), 555, 'Paramedic', 'male', 53);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Chantי Howard', to_date('21-04-1971', 'dd-mm-yyyy'), 556, 'EMT', 'male', 53);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Clive Levine', to_date('26-04-1974', 'dd-mm-yyyy'), 557, 'First Responder', 'female', 50);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Vern Brooks', to_date('03-12-1978', 'dd-mm-yyyy'), 558, 'First Responder', 'female', 46);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Stewart Cassel', to_date('05-05-1982', 'dd-mm-yyyy'), 559, 'EMT', 'male', 42);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Percy Farrow', to_date('22-05-1983', 'dd-mm-yyyy'), 560, 'First Responder', 'male', 41);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Devon Ronstadt', to_date('22-11-1981', 'dd-mm-yyyy'), 561, 'EMT', 'male', 43);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Nicole Kidman', to_date('19-01-1974', 'dd-mm-yyyy'), 562, 'Paramedic', 'male', 50);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Debra Cervine', to_date('24-01-1979', 'dd-mm-yyyy'), 563, 'EMT', 'male', 45);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Kiefer Humphrey', to_date('05-09-1970', 'dd-mm-yyyy'), 564, 'First Responder', 'female', 54);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Miranda Bosco', to_date('18-12-1980', 'dd-mm-yyyy'), 565, 'Certified Nurse', 'female', 44);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Maury Bright', to_date('29-02-1988', 'dd-mm-yyyy'), 566, 'Certified Nurse', 'male', 36);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Val Blair', to_date('29-01-1988', 'dd-mm-yyyy'), 567, 'Paramedic', 'female', 36);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Andre Cornell', to_date('02-01-1996', 'dd-mm-yyyy'), 568, 'First Responder', 'female', 28);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Kimberly DeVita', to_date('21-12-1989', 'dd-mm-yyyy'), 569, 'EMT', 'male', 35);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Lari Hatosy', to_date('12-10-1990', 'dd-mm-yyyy'), 570, 'Paramedic', 'female', 34);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Lois Rispoli', to_date('17-12-1990', 'dd-mm-yyyy'), 571, 'Paramedic', 'male', 34);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Ramsey Mohr', to_date('13-08-1973', 'dd-mm-yyyy'), 572, 'Paramedic', 'male', 51);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Sam Dempsey', to_date('12-09-1992', 'dd-mm-yyyy'), 573, 'Certified Nurse', 'male', 32);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Henry Stanley', to_date('02-10-1980', 'dd-mm-yyyy'), 574, 'First Responder', 'male', 44);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Anne Weller', to_date('16-01-1981', 'dd-mm-yyyy'), 575, 'EMT', 'male', 43);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Busta Benet', to_date('03-06-1975', 'dd-mm-yyyy'), 576, 'Certified Nurse', 'male', 49);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Randall Campbell', to_date('13-04-1984', 'dd-mm-yyyy'), 577, 'Paramedic', 'female', 40);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Gin Pacino', to_date('30-06-1980', 'dd-mm-yyyy'), 578, 'First Responder', 'male', 44);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Franco DeVito', to_date('13-08-1973', 'dd-mm-yyyy'), 579, 'First Responder', 'female', 51);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Liv Tisdale', to_date('20-06-1975', 'dd-mm-yyyy'), 580, 'EMT', 'male', 49);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Teri Henstridge', to_date('22-07-1973', 'dd-mm-yyyy'), 581, 'Certified Nurse', 'female', 51);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Taryn Condition', to_date('11-02-1995', 'dd-mm-yyyy'), 582, 'First Responder', 'female', 29);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Lucy Caviezel', to_date('09-05-1984', 'dd-mm-yyyy'), 583, 'Certified Nurse', 'male', 40);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Rob Hyde', to_date('23-10-1982', 'dd-mm-yyyy'), 584, 'Paramedic', 'male', 42);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Arnold Secada', to_date('01-01-1990', 'dd-mm-yyyy'), 585, 'First Responder', 'male', 34);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Bonnie Elizondo', to_date('23-04-1975', 'dd-mm-yyyy'), 586, 'Certified Nurse', 'male', 49);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Hank Ali', to_date('30-01-1998', 'dd-mm-yyyy'), 587, 'Paramedic', 'female', 26);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Cyndi Margulies', to_date('02-06-1990', 'dd-mm-yyyy'), 588, 'First Responder', 'male', 34);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Faye Rispoli', to_date('25-01-1971', 'dd-mm-yyyy'), 589, 'Certified Nurse', 'female', 53);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Elijah Raye', to_date('14-06-1980', 'dd-mm-yyyy'), 590, 'EMT', 'female', 44);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Jesus Herndon', to_date('13-05-1987', 'dd-mm-yyyy'), 591, 'First Responder', 'female', 37);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Courtney Sinise', to_date('20-04-1985', 'dd-mm-yyyy'), 592, 'First Responder', 'male', 39);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Franz Ricci', to_date('21-02-1983', 'dd-mm-yyyy'), 593, 'Certified Nurse', 'female', 41);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Elias Santana', to_date('10-10-1995', 'dd-mm-yyyy'), 594, 'Paramedic', 'male', 29);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Rascal Avital', to_date('13-12-1987', 'dd-mm-yyyy'), 595, 'EMT', 'male', 37);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Janice Brosnan', to_date('17-06-1972', 'dd-mm-yyyy'), 596, 'Certified Nurse', 'female', 52);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Desmond Lindley', to_date('30-12-1976', 'dd-mm-yyyy'), 597, 'Paramedic', 'female', 48);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Mae Michael', to_date('15-01-1975', 'dd-mm-yyyy'), 598, 'First Responder', 'female', 49);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Roger Mirren', to_date('16-08-1975', 'dd-mm-yyyy'), 599, 'First Responder', 'female', 49);
commit;
prompt 100 records committed...
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Jann McDonnell', to_date('20-11-1972', 'dd-mm-yyyy'), 600, 'Paramedic', 'female', 52);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Harvey Ripley', to_date('06-12-1995', 'dd-mm-yyyy'), 601, 'EMT', 'female', 29);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Burt Magnuson', to_date('17-08-1997', 'dd-mm-yyyy'), 602, 'EMT', 'male', 27);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Maura Chappelle', to_date('25-06-1986', 'dd-mm-yyyy'), 603, 'EMT', 'female', 38);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Lynn Jane', to_date('16-03-1993', 'dd-mm-yyyy'), 604, 'EMT', 'male', 31);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Ricardo Pollack', to_date('06-06-1992', 'dd-mm-yyyy'), 605, 'EMT', 'female', 32);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Geena Gold', to_date('01-06-1986', 'dd-mm-yyyy'), 606, 'Certified Nurse', 'female', 38);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Wang Griggs', to_date('05-03-1970', 'dd-mm-yyyy'), 607, 'EMT', 'female', 54);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Karon Swank', to_date('04-03-1972', 'dd-mm-yyyy'), 608, 'Paramedic', 'male', 52);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Harvey Steenburgen', to_date('14-08-1976', 'dd-mm-yyyy'), 609, 'Certified Nurse', 'female', 48);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Geraldine Holm', to_date('27-05-1970', 'dd-mm-yyyy'), 610, 'Certified Nurse', 'female', 54);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Ben Lindo', to_date('14-02-1983', 'dd-mm-yyyy'), 611, 'EMT', 'male', 41);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Praga Joli', to_date('11-08-1986', 'dd-mm-yyyy'), 612, 'EMT', 'female', 38);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Brian Mortensen', to_date('05-04-1997', 'dd-mm-yyyy'), 613, 'Paramedic', 'male', 27);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Victor Bragg', to_date('02-06-1993', 'dd-mm-yyyy'), 614, 'EMT', 'male', 31);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Sean Patrick', to_date('07-04-1986', 'dd-mm-yyyy'), 615, 'Paramedic', 'female', 38);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Claire Dafoe', to_date('13-01-1987', 'dd-mm-yyyy'), 616, 'EMT', 'female', 37);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Ian Renfro', to_date('19-08-1973', 'dd-mm-yyyy'), 617, 'EMT', 'female', 51);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Katrin Lane', to_date('29-11-1977', 'dd-mm-yyyy'), 618, 'Certified Nurse', 'female', 47);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Teri Cockburn', to_date('13-05-1989', 'dd-mm-yyyy'), 619, 'Certified Nurse', 'male', 35);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Rachid Pitney', to_date('15-07-1990', 'dd-mm-yyyy'), 620, 'EMT', 'female', 34);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Will Richter', to_date('05-01-1974', 'dd-mm-yyyy'), 621, 'Certified Nurse', 'male', 50);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Joshua Forrest', to_date('14-02-1980', 'dd-mm-yyyy'), 622, 'EMT', 'male', 44);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Gilberto Snow', to_date('23-05-1971', 'dd-mm-yyyy'), 623, 'EMT', 'female', 53);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Simon Benet', to_date('19-02-1986', 'dd-mm-yyyy'), 624, 'Certified Nurse', 'male', 38);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Keanu Richter', to_date('06-02-1984', 'dd-mm-yyyy'), 625, 'EMT', 'male', 40);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Taryn Midler', to_date('16-08-1990', 'dd-mm-yyyy'), 626, 'First Responder', 'female', 34);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Daryl Kirshner', to_date('06-01-1974', 'dd-mm-yyyy'), 627, 'Paramedic', 'male', 50);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Kurtwood Mould', to_date('26-03-1985', 'dd-mm-yyyy'), 628, 'First Responder', 'female', 39);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Scott Gates', to_date('04-02-1986', 'dd-mm-yyyy'), 629, 'First Responder', 'female', 38);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Don Lopez', to_date('17-08-1971', 'dd-mm-yyyy'), 630, 'Paramedic', 'male', 53);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Juliet Culkin', to_date('03-10-1992', 'dd-mm-yyyy'), 631, 'Paramedic', 'male', 32);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Patricia Warburton', to_date('28-04-1997', 'dd-mm-yyyy'), 632, 'Certified Nurse', 'male', 27);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Angelina Howard', to_date('13-10-1976', 'dd-mm-yyyy'), 633, 'Paramedic', 'female', 48);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Alannah McGowan', to_date('20-11-1989', 'dd-mm-yyyy'), 634, 'Paramedic', 'male', 35);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Laura Tippe', to_date('25-10-1987', 'dd-mm-yyyy'), 635, 'EMT', 'male', 37);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Geoff Webb', to_date('24-08-1988', 'dd-mm-yyyy'), 636, 'Paramedic', 'female', 36);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Tcheky Harrelson', to_date('14-05-1980', 'dd-mm-yyyy'), 637, 'Paramedic', 'male', 44);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Kim Posener', to_date('28-09-1981', 'dd-mm-yyyy'), 638, 'Certified Nurse', 'female', 43);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Junior Caan', to_date('01-02-1984', 'dd-mm-yyyy'), 639, 'Paramedic', 'male', 40);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Miguel Robinson', to_date('22-11-1978', 'dd-mm-yyyy'), 640, 'Certified Nurse', 'female', 46);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Davy McGovern', to_date('04-05-1999', 'dd-mm-yyyy'), 641, 'Certified Nurse', 'male', 25);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Kenny Heche', to_date('19-01-1984', 'dd-mm-yyyy'), 642, 'First Responder', 'male', 40);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Colm Michaels', to_date('13-06-1997', 'dd-mm-yyyy'), 643, 'Paramedic', 'female', 27);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Caroline Irving', to_date('24-08-1988', 'dd-mm-yyyy'), 644, 'EMT', 'male', 36);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Murray Hawke', to_date('22-02-1974', 'dd-mm-yyyy'), 645, 'First Responder', 'male', 50);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Juan Mandrell', to_date('17-07-1992', 'dd-mm-yyyy'), 646, 'EMT', 'female', 32);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Josh Tillis', to_date('21-10-1981', 'dd-mm-yyyy'), 647, 'Paramedic', 'male', 43);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Jamie Jessee', to_date('25-09-1977', 'dd-mm-yyyy'), 648, 'Paramedic', 'female', 47);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Carole Bugnon', to_date('29-12-1979', 'dd-mm-yyyy'), 649, 'EMT', 'female', 45);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Tal Alexander', to_date('12-06-1996', 'dd-mm-yyyy'), 650, 'Certified Nurse', 'male', 28);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Annie Diggs', to_date('03-12-1998', 'dd-mm-yyyy'), 651, 'EMT', 'male', 26);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Wally Waite', to_date('03-02-1982', 'dd-mm-yyyy'), 652, 'Paramedic', 'female', 42);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Sissy Levert', to_date('05-07-1996', 'dd-mm-yyyy'), 653, 'First Responder', 'male', 28);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Sara Macy', to_date('13-10-1995', 'dd-mm-yyyy'), 654, 'Paramedic', 'male', 29);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Boz Tilly', to_date('15-08-1980', 'dd-mm-yyyy'), 655, 'Certified Nurse', 'female', 44);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Swoosie Tippe', to_date('11-05-1974', 'dd-mm-yyyy'), 656, 'Paramedic', 'male', 50);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Ted Aykroyd', to_date('29-07-1973', 'dd-mm-yyyy'), 657, 'Certified Nurse', 'female', 51);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Lucinda Conway', to_date('07-04-1995', 'dd-mm-yyyy'), 658, 'Paramedic', 'male', 29);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Jared Rickman', to_date('25-04-1990', 'dd-mm-yyyy'), 659, 'EMT', 'male', 34);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Kurtwood Sainte-Marie', to_date('19-10-1970', 'dd-mm-yyyy'), 660, 'Certified Nurse', 'female', 54);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Kenny Goldblum', to_date('27-01-1994', 'dd-mm-yyyy'), 661, 'Paramedic', 'male', 30);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Boyd Sutherland', to_date('14-03-1976', 'dd-mm-yyyy'), 662, 'Certified Nurse', 'male', 48);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Victoria Mann', to_date('16-06-1978', 'dd-mm-yyyy'), 663, 'First Responder', 'female', 46);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('France Gallagher', to_date('10-10-1984', 'dd-mm-yyyy'), 664, 'First Responder', 'male', 40);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Heath Kingsley', to_date('02-12-1981', 'dd-mm-yyyy'), 665, 'EMT', 'male', 43);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Miles Woodard', to_date('13-04-1975', 'dd-mm-yyyy'), 666, 'EMT', 'male', 49);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Lynn Fender', to_date('29-11-1983', 'dd-mm-yyyy'), 667, 'Paramedic', 'female', 41);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Liam Kelly', to_date('12-05-1974', 'dd-mm-yyyy'), 668, 'Certified Nurse', 'male', 50);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Javon Dunaway', to_date('15-01-1971', 'dd-mm-yyyy'), 669, 'Certified Nurse', 'male', 53);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Candice Carmen', to_date('11-09-1986', 'dd-mm-yyyy'), 670, 'EMT', 'female', 38);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Tamala McFadden', to_date('09-10-1970', 'dd-mm-yyyy'), 671, 'Certified Nurse', 'male', 54);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Kiefer Roberts', to_date('15-04-1999', 'dd-mm-yyyy'), 672, 'EMT', 'female', 25);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Sam Wagner', to_date('31-08-1978', 'dd-mm-yyyy'), 673, 'Paramedic', 'female', 46);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Burton Condition', to_date('19-06-1981', 'dd-mm-yyyy'), 674, 'Paramedic', 'male', 43);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Dar Brown', to_date('11-09-1997', 'dd-mm-yyyy'), 675, 'EMT', 'male', 27);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Lenny Miller', to_date('15-11-1999', 'dd-mm-yyyy'), 676, 'Paramedic', 'male', 25);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Adina El-Saher', to_date('11-09-1973', 'dd-mm-yyyy'), 677, 'Paramedic', 'male', 51);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Martin Rodriguez', to_date('19-05-1985', 'dd-mm-yyyy'), 678, 'First Responder', 'male', 39);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Vickie Crystal', to_date('29-03-1984', 'dd-mm-yyyy'), 679, 'Certified Nurse', 'female', 40);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Jodie Berkoff', to_date('08-02-1998', 'dd-mm-yyyy'), 680, 'Certified Nurse', 'male', 26);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Garth Dunn', to_date('26-05-1988', 'dd-mm-yyyy'), 681, 'Paramedic', 'male', 36);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Neneh Gallant', to_date('28-06-1984', 'dd-mm-yyyy'), 682, 'Paramedic', 'male', 40);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Joanna Mathis', to_date('02-04-1996', 'dd-mm-yyyy'), 683, 'Certified Nurse', 'male', 28);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Harrison Gano', to_date('02-07-1998', 'dd-mm-yyyy'), 684, 'Paramedic', 'female', 26);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Ernie Mandrell', to_date('05-04-1979', 'dd-mm-yyyy'), 685, 'First Responder', 'female', 45);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Tobey Lonsdale', to_date('05-07-1974', 'dd-mm-yyyy'), 686, 'First Responder', 'male', 50);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Embeth Haysbert', to_date('05-11-1999', 'dd-mm-yyyy'), 687, 'EMT', 'male', 25);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Kimberly Atkins', to_date('26-11-1983', 'dd-mm-yyyy'), 688, 'Paramedic', 'female', 41);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Anna Bragg', to_date('18-03-1980', 'dd-mm-yyyy'), 689, 'Paramedic', 'female', 44);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Gabrielle Spader', to_date('28-01-1998', 'dd-mm-yyyy'), 690, 'Paramedic', 'female', 26);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Carlos Fierstein', to_date('30-12-1990', 'dd-mm-yyyy'), 691, 'EMT', 'male', 34);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('William Scheider', to_date('08-12-1988', 'dd-mm-yyyy'), 692, 'EMT', 'female', 36);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Jackie Holliday', to_date('04-02-1989', 'dd-mm-yyyy'), 693, 'Paramedic', 'female', 35);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Janice Lachey', to_date('08-04-1991', 'dd-mm-yyyy'), 694, 'EMT', 'male', 33);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Radney Fariq', to_date('15-04-1975', 'dd-mm-yyyy'), 695, 'Paramedic', 'male', 49);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Bryan Wong', to_date('05-03-1971', 'dd-mm-yyyy'), 696, 'First Responder', 'female', 53);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Denzel Vaughan', to_date('30-07-1995', 'dd-mm-yyyy'), 697, 'Paramedic', 'male', 29);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Zooey Rush', to_date('27-03-1988', 'dd-mm-yyyy'), 698, 'Paramedic', 'male', 36);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Hope Cumming', to_date('23-10-1999', 'dd-mm-yyyy'), 699, 'Paramedic', 'female', 25);
commit;
prompt 200 records committed...
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Eileen Drive', to_date('29-09-1987', 'dd-mm-yyyy'), 700, 'First Responder', 'male', 37);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Emerson Sylvian', to_date('24-04-1996', 'dd-mm-yyyy'), 701, 'EMT', 'female', 28);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Lara Berenger', to_date('15-06-1980', 'dd-mm-yyyy'), 702, 'Paramedic', 'female', 44);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Lindsay Malone', to_date('25-10-1996', 'dd-mm-yyyy'), 703, 'EMT', 'female', 28);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Christmas Murphy', to_date('10-07-1992', 'dd-mm-yyyy'), 704, 'Paramedic', 'male', 32);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Earl Scheider', to_date('03-09-1970', 'dd-mm-yyyy'), 705, 'Certified Nurse', 'female', 54);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Helen Harris', to_date('21-05-1994', 'dd-mm-yyyy'), 706, 'EMT', 'female', 30);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Junior Rain', to_date('21-01-1986', 'dd-mm-yyyy'), 707, 'EMT', 'female', 38);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Rodney Collie', to_date('20-07-1986', 'dd-mm-yyyy'), 708, 'First Responder', 'male', 38);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Maggie Tate', to_date('01-10-1977', 'dd-mm-yyyy'), 709, 'First Responder', 'male', 47);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Frederic Quinn', to_date('16-01-1999', 'dd-mm-yyyy'), 710, 'Certified Nurse', 'male', 25);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Horace Tate', to_date('09-06-1990', 'dd-mm-yyyy'), 711, 'Paramedic', 'female', 34);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Ruth Collie', to_date('26-10-1971', 'dd-mm-yyyy'), 712, 'Certified Nurse', 'male', 53);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Austin Haggard', to_date('05-01-1973', 'dd-mm-yyyy'), 713, 'First Responder', 'female', 51);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Sally Lynskey', to_date('04-05-1982', 'dd-mm-yyyy'), 714, 'EMT', 'male', 42);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Chely Burns', to_date('12-12-1986', 'dd-mm-yyyy'), 715, 'First Responder', 'male', 38);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Stellan Stamp', to_date('19-02-1976', 'dd-mm-yyyy'), 716, 'EMT', 'female', 48);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Edwin Visnjic', to_date('21-04-1970', 'dd-mm-yyyy'), 717, 'Paramedic', 'male', 54);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Kiefer Oakenfold', to_date('04-08-1972', 'dd-mm-yyyy'), 718, 'Certified Nurse', 'male', 52);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Liquid Love', to_date('13-06-1982', 'dd-mm-yyyy'), 719, 'Certified Nurse', 'female', 42);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Charlize Rossellini', to_date('07-03-1974', 'dd-mm-yyyy'), 720, 'Paramedic', 'male', 50);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Stewart Platt', to_date('03-07-1982', 'dd-mm-yyyy'), 721, 'Certified Nurse', 'female', 42);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Bridgette Belles', to_date('27-02-1999', 'dd-mm-yyyy'), 722, 'Certified Nurse', 'female', 25);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Ryan Nugent', to_date('19-04-1981', 'dd-mm-yyyy'), 723, 'First Responder', 'female', 43);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Gwyneth Goldberg', to_date('24-05-1987', 'dd-mm-yyyy'), 724, 'First Responder', 'male', 37);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Trick Hayek', to_date('30-08-1991', 'dd-mm-yyyy'), 725, 'EMT', 'male', 33);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Frances Balin', to_date('18-07-1993', 'dd-mm-yyyy'), 726, 'Certified Nurse', 'female', 31);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Amy Tate', to_date('27-05-1979', 'dd-mm-yyyy'), 727, 'First Responder', 'female', 45);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Radney Heatherly', to_date('29-11-1992', 'dd-mm-yyyy'), 728, 'Paramedic', 'male', 32);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Helen McCoy', to_date('30-10-1996', 'dd-mm-yyyy'), 729, 'Certified Nurse', 'female', 28);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Jonathan Moreno', to_date('30-11-1999', 'dd-mm-yyyy'), 730, 'Paramedic', 'female', 25);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Shawn Colton', to_date('29-08-1976', 'dd-mm-yyyy'), 731, 'First Responder', 'female', 48);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Ron Macy', to_date('26-02-1999', 'dd-mm-yyyy'), 732, 'First Responder', 'male', 25);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Brian Fox', to_date('29-05-1985', 'dd-mm-yyyy'), 733, 'EMT', 'female', 39);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Jonny Gellar', to_date('04-06-1991', 'dd-mm-yyyy'), 734, 'EMT', 'male', 33);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Vienna Conway', to_date('29-05-1977', 'dd-mm-yyyy'), 735, 'Paramedic', 'female', 47);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Robin Sevenfold', to_date('31-03-1993', 'dd-mm-yyyy'), 736, 'Paramedic', 'male', 31);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Thora Goldwyn', to_date('09-04-1981', 'dd-mm-yyyy'), 737, 'EMT', 'male', 43);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Luis Ranger', to_date('09-04-1976', 'dd-mm-yyyy'), 738, 'Paramedic', 'male', 48);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Eddie Hauser', to_date('27-10-1985', 'dd-mm-yyyy'), 739, 'Paramedic', 'female', 39);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Lee Rivers', to_date('26-11-1982', 'dd-mm-yyyy'), 740, 'EMT', 'male', 42);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Dom Spears', to_date('25-06-1970', 'dd-mm-yyyy'), 741, 'First Responder', 'male', 54);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Dorry Eat World', to_date('11-11-1974', 'dd-mm-yyyy'), 742, 'Paramedic', 'male', 50);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Jerry Cobbs', to_date('05-11-1980', 'dd-mm-yyyy'), 743, 'Paramedic', 'female', 44);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Paula Bragg', to_date('28-12-1972', 'dd-mm-yyyy'), 744, 'EMT', 'female', 52);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Gerald Grant', to_date('30-10-1992', 'dd-mm-yyyy'), 745, 'EMT', 'female', 32);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Ricardo Gayle', to_date('31-12-1996', 'dd-mm-yyyy'), 746, 'Certified Nurse', 'male', 28);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Julianna Jonze', to_date('11-09-1982', 'dd-mm-yyyy'), 747, 'First Responder', 'male', 42);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Ronnie Lachey', to_date('06-05-1994', 'dd-mm-yyyy'), 748, 'Paramedic', 'female', 30);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Laura Dalton', to_date('10-01-1975', 'dd-mm-yyyy'), 749, 'EMT', 'female', 49);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Nathan Niven', to_date('15-07-1975', 'dd-mm-yyyy'), 750, 'First Responder', 'female', 49);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Ossie Vassar', to_date('30-05-1970', 'dd-mm-yyyy'), 751, 'EMT', 'female', 54);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Franco Darren', to_date('23-01-1980', 'dd-mm-yyyy'), 752, 'First Responder', 'male', 44);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Stanley Wahlberg', to_date('14-10-1998', 'dd-mm-yyyy'), 753, 'First Responder', 'male', 26);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Vin Fehr', to_date('30-04-1980', 'dd-mm-yyyy'), 754, 'Paramedic', 'male', 44);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Tracy Lineback', to_date('22-07-1987', 'dd-mm-yyyy'), 755, 'EMT', 'male', 37);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Alannah Mahoney', to_date('18-11-1981', 'dd-mm-yyyy'), 756, 'Certified Nurse', 'male', 43);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Nile Clarkson', to_date('16-08-1994', 'dd-mm-yyyy'), 757, 'EMT', 'female', 30);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Lila Arden', to_date('21-12-1993', 'dd-mm-yyyy'), 758, 'EMT', 'female', 31);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Joan Ribisi', to_date('22-07-1970', 'dd-mm-yyyy'), 759, 'EMT', 'male', 54);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Kurtwood Del Toro', to_date('10-11-1996', 'dd-mm-yyyy'), 760, 'EMT', 'female', 28);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Leonardo Winslet', to_date('10-08-1989', 'dd-mm-yyyy'), 761, 'Certified Nurse', 'female', 35);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Anthony Polito', to_date('07-03-1978', 'dd-mm-yyyy'), 762, 'First Responder', 'male', 46);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Edwin Guilfoyle', to_date('07-09-1981', 'dd-mm-yyyy'), 763, 'Paramedic', 'male', 43);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Vivica Loggia', to_date('07-12-1971', 'dd-mm-yyyy'), 764, 'Paramedic', 'female', 53);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Demi Busey', to_date('19-11-1974', 'dd-mm-yyyy'), 765, 'Certified Nurse', 'male', 50);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Sinead Broderick', to_date('20-03-1977', 'dd-mm-yyyy'), 766, 'First Responder', 'male', 47);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Maria Aiken', to_date('27-04-1976', 'dd-mm-yyyy'), 767, 'First Responder', 'female', 48);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Roberta Koteas', to_date('24-07-1991', 'dd-mm-yyyy'), 768, 'Certified Nurse', 'male', 33);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Percy Allan', to_date('22-03-1996', 'dd-mm-yyyy'), 769, 'EMT', 'male', 28);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Allison Bacharach', to_date('18-04-1982', 'dd-mm-yyyy'), 770, 'Paramedic', 'male', 42);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Kristin Brandt', to_date('14-05-1981', 'dd-mm-yyyy'), 771, 'First Responder', 'male', 43);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Gabrielle Leachman', to_date('19-02-1971', 'dd-mm-yyyy'), 772, 'Paramedic', 'male', 53);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Sinead Saucedo', to_date('29-05-1998', 'dd-mm-yyyy'), 773, 'Paramedic', 'male', 26);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Stewart Beatty', to_date('18-05-1978', 'dd-mm-yyyy'), 774, 'EMT', 'female', 46);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Gino Brown', to_date('09-07-1979', 'dd-mm-yyyy'), 775, 'Paramedic', 'male', 45);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Aida Garza', to_date('27-03-1986', 'dd-mm-yyyy'), 776, 'Certified Nurse', 'male', 38);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Carl Ticotin', to_date('10-09-1981', 'dd-mm-yyyy'), 777, 'Paramedic', 'female', 43);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Kim Warden', to_date('17-03-1972', 'dd-mm-yyyy'), 778, 'EMT', 'male', 52);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Celia Squier', to_date('09-04-1971', 'dd-mm-yyyy'), 779, 'Paramedic', 'male', 53);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Stephen Cartlidge', to_date('13-06-1975', 'dd-mm-yyyy'), 780, 'Paramedic', 'female', 49);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Liam Kane', to_date('28-02-1986', 'dd-mm-yyyy'), 781, 'Paramedic', 'male', 38);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Remy Matarazzo', to_date('27-01-1988', 'dd-mm-yyyy'), 782, 'Certified Nurse', 'male', 36);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Leo Mazar', to_date('20-04-1974', 'dd-mm-yyyy'), 783, 'Paramedic', 'female', 50);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Molly Buckingham', to_date('21-11-1991', 'dd-mm-yyyy'), 784, 'Certified Nurse', 'male', 33);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Taye Broza', to_date('30-03-1997', 'dd-mm-yyyy'), 785, 'Certified Nurse', 'female', 27);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Udo Chaplin', to_date('13-02-1995', 'dd-mm-yyyy'), 786, 'EMT', 'male', 29);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Marley Reilly', to_date('13-03-1997', 'dd-mm-yyyy'), 787, 'Certified Nurse', 'male', 27);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Christopher Adler', to_date('01-02-1996', 'dd-mm-yyyy'), 788, 'EMT', 'male', 28);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Kevin McPherson', to_date('03-03-1993', 'dd-mm-yyyy'), 789, 'First Responder', 'female', 31);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Ricardo Reynolds', to_date('16-09-1977', 'dd-mm-yyyy'), 790, 'Certified Nurse', 'male', 47);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Garland Coleman', to_date('04-02-1972', 'dd-mm-yyyy'), 791, 'Paramedic', 'female', 52);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Freddie Gough', to_date('09-05-1990', 'dd-mm-yyyy'), 792, 'Certified Nurse', 'female', 34);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Joanna Iglesias', to_date('01-09-1972', 'dd-mm-yyyy'), 793, 'Certified Nurse', 'male', 52);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Dave Sirtis', to_date('19-08-1977', 'dd-mm-yyyy'), 794, 'First Responder', 'male', 47);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Cornell Meniketti', to_date('20-03-1998', 'dd-mm-yyyy'), 795, 'Certified Nurse', 'male', 26);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Stanley Garcia', to_date('14-05-1982', 'dd-mm-yyyy'), 796, 'Certified Nurse', 'male', 42);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Nicolas Griffin', to_date('20-08-1988', 'dd-mm-yyyy'), 797, 'Paramedic', 'female', 36);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Veruca Schiff', to_date('02-09-1974', 'dd-mm-yyyy'), 798, 'First Responder', 'male', 50);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Cary Williams', to_date('02-12-1995', 'dd-mm-yyyy'), 799, 'First Responder', 'male', 29);
commit;
prompt 300 records committed...
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Miki Krumholtz', to_date('16-01-1993', 'dd-mm-yyyy'), 800, 'Paramedic', 'female', 31);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Brad Kimball', to_date('16-02-1981', 'dd-mm-yyyy'), 801, 'EMT', 'male', 43);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Wayne Caviezel', to_date('10-05-1989', 'dd-mm-yyyy'), 802, 'Certified Nurse', 'female', 35);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Chi Yorn', to_date('04-03-1978', 'dd-mm-yyyy'), 803, 'First Responder', 'female', 46);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Leelee Watley', to_date('31-05-1971', 'dd-mm-yyyy'), 804, 'Paramedic', 'female', 53);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Mel Harper', to_date('25-05-1990', 'dd-mm-yyyy'), 805, 'EMT', 'male', 34);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Jet Margulies', to_date('13-05-1989', 'dd-mm-yyyy'), 806, 'EMT', 'female', 35);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Tilda Parker', to_date('04-02-1994', 'dd-mm-yyyy'), 807, 'Certified Nurse', 'female', 30);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Breckin Neil', to_date('12-08-1996', 'dd-mm-yyyy'), 808, 'First Responder', 'female', 28);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Gaby Jeter', to_date('17-04-1988', 'dd-mm-yyyy'), 809, 'Certified Nurse', 'female', 36);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Kirk Dafoe', to_date('01-06-1998', 'dd-mm-yyyy'), 810, 'Certified Nurse', 'male', 26);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Brian Crowe', to_date('20-07-1976', 'dd-mm-yyyy'), 811, 'Certified Nurse', 'male', 48);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Cole Ness', to_date('21-09-1984', 'dd-mm-yyyy'), 812, 'EMT', 'male', 40);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Johnnie Eckhart', to_date('14-10-1983', 'dd-mm-yyyy'), 813, 'First Responder', 'male', 41);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Hookah Sayer', to_date('23-02-1974', 'dd-mm-yyyy'), 814, 'Paramedic', 'female', 50);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Vincent Springfield', to_date('15-04-1973', 'dd-mm-yyyy'), 815, 'First Responder', 'male', 51);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Beth Tilly', to_date('23-06-1985', 'dd-mm-yyyy'), 816, 'Certified Nurse', 'female', 39);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Frank Robards', to_date('23-11-1985', 'dd-mm-yyyy'), 817, 'First Responder', 'male', 39);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Burton Eder', to_date('16-10-1988', 'dd-mm-yyyy'), 818, 'Certified Nurse', 'female', 36);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Sylvester Foster', to_date('28-09-1988', 'dd-mm-yyyy'), 819, 'EMT', 'female', 36);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Vince Quaid', to_date('28-08-1971', 'dd-mm-yyyy'), 820, 'EMT', 'female', 53);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Hal Negbaur', to_date('03-11-1984', 'dd-mm-yyyy'), 821, 'Certified Nurse', 'male', 40);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('George Herrmann', to_date('16-02-1994', 'dd-mm-yyyy'), 822, 'Paramedic', 'female', 30);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Juliette Feliciano', to_date('15-12-1990', 'dd-mm-yyyy'), 823, 'First Responder', 'male', 34);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Merrilee Spector', to_date('12-03-1981', 'dd-mm-yyyy'), 824, 'Paramedic', 'female', 43);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Nikka Bale', to_date('17-08-1999', 'dd-mm-yyyy'), 825, 'EMT', 'male', 25);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Vienna Gyllenhaal', to_date('29-07-1989', 'dd-mm-yyyy'), 826, 'EMT', 'female', 35);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Lennie Gershon', to_date('03-09-1985', 'dd-mm-yyyy'), 827, 'Paramedic', 'male', 39);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Brad Bachman', to_date('26-09-1979', 'dd-mm-yyyy'), 828, 'EMT', 'female', 45);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Elle Osborne', to_date('01-12-1977', 'dd-mm-yyyy'), 829, 'Certified Nurse', 'female', 47);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Davis Eat World', to_date('05-11-1979', 'dd-mm-yyyy'), 830, 'First Responder', 'male', 45);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Daryl Holm', to_date('04-03-1977', 'dd-mm-yyyy'), 831, 'Paramedic', 'male', 47);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Adrien Hersh', to_date('28-09-1988', 'dd-mm-yyyy'), 832, 'Paramedic', 'male', 36);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Rebeka Playboys', to_date('07-06-1971', 'dd-mm-yyyy'), 833, 'First Responder', 'female', 53);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Raymond Adler', to_date('26-01-1986', 'dd-mm-yyyy'), 834, 'Paramedic', 'female', 38);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Rufus Hershey', to_date('20-10-1972', 'dd-mm-yyyy'), 835, 'EMT', 'male', 52);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Lloyd Byrd', to_date('13-11-1981', 'dd-mm-yyyy'), 836, 'EMT', 'male', 43);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Taryn Dunaway', to_date('26-08-1997', 'dd-mm-yyyy'), 837, 'EMT', 'male', 27);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Terrence Cara', to_date('21-10-1991', 'dd-mm-yyyy'), 838, 'Certified Nurse', 'male', 33);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Lois Rodriguez', to_date('25-10-1985', 'dd-mm-yyyy'), 839, 'Paramedic', 'female', 39);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Carlos Vaughn', to_date('02-09-1989', 'dd-mm-yyyy'), 840, 'First Responder', 'male', 35);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Roberta Day', to_date('28-02-1996', 'dd-mm-yyyy'), 841, 'Certified Nurse', 'female', 28);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Roberta Lofgren', to_date('16-10-1982', 'dd-mm-yyyy'), 842, 'First Responder', 'female', 42);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Nicole Alda', to_date('02-07-1998', 'dd-mm-yyyy'), 843, 'Certified Nurse', 'male', 26);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Crystal Shue', to_date('05-06-1990', 'dd-mm-yyyy'), 844, 'Paramedic', 'female', 34);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Bret Reynolds', to_date('24-04-1995', 'dd-mm-yyyy'), 845, 'Certified Nurse', 'female', 29);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Holland Benson', to_date('04-12-1976', 'dd-mm-yyyy'), 846, 'First Responder', 'male', 48);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Tracy Macy', to_date('18-02-1975', 'dd-mm-yyyy'), 847, 'Certified Nurse', 'male', 49);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Joey Rowlands', to_date('08-02-1982', 'dd-mm-yyyy'), 848, 'Paramedic', 'female', 42);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Sophie Rubinek', to_date('11-08-1982', 'dd-mm-yyyy'), 849, 'Certified Nurse', 'female', 42);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Kirsten Holden', to_date('26-04-1978', 'dd-mm-yyyy'), 850, 'Certified Nurse', 'male', 46);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Mary-Louise Gere', to_date('23-10-1991', 'dd-mm-yyyy'), 851, 'Certified Nurse', 'male', 33);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Jean-Claude De Almeida', to_date('19-03-1978', 'dd-mm-yyyy'), 852, 'First Responder', 'female', 46);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Jonny Coyote', to_date('05-07-1999', 'dd-mm-yyyy'), 853, 'EMT', 'female', 25);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Garth Walken', to_date('29-10-1976', 'dd-mm-yyyy'), 854, 'Certified Nurse', 'female', 48);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Isaac Cromwell', to_date('05-09-1987', 'dd-mm-yyyy'), 855, 'EMT', 'female', 37);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Nile Alda', to_date('27-08-1977', 'dd-mm-yyyy'), 856, 'Paramedic', 'female', 47);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Terrence Murdock', to_date('07-12-1998', 'dd-mm-yyyy'), 857, 'EMT', 'male', 26);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Roger Douglas', to_date('15-01-1972', 'dd-mm-yyyy'), 858, 'First Responder', 'female', 52);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Lynn Ontiveros', to_date('28-07-1999', 'dd-mm-yyyy'), 859, 'Certified Nurse', 'male', 25);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Kyra Parsons', to_date('08-04-1996', 'dd-mm-yyyy'), 860, 'EMT', 'female', 28);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Hilary Chan', to_date('26-04-1971', 'dd-mm-yyyy'), 861, 'EMT', 'female', 53);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Hope Miller', to_date('04-01-1978', 'dd-mm-yyyy'), 862, 'EMT', 'male', 46);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Martha Benet', to_date('20-08-1979', 'dd-mm-yyyy'), 863, 'EMT', 'female', 45);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Marianne Lachey', to_date('04-03-1985', 'dd-mm-yyyy'), 864, 'Paramedic', 'male', 39);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Bernie Vince', to_date('03-06-1982', 'dd-mm-yyyy'), 865, 'Certified Nurse', 'female', 42);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Patrick Nugent', to_date('07-10-1972', 'dd-mm-yyyy'), 866, 'EMT', 'female', 52);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Barbara Rispoli', to_date('03-12-1982', 'dd-mm-yyyy'), 867, 'EMT', 'female', 42);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Mark Kadison', to_date('10-08-1978', 'dd-mm-yyyy'), 868, 'First Responder', 'female', 46);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Denzel Candy', to_date('23-09-1983', 'dd-mm-yyyy'), 869, 'First Responder', 'female', 41);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Armin Suvari', to_date('26-11-1973', 'dd-mm-yyyy'), 870, 'EMT', 'male', 51);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Eric Carrere', to_date('05-07-1989', 'dd-mm-yyyy'), 871, 'Certified Nurse', 'male', 35);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Saffron Gill', to_date('30-05-1981', 'dd-mm-yyyy'), 872, 'Certified Nurse', 'male', 43);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Ike Cross', to_date('01-09-1983', 'dd-mm-yyyy'), 873, 'Certified Nurse', 'female', 41);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Stewart Tambor', to_date('21-03-1979', 'dd-mm-yyyy'), 874, 'Certified Nurse', 'male', 45);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Maria Isaak', to_date('08-03-1983', 'dd-mm-yyyy'), 875, 'EMT', 'male', 41);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Robert Kidman', to_date('13-10-1983', 'dd-mm-yyyy'), 876, 'Paramedic', 'male', 41);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Alannah Lopez', to_date('03-07-1975', 'dd-mm-yyyy'), 877, 'Paramedic', 'female', 49);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Taylor Harry', to_date('16-10-1998', 'dd-mm-yyyy'), 878, 'Certified Nurse', 'female', 26);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Kurtwood Shaw', to_date('09-03-1986', 'dd-mm-yyyy'), 879, 'Certified Nurse', 'female', 38);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Tony Metcalf', to_date('09-07-1988', 'dd-mm-yyyy'), 880, 'Certified Nurse', 'male', 36);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Sharon Downey', to_date('05-02-1985', 'dd-mm-yyyy'), 881, 'Certified Nurse', 'male', 39);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Emerson Harry', to_date('21-05-1992', 'dd-mm-yyyy'), 882, 'EMT', 'female', 32);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Jude Brandt', to_date('08-02-1997', 'dd-mm-yyyy'), 883, 'EMT', 'male', 27);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Josh Hunter', to_date('06-05-1973', 'dd-mm-yyyy'), 884, 'EMT', 'female', 51);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Dionne Creek', to_date('27-05-1979', 'dd-mm-yyyy'), 885, 'First Responder', 'female', 45);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Meredith Creek', to_date('15-08-1983', 'dd-mm-yyyy'), 886, 'Paramedic', 'male', 41);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Bernie Sheen', to_date('20-05-1996', 'dd-mm-yyyy'), 887, 'Paramedic', 'male', 28);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Geoff Feliciano', to_date('23-06-1988', 'dd-mm-yyyy'), 888, 'EMT', 'female', 36);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Mary-Louise Shorter', to_date('20-11-1983', 'dd-mm-yyyy'), 889, 'First Responder', 'male', 41);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Richard Allison', to_date('09-10-1999', 'dd-mm-yyyy'), 890, 'Certified Nurse', 'male', 25);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Swoosie Franklin', to_date('07-07-1981', 'dd-mm-yyyy'), 891, 'Certified Nurse', 'female', 43);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Kyra Eat World', to_date('06-03-1997', 'dd-mm-yyyy'), 892, 'Paramedic', 'male', 27);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Crispin Holly', to_date('07-10-1984', 'dd-mm-yyyy'), 893, 'EMT', 'female', 40);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Kazem Fariq', to_date('30-08-1973', 'dd-mm-yyyy'), 894, 'First Responder', 'male', 51);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Darren Allison', to_date('16-06-1971', 'dd-mm-yyyy'), 895, 'EMT', 'female', 53);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Jackson Quatro', to_date('27-04-1974', 'dd-mm-yyyy'), 896, 'First Responder', 'male', 50);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Nicole Noseworthy', to_date('27-03-1979', 'dd-mm-yyyy'), 897, 'First Responder', 'male', 45);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Davey Crouse', to_date('02-07-1991', 'dd-mm-yyyy'), 898, 'First Responder', 'male', 33);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Cyndi Ojeda', to_date('14-04-1987', 'dd-mm-yyyy'), 899, 'EMT', 'female', 37);
commit;
prompt 400 records loaded
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
values (340, 'Chantי Roy Parnell', to_date('25-03-1986', 'dd-mm-yyyy'), '28', 'Emergency Response');
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
insert into BELONGS (g_id, p_id)
values (1, 575);
insert into BELONGS (g_id, p_id)
values (1, 631);
insert into BELONGS (g_id, p_id)
values (3, 523);
insert into BELONGS (g_id, p_id)
values (3, 685);
insert into BELONGS (g_id, p_id)
values (3, 756);
insert into BELONGS (g_id, p_id)
values (6, 581);
insert into BELONGS (g_id, p_id)
values (6, 768);
insert into BELONGS (g_id, p_id)
values (7, 746);
insert into BELONGS (g_id, p_id)
values (7, 803);
insert into BELONGS (g_id, p_id)
values (9, 688);
insert into BELONGS (g_id, p_id)
values (11, 807);
insert into BELONGS (g_id, p_id)
values (13, 512);
insert into BELONGS (g_id, p_id)
values (13, 790);
insert into BELONGS (g_id, p_id)
values (14, 897);
insert into BELONGS (g_id, p_id)
values (15, 573);
insert into BELONGS (g_id, p_id)
values (18, 683);
insert into BELONGS (g_id, p_id)
values (18, 728);
insert into BELONGS (g_id, p_id)
values (20, 644);
insert into BELONGS (g_id, p_id)
values (20, 716);
insert into BELONGS (g_id, p_id)
values (20, 783);
insert into BELONGS (g_id, p_id)
values (22, 680);
insert into BELONGS (g_id, p_id)
values (23, 624);
insert into BELONGS (g_id, p_id)
values (23, 794);
insert into BELONGS (g_id, p_id)
values (24, 844);
insert into BELONGS (g_id, p_id)
values (26, 786);
insert into BELONGS (g_id, p_id)
values (27, 615);
insert into BELONGS (g_id, p_id)
values (27, 635);
insert into BELONGS (g_id, p_id)
values (27, 856);
insert into BELONGS (g_id, p_id)
values (31, 584);
insert into BELONGS (g_id, p_id)
values (31, 599);
insert into BELONGS (g_id, p_id)
values (32, 652);
insert into BELONGS (g_id, p_id)
values (32, 730);
insert into BELONGS (g_id, p_id)
values (34, 642);
insert into BELONGS (g_id, p_id)
values (39, 545);
insert into BELONGS (g_id, p_id)
values (40, 829);
insert into BELONGS (g_id, p_id)
values (41, 680);
insert into BELONGS (g_id, p_id)
values (41, 874);
insert into BELONGS (g_id, p_id)
values (42, 664);
insert into BELONGS (g_id, p_id)
values (42, 668);
insert into BELONGS (g_id, p_id)
values (42, 848);
insert into BELONGS (g_id, p_id)
values (43, 836);
insert into BELONGS (g_id, p_id)
values (44, 638);
insert into BELONGS (g_id, p_id)
values (45, 876);
insert into BELONGS (g_id, p_id)
values (45, 884);
insert into BELONGS (g_id, p_id)
values (46, 563);
insert into BELONGS (g_id, p_id)
values (47, 634);
insert into BELONGS (g_id, p_id)
values (47, 727);
insert into BELONGS (g_id, p_id)
values (47, 881);
insert into BELONGS (g_id, p_id)
values (48, 611);
insert into BELONGS (g_id, p_id)
values (48, 613);
insert into BELONGS (g_id, p_id)
values (48, 616);
insert into BELONGS (g_id, p_id)
values (49, 577);
insert into BELONGS (g_id, p_id)
values (50, 649);
insert into BELONGS (g_id, p_id)
values (53, 840);
insert into BELONGS (g_id, p_id)
values (53, 871);
insert into BELONGS (g_id, p_id)
values (55, 624);
insert into BELONGS (g_id, p_id)
values (55, 633);
insert into BELONGS (g_id, p_id)
values (56, 888);
insert into BELONGS (g_id, p_id)
values (60, 777);
insert into BELONGS (g_id, p_id)
values (60, 876);
insert into BELONGS (g_id, p_id)
values (61, 575);
insert into BELONGS (g_id, p_id)
values (61, 865);
insert into BELONGS (g_id, p_id)
values (63, 579);
insert into BELONGS (g_id, p_id)
values (63, 897);
insert into BELONGS (g_id, p_id)
values (64, 704);
insert into BELONGS (g_id, p_id)
values (65, 691);
insert into BELONGS (g_id, p_id)
values (66, 800);
insert into BELONGS (g_id, p_id)
values (67, 850);
insert into BELONGS (g_id, p_id)
values (68, 651);
insert into BELONGS (g_id, p_id)
values (71, 838);
insert into BELONGS (g_id, p_id)
values (72, 801);
insert into BELONGS (g_id, p_id)
values (74, 683);
insert into BELONGS (g_id, p_id)
values (74, 850);
insert into BELONGS (g_id, p_id)
values (77, 648);
insert into BELONGS (g_id, p_id)
values (78, 585);
insert into BELONGS (g_id, p_id)
values (78, 813);
insert into BELONGS (g_id, p_id)
values (78, 884);
insert into BELONGS (g_id, p_id)
values (79, 701);
insert into BELONGS (g_id, p_id)
values (82, 571);
insert into BELONGS (g_id, p_id)
values (83, 812);
insert into BELONGS (g_id, p_id)
values (84, 646);
insert into BELONGS (g_id, p_id)
values (86, 780);
insert into BELONGS (g_id, p_id)
values (87, 685);
insert into BELONGS (g_id, p_id)
values (87, 874);
insert into BELONGS (g_id, p_id)
values (88, 797);
insert into BELONGS (g_id, p_id)
values (90, 706);
insert into BELONGS (g_id, p_id)
values (91, 722);
insert into BELONGS (g_id, p_id)
values (91, 771);
insert into BELONGS (g_id, p_id)
values (91, 891);
insert into BELONGS (g_id, p_id)
values (92, 872);
insert into BELONGS (g_id, p_id)
values (93, 667);
insert into BELONGS (g_id, p_id)
values (94, 645);
insert into BELONGS (g_id, p_id)
values (95, 640);
insert into BELONGS (g_id, p_id)
values (95, 891);
insert into BELONGS (g_id, p_id)
values (96, 822);
insert into BELONGS (g_id, p_id)
values (96, 885);
insert into BELONGS (g_id, p_id)
values (97, 509);
insert into BELONGS (g_id, p_id)
values (97, 823);
insert into BELONGS (g_id, p_id)
values (98, 699);
insert into BELONGS (g_id, p_id)
values (100, 825);
commit;
prompt 100 records committed...
insert into BELONGS (g_id, p_id)
values (101, 863);
insert into BELONGS (g_id, p_id)
values (102, 559);
insert into BELONGS (g_id, p_id)
values (102, 630);
insert into BELONGS (g_id, p_id)
values (102, 754);
insert into BELONGS (g_id, p_id)
values (104, 553);
insert into BELONGS (g_id, p_id)
values (109, 854);
insert into BELONGS (g_id, p_id)
values (110, 827);
insert into BELONGS (g_id, p_id)
values (111, 522);
insert into BELONGS (g_id, p_id)
values (112, 734);
insert into BELONGS (g_id, p_id)
values (113, 601);
insert into BELONGS (g_id, p_id)
values (118, 679);
insert into BELONGS (g_id, p_id)
values (119, 739);
insert into BELONGS (g_id, p_id)
values (119, 784);
insert into BELONGS (g_id, p_id)
values (120, 889);
insert into BELONGS (g_id, p_id)
values (121, 859);
insert into BELONGS (g_id, p_id)
values (123, 765);
insert into BELONGS (g_id, p_id)
values (124, 843);
insert into BELONGS (g_id, p_id)
values (125, 587);
insert into BELONGS (g_id, p_id)
values (125, 707);
insert into BELONGS (g_id, p_id)
values (126, 641);
insert into BELONGS (g_id, p_id)
values (126, 869);
insert into BELONGS (g_id, p_id)
values (127, 743);
insert into BELONGS (g_id, p_id)
values (128, 563);
insert into BELONGS (g_id, p_id)
values (131, 620);
insert into BELONGS (g_id, p_id)
values (134, 659);
insert into BELONGS (g_id, p_id)
values (136, 608);
insert into BELONGS (g_id, p_id)
values (136, 747);
insert into BELONGS (g_id, p_id)
values (138, 620);
insert into BELONGS (g_id, p_id)
values (139, 707);
insert into BELONGS (g_id, p_id)
values (139, 790);
insert into BELONGS (g_id, p_id)
values (140, 576);
insert into BELONGS (g_id, p_id)
values (142, 825);
insert into BELONGS (g_id, p_id)
values (150, 624);
insert into BELONGS (g_id, p_id)
values (150, 640);
insert into BELONGS (g_id, p_id)
values (151, 863);
insert into BELONGS (g_id, p_id)
values (152, 851);
insert into BELONGS (g_id, p_id)
values (153, 613);
insert into BELONGS (g_id, p_id)
values (153, 780);
insert into BELONGS (g_id, p_id)
values (155, 845);
insert into BELONGS (g_id, p_id)
values (156, 816);
insert into BELONGS (g_id, p_id)
values (156, 821);
insert into BELONGS (g_id, p_id)
values (158, 653);
insert into BELONGS (g_id, p_id)
values (158, 823);
insert into BELONGS (g_id, p_id)
values (160, 729);
insert into BELONGS (g_id, p_id)
values (161, 530);
insert into BELONGS (g_id, p_id)
values (161, 559);
insert into BELONGS (g_id, p_id)
values (161, 571);
insert into BELONGS (g_id, p_id)
values (162, 867);
insert into BELONGS (g_id, p_id)
values (164, 506);
insert into BELONGS (g_id, p_id)
values (166, 768);
insert into BELONGS (g_id, p_id)
values (167, 818);
insert into BELONGS (g_id, p_id)
values (168, 693);
insert into BELONGS (g_id, p_id)
values (169, 561);
insert into BELONGS (g_id, p_id)
values (170, 506);
insert into BELONGS (g_id, p_id)
values (170, 594);
insert into BELONGS (g_id, p_id)
values (170, 822);
insert into BELONGS (g_id, p_id)
values (171, 846);
insert into BELONGS (g_id, p_id)
values (174, 887);
insert into BELONGS (g_id, p_id)
values (175, 788);
insert into BELONGS (g_id, p_id)
values (178, 762);
insert into BELONGS (g_id, p_id)
values (180, 695);
insert into BELONGS (g_id, p_id)
values (182, 819);
insert into BELONGS (g_id, p_id)
values (183, 777);
insert into BELONGS (g_id, p_id)
values (183, 872);
insert into BELONGS (g_id, p_id)
values (185, 683);
insert into BELONGS (g_id, p_id)
values (186, 553);
insert into BELONGS (g_id, p_id)
values (186, 836);
insert into BELONGS (g_id, p_id)
values (186, 851);
insert into BELONGS (g_id, p_id)
values (187, 653);
insert into BELONGS (g_id, p_id)
values (189, 510);
insert into BELONGS (g_id, p_id)
values (189, 546);
insert into BELONGS (g_id, p_id)
values (189, 828);
insert into BELONGS (g_id, p_id)
values (190, 781);
insert into BELONGS (g_id, p_id)
values (190, 862);
insert into BELONGS (g_id, p_id)
values (191, 545);
insert into BELONGS (g_id, p_id)
values (192, 612);
insert into BELONGS (g_id, p_id)
values (194, 558);
insert into BELONGS (g_id, p_id)
values (194, 620);
insert into BELONGS (g_id, p_id)
values (195, 562);
insert into BELONGS (g_id, p_id)
values (195, 633);
insert into BELONGS (g_id, p_id)
values (195, 758);
insert into BELONGS (g_id, p_id)
values (197, 521);
insert into BELONGS (g_id, p_id)
values (197, 874);
insert into BELONGS (g_id, p_id)
values (198, 722);
insert into BELONGS (g_id, p_id)
values (199, 845);
insert into BELONGS (g_id, p_id)
values (199, 847);
insert into BELONGS (g_id, p_id)
values (200, 876);
insert into BELONGS (g_id, p_id)
values (202, 592);
insert into BELONGS (g_id, p_id)
values (202, 755);
insert into BELONGS (g_id, p_id)
values (202, 865);
insert into BELONGS (g_id, p_id)
values (203, 506);
insert into BELONGS (g_id, p_id)
values (203, 651);
insert into BELONGS (g_id, p_id)
values (203, 757);
insert into BELONGS (g_id, p_id)
values (203, 832);
insert into BELONGS (g_id, p_id)
values (205, 647);
insert into BELONGS (g_id, p_id)
values (205, 700);
insert into BELONGS (g_id, p_id)
values (205, 851);
insert into BELONGS (g_id, p_id)
values (206, 650);
insert into BELONGS (g_id, p_id)
values (206, 673);
insert into BELONGS (g_id, p_id)
values (206, 702);
commit;
prompt 200 records committed...
insert into BELONGS (g_id, p_id)
values (210, 603);
insert into BELONGS (g_id, p_id)
values (210, 706);
insert into BELONGS (g_id, p_id)
values (211, 755);
insert into BELONGS (g_id, p_id)
values (212, 753);
insert into BELONGS (g_id, p_id)
values (213, 565);
insert into BELONGS (g_id, p_id)
values (213, 642);
insert into BELONGS (g_id, p_id)
values (214, 830);
insert into BELONGS (g_id, p_id)
values (214, 837);
insert into BELONGS (g_id, p_id)
values (215, 730);
insert into BELONGS (g_id, p_id)
values (216, 724);
insert into BELONGS (g_id, p_id)
values (219, 729);
insert into BELONGS (g_id, p_id)
values (219, 892);
insert into BELONGS (g_id, p_id)
values (221, 834);
insert into BELONGS (g_id, p_id)
values (224, 655);
insert into BELONGS (g_id, p_id)
values (227, 731);
insert into BELONGS (g_id, p_id)
values (228, 578);
insert into BELONGS (g_id, p_id)
values (228, 678);
insert into BELONGS (g_id, p_id)
values (228, 748);
insert into BELONGS (g_id, p_id)
values (229, 601);
insert into BELONGS (g_id, p_id)
values (229, 643);
insert into BELONGS (g_id, p_id)
values (230, 838);
insert into BELONGS (g_id, p_id)
values (231, 689);
insert into BELONGS (g_id, p_id)
values (232, 567);
insert into BELONGS (g_id, p_id)
values (232, 643);
insert into BELONGS (g_id, p_id)
values (234, 505);
insert into BELONGS (g_id, p_id)
values (234, 874);
insert into BELONGS (g_id, p_id)
values (238, 852);
insert into BELONGS (g_id, p_id)
values (239, 704);
insert into BELONGS (g_id, p_id)
values (240, 620);
insert into BELONGS (g_id, p_id)
values (240, 838);
insert into BELONGS (g_id, p_id)
values (241, 661);
insert into BELONGS (g_id, p_id)
values (241, 806);
insert into BELONGS (g_id, p_id)
values (242, 684);
insert into BELONGS (g_id, p_id)
values (242, 806);
insert into BELONGS (g_id, p_id)
values (245, 605);
insert into BELONGS (g_id, p_id)
values (246, 828);
insert into BELONGS (g_id, p_id)
values (247, 725);
insert into BELONGS (g_id, p_id)
values (248, 640);
insert into BELONGS (g_id, p_id)
values (250, 644);
insert into BELONGS (g_id, p_id)
values (251, 715);
insert into BELONGS (g_id, p_id)
values (252, 557);
insert into BELONGS (g_id, p_id)
values (252, 824);
insert into BELONGS (g_id, p_id)
values (254, 646);
insert into BELONGS (g_id, p_id)
values (254, 829);
insert into BELONGS (g_id, p_id)
values (256, 503);
insert into BELONGS (g_id, p_id)
values (257, 899);
insert into BELONGS (g_id, p_id)
values (260, 629);
insert into BELONGS (g_id, p_id)
values (260, 745);
insert into BELONGS (g_id, p_id)
values (260, 822);
insert into BELONGS (g_id, p_id)
values (261, 848);
insert into BELONGS (g_id, p_id)
values (262, 573);
insert into BELONGS (g_id, p_id)
values (263, 797);
insert into BELONGS (g_id, p_id)
values (263, 802);
insert into BELONGS (g_id, p_id)
values (265, 642);
insert into BELONGS (g_id, p_id)
values (266, 886);
insert into BELONGS (g_id, p_id)
values (267, 675);
insert into BELONGS (g_id, p_id)
values (267, 695);
insert into BELONGS (g_id, p_id)
values (267, 725);
insert into BELONGS (g_id, p_id)
values (267, 899);
insert into BELONGS (g_id, p_id)
values (270, 817);
insert into BELONGS (g_id, p_id)
values (271, 584);
insert into BELONGS (g_id, p_id)
values (272, 829);
insert into BELONGS (g_id, p_id)
values (274, 525);
insert into BELONGS (g_id, p_id)
values (275, 550);
insert into BELONGS (g_id, p_id)
values (275, 618);
insert into BELONGS (g_id, p_id)
values (277, 788);
insert into BELONGS (g_id, p_id)
values (279, 620);
insert into BELONGS (g_id, p_id)
values (280, 533);
insert into BELONGS (g_id, p_id)
values (284, 753);
insert into BELONGS (g_id, p_id)
values (284, 757);
insert into BELONGS (g_id, p_id)
values (287, 509);
insert into BELONGS (g_id, p_id)
values (288, 752);
insert into BELONGS (g_id, p_id)
values (289, 739);
insert into BELONGS (g_id, p_id)
values (291, 611);
insert into BELONGS (g_id, p_id)
values (291, 747);
insert into BELONGS (g_id, p_id)
values (291, 777);
insert into BELONGS (g_id, p_id)
values (291, 806);
insert into BELONGS (g_id, p_id)
values (294, 577);
insert into BELONGS (g_id, p_id)
values (294, 753);
insert into BELONGS (g_id, p_id)
values (298, 667);
insert into BELONGS (g_id, p_id)
values (298, 760);
insert into BELONGS (g_id, p_id)
values (302, 863);
insert into BELONGS (g_id, p_id)
values (303, 845);
insert into BELONGS (g_id, p_id)
values (304, 519);
insert into BELONGS (g_id, p_id)
values (305, 841);
insert into BELONGS (g_id, p_id)
values (306, 523);
insert into BELONGS (g_id, p_id)
values (306, 890);
insert into BELONGS (g_id, p_id)
values (306, 894);
insert into BELONGS (g_id, p_id)
values (308, 825);
insert into BELONGS (g_id, p_id)
values (310, 642);
insert into BELONGS (g_id, p_id)
values (310, 822);
insert into BELONGS (g_id, p_id)
values (311, 691);
insert into BELONGS (g_id, p_id)
values (311, 756);
insert into BELONGS (g_id, p_id)
values (314, 637);
insert into BELONGS (g_id, p_id)
values (314, 733);
insert into BELONGS (g_id, p_id)
values (315, 612);
insert into BELONGS (g_id, p_id)
values (315, 754);
insert into BELONGS (g_id, p_id)
values (316, 540);
insert into BELONGS (g_id, p_id)
values (316, 615);
insert into BELONGS (g_id, p_id)
values (316, 729);
commit;
prompt 300 records committed...
insert into BELONGS (g_id, p_id)
values (317, 831);
insert into BELONGS (g_id, p_id)
values (318, 776);
insert into BELONGS (g_id, p_id)
values (318, 801);
insert into BELONGS (g_id, p_id)
values (320, 658);
insert into BELONGS (g_id, p_id)
values (320, 672);
insert into BELONGS (g_id, p_id)
values (323, 685);
insert into BELONGS (g_id, p_id)
values (323, 689);
insert into BELONGS (g_id, p_id)
values (323, 840);
insert into BELONGS (g_id, p_id)
values (323, 888);
insert into BELONGS (g_id, p_id)
values (327, 526);
insert into BELONGS (g_id, p_id)
values (327, 703);
insert into BELONGS (g_id, p_id)
values (327, 889);
insert into BELONGS (g_id, p_id)
values (330, 511);
insert into BELONGS (g_id, p_id)
values (332, 831);
insert into BELONGS (g_id, p_id)
values (333, 780);
insert into BELONGS (g_id, p_id)
values (333, 844);
insert into BELONGS (g_id, p_id)
values (335, 700);
insert into BELONGS (g_id, p_id)
values (336, 609);
insert into BELONGS (g_id, p_id)
values (337, 745);
insert into BELONGS (g_id, p_id)
values (338, 701);
insert into BELONGS (g_id, p_id)
values (339, 651);
insert into BELONGS (g_id, p_id)
values (339, 844);
insert into BELONGS (g_id, p_id)
values (343, 810);
insert into BELONGS (g_id, p_id)
values (345, 758);
insert into BELONGS (g_id, p_id)
values (349, 661);
insert into BELONGS (g_id, p_id)
values (349, 734);
insert into BELONGS (g_id, p_id)
values (349, 814);
insert into BELONGS (g_id, p_id)
values (350, 724);
insert into BELONGS (g_id, p_id)
values (350, 739);
insert into BELONGS (g_id, p_id)
values (351, 668);
insert into BELONGS (g_id, p_id)
values (352, 784);
insert into BELONGS (g_id, p_id)
values (354, 525);
insert into BELONGS (g_id, p_id)
values (356, 522);
insert into BELONGS (g_id, p_id)
values (356, 709);
insert into BELONGS (g_id, p_id)
values (357, 798);
insert into BELONGS (g_id, p_id)
values (358, 881);
insert into BELONGS (g_id, p_id)
values (360, 829);
insert into BELONGS (g_id, p_id)
values (361, 672);
insert into BELONGS (g_id, p_id)
values (362, 548);
insert into BELONGS (g_id, p_id)
values (362, 592);
insert into BELONGS (g_id, p_id)
values (363, 665);
insert into BELONGS (g_id, p_id)
values (363, 882);
insert into BELONGS (g_id, p_id)
values (364, 619);
insert into BELONGS (g_id, p_id)
values (364, 680);
insert into BELONGS (g_id, p_id)
values (364, 752);
insert into BELONGS (g_id, p_id)
values (364, 768);
insert into BELONGS (g_id, p_id)
values (365, 813);
insert into BELONGS (g_id, p_id)
values (366, 675);
insert into BELONGS (g_id, p_id)
values (368, 559);
insert into BELONGS (g_id, p_id)
values (369, 883);
insert into BELONGS (g_id, p_id)
values (371, 540);
insert into BELONGS (g_id, p_id)
values (375, 510);
insert into BELONGS (g_id, p_id)
values (377, 664);
insert into BELONGS (g_id, p_id)
values (378, 792);
insert into BELONGS (g_id, p_id)
values (379, 765);
insert into BELONGS (g_id, p_id)
values (383, 748);
insert into BELONGS (g_id, p_id)
values (384, 710);
insert into BELONGS (g_id, p_id)
values (384, 721);
insert into BELONGS (g_id, p_id)
values (386, 808);
insert into BELONGS (g_id, p_id)
values (387, 545);
insert into BELONGS (g_id, p_id)
values (387, 832);
insert into BELONGS (g_id, p_id)
values (389, 850);
insert into BELONGS (g_id, p_id)
values (392, 581);
insert into BELONGS (g_id, p_id)
values (392, 675);
insert into BELONGS (g_id, p_id)
values (396, 618);
insert into BELONGS (g_id, p_id)
values (400, 718);
commit;
prompt 366 records loaded
prompt Loading EQUIPMENT...
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('03-11-2042', 'dd-mm-yyyy'), 218, 'CPR Manikin', 46);
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
values (to_date('10-10-2025', 'dd-mm-yyyy'), 227, 'Face Mask', 80);
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
values (to_date('16-01-2041', 'dd-mm-yyyy'), 249, 'Thermometer', 89);
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
values (to_date('13-03-2039', 'dd-mm-yyyy'), 375, 'Blood Pressure Monitor', 60);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('10-04-2026', 'dd-mm-yyyy'), 376, 'Defibrillator', 67);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('27-08-2025', 'dd-mm-yyyy'), 377, 'Glucose Meter', 85);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('09-08-2041', 'dd-mm-yyyy'), 378, 'Surgical Gloves', 48);
insert into EQUIPMENT (e_date, e_id, e_name, amount)
values (to_date('30-11-2025', 'dd-mm-yyyy'), 379, 'Defibrillator', 78);
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
values (to_date('22-05-2042', 'dd-mm-yyyy'), 85, 'Stethoscope', 63);
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
values (to_date('06-10-2030', 'dd-mm-yyyy'), 129, 'Face Mask', 83);
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
values (to_date('02-04-2024', 'dd-mm-yyyy'), 213, 'Face Mask', 49);
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
values (to_date('11-02-2040', 'dd-mm-yyyy'), 12, 'Blood Pressure Monitor', 92);
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
prompt Enabling foreign key constraints for STUDENTSGROUP...
alter table STUDENTSGROUP enable constraint SYS_C008489;
alter table STUDENTSGROUP enable constraint SYS_C008490;
alter table STUDENTSGROUP enable constraint SYS_C008491;
prompt Enabling foreign key constraints for BELONGS...
alter table BELONGS enable constraint SYS_C008500;
alter table BELONGS enable constraint SYS_C008501;
prompt Enabling foreign key constraints for TEACHES_THE...
alter table TEACHES_THE enable constraint SYS_C008505;
alter table TEACHES_THE enable constraint SYS_C008506;
prompt Enabling foreign key constraints for USES...
alter table USES enable constraint SYS_C008495;
alter table USES enable constraint SYS_C008496;
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
