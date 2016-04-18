# boks

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with boks](#setup)
    * [What boks affects](#what-boks-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with boks](#beginning-with-boks)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

This module installs a working BoKS-client system. The BoKS software is installed
through an RPM, it is configured and then automatically ran. It also ensures that a
BoKS root account and host record are generated for the newly installed host, with
a random, ten character password for root. This password is unknown and can be safely
changed through BoKS by the security administrators.

Initially this module will only work with RedHat derivatives, but later on it will
be expanded to included other guest OSes as well. Also, over the course of development
the module will become more refined and will start using matters such as Hiera.

## Setup

### What boks affects 

This module is specific to Fox Technologies (http://www.foxt.com) product called
BoKS: "Behorighet- och KontrollSystem", or "Legitimacy and control system". BoKS
is an RBAC-tool which controls who can do what, where and how. It's compatible 
with many Unixen as well as Windows. 

For more details -> https://en.wikipedia.org/wiki/FoxT_ServerControl

### Setup Requirements 

Nothing in particular.

### Beginning with boks

For starters, you will need to have a functioning BoKS RPM package. FoxT 
does not yet provide this, so you'll have to bake one yourself. Instructions
on how to do this properly will follow soon.

## Usage

As of release 0.3 there are four places where BoKS administrators can and should
adjust their configuration. I realize that's sub-optimal; we'll improve it later.

* The files directory, where the shared secret for pre-registration and the bcastaddr reside.
* The templates directory, where filmon and bokscron configuration files reside.
* The params.pp class, where you define default settings and more.
* The site.pp (or other node classification source), where you can deviate from defaults. 

An example from my testbed, for the site.pp:

node 'client2.broehaha.nl' {
  include boks
  include ssh
  class { 'boks::boks_sshd' : boks_sshd_set_to => 'off', }
  class { 'boks::filmon' : filmon_set_to       => 'off',
                           filmon_runhours     => '23-05',
                           filmon_filesystems  => '', }
  class { 'boks::bksd' : bksd_set_to      => 'on',
                         bksd_timeout     => 'on',
                         bksd_sleep       => '30', }
  class { 'boks::bokscron' : bokscron_set_to      => 'on', }
}

node 'master.broehaha.nl' {
    class { 'boks::master_config' : }
    class { 'boks::master_actions' : }
}


## Reference

Right now the BoKS Puppet module still requires a bit of work. Installation of a client is simple enough, and then you can add additional calls to configure beyond the default settings. Refer to the examples directory for more information.

## Limitations

Due to the lack of proper BoKS packages this module is currently limited to
RedHat 6 derivatives. It requires that you build your own RPM and adjust the module's
parameters file accordingly.

One known issue is that the module currently does not handle software upgrades or reinstallations gracefully. Host pre-registration is irrevocably linked to the installation of the software. If you were to reinstall or upgrade through the module, it would fail in the following steps, as pre-registration hasn't finished. I need to make a work-around for that. 

## Development

The groundwork for this module was laid by Thomas Sluyter. Upon release 0.3 the module's
development was opened up for participation to the BoKS-community at large. A project backlog
in Jira will be made available shortly on a Unixerius server. 

## Release Notes/Contributors/Etc.

* Initial release with a working, basic module (24/02/2016).
* Release 0.2 adds multiple settings from $BOKS_etc/ENV and managing the BoKS SSHD (27/02/2016).
* Release 0.3 added host pre-registration, auto-registration and the addition of root accounts (03/03/2016).
* Release 0.4 added randomized passwords for the root accounts as well as toggling of sysreplace status (06/04/2016). It also refactored the module to pull most per-node information from Hiera.
* Release 0.4.1 prepared the module for publication on the Puppet Forge and did a few small bugfixes. (18/04/2016).
* Release 0.4.2 was a stupid bugfix because I had forgotten to run the Puppet validation tool (18/04/2016).

