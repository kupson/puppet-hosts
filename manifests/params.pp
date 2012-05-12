# Class: hosts::params
#
# This class holds parameters for hosts:: namespace.
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class hosts::params {

    $tmpl_version = '0.1'
    $puppet_ip = extlookup('puppet_ip')

}
