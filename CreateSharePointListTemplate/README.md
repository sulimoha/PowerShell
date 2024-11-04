
# SharePoint List Template Creation

This repository contains a PowerShell script to create a SharePoint list template using Visual Studio Code.

## Prerequisites

1. **Install VS Code**: If you haven't already, download and install Visual Studio Code.
2. **Install PowerShell Extension**: In VS Code, go to the Extensions view by clicking the Extensions icon in the Activity Bar on the side of the window. Search for "PowerShell" and install the extension.
3. **Install PnP PowerShell Module**: Run the following command to install the PnP PowerShell module from the PowerShell Gallery:
   ```powershell
   Install-Module -Name PnP.PowerShell -Force -Scope CurrentUser
   ```

## Steps:

### Step 1: Install the PnP PowerShell Module

1. **Open VS Code and Create a New PowerShell Script**:
   - Open VS Code.
   - Create a new file and save it with a `.ps1` extension, for example, `CreateListTemplate.ps1`.

2. **Add the following code to install the PnP PowerShell module**:
   ```powershell
   # Install the PnP PowerShell module
   Install-Module -Name PnP.PowerShell -Force -Scope CurrentUser
   ```

### Step 2: Connect to SharePoint Online

1. **Add the following code to connect to SharePoint Online**:
   ```powershell
   # Import the PnP PowerShell module
   Import-Module PnP.PowerShell

   # Connect to SharePoint Online
   $siteUrl = "https://yourtenant.sharepoint.com/sites/yoursite"
   Connect-PnPOnline -Url $siteUrl -UseWebLogin
   ```

### Step 3: Create a List Template

1. **Add the following code to create a list template**:
   ```powershell
   # Variables
   $listName = "YourListName"
   $templateName = "YourTemplateName"
   $templateDescription = "Description of the template"
   $includeContent = $false  # Set to $true if you want to include content

   # Save the list as a template
   Save-PnPListAsTemplate -Identity $listName -TemplateName $templateName -Description $templateDescription -IncludeContent $includeContent
   ```

### Step 4: Run the Script

1. **Save your script**.
2. **Open the integrated terminal in VS Code** (View > Terminal).
3. **Run your script** by typing `.\CreateListTemplate.ps1` and pressing Enter.

### Example Script

Here’s a complete example script:
```powershell
# Install the PnP PowerShell module
Install-Module -Name PnP.PowerShell -Force -Scope CurrentUser

# Import the PnP PowerShell module
Import-Module PnP.PowerShell

# Connect to SharePoint Online
$siteUrl = "https://yourtenant.sharepoint.com/sites/yoursite"
Connect-PnPOnline -Url $siteUrl -UseWebLogin

# Variables
$listName = "CandidateTracker"
$templateName = "CandidateTrackerTemplate"
$templateDescription = "Template for tracking candidate recruitment"
$includeContent = $false  # Set to $true if you want to include content

# Save the list as a template
Save-PnPListAsTemplate -Identity $listName -TemplateName $templateName -Description $templateDescription -IncludeContent $includeContent
```

## Usage

1. Open the integrated terminal in VS Code.
2. Run the script by typing `.\CreateListTemplate.ps1` and pressing Enter.

## Author

**Mohamed Suliman**

- **LinkedIn**: [Mohamed Suliman](https://www.linkedin.com/in/mohamed-suliman-o/)

## License

This project is licensed under the MIT License - see the LICENSE file for details.

---

Thank you for visiting my repository! I hope you find these scripts useful for your own tasks and projects.