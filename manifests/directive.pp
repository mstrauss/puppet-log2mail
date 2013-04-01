# Define log2mail::directive
# 
# Creates a logfile watching definition in +/etc/log2mail/config+.
#
# == Parameters
#
#   [*namevar*]
#     A unique name.
#   [*pattern*]
#     The pattern to look for (regular expression).
#   [*filename*]
#     The file path of the file under watch.
#
# == Examples
#
#   log2mail::directive{ example:
#     pattern  => 'ERROR',
#     filename => '/var/www/rails_app/shared/log/production.log',
#   }
#
# == Requires
#
#   class { log2mail: }
#
define log2mail::directive(
  $pattern,
  $filename  = $::log2mail::defaults::filename,
  $recipient = $::log2mail::defaults::recipient,
  $ensure    = present
) {
  
  Package[log2mail] -> Log2mail::Directive[$name]
  
  file { "/etc/log2mail/config/puppet-${name}":
    content => template('log2mail/directive.erb'),
    ensure  => $ensure,
    notify  => Service[log2mail],
  }
}
