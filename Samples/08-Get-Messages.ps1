. .\00-Constants.ps1
. .\00-Initialize.ps1

$exchangeResourceUri = "https://outlook.office365.com/";
$url = "https://outlook.office365.com/api/v1.0/users('$USER_USERNAME')/folders/inbox/messages?$top=50"

try {
  $accessToken = Get-AccessToken -ResourceUri $exchangeResourceUri
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