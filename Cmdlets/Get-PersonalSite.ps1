<#
.DESCRIPTION 
.PARAMETER Context
.EXAMPLE
#>
function Get-PersonalSite()
{
  Param(
    [Parameter(Mandatory=$true)]
    $Context,
    
    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [String]$LoginName    
  )
  
  #-----------------------------------------------------------------------
  # Get an instance of the UserProfile PeopleManager
  #-----------------------------------------------------------------------
  $peopleManager = New-Object Microsoft.SharePoint.Client.UserProfiles.PeopleManager($Context)
	$userProfile = $peopleManager.GetPropertiesFor($LoginName)
  	
	#-----------------------------------------------------------------------
	# Execute the query
	#-----------------------------------------------------------------------
  $Context.Load($userProfile)
  $Context.ExecuteQuery()
  
	if (Has-PersonalSite -UserProfile $userProfile)
	{
    return $userProfile.PersonalUrl
	}
}

function Has-PersonalSite()
{
	Param(
		[Parameter(Mandatory=$true)]
		$UserProfile
	)
	
	Process {
		return $userProfile.Email -ne $null -and $userProfile.UserProfileProperties.PersonalSpace -ne ""
	}
}