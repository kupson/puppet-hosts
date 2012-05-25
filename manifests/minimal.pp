# Class: hosts::minimal
#
# This module manages /etc/hosts file like hosts class but do not import
#   resources from environment.
#
# Parameters:
#   [*puppet_ip*] - puppet IP address (extlookup, optional)
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
#   include hosts::minimal
#
class hosts::minimal {
    include hosts::template
    include hosts::export
    
    Host <<| title == $::fqdn |>> {
        ensure => present,
    }

}
