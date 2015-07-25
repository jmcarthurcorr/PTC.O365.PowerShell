<#
.DESCRIPTION 
.PARAMETER Path
.EXAMPLE
#>
function Get-KeyCredentialsManifest()
{
  Param(
    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [String]$Path
  )
  
  $certificate = New-Object System.Security.Cryptography.X509Certificates.X509Certificate2
  $certificate.Import($Path)
  
  $rawCertificateData = $certificate.GetRawCertData()
  $base64Value = [System.Convert]::ToBase64String($rawCertificateData)
  
  $certificateHash = $certificate.GetCertHash()
  $base64Thumbprint = [System.Convert]::ToBase64String($certificateHash)

  $keyId = [System.Guid]::NewGuid().ToString()
    
  $keyCredentials = @()
  $keyCredential = @{}
  $keyCredential.customKeyIdentifier = $base64Thumbprint
  $keyCredential.keyId = $keyId
  $keyCredential.type = "AsymmetricX509Cert"
  $keyCredential.usage = "Verify"
  $keyCredential.value = $base64Value
  
  $keyCredentials += $keyCredential
  
  return $keyCredentials
}
