#install latest version of php

package 'bzip2' do
  action :install
end

bash 'extract_php' do
  user 'root'
  cwd '/'
  code <<-EOH
  wget https://prototype.php.net/distributions/php-7.2.11.tar.bz2
  tar xjf php-7.2.11.tar.bz2
  cd php-7.2.11
  ./configure
  make && make install
  cp php.ini-development /usr/local/lib/php.ini
  EOH
end

  
