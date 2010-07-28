
  

def passenger_conf_template(ruby, gemset)
<<-EOF
LoadModule passenger_module /Users/mehow/.rvm/gems/#{ruby}@global/gems/passenger-2.2.11/ext/apache2/mod_passenger.so
PassengerRoot /Users/mehow/.rvm/gems/#{ruby}@global/gems/passenger-2.2.11
PassengerRuby /Users/mehow/.passenger_config/passenger_ruby
EOF
end

def ruby_wrapper_template(ruby, gemset)
<<-EOF
#!/usr/bin/env bash

export GEM_HOME="/Users/mehow/.rvm/gems/#{ruby}@#{gemset}"
export GEM_PATH="/Users/mehow/.rvm/gems/#{ruby}@#{gemset}:/Users/mehow/.rvm/gems/#{ruby}@global"
export BUNDLE_PATH="/Users/mehow/.rvm/gems/#{ruby}@#{gemset}"
export MY_RUBY_HOME="/Users/mehow/.rvm/rubies/#{ruby}"
export PATH="/Users/mehow/.rvm/rubies/#{ruby}/bin:/Users/mehow/.rvm/gems/#{ruby}/bin:/Users/mehow/.rvm/gems/#{ruby}@global/bin:/Users/mehow/.rvm/bin:$PATH"

exec "/Users/mehow/.rvm/rubies/#{ruby}/bin/ruby" "$@"
EOF
end
                         
ruby_wrapper = File.dirname(__FILE__) + '/passenger_ruby'
File.open(File.dirname(__FILE__) + '/current_ruby.conf', 'wb') do |file|
  file.print(passenger_conf_template(ARGV[0], ARGV[1]))
end 

File.open(ruby_wrapper, 'wb') do |file|
  file.print(ruby_wrapper_template(ARGV[0], ARGV[1]))
end

%x[chmod u+x #{ruby_wrapper} ]