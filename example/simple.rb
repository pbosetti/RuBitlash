#!/usr/bin/env ruby
#
# Created by Paolo Bosetti on 2009-07-02.
# Copyright (c) 2009 University of Trento. All rights 
# reserved.
require "../lib/rubitlash"

bl = Bitlash.new("/dev/tty.usbserial-A6004aLr", 57600, false)
r = bl.talk "print free()"
puts "Bytes free: #{r}"
bl[:a] = 2
puts "a =  #{bl[:a]}"
bl.talk "d13=1"
sleep 2
bl[:f] = bl.free
puts "f = #{bl[:f]}"
bl.close
