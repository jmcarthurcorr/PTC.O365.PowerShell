. .\00-Constants.ps1
. .\00-Initialize.ps1

$credentials = Get-SharePointOnlineCredentials -UserName $ADMIN_USERNAME -Password $ADMIN_PASSWORD
$context = Get-Context -Url "$SHAREPOINT_URL/sites/contoso" -Credentials $credentials

$web = Get-Web -Context $context
$list = Get-List -Web $web -Title "Tasks"
$items = Get-ListContent -List $list -Fields @("ID", "Title", "DueDate")

$items | Select @{ Name = "ID"; Expression = { $_["ID"] } }, 
		@{ Name = "Title"; Expression = { $_["Title"] } }, 
		@{ Name = "DueDate"; Expression = { $_["DueDate"] } } | 
Export-CSV -Path C:\_\Tasks.csv -NoTypeInformation -Encoding UTF8

Invoke-Item C:\_\Tasks.csv