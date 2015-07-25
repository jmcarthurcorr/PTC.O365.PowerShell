<#
.DESCRIPTION 
.PARAMETER Fields
.EXAMPLE
#>
function Build-CamlQuery()
{
  Param(
    [Parameter(Mandatory=$true)]
    [Array]$Fields
  )
  
  $query = New-Object Microsoft.SharePoint.Client.CamlQuery
  $viewFields = ""
  $queryFormat = "<View Scope='RecursiveAll'>
  						      <OrderBy>
    									<FieldRef Name='ID' Ascending='TRUE' />
    								</OrderBy>
    								<ViewFields>
    									{0}
    								</ViewFields>
                  </View>"
  
  $Fields | ForEach-Object {
    $viewFields += [String]::Format("<FieldRef Name='{0}' />", $_)
  }
  
	$query.ViewXml = [String]::Format($queryFormat, $viewFields)
							
	return $query;
}