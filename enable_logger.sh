# enable_logger.sh

# Color for logs.
export COLOR_INFO="\033[1;34m"
export COLOR_WARNING="\033[1;33m"
export COLOR_ERROR="\033[1;31m"
export COLOR_SUCCESS="\033[1;32m"
export COLOR_RESET="\033[0m"

# Definition of Language in Texts.

# En.
EN_MSG_PACKAGE_FOUND="Dependency package found: "
EN_MSG_PACKAGE_NOT_FOUND="Dependency package not found!"
EN_MSG_DOWNLOAD_PACKAGE="Please download the package for your OS version or install it via apt if you have internet access."
EN_MSG_PACKAGE_INSTALLED="Dependency package is already installed: "
EN_MSG_PACKAGE_INSTALL_FINISHED="Dependency package installation finished!"
EN_MSG_REMOVING_OLD_DRIVERS="Removing old drivers..."
EN_MSG_DRIVER_REMOVED="Driver removed successfully!"
EN_MSG_DRIVER_REMOVAL_FAILED="Failed to remove driver!"
EN_MSG_NO_DRIVERS_TO_REMOVE="There are no RTL8812AU Network Drivers to remove."
EN_MSG_INSTALLING_DRIVER="Installing RTL8812AU driver..."

# Pt.
PT_MSG_PACKAGE_FOUND="Pacote de dependência encontrado: "
PT_MSG_PACKAGE_NOT_FOUND="Pacote de dependência não encontrado!"
PT_MSG_DOWNLOAD_PACKAGE="Por favor, baixe o pacote para a versão do seu SO ou instale-o via apt se tiver acesso à internet."
PT_MSG_PACKAGE_INSTALLED="Pacote de dependência já está instalado: "
PT_MSG_PACKAGE_INSTALL_FINISHED="Instalação do pacote de dependência finalizada!"
PT_MSG_REMOVING_OLD_DRIVERS="Removendo drivers antigos..."
PT_MSG_DRIVER_REMOVED="Driver removido com sucesso!"
PT_MSG_DRIVER_REMOVAL_FAILED="Falha ao remover driver!"
PT_MSG_NO_DRIVERS_TO_REMOVE="Não há drivers de rede RTL8812AU para remover."
PT_MSG_INSTALLING_DRIVER="Instalando driver RTL8812AU..."

setLanguage() {
    local lang=$(locale | grep 'LANG=' | cut -d '=' -f 2 | cut -d '_' -f 1)

    if [ "$lang" = "pt" ]; then
        export MSG_PACKAGE_ISFOUND=$PT_MSG_PACKAGE_FOUND
        export MSG_PACKAGE_NOT_FOUND=$PT_MSG_PACKAGE_NOT_FOUND
        export MSG_DOWNLOAD_PACKAGE=$PT_MSG_DOWNLOAD_PACKAGE
        export MSG_PACKAGE_INSTALLED=$PT_MSG_PACKAGE_INSTALLED
        export MSG_PACKAGE_INSTALL_FINISHED=$PT_MSG_PACKAGE_INSTALL_FINISHED
        export MSG_REMOVING_OLD_DRIVERS=$PT_MSG_REMOVING_OLD_DRIVERS
        export MSG_DRIVER_REMOVED=$PT_MSG_DRIVER_REMOVED
        export MSG_DRIVER_REMOVAL_FAILED=$PT_MSG_DRIVER_REMOVAL_FAILED
        export MSG_NO_DRIVERS_TO_REMOVE=$PT_MSG_NO_DRIVERS_TO_REMOVE
        export MSG_INSTALLING_DRIVER=$PT_MSG_INSTALLING_DRIVER

    else
        export MSG_PACKAGE_ISFOUND=$EN_MSG_PACKAGE_FOUND
        export MSG_PACKAGE_NOT_FOUND=$EN_MSG_PACKAGE_NOT_FOUND
        export MSG_DOWNLOAD_PACKAGE=$EN_MSG_DOWNLOAD_PACKAGE
        export MSG_PACKAGE_INSTALL_FINISHED=$EN_MSG_PACKAGE_INSTALL_FINISHED
        export MSG_PACKAGE_INSTALLED=$EN_MSG_PACKAGE_INSTALLED
        export MSG_REMOVING_OLD_DRIVERS=$EN_MSG_REMOVING_OLD_DRIVERS
        export MSG_DRIVER_REMOVED=$EN_MSG_DRIVER_REMOVED
        export MSG_DRIVER_REMOVAL_FAILED=$EN_MSG_DRIVER_REMOVAL_FAILED
        export MSG_NO_DRIVERS_TO_REMOVE=$EN_MSG_NO_DRIVERS_TO_REMOVE
        export MSG_INSTALLING_DRIVER=$EN_MSG_INSTALLING_DRIVER
    fi
}
