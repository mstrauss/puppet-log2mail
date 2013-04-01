# Define: log2mail::directive
# Parameters:
# $name: unique name
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
