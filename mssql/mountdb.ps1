# Restore sql backup 
# Sample environment configuratiopn 
# $targetRestorePath = "C:\MSSQLDATA\DATA\"
# $env:restore_dbs = "[{'dbName':'ProductCatalog','DBLogicalName':'Bunnings.CommerceServer.ProductCatalog', 'Bakfilename':'C:\\mssqldata\\ProductCatalog.bak'}]"

$targetRestorePath = "C:\MSSQLDATA\DATA\"
$env:restore_dbs = "[{'dbName':'ProductCatalog','DBLogicalName':'Bunnings.CommerceServer.ProductCatalog', 'Bakfilename':'C:\\mssqldata\\ProductCatalog.bak'}]"

Write-Host "SA Password in Env $env:sa_password"

$restore_dbs = $env:restore_dbs    
Write-Host "Database(s) to restore $restore_dbs"

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
       
        $sqlcmd = "RESTORE DATABASE [$targetDbName] FROM DISK = '$targetDbBakFile' WITH FILE = 1, MOVE N'$targetLogialDb' TO N'$targetRestorePath$targetLogialDb" + ".mdf'," + " MOVE N'$targetLogialDbLog' TO N'$targetRestorePath$targetLogialDbLog" + ".ldf'"  

        Write-Host $sqlcmd     
        Write-Verbose "Invoke-Sqlcmd -Query $($sqlcmd)"  
        Invoke-Sqlcmd -Query $sqlcmd -ServerInstance "localhost" 
    }
}

Write-Host 'Spinning up process to continue running this container'
$host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")|out-null 