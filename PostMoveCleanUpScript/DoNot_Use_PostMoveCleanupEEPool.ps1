[String]$Path=Read-Host "Enter CSV file location"
$Files=Get-ChildItem -Path $Path | Where-Object Name -like *.csv

if (!(Test-Path C:\Temp\Backup\)){
    New-Item -Path C:\temp\backup\ -ItemType Directory
}

foreach ($Item in $Files){
    #Pool 1
    .\PostMoveCleanup.exe -SummaryFile $Item.FullName -MachineFqdn vsglb247.axept.ch -LogFile PostMove.CleanUP.Log
    .\PostMoveCleanup.exe -SummaryFile $item.FullName -MachineFqdn vsglb248.axept.ch -LogFile PostMove.CleanUP.Log
    .\PostMoveCleanup.exe -SummaryFile $item.FullName -MachineFqdn vsglb249.axept.ch -LogFile PostMove.CleanUP.Log


    #Pool 2
    .\PostMoveCleanup.exe -SummaryFile $Item.FullName -MachineFqdn vswol056.axept.ch -LogFile PostMove.CleanUP.Log
    .\PostMoveCleanup.exe -SummaryFile $item.FullName -MachineFqdn vswol057.axept.ch -LogFile PostMove.CleanUP.Log
    .\PostMoveCleanup.exe -SummaryFile $item.FullName -MachineFqdn vswol063.axept.ch -LogFile PostMove.CleanUP.Log
   

    Move-Item -Path $Item.FullName -Destination C:\Temp\backup\
}