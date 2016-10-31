class web {

  $pack = $::osfamily ? {
    redhat => httpd,
    debian => apache2,
  }

  package { "${pack}" :
    ensure => present,
  }

  file { '/var/www/html/index.html' :
    ensure => file,
    source => 'puppet:///modules/web/index.html',
    require => Package["${pack}"],
  }

  service { "${pack}" :
    ensure => running,
    enable => true,
    subscribe => File["/var/www/html/index.html"],
  }

  #file { '/var/www/html/about.html' :
  #  ensure => file,
  #  source => 'puppet:///modules/web/about.html',
  #  require => Package["${pack}"],
  #}
}
