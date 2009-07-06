#!/usr/bin/env ruby
#
# Created by Paolo Bosetti on 2009-07-02.
# Copyright (c) 2009 University of Trento. All rights 
# reserved.
require "../lib/rubitlash"

# Instantiate the connection. Verbose mode is false
bl = Bitlash.new("/dev/tty.usbserial-A6004aLr", 57600, false)

# talk() writes its argument to Arduino and reports the reply:
r = bl.talk "print free()"
puts "Bytes free: #{r}"

# variables are accessed as keys of the Bitlash instance:
bl[:a] = 2              # writing
puts "a =  #{bl[:a]}"   # reading
bl.talk "d12=1"         # low-level
sleep 2

# Assigning Bitlash variables:
bl[:f] = bl.free        # commands and functions are mapped as methods
puts "f = #{bl[:f]}"

# Macro example
bl.macro "toggle13", "d13=!d13" # define a new macro
puts "\nMacros:"
bl.ls.each_with_index {|m,i| puts "#{i}:\t#{m}"}
bl.toggle13                     # calls the new macro
sleep 1
# but also:
# bl.run :toggle13        # this runs in background on Arduino
# sleep 1

# Some play
puts "\nStarting cyclic fade"
bl.pinmode(11,1)
t = t0 = Time.now.to_f
while (t - t0) < 5 do
  t = Time.now.to_f
  bl[:a11] = ((1.0 - Math::cos((t - t0)*Math::PI))*100).to_i # 2 Hz cycle
  sleep 0.01
end

bl.close
