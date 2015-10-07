. .\00-Constants.ps1
. .\00-Initialize.ps1

$global:spoCred = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($USER_CREDENTIALS.UserName, $USER_CREDENTIALS.Password)

$url = "$SHAREPOINT_URL/_api/search/query?Querytext='*'&Properties='GraphQuery:ACTOR(ME)'&RowLimit=100"

$results = Invoke-SPORestMethod -Url $url

Get-RestSearchResults -Results $results | Out-GridView