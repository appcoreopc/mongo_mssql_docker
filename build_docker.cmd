SET DOCKERTAG=bunnings/mongodb-xdb:v1

docker build -t %DOCKERTAG% . 
echo "Running mongodb instances exposing port localhost:8000"

SET DBPATH="C:\dbData"
if not exist %DBPATH% mkdir %DBPATH%
if not exist %DBPATH%\data mkdir %DBPATH%\data
if not exist %DBPATH%\data\log mkdir %DBPATH%\data\log

docker run -d -p 8000:27017 -v %DBPATH%:c:\mongodb %DOCKERTAG%

