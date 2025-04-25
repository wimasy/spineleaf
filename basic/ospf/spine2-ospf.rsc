# 2025-04-25 13:50:08 by RouterOS 7.16
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
/routing ospf instance
add disabled=no name=ospf-instance-1
/routing ospf area
add disabled=no instance=ospf-instance-1 name=ospf-area-1
/ip address
add address=10.0.0.2 interface=lo network=10.0.0.2
add address=10.1.2.1/30 interface=ether1-leaf1 network=10.1.2.0
add address=10.1.2.5/30 interface=ether2-leaf2 network=10.1.2.4
add address=10.1.2.9/30 interface=ether3-leaf3 network=10.1.2.8
add address=10.1.2.13/30 interface=ether4-leaf4 network=10.1.2.12
/ip dhcp-client
add interface=ether1-leaf1
/routing ospf interface-template
add area=ospf-area-1 disabled=no interfaces=lo passive
add area=ospf-area-1 disabled=no interfaces=\
    ether1-leaf1,ether2-leaf2,ether3-leaf3,ether4-leaf4 type=ptp
/system identity
set name=Spine2
/system note
set show-at-login=no
