# jun/08/2020 17:02:23 by RouterOS 6.45.3
# software id = JX33-I0UT
#
# model = RB951Ui-2nD
# serial number = B8D30B38348A
/interface bridge
add admin-mac=C4:AD:34:2C:4E:67 auto-mac=no name=BR_MAIN
/interface wireless
set [ find default-name=wlan1 ] band=2ghz-b/g/n channel-width=20/40mhz-XX \
    distance=indoors frequency=auto installation=indoor mode=ap-bridge ssid=\
    MikroTik-2C4E6B wireless-protocol=802.11
/interface vlan
add comment=Office interface=BR_MAIN name=vlan30 vlan-id=30
add comment=Guest interface=BR_MAIN name=vlan31 vlan-id=31
/interface ethernet switch port
set 1 default-vlan-id=30 vlan-header=add-if-missing vlan-mode=secure
set 2 default-vlan-id=30 vlan-mode=secure
set 3 default-vlan-id=30 vlan-mode=secure
set 4 default-vlan-id=30 vlan-mode=secure
set 5 vlan-mode=secure
/interface list
add comment=defconf name=WAN
add comment=defconf name=LAN
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip hotspot profile
set [ find default=yes ] html-directory=flash/hotspot
/interface bridge port
add bridge=BR_MAIN interface=ether2
add bridge=BR_MAIN interface=ether3
add bridge=BR_MAIN interface=ether4
add bridge=BR_MAIN interface=wlan1
add bridge=BR_MAIN interface=ether5
/ip neighbor discovery-settings
set discover-interface-list=all
/interface ethernet switch vlan
add ports=ether2,ether3,ether4,ether5,switch1-cpu switch=switch1 vlan-id=30
add ports=ether2,ether3,ether4,ether5,switch1-cpu switch=switch1 vlan-id=31
/interface list member
add comment=defconf list=LAN
add comment=defconf interface=ether1 list=WAN
/ip address
add address=192.168.30.4/24 comment=Office interface=vlan30 network=\
    192.168.30.0
add address=172.16.31.4/24 comment=Guest interface=vlan31 network=172.16.31.0
/ip dhcp-client
add comment=defconf dhcp-options=hostname,clientid disabled=no interface=\
    ether1
/ip dns
set allow-remote-requests=yes
/ip firewall filter
add action=accept chain=input comment=\
    "defconf: accept established,related,untracked" connection-state=\
    established,related,untracked
add action=drop chain=input comment="defconf: drop invalid" connection-state=\
    invalid
add action=accept chain=input comment="defconf: accept ICMP" protocol=icmp
add action=accept chain=input comment=\
    "defconf: accept to local loopback (for CAPsMAN)" dst-address=127.0.0.1
add action=accept chain=input comment="SSH,Winbox from WAN" dst-port=22,8291 \
    in-interface-list=WAN protocol=tcp
add action=drop chain=input comment="defconf: drop all not coming from LAN" \
    in-interface-list=!LAN
add action=accept chain=forward comment="defconf: accept in ipsec policy" \
    ipsec-policy=in,ipsec
add action=accept chain=forward comment="defconf: accept out ipsec policy" \
    ipsec-policy=out,ipsec
add action=fasttrack-connection chain=forward comment="defconf: fasttrack" \
    connection-state=established,related
add action=accept chain=forward comment=\
    "defconf: accept established,related, untracked" connection-state=\
    established,related,untracked
add action=drop chain=forward comment="defconf: drop invalid" \
    connection-state=invalid
add action=drop chain=forward comment=\
    "defconf: drop all from WAN not DSTNATed" connection-nat-state=!dstnat \
    connection-state=new in-interface-list=WAN
/ip firewall nat
add action=masquerade chain=srcnat comment="defconf: masquerade" \
    ipsec-policy=out,none out-interface-list=WAN
/system clock
set time-zone-name=Europe/Moscow
/system identity
set name=R2
