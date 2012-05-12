# Class: hosts::allenv
#
# Class hosts modified to import host addresses from all environments.
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
#   include hosts::allenv
#
class hosts::allenv inherits hosts {
    
    Host <<| |>> {
        ensure => present,
    }

}
