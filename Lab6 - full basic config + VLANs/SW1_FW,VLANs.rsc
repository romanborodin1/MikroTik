# may/29/2020 17:03:33 by RouterOS 6.45.9
# software id = TJI1-CDCL
#
# model = CRS125-24G-1S
# serial number = 94500819F64B
/interface bridge add admin-mac=CC:2D:E0:22:22:22 auto-mac=no name=BR_MAIN protocol-mode=none
/interface bridge add name=BR_XXX_WAN
/interface ethernet set [ find default-name=ether1 ] comment=R1_eth2
/interface ethernet set [ find default-name=ether23 ] comment=WAN_UpLink
/interface ethernet set [ find default-name=ether24 ] comment=WAN_R1_eth1
/interface ethernet set [ find default-name=sfp1 ] disabled=yes
/interface vlan add interface=BR_MAIN name=vlan30 vlan-id=30
/interface vlan add interface=BR_MAIN name=vlan31 vlan-id=31
/interface list add name=WAN
/interface wireless security-profiles set [ find default=yes ] supplicant-identity=MikroTik
/ip pool add name=dhcp_pool_vlan30 ranges=192.168.30.20-192.168.30.200
/ip pool add name=dhcp_pool_vlan31 ranges=172.16.31.20-172.16.31.200
/ip dhcp-server add address-pool=dhcp_pool_vlan30 disabled=no interface=vlan30 lease-time=50m name=dhcp_srv_vlan30
/ip dhcp-server add address-pool=dhcp_pool_vlan31 disabled=no interface=vlan31 lease-time=50m name=dhcp_srv_vlan31
/caps-man manager set enabled=yes
/interface bridge port add bridge=BR_MAIN interface=ether1
/interface bridge port add bridge=BR_MAIN interface=ether2
/interface bridge port add bridge=BR_MAIN interface=ether3
/interface bridge port add bridge=BR_MAIN interface=ether4
/interface bridge port add bridge=BR_MAIN interface=ether5
/interface bridge port add bridge=BR_MAIN interface=ether6
/interface bridge port add bridge=BR_MAIN interface=ether7
/interface bridge port add bridge=BR_MAIN interface=ether8
/interface bridge port add bridge=BR_MAIN interface=ether9
/interface bridge port add bridge=BR_MAIN interface=ether10
/interface bridge port add bridge=BR_MAIN interface=ether11
/interface bridge port add bridge=BR_MAIN interface=ether12
/interface bridge port add bridge=BR_MAIN interface=ether13
/interface bridge port add bridge=BR_MAIN interface=ether14
/interface bridge port add bridge=BR_MAIN interface=ether15
/interface bridge port add bridge=BR_MAIN interface=ether16
/interface bridge port add bridge=BR_MAIN interface=ether17
/interface bridge port add bridge=BR_MAIN interface=ether18
/interface bridge port add bridge=BR_MAIN interface=ether19
/interface bridge port add bridge=BR_MAIN interface=ether20
/interface bridge port add bridge=BR_MAIN interface=ether21
/interface bridge port add bridge=BR_MAIN interface=ether22
/interface bridge port add bridge=BR_XXX_WAN interface=ether23
/interface bridge port add bridge=BR_XXX_WAN interface=ether24
/interface ethernet switch egress-vlan-tag add tagged-ports=switch1-cpu vlan-id=30
/interface ethernet switch egress-vlan-tag add tagged-ports=ether1,switch1-cpu vlan-id=31
/interface ethernet switch ingress-vlan-translation add customer-vid=0 new-customer-vid=30 ports=ether2,ether1,ether3,ether4,ether5,ether6,ether7,ether8,ether9,ether10,ether11,ether12,ether13,ether14,ether15,ether16,ether17,ether18,ether19,ether20,ether21,ether22,sfp1
/interface ethernet switch vlan add ports=ether1,switch1-cpu vlan-id=31
/interface ethernet switch vlan add ports=ether1,ether2,ether3,ether4,ether5,ether6,ether7,ether8,ether9,ether10,ether11,ether12,ether13,ether14,ether15,ether16,ether17,ether18,ether19,ether20,ether21,ether22,sfp1,switch1-cpu vlan-id=30
/interface list member add interface=BR_XXX_WAN list=WAN
/ip address add address=192.168.30.1/24 interface=vlan30 network=192.168.30.0
/ip address add address=172.16.31.1/24 interface=vlan31 network=172.16.31.0
/ip dhcp-client add dhcp-options=hostname,clientid disabled=no interface=BR_XXX_WAN
/ip dhcp-server network add address=172.16.31.0/24 dns-server=172.16.31.1 gateway=172.16.31.1
/ip dhcp-server network add address=192.168.30.0/24 dns-server=192.168.30.1 gateway=192.168.30.1
/ip dns set allow-remote-requests=yes servers=172.24.125.125,172.24.60.60
/ip firewall address-list add address=vk.com list=social
/ip firewall filter add action=accept chain=input comment="Established / Related" connection-state=established,related
/ip firewall filter add action=accept chain=forward connection-state=established,related
/ip firewall filter add action=drop chain=input comment="Drop invalid" connection-state=invalid in-interface-list=WAN
/ip firewall filter add action=drop chain=forward connection-state=invalid in-interface-list=WAN
/ip firewall filter add action=accept chain=input comment=WinBox,SSH dst-port=8291,22 in-interface-list=WAN log=yes protocol=tcp
/ip firewall filter add action=add-src-to-address-list address-list=scanner address-list-timeout=1w chain=forward comment="PortScanner detection" in-interface-list=WAN protocol=tcp psd=10,3s,3,1
/ip firewall filter add action=add-src-to-address-list address-list=black_list address-list-timeout=1d chain=forward comment="DoS protection" connection-limit=10,32 in-interface-list=WAN log=yes protocol=tcp
/ip firewall filter add action=tarpit chain=forward comment="DoS protection" connection-limit=10,32 in-interface-list=WAN log=yes protocol=tcp src-address-list=black_list
/ip firewall filter add action=accept chain=input comment="Cisco traceroute" dst-port=33434-65535 in-interface-list=WAN log=yes protocol=udp
/ip firewall filter add action=jump chain=input comment="ICMP accept rules" jump-target=ICMP limit=5,5:packet log=yes protocol=icmp
/ip firewall filter add action=accept chain=ICMP icmp-options=0:0 protocol=icmp
/ip firewall filter add action=accept chain=ICMP icmp-options=8:0 protocol=icmp
/ip firewall filter add action=accept chain=ICMP icmp-options=11:0 protocol=icmp
/ip firewall filter add action=accept chain=ICMP icmp-options=3:4 protocol=icmp
/ip firewall filter add action=accept chain=ICMP icmp-options=3:3 protocol=icmp
/ip firewall filter add action=drop chain=input comment="Drop all other packets from WAN" in-interface-list=WAN
/ip firewall filter add action=drop chain=forward connection-nat-state=!dstnat in-interface-list=WAN
/ip firewall nat add action=masquerade chain=srcnat out-interface=BR_XXX_WAN src-address=192.168.30.0/24
/ip firewall nat add action=masquerade chain=srcnat out-interface=BR_XXX_WAN src-address=172.16.31.0/24
/ip route add distance=1 gateway=172.24.68.1
/ip service set telnet disabled=yes
/ip service set ftp disabled=yes
/ip service set www disabled=yes
/ip service set api disabled=yes
/ip service set api-ssl disabled=yes
/system clock set time-zone-name=Europe/Moscow
/system identity set name=SW1
/system logging add disabled=yes prefix=##DHCP## topics=dhcp
/system logging add disabled=yes prefix=##BRIDGE## topics=bridge
/system logging add disabled=yes prefix=##DEBUG## topics=debug
