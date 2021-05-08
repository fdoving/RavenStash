### Tasks to be finished before final.
| #  |Task          | Comment        |  Who                 | Status         |
|---|---------------|------------|-------------------------|------------|
|1. |Fix p2sh sync on mainnet.|[script.cpp:257](https://github.com/RavenProject/Ravencoin/blob/038da6b6b39cd2ab93606ead02ad5f9695288ab8/src/script/script.cpp#L257) [tx_verify.cpp:660](https://github.com/RavenProject/Ravencoin/blob/038da6b6b39cd2ab93606ead02ad5f9695288ab8/src/consensus/tx_verify.cpp#L660)||
|2. |Test p2sh on testnet||Started. Not coordinated.|
|3. |Discuss and decide if we want to keep or remove sweep in its current state, and figure out if some wants to fix it.|https://github.com/RavenProject/Ravencoin/issues/880|
|4. |If 3 decides on keep, test multiple times on testnet.|||
|5. |Go through the list of PRs included in current develop and make a list of changes that needs more testing or verification.|https://github.com/RavenProject/Ravencoin/commits/develop|Core-devs?|Done (Needs approval)|
|6. |Make a test-case for each, with requirements for approval.| This could be issues on github or similar. I suggest 3+ confirmations on each test, by different people, and multiple platforms (osx, windows, linux required). |In progress|
|7. |Start testing and documenting testing. | If we use github each test-case can be an issue and the testers put findings in comments. Once requirements in tests are met, the issue is closed by a core-dev and they tick that of their list of changes making it into master.|In progress|



