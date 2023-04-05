# this script sets a static IP address for the ethernet adapter
# and the hostname according to the variables below
    
$newname = "GRNGNS-WINSVR" # new hostname
$newip = "10.11.11.123"    # new ip address
$newvlsm = 27              # subnet mask in slash notation
$newgtwy = "10.11.11.126"  # new default gateway
​
​
$adapter = Get-NetAdapter  # extract NIC index
Write-Host "Adapter index: $($adapter[0].ifIndex)"
​
# delete the existing IP address and default gateway
Remove-NetIPAddress -InterfaceIndex $($adapter[0].ifIndex) -Confirm:$false
Remove-NetRoute -InterfaceIndex $($adapter[0].ifIndex) -Confirm:$false
​
​
# set the static IP using the variables as inputs
New-NetIPAddress -InterfaceIndex $adapter[0].ifIndex -IPAddress $newip -PrefixLength $newvlsm -DefaultGateway $newgtwy
​
# change the hostname
Rename-Computer -NewName $newname
​
sleep 1
ipconfig
hostname
