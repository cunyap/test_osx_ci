#!/bin/bash
#
# execute with --user to make pip install in the user home
#
set -e

python3 -m pip install $USER PyInstaller

if [[ $1 == "linux" ]];
    then
        echo $(ls /usr/lib64/*)
        echo $(ls /usr/lib64/libGL*)

        if [[ $2 == 3.5 ]];
            then
                echo "# build the program"
                echo "For the operating system" $1

                echo "# Done with compiling"
        fi;

        echo "# Done with compiling"
else
    cd /Users/travis/build/cunyap/test_osx_ci/
    pip3 install PyQt5>=5.10.1
    pip3 install .

    if [[ $2 == 3.5 ]];
        then
            echo "# build the program"
            echo "For the operating system" $1
    fi;
    echo "# Done"
fi;


