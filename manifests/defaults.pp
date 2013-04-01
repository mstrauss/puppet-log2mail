# Class log2mail::defaults
#
# Description
#
# == Parameters
#
#   [*parameter*]
#     Description
#
# == Examples
#
#
# == Requires
#
class log2mail::defaults(
  $filename  = '/var/log/syslog',
  $recipient = root
) {}