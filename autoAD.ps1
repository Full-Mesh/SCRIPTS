# Justin H, Paul, Spencer, Ademola
# Auto Populate Users
# 4/5/23

# Adds the Remote Server Administration Tools (RSAT) for Active Directory to the Windows installation.
Add-WindowsCapability -Name Rsat.ActiveDirectory.DS-LDA.tool~~~~0.0.1.0 -Online

Import-Module ActiveDirectory        # Imports the Active Directory PowerShell module to allow the script to interact with Active Directory.
$ADUser = Import-Csv "C:\Users\Administrator\Documents\GreenGenius.csv"          # Reads a CSV file containing the user account information to be created, and stores it in the $ADUser variable.
$password = "Password123!@#"         # Sets the default password for all new user accounts.

foreach ($User in $ADUser) {         # Loops through each row in the $ADUser variable and creates a new user account in Active Directory with the given attributes.
    New-ADUser `                     # calls the New-ADUser cmdlet to create a new user account in Active Directory.
    -Name "$($User.firstname) $($User.lastname)" `       # sets the full name of the new user account.
    -GivenName $User.firstname `     # sets the first name of the new user account.
    -Surname $User.lastname `        # sets the last name of the new user account.
    -Enabled $true `                 # enables the new user account.
    -Path "OU=$($User.OU),DC=GreenGenius,DC=com" `       # specifies the organizational unit (OU) where the new user account will be created.
    -Title $User.jobtitle `          # sets the job title of the new user account.
    -EmailAddress $User.email `      # sets the email address of the new user account.  
    -AccountPassword (ConvertTo-SecureString $password -AsPlainText -Force)      # sets the password of the new user account, using the default password set earlier.
}

# end
