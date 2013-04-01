# Class: log2mail
#
#
class log2mail( $configuration = undef, $ensure = present ) inherits log2mail::defaults
{
  package {
    log2mail: ensure => $ensure ? {
      /absent|false/ => purged,
      default        => $ensure,
    };
  }
  ->
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
  
  if $configuration != undef {
    create_resources( "log2mail::directive", $configuration )
  }
}
