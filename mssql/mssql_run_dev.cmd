docker run -d -p 1400:1433 -e sa_password=_ -e ACCEPT_EULA=Y -v C:/mssqldata/:C:/mssqldata/ -e attach_dbs="[{'dbName':'SampleDb','dbFiles':['C:\\mssqldata\\sampledb.mdf','C:\\mssqldata\\sampledb_log.ldf']}]" microsoft/mssql-server-windows-developer

docker run -d  -m 2048M  -p 1400:1433 -e sa_password=Password1! -e ACCEPT_EULA=Y -v C:/mssqldata/:C:/mssqldata/ -e attach_dbs="[{'dbName': 'PTS','dbFiles': ['C:\\mssqldata\\pts.mdf','C:\\mssqldata\\pts_log.ldf']}]" mssql:v1

docker run -d  -m 2048M -p 1400:1433 -e sa_password=_ -e ACCEPT_EULA=Y -v C:/mssqldata/:C:/mssqldata/ -e attach_dbs="[{'dbName': 'PTS','dbFiles': ['C:\\mssqldata\\pts.mdf','C:\\mssqldata\\pts_log.ldf']}]" mssql:v1

docker build -t mssql:v1 . 




docker run -d  -m 2048M  -p 1400:1433 -e sa_password=Password1! -e ACCEPT_EULA=Y -v C:/mssqldata/:C:/mssqldata/  mssql:v1



sqlcmd -S . -U sa


[
  {'dbName': 'PTS','dbFiles': ['C:\\mssqldata\\pts.mdf','C:\\mssqldata\\pts_log.ldf']},
  {
  	'dbName': 'PerryDb',
  	'dbFiles': ['C:\\temp\\perrytest.mdf',
  	'C:\\temp\\perrytest_log.ldf']
  }
  ]


{
  	'dbName': 'MaxDb',
  	'dbFiles': ['C:\\temp\\maxtest.mdf',
  	'C:\\temp\\maxtest_log.ldf']
  }

