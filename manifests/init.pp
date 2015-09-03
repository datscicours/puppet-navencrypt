# = Class: navencrypt
#
# Installs, Configures, and Deploy Cloudera's NavEncrypt product.
#
# === Parameters
#
# TODO: Document each class parameter
#
# [*install_repo*]
#   A flag to indicate whether or not we should install the yum repository.
#   Default: true
#
# [*repo_base_url*]
#   The url of where the yum repository is located.
#   Default: "http://archive.gazzang.com/redhat/stable/6/Packages/"
#
# [*repo_gpg_check*]
#   If we should do the GPG check or not.
#   Default: true
#
# [*repo_gpg_key*]
#   The url of where the GPG key is located.
#   Default: "http://archive.cloudera.com/cdh5/redhat/6/x86_64/cdh/RPM-GPG-KEY-cloudera"
#
# [*repo_enabled*]
#   If the repository should be enabled or not.
#   Default: true
#
class navencrypt (
  $install_repo                 = $navencrypt::params::install_repo,
  $repo_base_url                = $navencrypt::params::repo_base_url,
  $repo_gpg_check               = $navencrypt::params::repo_gpg_check,
  $repo_gpg_key                 = $navencrypt::params::repo_gpg_key,
  $repo_enabled                 = $navencrypt::params::repo_enabled,
  $pacakge_ensure               = $navencrypt::params::package_ensure,
) inherits navencrypt::params {


  include '::navencrypt::repo'
  include '::navencrypt::install'


  anchor  { 'navencrypt::begin': }
  anchor  { 'navencrypt::end':   }

  Anchor['navencrypt::begin']
  -> Class['::navencrypt::repo']
  -> Class['::navencrypt::install']
  -> Anchor['navencrypt::end']
}
