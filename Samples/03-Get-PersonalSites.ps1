. .\00-Constants.ps1
. .\00-Initialize.ps1

$credentials = Get-SharePointOnlineCredentials -UserName $ADMIN_USERNAME -Password $ADMIN_PASSWORD
$context = Get-Context -Url $SHAREPOINT_MYSITE_URL -Credentials $credentials

$web = Get-Web -Context $context
$users = $web.SiteUsers
$context.Load($users)
$context.ExecuteQuery()

$users | ForEach-Object {
  Get-PersonalSite -Context $context -LoginName $_.LoginName  
}