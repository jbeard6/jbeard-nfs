define nfs::export (
    $path    = $name,
    $options = [ 'rw', 'sync', 'no_subtree_check', ],
    $clients,
) {

    concat::fragment { $name:
        target  => '/etc/exports',
        content => "${path} ${clients}(${options.join(',')})",
    }

}
