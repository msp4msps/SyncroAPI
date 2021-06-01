function Set-Customer () {

  <#
  .SYNOPSIS
  This function is used to update customer in Syncro. 
  .DESCRIPTION
  The function connects to your Syncro environment and updates a customer by ID
  .EXAMPLE
  Set-Customer -id <integer> -businessName <string> -address <string> -city <city> -state <state> -zip <zip> -phone <string> -firstName <string> -lastName <string>
  Updates a customer record in Syncro 
  .NOTES
  Required permission: Customers - Edit Single-Customer Users can only access own customer (self).
  #>
  
  [cmdletbinding()]
  
  param
  (
      [Parameter(Mandatory = $true)]
      [Int64]$id,
      [string]$businessName,
      [string]$address,
      [string]$city,
      [string]$state,
      [string]$zip,
      [string]$phone,
      [string]$firstName,
      [string]$lastName,
      [string]$email,
      [string]$notes

  )

    if (!$SyncroBaseURL -or !$Snycro_API_Key) {
        Write-Warning "You must first run Connect-SyncroPSA before calling any other cmdlets" 
        break 
    }
  
 
  $updateCustomer =@{
    api_key= $Snycro_API_Key
    business_name = $businessName
    address = $address
    city= $city
    state= $state
    zip= $zip
    phone= $phone
    firstname= $firstName
    lastname= $lastName
    email = $email
    notes = $notes
}

$body = (ConvertTo-Json $updateCustomer)
$url =  "$($SyncroBaseURL)/customers/$($id)"
$response = Invoke-RestMethod -Uri $url -Method Put -Body $body -ContentType 'application/json'
$response

}
