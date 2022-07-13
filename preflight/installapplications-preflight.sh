#!/bin/bash

#  installapplications-preflight.sh
#
#  Preflight script for InstallApplications
#
#
#  Created by Jacob F. Grant
#
#  Created: 02/11/18
#  Updated: 02/11/18
#

# List installed packages
PKGS=$(pkgutil --pkgs)


# Check if munki is installed
if  [[ ! `echo "$PKGS" | grep 'com.googlecode.munki.admin'` ]] ||
    [[ ! `echo "$PKGS" | grep 'com.googlecode.munki.app'` ]] ||
    [[ ! `echo "$PKGS" | grep 'com.googlecode.munki.app_usage'` ]] ||
    [[ ! `echo "$PKGS" | grep 'com.googlecode.munki.core'` ]] ||
    [[ ! `echo "$PKGS" | grep 'com.googlecode.munki.launchd'` ]]
then
    # Munki not installed
    # Run InstallApplications
    exit 1
fi


# All tests passed
# Exit/remove InstallApplications
exit 0
