# encoding: utf-8
name 'gitreceive'
maintainer 'Darron Froese'
maintainer_email 'darron@froese.org'
license 'Apache 2.0'
description 'Installs/configures gitreceive'
version '0.4.0'
recipe 'gitreceive::default', 'Installs/configures gitreceive'

depends 'apt'
depends 'sudo'
