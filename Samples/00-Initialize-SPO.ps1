if(Get-Module Microsoft.Online.SharePoint.PowerShell)
{
  Remove-Module Microsoft.Online.SharePoint.PowerShell
}

. Import-Module "C:\Program Files\SharePoint Online Management Shell\Microsoft.Online.SharePoint.PowerShell\Microsoft.Online.SharePoint.PowerShell.psd1" -DisableNameChecking:$true