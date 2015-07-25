<#
.DESCRIPTION 
  Downloads the latest SharePoint Online Client Libraries (CSOM) from your SharePoint tenant.
	Inspired by : http://modery.net/script-to-download-the-sharepoint-online-dlls/
.PARAMETER Version
  The version of the files to download (15 or 16)
.PARAMETER TargetDirectory
  The directory where to save all the files
.EXAMPLE
  Get-ClientAssemblies -Version 15 -OutputDirectory "C:\ClientAssemblies"
.EXAMPLE
  Get-ClientAssemblies -OutputDirectory "C:\ClientAssemblies"
#>
function Get-ClientAssemblies()
{  
  Param(
    [Parameter(Mandatory=$false)]
    [ValidateRange(15, 16)]
    [Int]$Version = 16,
    
    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [String]$TargetDirectory
  )
  
  #-----------------------------------------------------------------------
  # Creating or using the Target Directory 
  #-----------------------------------------------------------------------
  $folder = New-Item -Type Directory $TargetDirectory -Force

  #-----------------------------------------------------------------------
  # Building the path to the requested Assemblies
  #-----------------------------------------------------------------------
  $assembliesPath = [String]::Format("Assemblies/{0}", $Version)  
  
  #-----------------------------------------------------------------------
  # Getting all the files from the GitHub Path
  #-----------------------------------------------------------------------
  $files = Get-FilesFromGitHub -Owner "officedev" -Repo "pnp" -Path $assembliesPath
  
  #-----------------------------------------------------------------------
  # Downloading each file from the GitHub Path
  #-----------------------------------------------------------------------
  $files | ForEach-Object {
    Download-File -Url $_.download_url -TargetFolder $folder -TargetFileName $_.name
  }
}