# Class log2mail::defaults
#
# Sets the defaults for +log2mail::directive+.
#
# == Parameters
#
#   [*filename*]
#     The default path of the file to monitor
#   [*recipient*]
#     The default recipient
#
class log2mail::defaults(
  $filename  = '/var/log/syslog',
  $recipient = root
) {}