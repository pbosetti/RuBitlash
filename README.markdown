INTRODUCTION
============
RuBitlash is a Ruby interface with the wonderful Bitlash library for Arduino.
[Bitlash](http://bitlash.net/) is an [Arduino](http://arduino.cc) library that allows direct interaction via serial port with the microcontroller.
Thanks to Bill Roy for writing it!

INSTALLATION
============
First of all you have to [buy or own an Arduino](http://arduino.cc), then install on it Bitlash (v0.95a or later) following the instructions on [Bill Roy's site](http://bitlash.net/).

Then install RuBitlash gem and start playing with it:

    > sudo gem install pbosetti-rubitlash --source=http://gems.github.com
    
USAGE
=====
I'm still writing few docs, but the library itself is quite short. Look at it to know how to use it.

EXAMPLE
=======

    require "rubitlash"

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