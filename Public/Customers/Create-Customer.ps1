function New-Customer () {

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
      [string]$businessName,
      [string]$address,
      [string]$city,
      [string]$state,
      [string]$zip,
      [string]$phone,
      [string]$firstName,
      [string]$lastName
  )
  
    if (!$SyncroBaseURL -or !$Snycro_API_Key) {
        Write-Warning "You must first run Connect-SyncroPSA before calling any other cmdlets" 
        break 
    }
  
 
  $CreateCustomer =@{
    api_key= $Snycro_API_Key
    business_name = $businessName
    address = $address
    city= $city
    state= $state
    zip= $zip
    phone= $phone
    firstname= $firstName
    lastname= $lastName
}

$body = (ConvertTo-Json $CreateCustomer)
$url =  "$($SyncroBaseURL)/customers"
$response = Invoke-RestMethod -Uri $url -Method Post -Body $body -ContentType 'application/json'
$response

}
