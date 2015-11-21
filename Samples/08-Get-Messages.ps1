. .\00-Constants.ps1
. .\00-Initialize.ps1

$graphUri = "https://graph.microsoft.com"
$url = "https://graph.microsoft.com/v1.0/users('$ADMIN_USERNAME')/mailFolders/inbox/messages?$top=50"

try {
  $accessToken = Get-AccessToken -ResourceUri $graphUri
  $response = Invoke-SecuredRestMethod -Method "GET" -AccessToken $accessToken -EndpointUri $url
  
  $hasMore = $true
  $messages = @()
  while($hasMore) {
    $response = Invoke-SecuredRestMethod -Method "GET" -AccessToken $accessToken -EndpointUri $url
    
    $response.value | ForEach-Object { $messages += $_ } 
    $hasMore = $response.'@odata.nextLink' -ne $null
    $url = $response.'@odata.nextLink'
  }
  
  $messages | Select Subject, @{ Name = "From"; Expression = { $_.From.EmailAddress.Address } }, DateTimeReceived | Out-GridView
}
catch {
  Write-Output $_.Exception | Format-List -Force
}