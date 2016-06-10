#!/bin/bash

##### INE's CCIE RSv5 Graded Practice Labs
##### Lab 1 Troubleshooting Verifications


##### Ticket 1: R12 removed ttl security hops 1 towards R11

	echo '######################'
	echo '####### Ticket 1 #####'
	echo '######################'
  echo ''

	echo '####'
	echo 'Does traceroute follow the correct path?'
	echo '####'
	./command.sh TS R24 "traceroute 12.18.255.7 source Loopback0 "
	
	echo '####'
	echo 'Is peering between R12 and R11 up?'
	echo '####'
	./command.sh TS R12 "show ip bgp summary | in 12.18.255.9"
	
	echo '####'
	echo 'Was ttl security removed to 12.18.255.9?'
	echo '####'
	./command.sh TS R12 "show run | include 12.18.255.9"

	echo '####'
	echo 'Was ttl security removed to 12.18.255.8?'
	echo '####'
	./command.sh TS R11 "show run | include 12.18.255.8"


##### Ticket 2: Wrong vlan encaps on R26, wrong allowed list on SW3

	echo '######################'
	echo '####### Ticket 2 #####'
	echo '######################'
  echo ''

	echo '####'
	echo 'Does traceroute follow the correct path?'
	echo '####'
	./command.sh TS R26 "traceroute 10.22.22.22 source 10.26.26.26"
	
	echo '####'
	echo 'Does R26 have correct VLANs?'
	echo '####'
	./command.sh TS R26 "show run int gig0/1.100 | include encap"
	./command.sh TS R26 "show run int gig0/1.200 | include encap"
	
	echo '####'
	echo 'Does SW3 have correct VLAN allowed list?'
	echo '####'
	./command.sh TS SW3 "show spanning-tree interface g0/3 | include 100|101|200|202"

##### Ticket 3: Wrong next hop for static route on R14

	echo '######################'
	echo '####### Ticket 3 #####'
	echo '######################'
  echo ''

	echo '####'
	echo 'Does traceroute follow the correct path?'
	echo '####'
	
	./command.sh TS R17 "traceroute 10.26.26.26 source Loopback0"
	./command.sh TS R17 "traceroute 10.27.27.27 source Loopback0"
	
	echo '####'
	echo 'Was static route properly updated to correct next hops?'
	echo '####'
	
	./command.sh TS R14 "show ip route 10.0.0.0 255.224.0.0"

##### Ticket 4: discontiguous area 0 on SW1 / R20

	echo '######################'
	echo '####### Ticket 4 #####'
	echo '######################'
  echo ''

	echo '####'
	echo 'Does reachability exist?'
	echo '####'
	
	./command.sh TS R15 "ping 10.20.20.20"
	
	echo '####'
	echo 'Does R20 still have area 0?'
	echo '####'
	
	./command.sh TS R20 "show ip ospf interface GigabitEthernet 0/1 | include Area"

##### Ticket 5: vpnv6 deactivated from R6 to R4, R4 has wrong ipv6 route target export

	echo '######################'
	echo '####### Ticket 5 #####'
	echo '######################'
  echo ''

	echo '####'
	echo 'Does reachability exist?'
	echo '####'
	
	./command.sh TS R16 "traceroute 2001:10:15:15:15::15"
	
	echo '####'
	echo 'Does R6 have VPNv4 peering to R4'
	echo '####'
	
	./command.sh TS R6 "show bgp vpnv6 unicast all summary | include 10.4.4.4"
	
	echo '####'
	echo 'What is R4 importing and exporting'
	echo '####'
	
	./command.sh TS R4 "sh vrf detail BRANCH-SITE-2 | include family|Import|Export|RT"
	
	echo '####'
	echo 'What is R2 importing and exporting'
	echo '####'
	
	./command.sh TS R2 "sh vrf detail BRANCH-SITE-1 | include family|Import|Export|RT"

#### Ticket 6: duplicate IPv6 address on R8
#### N/A Ticket Broken

#### Ticket 7: R21 has wrong RP assignment

	echo '######################'
	echo '####### Ticket 7 #####'
	echo '######################'
  echo ''

	echo '####'
	echo 'Is there multicast reachability'
	echo '####'

	./command.sh TS R27 "ping 225.6.7.8"
	
	echo '####'
	echo 'Was Static RP removed?'
	echo '####'

	./command.sh TS R21 "sh run | in ip pim rp-address"

	echo '####'
	echo 'Who is the RP for 225.6.7.8'
	echo '####'

	./command.sh TS R21 "sh ip pim rp 225.6.7.8"

	echo '####'
	echo 'Is RP address correctly learned?'
	echo '####'

	./command.sh TS R13 "sh ip pim rp mapping"
	./command.sh TS R14 "sh ip pim rp mapping"
	./command.sh TS R17 "sh ip pim rp mapping"
	./command.sh TS R21 "sh ip pim rp mapping"
	./command.sh TS R22 "sh ip pim rp mapping"
	./command.sh TS R23 "sh ip pim rp mapping"


#### Ticket 8: R1 has wrong mpls label protocol towards R5

	echo '######################'
	echo '####### Ticket 8 #####'
	echo '######################'
  echo ''

	echo '####'
	echo 'Does reachability exist?'
	echo '####'
	
	./command.sh TS R18 "traceroute 10.16.16.16"
	./command.sh TS R19 "traceroute 10.16.16.16"

	echo '####'
	echo 'Is R1 still running TDP?'
	echo '####'
	
	./command.sh TS R1 "show mpls interfaces gigabitEthernet 0/4"
	./command.sh TS R1 "show mpls ldp neighbor | section TDP"
	

#### Ticket 9: Duplicate EIGRP Router-ID on R13

	echo '######################'
	echo '####### Ticket 9 #####'
	echo '######################'
  echo ''

	echo '####'
	echo 'Is there reachability?
	echo '####'
	
	./command.sh TS R13 "ping 10.27.27.27 source gig0/1.13"

	echo '####'
	echo 'Is R27 learning R13's prefix via EIGRP?'
	echo '####'

	./command.sh TS R27 "show ip eigrp topology 10.1.1.0 255.255.255.0"
	
	echo '####'
	echo 'Was R13s EIGRP Router ID changed?'
	echo '####'

	./command.sh TS R13	"show ip eigrp topology | include 10.27.27.27"


