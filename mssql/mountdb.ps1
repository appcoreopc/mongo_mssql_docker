# Restore sql backup 
# Sample environment configuratiopn 
# $targetRestorePath = "C:\MSSQLDATA\DATA\"
# $env:restore_dbs = "[{'dbName':'ProductCatalog','DBLogicalName':'Bunnings.CommerceServer.ProductCatalog', 'Bakfilename':'C:\\mssqldata\\ProductCatalog.bak'}]"

$targetRestorePath = $env:targetRestorePath
$env:restore_dbs = "[{'dbName':'ProductCatalog','DBLogicalName':'Bunnings.CommerceServer.ProductCatalog', 'Bakfilename':'C:\\mssqldata\\ProductCatalog.bak'}]"

$restore_dbs = $env:restore_dbs    
Write-Host "Database(s) to restore $restore_dbs to $targetRestorePath"

$dbs = $restore_dbs | ConvertFrom-Json

# Check if we have some environment configuration settings 
if ($null -ne $dbs -And $dbs.Length -gt 0)
{
    Write-Verbose "Restoring database $($dbs.Length) database(s)"

    Foreach($db in $dbs)
    {
        $targetDbName =  $db.dbName
        $targetDbBakFile = $db.Bakfilename
        $targetLogialDb = $db.DBLogicalName
        $targetLogialDbLog = $db.DBLogicalName + "_log"
       
        $sqlcmd = "RESTORE DATABASE [$targetDbName] FROM DISK = '$targetDbBakFile' WITH REPLACE, MOVE N'$targetLogialDb' TO N'$targetRestorePath$targetLogialDb" + ".mdf'," + " MOVE N'$targetLogialDbLog' TO N'$targetRestorePath$targetLogialDbLog" + ".ldf'"  

        Write-Host $sqlcmd     
        Write-Verbose "Invoke-Sqlcmd -Query $($sqlcmd)"  
        Invoke-Sqlcmd -Query $sqlcmd -ServerInstance "localhost" 
    }
}

Write-Host "Running image start scripts."
.\start -sa_password $env:sa_password -ACCEPT_EULA $env:ACCEPT_EULA -attach_dbs \"$env:attach_dbs\" -Verbose
