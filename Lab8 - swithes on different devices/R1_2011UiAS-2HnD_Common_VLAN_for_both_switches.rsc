# jun/08/2020 17:03:34 by RouterOS 6.46.6
# software id = VSAS-YGQ8
#
# model = 2011UiAS-2HnD
# serial number = 7A670884916F
/interface bridge
add admin-mac=CC:2D:E0:11:11:11 auto-mac=no name=BR_MAIN
add admin-mac=CC:2D:E0:39:CD:6A auto-mac=no name=BR_MAIN_2
/interface ethernet
set [ find default-name=ether1 ] comment=WAN_SW1_eth24
set [ find default-name=ether2 ] comment=SW1_eth1
/interface wireless
# managed by CAPsMAN
# channel: 2412/20-Ce/gn(13dBm), SSID: Office, local forwarding
set [ find default-name=wlan1 ] band=2ghz-b/g/n disabled=no distance=indoors \
    frequency=auto installation=indoor mode=ap-bridge ssid=mkt_tst \
    wireless-protocol=802.11
/interface vlan
add interface=BR_MAIN name=vlan30 vlan-id=30
add interface=BR_MAIN name=vlan31 vlan-id=31
/interface ethernet switch port
set 1 default-vlan-id=1
set 2 default-vlan-id=30 vlan-header=add-if-missing vlan-mode=secure
set 3 default-vlan-id=30 vlan-header=always-strip vlan-mode=secure
set 4 default-vlan-id=30 vlan-header=always-strip vlan-mode=secure
set 5 default-vlan-id=30 vlan-header=add-if-missing vlan-mode=secure
set 6 default-vlan-id=30 vlan-header=add-if-missing vlan-mode=secure
set 7 default-vlan-id=30 vlan-header=add-if-missing vlan-mode=secure
set 8 default-vlan-id=30 vlan-header=always-strip vlan-mode=secure
set 9 default-vlan-id=30 vlan-header=always-strip vlan-mode=secure
set 10 default-vlan-id=30 vlan-header=always-strip vlan-mode=secure
set 11 vlan-mode=secure
set 12 vlan-mode=secure
/interface list
add comment=defconf name=WAN
add comment=defconf name=LAN
/interface wireless security-profiles
set [ find default=yes ] authentication-types=wpa2-psk eap-methods="" mode=\
    dynamic-keys supplicant-identity=MikroTik wpa2-pre-shared-key=123qweASD1
/user group
set full policy="local,telnet,ssh,ftp,reboot,read,write,policy,test,winbox,pas\
    sword,web,sniff,sensitive,api,romon,dude,tikapp"
/interface bridge port
add bridge=BR_MAIN comment=SW1_eth1 interface=ether2
add bridge=BR_MAIN interface=ether4
add bridge=BR_MAIN interface=ether3
add bridge=BR_MAIN interface=ether5
add bridge=BR_MAIN_2 interface=ether6
add bridge=BR_MAIN_2 interface=ether7
add bridge=BR_MAIN_2 interface=ether8
add bridge=BR_MAIN_2 interface=ether9
add bridge=BR_MAIN_2 interface=ether10
add bridge=BR_MAIN interface=wlan1
add bridge=BR_MAIN interface=sfp1
/ip neighbor discovery-settings
set discover-interface-list=all
/interface ethernet switch vlan
add independent-learning=yes ports=ether2,ether3,ether4,ether5,switch1-cpu \
    switch=switch1 vlan-id=30
add independent-learning=yes ports=ether2,ether3,ether4,ether5,switch1-cpu \
    switch=switch1 vlan-id=31
add ports=switch2-cpu,ether6,ether7,ether8,ether9,ether10 switch=switch2 \
    vlan-id=30
add ports=switch2-cpu,ether6,ether7,ether8,ether9,ether10 switch=switch2 \
    vlan-id=31
/interface wireless cap
# 
set bridge=BR_MAIN certificate=request discovery-interfaces=vlan30 enabled=\
    yes interfaces=wlan1
/ip address
add address=192.168.30.3/24 comment=Office interface=vlan30 network=\
    192.168.30.0
add address=172.16.31.3/24 comment=Guest interface=vlan31 network=172.16.31.0
/ip dhcp-client
add comment=defconf disabled=no interface=ether1
/ip dns
set allow-remote-requests=yes
/ip firewall nat
add action=masquerade chain=srcnat disabled=yes out-interface=ether1
/ip route
add distance=1 gateway=192.168.30.1
/ip service
set telnet disabled=yes
set ftp disabled=yes
set www disabled=yes
set api disabled=yes
set api-ssl disabled=yes
/lcd interface pages
set 0 interfaces=wlan1
/system clock
set time-zone-name=Europe/Moscow
/system identity
set name=R1
/system logging
add prefix=DDDDDDD topics=debug
