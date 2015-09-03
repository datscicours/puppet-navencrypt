# = Class: navencrypt::repo
#
# This class will take care of setting up the repoistory for Cloudera.
#
class navencrypt::repo inherits navencrypt {
  if $install_repo {

    if $repo_enabled {
      $enabled = 1
    } else {
      $enabled = 0
    }

    if $repo_gpg_check {
      $gpg_check = 1
    } else {
      $gpg_check = 0
    }

    yumrepo { 'navencrypt' :
      descr       => 'Yum repository for Cloudera Distribution of Hadoop',
      baseurl     => $repo_base_url,
      gpgcheck    => $gpg_check,
      gpgkey      => $repo_gpg_key,
      enabled     => $enabled,
    }

    file { '/etc/yum.repos.d/navencrypt':
      ensure      => 'file',
      owner       => 'root',
      group       => 'root',
      mode        => '0644',
      require    => Yumrepo['navencrypt'],
    }

  }
}
