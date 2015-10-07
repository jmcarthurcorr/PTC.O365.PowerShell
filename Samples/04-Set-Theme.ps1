. .\00-Constants.ps1
. .\00-Initialize-OfficeDev.ps1
  
Connect-SPOnline -Url "$SHAREPOINT_URL/sites/demo" -Credentials $ADMIN_CREDENTIALS
Add-SPOFile -Path "C:\_\Files\Theme\Office365.spcolor" -Folder "_catalogs/theme/15"
Add-SPOFile -Path "C:\_\Files\Theme\Office365.jpg" -Folder "SiteAssets"

Set-SPOTheme -ColorPaletteUrl "/sites/demo/_catalogs/theme/15/Office365.spcolor" -BackgroundImageUrl "/sites/demo/SiteAssets/Office365.jpg"	