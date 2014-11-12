# openswan #

[![Build Status](https://travis-ci.org/BigYopy/puppet-openswan.png?branch=master)]
(https://travis-ci.org/BigYopy/puppet-openswan)

Requirements
------------
* Enable IP Forwarding

This module provides:
----------------------
* Openswan Installation and configuration 
* Create VPN connections

Usage Examples
---------------

* To install Openswan:

```````````````````````````````````````````````
class { 'openswan': }
```````````````````````````````````````````````

* To create a Site to Site VPN,  use connection define Type 
 
