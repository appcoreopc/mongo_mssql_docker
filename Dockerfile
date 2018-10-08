FROM microsoft/windowsservercore
LABEL Description="MongoDB" Vendor="MongoDB, Inc." Version="3.2"

# Install choco 
RUN @powershell -NoProfile -ExecutionPolicy unrestricted -Command "(iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))) >$null 2>&1" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin 

RUN choco install mongodb --version 3.2.10 -y 

RUN SETX PATH "%path%;C:\\Program Files\\MongoDB\Server\\3.2\\bin\\"

ENV ENV_DBPATH "C:\MongoDB\data"
ENV ENV_LOG "C:\MongoDB\data\log"

# mongodb parameter is case sensitive # 
CMD mongod --dbpath=%ENV_DBPATH% --logpath=%ENV_LOG%\mongo.log
