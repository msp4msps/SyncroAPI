function Get-Customer () {

  <#
  .SYNOPSIS
  This function is used to get a single customer record in Syncro. 
  .EXAMPLE
  Get-Customer -id <integer>
  Retrieves a single customer by id
  .NOTES
  Required permission: Customers - View Detail Single-Customer Users can only access own customer (self).
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
  $response = Invoke-RestMethod -Uri $url -Method Get -ContentType 'application/json'
  $response
  
  }