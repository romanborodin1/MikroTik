# may/15/2020 12:18:23 by RouterOS 6.46.6
# software id = VSAS-YGQ8
#
# model = 2011UiAS-2HnD
# serial number = 7A670884916F
/interface bridge
add admin-mac=CC:2D:E0:39:CD:66 auto-mac=no comment=defconf name=bridge
add name=bridge-WiFi-corp
add name=bridge-WiFi-guest
/interface wireless
set [ find default-name=wlan1 ] antenna-gain=0 band=2ghz-onlyn country=\
    russia3 disabled=no distance=indoors frequency=auto installation=indoor \
    mode=ap-bridge ssid=WiFi-Corp wireless-protocol=802.11
/interface list
add comment=defconf name=WAN
add comment=defconf name=LAN
/interface wireless security-profiles
set [ find default=yes ] authentication-types=wpa2-psk eap-methods="" mode=\
    dynamic-keys supplicant-identity=MikroTik wpa2-pre-shared-key=1q2w3e4r5t
add authentication-types=wpa2-psk eap-methods="" management-protection=\
    allowed mode=dynamic-keys name=guest supplicant-identity="" \
    wpa2-pre-shared-key=1q2w3e4r5t
/interface wireless
add disabled=no keepalive-frames=disabled mac-address=CE:2D:E0:39:CD:6F \
    master-interface=wlan1 multicast-buffering=disabled name=wlan2 \
    security-profile=guest ssid=WiFi-Guest wds-cost-range=0 wds-default-cost=\
    0 wps-mode=disabled
/user group
set full policy="local,telnet,ssh,ftp,reboot,read,write,policy,test,winbox,pas\
    sword,web,sniff,sensitive,api,romon,dude,tikapp"
/interface bridge port
add bridge=bridge comment=defconf interface=ether2
add bridge=bridge comment=defconf interface=ether3
add bridge=bridge comment=defconf interface=ether4
add bridge=bridge comment=defconf interface=ether5
add bridge=bridge comment=defconf interface=ether6
add bridge=bridge comment=defconf interface=ether7
add bridge=bridge comment=defconf interface=ether8
add bridge=bridge comment=defconf interface=ether9
add bridge=bridge comment=defconf interface=ether10
add bridge=bridge comment=defconf interface=sfp1
add bridge=bridge-WiFi-corp comment=defconf interface=wlan1
add bridge=bridge-WiFi-corp interface=ether1
add bridge=bridge-WiFi-guest interface=wlan2
/ip neighbor discovery-settings
set discover-interface-list=LAN
/interface list member
add comment=defconf interface=bridge list=LAN
add interface=bridge-WiFi-corp list=LAN
add interface=bridge-WiFi-guest list=LAN
/ip dhcp-client
add disabled=no interface=bridge
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
/lcd
set enabled=no touch-screen=disabled
/system clock
set time-zone-name=Europe/Moscow
/system identity
set name=R1
/tool mac-server
set allowed-interface-list=LAN
/tool mac-server mac-winbox
set allowed-interface-list=LAN
/tool romon
set id=00:00:00:00:00:30 secrets=qsefth123!
/tool romon port
set [ find default=yes ] forbid=yes
add cost=10 disabled=no interface=ether1 secrets=qsefth123!eth3
