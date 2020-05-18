# jan/02/1970 06:28:46 by RouterOS 6.45.9
# software id = TJI1-CDCL
#
# model = CRS125-24G-1S
# serial number = 94500819F64B
/interface bridge add admin-mac=CC:2D:E0:99:1B:BA auto-mac=no name=bridge1
/interface ethernet set [ find default-name=ether1 ] speed=100Mbps
/interface ethernet set [ find default-name=ether2 ] speed=100Mbps
/interface ethernet set [ find default-name=ether3 ] speed=100Mbps
/interface ethernet set [ find default-name=ether4 ] speed=100Mbps
/interface ethernet set [ find default-name=ether5 ] speed=100Mbps
/interface ethernet set [ find default-name=ether6 ] speed=100Mbps
/interface ethernet set [ find default-name=ether7 ] speed=100Mbps
/interface ethernet set [ find default-name=ether8 ] speed=100Mbps
/interface ethernet set [ find default-name=ether9 ] speed=100Mbps
/interface ethernet set [ find default-name=ether10 ] speed=100Mbps
/interface ethernet set [ find default-name=ether11 ] speed=100Mbps
/interface ethernet set [ find default-name=ether12 ] speed=100Mbps
/interface ethernet set [ find default-name=ether13 ] speed=100Mbps
/interface ethernet set [ find default-name=ether14 ] speed=100Mbps
/interface ethernet set [ find default-name=ether15 ] speed=100Mbps
/interface ethernet set [ find default-name=ether16 ] speed=100Mbps
/interface ethernet set [ find default-name=ether17 ] speed=100Mbps
/interface ethernet set [ find default-name=ether18 ] speed=100Mbps
/interface ethernet set [ find default-name=ether19 ] speed=100Mbps
/interface ethernet set [ find default-name=ether20 ] speed=100Mbps
/interface ethernet set [ find default-name=ether21 ] speed=100Mbps
/interface ethernet set [ find default-name=ether22 ] speed=100Mbps
/interface ethernet set [ find default-name=ether23 ] comment=WAN speed=100Mbps
/interface ethernet set [ find default-name=ether24 ] comment=WAN speed=100Mbps
/interface ethernet set [ find default-name=sfp1 ] advertise=10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full disabled=yes
/interface gre add disabled=yes keepalive=20m,100 name=gre-tunnel1-to-Berejkovka remote-address=93.191.18.38
/interface gre add disabled=yes name=gre-tunnel2-to-Vernadka remote-address=83.220.37.78
/interface gre add disabled=yes name=to_slav_mir remote-address=5.16.1.32
/interface vlan add comment=Office interface=bridge1 name=bridge1.30 vlan-id=30
/interface vlan add comment=Guest interface=bridge1 name=bridge1.31 vlan-id=31
/interface vrrp add interface=bridge1.30 name=vrrp_vlan30 priority=90
/interface vrrp add interface=bridge1.31 name=vrrp_vlan31 priority=90
/caps-man security add authentication-types=wpa2-psk encryption=aes-ccm name=guest passphrase=crcc987rus
/interface wireless security-profiles set [ find default=yes ] supplicant-identity=MikroTik
/interface wireless security-profiles add authentication-types=wpa2-psk eap-methods="" management-protection=allowed mode=dynamic-keys name=office supplicant-identity="" wpa2-pre-shared-key=Mechastroy9
/interface wireless security-profiles add authentication-types=wpa2-psk eap-methods="" management-protection=allowed mode=dynamic-keys name=guest supplicant-identity="" wpa2-pre-shared-key=crcc987rus
/ip ipsec peer add address=172.172.1.49/32 comment=GRE_to_Vernadka name=peer2
/ip ipsec peer add address=172.172.1.41/32 comment=GRE_to-Berejkovka name=peer1
/ip ipsec profile add name=unifi
/ip ipsec proposal add enc-algorithms=aes-256-cbc,aes-128-cbc lifetime=7h30m name=proposal1
/ip pool add name=office_pool ranges=192.168.30.20-192.168.30.200
/ip pool add name=guest_pool ranges=172.16.31.20-172.16.31.200
/ip dhcp-server add address-pool=office_pool disabled=no interface=bridge1.30 lease-time=1h name=office
/ip dhcp-server add address-pool=guest_pool disabled=no interface=bridge1.31 name=guest
/caps-man manager set enabled=yes
/interface bridge port add bridge=bridge1 interface=ether1
/interface bridge port add bridge=bridge1 interface=ether2
/interface bridge port add bridge=bridge1 interface=ether3
/interface bridge port add bridge=bridge1 interface=ether4
/interface bridge port add bridge=bridge1 interface=ether5
/interface bridge port add bridge=bridge1 interface=ether6
/interface bridge port add bridge=bridge1 interface=ether7
/interface bridge port add bridge=bridge1 interface=ether8
/interface bridge port add bridge=bridge1 interface=ether9
/interface bridge port add bridge=bridge1 interface=ether10
/interface bridge port add bridge=bridge1 interface=ether11
/interface bridge port add bridge=bridge1 interface=ether12
/interface bridge port add bridge=bridge1 interface=ether13
/interface bridge port add bridge=bridge1 interface=ether14
/interface bridge port add bridge=bridge1 interface=ether15
/interface bridge port add bridge=bridge1 interface=ether16
/interface bridge port add bridge=bridge1 interface=ether17
/interface bridge port add bridge=bridge1 interface=ether18
/interface bridge port add bridge=bridge1 interface=ether19
/interface bridge port add bridge=bridge1 interface=ether20
/interface bridge port add bridge=bridge1 interface=ether21
/interface bridge port add bridge=bridge1 interface=ether22
/interface bridge port add bridge=bridge1 interface=sfp1
/interface ethernet switch egress-vlan-tag add comment="Trunk VLAN 31" tagged-ports=ether13,ether14,ether15,ether16,ether17,ether18,ether19,ether20,ether21,ether22,switch1-cpu vlan-id=31
/interface ethernet switch egress-vlan-tag add comment="Trunk VLAN 30" tagged-ports=ether13,ether14,ether15,ether16,ether17,ether18,ether19,ether20,ether21,ether22,switch1-cpu vlan-id=30
/interface ethernet switch ingress-vlan-translation add comment="Access VLAN 30" new-customer-vid=30 ports=ether2,ether3,ether4,ether5,ether6,ether7,ether8,ether9,ether10,ether11,ether12
/interface ethernet switch ingress-vlan-translation add comment="Access VLAN 31" new-customer-vid=31 ports=ether1
/interface ethernet switch vlan add ports=ether1,ether21,ether22,switch1-cpu vlan-id=31
/interface ethernet switch vlan add ports=ether2,ether3,ether4,ether5,ether6,ether7,ether8,ether9,ether10,ether11,ether12,ether21,ether22,switch1-cpu vlan-id=30
/ip address add address=192.168.30.3/24 comment=Office interface=bridge1.30 network=192.168.30.0
/ip address add address=172.16.31.3/24 comment=Guest interface=bridge1.31 network=172.16.31.0
/ip address add address=172.172.1.42/30 interface=gre-tunnel1-to-Berejkovka network=172.172.1.40
/ip address add address=172.172.1.50/30 interface=gre-tunnel2-to-Vernadka network=172.172.1.48
/ip address add address=192.168.30.1/24 comment="VRRP gateway for VLAN 30 - Office" interface=vrrp_vlan30 network=192.168.30.0
/ip address add address=172.16.31.1/24 comment="VRRP gateway for VLAN 31 - Guest" interface=vrrp_vlan31 network=172.16.31.0
/ip dhcp-server network add address=172.16.31.0/24 dns-server=172.16.31.1 gateway=172.16.31.1
/ip dhcp-server network add address=192.168.30.0/24 dns-server=192.168.30.1 gateway=192.168.30.1
/ip dns set allow-remote-requests=yes servers=172.24.60.61
/ip firewall filter add action=accept chain=input comment="defconf: accept established,related,untracked" connection-state=established,related,untracked
/ip firewall filter add action=drop chain=input comment="defconf: drop invalid" connection-state=invalid
/ip firewall filter add action=accept chain=forward comment="defconf: accept established,related, untracked" connection-state=established,related,untracked
/ip firewall filter add action=drop chain=forward comment="defconf: drop invalid" connection-state=invalid disabled=yes
/ip firewall filter add action=accept chain=input comment=DNS_Flood dst-port=53 limit=10,15:packet protocol=udp
/ip firewall filter add action=drop chain=forward disabled=yes dst-address=192.168.0.0/16 src-address=172.16.30.0/24
/ip firewall filter add action=drop chain=forward dst-address=192.168.0.0/16 src-address=172.16.31.0/24
/ip firewall filter add action=accept chain=input comment="Allow IKE IPsec" dst-port=500 protocol=udp
/ip firewall filter add chain=input comment="Allow IPSec-esp" protocol=ipsec-esp
/ip firewall filter add chain=input comment="Allow IPSec-ah" protocol=ipsec-ah
/ip firewall filter add action=accept chain=input comment=WinBOX_input dst-port=8291 protocol=tcp
/ip firewall filter add action=accept chain=input comment="defconf: accept ICMP" protocol=icmp
/ip firewall filter add action=accept chain=forward comment="defconf: accept in ipsec policy" ipsec-policy=in,ipsec
/ip firewall filter add action=accept chain=forward comment="defconf: accept out ipsec policy" ipsec-policy=out,ipsec
/ip firewall filter add action=fasttrack-connection chain=forward comment="defconf: fasttrack" connection-state=established,related disabled=yes
/ip firewall filter add action=drop chain=forward comment="defconf:  drop all from WAN not DSTNATed" connection-nat-state=!dstnat connection-state=new in-interface=ether24
/ip firewall filter add action=accept chain=forward disabled=yes
/ip firewall nat add action=accept chain=srcnat disabled=yes dst-address=192.168.8.0/24 src-address=192.168.30.0/24
/ip firewall nat add action=masquerade chain=srcnat out-interface=ether24
/ip ipsec identity add peer=peer2 secret=YrwnUFtfKas4xQj
/ip ipsec identity add peer=peer1 secret=YrwnUFtfKas4xQj
/ip route add distance=1 dst-address=192.168.8.0/24 gateway=172.172.1.41 pref-src=192.168.30.1
/ip route add distance=1 dst-address=192.168.20.0/24 gateway=172.172.1.49 pref-src=192.168.30.1
/ip route add distance=1 dst-address=192.168.22.0/24 gateway=172.172.1.49 pref-src=192.168.30.1
/ip route add distance=1 dst-address=192.168.221.0/24 gateway=172.172.1.41
/ip service set telnet disabled=yes
/ip service set ftp disabled=yes
/ip service set www disabled=yes
/ip service set ssh disabled=yes
/ip service set api disabled=yes
/ip service set api-ssl disabled=yes
/system clock set time-zone-name=Europe/Moscow
/system identity set name=SW_Main2
