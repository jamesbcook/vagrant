exec { 'apt-get update':
  path => '/usr/bin',
}

package { 'git':
  ensure  => present,
  require => Exec['apt-get update'],
}

package { 'smbclient':
  ensure  => present,
  require => Exec['apt-get update'],
}

package { 'build-essential':
  ensure  => present,
  require => Exec['apt-get update'],
}

package { 'libpcap-dev':
  ensure  => present,
  require => Exec['apt-get update'],
}

package { 'libssl-dev':
  ensure  => present,
  require => Exec['apt-get update'],
}

package { 'libffi-dev':
  ensure  => present,
  require => Exec['apt-get update'],
}

package { 'nmap':
  ensure  => present,
  require => Exec['apt-get update'],
}

package { 'grep':
  ensure  => present,
  require => Exec['apt-get update'],
}

package { 'python-setuptools':
  ensure  => present,
  require => Exec['apt-get update'],
}

package { 'python-dev':
  ensure  => present,
  require => Exec['apt-get update'],
}

package { 'sqlite':
  ensure  => present,
  require => Exec['apt-get update'],
}

package { 'metasploit-framework':
  ensure  => present,
  require => Exec['apt-get update'],
}

vcsrepo {'/opt/impacket':
  ensure => present,
  provider => git,
  source => 'https://github.com/CoreSecurity/impacket',
}

vcsrepo {'/opt/responder':
  ensure => present,
  provider => git,
  source => 'https://github.com/lgandx/Responder',
}

class { 'pywerview': }

class { 'peepingJim': }

class { 'cookiescan': }

class { 'cobaltStrike':
  cs_key => '',
}
