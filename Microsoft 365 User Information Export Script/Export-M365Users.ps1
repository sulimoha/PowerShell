# Import the necessary module
Import-Module AzureAD

# Connect to Azure AD
Connect-AzureAD

# Get the list of users
$users = Get-AzureADUser -All $true

# Create an array to store user information
$userInfo = @()

# Loop through each user and gather the required information
foreach ($user in $users) {
    $creationDate = (Get-AzureADUserExtension -ObjectId $user.ObjectId).Get_Item("createdDateTime")
    $formattedDate = [datetime]::Parse($creationDate).ToString("yyyy-MM-dd")
    $userDetails = [PSCustomObject]@{
        DisplayName    = $user.DisplayName
        EmailAddress   = $user.UserPrincipalName
        CreationDate   = $formattedDate
        Title          = $user.JobTitle
        Manager        = (Get-AzureADUserManager -ObjectId $user.ObjectId).DisplayName
    }
    $userInfo += $userDetails
}

# Export the information to an Excel file
$userInfo | Export-Excel -Path "C:\Users\YourUserName\Documents\Microsoft365Users.xlsx" -AutoSize
