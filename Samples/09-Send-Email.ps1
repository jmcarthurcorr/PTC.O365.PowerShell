. .\00-Constants.ps1
. .\00-Initialize.ps1

$graphUri = "https://graph.microsoft.com"
$url = "https://graph.microsoft.com/v1.0/users('$USER_USERNAME')/microsoft.graph.sendMail"

try {
  $accessToken = Get-AccessToken -ResourceUri $graphUri
  
  $body = @{
    "Message" = @{
      "Subject" = "This is a test email from PowerShell!"
      "Body" = @{
        "ContentType" = "HTML"
        "Content" = "This email was sent from PowerShell using the Microsoft Graph."
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