$currentPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

Get-ChildItem -Path $currentPath\Functions\*.ps1 | ForEach-Object { 
  . $_.FullName 
}

Get-ChildItem -Path $currentPath\Cmdlets\*.ps1 | ForEach-Object { 
  . $_.FullName 
}

Export-ModuleMember Get-Context

Export-ModuleMember Get-ClientAssemblies, Add-ClientAssemblies

Export-ModuleMember Get-SharePointOnlineCredentials

Export-ModuleMember Get-Webs, Get-SubWebs, Get-Web

Export-ModuleMember Get-List, Get-ListContent

Export-ModuleMember Get-RestSearchResults

Export-ModuleMember Get-KeyCredentialsManifest

Export-ModuleMember Get-AccessToken, Invoke-SecuredRestMethod

Export-ModuleMember Get-PersonalSite