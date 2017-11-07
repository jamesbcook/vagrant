class cookiescan() {
  file { '/opt/cookiescan':
    ensure => 'directory',
  }
  
  exec { 'cookiescan install':
    command => 'wget https://github.com/tomsteele/cookiescan/releases/download/v2.3.0/cookiescan_linux_amd64',
    cwd => '/opt/cookiescan',
    creates => '/opt/cookiescan/cookiescan_linux_amd64',
    path => '/usr/bin/',
  }
}
