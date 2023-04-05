
# Change this to the name of your network adapter
$adapterName = "Ethernet" 
# Change this to the IP address you want to set
$ipAddress = "192.168.1.100" 
# Change this to your subnet mask 
$subnetMask = "255.255.255.0" 
# Change this to your default gateway IP address
$defaultGateway = "192.168.1.1"  

# Get the network adapter object
$adapter = Get-NetAdapter | Where-Object {$_.Name -eq $adapterName}

# Set the IP address, subnet mask, and default gateway
$adapter | Set-NetIPAddress -IPAddress $ipAddress -PrefixLength 24
$adapter | Set-NetIPInterface -InterfaceMetric 2
$adapter | Set-NetIPInterface -AddressFamily IPv4 -Dhcp Disabled
$adapter | New-NetRoute -DestinationPrefix 0.0.0.0/0 -NextHop $defaultGateway

# Display the new IP address configuration
$adapter | Get-NetIPAddress
