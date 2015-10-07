if(Get-Module PTC.O365.PowerShell)
{
  Remove-Module PTC.O365.PowerShell
}

. Import-Module C:\_\GitHub\PTC.O365.PowerShell\PTC.O365.PowerShell.psm1

Add-ClientAssemblies -AssembliesDirectory C:\_\Office365\Assemblies