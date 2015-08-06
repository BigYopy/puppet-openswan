[![Build Status](https://travis-ci.org/BigYopy/puppet-openswan.png?branch=master)]
(https://travis-ci.org/BigYopy/puppet-openswan)

####Table of Contents

1. [Overview](#overview)
2. [Setup - The basics of getting started with openswan](#setup)
    * [What openswan affects](#what-openswan-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with openswan](#beginning-with-openswan)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

##Overview

This module is designed to setup a Candlepin server.

##Setup

###What openswan affects

* Installs and configures OpenSwan
* Create VPN connections

###Setup requirements
* Enable IP Forwarding

###Beginning with openswan

~~~ puppet
class { 'openswan': }
~~~

##Usage

###Install Openswan
~~~ puppet
class { 'openswan': }
~~~

###Create a Site to Site VPN
~~~ puppet
openswan::connection { 'site2site':
  ensure       => 'present',
  type         => 'tunnel',
  authby       => 'secret',
  left         => '%defaultroute',
  leftid       => '54.x.x.x',
  leftnexthop  => '%defaultroute',
  leftsubnet   => '10.0.0.0/21',
  right        => '53.x.x.x',
  rightsubnet  => '192.168.1.1/24',
  pfs          => 'yes',
  auto         => 'start',
}
~~~

##Reference

- [**Public Classes**](#public-classes)
    - [Class: openswan](#class-openswan)
- [**Public Defines**](#public-defines)
    - [Define: openswan::connection](#define-openswanconnecion)

### Public Classes

#### Class: `openswan`
Performs a basic installation and configuration of Openswan.

**Parameters within `openswan`:**

##### `nat_traversal`
Enable NAT traversal support. Default: no

##### `virtual_private`
Specify the networks that are allowed as subnet= for the remote client.

##### `protostack`
Define which protocol stack is going to be used.

##### `uniqueids`
Default: yes

##### `connections_dir`
Connections files folder (*.conf). Default: /etc/ipsec.d/connection 

##### `secretss_dir`
Secrets files folder (*.secrets). Default: /etc/ipsec.d/connection 

### Public Defines

#### Define: `openswan::connection`
Configures a VPN connection

**Parameters within `openswan::connection`:**

##### `ensure`
Whether create connection or not. Default: present

##### `type`
Set the IPsec mode to use. Default: tunnel

##### `authby`
Set how the two security gateways should authenticate each other

##### `left`
Specify the IP address of openswan server public-network interface

##### `leftid`
Specify how the left participant should be identified for authentication

##### `leftnexthop`
Specify the next-hop gateway IP address for the left server's
connection to the public network

##### `leftsubnet`
Specify private subnet behind the left openswan server

##### `leftsubnets`
Specify multiple private subnets behind the left openswan server

##### `right`
Specify the IP address of openswan server public-network interface

##### `rightsubnet`
Specify private subnet behind the right openswan server

##### `rightsubnets`
Specify multiple private subnets behind the right openswan server

##### `pfs`
Enable Perfect Forward Secrecy of keys

##### `auto`
Default: ignore

##### `psk`
psk key

##### `ike`
Internet Key Exchange

##### `esp`
Encapsulating Security Payload

##### `keyexchange`
IPsec Key Exchange

##### `salifetime`


##### `ikelifetime`


##Limitations

##Development

