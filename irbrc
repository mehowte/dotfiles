require 'rubygems'
require 'wirble'
require 'hirb'
require 'pp'

Wirble.init
Wirble.colorize
Hirb.enable


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