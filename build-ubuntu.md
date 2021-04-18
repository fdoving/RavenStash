Build instructions for Ravencoin 

Ubuntu 21.04 - Hirsute Hippo

Install dependencies:

`$ sudo apt install build-essential
libdb5.3++-dev
libssl-dev
libboost-chrono1.71-dev
libboost-filesystem1.71-dev
libboost-program-options1.71-dev
libboost-system1.71-dev
libboost-thread1.71-dev
libboost-test1.71-dev
qtbase5-dev
qttools5-dev
bison
libexpat1-dev
libdbus-1-dev
libfontconfig-dev
libfreetype-dev
libice-dev
libsm-dev
libx11-dev
libxau-dev
libxext-dev
libevent-dev
libxcb1-dev
libxkbcommon-dev
libminiupnpc-dev
libprotobuf-dev
libqrencode-dev
xcb-proto
x11proto-xext-dev
x11proto-dev
xtrans-dev
zlib1g-dev
libczmq-dev
autoconf
automake
libtool
protobuf-compiler
`


Download Ravencoin source.

`$ git clone https://github.com/RavenProject/Ravencoin`


The build process:

`$ cd Ravencoin`

`$ git checkout develop`

`$ ./autogen.sh`

`$ ./configure --with-incompatible-bdb`  # this is not recommended, but it works. 

`$ make -j8`  # 8 for 8 build threads, adjust to fit your setup.





