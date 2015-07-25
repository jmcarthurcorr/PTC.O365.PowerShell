function Download-File() 
{
  Param(
    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [String]$Url, 
    
    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [String]$TargetFolder,
       
    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [String]$TargetFileName
  )
	
  Process { 
    $targetPath = Join-Path $TargetFolder $TargetFileName
    Invoke-WebRequest $Url -OutFile $targetPath
  }
}