# may/14/2020 21:26:04 by RouterOS 6.46.6
# software id = T5E2-YQAB
#
# model = CRS125-24G-1S
# serial number = 945008BCA4E7
/interface bridge
add admin-mac=CC:2D:E0:90:4B:E2 auto-mac=no comment=WAN name=bridge-WAN
add admin-mac=BE:64:A6:48:7B:F7 auto-mac=no comment=Local name=bridge1-LAN
add admin-mac=EA:46:9C:B9:A1:C4 auto-mac=no comment=Wi-Fi-corporate name=\
    bridge2-WiFi-corp
add admin-mac=86:83:33:27:82:2C auto-mac=no comment=Wi-Fi-guest name=\
    bridge3-WiFi-guest
/interface ethernet
set [ find default-name=ether1 ] comment=WAN
/interface list
add name=WAN
add name=LAN
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip pool
add name=dhcp_pool0 ranges=192.168.188.2-192.168.188.254
add name=dhcp_pool1 ranges=192.168.218.2-192.168.218.254
add name=dhcp_pool2 ranges=192.168.220.2-192.168.220.254
/ip dhcp-server
add address-pool=dhcp_pool0 disabled=no interface=bridge1-LAN lease-time=\
    8h10m name=dhcp1
add address-pool=dhcp_pool1 disabled=no interface=bridge2-WiFi-corp \
    lease-time=30m name=dhcp2
add address-pool=dhcp_pool2 disabled=no interface=bridge3-WiFi-guest \
    lease-time=30m name=dhcp3
/queue simple
add dst=ether1 max-limit=10M/10M name=All target=192.168.0.0/16
add dst=ether1 limit-at=5M/5M max-limit=10M/10M name=Local parent=All \
    priority=2/2 queue=pcq-upload-default/pcq-download-default target=\
    192.168.188.0/24
add dst=ether1 max-limit=5M/5M name=WiFi-corp parent=All priority=6/6 queue=\
    pcq-upload-default/pcq-download-default target=192.168.210.0/24
add dst=ether1 max-limit=5M/5M name=WiFi-guest parent=All queue=\
    pcq-upload-default/pcq-download-default target=192.168.220.0/24
/user group
set full policy="local,telnet,ssh,ftp,reboot,read,write,policy,test,winbox,pas\
    sword,web,sniff,sensitive,api,romon,dude,tikapp"
/interface bridge port
add bridge=bridge-WAN interface=ether2
add bridge=bridge1-LAN interface=ether3
add bridge=bridge1-LAN interface=ether4
add bridge=bridge1-LAN interface=ether5
add bridge=bridge1-LAN interface=ether6
add bridge=bridge1-LAN interface=ether7
add bridge=bridge1-LAN interface=ether8
add bridge=bridge2-WiFi-corp interface=ether9
add bridge=bridge-WAN comment=defconf interface=ether10
add bridge=bridge-WAN comment=defconf interface=ether11
add bridge=bridge-WAN comment=defconf interface=ether12
add bridge=bridge-WAN comment=defconf interface=ether13
add bridge=bridge-WAN comment=defconf interface=ether14
add bridge=bridge-WAN comment=defconf interface=ether15
add bridge=bridge-WAN comment=defconf interface=ether16
add bridge=bridge-WAN comment=defconf interface=ether17
add bridge=bridge-WAN comment=defconf interface=ether18
add bridge=bridge-WAN comment=defconf interface=ether19
add bridge=bridge-WAN comment=defconf interface=ether20
add bridge=bridge-WAN comment=defconf interface=ether21
add bridge=bridge-WAN comment=defconf interface=ether22
add bridge=bridge-WAN interface=ether23
add bridge=bridge-WAN interface=ether24
add bridge=bridge-WAN comment=defconf interface=sfp1
add bridge=bridge-WAN interface=ether1
/ip settings
set tcp-syncookies=yes
/interface list member
add interface=ether1 list=WAN
add interface=bridge1-LAN list=LAN
add interface=bridge2-WiFi-corp list=LAN
add interface=bridge3-WiFi-guest list=LAN
add interface=bridge-WAN list=WAN
/ip address
add address=172.24.68.121/23 comment=WAN interface=bridge-WAN network=\
    172.24.68.0
add address=192.168.188.1/24 comment=Local interface=bridge1-LAN network=\
    192.168.188.0
add address=192.168.218.1/24 comment=Wi-Fi-corporate interface=\
    bridge2-WiFi-corp network=192.168.218.0
add address=192.168.220.1/24 comment=Wi-Fi-guest interface=bridge3-WiFi-guest \
    network=192.168.220.0
/ip dhcp-client
add interface=bridge-WAN
/ip dhcp-server network
add address=192.168.188.0/24 dns-server=192.168.188.2,192.168.188.1 gateway=\
    192.168.188.1
add address=192.168.218.0/24 dns-server=192.168.218.1 gateway=192.168.218.1
add address=192.168.220.0/24 dns-server=192.168.220.1 gateway=192.168.220.1
/ip dns
set allow-remote-requests=yes servers=8.8.8.8,8.8.4.4
/ip firewall address-list
add address=172.24.68.0/23 list=admin
add address=172.24.68.140 list=admin
add address=172.24.68.88 list=admin
add address=testdomain1.ddns.net list=management
add address=172.24.68.0/23 list=management
/ip firewall filter
add action=accept chain=input comment=Established/Related connection-state=\
    established,related
add action=drop chain=input comment="Drop invalid" connection-state=invalid \
    in-interface-list=WAN
add action=accept chain=input comment=OpenVPN dst-port=1194 \
    in-interface-list=WAN protocol=tcp
add action=accept chain=input comment=WinBox dst-port=8291,22 \
    in-interface-list=WAN protocol=tcp src-address-list=management
add action=add-src-to-address-list address-list=scanner address-list-timeout=\
    1w chain=forward comment="PortScanner detection" in-interface-list=WAN \
    protocol=tcp psd=10,3s,3,1
add action=add-src-to-address-list address-list=black_list \
    address-list-timeout=1d chain=forward comment="DoS protection" \
    connection-limit=10,32 in-interface-list=WAN log=yes protocol=tcp
add action=tarpit chain=forward comment="DoS protection" connection-limit=\
    10,32 in-interface-list=WAN log=yes protocol=tcp src-address-list=\
    black_list
add action=jump chain=input comment="ICMP accept rules" in-interface-list=WAN \
    jump-target=ICMP limit=5,5:packet protocol=icmp
add action=accept chain=ICMP icmp-options=0:0 protocol=icmp
add action=accept chain=ICMP icmp-options=0:8 protocol=icmp
add action=accept chain=ICMP icmp-options=11:0 protocol=icmp
add action=accept chain=ICMP icmp-options=3:4 protocol=icmp
add action=accept chain=ICMP icmp-options=3:3 protocol=icmp
add action=accept chain=input comment="DNS protection" dst-port=53 \
    in-interface=bridge1-LAN limit=10,15:packet protocol=udp
add action=drop chain=input comment="Drop all other pachets"
/ip firewall nat
add action=src-nat chain=srcnat dst-address=!192.168.0.0/16 out-interface=\
    bridge-WAN src-address=192.168.0.0/16 to-addresses=172.24.68.121
add action=src-nat chain=srcnat dst-address=!192.168.0.0/16 out-interface=\
    bridge-WAN src-address=192.168.0.0/16 to-addresses=172.24.68.121
/ip route
add distance=1 gateway=172.24.68.1
/ip service
set telnet disabled=yes
set ftp disabled=yes
set www disabled=yes
set api disabled=yes
set api-ssl disabled=yes
/lcd
set enabled=no touch-screen=disabled
/system clock
set time-zone-name=Europe/Moscow
/system identity
set name=SW1
/system scheduler
add interval=5m name=noip on-event="/system script run 0" policy=\
    read,write,test start-date=may/14/2020 start-time=12:20:34
/system script
add comment="Script for DDNS at service noip.com" dont-require-permissions=\
    yes name=noip owner=roma policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="#\
    ##########Script Settings###########\r\
    \n:local NOIPUser \"romchegue\"\r\
    \n:local NOIPPass \"7,,,B.haPpy!!1\"\r\
    \n:local WANInter \"bridge-WAN\"\r\
    \n################################\r\
    \n\r\
    \n:local NOIPDomain \"testdomain1.ddns.net\"\r\
    \n:local IpCurrent [/ip address get [find interface=\$WANInter] address];\
    \r\
    \n:for i from=( [:len \$IpCurrent] - 1 ) to=0 do={\r\
    \n    :if ( [:pick \$IpCurrent \$i] = \"/\") do={\r\
    \n        :local NewIP [:pick \$IpCurrent 0 \$i];\r\
    \n        :if ([:resolve \$NOIPDomain] != \$NewIP) do={\r\
    \n            /tool fetch mode=http url=\"http://\$NOIPUser:\$NOIPPass@dyn\
    update.no-ip.com/nic/update\?hostname=\$NOIPDomain&myip=\$NewIP\" keep-res\
    ult=no\r\
    \n            :log info \"NO-IP Update: \$NOIPDomain - \$NewIP\"\r\
    \n        }\r\
    \n    }\r\
    \n} "
