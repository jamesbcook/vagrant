class pywerview() {
  vcsrepo {'/opt/pywerview':
    ensure => present,
    provider => git,
    source => 'https://github.com/the-useless-one/pywerview',
    notify => Exec['pywerview setup']
  }
  
  exec { 'pywerview setup':
    command => '/usr/bin/python setup.py install',
    cwd => '/opt/pywerview',
    onlyif => '/usr/bin/test -f /opt/pywerview/setup.py',
    refreshonly => true
  }
}

