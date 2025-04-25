# 2025-04-25 13:42:59 by RouterOS 7.16
# software id = 
#
/interface ethernet
set [ find default-name=ether1 ] disable-running-check=no name=ether1-leaf1
set [ find default-name=ether2 ] disable-running-check=no name=ether2-leaf2
set [ find default-name=ether3 ] disable-running-check=no name=ether3-leaf3
set [ find default-name=ether4 ] disable-running-check=no name=ether4-leaf4
set [ find default-name=ether5 ] disable-running-check=no
set [ find default-name=ether6 ] disable-running-check=no
set [ find default-name=ether7 ] disable-running-check=no
set [ find default-name=ether8 ] disable-running-check=no
/port
set 0 name=serial0
/routing isis instance
add areas=51.0001 name=isis-1 system-id=0000.0000.0001
/ip address
add address=10.0.0.1 interface=lo network=10.0.0.1
add address=10.1.1.1/30 interface=ether1-leaf1 network=10.1.1.0
add address=10.1.1.5/30 interface=ether2-leaf2 network=10.1.1.4
add address=10.1.1.9/30 interface=ether3-leaf3 network=10.1.1.8
add address=10.1.1.13/30 interface=ether4-leaf4 network=10.1.1.12
/ip dhcp-client
add interface=ether1-leaf1
/routing isis interface-template
add instance=isis-1 interfaces=\
    ether1-leaf1,ether2-leaf2,ether3-leaf3,ether4-leaf4,lo levels=l1,l2
/system identity
set name=Spine1
/system note
set show-at-login=no
