define one_export(
  $path = '',
  $options = [],
  $clients = [],
) {

  if (!defined(File[$path])) {
    file{$path: ensure => present}
  }

  nfs::export { $path:
      options => $options,
      clients => $clients,
      require => File[$path],
  }
}

class nfs::exports ($definitions = {}) {

  if ($::puppetversion =~ /^[12]/) {
    notify{"Your puppet version ${puppetversion} is too old to use nfs::exports. Required is puppet >= 3.0": }
  }
  else {
    include nfs::server
    create_resources(one_export, $definitions, {})
  }
}
