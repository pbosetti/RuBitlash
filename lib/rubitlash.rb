#!/usr/bin/env ruby
#
# Created by Paolo Bosetti on 2009-07-02.
# Copyright (c) 2009 University of Trento. All rights 
# reserved.
require 'rubygems'
require "serialport"
require 'expect'
# sp = SerialPort.new("/dev/tty.usbserial-A6004aLr", 57600, 8, 1, SerialPort::NONE)
# 
# sp.expect(/>\s/)
# sp.puts "print free()"
# sp.expect(/>\s/)
# sp.puts "a=10"
# sp.expect(/>\s/)
# sp.puts "print a"
# r = sp.expect(/>\s/)[0]
# r =~ /\n\r(.*)\n\r/
# p $1
# 
# sp.close

class Bitlash
  PROMPT = ">\s"
  attr_accessor :port_addr
  attr_reader :port, :baud
  def initialize(port_addr, baud=57600, verbose=false, name="Bitflash##{(rand*1000).to_i}")
    @port_addr, @baud, @name = port_addr, baud, name
    self.verbose = verbose
    self.open
  end
  
  def open    
    @port = SerialPort.new(@port_addr, 57600, 8, 1, SerialPort::NONE)
    @port.expect(/>\s/)
  end
  
  def close; @port.close; end
  
  def verbose; $expect_verbose; end
    
  def verbose=(bool); $expect_verbose=bool; end
  
  def talk(string)
    @port.puts string
    reply = @port.expect(/#{PROMPT}/)[0]
    reply =~ /(.*)\n\r(.*)\n\r/
    return $2
  end
  
  def [](var)
    self.talk "print #{var.to_s}"
  end
  
  def []=(var,value)
    self.talk "#{var.to_s}=#{value.to_i}"
  end
  
  def macro(name,cmd)
    self.talk "#{name}:=\"#{cmd}\""
  end
  
  def method_missing(m, *args)
    cmd = args.size > 0 ? "print #{m.to_s}(#{args * ','})" : "print #{m.to_s}"
    self.talk(cmd)
  end
  
end
