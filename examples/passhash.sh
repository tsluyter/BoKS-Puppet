#!/bin/bash
# 
# A quick script that helps you hash a password for use with BoKS commands.
# The generated value may be stored in Hiera, to set a node's root password.

echo -e "Enter password: \c"
read PASS
PASSHASH=$(echo $PASS | openssl passwd -1 -stdin)
echo $PASSHASH
