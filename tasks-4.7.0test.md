### Tasks
| #  |Task          | Comment        |  Who                 | Status         |
|---|---------------|------------|-------------------------|------------|
|1. |Fix p2sh sync on mainnet.|[script.cpp:257](https://github.com/RavenProject/Ravencoin/blob/038da6b6b39cd2ab93606ead02ad5f9695288ab8/src/script/script.cpp#L257) [tx_verify.cpp:660](https://github.com/RavenProject/Ravencoin/blob/038da6b6b39cd2ab93606ead02ad5f9695288ab8/src/consensus/tx_verify.cpp#L660)|
|2. |Test p2sh on testnet|||
|3. |Discuss and decide if we want to keep or remove sweep in its current state, and figure out if some wants to fix it.|https://github.com/RavenProject/Ravencoin/issues/880|
|4. |If 3 decides on keep, test multiple times on testnet.|||
|5. |Go through the list of PRs included in current develop and make a list of changes that needs more testing or verification.|https://github.com/RavenProject/Ravencoin/commits/develop|Core-devs?|
|6. |Make a test-case for each, with requirements for approval.| This could be issues on github or similar. I suggest 3+ confirmations on each test, by different people, and multiple platforms (osx, windows, linux required). |
|7. |Start testing and documenting testing. | If we use github each test-case can be an issue and the testers put findings in comments. Once requirements in tests are met, the issue is closed by a core-dev and they tick that of their list of changes making it into master.|



#### You can get binaries from [SIG-Github](https://github.com/Ravenqt-RVN-SIG/Ravencoin/releases)
CHECKSUMS.asc is signed with fdovs PGP Fingerprint: 87EE482FE0942D570EBCFD8B6EECA6DEF1CFFB33



### Testing neeeds before merge to master and release - oldest to newest in git merge history.
| PR#  | Description          | Tests                         | Status        |
|------|----------------------|--------------------------------------|---------------|
|[909](https://github.com/RavenProject/Ravencoin/commit/73619e9e14ab06d4a11c52155b8c6f8c17206de4)|Sweep|Depends on Task #3. Detailed description will follow.|Fails to sweep [this](https://rvnt.cryptoscope.io/address/?address=mj15TuQH36sA6wxdCaNWJz4GrHMQp6rryv)|
|[890](https://github.com/RavenProject/Ravencoin/commit/e5c4e87e5e58a429de2e4443ca00d0a7848217b5)|Dockerfile for fullnode|Build image from the file and test-run. Make sure starts and works.||
|[894](https://github.com/RavenProject/Ravencoin/commit/daf21eab44c68e46251148ac117305b6022ade37)|Price preview header|Make sure it works. Switch to all the options.||
|[898](https://github.com/RavenProject/Ravencoin/commit/74e4b223c35c733ff08b6c766a9fd9561e90c1f7)|Spinboxes Create Assets|Verify this works in as many cases as possible, switch to and from the view and select different asset types||
|[901](https://github.com/RavenProject/Ravencoin/commit/0ab725d6903bba080ea4552ea9d7e3330aa67391)|Configurable IPFS-viewer|Verify this works. Set your own, restart, reset, restart, etc. Try to break it with broken urls?||
|[917](https://github.com/RavenProject/Ravencoin/commit/d36cb41f10289edea7011a72248ca1a2d29a5dbf)|Configurable out of the box browsers|Verify this works. Set your own, restart, reset, restart, etc. Try to break it with broken urls?|||
|[926](https://github.com/RavenProject/Ravencoin/commit/ddc821eec726eafc7ba444b177d0190d785a0925)|Enable High DPI Scaling|Does this create unwanted side effects? OSX? Windows? font-sizes high/low res? Does it fix [870](https://github.com/RavenProject/Ravencoin/issues/870) ? ||
|[927](https://github.com/RavenProject/Ravencoin/commit/ce3a6ed4f395ac0c64204c6fab76bd7d274a2493)|Transfer asset and Send view|Check units and default values in the spinboxes. Click the arrows in spinboxes.||
|[939](https://github.com/RavenProject/Ravencoin/commit/932a983bf0d9ea14a104457431b7576dcb1dcc49)|Redesigned mnemonic dialog|Create new wallets with all the options the new design gives.||
|[955](https://github.com/RavenProject/Ravencoin/commit/a8be3193f470837fbcefe63e54f45200e922ca59)|aarch64-linux build|Test the aarc64-linux binaries. Make sure they work.||
|[873](https://github.com/RavenProject/Ravencoin/commit/a7e305b16b104401b6efb890450a878467bd4c94)|P2SH|Construct transactions. Details will be provided. If not updated find us in discord.||
|OSX|Build/binaries|Test OSX binaries on various versions of OSX. ||
|OSX64|Build/binaries|Test OSX64 binaries.||
|WIN|Build/binaries|Test Windows binaries on various versions of Windows. ||
|LIN|Build/binaries|Test Linux binaries on various versions of Linux. ||
|ARM|Build/binaries|Test arm-linux-gnieabihf binaries.||
|AARCH64|Build/binaries|Test arm-linux-gnieabihf binaries.|Related to PR#955|




### Tests required to pass per PR
| PR#  |Tests          | Comment        |  Who                 | Status     |
|------|---------------|----------------|----------------------|------------|
||||||
||||||
