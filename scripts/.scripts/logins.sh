#!/usr/bin/expect

set timeout 10

set user [lindex $argv 0]

set password [lindex $argv 1]

spawn login $user

expect "Password:"

send "$password\r"

expect "$user@{hostname}:~$"

send "exit\r"

interact
