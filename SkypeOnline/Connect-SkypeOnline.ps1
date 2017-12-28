function Connect-SkypeOnline {
    param(
     [parameter(Mandatory=$true)]
     [ValidateSet("TAP", "Lab", "CCE")]
     [String[]]$Tenant
    )    

If ($Tenant -eq "TAP"){
    Import-PSSession (New-CsOnlineSession -UserName joao.alhinho@tap.swisscom.com -OverrideAdminDomain tap4swisscom.onmicrosoft.com)
}
ElseIf ($Tenant -eq "Lab"){
    $password=get-content -Path "LabCred.txt"  | convertto-securestring
    $credentials = new-object -typename System.Management.Automation.PSCredential -argumentlist "admin@alhinho.onmicrosoft.com",$password
    
    Import-Pssession (New-CsOnlineSession -Credential (Get-Credential $credentials)) -AllowClobber
}elseif($Tenant -eq "CCE"){
    Write-Host "CCE not yet deployed"
    Return
}
    
}