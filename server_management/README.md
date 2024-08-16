# Server Management

There are 2 major thoughts on handling server management: Push or Pull.
These ideas apply to various tooling, like ansible, puppet, chef, or salt, as well as exclusively git versioned config files.
For the purposes of keeping things simple, we won't be going over management tools, but will look at these 2 methodologies from a git-only based approach.

### Push Method

Simply put, this is the idea of managing your changes locally on your developement machine, then pushing them out to the various machines that need them.
In this case, git is solely for version control as you are most likely scripting the push of new content to the servers.

![server management push model diagram](/assets/images/server_management_push_model.png)

##### Pros

The pros to this approach is that once you're setup, everything you can do is at your fingertips in a version controlled, and reproducable fashion.
Meaning that when you make a change, there should be a deployment script to propogate that change to the servers that need it, and all the details you need are in one place.

##### Cons

The downsides are that if someone comes onto the server directly and makes changes, you'll be overwriting them on the next deployment.
Furthermore if you don't know that change management is being handled through the git repo, there's not a trail of breadcrumbs to follow on the server beyond what docs you choose to put in the deployed files.

### Pull Method

The pull model is the exact opposite of the push.
With this method, you have the git repo cloned onto each machine.
In this fashion, how you choose to handle breaking up the separation between servers will matter alot.
For example, should you break up into multiple repos or just one repo?
Should you place logical separators based on hostname, so that every machine has it's own copy of the configs and management scripts, or would you separate based on purpose and/or running services?
You'll also need to decide if you want to link everything from the git repo, or copy it into it's final destination.
These types of decisions can have an immense impact on how it looks in practice for you and your team.

![server management pull model diagram](/assets/images/server_management_pull_model.png)

##### Pros

Has a trail of breadcrumbs to follow for individuals unfamiliar with SPO, but needing to get something fixed over the weekend or holiday.
This also allows for the dev machine to be interchangeable as everything needed is on the server itself.
Changes can be made on the server and tested.
Then committed back to the repo.

##### Cons

Requires more decisions to be made on how to handle various concerns.
Allows for the neglect of the git repo as changes aren't necessarily required to be propogated back to the repo.
This also requires any service accounts to have git credentials.
