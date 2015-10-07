. .\00-Constants.ps1
. .\00-Initialize.ps1

$exchangeResourceUri = "https://outlook.office365.com/";
$url = "https://outlook.office365.com/api/v1.0/users('$USER_USERNAME')/sendmail"

try {
  $accessToken = Get-AccessToken -ResourceUri $exchangeResourceUri
    
  $body = @{
    "Message" = @{
      "Subject" = "This is a test email from PowerShell!"
      "Body" = @{
        "ContentType" = "Text"
        "Content" = "This email was sent from PowerShell using the Office 365 API."
      }
      "ToRecipients" = @(
        @{ 
          "EmailAddress" = @{
            "Address" = "$USER_USERNAME"
          }
        }
      )
    }
    SaveToSentItems = $false
  }
  
  $response = Invoke-SecuredRestMethod -Method "POST" -AccessToken $accessToken -EndpointUri $url -Body ($body | ConvertTo-Json -Depth 4)
}
catch {
  Write-Output $_.Exception | Format-List -Force
}