<#
.DESCRIPTION 
.PARAMETER Url
.PARAMETER Context
.EXAMPLE
#>
function Get-RestSearchResults()
{
  Param(
    [Parameter(Mandatory=$true)]
    $Results
  )
  
  $searchResults = @()
  
  $Results.query.PrimaryQueryResult.RelevantResults.Table.Rows | ForEach-Object {
    $_.results.Cells | ForEach-Object {
      $searchResult = [PSCustomObject]@{}
      $_.results | ForEach-Object {
        $searchResult | Add-Member -Name $_.Key -Value $_.Value -MemberType NoteProperty
      }
      $searchResults += $searchResult
    }
  }
  
  return $searchResults
}