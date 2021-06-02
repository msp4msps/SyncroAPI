function Set-Contact () {

  <#
  .SYNOPSIS
  This function is used to update a Contact in Syncro. 
  .DESCRIPTION
  The function connects to your Syncro environment and updates a contact record
  .EXAMPLE
  Set-Contact -id <integer> -name <string> -address1 <string> -address2 <string> -city <city> -state <state> -zip <zip> -phone <string> -email <string> -mobile <string> -notes <string>
  Updates a Contact in Syncro by id 
  .NOTES
  Required permission: Customers - Edit Single-Customer Users can only access own contacts.
  #>
  
  [cmdletbinding()]
  
  param
  (
      [string]$name,
      [string]$address1,
      [string]$address2,
      [string]$state,
      [string]$zip,
      [string]$city,
      [string]$phone,
      [string]$email,
      [string]$mobile,
      [string]$notes

  )

    if (!$SyncroBaseURL -or !$Snycro_API_Key) {
        Write-Warning "You must first run Connect-SyncroPSA before calling any other cmdlets" 
        break 
    }
  
 
  $udpateContact =@{
    api_key= $Snycro_API_Key
    name = $name
    address1 = $address1
    address2 = $address2
    city= $city
    state= $state
    zip= $zip
    phone= $phone
    email = $email
    mobile= $mobile
    notes= $notes
}

$body = (ConvertTo-Json $udpateContact)
$url =  "$($SyncroBaseURL)/contacts"
$response = Invoke-RestMethod -Uri $url -Method Put -Body $body -ContentType 'application/json'
$response

}
