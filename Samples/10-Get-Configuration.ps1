. .\00-Constants.ps1
. .\00-Initialize-OfficeDev.ps1

Connect-SPOnline -Url "$SHAREPOINT_URL/sites/pnp" -Credentials $ADMIN_CREDENTIALS

Get-SPOProvisioningTemplate -Out "C:\_\Files\Template\template.xml" -PersistComposedLookFiles -Force