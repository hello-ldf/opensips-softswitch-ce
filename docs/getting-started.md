# OpenSIPS SoftSwitch - Community Edition - Getting Started

Once the setup of the platform is completely done, you can follow this
guide that shows you how you can get the platform provisioned.

OpenSIPS Control Panel is the simplest way to do this. You can access it at [http://localhost/cp](http://localhost/cp) using the following credentials:
* username: `admin`
* password: `opensips`

## Domains

Besides the default `domain.sip` that is created when the platform is started, you can add more domains using the OpenSIPS Control Panel. From the left panel, select `System` -> `Domains`, fill in the domain name and click `Add New Domain`, then `Reload on Server` (to refresh the OpenSIPS cache).

## Users

You can also add users using Control Panel web interface. From the left panel, go to `Users` -> `User Management` and click `Add New`. Fill in the user details (mandatory fields are `Username`, `Domain`, `Password`) and click `Register`. You can enable/disable one user by clicking on his `ACLs` button and ticking the `User Enabled` checkbox.

## Voicemail

Each user can have a voicemail box. To enable voicemail for a user, go to `Users` -> `User Management`, click on ACLS button for the user you want to enable voicemail for, and tick the `VM Enabled` checkbox.
Now you must select what scenarios will trigger the voicemail redirect. In the same `ACLs` window, you can select the following:
* `VM Permanent Redirect` - if enabled, the call will always be redirected to voicemail
* `VM Redirect Not Found` - if enabled, the call will be redirected to voicemail if the callee is not found
* `VM Redirect on Busy` - if enabled, the call will be redirected to voicemail if the callee rejects the call
* `VM Redirect on No Answer` - if enabled, the call will be redirected to voicemail if the callee does not answer

## Call Forward

When you add a new user (or edit an existing one), you can set up call forwarding for him. There are 4 scenarios:
* `Always Forward` - if present, the call will always be forwarded to the URI specified in this field
* `Busy Forward` - if present, the call will be forwarded to the URI specified in this field if the callee rejects the call
* `No Answer Forward` - if present, the call will be forwarded to the URI specified in this field if the callee does not answer
* `Not Found Forward` - if present, the call will be forwarded to the URI specified in this field if the callee is not found

You must use SIP URIs like: `sip:cf_user@domain.sip`.

## DIDs

From the OpenSIPS Control Panel, you can add DIDs to users. Go to `Users` -> `Alias Management` and click on the `Add New Alias` button. Fill in the required fields and click `Create`.

## PSTN Routing

You can also tweak inbound and outbound routing for PSTN calls using Control Panel web interface. From the left panel, go to `System` -> `Dynamic Routing`. There are three tabs:
* **Gateways** - here you can manage gateways
* **Carriers** - here you can manage carriers
* **Rules** - here you can manage routing rules

To allow one user to make PSTN calls, you must enable the `Enable PSTN` ACL for him.
