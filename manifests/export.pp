# Class: hosts::export
#
# Host resource exported with environment tag.
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
#   include hosts::export
#
class hosts::export {
    
    @@host {
        $::fqdn:
            ip           => $::ipaddress,
            host_aliases => [ $::hostname ],
            tag          => "for-env-${::environment}";
    }

}
