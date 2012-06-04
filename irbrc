begin
  require 'rubygems'
  require 'wirble'
  Wirble.init
  Wirble.colorize
  require 'looksee'
  Looksee.default_width = 160
  require 'pp'
rescue LoadError
end






if ENV.include?('RAILS_ENV') && !Object.const_defined?('RAILS_DEFAULT_LOGGER')
  require 'logger'
  RAILS_DEFAULT_LOGGER = Logger.new(STDOUT)
end

class Object
  def local_methods
    (methods - Object.instance_methods).sort
  end
end

alias q exit
