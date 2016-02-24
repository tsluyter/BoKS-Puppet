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
through an RPM, it is configured and then automatically ran. 

Initially this module will only work with RedHat derivatives, but later on it will
be expanded to included other guest OSes as well. Also, over the course of development 
the module will become more refined and will start using matters such as Hiera.

## Setup

### What boks affects **OPTIONAL**

This module is specific to Fox Technologies (http://www.foxt.com) product called
BoKS: "Behorighet- och KontrollSystem", or "Legitimacy and control system". BoKS
is an RBAC-tool which controls who can do what, where and how. It's compatible 
with many Unixen as well as Windows. 

For more details -> https://en.wikipedia.org/wiki/FoxT_ServerControl

* Currently uses boks-client-7.0-1.el6.x86_64.rpm
* Configured $BOKS_etc/bcastaddr
* Enables and runs /etc/init.d/boksm

### Setup Requirements **OPTIONAL**

Nothing in particular.

### Beginning with boks

For starters, you will need to have a functioning BoKS RPM package. FoxT 
does not yet provide this, so you'll have to bake one yourself. Instructions
on how to do this properly will follow soon.

## Usage

For now all modifications that you'd like to do can be made in both the files 
section and in params.pp.

## Reference

* boks()
* boks::install()
* boks::config()
* boks::service()

Right now it's a straight-forward client installation. Later on we may expand
into the territory of replicas and masters as well. That should be easily doable.

## Limitations

Due to the lack of proper BoKS packages this module is currently limited to
RedHat 6 derivatives.

## Development

At this time I'm still doing the groundwork for the module. Once I've come to 
a more feature-complete set I will open up the module for participation.

## Release Notes/Contributors/Etc. **Optional**

Initial release with a working, basic module (24/02/2016).
