class nfs::server::rhel::services (
    $ensure     = running,
    $enable     = true,
    $configonly = false,
) {

    require portmap
   
    if $configonly == false {
    
      service { 'nfs':
          ensure     => $ensure,
          enable     => $enable,
          hasstatus  => true,
          hasrestart => true,
      }

       service { 'nfslock':
          ensure     => $ensure,
          enable     => $enable,
          hasstatus  => true,
          hasrestart => true,
      }

   }

}
