#!/bin/bash

# Exit on any error
set -e

# Check to make sure ip has been passed
if [ -z "$1" ] ; then
	echo "Usage: ./puppet-run.sh <ip address>"
	exit -1
fi

# IP Address passed on the command line as 1st argument
ip=$1

# Sync latest puppet tree over
rsync -a -e 'ssh' *.pp modules manifests root@${ip}:/root/puppet/

# Run puppet on the host
ssh root@${1} 'puppet apply --verbose --modulepath /root/puppet/modules /root/puppet/site.pp'
