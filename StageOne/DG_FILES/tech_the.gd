
[General]
Version=1

[Preferences]
Username=
Password=2685
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=TEACHES_THE
Count=400

[Record]
Name=L_ID
Type=NUMBER
Size=10
Data=List(select l_id from lecturers)
Master=

[Record]
Name=C_ID
Type=NUMBER
Size=10
Data=List(select c_id from Courses)
Master=

