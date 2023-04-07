# Script for deploying Active Directory Domain Services (AD DS)

# Import the ADDSDeployment module to allow the script to interact with AD DS deployment tools
Import-Module ADDSDeployment

# Deploy a new AD DS forest with the following configuration settings:

# Install the AD DS forest with DNS delegation set to false
Install-ADDSForest `
-CreateDnsDelegation:$false `

# Set the path for the AD DS database
-DatabasePath "C:\Windows\NTDS" `
# Set the domain mode to Windows Threshold
-DomainMode "WinThreshold" `

# Set the name for the domain
-DomainName "corp.greengenius.com" `

# Set the NetBIOS name for the domain
-DomainNetbiosName "CORP" `

# Set the forest mode to Windows Threshold
-ForestMode "WinThreshold" `

# Install DNS during the AD DS forest installation
-InstallDns:$true `

# Set the path for the AD DS log files
-LogPath "C:\Windows\NTDS" `

# Do not reboot the server after the installation is complete
-NoRebootOnCompletion:$false `

# Set the path for the SYSVOL folder
-SysvolPath "C:\Windows\SYSVOL" `

# Force the installation of the AD DS forest
-Force:$true

