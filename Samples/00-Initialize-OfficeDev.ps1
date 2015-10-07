if(Get-Module OfficeDevPnP.PowerShell.Commands)
{
  Remove-Module OfficeDevPnP.PowerShell.Commands
}

. Import-Module "$env:USERPROFILE\AppData\Local\Apps\OfficeDevPnP.PowerShell.Commands\Modules\OfficeDevPnP.PowerShell.Commands\OfficeDevPnP.PowerShell.Commands.psd1" -DisableNameChecking:$true