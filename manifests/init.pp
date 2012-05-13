# Class: hosts
#
# This module manages /etc/hosts file, exports and gathers host resources
#   from all nodes in environment.
#
# Parameters:
#   [*puppet_ip*] - puppet IP address (extlookup)
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
#   include hosts
#
class hosts {
    include hosts::template
    include hosts::export

    Host <<| tag == "for-env-${::environment}" |>> {
        ensure  => present,
        require => File['/etc/hosts'],
    }

}
