# OpenSIPS SoftSwitch - Community Edition - Testing

OpenSIPS SoftSwitch comes with a set of tests to validate the correctness of
the platform.

## Testing

The following tests suite is available:
* [01.register_disabled](/sipssert/01.register_disabled/): checks that a disabled user cannot register
* [01.register_enabled](/sipssert/01.register_enabled/): tests that an enabled user can register
* [02.call](/sipssert/02.call/): verifies that a user - *caller* can call another user - *callee*
* [02.call_disabled_callee](/sipssert/02.call_disabled_callee/): checks that a disabled user cannot receive calls; first, *caller* and *callee* register, then *callee* is disabled and *caller* tries to call *callee* 2 times: first time the call is completed, the second time, after 70 seconds, the call is rejected (because *callee*'s REGISTER expires)
* [02.call_disabled_caller](/sipssert/02.call_disabled_caller/): tests that a disabled *caller* cannot make calls
* [03.call_unregistered_callee](/sipssert/03.call_unregistered_callee/): checks that a call with an unregistered *callee* is rejected
* [03.call_vm_not_found](/sipssert/03.call_vm_not_found/): checks that a call with an unregistered *callee* is redirected to voicemail if *callee* has voicemail enabled for *not found* scenario
* [04.call_callee_reject](/sipssert/04.call_callee_reject/): checks that a call rejected by *callee* is correctly handled
* [04.call_vm_busy](/sipssert/04.call_vm_busy/): tests that a call rejected by *callee* is redirected to voicemail if *callee* has voicemail enabled for *busy* scenario
* [05.call_no_answer](/sipssert/05.call_no_answer/): checks that a call with no answer is correctly handled
* [05.call_vm_no_answer](/sipssert/05.call_vm_no_answer/): verifies that a call with no answer is redirected to voicemail if *callee* has voicemail enabled for *no answer* scenario
* [06.db_dnd](/sipssert/06.db_dnd/): checks if DND ACL works correctly by enabling/disabling it in the database
* [06.star_dnd](/sipssert/06.star_dnd/): tests if DND ACL works correctly by using the star code to enable/disable it
* [06.star_dnd_with_vm](/sipssert/06.star_dnd_with_vm/): checks if DND ACL works correctly by using the star code to enable/disable it, when voicemail is enabled for *callee* for *busy* scenario
* [07.cf_always](/sipssert/07.cf_always/): tests that a call is always forwarded to a different URI if *callee* has call forwarding enabled for *always* scenario
* [07.cf_busy](/sipssert/07.cf_busy/): verifies that a rejected call is forwarded to a different URI if *callee* has call forwarding enabled for *busy* scenario
* [07.cf_no_answer](/sipssert/07.cf_no_answer/): tests that a call with no answer is forwarded to a different URI if *callee* has call forwarding enabled for *no answer* scenario
* [07.cf_not_found](/sipssert/07.cf_not_found/): checks that a call with an unregistered *callee* is forwarded to a different URI if *callee* has call forwarding enabled for *not found* scenario
* [08.call_did](/sipssert/08.call_did/): checks if *callee* can receive calls on a DID assigned to him
* [09.unknown_domain_callee](/sipssert/09.unknown_domain_callee/): tests that a call to a local IP address is completed
* [09.unknown_domain_caller](/sipssert/09.unknown_domain_caller/): verifies that a call from an unknown domain is rejected
* [10.listen_vm_disabled](/sipssert/10.listen_vm_disabled/): checks that a user cannot listen to voicemail if voicemail is disabled
* [10.listen_vm_enabled](/sipssert/10.listen_vm_enabled/): tests that a user can listen to voicemail if voicemail is enabled
* [11.call_gateway](/sipssert/11.call_gateway/): checks that a call to a known gateway is completed
* [11.gateway_call_did](/sipssert/11.gateway_call_did/): tests that a call coming from a known gateway is completed

## Running the tests

The following command will start a Docker container that will run these SIPssert scenarios:
``` shell
./run-sipssert.sh

# or, if you want to run a specific test
./run-sipssert.sh sipssert/ -t 01.register_enabled
```
