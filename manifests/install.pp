# = Class: navencrypt::install

include selinux

class navencrypt::install inherits navencrypt {

    # install prerequisites
    package { 'make' :
      ensure => $package_ensure,
    }

    package { 'perl' :
      ensure  => $package_ensure,
      require => Package['make'],
    }

    package { 'lsof' :
      ensure  => $package_ensure,
      require => Package['make'],
    }

    package { 'haveged' :
      ensure  => $package_ensure,
      require => Package['make'],
    }

    # Kernel Module Prerequisites
    package { 'kernel-headers' :
      ensure  => $package_ensure,
      require => Package['make'],
    }

    package { 'kernel-devel' :
      ensure  => $package_ensure,
      require => [Package['make'], Package['kernel-headers']],
    }

    # install Navencrypt

    package { 'navencrypt':
      ensure => $package_ensure,
      require => [Package['kerenel-devel'], Package['haveged'], Package['lsof'], Package['perl']],
    }

    service { 'navencrypt-mount':
      enable  => true,
      require => Package['navencrypt'],
    }

    service { 'haveged':
      enable => true,
      require => Package['navencrypt'],
    }

   class { 'selinux':
       mode => 'disable'
   }

}

