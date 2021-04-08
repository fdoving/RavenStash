#!/bin/bash
# Quick hack made to build Ravencoin from git, with depends.
# Made for ubuntu, might work on debian and alike.
# It's best if you understand it, before using it.
# Best used in a docker or similar.
# USAGE: ./build-from-git.sh <platform>
# where platform is one of: windows, osx, linux, arm32v7

WORKPRE=/build-$1
GITDIR=Ravencoin
WORKDIR=$WORKPRE/$GITDIR/
BUILDFOR=$1
THREADS=22


# make sure we have git
apt update
apt install git

# checkout git, modify to your own usage.
# if you want to start clean every time uncomment next line.
# rm -rf $WORKPRE
	mkdir $WORKPRE
	cd $WORKPRE
	git clone https://github.com/fdoving/Ravencoin.git
	cd $GITDIR
	git checkout fdov-depends
	git pull


cd $WORKDIR
# install depends from apt.
$WORKDIR/.github/scripts/00-install-deps.sh $BUILDFOR


# build or copy depends. Increase number of threads -j2 with -jTHREADS
echo "Setting threads to $THREADS in 02-copy-build*...."

sed -i.old 's/\-j2/\-j'$THREADS'/g' $WORKDIR/.github/scripts/02-copy-build-dependencies.sh
$WORKDIR/.github/scripts/02-copy-build-dependencies.sh $BUILDFOR $WORKDIR
echo "Reverting threads in 02-copy-build*...."
cp $WORKDIR/.github/scripts/02-copy-build-dependencies.sh.old \
$WORKDIR/.github/scripts/02-copy-build-dependencies.sh

# setup environment
$WORKDIR/.github/scripts/03-export-path.sh $BUILDFOR $WORKDIR

# autogen
$WORKDIR/autogen.sh

# configure build
$WORKDIR/.github/scripts/04-configure-build.sh $BUILDFOR $WORKDIR

# build
make -j$THREADS
