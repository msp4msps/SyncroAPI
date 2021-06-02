function Get-AllContacts () {

  <#
  .SYNOPSIS 
  This function is used to get all contact records in Syncro. 
  .DESCRIPTION
  The function connects to your Syncro environment and finds all contacts
  .EXAMPLE
  Get-AllContacts
  Retrieves all contacts 
  .NOTES
  Required permission: Customers - View Detail Single-Customer Users can only access own contacts.
  #>
  
  [cmdletbinding()]
  
  param
  (
      [string]$page = 1
  )

  if (!$SyncroBaseURL -or !$Snycro_API_Key) {
    Write-Warning "You must first run Connect-SyncroPSA before calling any other cmdlets" 
    break 
}
  
  $url =  "$($SyncroBaseURL)/contacts?api_key=$($Snycro_API_Key)&page=$($page)"
  $response = Invoke-RestMethod -Uri $url -Method Get -ContentType 'application/json'
  $response
  
  }