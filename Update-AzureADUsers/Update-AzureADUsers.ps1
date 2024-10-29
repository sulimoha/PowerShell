foreach ($row in $excelData) {
    $userPrincipalName = $row.UserPrincipalName
    $newTitle = $row.Title
    $managerName = $row.Manager

    # Find the user in Azure AD
    $user = Get-AzureADUser -Filter "UserPrincipalName eq '$userPrincipalName'"

    if ($user) {
        # Update the job title
        Set-AzureADUser -ObjectId $user.ObjectId -JobTitle $newTitle
        Write-Output "Updated Job Title for $($user.DisplayName) to $newTitle"

        if ($managerName) {
            # Find the manager in Azure AD by DisplayName
            $manager = Get-AzureADUser -Filter "DisplayName eq '$managerName'"

            if ($manager) {
                # Update the user's manager
                Set-AzureADUserManager -ObjectId $user.ObjectId -RefObjectId $manager.ObjectId
                Write-Output "Updated Manager for $($user.DisplayName) to $($manager.DisplayName)"
            } else {
                Write-Output "Manager $managerName not found in Azure AD for user $($user.DisplayName)"
            }
        } else {
            Write-Output "No manager specified for user $($user.DisplayName)"
        }
    } else {
        Write-Output "User $userPrincipalName not found in Azure AD"
    }
}
