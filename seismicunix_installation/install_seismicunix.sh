#!/bin/sh

# Check if the user has all necessary programs
if ! [ -x "$(command -v wget)" ]; then
    printf "ERROR: wget must be installed. You can install it by running this command\n"
    printf "\n$ sudo apt install -y wget\n\n"
    exit 1
fi

# (WARNING) When setting the variables:
# - Do not use tilde expasion ~
# - Do not end a directory path with a forward slash /
# - If the file or directory has restricted access, run this script as superuser

# Directory where Seismic Unix will be installed
CWPROOT="${HOME}/SeismicUnix"

# Shell config file for setting up persistent enviroment variables
SHELL_CONFIG_FILE="${HOME}/.bashrc"

# Setting CWPROOT
# ---------------
printf "\n"
printf "Seismic Unix will be installed into this location:\n"
printf "%s\n" "$CWPROOT"
printf "\n"
printf "  - Press ENTER to confirm the location\n"
printf "  - Press CTRL-C to abort the installation\n"
printf "  - Or specify a different location below\n"
printf "\n"
printf "[%s] >>> " "$CWPROOT"
read -r selected_dir
if [ "$selected_dir" != "" ]; then
    case "$selected_dir" in
        *\ *)
            printf "ERROR: Cannot install into directories with spaces\n" >&2
            exit 1
            ;;
        *)
            eval CWPROOT="$selected_dir"
            ;;
    esac
fi

# Setting SHELL_CONFIG_FILE
# -------------------------
if [ "$SHELL" = '/usr/bin/zsh' ] || [ "$SHELL" = '/bin/zsh' ]; then
    SHELL_CONFIG_FILE="${HOME}/.zshrc"
fi
printf "\n"
printf "This file will be used for setting persistent enviroment variables:\n"
printf "%s\n" "$SHELL_CONFIG_FILE"
printf "\n"
printf "  - Press ENTER to confirm the location\n"
printf "  - Press CTRL-C to abort the installation\n"
printf "  - Or specify a different location below\n"
printf "\n"
printf "[%s] >>> " "$SHELL_CONFIG_FILE"
read -r selected_path
if [ "$selected_path" != "" ]; then
    case "$selected_path" in
        *\ *)
            printf "ERROR: Cannot specify path with spaces\n" >&2
            exit 1
            ;;
        *)
            eval SHELL_CONFIG_FILE="$selected_path"
            ;;
    esac
fi

printf "\nCreating installation directory\n"
if ! mkdir -p "$CWPROOT"; then
    printf "ERROR: Could not create directory: '%s'\n" "$CWPROOT" >&2
    exit 1
fi

printf "\nInstalling dependencies\n"

# General
sudo apt install -y make gcc libx11-dev libxt-dev gfortran libc6
# X-toolkit applications
sudo apt install -y libx11-dev libxt-dev
# Fortran codes
sudo apt install -y gfortran
# Mesa/OpenGL
sudo apt install -y libglu1-mesa-dev freeglut3-dev libxmu-dev libxmu-headers libxi-dev
# Utils
sudo apt install -y libc6
# Motif
sudo apt install -y libxt6 libmotif-dev

printf "Downloading Seismic Unix\n"
wget 'https://nextcloud.seismic-unix.org/s/LZpzc8jMzbWG9BZ/download?path=%2F&files=cwp_su_all_44R22.tgz' -O cwp_su_all_44R22.tgz

printf "Extracting tarball contents to the installation directory\n"
tar -xzf cwp_su_all_44R22.tgz -C "$CWPROOT"

printf "\nDownloading preconfigured Makefile.config\n"
wget https://git.io/JcThD -O "${CWPROOT}/src/Makefile.config"

printf "\nCompiling programs\n"
cd "${CWPROOT}/src"
export CWPROOT=$CWPROOT
# Geral
make install
# X-toolkit applications
make xtinstall
# Fortran codes
make finstall
# Mesa/OpenGl
make mlinstall
# Utils
make utils
# Motif
make xminstall
# Improved SEGDREAD
make sfinstall

printf "\nSetting up persistent enviroment variables\n"
echo "export CWPROOT='${CWPROOT}'" >>"$SHELL_CONFIG_FILE"
echo 'export PATH="${PATH}:${CWPROOT}/bin"' >>"$SHELL_CONFIG_FILE"

printf "\nDone installing\n"

printf "\nReload your current shell to be able to run the program\n"
printf "\n$ source %s\n" "$SHELL_CONFIG_FILE"

printf "\nThen, you can run the following command to test if the installation is working\n"
printf "\n$ suplane | suximage\n\n"

exit 0
