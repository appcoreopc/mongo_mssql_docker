echo "Mssql server password configure in Dockerfile. You can override it using -e sa_password."
echo "Please wait..building image and transfering script across."
docker build -t mssql:v1 . 
