$TENANT_NAME = "slevertcie01"
	
$ADMIN_USERNAME_FORMAT = "admin@{0}.onmicrosoft.com"
$ADMIN_USERNAME = [String]::Format($ADMIN_USERNAME_FORMAT, $TENANT_NAME)
$ADMIN_PASSWORD = ConvertTo-SecureString -AsPlainText "pass@word1" -Force
$ADMIN_CREDENTIALS = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $ADMIN_USERNAME, $ADMIN_PASSWORD

$USER_USERNAME_FORMAT = "karenb@{0}.onmicrosoft.com"
$USER_USERNAME = [String]::Format($USER_USERNAME_FORMAT, $TENANT_NAME)
$USER_PASSWORD = ConvertTo-SecureString -AsPlainText "pass@word1" -Force
$USER_CREDENTIALS = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $USER_USERNAME, $USER_PASSWORD


$SHAREPOINT_URL_FORMAT = "https://{0}.sharepoint.com"
$SHAREPOINT_ADMIN_URL_FORMAT = "https://{0}-admin.sharepoint.com"
$SHAREPOINT_MYSITE_URL_FORMAT = "https://{0}-my.sharepoint.com"

$SHAREPOINT_URL = [String]::Format($SHAREPOINT_URL_FORMAT, $TENANT_NAME)
$SHAREPOINT_ADMIN_URL = [String]::Format($SHAREPOINT_ADMIN_URL_FORMAT, $TENANT_NAME)
$SHAREPOINT_MYSITE_URL = [String]::Format($SHAREPOINT_MYSITE_URL_FORMAT, $TENANT_NAME)

$global:AzureADApplicationTenantId = "a204560f-5ffc-4cf5-a723-22981d99c4f9"
$global:AzureADApplicationClientId = "10dae57e-9b40-42dd-8291-e2b901c69784"
$global:AzureADApplicationCertificatePath = "C:\_\Azure\Certificates\PowerShell.Office365API.pfx"
$global:AzureADApplicationCertificatePassword = "Passw0rd"