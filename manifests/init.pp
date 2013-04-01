# Class log2mail
#
# Description
#
# == Parameters
#
#   [*configuration*]
#     Used via hiera.  See README.
#
# == Examples
#
#   include log2mail
#
# == Requires
#
#   An OS which knows about the log2mail package.
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
