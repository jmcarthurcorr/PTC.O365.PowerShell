. .\00-Constants.ps1
. .\00-Initialize.ps1

$exchangeResourceUri = "https://outlook.office365.com/";

return Get-AccessToken -ResourceUri $exchangeResourceUri