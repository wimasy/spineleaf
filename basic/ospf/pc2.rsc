# 2025-04-25 13:47:43 by RouterOS 7.16
# software id = 
#
/interface bridge
add name=bridge0
/interface ethernet
set [ find default-name=ether1 ] disable-running-check=no
set [ find default-name=ether2 ] disable-running-check=no
set [ find default-name=ether3 ] disable-running-check=no
set [ find default-name=ether4 ] disable-running-check=no
set [ find default-name=ether5 ] disable-running-check=no
set [ find default-name=ether6 ] disable-running-check=no
set [ find default-name=ether7 ] disable-running-check=no
set [ find default-name=ether8 ] disable-running-check=no
/port
set 0 name=serial0
/interface bridge port
add bridge=bridge0 interface=ether1
add bridge=bridge0 interface=ether2
/ip address
add address=192.168.200.100/24 interface=bridge0 network=192.168.200.0
/ip dhcp-client
add disabled=yes interface=ether1
/ip route
add distance=1 gateway=192.168.200.1
add distance=1 gateway=192.168.200.2
/system identity
set name=PC-2
/system note
set show-at-login=no

