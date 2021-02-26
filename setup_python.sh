#!/bin/bash

if [[ -z $1 ]]; then
    echo "Please specify Python version as command line argument!"
    exit 1
fi

if [[ $2 -ne 'osx' ]]; then
    exit 1
fi

# get previous directory
# OLD="$(pwd)"

# get directory of this script
#DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
#cd $DIR

# setup MacPython version management
#source osx_utils.sh

# get MacPython version
#MPV="$(fill_pyver $1)"

# create download directory
#DLD=${DIR}/dl_cache
#mkdir -p $DLD

# download MacPython
#PKG="python-${MPV}-macosx10.6.pkg"
#echo PKG
#curl https://www.python.org/ftp/python/${MPV}/${PKG} > ${DLD}/${PKG}

brew install swig;
curl -LO https://raw.githubusercontent.com/GiovanniBussi/macports-ci/master/macports-ci;
source ./macports-ci install;

yes | sudo port install python$1;
yes | sudo port install py$1-pip;
sudo port select --set python3 python$1;
sudo port select --set pip pip$1;
pip install pyinstaller --user;
export PATH=$PATH:/Users/travis/Library/Python/$1/bin;

python3 --version;
pip --version;
pyinstaller --version;
echo "DONE _________________________________"

# go back
#cd $OLD
