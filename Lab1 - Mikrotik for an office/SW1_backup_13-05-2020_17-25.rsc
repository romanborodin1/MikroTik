# may/13/2020 17:25:23 by RouterOS 6.46.6
# software id = T5E2-YQAB
#
# model = CRS125-24G-1S
# serial number = 945008BCA4E7
/interface bridge add admin-mac=CC:2D:E0:90:4B:E2 auto-mac=no comment=WAN name=bridge-WAN
/interface bridge add admin-mac=BE:64:A6:48:7B:F7 auto-mac=no comment=Local name=bridge1-LAN
/interface bridge add admin-mac=EA:46:9C:B9:A1:C4 auto-mac=no comment=Wi-Fi-corporate name=bridge2-WiFi-corp
/interface bridge add admin-mac=86:83:33:27:82:2C auto-mac=no comment=Wi-Fi-guest name=bridge3-WiFi-guest
/interface ethernet set [ find default-name=ether1 ] comment=WAN
/interface list add name=WAN
/interface list add name=LAN
/interface wireless security-profiles set [ find default=yes ] supplicant-identity=MikroTik
/ip pool add name=dhcp_pool0 ranges=192.168.188.2-192.168.188.254
/ip pool add name=dhcp_pool1 ranges=192.168.218.2-192.168.218.254
/ip pool add name=dhcp_pool2 ranges=192.168.220.2-192.168.220.254
/ip dhcp-server add address-pool=dhcp_pool0 disabled=no interface=bridge1-LAN lease-time=8h10m name=dhcp1
/ip dhcp-server add address-pool=dhcp_pool1 disabled=no interface=bridge2-WiFi-corp lease-time=30m name=dhcp2
/ip dhcp-server add address-pool=dhcp_pool2 disabled=no interface=bridge3-WiFi-guest lease-time=30m name=dhcp3
/queue simple add dst=ether1 max-limit=10M/10M name=All target=192.168.0.0/16
/queue simple add dst=ether1 limit-at=5M/5M max-limit=10M/10M name=Local parent=All priority=2/2 queue=pcq-upload-default/pcq-download-default target=192.168.188.0/24
/queue simple add dst=ether1 max-limit=5M/5M name=WiFi-corp parent=All priority=6/6 queue=pcq-upload-default/pcq-download-default target=192.168.210.0/24
/queue simple add dst=ether1 max-limit=5M/5M name=WiFi-guest parent=All queue=pcq-upload-default/pcq-download-default target=192.168.220.0/24
/user group set full policy=local,telnet,ssh,ftp,reboot,read,write,policy,test,winbox,password,web,sniff,sensitive,api,romon,dude,tikapp
/interface bridge port add bridge=bridge-WAN interface=ether2
/interface bridge port add bridge=bridge1-LAN interface=ether3
/interface bridge port add bridge=bridge1-LAN interface=ether4
/interface bridge port add bridge=bridge1-LAN interface=ether5
/interface bridge port add bridge=bridge1-LAN interface=ether6
/interface bridge port add bridge=bridge1-LAN interface=ether7
/interface bridge port add bridge=bridge1-LAN interface=ether8
/interface bridge port add bridge=bridge2-WiFi-corp interface=ether9
/interface bridge port add bridge=bridge-WAN comment=defconf interface=ether10
/interface bridge port add bridge=bridge-WAN comment=defconf interface=ether11
/interface bridge port add bridge=bridge-WAN comment=defconf interface=ether12
/interface bridge port add bridge=bridge-WAN comment=defconf interface=ether13
/interface bridge port add bridge=bridge-WAN comment=defconf interface=ether14
/interface bridge port add bridge=bridge-WAN comment=defconf interface=ether15
/interface bridge port add bridge=bridge-WAN comment=defconf interface=ether16
/interface bridge port add bridge=bridge-WAN comment=defconf interface=ether17
/interface bridge port add bridge=bridge-WAN comment=defconf interface=ether18
/interface bridge port add bridge=bridge-WAN comment=defconf interface=ether19
/interface bridge port add bridge=bridge-WAN comment=defconf interface=ether20
/interface bridge port add bridge=bridge-WAN comment=defconf interface=ether21
/interface bridge port add bridge=bridge-WAN comment=defconf interface=ether22
/interface bridge port add bridge=bridge-WAN interface=ether23
/interface bridge port add bridge=bridge-WAN interface=ether24
/interface bridge port add bridge=bridge-WAN comment=defconf interface=sfp1
/interface bridge port add bridge=bridge-WAN interface=ether1
/interface list member add interface=ether1 list=WAN
/interface list member add interface=bridge1-LAN list=LAN
/interface list member add interface=bridge2-WiFi-corp list=LAN
/interface list member add interface=bridge3-WiFi-guest list=LAN
/interface list member add interface=bridge-WAN list=WAN
/ip address add address=172.24.68.121/23 comment=WAN interface=bridge-WAN network=172.24.68.0
/ip address add address=192.168.188.1/24 comment=Local interface=bridge1-LAN network=192.168.188.0
/ip address add address=192.168.218.1/24 comment=Wi-Fi-corporate interface=bridge2-WiFi-corp network=192.168.218.0
/ip address add address=192.168.220.1/24 comment=Wi-Fi-guest interface=bridge3-WiFi-guest network=192.168.220.0
/ip dhcp-client add interface=bridge-WAN
/ip dhcp-server network add address=192.168.188.0/24 dns-server=192.168.188.2,192.168.188.1 gateway=192.168.188.1
/ip dhcp-server network add address=192.168.218.0/24 dns-server=192.168.218.1 gateway=192.168.218.1
/ip dhcp-server network add address=192.168.220.0/24 dns-server=192.168.220.1 gateway=192.168.220.1
/ip dns set servers=77.88.8.8,77.88.8.1
/ip firewall address-list add address=172.24.68.0/23 list=admin
/ip firewall address-list add address=172.24.68.140 list=admin
/ip firewall address-list add address=172.24.68.88 list=admin
/ip firewall address-list add address=vk.com list=social
/ip firewall filter add action=accept chain=input comment="Established / Related" connection-state=established,related
/ip firewall filter add action=accept chain=forward connection-state=established,related
/ip firewall filter add action=drop chain=input comment=Invalid connection-state=invalid in-interface-list=WAN
/ip firewall filter add action=drop chain=forward connection-state=invalid in-interface-list=WAN
/ip firewall filter add action=accept chain=input comment=WinBox,SSH dst-port=8291,22 in-interface-list=WAN log=yes protocol=tcp src-address-list=admin
/ip firewall filter add action=accept chain=input comment="ICMP ping (type=0, code=8)" icmp-options=0:8 in-interface-list=WAN packet-size=100 protocol=icmp
/ip firewall filter add action=drop chain=input comment="Drop all other packets from WAN" in-interface-list=WAN
/ip firewall filter add action=drop chain=forward connection-nat-state=!dstnat in-interface-list=WAN
/ip firewall filter add action=accept chain=forward comment="Wi-Fi-corporate allow access" dst-port=5060,36600-39999,53,123,443 in-interface=bridge2-WiFi-corp protocol=udp
/ip firewall filter add action=accept chain=forward comment="Wi-Fi-corporate allow access" dst-port=80,443,25,995,993,465,587,110,143,3389 in-interface=bridge2-WiFi-corp protocol=tcp
/ip firewall filter add action=accept chain=forward comment="Wi-Fi-corporate allow access" in-interface=bridge2-WiFi-corp protocol=icmp
/ip firewall filter add action=reject chain=forward comment="Wi-Fi-corporate reject access with an info message" in-interface=bridge2-WiFi-corp reject-with=icmp-admin-prohibited
/ip firewall filter add action=accept chain=forward comment="Wi-Fi-guest access to Internet" in-interface=bridge3-WiFi-guest out-interface-list=WAN
/ip firewall filter add action=drop chain=forward comment="Wi-Fi-guest deny access to all places except WAN" in-interface=bridge3-WiFi-guest
/ip firewall nat add action=src-nat chain=srcnat dst-address=!192.168.0.0/16 out-interface=bridge-WAN src-address=192.168.0.0/16 to-addresses=172.24.68.121
/ip route add distance=1 gateway=172.24.68.1
/system clock set time-zone-name=Europe/Moscow
/system identity set name=SW1
