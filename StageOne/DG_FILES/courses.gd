
[General]
Version=1

[Preferences]
Username=
Password=2069
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=COURSES
Count=400

[Record]
Name=C_NAME
Type=VARCHAR2
Size=30
Data=List('Basic First Aid','Infection Control','Health and Safety','Disaster Management','Emergency Response','Pediatric Care','Wilderness First Aid','Advanced Life Support','CPR','Trauma Care')
Master=

[Record]
Name=C_ID
Type=NUMBER
Size=10
Data=Sequence(1,1)
Master=

[Record]
Name=CATEGORIES
Type=VARCHAR2
Size=30
Data=List('Safety','Management','Medical')
Master=

[Record]
Name=PRESENCE
Type=VARCHAR2
Size=30
Data=List('Optional','Required')
Master=

[Record]
Name=PRE_COURSE
Type=VARCHAR2
Size=30
Data=List('Health and Safety','Emergency Response','Basic First Aid','CPR''None')
Master=

