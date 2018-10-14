
SET DOCKER_IMAGE_NAME=10.38.11.73:5000/bunnings/mssql:v1

SET DBPATH=%1
IF "%1"=="" SET DBPATH = "C:\mssqldata"
if not exist %DBPATH% mkdir %DBPATH%

docker run -d  -m 2048M  -p 1400:1433 -v C:/mssqldata/:C:/mssqldata/ -e sa_password=dtd99!! -e restore_dbs="[{'dbName':'ProductCatalog','DBLogicalName':'Bunnings.CommerceServer.ProductCatalog', 'Bakfilename':'C:\\mssqldata\\ProductCatalog.bak'}]" %DOCKER_IMAGE_NAME%
