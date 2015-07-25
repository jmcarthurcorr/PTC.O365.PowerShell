<#
.DESCRIPTION 
  Adds all the Client Assemblies to the PowerShell session
.PARAMETER AssembliesDirectory
  The directory where the client libraries reside
.EXAMPLE
  Add-ClientAssemblies -AssembliesDirectory "C:\ClientAssemblies"
#> 
function Add-ClientAssemblies()
{
  Param(
    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [String]$AssembliesDirectory
  )
  
  Get-ChildItem $AssembliesDirectory | ForEach-Object {
    Add-Type -Path $_.FullName
  }
}