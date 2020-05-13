# may/10/2020 19:39:07 by RouterOS 6.46.6
# software id = TJI1-CDCL
#
# model = CRS125-24G-1S
# serial number = 94500819F64B
/interface bridge
add comment=MGMT name=br0-mgmt
add admin-mac=CC:2D:E0:99:1B:BA auto-mac=no comment=defconf name=bridge
/interface ethernet
set [ find default-name=ether1 ] speed=100Mbps
set [ find default-name=ether2 ] speed=100Mbps
set [ find default-name=ether3 ] speed=100Mbps
set [ find default-name=ether4 ] speed=100Mbps
set [ find default-name=ether5 ] speed=100Mbps
set [ find default-name=ether6 ] speed=100Mbps
set [ find default-name=ether7 ] speed=100Mbps
set [ find default-name=ether8 ] speed=100Mbps
set [ find default-name=ether9 ] speed=100Mbps
set [ find default-name=ether10 ] speed=100Mbps
set [ find default-name=ether11 ] speed=100Mbps
set [ find default-name=ether12 ] speed=100Mbps
set [ find default-name=ether13 ] speed=100Mbps
set [ find default-name=ether14 ] speed=100Mbps
set [ find default-name=ether15 ] speed=100Mbps
set [ find default-name=ether16 ] speed=100Mbps
set [ find default-name=ether17 ] speed=100Mbps
set [ find default-name=ether18 ] speed=100Mbps
set [ find default-name=ether19 ] speed=100Mbps
set [ find default-name=ether20 ] speed=100Mbps
set [ find default-name=ether21 ] speed=100Mbps
set [ find default-name=ether22 ] speed=100Mbps
set [ find default-name=ether23 ] speed=100Mbps
set [ find default-name=ether24 ] speed=100Mbps
set [ find default-name=sfp1 ] advertise=\
    10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/user group
set full policy="local,telnet,ssh,ftp,reboot,read,write,policy,test,winbox,pas\
    sword,web,sniff,sensitive,api,romon,dude,tikapp"
/interface bridge port
add bridge=br0-mgmt comment=MGMT interface=ether1
add bridge=bridge comment=defconf interface=ether2
add bridge=bridge comment=TEST interface=ether3 pvid=11
add bridge=bridge comment=TEST interface=ether4 pvid=11
add bridge=bridge comment=defconf interface=ether5
add bridge=bridge comment=defconf interface=ether6
add bridge=bridge comment=defconf interface=ether7
add bridge=bridge comment=defconf interface=ether8
add bridge=bridge comment=defconf interface=ether9
add bridge=bridge comment=defconf interface=ether10
add bridge=bridge comment=defconf interface=ether11
add bridge=bridge comment=defconf interface=ether12
add bridge=bridge comment=defconf interface=ether13
add bridge=bridge comment=defconf interface=ether14
add bridge=bridge comment=defconf interface=ether15
add bridge=bridge comment=defconf interface=ether16
add bridge=bridge comment=defconf interface=ether17
add bridge=bridge comment=defconf interface=ether18
add bridge=bridge comment=defconf interface=ether19
add bridge=bridge comment=defconf interface=ether20
add bridge=bridge comment=defconf interface=ether21
add bridge=bridge comment=defconf interface=ether22
add bridge=bridge comment=defconf interface=ether23
add bridge=bridge comment=defconf interface=ether24
add bridge=bridge comment=defconf interface=sfp1
/ip address
add address=192.168.255.2/24 comment=MGMT interface=br0-mgmt network=\
    192.168.255.0
/ip dhcp-client
add disabled=no interface=bridge
/lcd
set enabled=no touch-screen=disabled
/system clock
set time-zone-name=Europe/Moscow
/system identity
set name=SW2
/tool romon
set enabled=yes id=00:00:00:00:00:20 secrets=qsefth123!
/tool romon port
set [ find default=yes ] forbid=yes
add cost=10 disabled=no interface=ether1 secrets=qsefth123!eth2
