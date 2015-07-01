class nfs::server::rhel::services (
    $ensure     = running,
    $enable     = true,
    $configonly = false,
) {

    require portmap
   
    if $configonly == false {
        case $::operatingsystemmajrelease {
            '7': {
                $nfs_service = 'nfs-server'
                $nfs_lock_service = 'nfs-lock'
            }
            default: {
                $nfs_service = 'nfs'
                $nfs_lock_service = 'nfslock'
            }
        }

        service { $nfs_service:
            ensure     => $ensure,
            enable     => $enable,
            hasstatus  => true,
            hasrestart => true,
        }

        service { $nfs_lock_service:
            ensure     => $ensure,
            enable     => $enable,
            hasstatus  => true,
            hasrestart => true,
        }
    }
}
