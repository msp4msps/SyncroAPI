function New-Contact () {

  <#
  .SYNOPSIS
  This function is used to create a new Contact in Syncro. 
  .DESCRIPTION
  The function connects to your Syncro environment and creates a new Contact 
  .EXAMPLE
  New-Contact -name <string> -address1 <string> -address2 <string> -city <city> -state <state> -zip <zip> -phone <string> -email <string> -mobile <string> -notes <string>
  Creates new Contact in Syncro with metadata 
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
  
 
  $CreateContact =@{
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

$body = (ConvertTo-Json $CreateContact)
$url =  "$($SyncroBaseURL)/contacts"
$response = Invoke-RestMethod -Uri $url -Method Post -Body $body -ContentType 'application/json'
$response

}
