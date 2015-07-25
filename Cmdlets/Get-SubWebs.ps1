<#
.DESCRIPTION 
.PARAMETER Url
.PARAMETER Context
.EXAMPLE
#> 
function Get-SubWebs()
{
  Param(
    [Parameter(Mandatory=$true)]
    [Microsoft.SharePoint.Client.Web]$ParentWeb,
    
    [Parameter(Mandatory=$true)]
    [Microsoft.SharePoint.Client.ClientContext]$Context
  )
  
  $subWebs = $ParentWeb.Webs 
  $Context.Load($subWebs) 
  $Context.ExecuteQuery() 

  $subWebs | ForEach-Object {
    Write-Output $_ 
    Get-SubWebs -ParentWeb $_ -Context $Context 
  }
}