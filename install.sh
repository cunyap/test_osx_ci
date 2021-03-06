#!/bin/bash

set -e
set -x

if [[ "$(uname -s)" == 'Darwin' ]]; then

    brew uninstall --ignore-dependencies openssl
    brew install pyenv-virtualenv
    # Install openssl with homebrew
    # brew install openssl 
    # brew link --overwrite --dry-run openssl 
    # brew link --force openssl
	
    # install pyenv
    git clone --depth 1 https://github.com/yyuu/pyenv.git ~/.pyenv
    PYENV_ROOT="$HOME/.pyenv"
    PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"

    case "${PYTHON_VERSION}" in
        py26)
            pyenv install 2.6.9
            pyenv global 2.6.9
            ;;
        py27)
            curl -O https://bootstrap.pypa.io/get-pip.py
            python get-pip.py --user
            ;;
        py33)
            pyenv install 3.3.6
            pyenv global 3.3.6
            ;;
        py34)
            pyenv install 3.4.5
            pyenv global 3.4.5
            ;;
        py35)
            pyenv install 3.5.2
            pyenv global 3.5.2
            ;;
        py36)
            pyenv install 3.6.0
            pyenv global 3.6.0
            ;;
    esac
    pyenv rehash
    export PYENV_VERSION=3.5.2
    export PATH="/Users/travis/.pyenv/shims:${PATH}"
    pyenv-virtualenv venv
    source venv/bin/activate
    # A manual check that the correct version of Python is running.
    python --version
    python -V
    which python
    which pip
    which pip3
    pip3 install -U setuptools
    pip3 install --user virtualenv
else
    pip3 install virtualenv
fi

pip3 install PyInstaller
brew install openssl 
brew link --overwrite --dry-run openssl 
brew link --force openssl
