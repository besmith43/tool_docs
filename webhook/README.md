# Webhooks with Github

[webhook project repo](https://github.com/adnanh/webhook)

using github webhooks to automate tasks


### Getting Started

1. download the latest version from the webhook git repo referenced above and place the binary in a place one your system that you’d like to reference it

2. now there are 2 additional things to get this working (assuming your on linux): a systemd .service file, and a hooks.json

webhooks.service

```
[Unit]
Description=Webhooks

[Service]
ExecStart=/var/www/webhooks/webhook -hooks /var/www/webhooks/hooks.json -hotreload

[Install]
WantedBy=multi-user.target
```

hooks.json

```
[
  {
    "id": "simple-pull",
    "execute-command": "/var/www/webhooks/commands/simple-pull",
    "pass-arguments-to-command": [
      {
        "source": "payload",
        "name": "repository.name"
      }
    ],
    "trigger-rule": {
          "match":
          {
            "type": "payload-hash-sha1",
            "secret": "mysecret",
            "parameter":
            {
              "source": "header",
              "name": "X-Hub-Signature"
            }
          }
        }
  }
]
```


for this example, here’s the simple-pull script too

```
#! /bin/bash

cd /var/www/$1
git pull
```


3. now you’ll need to go to github and setup the address that github needs to reach out to in order to trigger the desired actions

    1. go to github.com and find your repo

    2. select the “Settings” on the far right of the main tab

	![settings nav bar](/assets/images/webhook_github_repo_settings_tab.png)

	3. then on the left hand side of the settings page, select “webhooks”

	![settings side menu](/assets/images/webhooks_side_menu.png)

	4. select “add webhook”, and fill out the details.

	![manage github webhook](/assets/images/webhooks_manage_webhook.png)

	NOTE: webhooks by default listens on port 9000.  if you want to handle things like subdomains and ssl, good luck.  I’m too lazy to work that out here.

### Caveats

1. as it is documented here, everytime there is a push event (to any branch) the webhook will be triggered.

		technically, that’s not an issue, until it is…

2. this does not address having multiple webhook instances running on the same host by the same or different users.  If you wanna run multiple by the same user, just make the json file bigger with the additional id’s that you want availeble.  however, multiple users running webhooks will need their own ports, and you’ll need to see the documentation for how to address that.



