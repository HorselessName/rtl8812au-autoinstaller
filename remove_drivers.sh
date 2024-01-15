#!/bin/sh

# Import Colors
. ./enable_logger.sh

getModuleAndVersion() {
    # Filter for getting only Module and Version, for using with DKMS.
    local modules=$(sudo dkms status | grep '8812au' | awk -F', ' '{print $1}' | awk -F'/' '{print "-m "$1" -v "$2}' | sed 's/: added//')

    if [ -n "$modules" ]; then
        echo "$modules"
    else
        echo ""
    fi
}

removeDrivers() {
    local module_version=$(getModuleAndVersion)

    if [ -n "$module_version" ]; then
        echo "$module_version" | while read -r module; do
            local remove_command="sudo dkms remove $module --all --force"

            # Remove Old Drivers.
            if ( $remove_command &> /dev/null ) 1>/dev/null 2>/dev/null; then
                echo "${COLOR_SUCCESS}${MSG_DRIVER_REMOVED}${COLOR_RESET}"
            else
                echo "${COLOR_ERROR}${MSG_DRIVER_REMOVAL_FAILED}${COLOR_RESET}"

                # Throw Error.
                exit 1
            fi
        done
    else
        echo "${COLOR_WARNING}${MSG_NO_DRIVERS_TO_REMOVE}${COLOR_RESET}"
    fi
}

. ./disable_logger.sh

