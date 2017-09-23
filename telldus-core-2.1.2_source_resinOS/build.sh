#!/bin/sh

apk update
apk add cmake build-base gcc doxygen confuse confuse-dev cmake argp-standalone libftdi1 libftdi1-dev

doxygen -g && mv Doxyfile Doxyfile.in

cmake .
make
make install

