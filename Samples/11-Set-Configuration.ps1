. .\00-Constants.ps1

Connect-SPOnline -Url "$SHAREPOINT_URL/sites/pnp02" -Credentials $ADMIN_CREDENTIALS

Apply-SPOProvisioningTemplate -Path "C:\_\Files\Template\template.xml"