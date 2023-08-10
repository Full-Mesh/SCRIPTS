#!/bin/sh


# CMD Code to reserve static DNS

netsh interface ip set dns name="YOUR_INTERFACE_NAME" source=static addr="NEW_DNS_IP_ADDRESS"

# CMD Code to reserved static IPv4 addr
netsh interface ipv4 add address "INTERFACE_NAME" "STATIC_IP" "SUBNET_MASK" "DEFAULT_GATEWAY" skipassource=true

# Identify the Network Interface Name:
netsh interface ipv4 show interfaces

# Remove the Static IP Address: On an internal network adapter
netsh interface ipv4 set address "INTERFACE_NAME" dhcp

# Verify the Changes:
netsh interface ipv4 show config "INTERFACE_NAME"

# Restart the Network Interface (Optional):
netsh interface set interface "INTERFACE_NAME" admin=disable
netsh interface set interface "INTERFACE_NAME" admin=enable
