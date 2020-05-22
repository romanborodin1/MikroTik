# may/15/2020 21:22:21 by RouterOS 6.46.6
# software id = T5E2-YQAB
#
# model = CRS125-24G-1S
# serial number = 945008BCA4E7
/interface bridge add admin-mac=CC:2D:E0:90:4B:E2 auto-mac=no comment=WAN name=bridge-WAN
/interface bridge add admin-mac=BE:64:A6:48:7B:F7 auto-mac=no comment=Local dhcp-snooping=yes name=bridge1-LAN priority=0 pvid=30 vlan-filtering=yes
/interface bridge add admin-mac=EA:46:9C:B9:A1:C4 auto-mac=no comment=Wi-Fi-corporate name=bridge2-WiFi-corp priority=0x1000 vlan-filtering=yes
/interface bridge add admin-mac=86:83:33:27:82:2C auto-mac=no comment=Wi-Fi-guest name=bridge3-WiFi-guest priority=0x1000 vlan-filtering=yes
/interface ethernet set [ find default-name=ether23 ] comment=WAN
/interface ethernet set [ find default-name=ether24 ] comment=WAN
/interface vlan add comment=MGMT interface=bridge1-LAN name=bridge1-LAN.77 vlan-id=77
/interface list add name=WAN
/interface list add name=LAN
/interface wireless security-profiles set [ find default=yes ] supplicant-identity=MikroTik
/ip pool add name=dhcp_pool0 ranges=192.168.188.2-192.168.188.254
/ip pool add name=dhcp_pool1 ranges=192.168.218.2-192.168.218.254
/ip pool add name=dhcp_pool2 ranges=192.168.220.2-192.168.220.254
/ip dhcp-server add address-pool=dhcp_pool0 disabled=no interface=bridge1-LAN lease-time=8h10m name=dhcp1
/ip dhcp-server add address-pool=dhcp_pool1 disabled=no interface=bridge2-WiFi-corp lease-time=30m name=dhcp2
/ip dhcp-server add address-pool=dhcp_pool2 disabled=no interface=bridge3-WiFi-guest lease-time=30m name=dhcp3
/queue simple add disabled=yes dst=ether1 max-limit=10M/10M name=All target=192.168.0.0/16
/queue simple add disabled=yes dst=ether1 limit-at=5M/5M max-limit=10M/10M name=Local parent=All priority=2/2 queue=pcq-upload-default/pcq-download-default target=192.168.188.0/24
/queue simple add disabled=yes dst=ether1 max-limit=5M/5M name=WiFi-corp parent=All priority=6/6 queue=pcq-upload-default/pcq-download-default target=192.168.210.0/24
/queue simple add disabled=yes dst=ether1 max-limit=5M/5M name=WiFi-guest parent=All queue=pcq-upload-default/pcq-download-default target=192.168.220.0/24
/user group set full policy=local,telnet,ssh,ftp,reboot,read,write,policy,test,winbox,password,web,sniff,sensitive,api,romon,dude,tikapp
/interface bridge port add bridge=bridge1-LAN interface=ether2 pvid=30
/interface bridge port add bridge=bridge1-LAN interface=ether3 pvid=30
/interface bridge port add bridge=bridge1-LAN interface=ether4 pvid=30
/interface bridge port add bridge=bridge1-LAN interface=ether5 pvid=30
/interface bridge port add bridge=bridge1-LAN interface=ether6 pvid=30
/interface bridge port add bridge=bridge1-LAN interface=ether7 pvid=30
/interface bridge port add bridge=bridge1-LAN interface=ether8 pvid=30
/interface bridge port add bridge=bridge1-LAN interface=ether9 pvid=30
/interface bridge port add bridge=bridge1-LAN interface=ether10 pvid=30
/interface bridge port add bridge=bridge1-LAN interface=ether11 pvid=30
/interface bridge port add bridge=bridge1-LAN interface=ether12 pvid=30
/interface bridge port add bridge=bridge1-LAN interface=ether13 pvid=30
/interface bridge port add bridge=bridge1-LAN interface=ether14 pvid=30
/interface bridge port add bridge=bridge1-LAN interface=ether15 pvid=30
/interface bridge port add bridge=bridge1-LAN interface=ether17 pvid=30
/interface bridge port add bridge=bridge1-LAN interface=ether18 pvid=30
/interface bridge port add bridge=bridge1-LAN interface=ether19 pvid=30
/interface bridge port add bridge=bridge1-LAN interface=ether20 pvid=30
/interface bridge port add bridge=bridge1-LAN interface=ether21 pvid=30 trusted=yes
/interface bridge port add bridge=bridge1-LAN interface=ether22 pvid=30 trusted=yes
/interface bridge port add bridge=bridge1-LAN interface=ether23 pvid=30
/interface bridge port add bridge=bridge-WAN interface=ether24
/interface bridge port add bridge=bridge1-LAN interface=sfp1 pvid=30
/interface bridge port add bridge=bridge1-LAN interface=ether1 pvid=30
/ip settings set tcp-syncookies=yes
/interface bridge vlan add bridge=bridge1-LAN tagged=ether21,ether22 vlan-ids=30
/interface bridge vlan add bridge=bridge1-LAN comment=MGMT tagged=bridge1-LAN,ether21,ether22 vlan-ids=77
/interface list member add interface=ether23 list=WAN
/interface list member add interface=bridge1-LAN list=LAN
/interface list member add interface=bridge2-WiFi-corp list=LAN
/interface list member add interface=bridge3-WiFi-guest list=LAN
/interface list member add interface=bridge-WAN list=WAN
/interface list member add interface=ether24 list=WAN
/interface list member add interface=bridge1-LAN.77 list=LAN
/ip address add address=192.168.188.1/24 comment=Local interface=bridge1-LAN network=192.168.188.0
/ip address add address=192.168.218.1/24 comment=Wi-Fi-corporate interface=bridge2-WiFi-corp network=192.168.218.0
/ip address add address=192.168.220.1/24 comment=Wi-Fi-guest interface=bridge3-WiFi-guest network=192.168.220.0
/ip address add address=172.24.113.200/24 comment=WAN interface=bridge-WAN network=172.24.113.0
/ip address add address=10.0.77.1/24 comment=MGMT interface=bridge1-LAN.77 network=10.0.77.0
/ip dhcp-server network add address=192.168.188.0/24 dns-server=192.168.188.1 gateway=192.168.188.1
/ip dhcp-server network add address=192.168.218.0/24 dns-server=192.168.218.1 gateway=192.168.218.1
/ip dhcp-server network add address=192.168.220.0/24 dns-server=192.168.220.1 gateway=192.168.220.1
/ip dns set allow-remote-requests=yes servers=172.24.60.61
/ip firewall address-list add address=172.24.68.0/23 list=management
/ip firewall address-list add address=172.24.113.0/24 list=management
/ip firewall filter add action=accept chain=input comment=Established/Related connection-state=established,related
/ip firewall filter add action=drop chain=input comment="Drop invalid" connection-state=invalid in-interface-list=WAN
/ip firewall filter add action=accept chain=input comment=OpenVPN dst-port=1194 in-interface-list=WAN protocol=tcp
/ip firewall filter add action=accept chain=input comment="WinBox access from WAN" dst-port=8291,22 in-interface-list=WAN protocol=tcp src-address-list=management
/ip firewall filter add action=accept chain=input comment="WinBox access from LAN" dst-port=8291,22 in-interface=bridge1-LAN protocol=tcp src-address-list=""
/ip firewall filter add action=add-src-to-address-list address-list=scanner address-list-timeout=1w chain=forward comment="PortScanner detection" in-interface-list=WAN protocol=tcp psd=10,3s,3,1
/ip firewall filter add action=add-src-to-address-list address-list=black_list address-list-timeout=1d chain=forward comment="DoS protection" connection-limit=10,32 in-interface-list=WAN log=yes protocol=tcp
/ip firewall filter add action=tarpit chain=forward comment="DoS protection" connection-limit=10,32 in-interface-list=WAN log=yes protocol=tcp src-address-list=black_list
/ip firewall filter add action=jump chain=input comment="ICMP accept rules" jump-target=ICMP limit=5,5:packet protocol=icmp
/ip firewall filter add action=accept chain=ICMP icmp-options=0:0 protocol=icmp
/ip firewall filter add action=accept chain=ICMP icmp-options=0:8 protocol=icmp
/ip firewall filter add action=accept chain=ICMP icmp-options=11:0 protocol=icmp
/ip firewall filter add action=accept chain=ICMP icmp-options=3:4 protocol=icmp
/ip firewall filter add action=accept chain=ICMP icmp-options=3:3 protocol=icmp
/ip firewall filter add action=accept chain=input comment="DNS protection" dst-port=53 in-interface=bridge1-LAN limit=10,15:packet protocol=udp
/ip firewall filter add action=drop chain=input comment="Drop all other pachets"
/ip firewall nat add action=src-nat chain=srcnat dst-address=!192.168.0.0/16 out-interface=bridge-WAN src-address=192.168.0.0/16 to-addresses=172.24.113.200
/ip route add distance=1 gateway=172.24.113.1
/ip service set telnet disabled=yes
/ip service set ftp disabled=yes
/ip service set www disabled=yes
/ip service set api disabled=yes
/ip service set api-ssl disabled=yes
/lcd set enabled=no touch-screen=disabled
/system clock set time-zone-name=Europe/Moscow
/system identity set name=SW1
/system logging add topics=firewall
