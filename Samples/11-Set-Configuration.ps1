. .\00-Constants.ps1
. .\00-Initialize-OfficeDev.ps1

Connect-SPOnline -Url "$SHAREPOINT_URL/sites/pnp01" -Credentials $ADMIN_CREDENTIALS

Apply-SPOProvisioningTemplate -Path "C:\_\Files\Template\template.xml"