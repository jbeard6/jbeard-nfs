class nfs::server::ubuntu (
    $package = installed,
    $service = running,
    $enable  = true,
    $configonly = false,
) {

    anchor { 'nfs::server::ubuntu::begin': }
    
    class { 'nfs::server::ubuntu::packages':
        ensure => $package,
    }->
    class { 'nfs::server::ubuntu::config':
        ensure => $package,
    } ~>
    class { 'nfs::server::ubuntu::services':
        ensure     => $service,
        enable     => $enable,
        configonly => $configonly,
    }

    anchor { 'nfs::server::ubuntu::end': }
}
