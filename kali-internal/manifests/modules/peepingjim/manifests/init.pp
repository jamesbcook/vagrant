class peepingJim() {

  file { '/opt/peepingJim':
    ensure => 'directory',
  }

  exec { 'peepingJim install':
    command => 'wget https://github.com/jamesbcook/peepingJim/releases/download/v2.0/peepingJim_linux_amd64',
    cwd => '/opt/peepingJim',
    creates => '/opt/peepingJim/peepingJim_linux_amd64',
    path => '/usr/bin/',
  }

  exec { 'phantomjs download':
    command => '/usr/bin/wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2',
    cwd => '/opt/peepingJim',
    onlyif => '/usr/bin/test -f /opt/peepingJim/peepingJim_linux_amd64',
    creates => '/opt/peepingJim/phantomjs-2.1.1-linux-x86_64.tar.bz2',
  }

  exec { 'make peepingJim executable':
    command => 'chmod +x peepingJim_linux_amd64',
    cwd => '/opt/peepingJim',
    path => '/bin/',
  }

  exec { 'pull capture.js':
    command => 'wget https://raw.githubusercontent.com/jamesbcook/peepingJim/master/capture.js',
    cwd => '/opt/peepingJim',
    path => '/usr/bin/',
    creates => '/opt/peeingJim/capture.js',
  }

  exec { 'extract phantomjs':
    command => 'tar -xf phantomjs-2.1.1-linux-x86_64.tar.bz2',
    cwd => '/opt/peepingJim',
    path => '/bin/',
    creates => '/opt/peepingJim/phantomjs-2.1.1-linux-x86_64',
  }

  exec { 'move phantomjs':
    command => 'mv phantomjs-2.1.1-linux-x86_64/bin/phantomjs .',
    cwd => '/opt/peepingJim',
    path => '/bin/',
    creates => '/opt/peepingJim/phantomjs',
  }
}
