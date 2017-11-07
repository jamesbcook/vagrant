class cobaltStrike (String $cs_key) {
  cobaltstrike::download($cs_key, "/tmp/cobaltstrike.tgz")

  exec { 'unzip tar':
    command => 'tar zxf /tmp/cobaltstrike.tgz -C /opt',
    creates => '/opt/cobaltstrike',
    path => '/bin/',
  }

  exec { 'cobaltstrike install':
    command => "printf \"${cs_key}\r\" | java -XX:ParallelGCThreads=4 -XX:+AggressiveHeap -XX:+UseParallelGC -jar /opt/cobaltstrike/update.jar",
    path => '/usr/bin/',
  }

  exec { 'update':
    command => '/opt/cobaltstrike/update',
    cwd => '/opt/cobaltstrike',
  }

}
