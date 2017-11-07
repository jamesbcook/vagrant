exec { 'apt-get update':
  path => '/usr/bin',
}

package { 'git':
  ensure  => present,
  require => Exec['apt-get update'],
}

package { 'grep':
  ensure  => present,
  require => Exec['apt-get update'],
}

package { 'sqlite':
  ensure  => present,
  require => Exec['apt-get update'],
}

package { 'lsb-release':
  ensure  => present,
  require => Exec['apt-get update'],
}

package { 'kismet':
  ensure  => present,
  require => Exec['apt-get update'],
}

package { 'gpsd':
  ensure  => present,
  require => Exec['apt-get update'],
}

package { 'gpsd-clients':
  ensure  => present,
  require => Exec['apt-get update'],
}

vcsrepo { '/opt/SniffAir':
  ensure => present,
  provider => git,
  source => 'https://github.com/Tylous/SniffAir',
  notify => Exec['SniffAir setup'],
}

exec { 'SniffAir setup':
  command => "/usr/bin/printf 'y\\n' | /bin/bash -c '/opt/SniffAir/setup.sh'",
  cwd => '/opt/SniffAir/',
  onlyif => '/usr/bin/test -f /opt/SniffAir/setup.sh',
  refreshonly => true
}

file { '/opt/kismograph':
  ensure => 'directory',
}

exec {'wget https://github.com/mattburch/kismograph/releases/download/1.4/kismograph1.4.linux-amd64.tar.gz':
	cwd => '/opt/kismograph',
	creates => '/opt/kismograph/kismograph1.4.linux-amd64.tar.gz',
	path => '/usr/bin/',
}

exec {'tar -xvzf /opt/kismograph/kismograph1.4.linux-amd64.tar.gz':
	cwd => '/opt/kismograph',
	creates => '/opt/kismograph/kismograph1.4.linux-amd64',
	path => '/bin/',
}

file { '/opt/warmap':
  ensure => 'directory',
}

exec {'wget https://github.com/rmikehodges/warmap-go/releases/download/1.2/warmap_linux_amd64':
	cwd => '/opt/warmap',
	creates => '/opt/warmap/warmap_linux_amd64',
	path => '/usr/bin/',
}
