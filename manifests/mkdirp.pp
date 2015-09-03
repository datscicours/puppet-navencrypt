define cdh::mkdirp ($path=$title) {
  exec { "mkdirp_${path}":
    command => "mkdir -p ${path}",
    path    => "/bin:/usr/bin:/usr/sbin",
  }
}
