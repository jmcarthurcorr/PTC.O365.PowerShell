<#
.DESCRIPTION 
.PARAMETER Url
.PARAMETER Context
.EXAMPLE
#>
function Get-Web()
{
  Param(
    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [Microsoft.SharePoint.Client.ClientContext]$Context
  )
  
  $web = $Context.Web
  $Context.Load($web)
  $Context.ExecuteQuery()
  
  return $web
}