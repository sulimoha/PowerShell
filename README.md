### PowerShell Script to Update Job Titles and Managers in Azure AD

#### Prerequisites
1. **Install Required Modules**: Ensure you have the necessary modules installed. You will need `ImportExcel` for reading Excel files and `AzureAD` for updating Azure AD.
   ```powershell
   Install-Module -Name ImportExcel
   Install-Module -Name AzureAD
   ```

2. **Import the Modules**: Import the modules into your session.
   ```powershell
   Import-Module ImportExcel
   Import-Module AzureAD
   ```

3. **Connect to AzureAD**: Connect to your AzureAD account.
   ```powershell
   Connect-AzureAD
   ```

#### Excel File Content
The Excel file should contain the following columns:
- **UserPrincipalName**: The email address of the user.
- **DisplayName**: The display name of the user (optional for this script).
- **Title**: The new job title to be assigned to the user.
- **Manager**: The display name of the user's manager.

Example:
| UserPrincipalName       | DisplayName       | Title           | Manager         |
|-------------------------|-------------------|-----------------|-----------------|
| user1@example.com       | John Doe          | Developer       | Jane Smith      |
| user2@example.com       | Alice Johnson     | Project Manager | Bob Brown       |

#### Script to Update Job Titles and Managers
```powershell
# Path to your Excel file
$excelFilePath = "C:\Path\To\Your\ExcelFile.xlsx"

# Read the Excel file
$excelData = Import-Excel -Path $excelFilePath

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
```

### Detailed Steps

1. **Install Required Modules**:
   - Use the `Install-Module` cmdlet to install the `ImportExcel` and `AzureAD` modules.
   - These modules are necessary for reading Excel files and interacting with Azure AD.

   ```powershell
   Install-Module -Name ImportExcel
   Install-Module -Name AzureAD
   ```

2. **Import the Modules**:
   - Import the installed modules into your PowerShell session using the `Import-Module` cmdlet.

   ```powershell
   Import-Module ImportExcel
   Import-Module AzureAD
   ```

3. **Connect to AzureAD**:
   - Use the `Connect-AzureAD` cmdlet to authenticate and connect to your Azure AD account.

   ```powershell
   Connect-AzureAD
   ```

4. **Read the Excel File**:
   - Specify the path to your Excel file.
   - Use the `Import-Excel` cmdlet to read the data from the Excel file into a variable.

   ```powershell
   $excelFilePath = "C:\Path\To\Your\ExcelFile.xlsx"
   $excelData = Import-Excel -Path $excelFilePath
   ```

5. **Update Job Titles and Managers**:
   - Loop through each row in the Excel data.
   - Extract the `UserPrincipalName`, `Title`, and `Manager` from each row.
   - Find the user in Azure AD using the `Get-AzureADUser` cmdlet.
   - If the user is found, update their job title using the `Set-AzureADUser` cmdlet.
   - If a manager is specified, find the manager in Azure AD by their display name.
   - If the manager is found, update the user's manager using the `Set-AzureADUserManager` cmdlet.

   ```powershell
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
   ```

### Summary
This script automates the process of updating job titles and managers in Azure AD based on data from an Excel file. It ensures that the specified job titles and managers are correctly applied to the users in your organization.
