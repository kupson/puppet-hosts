# Manage `/etc/hosts` file.

## Description
This module is suitable mostly for small groups of hosts without private DNS
resolver nearby.  It updates `/etc/hosts` file from template and add host
entries grouped by environment to it.

Warning: Host entries not managed by Puppet will be erased on install (and
template version update).

## Parameters

- puppet_ip - Puppet host IP address (extlookup() variable, optional)

## Usage

### hosts
Replace `/etc/hosts` with template file and add all hosts from node
`$environment` to it.

    include hosts

### hosts::allenv
Same as `hosts` class but import all host resources.  Suitable for puppet
master host or other all-environment nodes.

    include hosts::allenv

### hosts::minimal
Only replace `/etc/hosts` with template file, do not import resources.

    include hosts::minimal

## hosts::params notes
Parameters for this module such as template version.
Change it if you need to trigger `/etc/hosts` file update on nodes.

Right now `$puppet_ip` variable is pupulated by call to extlookup() function.
Please change it to other data source as needed.
