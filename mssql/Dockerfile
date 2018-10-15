FROM microsoft/mssql-server-windows-developer

EXPOSE 1433
ENV SA_PASSWORD=Password1!
ENV ACCEPT_EULA=Y

COPY mountdb.ps1 /

WORKDIR /

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'SilentlyContinue';"]

CMD ["powershell.exe", "c:\\mountdb.ps1"]  
