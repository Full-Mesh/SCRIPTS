# Set variables for the new hostname and Active Directory domain
$newHostname = "NEWCOMPUTERNAME"
$domain = "example.com"

# Retrieve the current computer object in Active Directory
$computer = Get-ADComputer -Identity $env:COMPUTERNAME -Server $domain

# Update the hostname attribute of the computer object
Set-ADComputer -Identity $computer -Server $domain -HostName $newHostname

# Update the DNS hostname attribute of the computer object
Set-ADComputer -Identity $computer -Server $domain -DNSHostName "$newHostname.$domain"

# Update the Service Principal Name (SPN) attributes of the computer object
Set-ADComputer -Identity $computer -Server $domain -ServicePrincipalNames `
    @{Add="HOST/$newHostname", "HOST/$newHostname.$domain"}

# Restart the computer to apply the changes
Restart-Computer
