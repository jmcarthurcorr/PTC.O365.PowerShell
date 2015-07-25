<#
.DESCRIPTION 
.PARAMETER UserName
.PARAMETER Password
.EXAMPLE
#> 
function Get-SharePointOnlineCredentials()
{
  Param(
    [Parameter(Mandatory=$false)]
    [String]$UserName,
    
    [Parameter(Mandatory=$false)]
    [SecureString]$Password
  )
  
  if([String]::IsNullOrEmpty($UserName))
  {
    $UserName = Read-Host -Prompt "Enter your SharePoint Online UserName"
  }
  
  if([String]::IsNullOrEmpty($Password))
  {
    $Password = Read-Host -Prompt "Enter your SharePoint Online Password for $UserName" -AsSecureString
  }
  
  $credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($UserName, $Password)
  return $credentials
}