function Get-AllCustomers () {

  <#
  .SYNOPSIS
  This function is used to get all customer records in Syncro. 
  .DESCRIPTION
  The function connects to your Syncro environment and finds all customers
  .EXAMPLE
  Get-AllCustomers -SyncroSubDomain $SyncroSubDomain -SyncroAPIKey $SyncroAPIkey
  Retrieves all customers
  .NOTES
  NAME: GetAll-Customers
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
  
  $url =  "$($SyncroBaseURL)/customers?api_key=$($Snycro_API_Key)&page=$($page)"
  $response = Invoke-RestMethod -Uri $url -Method Get -ContentType 'application/json'
  $response
  
  }