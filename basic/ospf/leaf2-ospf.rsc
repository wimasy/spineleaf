# 2025-04-25 13:51:04 by RouterOS 7.16
# software id = 
#
/interface ethernet
set [ find default-name=ether1 ] disable-running-check=no name=ether1-spine1
set [ find default-name=ether2 ] disable-running-check=no name=ether2-spine2
set [ find default-name=ether3 ] disable-running-check=no
set [ find default-name=ether4 ] disable-running-check=no name=ether4-pc1
set [ find default-name=ether5 ] disable-running-check=no
set [ find default-name=ether6 ] disable-running-check=no
set [ find default-name=ether7 ] disable-running-check=no
set [ find default-name=ether8 ] disable-running-check=no
/interface bonding
add disabled=yes mode=802.3ad name=bonding1 slaves=ether4-pc1
/port
set 0 name=serial0
/routing ospf instance
add disabled=no name=ospf-instance-1
/routing ospf area
add disabled=no instance=ospf-instance-1 name=ospf-area-1
/ip address
add address=10.0.0.12 interface=lo network=10.0.0.12
add address=10.1.1.6/30 interface=ether1-spine1 network=10.1.1.4
add address=10.1.2.6/30 interface=ether2-spine2 network=10.1.2.4
add address=192.168.100.2/24 interface=ether4-pc1 network=192.168.100.0
/ip dhcp-client
add interface=ether1-spine1
/routing ospf interface-template
add area=ospf-area-1 disabled=no interfaces=lo passive
add area=ospf-area-1 disabled=no interfaces=\
    ether1-spine1,ether2-spine2,ether4-pc1 type=ptp
/system identity
set name=Leaf2
/system note
set show-at-login=no
