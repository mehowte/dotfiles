function init_rvmrc(){
  current_dir=$(basename `pwd`)
  ruby_version=$(rvm use $1> /dev/null && ~/.rvm/bin/rvm-prompt 2> /dev/null) || return
  #rvm --rvmrc --create ${ruby_version}@${current_dir}
  rvm use ${ruby_version}
  rvm gemset create ${current_dir}
  rvm use ${ruby_version}@${current_dir}
  echo rvm ${ruby_version}@${current_dir} > ./.rvmrc 
}
