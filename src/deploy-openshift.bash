#!/bin/bash

# Fail the script if any command returns a non-zero value
set -e

# Slurp in some functions...
source /usr/share/misc/func.bash

# Initialise the cloud infra module (generic interface)
initProvisionModule $@

# Set workspace dir
WS_DIR=$PROVISION_DIR

#
# INIT logic
#
if [ ! -f $WS_DIR/success ]; then

    log MOCK "Provisioning OpenShift"

    #
    # Success flag
    touch $WS_DIR/success
fi