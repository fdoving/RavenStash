#!/bin/bash
# Quick hack made to build Ravencoin from git, with depends.
# Made for ubuntu, might work on debian and alike.
# It's best if you understand it, before using it.
# Best used in a docker or similar.
#
# USAGE: ./build-from-git.sh <platform>
# where platform is one of: windows, osx, linux, arm32v7


# WORKPRE = the directory where everything happens. we cd $WORKDIR before cloning from git.
# GITDIR is the name of the directory we clone into, from git. 
# GITBRANCH is the branch we checkout from git.
# BUILDFOR is the first and only argument to this command, it's linux, windows, arm32v7 or osx.
# THREADS is number of threads we try to use. Some, like openssl, forces -j1. I use distcc. typical should be set to around available cores.
# BASEREF should be set to release for releases, does not matter what else it is when it's not releases.


WORKPRE=/build-$1
GITDIR=Ravencoin
GITBRANCH=fdov-depends
WORKDIR=$WORKPRE/$GITDIR/
RELEASEDIR=/root/releases/
BUILDFOR=$1
THREADS=36
BASEREF=dev


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
	git checkout $GITBRANCH
	git pull


cd $WORKDIR
# install depends from apt.
DEBIAN_FRONTEND=noninteractive \
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

# run tests
$WORKDIR/.github/scripts/05-binary-checks.sh $BUILDFOR

# we need this to build packages for osx. Should be pushed to master depends.
apt install -y python3-pip
pip3 install ds_store
# package
$WORKDIR/.github/scripts/06-package.sh $BUILDFOR $WORKDIR $BASEREF


# copy packages to 
mkdir -p $RELEASEDIR
cp $WORKDIR/release/* $RELEASEDIR
echo "Products copied to $RELEASEDIR"
echo "The end."