. .\00-Constants.ps1
. .\00-Initialize.ps1

$graphUri = "https://graph.microsoft.com";

return Get-AccessToken -ResourceUri $graphUri