SET DOCKER_IMAGE_NAME=10.38.11.73:5000/bunnings/mongodb-xdb:v1

SET DBPATH=%1
IF "%1"=="" SET DBPATH = "C:\dbData"

docker build -t %DOCKER_IMAGE_NAME% . 

if not exist %DBPATH% mkdir %DBPATH%
if not exist %DBPATH%\data mkdir %DBPATH%\data
if not exist %DBPATH%\data\log mkdir %DBPATH%\data\log

docker run -d -p 8000:27017 -v %DBPATH%:c:\mongodb %DOCKER_IMAGE_NAME%
