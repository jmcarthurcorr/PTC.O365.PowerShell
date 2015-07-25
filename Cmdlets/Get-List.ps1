<#
.DESCRIPTION 
.PARAMETER Url
.PARAMETER Context
.EXAMPLE
#>
function Get-List()
{
  Param(
    [Parameter(Mandatory=$true)]
    [Microsoft.SharePoint.Client.Web]$Web,
    
    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [String]$Title
  )
  
  $list = $Web.Lists.GetByTitle($Title)
  $Web.Context.Load($list)
  $Web.Context.ExecuteQuery()
  
  return $list
}