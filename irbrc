# encoding: utf-8
require 'rubygems'
require 'wirble'
require 'highline/import'
require 'benchmark'
require 'pp'
#require 'facets'
require 'blinkenlights'
#require "festivaltts4r"
#require "utility_belt"
require "open-uri"
require "nokogiri"

Wirble.init
Wirble.colorize

username = `whoami`.strip
hostname = `hostname`.strip


say (%{<%= color("#{username},欢迎回来到#{hostname}中的",WHITE+ON_BLUE+BOLD)%><%= color("ruby",RED+ON_BLUE+BOLD)%><%= color("的世界",WHITE+ON_BLUE+BOLD)%>})

# Easily print methods local to an object's class
class Object
  def local_methods
      (methods - Object.instance_methods).sort
  end
end

# Log to STDOUT if in Rails
if ENV.include?('RAILS_ENV') && !Object.const_defined?('RAILS_DEFAULT_LOGGER')
    require 'logger'
    RAILS_DEFAULT_LOGGER = Logger.new(STDOUT)
end

if ENV['RAILS_ENV']
 load '~/.railsrc'
 say (%{<%= color("ruby on rails 控制台",WHITE+ON_RED+BOLD)%>})
end

def ls
 if ENV['RAILS_ENV']
  ''
 else
  puts "现在仅提供Rails版本功能"
  return nil
 end
end

def clear
  clear_code = %x{clear}
  print clear_code
end
