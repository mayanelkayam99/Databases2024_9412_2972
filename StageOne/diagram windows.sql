CREATE TABLE Equipment
(
  e_date DATE NOT NULL,
  e_id INT NOT NULL,
  e_name VARCHAR(10) NOT NULL,
  PRIMARY KEY (e_id)
);

CREATE TABLE Courses
(
  C_name VARCHAR(15) NOT NULL,
  c_Id INT NOT NULL,
  categories VARCHAR(10) NOT NULL,
  presence VARCHAR(5) NOT NULL,
  pre_course VARCHAR(5) NOT NULL,
  PRIMARY KEY (c_Id)
);

CREATE TABLE Participants
(
  p_name VARCHAR(15) NOT NULL,
  p_date DATE NOT NULL,
  p_id NUMERIC(5) NOT NULL,
  role VARCHAR(15) NOT NULL,
  gender VARCHAR(10) NOT NULL,
  PRIMARY KEY (p_id)
);

CREATE TABLE lecturers
(
  l_Id NUMERIC(5) NOT NULL,
  l_name VARCHAR(15) NOT NULL,
  l_date DATE NOT NULL,
  seniority VARCHAR(15) NOT NULL,
  training VARCHAR(10) NOT NULL,
  PRIMARY KEY (l_Id)
);

CREATE TABLE Room
(
  r_id NUMERIC(5) NOT NULL,
  location VARCHAR(10) NOT NULL,
  numplace INT NOT NULL,
  type VARCHAR(10) NOT NULL,
  PRIMARY KEY (r_id)
);

CREATE TABLE StudentGroup
(
  g_id NUMERIC(5) NOT NULL,
  Max_p NUMERIC(15) NOT NULL,
  g_hour INT NOT NULL,
  g_day INT NOT NULL,
  r_id NUMERIC(5) NOT NULL,
  c_Id INT NOT NULL,
  l_Id NUMERIC(5) NOT NULL,
  PRIMARY KEY (g_id),
  FOREIGN KEY (r_id) REFERENCES Room(r_id),
  FOREIGN KEY (c_Id) REFERENCES Courses(c_Id),
  FOREIGN KEY (l_Id) REFERENCES lecturers(l_Id)
);

CREATE TABLE use
(
  c_Id INT NOT NULL,
  e_id INT NOT NULL,
  PRIMARY KEY (c_Id, e_id),
  FOREIGN KEY (c_Id) REFERENCES Courses(c_Id),
  FOREIGN KEY (e_id) REFERENCES Equipment(e_id)
);

CREATE TABLE belongs
(
  g_id NUMERIC(5) NOT NULL,
  p_id NUMERIC(5) NOT NULL,
  PRIMARY KEY (g_id, p_id),
  FOREIGN KEY (g_id) REFERENCES Group(g_id),
  FOREIGN KEY (p_id) REFERENCES Participants(p_id)
);

CREATE TABLE teaches_the
(
  l_Id NUMERIC(5) NOT NULL,
  c_Id INT NOT NULL,
  PRIMARY KEY (l_Id, c_Id),
  FOREIGN KEY (l_Id) REFERENCES lecturers(l_Id),
  FOREIGN KEY (c_Id) REFERENCES Courses(c_Id)
);
