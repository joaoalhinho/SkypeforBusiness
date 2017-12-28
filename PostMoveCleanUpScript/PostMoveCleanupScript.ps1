param(
    [Parameter(Mandatory=$true)]
    [string]$DestinationPool,

    [Parameter(Mandatory=$false)]
    [string]$BackupPool
)

$PoolError=0
try{
    $DestinationPoolCheck= Get-CsPool -Identity $DestinationPool -ErrorAction Stop
}
catch{
    Write-Host "Destination pool doesn't exist" -ForegroundColor Red
    $PoolError++
}

if ($BackupPool){
    try{
        $BackupPoolCheck= Get-CsPool -Identity $BackupPool -ErrorAction Stop
    }
    catch{
        Write-Host "Backup pool doesn't exist" -ForegroundColor Red
        $PoolError++
    }  
}


if ($PoolError -ge 1){
    Exit
}

[String]$Path=Read-Host "Enter CSV file location"
$Files=Get-ChildItem -Path $Path | Where-Object Name -like *.csv 

if (!(Test-Path C:\Temp\Backup\)){
    New-Item -Path C:\temp\backup\ -ItemType Directory | Out-Null
}


foreach ($Item in $Files){
   foreach ($FE in $DestinationPoolCheck.Computers){
        .\PostMoveCleanup.exe -SummaryFile $item.FullName -MachineFqdn $FE -LogFile PostMove.CleanUP.Log
        Write-Debug "$($item.FullName) && $($Fe)"
   }

   if ($BackupPool){
      foreach ($FE in $BackupPoolCheck.Computers){
        .\PostMoveCleanup.exe -SummaryFile $item.FullName -MachineFqdn $FE -LogFile PostMove.CleanUP.Log
        Write-Debug "$($item.FullName) && $($FE)"
      }
   }
   

   Move-Item -Path $Item.FullName -Destination C:\Temp\backup\
}