. .\00-Constants.ps1
. .\00-Initialize.ps1
. .\00-Initialize-SPO.ps1

Connect-SPOService -Url $SHAREPOINT_ADMIN_URL -Credential $ADMIN_CREDENTIALS

$credentials = Get-SharePointOnlineCredentials -UserName $ADMIN_USERNAME -Password $ADMIN_PASSWORD

Get-SPOSite | Where-Object { $_.Template -notlike "*EHS#0" } | ForEach-Object {
	$context = Get-Context -Url $_.Url -Credentials $credentials
	Get-Webs -Context $context | Select Url
}
