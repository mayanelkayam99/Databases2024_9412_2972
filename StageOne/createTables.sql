CREATE TABLE Equipment
(
  e_date DATE NOT NULL,
  e_id   NUMBER(10)NOT NULL,
  e_name VARCHAR2(30) NOT NULL,
  amount NUMBER(5)NOT NULL,
  PRIMARY KEY (e_id)
);

CREATE TABLE Courses
(
  C_name VARCHAR2(30) NOT NULL,
  c_Id  NUMBER(10) NOT NULL,
  categories VARCHAR2(30) NOT NULL,
  presence VARCHAR2(30) NOT NULL,
  pre_course VARCHAR2(30) NOT NULL,
  PRIMARY KEY (c_Id)
);

CREATE TABLE Participants
(
  p_name VARCHAR2(30) NOT NULL,
  p_date DATE NOT NULL,
  p_id  NUMBER(10) NOT NULL,
  p_role VARCHAR2(30) NOT NULL,
  gender VARCHAR2(30) NOT NULL,
  PRIMARY KEY (p_id)
);

CREATE TABLE lecturers
(
  l_Id NUMBER(10) NOT NULL,
  l_name VARCHAR2(30) NOT NULL,
  l_date DATE NOT NULL,
  seniority VARCHAR2(30)NOT NULL,
  training VARCHAR2(30) NOT NULL,
  PRIMARY KEY (l_Id)
);

CREATE TABLE Room
(
  r_id  NUMBER(10) NOT NULL,
  r_location VARCHAR2(30)NOT NULL,
  numplace NUMBER(5) NOT NULL,
  r_type VARCHAR2(30) NOT NULL,
  PRIMARY KEY (r_id)
);

CREATE TABLE StudentsGroup
(
  g_id   NUMBER(10) NOT NULL,
  Max_p  NUMBER(15) NOT NULL,
  g_hour NUMBER(5)NOT NULL,
  g_day NUMBER(5) NOT NULL,
  r_id  NUMBER(10) NOT NULL,
  c_Id  NUMBER(10) NOT NULL,
  l_Id  NUMBER(10) NOT NULL,
  PRIMARY KEY (g_id),
  FOREIGN KEY (r_id) REFERENCES Room(r_id),
  FOREIGN KEY (c_Id) REFERENCES Courses(c_Id),
  FOREIGN KEY (l_Id) REFERENCES lecturers(l_Id)
);

CREATE TABLE uses
(
  c_Id NUMBER(10)NOT NULL,
  e_id NUMBER(10)NOT NULL,
  PRIMARY KEY (c_Id, e_id),
  FOREIGN KEY (c_Id) REFERENCES Courses(c_Id),
  FOREIGN KEY (e_id) REFERENCES Equipment(e_id)
);

CREATE TABLE belongs
(
  g_id NUMBER(10) NOT NULL,
  p_id NUMBER(10) NOT NULL,
  PRIMARY KEY (g_id, p_id),
  FOREIGN KEY (g_id) REFERENCES StudentsGroup(g_id),
  FOREIGN KEY (p_id) REFERENCES Participants(p_id)
);

CREATE TABLE teaches_the
(
  l_Id NUMBER(10) NOT NULL,
  c_Id NUMBER(10) NOT NULL,
  PRIMARY KEY (l_Id, c_Id),
  FOREIGN KEY (l_Id) REFERENCES lecturers(l_Id),
  FOREIGN KEY (c_Id) REFERENCES Courses(c_Id)
);
