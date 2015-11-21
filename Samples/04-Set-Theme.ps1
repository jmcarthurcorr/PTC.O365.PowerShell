. .\00-Constants.ps1
  
$demoUrl = "/sites/xxx"
$url = $SHAREPOINT_URL + $demoUrl

Connect-SPOnline -Url $url -Credentials $ADMIN_CREDENTIALS
Add-SPOFile -Path "C:\_\Files\Theme\Office365.spcolor" -Folder "_catalogs/theme/15"
Add-SPOFile -Path "C:\_\Files\Theme\Office365.jpg" -Folder "SiteAssets"

Set-SPOTheme -ColorPaletteUrl $($demoUrl + "/_catalogs/theme/15/Office365.spcolor") -BackgroundImageUrl $($demoUrl +"/SiteAssets/Office365.jpg")	