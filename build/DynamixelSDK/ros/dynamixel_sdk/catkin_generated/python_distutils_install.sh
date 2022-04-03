#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/kian/lab-challenge-2-3-techapostle/src/DynamixelSDK/ros/dynamixel_sdk"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/kian/lab-challenge-2-3-techapostle/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/kian/lab-challenge-2-3-techapostle/install/lib/python2.7/dist-packages:/home/kian/lab-challenge-2-3-techapostle/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/kian/lab-challenge-2-3-techapostle/build" \
    "/usr/bin/python2" \
    "/home/kian/lab-challenge-2-3-techapostle/src/DynamixelSDK/ros/dynamixel_sdk/setup.py" \
     \
    build --build-base "/home/kian/lab-challenge-2-3-techapostle/build/DynamixelSDK/ros/dynamixel_sdk" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/kian/lab-challenge-2-3-techapostle/install" --install-scripts="/home/kian/lab-challenge-2-3-techapostle/install/bin"
