. .\00-Constants.ps1
. .\00-Initialize.ps1

#$exchangeResourceUri = "https://outlook.office365.com/";
$exchangeResourceUri = "https://graph.microsoft.com";

return Get-AccessToken -ResourceUri $exchangeResourceUri