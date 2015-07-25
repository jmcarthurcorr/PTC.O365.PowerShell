<#
.DESCRIPTION 
.PARAMETER Method
.PARAMETER AccessToken
.PARAMETER EnpointUri
.EXAMPLE
#>
function Invoke-SecuredRestMethod()
{
  Param(
    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [String]
    $Method,
    
    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [String]
    $AccessToken,
    
    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [String]
    $EndpointUri,
    
    [Parameter(Mandatory=$false)]
    [ValidateNotNullOrEmpty()]
    [String]
    $Body
  )
  
  Begin
  {
    $headers = @{ 
      "Authorization" = [String]::Format("Bearer {0}", $AccessToken)
      "Content-Type" = "application/json"
    }
  }
  
  Process
  {
    if($Body)
    {
     $results = Invoke-RestMethod -Uri $EndpointUri -Method $Method -Headers $headers -Body $Body
    }
    else
    {
      $results = Invoke-RestMethod -Uri $EndpointUri -Method $Method -Headers $headers
    }
    
    return $results
  }
}