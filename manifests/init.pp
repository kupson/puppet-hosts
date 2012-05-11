class hosts {
    include hosts::params

    file {
        '/etc/hosts':
            ensure => file,
            owner  => 'root',
            group  => 'root',
            mode   => 0644;
    }

    @@host {
        $::fqdn:
            ip           => $::ipaddress,
            host_aliases => [ $::hostname ],
            tag          => "for-env-${::environment}";
    }

    if $::hosts_managed == $hosts::params::tmpl_version {
        
        Host <<| tag == "for-env-${::environment}" |>> {
           ensure => present,
        }

    }
    else {
        
        File['/etc/hosts'] {
            content => template('hosts/hosts.erb'),
        }

        notify {
            'hosts_replaced':
                message => 'File /etc/hosts replaced with new template. Please run puppet again to add missing entries.';
        }

    }
}
