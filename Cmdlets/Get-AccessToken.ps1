<#
.DESCRIPTION 
.PARAMETER
.EXAMPLE
#>
function Get-AccessToken()
{
  Param(
    [Parameter(Mandatory=$true, ParameterSetName="UseLocal")]
    [Parameter(Mandatory=$false, ParameterSetName="UseGlobal")]
    [ValidateNotNullOrEmpty()]
    [String]
    $TenantId = $global:AzureADApplicationTenantId,
    
    [Parameter(Mandatory=$true, ParameterSetName="UseLocal")]
    [Parameter(Mandatory=$false, ParameterSetName="UseGlobal")]
    [ValidateNotNullOrEmpty()]
    [String]
    $ClientId = $global:AzureADApplicationClientId,
    
    [Parameter(Mandatory=$true, ParameterSetName="UseLocal")]
    [Parameter(Mandatory=$false, ParameterSetName="UseGlobal")]
    [ValidateNotNullOrEmpty()]
    [String]
    $CertificatePath = $global:AzureADApplicationCertificatePath,
    
    [Parameter(Mandatory=$true, ParameterSetName="UseLocal")]
    [Parameter(Mandatory=$false, ParameterSetName="UseGlobal")]
    [ValidateNotNullOrEmpty()]
    [String]
    $CertificatePassword = $global:AzureADApplicationCertificatePassword,
    
    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [String]
    $ResourceUri
  )
  
  #region Validations
  #-----------------------------------------------------------------------
  # Validating the TenantId
  #-----------------------------------------------------------------------
  if(!(Is-Guid -Value $TenantId))
  {
    throw [Exception] "TenantId '$TenantId' is not a valid Guid"
  }
  
  #-----------------------------------------------------------------------
  # Validating the ClientId
  #-----------------------------------------------------------------------
  if(!(Is-Guid -Value $ClientId))
  {
    throw [Exception] "ClientId '$ClientId' is not a valid Guid"
  }
  
  #-----------------------------------------------------------------------
  # Validating the Certificate Path
  #-----------------------------------------------------------------------
  if(!(Test-Path -Path $CertificatePath))
  {
    throw [Exception] "CertificatePath '$CertificatePath' does not exist"
  }
  #endregion
  
  #region Initialization
  #-----------------------------------------------------------------------
  # Loads the Azure Active Directory Assemblies 
  #-----------------------------------------------------------------------
  Add-Type -Path "${env:ProgramFiles(x86)}\Microsoft SDKs\Azure\PowerShell\ServiceManagement\Azure\Services\Microsoft.IdentityModel.Clients.ActiveDirectory.dll" | Out-Null
  
  #-----------------------------------------------------------------------
  # Constants 
  #-----------------------------------------------------------------------
  $keyStorageFlags = [System.Security.Cryptography.X509Certificates.X509KeyStorageFlags]::MachineKeySet
  
  #-----------------------------------------------------------------------
  # Building required values
  #-----------------------------------------------------------------------
  $authorizationUriFormat = "https://login.windows.net/{0}/oauth2/authorize"
  $authorizationUri = [String]::Format($authorizationUriFormat, $TenantId)
  #endregion
  
  #region Process
  #-----------------------------------------------------------------------
  # Building the necessary context to acquire the Access Token
  #-----------------------------------------------------------------------
  $authenticationContext = New-Object -TypeName "Microsoft.IdentityModel.Clients.ActiveDirectory.AuthenticationContext" -ArgumentList $authorizationUri, $false
  $certificate = New-Object -TypeName "System.Security.Cryptography.X509Certificates.X509Certificate2" -ArgumentList $CertificatePath, $CertificatePassword, $keyStorageFlags
  $assertionCertificate = New-Object -TypeName "Microsoft.IdentityModel.Clients.ActiveDirectory.ClientAssertionCertificate" -ArgumentList $ClientId, $certificate

  #-----------------------------------------------------------------------
  # Ask for the AccessToken based on the App-Only configuration
  #-----------------------------------------------------------------------
  $authenticationResult = $authenticationContext.AcquireToken($ResourceUri, $assertionCertificate)
  
  #-----------------------------------------------------------------------
  # Returns the an AccessToken valid for an hour
  #-----------------------------------------------------------------------
  return $authenticationResult.AccessToken
  #endregion
}