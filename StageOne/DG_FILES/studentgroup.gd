
[General]
Version=1

[Preferences]
Username=
Password=2720
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=STUDENTSGROUP
Count=400

[Record]
Name=G_ID
Type=NUMBER
Size=10
Data=Sequence(1,1)
Master=

[Record]
Name=MAX_P
Type=NUMBER
Size=15
Data=Random(30,100)
Master=

[Record]
Name=G_HOUR
Type=NUMBER
Size=5
Data=Random(8,20)
Master=

[Record]
Name=G_DAY
Type=NUMBER
Size=5
Data=Random(1, 5)
Master=

[Record]
Name=R_ID
Type=NUMBER
Size=10
Data=List(select r_id from room)
Master=

[Record]
Name=C_ID
Type=NUMBER
Size=10
Data=List(select c_id from Courses)
Master=

[Record]
Name=L_ID
Type=NUMBER
Size=10
Data=List(select l_id from lecturers)
Master=

