# may/15/2020 21:22:53 by RouterOS 6.45.9
# software id = TJI1-CDCL
#
# model = CRS125-24G-1S
# serial number = 94500819F64B
/interface bridge add admin-mac=CC:2D:E0:99:1B:BA auto-mac=no comment=defconf dhcp-snooping=yes name=bridge priority=0x1000 pvid=30 vlan-filtering=yes
/interface vlan add interface=bridge name=bridge.77 vlan-id=77
/interface wireless security-profiles set [ find default=yes ] supplicant-identity=MikroTik
/user group set full policy=local,telnet,ssh,ftp,reboot,read,write,policy,test,winbox,password,web,sniff,sensitive,api,romon,tikapp,!dude
/interface bridge port add bridge=bridge interface=ether1 pvid=30
/interface bridge port add bridge=bridge interface=ether2 pvid=30
/interface bridge port add bridge=bridge interface=ether3 pvid=30
/interface bridge port add bridge=bridge interface=ether4 pvid=30
/interface bridge port add bridge=bridge interface=ether5 pvid=30
/interface bridge port add bridge=bridge interface=ether6 pvid=30
/interface bridge port add bridge=bridge interface=ether7 pvid=30
/interface bridge port add bridge=bridge interface=ether8 pvid=30
/interface bridge port add bridge=bridge interface=ether10 pvid=30
/interface bridge port add bridge=bridge interface=ether11 pvid=30
/interface bridge port add bridge=bridge interface=ether12 pvid=30
/interface bridge port add bridge=bridge interface=ether13 pvid=30
/interface bridge port add bridge=bridge interface=ether14 pvid=30
/interface bridge port add bridge=bridge interface=ether15 pvid=30
/interface bridge port add bridge=bridge interface=ether16 pvid=30
/interface bridge port add bridge=bridge interface=ether17 pvid=30
/interface bridge port add bridge=bridge interface=ether18 pvid=30
/interface bridge port add bridge=bridge interface=ether19 pvid=30
/interface bridge port add bridge=bridge interface=ether20 pvid=30
/interface bridge port add bridge=bridge interface=ether21 path-cost=50 pvid=30 trusted=yes
/interface bridge port add bridge=bridge interface=ether22 pvid=30 trusted=yes
/interface bridge port add bridge=bridge comment=WAN interface=ether23
/interface bridge port add bridge=bridge comment=WAN interface=ether24
/interface bridge port add bridge=bridge interface=sfp1
/interface bridge vlan add bridge=bridge tagged=ether21,ether22 untagged=ether1,ether2,ether3,ether4,ether5,ether6,ether7,ether8,ether9,ether10,ether11,ether12,ether13,ether14,ether15,ether16,ether17,ether18,ether19,ether20 vlan-ids=30
/interface bridge vlan add bridge=bridge tagged=ether21,ether22,bridge vlan-ids=77
/ip address add address=10.0.77.2/24 interface=bridge.77 network=10.0.77.0
/ip dhcp-client add dhcp-options=hostname,clientid disabled=no interface=bridge
/ip service set telnet disabled=yes
/ip service set ftp disabled=yes
/ip service set www disabled=yes
/ip service set api disabled=yes
/ip service set api-ssl disabled=yes
/system clock set time-zone-name=Europe/Moscow
/system identity set name=SW2
