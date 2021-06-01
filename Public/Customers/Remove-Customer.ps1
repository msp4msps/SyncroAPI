function Remove-Customer () {

  <#
  .SYNOPSIS
  This function is used to remove a single customer record in Syncro. 
  .EXAMPLE
  Remove-Customer -id <integer>
  Removes a single customer by id
  .NOTES
  Required permission: Customers - Delete
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
  
  $url =  "$($SyncroBaseURL)/customers?api_key=$($Snycro_API_Key)&id=$($id)"
  $response = Invoke-RestMethod -Uri $url -Method Delete -ContentType 'application/json'
  $response
  
  }