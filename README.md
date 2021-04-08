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

1. `$ docker run -it ubuntu:latest bash`

2. `root@docker# apt update`

3. `root@docker# apt install -y git`

4. `root@docker# cd`

5. `root@docker# git clone https://github.com/fdoving/RavenStash`

6. This is where you edit the script to adjust to your needs. I currently use it with 36 threads and have my own branch as standard, you might want to adjust to something else.

7. `root@docker# mkdir -p /tmp/SDKs`

8. `scp you@fileserver:/your/osx-sdk.tar.gz /tmp/SDKs/`  only needed if you want to build for osx.

10. `root@docker# RavenStash/build-from-git.sh linux`

11. Results will appear in /root/releases if everything works.


