
[General]
Version=1

[Preferences]
Username=
Password=2621
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=BELONGS
Count=400

[Record]
Name=G_ID
Type=NUMBER
Size=10
Data=List(select g_id from StudentsGroup)
Master=

[Record]
Name=P_ID
Type=NUMBER
Size=10
Data=List(select p_id from Participants)
Master=

