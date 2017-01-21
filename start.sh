set config "/etc/openvpn/secure02.ovpn"
set username [lrange $argv 0 0]
set password [lrange $argv 1 1]

set force_conservative 1  ;# set to 1 to force conservative mode even if
                          ;# script wasn't run conservatively originally
if {$force_conservative} {
  set send_slow {1 .1}
  proc send {ignore arg} {
    sleep .1
    exp_send -s -- $arg
  }
}

set timeout -1
spawn openvpn --script-security 2  --config $config --auth-user-pass
match_max 100000
expect -exact "Openvpn UserName and password: "
send -- "$username\r" 
send -- "$password\r"
#interact
