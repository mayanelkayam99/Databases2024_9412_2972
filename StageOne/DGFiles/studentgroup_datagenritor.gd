
[General]
Version=1

[Preferences]
Username=
Password=2220
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=STUDENTGROUP
Count=1..500

[Record]
Name=G_ID
Type=NUMBER
Size=5
Data=Sequence(1, 1)
Master=

[Record]
Name=MAX_P
Type=NUMBER
Size=15
Data=Random(50, 200)
Master=

[Record]
Name=G_HOUR
Type=NUMBER
Size=
Data=Random(1, 20)
Master=

[Record]
Name=G_DAY
Type=NUMBER
Size=
Data=Random(1, 31)
Master=

[Record]
Name=R_ID
Type=NUMBER
Size=5
Data=Sequence(1, 1)
Master=

[Record]
Name=C_ID
Type=NUMBER
Size=
Data=Sequence(1, 1)
Master=

[Record]
Name=L_ID
Type=NUMBER
Size=5
Data=Sequence(1,1)
Master=

