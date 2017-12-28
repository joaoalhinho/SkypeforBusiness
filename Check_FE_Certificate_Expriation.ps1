$Pools=Get-CsPool | where Services -Match Registrar
$FeServers=$Pools.Computers




foreach ($item in $FeServers){
    Write-Host "Server: " $item 
    $Certinfo=Invoke-Command -ComputerName $item -ScriptBlock {Get-CsCertificate |where use -eq "Default"}
    Write-Host "Thumbprint" $Certinfo.Thumbprint
    Write-Host "Expiration" $Certinfo.NotAfter
    Write-Host "##################################################################################"
}