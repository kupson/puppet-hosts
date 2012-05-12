class hosts::allenv inherits hosts {
    
    Host <<| |>> {
        ensure => present,
    }

}
