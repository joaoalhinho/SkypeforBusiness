param(
    [Parameter(Mandatory=$true)]
    [string]$SourcePool,

    [Parameter(Mandatory=$true)]
    [string]$DestinationPool
)

#check if SfB Module is loaded
If ((Get-Module -Name SkypeForBusiness)-eq $null){
    Import-Module SkypeForBusiness
}

#Check if pool exists
$PoolError=0
$SourcePoolCheck=Get-CsPool -Identity $SourcePool -ErrorAction SilentlyContinue
$DestinationPoolCheck= Get-CsPool -Identity $DestinationPool -ErrorAction SilentlyContinue
If($SourcePoolCheck -eq $null){
   Write-Host "Soure pool doesn't exist" -ForegroundColor Red
   $PoolError=1 
}elseif($DestinationPoolCheck -eq $null){
   Write-Host "Destination pool doesn't exist" -ForegroundColor Red
   $PoolError++  
}

If ($PoolError -ge 1){
    Exit    
}

$UserSource=Get-CsUser -Filter{RegistrarPool -eq $SourcePool}

Write-Host "You are abourt to move "$UserSource.Count" from $SourcePool to $DestinationPool" -ForegroundColor Cyan
Write-Host "Be sure you are running this script on a powerful system!" -ForegroundColor Yellow

Do{
   $confirmation=Read-Host "Press c to continue and a to abord operations"
 }until($confirmation -eq "c" -or $confirmation -eq "a") 

 if ($confirmation -eq "a"){
    Write-Host "Move operation aborded" -ForegroundColor Yellow
    exit
 }


start-process powershell -ArgumentList "Get-CsUser -Filter {FirstName -like 'a*' -AND RegistrarPool -eq '$SourcePool'} | Move-CsUser -Target $DestinationPool -Confirm:0"
start-process powershell -ArgumentList "Get-CsUser -Filter {FirstName -like 'b*' -AND RegistrarPool -eq '$SourcePool'} | Move-CsUser -Target $DestinationPool -Confirm:0"
start-process powershell -ArgumentList "Get-CsUser -Filter {FirstName -like 'c*' -AND RegistrarPool -eq '$SourcePool'} | Move-CsUser -Target $DestinationPool -Confirm:0"
start-process powershell -ArgumentList "Get-CsUser -Filter {FirstName -like 'd*' -AND RegistrarPool -eq '$SourcePool'} | Move-CsUser -Target $DestinationPool -Confirm:0"
start-process powershell -ArgumentList "Get-CsUser -Filter {FirstName -like 'e*' -AND RegistrarPool -eq '$SourcePool'} | Move-CsUser -Target $DestinationPool -Confirm:0"
start-process powershell -ArgumentList "Get-CsUser -Filter {FirstName -like 'f*' -AND RegistrarPool -eq '$SourcePool'} | Move-CsUser -Target $DestinationPool -Confirm:0"
start-process powershell -ArgumentList "Get-CsUser -Filter {FirstName -like 'g*' -AND RegistrarPool -eq '$SourcePool'} | Move-CsUser -Target $DestinationPool -Confirm:0"
start-process powershell -ArgumentList "Get-CsUser -Filter {FirstName -like 'h*' -AND RegistrarPool -eq '$SourcePool'} | Move-CsUser -Target $DestinationPool -Confirm:0"
start-process powershell -ArgumentList "Get-CsUser -Filter {FirstName -like 'i*' -AND RegistrarPool -eq '$SourcePool'} | Move-CsUser -Target $DestinationPool -Confirm:0"
start-process powershell -ArgumentList "Get-CsUser -Filter {FirstName -like 'j*' -AND RegistrarPool -eq '$SourcePool'} | Move-CsUser -Target $DestinationPool -Confirm:0"
start-process powershell -ArgumentList "Get-CsUser -Filter {FirstName -like 'k*' -AND RegistrarPool -eq '$SourcePool'} | Move-CsUser -Target $DestinationPool -Confirm:0"
start-process powershell -ArgumentList "Get-CsUser -Filter {FirstName -like 'l*' -AND RegistrarPool -eq '$SourcePool'} | Move-CsUser -Target $DestinationPool -Confirm:0"
start-process powershell -ArgumentList "Get-CsUser -Filter {FirstName -like 'm*' -AND RegistrarPool -eq '$SourcePool'} | Move-CsUser -Target $DestinationPool -Confirm:0"
start-process powershell -ArgumentList "Get-CsUser -Filter {FirstName -like 'n*' -AND RegistrarPool -eq '$SourcePool'} | Move-CsUser -Target $DestinationPool -Confirm:0"
start-process powershell -ArgumentList "Get-CsUser -Filter {FirstName -like 'o*' -AND RegistrarPool -eq '$SourcePool'} | Move-CsUser -Target $DestinationPool -Confirm:0"
start-process powershell -ArgumentList "Get-CsUser -Filter {FirstName -like 'p*' -AND RegistrarPool -eq '$SourcePool'} | Move-CsUser -Target $DestinationPool -Confirm:0"
start-process powershell -ArgumentList "Get-CsUser -Filter {FirstName -like 'q*' -AND RegistrarPool -eq '$SourcePool'} | Move-CsUser -Target $DestinationPool -Confirm:0"
start-process powershell -ArgumentList "Get-CsUser -Filter {FirstName -like 'r*' -AND RegistrarPool -eq '$SourcePool'} | Move-CsUser -Target $DestinationPool -Confirm:0"
start-process powershell -ArgumentList "Get-CsUser -Filter {FirstName -like 's*' -AND RegistrarPool -eq '$SourcePool'} | Move-CsUser -Target $DestinationPool -Confirm:0"
start-process powershell -ArgumentList "Get-CsUser -Filter {FirstName -like 't*' -AND RegistrarPool -eq '$SourcePool'} | Move-CsUser -Target $DestinationPool -Confirm:0"
start-process powershell -ArgumentList "Get-CsUser -Filter {FirstName -like 'u*' -AND RegistrarPool -eq '$SourcePool'} | Move-CsUser -Target $DestinationPool -Confirm:0"
start-process powershell -ArgumentList "Get-CsUser -Filter {FirstName -like 'v*' -AND RegistrarPool -eq '$SourcePool'} | Move-CsUser -Target $DestinationPool -Confirm:0"
start-process powershell -ArgumentList "Get-CsUser -Filter {FirstName -like 'w*' -AND RegistrarPool -eq '$SourcePool'} | Move-CsUser -Target $DestinationPool -Confirm:0"
start-process powershell -ArgumentList "Get-CsUser -Filter {FirstName -like 'x*' -AND RegistrarPool -eq '$SourcePool'} | Move-CsUser -Target $DestinationPool -Confirm:0"
start-process powershell -ArgumentList "Get-CsUser -Filter {FirstName -like 'y*' -AND RegistrarPool -eq '$SourcePool'} | Move-CsUser -Target $DestinationPool -Confirm:0"
start-process powershell -ArgumentList "Get-CsUser -Filter {FirstName -like 'z*' -AND RegistrarPool -eq '$SourcePool'} | Move-CsUser -Target $DestinationPool -Confirm:0"


$UserSourceNew=(Get-CsUser -Filter{RegistrarPool -eq $SourcePool}).Count

Write-Debug "Hold"

While ($UserSourceNew -ne 0){
    Write-Host "$UserSourceNew users pending"
    #Write-Progress -Activity "Moving Users" -Status "users left" -PercentComplete ($UserSourceNew.count/$UserSource.count*100)
    $UserSourceNew=(Get-CsUser -Filter{RegistrarPool -eq $SourcePool}).count
    start-sleep 10
}


