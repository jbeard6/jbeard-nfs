class nfs::client::rhel::packages (
    $ensure = installed,
) {

    package { 'nfs-utils':
        ensure => $ensure,
    }

    if $::operatingsystemmajrelease + 0 < 7 {
        package { 'nfs-utils-lib':
            ensure => $ensure,
        }
    }
}
