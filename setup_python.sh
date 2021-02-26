#!/bin/bash

if [[ -z $1 ]]; then
    echo "Please specify Python version as command line argument!"
    exit 1
fi

if [[ $2 -ne 'osx' ]]; then
    exit 1
fi

# get previous directory
OLD="$(pwd)"

# get directory of this script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
cd $DIR

# setup MacPython version management
source osx_utils.sh

# get MacPython version
MPV="$(fill_pyver $1)"

# create download directory
DLD=${DIR}/dl_cache
mkdir -p $DLD

# download MacPython
PKG="python-${MPV}-macosx10.6.pkg"
echo PKG
curl https://www.python.org/ftp/python/${MPV}/${PKG} > ${DLD}/${PKG}

brew update
brew install openssl readline
brew outdated pyenv || brew upgrade pyenv
brew install pyenv-virtualenv
echo "WE INSTALL PYTHON"
echo python-${MPV}
echo "________________________________"
pyenv install python-${MPV}

export PYENV_VERSION=python-${MPV}
export PATH="/Users/travis/.pyenv/shims:${PATH}"
pyenv-virtualenv venv
source venv/bin/activate
# A manual check that the correct version of Python is running.
python --version

# go back
cd $OLD
