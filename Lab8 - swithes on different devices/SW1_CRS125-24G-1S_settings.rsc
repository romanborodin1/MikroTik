# jun/08/2020 17:04:53 by RouterOS 6.45.9
# software id = TJI1-CDCL
#
# model = CRS125-24G-1S
# serial number = 94500819F64B
/caps-man channel
add band=2ghz-onlyn control-channel-width=20mhz extension-channel=Ce \
    frequency=2412 name=channel1 tx-power=17
add band=2ghz-onlyn control-channel-width=20mhz extension-channel=eC \
    frequency=2462 name=channel11 tx-power=17
add band=2ghz-onlyn control-channel-width=20mhz extension-channel=Ce \
    frequency=2437 name=channel6 tx-power=17
add band=5ghz-a/n/ac control-channel-width=20mhz extension-channel=Ceee name=\
    channel1_5h tx-power=17
/caps-man datapath
add client-to-client-forwarding=yes local-forwarding=yes name=\
    local-forwarding-Office vlan-id=30 vlan-mode=use-tag
add client-to-client-forwarding=yes local-forwarding=yes name=\
    local-forwarding-Guest vlan-id=31 vlan-mode=use-tag
/interface bridge
add admin-mac=CC:2D:E0:22:22:22 auto-mac=no name=BR_MAIN priority=0x1000
add name=BR_XXX_WAN
/interface ethernet
set [ find default-name=ether23 ] comment=WAN_UpLink
set [ find default-name=ether24 ] comment=WAN_R1_eth1
set [ find default-name=sfp1 ] disabled=yes
/interface vlan
add interface=BR_MAIN name=vlan30 vlan-id=30
add interface=BR_MAIN name=vlan31 vlan-id=31
/caps-man security
add authentication-types=wpa2-psk encryption=aes-ccm group-encryption=aes-ccm \
    name=security-office passphrase=123qweASD
add authentication-types=wpa-psk,wpa2-psk encryption=aes-ccm \
    group-encryption=aes-ccm name=security-guest passphrase=123qweASD
/caps-man configuration
add channel=channel1 country=russia2 datapath=local-forwarding-Office \
    distance=indoors guard-interval=long hw-protection-mode=cts-to-self \
    keepalive-frames=enabled max-sta-count=30 mode=ap multicast-helper=full \
    name=cfg1 rx-chains=0,1,2,3 security=security-office ssid=Office \
    tx-chains=0,1,2,3
add channel=channel1 country=russia2 datapath=local-forwarding-Guest \
    distance=indoors guard-interval=long max-sta-count=30 mode=ap \
    multicast-helper=full name=cfg1-guest rx-chains=0,1,2,3 security=\
    security-guest ssid=Guest tx-chains=0,1,2,3
add channel=channel1_5h country=russia2 datapath=local-forwarding-Office \
    name=cfg1-5h security=security-office ssid=Office5h
add channel=channel1_5h country=russia2 datapath=local-forwarding-Guest name=\
    cfg1-guest-5h security=security-guest ssid=Guest5h
add channel=channel6 country=russia2 datapath=local-forwarding-Office name=\
    cfg6 security=security-office ssid=Office
add channel=channel11 country=russia2 datapath=local-forwarding-Guest name=\
    cfg11-guest security=security-guest ssid=Guest
add channel=channel11 country=russia2 datapath=local-forwarding-Office name=\
    cfg11 security=security-office ssid=Office
add channel=channel6 country=russia2 datapath=local-forwarding-Guest name=\
    cfg6-guest security=security-guest ssid=Guest
/interface list
add name=WAN
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip pool
add name=dhcp_pool_vlan30 ranges=192.168.30.20-192.168.30.200
add name=dhcp_pool_vlan31 ranges=172.16.31.20-172.16.31.200
/ip dhcp-server
add address-pool=dhcp_pool_vlan30 disabled=no interface=vlan30 lease-time=1h \
    name=dhcp_srv_vlan30
add address-pool=dhcp_pool_vlan31 disabled=no interface=vlan31 lease-time=50m \
    name=dhcp_srv_vlan31
/caps-man access-list
add action=accept allow-signal-out-of-range=10s disabled=no interface=all \
    signal-range=-75..120 ssid-regexp=""
add action=reject allow-signal-out-of-range=10s disabled=no interface=all \
    signal-range=-120..-75 ssid-regexp=""
/caps-man manager
set ca-certificate=CAPsMAN-CA-CC2DE0991BBA certificate=CAPsMAN-CC2DE0991BBA \
    enabled=yes
/caps-man manager interface
set [ find default=yes ] forbid=yes
add disabled=no interface=vlan30
/caps-man provisioning
add action=create-dynamic-enabled master-configuration=cfg1 name-format=\
    identity slave-configurations=cfg1-guest
add master-configuration=cfg1
/interface bridge filter
add action=accept chain=forward log=yes src-mac-address=\
    CC:2D:E0:22:22:22/FF:FF:FF:FF:FF:FF
add action=accept chain=input log=yes src-mac-address=\
    CC:2D:E0:22:22:22/FF:FF:FF:FF:FF:FF
/interface bridge port
add bridge=BR_MAIN interface=ether1 path-cost=100
add bridge=BR_MAIN interface=ether2
add bridge=BR_MAIN interface=ether3
add bridge=BR_MAIN interface=ether4
add bridge=BR_MAIN interface=ether5
add bridge=BR_MAIN interface=ether6
add bridge=BR_MAIN interface=ether7
add bridge=BR_MAIN interface=ether8
add bridge=BR_MAIN interface=ether9
add bridge=BR_MAIN interface=ether10
add bridge=BR_MAIN interface=ether11
add bridge=BR_MAIN interface=ether12
add bridge=BR_MAIN interface=ether13
add bridge=BR_MAIN interface=ether14
add bridge=BR_MAIN interface=ether15
add bridge=BR_MAIN interface=ether16
add bridge=BR_MAIN interface=ether17
add bridge=BR_MAIN interface=ether18
add bridge=BR_MAIN interface=ether19
add bridge=BR_MAIN interface=ether20
add bridge=BR_MAIN interface=ether21
add bridge=BR_XXX_WAN interface=ether22
add bridge=BR_XXX_WAN interface=ether23
add bridge=BR_XXX_WAN interface=ether24
/interface ethernet switch egress-vlan-tag
add tagged-ports=switch1-cpu vlan-id=30
add tagged-ports=ether1,ether2,switch1-cpu vlan-id=31
/interface ethernet switch ingress-vlan-translation
add customer-vid=0 new-customer-vid=30 ports="ether1,ether2,ether3,ether4,ethe\
    r5,ether6,ether7,ether8,ether9,ether10,ether11,ether12,ether13,ether14,eth\
    er15,ether16,ether17,ether18,ether19,ether20,ether21,sfp1"
/interface ethernet switch vlan
add ports=ether1,ether2,switch1-cpu vlan-id=31
add ports="ether1,ether2,ether3,ether4,ether5,ether6,ether7,ether8,ether9,ethe\
    r10,ether11,ether12,ether13,ether14,ether15,ether16,ether17,ether18,ether1\
    9,ether20,ether21,sfp1,switch1-cpu" vlan-id=30
/interface list member
add interface=BR_XXX_WAN list=WAN
/ip address
add address=192.168.30.1/24 interface=vlan30 network=192.168.30.0
add address=172.16.31.1/24 interface=vlan31 network=172.16.31.0
/ip dhcp-client
add dhcp-options=hostname,clientid disabled=no interface=BR_XXX_WAN
/ip dhcp-server network
add address=172.16.31.0/24 dns-server=172.16.31.1 gateway=172.16.31.1
add address=192.168.30.0/24 dns-server=192.168.30.1 gateway=192.168.30.1
/ip dns
set allow-remote-requests=yes servers=172.24.125.125,172.24.60.60
/ip firewall address-list
add address=vk.com list=social
/ip firewall filter
add action=accept chain=input comment="Established / Related" \
    connection-state=established,related
add action=accept chain=forward connection-state=established,related
add action=drop chain=input comment="Drop invalid" connection-state=invalid \
    in-interface-list=WAN
add action=drop chain=forward connection-state=invalid in-interface-list=WAN
add action=accept chain=input comment=WinBox,SSH dst-port=8291,22 \
    in-interface-list=WAN log=yes protocol=tcp
add action=add-src-to-address-list address-list=scanner address-list-timeout=\
    1w chain=forward comment="PortScanner detection" in-interface-list=WAN \
    protocol=tcp psd=10,3s,3,1
add action=add-src-to-address-list address-list=black_list \
    address-list-timeout=1d chain=forward comment="DoS protection" \
    connection-limit=10,32 in-interface-list=WAN log=yes protocol=tcp
add action=tarpit chain=forward comment="DoS protection" connection-limit=\
    10,32 in-interface-list=WAN log=yes protocol=tcp src-address-list=\
    black_list
add action=accept chain=input comment="Cisco traceroute" dst-port=33434-65535 \
    in-interface-list=WAN log=yes protocol=udp
add action=jump chain=input comment="ICMP accept rules" jump-target=ICMP \
    limit=5,5:packet log=yes protocol=icmp
add action=accept chain=ICMP icmp-options=0:0 protocol=icmp
add action=accept chain=ICMP icmp-options=8:0 protocol=icmp
add action=accept chain=ICMP icmp-options=11:0 protocol=icmp
add action=accept chain=ICMP icmp-options=3:4 protocol=icmp
add action=accept chain=ICMP icmp-options=3:3 protocol=icmp
add action=drop chain=input comment="Drop all other packets from WAN" \
    in-interface-list=WAN
add action=drop chain=forward connection-nat-state=!dstnat in-interface-list=\
    WAN
/ip firewall nat
add action=masquerade chain=srcnat out-interface=BR_XXX_WAN src-address=\
    192.168.30.0/24
add action=masquerade chain=srcnat out-interface=BR_XXX_WAN src-address=\
    172.16.31.0/24
/ip route
add distance=1 gateway=172.24.68.1
/ip service
set telnet disabled=yes
set ftp disabled=yes
set www disabled=yes
set api disabled=yes
set api-ssl disabled=yes
/system clock
set time-zone-name=Europe/Moscow
/system identity
set name=SW1
/system logging
add prefix=##DHCP## topics=dhcp
add prefix=##BRIDGE## topics=bridge
add prefix=##DEBUG## topics=debug
add prefix=CAPS_+_ topics=caps
add prefix=WiFi_ topics=wireless
