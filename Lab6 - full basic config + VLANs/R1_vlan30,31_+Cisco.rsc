# jun/01/2020 15:02:33 by RouterOS 6.46.6
# software id = VSAS-YGQ8
#
# model = 2011UiAS-2HnD
# serial number = 7A670884916F
/interface bridge
add admin-mac=CC:2D:E0:11:11:11 auto-mac=no name=BR_MAIN vlan-filtering=yes
/interface ethernet
set [ find default-name=ether1 ] comment=WAN_SW1_eth24
set [ find default-name=ether2 ] comment=SW1_eth1
set [ find default-name=ether10 ] disabled=yes
/interface wireless
set [ find default-name=wlan1 ] band=2ghz-b/g/n distance=indoors frequency=\
    auto installation=indoor mode=ap-bridge ssid=mkt_tst wireless-protocol=\
    802.11
/interface vlan
add interface=BR_MAIN name=vlan30 vlan-id=30
add interface=BR_MAIN name=vlan31 vlan-id=31
/interface ethernet switch port
set 1 default-vlan-id=1
set 2 default-vlan-id=1
set 3 default-vlan-id=1
set 4 default-vlan-id=1
set 5 default-vlan-id=1
/interface list
add comment=defconf name=WAN
add comment=defconf name=LAN
/interface wireless security-profiles
set [ find default=yes ] authentication-types=wpa2-psk eap-methods="" mode=\
    dynamic-keys supplicant-identity=MikroTik wpa2-pre-shared-key=123qweASD1
/ip pool
add name=default-dhcp ranges=192.168.88.10-192.168.88.254
/user group
set full policy="local,telnet,ssh,ftp,reboot,read,write,policy,test,winbox,pas\
    sword,web,sniff,sensitive,api,romon,dude,tikapp"
/interface bridge port
add bridge=BR_MAIN comment=SW1_eth1 interface=ether2 pvid=30
add bridge=BR_MAIN interface=ether4
add bridge=BR_MAIN interface=ether3
add bridge=BR_MAIN interface=ether5
/ip neighbor discovery-settings
set discover-interface-list=all
/interface bridge vlan
add bridge=BR_MAIN tagged=ether2,BR_MAIN vlan-ids=31
add bridge=BR_MAIN tagged=BR_MAIN untagged=ether2 vlan-ids=30
/interface wireless cap
set bridge=BR_MAIN certificate=request discovery-interfaces=vlan30 \
    interfaces=wlan1
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
