function Remove-Contact () {

  <#
  .SYNOPSIS 
  This function is used to remove a single contact record in Syncro. 
  .DESCRIPTION
  The function connects to your Syncro environment and removes a contact by ID
  .EXAMPLE
   Remove-Contact -id <integer>
  Retrieves a contact by ID and removes them from Syncro
  .NOTES
  Required permission: Customers - Edit Single-Customer Users can only access own contacts.
  #>
  
  [cmdletbinding()]
  
  param
  (
    [Parameter(Mandatory = $true)]
    [Int64]$id
  )

  if (!$SyncroBaseURL -or !$Snycro_API_Key) {
    Write-Warning "You must first run Connect-SyncroPSA before calling any other cmdlets" 
    break 
}
  
  $url =  "$($SyncroBaseURL)/contacts/$($id)?api_key=$($Snycro_API_Key)"
  $response = Invoke-RestMethod -Uri $url -Method Delete -ContentType 'application/json'
  $response
  
  }