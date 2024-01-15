#!/bin/sh

# Import Logic for Logs (Colors, Texts.)
. ./enable_logger.sh;
setLanguage

# Import Logic for Removing Drivers.
. ./remove_drivers.sh

removeDrivers

installDependencies() {
    # IFS: Internal Field Separator.
    # Iterate over each .deb file in the dependencies directory
    for deb_file in ./dependencies/*.deb; do
        if [ -f "$deb_file" ]; then
            # Extract package name from .deb file
            local package_name=$(dpkg-deb -f "$deb_file" Package)
            echo "${COLOR_INFO}${MSG_PACKAGE_ISFOUND}${deb_file}${COLOR_RESET}"

            # Check if package is installed, if not, install.
            if dpkg -s "$package_name" 1> /dev/null 2> /dev/null ; then
                echo "${COLOR_WARNING}${MSG_PACKAGE_INSTALLED}${deb_file}${COLOR_RESET}"
            else
                sudo dpkg -i "$deb_file" 1> /dev/null 2> /dev/null && \
                echo "${COLOR_SUCCESS}${MSG_PACKAGE_INSTALL_FINISHED}${COLOR_RESET}" || \
                echo "${COLOR_ERROR}${MSG_PACKAGE_INSTALL_ERROR}${COLOR_RESET}"
            fi
        else
            echo "${COLOR_ERROR}${MSG_PACKAGE_NOT_FOUND}${deb_file}${COLOR_RESET}"

            # Throw Error if there is no Packages.
            exit 1
        fi
    done
}

installDriver() {
    echo "${COLOR_INFO}${MSG_REMOVING_OLD_DRIVERS}${COLOR_RESET}"
    echo "${COLOR_INFO}${MSG_INSTALLING_DRIVER}${COLOR_RESET}"
    ( cd ./rtl8812au && sudo make dkms_install )
}

installDependencies

installDriver

. ./disable_logger.sh

exit 0
