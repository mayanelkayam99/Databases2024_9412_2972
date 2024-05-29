
[General]
Version=1

[Preferences]
Username=
Password=2912
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=USES
Count=400

[Record]
Name=C_ID
Type=NUMBER
Size=10
Data=List(select c_id from Courses)
Master=

[Record]
Name=E_ID
Type=NUMBER
Size=10
Data=List(select e_id from Equipment)
Master=

