puppet-log2mail
===============

Installs and configures log2mail.

Requirements
------------

- Debian

Installation
------------

    cd /etc/puppet
    git submodule add https://github.com/mstrauss/puppet-log2mail.git puppet/modules/log2mail

Example usage with hiera
------------------------

In your manifest:

    include log2mail
    
In your hiera configuration yaml:

    log2mail::defaults::recipient: recipient@example.org
    log2mail::configuration:
      mail_bounces:
        filename: /var/log/mail.log
        pattern: status=bounced
      rails_exceptions:
        filename: /var/www/www.example.org/shared/log/production.log
        pattern: ERROR
