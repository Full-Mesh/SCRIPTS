# Justin H, Paul, Spencer, Ademola
# Auto Populate Users
# 4/5/23

Add-WindowsCapability -Name Rsat.ActiveDirectory.DS-LDA.tool~~~~0.0.1.0 -Online

Import-Module ActiveDirectory 
$ADUser = Import-Csv "C:\Users\Administrator\Documents\GreenGenius.csv"
$password = "Password123!@#"

foreach ($User in $ADUser) {
    New-ADUser `
    -Name "$($User.firstname) $($User.lastname)" `
    -GivenName $User.firstname `
    -Surname $User.lastname `
    -Enabled $true `
    -Path "OU=$($User.OU),DC=GreenGenius,DC=com" `
    -Title $User.jobtitle `
    -EmailAddress $User.email `
    -AccountPassword (ConvertTo-SecureString $password -AsPlainText -Force)
}

# end
