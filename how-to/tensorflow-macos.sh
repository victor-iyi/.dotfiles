#!/usr/bin/env bash
# Copyright 2021 Victor I. Afolabi
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Set Message Colors.
reset='\033[0m'      # Text Reset

# Regular Colors.
red='\033[0;31m'     # Red
green='\033[0;32m'   # Green
cyan='\033[0;36m'    # Cyan
#purple='\033[0;35m'  # Purple
yellow='\033[0;33m'  # Yellow
#white='\033[0;37m'  # White

# Bold.
# bred='\033[1;31m'   # Red
# bgreen='\033[1;32m' # Green
# byellow='\033[1;33m' # Yellow
# bwhite='\033[1;37m'  # White
bpurple='\033[1;35m' # Purple

# Underline.
ured='\033[4;31m' # Red

function usage() {
  echo -e "${bpurple}Description:${purple} An example script to parse named arguments.${reset}"
  echo
  echo -e "${bwhite}Usage: ${green}${BASH_SOURCE}${reset}
    -h | --help          Show this help message.
    -u | --upgrade       Upgrade TensorFlow.
    -e | --env           Conda environment.
    -v | --version       TensorFlow version e.g '2.6.0'.
    -a | --arch          Architecture to install (x86 | arm64).
    -x86 | --x86         Install TensorFlow for x86.
    -arm64 | --arm64     Install TensorFlow for arm64.
  "
}

# Default arguments.
UPGRADE=false
ARCH=arm64
ENV=tensorflow-metal
TF_VERSION=latest

# Parser loop.
for i in "$@"; do
  case $i in
  -h | --help)
    usage
    exit
    ;;
  -u=* | --upgrade=*)
    UPGRADE=true
    shift # past argument=value
    ;;
  -x86=* | --x86=*)
    ARCH=x86
    shift # past argument=value
    ;;
  -arm64=* | --arm64=*)
    ARCH=arm64
    shift # past argument=value
    ;;
  -a=* | --arch=*)
    ARCH="${i#*=}"
    shift # past argument=value
    ;;
  -e=* | --env=*)
    ENV="${i#*=}"
    shift # past argument=value
    ;;
  -v=* | --version=*)
    TF_VERSION="${i#*=}"
    shift # past argument=value
    ;;
  --default)
    DEFAULT=YES
    shift # past argument with no value
    ;;
  *)
    # unknown option
    echo -e "${bred}ERROR: ${red}Unknown parameter \"$i\"${reset}"
    usage
    exit 1
    ;;
  esac
done

# Step 1. Environment setup.

# # x86: AMD
# python3 -m venv ~/tensorflow-metal
# source ~/tensorflow-metal/bin/activate
# python -m pip install --upgrade pip

# arm64: Apple Silicon
# Download & install conda env.
echo -e "${green}Downloading conda environement...${reset}"
curl -O https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-MacOSX-arm64.sh

# Activate conda env.
echo -e "${green}Activating environement...${reset}"
chmod +x ./Miniforge3-MacOSX-arm64.sh
sh ./Miniforge3-MacOSX-arm64.sh
source ~/miniforge3/bin/activate

# Install tensorflow dependencies.
echo "{green}Installing tensorflow dependencies.${reset}"
conda install -c apple tensorflow-deps
# conda install -c apple tensorflow-deps==2.5.0   # for tensorflow 2.5.0
# conda install -c apple tensorflow-deps==2.6.0 . # for tensorflow 2.6.0

# To upgrade tensorflow, run:
# # Uninstall existing tensorflow-macos and tensorflow-metal.
# python -m pip uninstall -y tensorflow-macos
# python -m pip uninstall -y tensorflow-metal

# # Upgrade tensorflow-deps...
# conda install -c apple tensorflow-deps --force-reinstall

# # ... or point to specific conda environment.
# conda install -c apple tensorflow-deps --force-reinstall -n my_env

# Step 2. Install base TensorFlow.
echo -e "${bgreen}Installing base tensorflow...${reset}"
python -m pip install tensorflow-macos

# Step 3: Install `tensorflow-metal` plugin.
echo "{$bgreen}Installing tensorflow-metal...${reset}"
python -m pip install tensorflow-metal

echo "${bwhite}Run ${yellow}`conda deactivate`${bwhite} to deactivate the environment & ${yellow}`conda activate`${bwhite} to activate the environement.${reset}"

# Usage of parsed arguments.
echo "FILE EXTENSION  = ${EXTENSION}"
echo "SEARCH PATH     = ${SEARCHPATH}"
echo "LIBRARY PATH    = ${LIBPATH}"
echo "Number files in SEARCH PATH with EXTENSION:" $(ls -1 "${SEARCHPATH}"/*."${EXTENSION}" | wc -l)
if [[ -n $1 ]]; then
  echo "Last line of file specified as non-opt/last argument:"
  tail -1 $1
fi