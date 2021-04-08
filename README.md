# RavenStash
Stash for Ravencoin-stuff.

## build-from-git.sh
Quick hack to install depends, checkout a branch and build Ravencoin.

Can build linux, arm32v7, windows and osx. (if you get the SDK and put it in /tmp/SDKs/ as the only tar.gz file)

The SDK needs to be extracted like this: https://github.com/bitcoin/bitcoin/tree/master/contrib/macdeploy
The name of the tar.gz does not matter, the name of the directory it extracts does.


It must be run in a docker or some other discardable environment.

Designed to run as root with access to everything.

No sanitychecks, you should read it and understand it before using it.

Example usage:

`$ docker run -it ubuntu:latest bash`

`root@docker# apt update`

`root@docker# apt install -y git`

`root@docker# cd`

`root@docker# git clone https://github.com/fdoving/RavenStash`

`root@docker# RavenStash/build-from-git.sh linux`

