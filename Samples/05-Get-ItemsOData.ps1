. .\00-Constants.ps1
. .\00-Initialize.ps1

$global:spoCred = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($ADMIN_CREDENTIALS.UserName, $ADMIN_CREDENTIALS.Password)

$url = "$SHAREPOINT_URL/sites/contoso/_api/lists/GetByTitle('Tasks')/items?`$select=Id,Title,DueDate,PercentComplete&`$filter=PercentComplete gt 0.5"

$items = Invoke-SPORestMethod -Url $url

$items.results | Out-GridView