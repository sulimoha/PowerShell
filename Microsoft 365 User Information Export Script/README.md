# Microsoft 365 User Information Export Script

## Overview

This PowerShell script exports user information from Microsoft 365 to an Excel file. The script retrieves the following details for each user:
- Display Name (Employee Name)
- Email Address (Username)
- Creation Date (formatted as date only)
- Title
- Manager

## Prerequisites

Before running the script, ensure you have the following:
- PowerShell installed on your machine.
- AzureAD module installed. You can install it using:
powershell Install-Module -Name AzureAD
- ImportExcel module installed. You can install it using:
powershell Install-Module -Name ImportExcel
## Usage

1. Clone the repository or download the script file to your local machine.
2. Open PowerShell and navigate to the directory where the script is located.
3. Run the script using the following command:
powershell .\Export-M365Users.ps1
4. The script will connect to Azure AD, retrieve user information, and export it to an Excel file located at `C:\Users\YourUsername\Documents\Microsoft365Users.xlsx`.

## Script Details

The script performs the following steps:
1. Imports the necessary AzureAD module.
2. Connects to Azure AD.
3. Retrieves a list of all users in the Microsoft 365 environment.
4. Gathers the required information for each user, including formatting the creation date to display only the date.
5. Exports the collected information to an Excel file.

## Author

This script was created by **Mohamed Suliman**.  
LinkedIn: [Mohamed Suliman](https://www.linkedin.com/in/mohamed-suliman-o/)

## License

This project is licensed under the MIT License 
