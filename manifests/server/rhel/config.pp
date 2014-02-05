class nfs::server::rhel::config (
    $ensure = installed,
) {

    if $ensure == "absent" {

        file { '/etc/exports':
            ensure => absent,
        }

    } else {

        concat { '/etc/exports':
            ensure => $ensure ? {
                absent  => absent,
                default => present,
            },

            owner  => 'root',
            group  => 'root',
            mode   => '0644',
        }

        concat::fragment { '/etc/exports#header':
            target  => '/etc/exports',
            content => '# This file is configured through the nfs::server puppet module.\n',
            order   => 01,
        }

    }

}
