# Class: log2mail
#
#
class log2mail( $ensure = present ) {
  
  package {
    log2mail: ensure => $ensure ? {
      /absent|false/ => purged,
      default        => $ensure,
    };
  }
  
  service {
    log2mail:
      hasstatus  => false,
      hasrestart => true,
      ensure    => $ensure ? {
        /absent|false/ => stopped,
        default        => running,
      },
      enable    => $ensure ? {
        /absent|false/ => false,
        default        => true,
      }
      ;
  }
}
