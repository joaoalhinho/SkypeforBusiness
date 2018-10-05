function Connect-SkypeOnline {
    param(
     [parameter(Mandatory=$true)]
     [ValidateSet("TAP", "Lab", "CCE","LabOnprem","alhinho","Generic")]
     [String[]]$Tenant
    )  
    
    Import-Module SkypeOnlineConnector

    If ($Tenant -eq "TAP"){
    Import-Module (Import-PSSession (New-CsOnlineSession -UserName joao.alhinho@tap.swisscom.com -OverrideAdminDomain tap4swisscom.onmicrosoft.com) -AllowClobber) -Global
    }
    ElseIf ($Tenant -eq "Lab"){
        $password=get-content -Path "LabCred.txt"  | convertto-securestring
        $credentials = new-object -typename System.Management.Automation.PSCredential -argumentlist "admin@alhinho.onmicrosoft.com",$password
        Import-Module (Import-Pssession (New-CsOnlineSession -Credential (Get-Credential $credentials)) -AllowClobber) -Global

    }elseif($Tenant -eq "CCE"){
        Write-Host "CCE not yet deployed"
        Return
    }elseif($Tenant -eq "LabOnprem"){
        $credentials=Get-Credential -UserName "lab\adm-ja" -Message "Please enter password"
        $session= New-PSSession -ConnectionUri "https://ucadmin.alhinho.com/OcsPOwershell" -Credential $credentials
        Import-Module (Import-PSSession -Session $session -AllowClobber) -Global

    }elseif($Tenant -eq "alhinho"){
        #Import-PSSession (New-CsOnlineSession -UserName admin@alhinho.com -OverrideAdminDomain jalhinho.onmicrosoft.com) -AllowClobber
        Import-Module (Import-PSSession (New-CsOnlineSession -UserName admin@alhinho.com -OverrideAdminDomain jalhinho.onmicrosoft.com) -AllowClobber) -Global
        
    }elseif($Tenant -eq "Generic"){
        $credentials = Get-Credential -UserName ".onmicrosoft.com" -Message "Please enter your credentials"
        Import-Module (Import-PSSession (New-CsOnlineSession -Credential $credentials) -AllowClobber) -Global
    }
    
}
Connect-SkypeOnline