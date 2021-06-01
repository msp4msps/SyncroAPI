function Connect-SyncroPSA {
   <#
  .SYNOPSIS
  This function is used to connect to your Syncro Environment. 
  .DESCRIPTION
  The function is used to define your base uri and API key that will be used in all other cmdelts that are part of this module
  .EXAMPLE
  Connect-SyncroPSA -SyncroSubdomain <string> -APIKey <string>
  Adds environment variables that will be used in other cmdelts.
  .NOTES
  Your Synro Subdomain should be the prefix of the url you sign in with. Ex. In tminus365.syncromsp.com, tminus365 is the subdomain. 
  #>
  
  param (
      [string]$SyncroSubdomain,
      [string]$APIKey
  )
  if (!$SyncroSubdomain){
    $SyncroSubdomain = Read-Host "Please enter your Syncro Subdomain"
  }
  $baseURI = "https://$($SyncroSubdomain).syncromsp.com/api/v1"
  Set-Variable -Name "SyncroBaseURL" -Value $baseURI -Option ReadOnly -Scope global -Force

  if ($APIKey) {
    $SyncroAPIKey = $APIKey

    Set-Variable -Name "Snycro_API_Key" -Value $SyncroAPIKey -Option ReadOnly -Scope global -Force
}
else {
    $SyncroAPIKey = Read-Host "Please enter your API key:"

    Set-Variable -Name "Snycro_API_Key" -Value $SyncroAPIKey -Option ReadOnly -Scope global -Force
}
}