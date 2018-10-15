echo "Please ensure you have your volume created and setup targetRestorePath with backslash at the end of it."
echo "dbName -> is the database name to be created, in this case it is productcatalog. DBLogicalName is mdf/ldf names associated with databases configuration."
echo "Bakfilename -> is the path to physical backup file"
echo "Mssql is accessible via port 1400 - connect using 127.0.0.1, 1400 or u can choose a port of your liking. 

docker run -d -p 1400:1433 -v C:/mssqldata/:C:/mssqldata/ -e restore_dbs="[{'dbName':'ProductCatalog','DBLogicalName':'Bunnings.CommerceServer.ProductCatalog', 'Bakfilename':'C:\\mssqldata\\ProductCatalog.bak'}]" -e targetRestorePath=C:\MSSQLDATA\DATA\ mssql:v1