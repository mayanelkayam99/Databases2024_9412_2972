
[General]
Version=1

[Preferences]
Username=
Password=2193
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=LECTURERS
Count=1..900

[Record]
Name=L_ID
Type=NUMBER
Size=10
Data=Sequence(2000000,1)
Master=

[Record]
Name=L_NAME
Type=VARCHAR2
Size=30
Data=FirstName +' '+ LastName
Master=

[Record]
Name=L_DATE
Type=DATE
Size=
Data=Random(01/01/1970, 01/01/2000)
Master=

[Record]
Name=SENIORITY
Type=VARCHAR2
Size=30
Data=List('Junior', 'Intermediate','Expert','Senior')
Master=

[Record]
Name=TRAINING
Type=VARCHAR2
Size=30
Data=List('Infection Control', 'Health and Safety', 'Advanced Life Support','Pediatric Care','Disaster Management','Emergency Response','First Aid','Trauma Care','Medical')
Master=

