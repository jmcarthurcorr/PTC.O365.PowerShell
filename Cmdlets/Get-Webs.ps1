<#
.DESCRIPTION 
.PARAMETER Url
.PARAMETER Credentials
.EXAMPLE
#> 
function Get-Webs()
{
  Param(
    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.SharePoint.Client.ClientContext]$Context
  )
   
  $web = $context.Web
  $context.Load($web)
  $context.ExecuteQuery()
  
  Write-Output $web
  
  Get-SubWebs -ParentWeb $web -Context $context
}