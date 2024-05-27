
[General]
Version=1

[Preferences]
Username=
Password=2950
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=PARTICIPANTS
Count=1..700

[Record]
Name=P_NAME
Type=VARCHAR2
Size=30
Data=FirstName +' '+ LastName
Master=

[Record]
Name=P_DATE
Type=DATE
Size=
Data=Random(01/01/1970, 01/01/2000)
Master=

[Record]
Name=P_ID
Type=NUMBER
Size=10
Data=Sequence(100, 1)
Master=

[Record]
Name=P_ROLE
Type=VARCHAR2
Size=30
Data=List('Certified Nurse', ''First Responder', 'EMT','Paramedic')
Master=

[Record]
Name=GENDER
Type=VARCHAR2
Size=30
Data=List('man', 'women')
Master=

