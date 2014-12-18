class nfs::client::rhel::packages (
    $ensure = installed,
) {

    package { 'nfs-utils':
        ensure => $ensure,
    }
