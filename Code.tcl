 set val(chan)         Channel/WirelessChannel  ;# channel type
 set val(prop)         Propagation/TwoRayGround ;# radio-propagation model
 set val(ant)          Antenna/OmniAntenna      ;# Antenna type
 set val(ll)           LL                       ;# Link layer type
 set val(ifq)          Queue/DropTail/PriQueue  ;# Interface queue type
 set val(ifqlen)       50                       ;# max packet in ifq
 set val(netif)        Phy/WirelessPhy          ;# network interface type
 set val(mac)          Mac/802_11               ;# MAC type
 set val(nn)           24                      ;# number of mobilenodes
 set val(rp)	       AODV                     ;# routing protocol
 set val(x)            800
 set val(y)            800
set ns [new Simulator]
set f [open aodv2.tr w]
$ns trace-all $f
set namtrace [open solution.nam w]
set windowVsTime2 [open win13.tr w]
set runall [open runall.bat w]
$ns namtrace-all-wireless $namtrace $val(x) $val(y)
set f0 [open new-AODV-packet-loss.tr w]
set f1 [open new-AODV-end-to-end-delay.tr w]
#set f2 [open new-AODV-throughput.tr w]
set f3 [open new-AODV-throughput10nodes.tr w]
set f4 [open new-AODV-throughput25nodes.tr w]
set f5 [open new-AODV-throughput.tr w]
######################################################
set f6 [open new-AODV-delay10nodes.tr w]
set f7 [open new-AODV-delay25nodes.tr w]
set f8 [open new-AODV-delay.tr w]
########################################################
set f9 [open new-AODV-PDR.tr w]
set f10 [open new-AODV-OVERHEAD.tr w]
set f11 [open new-AODV-packetloss.tr w]

set topo [new Topography]
$topo load_flatgrid 800 800
create-god $val(nn)
set chan_1 [new $val(chan)]
set chan_2 [new $val(chan)]
set chan_3 [new $val(chan)]
set chan_4 [new $val(chan)]
set chan_5 [new $val(chan)]
set chan_6 [new $val(chan)]
set chan_7 [new $val(chan)]
set chan_8 [new $val(chan)]
set chan_9 [new $val(chan)]
set chan_10 [new $val(chan)]

$ns node-config  -adhocRouting $val(rp) \
 		 -llType $val(ll) \
                 -macType $val(mac) \
                 -ifqType $val(ifq) \
                 -ifqLen $val(ifqlen) \
                 -antType $val(ant) \
                 -propType $val(prop) \
                 -phyType $val(netif) \
                 -topoInstance $topo \
                 -agentTrace OFF \
                 -routerTrace ON \
                 -macTrace ON \
                 -movementTrace OFF \
                 -channel $chan_1 
proc finish {} {
	global ns f f0 f1  namtrace
	$ns flush-trace
        close $namtrace   
	close $f0
        close $f1              
       	exit 0
}

proc record {} {
  global sink47 sink48 sink1 sink3 sink4 sink5 sink6 sink9 bw0 bw1 bw2 bw3 f0 f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11
   set ns [Simulator instance]
   set time 0.05
   set bw2 [$sink47 set npkts_]
   set bw3 [$sink9 set npkts_]
   set bw0 [$sink48 set npkts_]
   set bw1 [$sink1 set nlost_]
   set bw4 [$sink1 set npkts_]
   set now [$ns now]
   #puts $f2 "$now [expr $bw2]"
   puts $f0 "$now [expr $bw0*2]"
   puts $f1 "$now [expr $bw0]"
   puts $f3 "$now [expr $bw0*4]"
   puts $f4 "$now [expr $bw3]"
   puts $f5 "$now [expr $bw3]"
   #####################################
   puts $f6 "$now [expr $bw2]"
   puts $f7 "$now [expr $bw0*2]"
   puts $f8 "$now [expr $bw3]"
   puts $f9 "$now [expr $bw0*4]"
   puts $f10 "$now [expr $bw2/2]"
   puts $f11 "$now [expr $bw2]"
   
   $ns at [expr $now+$time] "record"
  } 
   $ns color 1 dodgerblue
      $ns color 2 blue
      $ns color 3 cyan
      $ns color 4 darkgreen
      $ns color 5 yellow
      $ns color 6 black
      $ns color 7 magenta
      $ns color 8 gold
      $ns color 9 red
      for {set i 0} {$i < $val(nn) } { incr i } {
            set n($i) [$ns node]     
		$n($i) color "red"
      }
$n(0) set X_ -56.0
$n(0) set Y_ 350.0
$n(0) set Z_ 0.0
$n(1) set X_ 68.0
$n(1) set Y_ 463.0
$n(1) set Z_ 0.0
$n(2) set X_ 66.0
$n(2) set Y_ 328.0
$n(2) set Z_ 0.0
$n(3) set X_ 62.0
$n(3) set Y_ 198.0
$n(3) set Z_ 0.0
$n(4) set X_ 180.0
$n(4) set Y_ 561.0
$n(4) set Z_ 0.0
$n(5) set X_ 182.0
$n(5) set Y_ 464.0
$n(5) set Z_ 0.0
$n(6) set X_ 181.0
$n(6) set Y_ 365.0
$n(6) set Z_ 0.0
$n(7) set X_ 176.0
$n(7) set Y_ 259.0
$n(7) set Z_ 0.0
$n(8) set X_ 318.0
$n(8) set Y_ 388.0
$n(8) set Z_ 0.0
$n(9) set X_ 312.0
$n(9) set Y_ 270.0
$n(9) set Z_ 0.0

$n(10) set X_ 428.0
$n(10) set Y_ 254.0
$n(10) set Z_ 0.0

$n(11) set X_ 545.0
$n(11) set Y_ 77.0
$n(11) set Z_ 0.0

$n(12) set X_ 550.0
$n(12) set Y_ 239.0
$n(12) set Z_ 0.0

$n(13) set X_ 548.0
$n(13) set Y_ 401.0
$n(13) set Z_ 0.0

$n(14) set X_ 545.0
$n(14) set Y_ 546.0
$n(14) set Z_ 0.0

$n(15) set X_ 428.0
$n(15) set Y_ 663.0
$n(15) set Z_ 0.0

$n(16) set X_ 307.0
$n(16) set Y_ 612.0
$n(16) set Z_ 0.0

$n(17) set X_ 430.0
$n(17) set Y_ 546.0
$n(17) set Z_ 0.0

$n(18) set X_ 428.0
$n(18) set Y_ 663.0
$n(18) set Z_ 0.0

$n(19) set X_ 425.0
$n(19) set Y_ 408.0
$n(19) set Z_ 0.0

$n(20) set X_ 543.0
$n(20) set Y_ 705.0
$n(20) set Z_ 0.0

$n(21) set X_ 435.0
$n(21) set Y_ 106.0
$n(21) set Z_ 0.0

$n(22) set X_ 313.0
$n(22) set Y_ 133.0
$n(22) set Z_ 0.0

$n(23) set X_ 177.0
$n(23) set Y_ 165.0
$n(23) set Z_ 0.0


for {set i 0} {$i < $val(nn)} { incr i } {
$ns initial_node_pos  $n($i) 30
}
$ns at 0.95 "$n(6) label RREQ"
$ns at 00.1 "$n(0) label SOURCE"
$ns at 00.2 "$n(10) label DESTINATION"
$ns at 0.3 "$n(0) label RREQ"
$ns at 0.55 "$n(1) color red"
$ns at 0.75 "$n(1) color black"
$ns at 0.55 "$n(0) label SOURCE"
$ns at 0.55 "$n(1) label RREQ"
$ns at 0.75 "$n(1) label ."
$ns at 0.75 "$n(2) label RREQ"
$ns at 0.95 "$n(2) label ."
$ns at 0.95 "$n(4) label RREQ"
$ns at 1.5 "$n(8) label ."
$ns at 1.5 "$n(9) label ."
$ns at 2.4 "$n(1) color darkgreen"
$ns at 2.4 "$n(2) color darkgreen"
$ns at 0.3 "$n(0) color red"
$ns at 0.55 "$n(0) color black"
$ns at 0.95 "$n(5) label RREQ"
$ns at 0.95 "$n(7) label RREQ"
$ns at 1.3 "$n(4) label ."
$ns at 1.3 "$n(7) label ."
$ns at 1.3 "$n(8) label RREQ"
$ns at 1.3 "$n(5) label ."
$ns at 0.95 "$n(7) color red"
$ns at 2.7 "$n(1) color black"
$ns at 2.7 "$n(2) color black"
$ns at 1.3 "$n(6) label ."
$ns at 3.35 "$n(9) add-mark m1 red circle"
$ns at 0.95 "$n(6) color red"
$ns at 1.3 "$n(9) label RREQ"
$ns at 1.3 "$n(4) color black"
$ns at 1.3 "$n(5) color black"
$ns at 1.3 "$n(6) color black"
$ns at 0.75 "$n(2) color red"
$ns at 0.95 "$n(2) color black"
$ns at 0.95 "$n(4) color red"
$ns at 0.95 "$n(5) color red"
$ns at 1.3 "$n(7) color black"
$ns at 1.3 "$n(8) color red"
$ns at 1.3 "$n(9) color red"
$ns at 1.5 "$n(8) color black"
$ns at 1.5 "$n(9) color black"
$ns at 2.15 "$n(9) color black"
$ns at 2.15 "$n(4) color darkgreen"
$ns at 1.75 "$n(8) color darkgreen"
$ns at 1.75 "$n(9) color darkgreen"
$ns at 2.15 "$n(5) color darkgreen"
$ns at 2.4 "$n(4) color black"
$ns at 1.55 "$n(10) color darkgreen"
$ns at 1.75 "$n(10) color black"
$ns at 1.75 "$n(10) label DESTINATION"

#$ns at 3.4 "$n(9) label Melicious_Node"

$ns at 1.55 "$n(10) label RREP"
$ns at 1.75 "$n(10) label DESTINATION"
$ns at 1.75 "$n(8) label RREP"
$ns at 1.75 "$n(9) label RREP"
$ns at 2.15 "$n(8) label ."
$ns at 2.15 "$n(9) label ."

$ns at 2.15 "$n(4) label RREP"
$ns at 2.15 "$n(5) label RREP"
$ns at 2.15 "$n(6) label RREP"
$ns at 2.15 "$n(7) label RREP"


$ns at 2.4 "$n(4) label ."
$ns at 2.4 "$n(5) label ."
$ns at 2.4 "$n(6) label ."
$ns at 2.4 "$n(7) label ."

$ns at 2.4 "$n(1) label RREP"
$ns at 2.4 "$n(2) label RREP"

$ns at 2.7 "$n(1) label ."
$ns at 2.7 "$n(2) label ."
#$ns at 3.6 "$n(1) label PACKET_LOSS"

$ns at 2.15 "$n(7) color darkgreen"
$ns at 2.4 "$n(5) color black"
$ns at 2.4 "$n(6) color black"
$ns at 3.7 "$n(5) color black"
$ns at 3.7 "$n(8) color black"
$ns at 3.35 "$n(9) color deepskyblue"
$ns at 2.15 "$n(6) color darkgreen"
$ns at 2.15 "$n(8) color black"
$ns at 2.4 "$n(7) color black"



$ns at 2.7 "$n(0) color blue"
$ns at 2.72 "$n(1) color blue"
$ns at 2.74 "$n(6) color blue"
$ns at 2.76 "$n(9) color blue"
$ns at 2.78 "$n(10) color blue"
#$ns at 3.2 "$n(9) setdest 335.0 251.0 300.0"
#$ns at 0.001 "[$n(0) set ragent_] diffie_helman"
set ac [open KeyServer.txt w]
puts $ac "\n  --------------------------------------------------------------------------------------"
puts $ac "    Shared-key\tNode-Id\t\tPublic-basedKey-H(ID)\tPrivateSigningKey(gsk)"
puts $ac "  ----------------------------------------------------------------------------------------\n"
close $ac

set f 1
while {$f} {
set mk [expr int(rand()*50)]
if {$mk>20} {
set f 0
}
}

set a(0) 10
set a(1) 11
set a(2) 100
set a(3) 101
set a(4) 110
set a(5) 111

set ab [expr int(rand()*6)]
puts stdout $ab

for {set i 2} {$i<[expr $val(nn)]} {incr i} {
set sk($i) [expr $mk*$a($ab)$i]
set ac [open KeyServer.txt a]
puts $ac "\t$mk\t\t$i\t\t\t$a($ab)$i[expr int(rand()*10)]\t\t$sk($i)"
close $ac
}

$ns at 0.1 "$ns trace-annotate \"NODE0 became SOURCE\""
$ns at 0.2 "$ns trace-annotate \"NODE10 became DESTINATION\""
$ns at 0.3 "$ns trace-annotate \"NODE0 flood RREQ packet using AODV for DESTINATION\""
$ns at 1.55 "$ns trace-annotate \"NODE10 send RREP packets to SOURCE NODE\""
$ns at 2.7 "$ns trace-annotate \"path established between NODE0 and NODE14\""
$ns at 3.2 "$ns trace-annotate \"NODE9 moves\""
$ns at 3.48 "$ns trace-annotate \"Selective Packet Drop\""
$ns at 3.6 "$ns trace-annotate \"PACKET LOSS\""

set sink11 [new Agent/LossMonitor]
set sink12 [new Agent/LossMonitor]
set sink13 [new Agent/LossMonitor]
set sink14 [new Agent/LossMonitor]
set sink15 [new Agent/LossMonitor]
set sink22 [new Agent/LossMonitor]
set sink23 [new Agent/LossMonitor]
set sink24 [new Agent/LossMonitor]
set sink25 [new Agent/LossMonitor]
set sink26 [new Agent/LossMonitor]
set sink27 [new Agent/LossMonitor]
set sink28 [new Agent/LossMonitor]
set sink29 [new Agent/LossMonitor]
set sink30 [new Agent/LossMonitor]
set sink31 [new Agent/LossMonitor]
set sink16 [new Agent/LossMonitor]
set sink17 [new Agent/LossMonitor]
set sink18 [new Agent/LossMonitor]
set sink19 [new Agent/LossMonitor]
set sink20 [new Agent/LossMonitor]
set sink21 [new Agent/LossMonitor]
set sink42 [new Agent/LossMonitor]
set sink43 [new Agent/LossMonitor]
set sink36 [new Agent/LossMonitor]
set sink37 [new Agent/LossMonitor]
set sink38 [new Agent/LossMonitor]
set sink39 [new Agent/LossMonitor]
set sink40 [new Agent/LossMonitor]
set sink41 [new Agent/LossMonitor]
set sink44 [new Agent/LossMonitor]
set sink45 [new Agent/LossMonitor]
set sink46 [new Agent/LossMonitor]
set sink33 [new Agent/LossMonitor]
set sink34 [new Agent/LossMonitor]
set sink35 [new Agent/LossMonitor]
set sink0 [new Agent/LossMonitor]
set sink1 [new Agent/LossMonitor]
set sink2 [new Agent/LossMonitor]
set sink3 [new Agent/LossMonitor]
set sink4 [new Agent/LossMonitor]
set sink5 [new Agent/LossMonitor]
set sink6 [new Agent/LossMonitor]
set sink7 [new Agent/LossMonitor]
set sink8 [new Agent/LossMonitor]
set sink9 [new Agent/LossMonitor]
set sink10 [new Agent/LossMonitor]
set sink32 [new Agent/LossMonitor]

set sink47 [new Agent/LossMonitor]
set sink48 [new Agent/LossMonitor]
set sink49 [new Agent/LossMonitor]

set sink50 [new Agent/LossMonitor]
set sink51 [new Agent/LossMonitor]
set sink52 [new Agent/LossMonitor]
set sink53 [new Agent/LossMonitor]
set sink54 [new Agent/LossMonitor]
set sink55 [new Agent/LossMonitor]
set sink56 [new Agent/LossMonitor]
set sink57 [new Agent/LossMonitor]
set sink58 [new Agent/LossMonitor]
set sink59 [new Agent/LossMonitor]
set sink60 [new Agent/LossMonitor]
set sink61 [new Agent/LossMonitor]

$ns attach-agent $n(9) $sink14
$ns attach-agent $n(9) $sink15 
$ns attach-agent $n(9) $sink16 
$ns attach-agent $n(1) $sink39
$ns attach-agent $n(10) $sink17
$ns attach-agent $n(10) $sink18
$ns attach-agent $n(8) $sink19
$ns attach-agent $n(9) $sink20
$ns attach-agent $n(4) $sink21
$ns attach-agent $n(5) $sink22
$ns attach-agent $n(6) $sink23
$ns attach-agent $n(6) $sink27
$ns attach-agent $n(7) $sink28
$ns attach-agent $n(6) $sink7
$ns attach-agent $n(7) $sink8
$ns attach-agent $n(8) $sink9
$ns attach-agent $n(8) $sink10 
$ns attach-agent $n(6) $sink40
$ns attach-agent $n(9) $sink41
$ns attach-agent $n(10) $sink42
$ns attach-agent $n(5) $sink43
$ns attach-agent $n(6) $sink44
$ns attach-agent $n(9) $sink46
$ns attach-agent $n(10) $sink47

$ns attach-agent $n(10) $sink45

$ns attach-agent $n(1) $sink0
$ns attach-agent $n(2) $sink29
$ns attach-agent $n(2) $sink30
$ns attach-agent $n(2) $sink31
$ns attach-agent $n(2) $sink32
$ns attach-agent $n(1) $sink33
$ns attach-agent $n(1) $sink34
$ns attach-agent $n(1) $sink35
$ns attach-agent $n(1) $sink36
$ns attach-agent $n(0) $sink37
$ns attach-agent $n(0) $sink38
$ns attach-agent $n(2) $sink1
$ns attach-agent $n(6) $sink5
$ns attach-agent $n(3) $sink6 
$ns attach-agent $n(7) $sink24
$ns attach-agent $n(4) $sink25
$ns attach-agent $n(5) $sink26
$ns attach-agent $n(2) $sink2 
$ns attach-agent $n(4) $sink3
$ns attach-agent $n(5) $sink4
$ns attach-agent $n(8) $sink11
$ns attach-agent $n(8) $sink12
$ns attach-agent $n(9) $sink13

$ns attach-agent $n(18) $sink50
$ns attach-agent $n(17) $sink51
$ns attach-agent $n(19) $sink52
$ns attach-agent $n(23) $sink53
$ns attach-agent $n(9) $sink54
$ns attach-agent $n(9) $sink55
$ns attach-agent $n(21) $sink56
$ns attach-agent $n(12) $sink57
$ns attach-agent $n(11) $sink58
$ns attach-agent $n(20) $sink59
$ns attach-agent $n(14) $sink60
$ns attach-agent $n(13) $sink61


###########################################################

#######################################################

$ns attach-agent $n(6) $sink48
$ns attach-agent $n(10) $sink49
set tcp30 [new Agent/TCP]
$ns attach-agent $n(1) $tcp30
set tcp31 [new Agent/TCP]
$ns attach-agent $n(6) $tcp31
set tcp32 [new Agent/TCP]
$ns attach-agent $n(9) $tcp32
set tcp8 [new Agent/TCP]
$ns attach-agent $n(1) $tcp8
set tcp9 [new Agent/TCP]
$ns attach-agent $n(1) $tcp9 
set tcp10 [new Agent/TCP]
$ns attach-agent $n(1) $tcp10
set tcp11 [new Agent/TCP]
$ns attach-agent $n(1) $tcp11
set tcp12 [new Agent/TCP]
$ns attach-agent $n(3) $tcp12
set tcp16 [new Agent/TCP]
$ns attach-agent $n(8) $tcp16
set tcp17 [new Agent/TCP]
$ns attach-agent $n(8) $tcp17
set tcp18 [new Agent/TCP]
$ns attach-agent $n(8) $tcp18
set tcp20 [new Agent/TCP]
$ns attach-agent $n(9) $tcp20
set tcp21 [new Agent/TCP]
$ns attach-agent $n(4) $tcp21
set tcp22 [new Agent/TCP]
$ns attach-agent $n(5) $tcp22
set tcp23 [new Agent/TCP]
$ns attach-agent $n(6) $tcp23
set tcp24 [new Agent/TCP]
$ns attach-agent $n(6) $tcp24
set tcp0 [new Agent/TCP]
$ns attach-agent $n(1) $tcp0
set tcp1 [new Agent/TCP]
$ns attach-agent $n(2) $tcp1
set tcp2 [new Agent/TCP]
$ns attach-agent $n(0) $tcp2 
set tcp3 [new Agent/TCP]
$ns attach-agent $n(0) $tcp3
set tcp4 [new Agent/TCP]
$ns attach-agent $n(4) $tcp4
set tcp5 [new Agent/TCP]
$ns attach-agent $n(5) $tcp5 
set tcp6 [new Agent/TCP]
$ns attach-agent $n(6) $tcp6
set tcp7 [new Agent/TCP]
$ns attach-agent $n(2) $tcp7
set tcp19 [new Agent/TCP]
$ns attach-agent $n(9) $tcp19
set tcp25 [new Agent/TCP]
$ns attach-agent $n(7) $tcp25
set tcp26 [new Agent/TCP]
$ns attach-agent $n(10) $tcp26
set tcp27 [new Agent/TCP]
$ns attach-agent $n(10) $tcp27
set tcp28 [new Agent/TCP]
$ns attach-agent $n(8) $tcp28
set tcp29 [new Agent/TCP]
$ns attach-agent $n(9) $tcp29
set tcp33 [new Agent/TCP]
$ns attach-agent $n(10) $tcp33
set tcp34 [new Agent/TCP]
$ns attach-agent $n(6) $tcp34
set tcp35 [new Agent/TCP]
$ns attach-agent $n(9) $tcp35
set tcp36 [new Agent/TCP]
$ns attach-agent $n(10) $tcp36
set tcp13 [new Agent/TCP]
$ns attach-agent $n(7) $tcp13 
set tcp14 [new Agent/TCP]
$ns attach-agent $n(2) $tcp14
set tcp15 [new Agent/TCP]
$ns attach-agent $n(2) $tcp15
set tcp40 [new Agent/TCP]
$ns attach-agent $n(1) $tcp40
set tcp41 [new Agent/TCP]
$ns attach-agent $n(6) $tcp41
set tcp42 [new Agent/TCP]
$ns attach-agent $n(9) $tcp42
set tcp43 [new Agent/TCP]
$ns attach-agent $n(10) $tcp43
set tcp44 [new Agent/TCP]
$ns attach-agent $n(6) $tcp44
set tcp45 [new Agent/TCP]
$ns attach-agent $n(9) $tcp45
set tcp46 [new Agent/TCP]
$ns attach-agent $n(10) $tcp46
set tcp37 [new Agent/TCP]
$ns attach-agent $n(10) $tcp37
set tcp38 [new Agent/TCP]
$ns attach-agent $n(8) $tcp38
set tcp39 [new Agent/TCP]
$ns attach-agent $n(9) $tcp39

set tcp47 [new Agent/TCP]
$ns attach-agent $n(9) $tcp47
set tcp48 [new Agent/TCP]
$ns attach-agent $n(9) $tcp48
set tcp49 [new Agent/TCP]
$ns attach-agent $n(9) $tcp49

proc attach-CBR-traffic { node sink size interval } {
   set ns [Simulator instance]
   set cbr [new Agent/CBR]
   $ns attach-agent $node $cbr
   $cbr set packetSize_ $size
   $cbr set interval_ $interval
   $ns connect $cbr $sink
   return $cbr
  }
proc plotWindow {tcpSource file} {
global ns
set time 2.2
set now [$ns now]
set cwnd [$tcpSource set cwnd_]
puts $file "$now $cwnd"
$ns at [expr $now+$time] "plotWindow $tcpSource $file" }
$ns at 10.0 "plotWindow $tcp0 $windowVsTime2" 
set cbr6 [attach-CBR-traffic $n(2) $sink6 1000 .05]
set cbr7 [attach-CBR-traffic $n(2) $sink7 1000 .05]
set cbr8 [attach-CBR-traffic $n(2) $sink8 1000 .05]
set cbr9 [attach-CBR-traffic $n(4) $sink9 1000 .05]
set cbr10 [attach-CBR-traffic $n(5) $sink10 1000 .05]
set cbr17 [attach-CBR-traffic $n(8) $sink17 1000 .05]
set cbr18 [attach-CBR-traffic $n(9) $sink18 1000 .05]
set cbr29 [attach-CBR-traffic $n(4) $sink29 1000 .05]
set cbr30 [attach-CBR-traffic $n(5) $sink30 1000 .05]
set cbr31 [attach-CBR-traffic $n(6) $sink31 1000 .05]
set cbr1 [attach-CBR-traffic $n(0) $sink1 1000 .05]
set cbr2 [attach-CBR-traffic $n(1) $sink2 1000 .05]
set cbr3 [attach-CBR-traffic $n(1) $sink3 1000 .05]
set cbr4 [attach-CBR-traffic $n(1) $sink4 1000 .05]
set cbr0 [attach-CBR-traffic $n(0) $sink0 1000 .05]
set cbr5 [attach-CBR-traffic $n(1) $sink5 1000 .05]
set cbr37 [attach-CBR-traffic $n(1) $sink37 1000 .05]
set cbr38 [attach-CBR-traffic $n(2) $sink38 1000 .05]
set cbr39 [attach-CBR-traffic $n(0) $sink39 1000 .05]
set cbr40 [attach-CBR-traffic $n(1) $sink40 1000 .05]
set cbr25 [attach-CBR-traffic $n(9) $sink25 1000 .05]
set cbr26 [attach-CBR-traffic $n(9) $sink26 1000 .05]
set cbr27 [attach-CBR-traffic $n(9) $sink27 1000 .05]
set cbr28 [attach-CBR-traffic $n(9) $sink28 1000 .05]
set cbr13 [attach-CBR-traffic $n(4) $sink13 1000 .05]
set cbr14 [attach-CBR-traffic $n(5) $sink14 1000 .05]
set cbr15 [attach-CBR-traffic $n(6) $sink15 1000 .05]
set cbr16 [attach-CBR-traffic $n(7) $sink16 1000 .05]
set cbr45 [attach-CBR-traffic $n(8) $sink45 1000 .05]
set cbr41 [attach-CBR-traffic $n(6) $sink41 1000 .05]
set cbr42 [attach-CBR-traffic $n(9) $sink42 1000 .05]
set cbr19 [attach-CBR-traffic $n(10) $sink19 1000 .05]
set cbr20 [attach-CBR-traffic $n(10) $sink20 1000 .05]
set cbr21 [attach-CBR-traffic $n(8) $sink21 1000 .05]
set cbr22 [attach-CBR-traffic $n(8) $sink22 1000 .05]
set cbr23 [attach-CBR-traffic $n(8) $sink23 1000 .05]
set cbr24 [attach-CBR-traffic $n(8) $sink24 1000 .05]
set cbr32 [attach-CBR-traffic $n(7) $sink32 1000 .05]
set cbr33 [attach-CBR-traffic $n(4) $sink33 1000 .05]
set cbr34 [attach-CBR-traffic $n(5) $sink34 1000 .05]
set cbr35 [attach-CBR-traffic $n(6) $sink35 1000 .05]
set cbr36 [attach-CBR-traffic $n(7) $sink36 1000 .05]
set cbr11 [attach-CBR-traffic $n(6) $sink11 1000 .05]
set cbr12 [attach-CBR-traffic $n(7) $sink12 1000 .05]
set cbr43 [attach-CBR-traffic $n(1) $sink43 1000 .05]


set cbr44 [attach-CBR-traffic $n(1) $sink44 1000 .05]
set cbr46 [attach-CBR-traffic $n(6) $sink46 1000 .05]
set cbr47 [attach-CBR-traffic $n(9) $sink47 1000 .05]
set cbr48 [attach-CBR-traffic $n(1) $sink48 1000 .05]
set cbr49 [attach-CBR-traffic $n(10) $sink49 1000 .05]

set cbr50 [attach-CBR-traffic $n(16) $sink50 1000 .05]
set cbr51 [attach-CBR-traffic $n(16) $sink51 1000 .05]
set cbr52 [attach-CBR-traffic $n(16) $sink52 1000 .05]
set cbr53 [attach-CBR-traffic $n(7) $sink53 1000 .05]
set cbr54 [attach-CBR-traffic $n(7) $sink54 1000 .05]
set cbr55 [attach-CBR-traffic $n(22) $sink55 1000 .05]
set cbr56 [attach-CBR-traffic $n(22) $sink56 1000 .05]
set cbr57 [attach-CBR-traffic $n(21) $sink57 1000 .05]
set cbr58 [attach-CBR-traffic $n(21) $sink58 1000 .05]
set cbr59 [attach-CBR-traffic $n(17) $sink59 1000 .05]
set cbr60 [attach-CBR-traffic $n(17) $sink60 1000 .05]
set cbr61 [attach-CBR-traffic $n(17) $sink61 1000 .05]
################################################################
set cbr62 [attach-CBR-traffic $n(10) $sink16 1000 .05]
set cbr63 [attach-CBR-traffic $n(9) $sink27 1000 .005]
set cbr64 [attach-CBR-traffic $n(6) $sink0 1000 .05]
set cbr65 [attach-CBR-traffic $n(1) $sink37 1000 .05]
######################################################################
set cbr66 [attach-CBR-traffic $n(0) $sink36 1000 .05]
set cbr67 [attach-CBR-traffic $n(1) $sink43 1000 .05]
set cbr68 [attach-CBR-traffic $n(5) $sink9 1000 .05]
set cbr69 [attach-CBR-traffic $n(8) $sink42 1000 .05]
#############################################################
set cbr70 [attach-CBR-traffic $n(10) $sink9 1000 .05]
set cbr71 [attach-CBR-traffic $n(8) $sink43 1000 .05]
set cbr72 [attach-CBR-traffic $n(5) $sink36 1000 .05]
set cbr73 [attach-CBR-traffic $n(1) $sink37 1000 .05]


$ns at 0.0 "record"
$ns at 0.3 "$cbr0 start"
$ns at 0.3 "$cbr1 start"
$ns at 0.3 "$cbr1 start"
$ns at 0.55 "$cbr2 start"
$ns at 0.55 "$cbr3 start"
$ns at 0.55 "$cbr4 start"
$ns at 0.55 "$cbr5 start"
$ns at 0.75 "$cbr6 start"
$ns at 0.75 "$cbr7 start"
$ns at 0.75 "$cbr8 start"
$ns at 0.95 "$cbr9 start"
$ns at 0.95 "$cbr10 start"
$ns at 0.95 "$cbr11 start"
$ns at 0.95 "$cbr12 start"
$ns at 0.95 "$cbr13 start"
$ns at 0.95 "$cbr14 start"
$ns at 0.95 "$cbr15 start"
$ns at 0.95 "$cbr16 start"
################################
$ns at 0.5 "$cbr0 stop"
$ns at 0.5 "$cbr1 stop"
$ns at 0.75 "$cbr2 stop"
$ns at 0.75 "$cbr3 stop"
$ns at 0.75 "$cbr4 stop"
$ns at 0.75 "$cbr5 stop"
$ns at 0.95 "$cbr6 stop"
$ns at 0.95 "$cbr7 stop"
$ns at 0.95 "$cbr8 stop"
$ns at 1.15 "$cbr9 stop"
$ns at 1.15 "$cbr10 stop"
$ns at 1.15 "$cbr11 stop"
$ns at 1.15 "$cbr12 stop"
$ns at 1.15 "$cbr13 stop"
$ns at 1.15 "$cbr14 stop"
$ns at 1.15 "$cbr15 stop"
$ns at 1.15 "$cbr16 stop"

##############################

$ns at 1.3 "$cbr17 start"
$ns at 1.3 "$cbr18 start"
$ns at 1.55 "$cbr19 start"
$ns at 1.55 "$cbr20 start"
$ns at 1.75 "$cbr21 start"
$ns at 1.75 "$cbr22 start"
$ns at 1.75 "$cbr23 start"
$ns at 1.75 "$cbr24 start"
$ns at 1.75 "$cbr25 start"
$ns at 1.75 "$cbr26 start"
$ns at 1.75 "$cbr27 start"
$ns at 1.75 "$cbr28 start"
$ns at 2.15 "$cbr29 start"
$ns at 2.15 "$cbr30 start"
$ns at 2.15 "$cbr31 start"
$ns at 2.15 "$cbr32 start"
$ns at 2.15 "$cbr33 start"
$ns at 2.15 "$cbr34 start"
$ns at 2.15 "$cbr35 start"
$ns at 2.15 "$cbr36 start"
$ns at 2.35 "$cbr37 start"
$ns at 2.35 "$cbr38 start"


$ns at 1.0 "$cbr50 start"
$ns at 1.0 "$cbr51 start"
$ns at 1.0 "$cbr52 start"
$ns at 1.0 "$cbr53 start"
$ns at 1.0 "$cbr54 start"
$ns at 1.15 "$cbr55 start"
$ns at 1.15 "$cbr56 start"
$ns at 1.3 "$cbr57 start"
$ns at 1.3 "$cbr58 start"
$ns at 1.3 "$cbr59 start"
$ns at 1.3 "$cbr60 start"
$ns at 1.3 "$cbr61 start"

$ns at 1.0 "$n(16) label RREQ"
$ns at 1.1 "$n(16) label ."
$ns at 1.0 "$n(16) color red"
$ns at 1.1 "$n(16) color black"

$ns at 1.1 "$n(7) label RREQ"
$ns at 1.0 "$n(7) label ."
$ns at 1.1 "$n(7) color red"
$ns at 1.0 "$n(7) color black"

$ns at 1.15 "$n(22) label RREQ"
$ns at 1.25 "$n(22) label ."
$ns at 1.15 "$n(22) color red"
$ns at 1.25 "$n(22) color black"

$ns at 1.3 "$n(21) label RREQ"
$ns at 1.4 "$n(21) label ."
$ns at 1.3 "$n(21) color red"
$ns at 1.4 "$n(21) color black"

$ns at 1.3 "$n(17) label RREQ"
$ns at 1.4 "$n(17) label ."
$ns at 1.3 "$n(17) color red"
$ns at 1.4 "$n(17) color black"

$ns at 1.1 "$cbr50 stop"
$ns at 1.1 "$cbr51 stop"
$ns at 1.1 "$cbr52 stop"
$ns at 1.1 "$cbr53 stop"
$ns at 1.1 "$cbr54 stop"
$ns at 1.25 "$cbr55 stop"
$ns at 1.25 "$cbr56 stop"
$ns at 1.4 "$cbr57 stop"
$ns at 1.4 "$cbr58 stop"
$ns at 1.4 "$cbr59 stop"
$ns at 1.4 "$cbr60 stop"
$ns at 1.4 "$cbr61 stop"




$ns at 1.5 "$cbr17 stop"
$ns at 1.5 "$cbr18 stop"
$ns at 1.75 "$cbr19 stop"
$ns at 1.75 "$cbr20 stop"
$ns at 1.95 "$cbr21 stop"
$ns at 1.95 "$cbr22 stop"
$ns at 1.95 "$cbr23 stop"
$ns at 1.95 "$cbr24 stop"
$ns at 1.95 "$cbr25 stop"
$ns at 1.95 "$cbr26 stop"
$ns at 1.95 "$cbr27 stop"
$ns at 1.95 "$cbr28 stop"
$ns at 2.35 "$cbr29 stop"
$ns at 2.35 "$cbr30 stop"
$ns at 2.35 "$cbr31 stop"
$ns at 2.35 "$cbr32 stop"
$ns at 2.35 "$cbr33 stop"
$ns at 2.35 "$cbr34 stop"
$ns at 2.35 "$cbr35 stop"
$ns at 2.35 "$cbr36 stop"
$ns at 2.55 "$cbr37 stop"
$ns at 2.55 "$cbr38 stop"
########################################
$ns at 2.7 "$cbr39 start"
$ns at 2.72 "$cbr44 start"
$ns at 2.72 "$cbr46 start"
$ns at 2.72 "$cbr47 start"
$ns at 3.3 "$cbr48 start"

$ns at 3.7 "$cbr39 stop"
$ns at 3.7 "$cbr44 stop"
$ns at 3.7 "$cbr46 stop"
$ns at 3.7 "$cbr47 stop"
$ns at 3.7 "$cbr48 stop"
#####################################################
######################################################
$ns at 2.7 "$n(0) label Secret_No_'a'"
$ns at 3.0 "$n(0) label g^a_mod_p=A"
$ns at 3.3 "$n(0) label Sending_A"


$ns at 3.80 "$cbr62 start"
$ns at 3.78 "$cbr63 start"
$ns at 3.82 "$cbr64 start"
$ns at 3.83 "$cbr65 start"


$ns at 3.80 "$n(0) label Source"
$ns at 3.80 "$n(10) label Secret_No_'b'"
$ns at 3.85 "$n(10) label g^b_mod_p=B"
$ns at 4.0 "$n(10) label Sending_B"

$ns at 5.2 "$n(10) label ."


$ns at 4.6 "$cbr62 stop"
$ns at 4.5 "$cbr63 stop"
$ns at 4.6 "$cbr64 stop"
$ns at 4.6 "$cbr65 stop"

#########################################################
$ns at 5.2 "$n(0) label Not_Verified"
#########################################################
##############################################################
#$ns at 5.5 "$n(6) color black"
#$ns at 5.5 "$n(1) color black"

#$ns at 5.6 "$cbr66 start"
#$ns at 5.6 "$cbr67 start"
#$ns at 5.6 "$cbr68 start"
#$ns at 5.6 "$cbr69 start"

#$ns at 5.7 "$n(0) label Secret_No_'a'"
#$ns at 5.8 "$n(0) label g^a_mod_p=A"
#$ns at 5.9 "$n(0) label Sending_A"

#$ns at 6.2 "$cbr66 stop"
#$ns at 6.2 "$cbr67 stop"
#$ns at 6.2 "$cbr68 stop"
#$ns at 6.2 "$cbr69 stop"

#$ns at 6.2 "$n(0) label ."


#$ns at 6.3 "$cbr70 start"
#$ns at 6.3 "$cbr71 start"
#$ns at 6.3 "$cbr72 start"
#$ns at 6.3 "$cbr73 start"

#$ns at 6.8 "$n(10) label Receive_A"


#$ns at 6.4 "$n(10) label Secret_No_'b'"
#$ns at 6.5 "$n(10) label g^b_mod_p=B"
#$ns at 6.6 "$n(10) label Sending_B"

#$ns at 6.8 "$cbr70 stop"
#$ns at 6.8 "$cbr71 stop"
#$ns at 6.8 "$cbr72 stop"
#$ns at 6.8 "$cbr73 stop"

#$ns at 6.8 "$n(0) label Receive_B"

#$ns at 6.9 "$cbr66 start"
#$ns at 6.9 "$cbr67 start"
#$ns at 6.9 "$cbr68 start"
#$ns at 6.9 "$cbr69 start"

#$ns at 7.3 "$cbr66 stop"
#$ns at 7.3 "$cbr67 stop"
#$ns at 7.3 "$cbr68 stop"
#$ns at 7.3 "$cbr69 stop"

#$ns at 6.9 "$n(0) label E.S.C"

#$ns at 7.4 "$cbr70 start"
#$ns at 7.4 "$cbr71 start"
#$ns at 7.4 "$cbr72 start"
#$ns at 7.4 "$cbr73 start"

#$ns at 7.4 "$n(10) label E.S.C"

#$ns at 7.7 "$cbr70 stop"
#$ns at 7.7 "$cbr71 stop"
#$ns at 7.7 "$cbr72 stop"
#$ns at 7.7 "$cbr73 stop"

#$ns at 7.8 "$n(0) label Established"
#$ns at 7.8 "$n(10) label Established"

#$ns at 7.9 "$n(1) color blue"
#$ns at 7.9 "$n(5) color blue"
#$ns at 7.9 "$n(8) color blue"


#$ns at 7.9 "$cbr66 start"
#$ns at 7.9 "$cbr67 start"
#$ns at 7.9 "$cbr68 start"
#$ns at 7.9 "$cbr69 start"

#$ns at 7.9 "$n(0) label Sending_Data"
#$ns at 7.9 "$n(10) label Data_Received"
##############################################################################
$ns at 5.3 "$cbr0 start"
$ns at 5.3 "$cbr1 start"
$ns at 5.3 "$cbr1 start"
$ns at 5.55 "$cbr2 start"
$ns at 5.55 "$cbr3 start"
$ns at 5.55 "$cbr4 start"
$ns at 5.55 "$cbr5 start"
$ns at 5.75 "$cbr6 start"
$ns at 5.75 "$cbr7 start"
$ns at 5.75 "$cbr8 start"
$ns at 5.95 "$cbr9 start"
$ns at 5.95 "$cbr10 start"
$ns at 5.95 "$cbr11 start"
$ns at 5.95 "$cbr12 start"
$ns at 5.95 "$cbr13 start"
$ns at 5.95 "$cbr14 start"
$ns at 5.95 "$cbr15 start"
$ns at 5.95 "$cbr16 start"

$ns at 5.5 "$cbr0 stop"
$ns at 5.5 "$cbr1 stop"
$ns at 5.75 "$cbr2 stop"
$ns at 5.75 "$cbr3 stop"
$ns at 5.75 "$cbr4 stop"
$ns at 5.75 "$cbr5 stop"
$ns at 5.95 "$cbr6 stop"
$ns at 5.95 "$cbr7 stop"
$ns at 5.95 "$cbr8 stop"
$ns at 6.15 "$cbr9 stop"
$ns at 6.15 "$cbr10 stop"
$ns at 6.15 "$cbr11 stop"
$ns at 6.15 "$cbr12 stop"
$ns at 6.15 "$cbr13 stop"
$ns at 6.15 "$cbr14 stop"
$ns at 6.15 "$cbr15 stop"
$ns at 6.15 "$cbr16 stop"
#########################################
$ns at 6.20 "$n(1) label moniter_mode"
$ns at 6.20 "$n(1) color yellow"
$ns at 6.20 "$n(2) label moniter_mode"
$ns at 6.20 "$n(2) color yellow"
$ns at 6.20 "$n(3) label moniter_mode"
$ns at 6.20 "$n(3) color yellow"
$ns at 6.20 "$n(4) label moniter_mode"
$ns at 6.20 "$n(4) color yellow"
$ns at 6.20 "$n(5) label moniter_mode"
$ns at 6.20 "$n(5) color yellow"
$ns at 6.20 "$n(6) label moniter_mode"
$ns at 6.20 "$n(6) color yellow"
$ns at 6.20 "$n(7) label moniter_mode"
$ns at 6.20 "$n(7) color yellow"
$ns at 6.20 "$n(23) label moniter_mode"
$ns at 6.20 "$n(23) color yellow"
$ns at 6.20 "$n(16) label moniter_mode"
$ns at 6.20 "$n(16) color yellow"
$ns at 6.20 "$n(8) label moniter_mode"
$ns at 6.20 "$n(8) color yellow"
$ns at 6.20 "$n(22) label moniter_mode"
$ns at 6.20 "$n(22) color yellow"
$ns at 6.20 "$n(18) label moniter_mode"
$ns at 6.20 "$n(18) color yellow"
$ns at 6.20 "$n(17) label moniter_mode"
$ns at 6.20 "$n(17) color yellow"
$ns at 6.20 "$n(19) label moniter_mode"
$ns at 6.20 "$n(19) color yellow"
$ns at 6.20 "$n(10) label moniter_mode"
$ns at 6.20 "$n(10) color yellow"
$ns at 6.20 "$n(21) label moniter_mode"
$ns at 6.20 "$n(21) color yellow"
#####################################################
$ns at 6.3 "$cbr17 start"
$ns at 6.3 "$cbr18 start"
$ns at 6.55 "$cbr19 start"
$ns at 6.55 "$cbr20 start"
$ns at 6.75 "$cbr21 start"
$ns at 6.75 "$cbr22 start"
$ns at 6.75 "$cbr23 start"
$ns at 6.75 "$cbr24 start"
$ns at 6.75 "$cbr25 start"
$ns at 6.75 "$cbr26 start"
$ns at 6.75 "$cbr27 start"
$ns at 6.75 "$cbr28 start"
$ns at 7.15 "$cbr29 start"
$ns at 7.15 "$cbr30 start"
$ns at 7.15 "$cbr31 start"
$ns at 7.15 "$cbr32 start"
$ns at 7.15 "$cbr33 start"
$ns at 7.15 "$cbr34 start"
$ns at 7.15 "$cbr35 start"
$ns at 7.15 "$cbr36 start"
$ns at 7.35 "$cbr37 start"
$ns at 7.35 "$cbr38 start"

$ns at 6.5 "$cbr17 stop"
$ns at 6.5 "$cbr18 stop"
$ns at 6.75 "$cbr19 stop"
$ns at 6.75 "$cbr20 stop"
$ns at 6.95 "$cbr21 stop"
$ns at 6.95 "$cbr22 stop"
$ns at 6.95 "$cbr23 stop"
$ns at 6.95 "$cbr24 stop"
$ns at 6.95 "$cbr25 stop"
$ns at 6.95 "$cbr26 stop"
$ns at 6.95 "$cbr27 stop"
$ns at 6.95 "$cbr28 stop"
$ns at 7.35 "$cbr29 stop"
$ns at 7.35 "$cbr30 stop"
$ns at 7.35 "$cbr31 stop"
$ns at 7.35 "$cbr32 stop"
$ns at 7.35 "$cbr33 stop"
$ns at 7.35 "$cbr34 stop"
$ns at 7.35 "$cbr35 stop"
$ns at 7.35 "$cbr36 stop"
$ns at 7.55 "$cbr37 stop"
$ns at 7.55 "$cbr38 stop"
##############################################
$ns at 7.58 "$n(1) label ."
$ns at 7.58 "$n(1) color black"
$ns at 7.58 "$n(2) label ."
$ns at 7.58 "$n(2) color black"
$ns at 7.58 "$n(3) label ."
$ns at 7.58 "$n(3) color black"
$ns at 7.58 "$n(4) label ."
$ns at 7.58 "$n(4) color black"
$ns at 7.58 "$n(5) label ."
$ns at 7.58 "$n(5) color black"
$ns at 7.58 "$n(6) label ."
$ns at 7.58 "$n(6) color black"
$ns at 7.58 "$n(7) label ."
$ns at 7.58 "$n(7) color black"
$ns at 7.58 "$n(23) label ."
$ns at 7.58 "$n(23) color black"
$ns at 7.58 "$n(16) label ."
$ns at 7.58 "$n(16) color black"
$ns at 7.58 "$n(8) label ."
$ns at 7.58 "$n(8) color black"
$ns at 7.58 "$n(22) label ."
$ns at 7.58 "$n(22) color black"
$ns at 7.58 "$n(18) label ."
$ns at 7.58 "$n(18) color black"
$ns at 7.58 "$n(17) label ."
$ns at 7.58 "$n(17) color black"
$ns at 7.58 "$n(19) label ."
$ns at 7.58 "$n(19) color black"
$ns at 7.58 "$n(10) label ."
$ns at 7.58 "$n(10) color black"
$ns at 7.58 "$n(21) label ."
$ns at 7.58 "$n(21) color black"
###################################
$ns at 7.8 "$n(9) label Detected"
###################################
$ns at 7.9 "$n(6) color black"
$ns at 7.9 "$n(1) color black"

$ns at 8.0 "$cbr66 start"
$ns at 8.0 "$cbr67 start"
$ns at 8.0 "$cbr68 start"
$ns at 8.0 "$cbr69 start"

$ns at 8.1 "$n(0) label Secret_No_'a'"
$ns at 8.2 "$n(0) label g^a_mod_p=A"
$ns at 8.3 "$n(0) label Sending_A"

$ns at 8.6 "$cbr66 stop"
$ns at 8.6 "$cbr67 stop"
$ns at 8.6 "$cbr68 stop"
$ns at 8.6 "$cbr69 stop"

$ns at 8.6 "$n(0) label ."


$ns at 8.62 "$cbr70 start"
$ns at 8.62 "$cbr71 start"
$ns at 8.62 "$cbr72 start"
$ns at 8.62 "$cbr73 start"

$ns at 8.65 "$n(10) label Receive_A"


$ns at 8.7 "$n(10) label Secret_No_'b'"
$ns at 8.8 "$n(10) label g^b_mod_p=B"
$ns at 8.9 "$n(10) label Sending_B"

$ns at 9.10 "$cbr70 stop"
$ns at 9.11 "$cbr71 stop"
$ns at 9.12 "$cbr72 stop"
$ns at 9.13 "$cbr73 stop"

$ns at 9.15 "$n(0) label Receive_B"

$ns at 9.2 "$cbr66 start"
$ns at 9.2 "$cbr67 start"
$ns at 9.2 "$cbr68 start"
$ns at 9.2 "$cbr69 start"

$ns at 9.3 "$cbr66 stop"
$ns at 9.3 "$cbr67 stop"
$ns at 9.3 "$cbr68 stop"
$ns at 9.3 "$cbr69 stop"

$ns at 9.9 "$n(0) label E.S.C"

$ns at 10.1 "$cbr70 start"
$ns at 10.1 "$cbr71 start"
$ns at 10.1 "$cbr72 start"
$ns at 10.1 "$cbr73 start"

$ns at 10.1 "$n(10) label E.S.C"

$ns at 10.7 "$cbr70 stop"
$ns at 10.7 "$cbr71 stop"
$ns at 10.7 "$cbr72 stop"
$ns at 10.7 "$cbr73 stop"

$ns at 10.8 "$n(0) label Established"
$ns at 10.8 "$n(10) label Established"

$ns at 10.9 "$n(1) color blue"
$ns at 10.9 "$n(5) color blue"
$ns at 10.9 "$n(8) color blue"


$ns at 10.9 "$cbr66 start"
$ns at 10.9 "$cbr67 start"
$ns at 10.9 "$cbr68 start"
$ns at 10.9 "$cbr69 start"

$ns at 10.9 "$n(0) label Sending_Data"
$ns at 10.9 "$n(10) label Data_Received"


$ns at 14.0 "finish"
puts "Start of simulation.."
$ns run

