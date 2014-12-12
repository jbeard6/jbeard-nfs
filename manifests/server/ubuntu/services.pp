class nfs::server::ubuntu::services (
    $ensure     = running,
    $enable     = true,
    $configonly = false,
) {

    require portmap

    if $configonly == false {

        service { 'nfs-kernel-server':
            ensure     => $ensure,
            enable     => $enable,
            hasstatus  => true,
            hasrestart => true,
        }

    }

}
