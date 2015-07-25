<#
.DESCRIPTION 
.PARAMETER Url
.PARAMETER Credentials
.EXAMPLE
#> 
function Get-Context()
{
  Param(
    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [String]$Url,
    
    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.SharePoint.Client.SharePointOnlineCredentials]$Credentials
  )
  
  $context = New-Object Microsoft.SharePoint.Client.ClientContext($Url)  
  $context.Credentials = $Credentials
  return $context
}