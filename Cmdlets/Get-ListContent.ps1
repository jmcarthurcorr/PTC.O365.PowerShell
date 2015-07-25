<#
.DESCRIPTION 
.PARAMETER Url
.PARAMETER Context
.EXAMPLE
#>
function Get-ListContent()
{
  Param(
    [Parameter(Mandatory=$true)]
    [Microsoft.SharePoint.Client.List]$List,
    
    [Parameter(Mandatory=$true)]
    [Array]$Fields
  )
  
  $camlQuery = Build-CamlQuery -Fields $Fields
  $items = $List.GetItems($camlQuery)
  $List.Context.Load($items)
  $List.Context.ExecuteQuery()
  
  return $items
}