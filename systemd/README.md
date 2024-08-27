# SystemD

SystemD is a new init system for linux operating systems.
It allows you to define services and have them start and stop with the system, and be restarted on failure.
There are alot of different options available in SystemD when writing the service configuration, but for starters, let's make a service out of a simple bash script.

Contents of the script (aka our service)

```bash
#!/usr/bin/env bash

if [ ! -d ~/logs ]; then
	mkdir ~/logs
fi

while true
do
	echo the service is still running at $(date +%Y%m%d_%H%M%S)>> ~/logs/myService.log
	sleep 10s
done
```

Now, let's assume that this script is called myService.sh and is the /usr/bin/ directory.
We can run this script manually.
We'll get no output from it, but our terminal will be blocked until we close the application with ctrl+c.
However, we'll have at least 1 entry in our myService.log.

### Building a Basic Service

So now that we have a "daemon" to run, aka our long lived script, we can look at some of the basic components of a SystemD service.
There are 3 major sections: Unit, Service, Install.
The Unit section has options like "Description" for human friendly metadata, but it also has options like required, wants, and after.
These options handle runtime contrains such as waiting to start a service until another service has run or until the network connection is live.
The Service section has all the options for starting, stopping, restarting, and anything else you can think of regarding the desired running process.
Finally, the Install section is mostly used to establish the service's visibility.
Specifically the visibility within SystemD to other services.
This mainly applies when running a service as a specific user.
In such a situation, SystemD doesn't allow it to see and wait on services running outside of the current user.

But let's take a look at the simplest possible service config for our daemon script.

myService.service
```
[Unit]
Description=Bash Script that runs forever

[Service]
WorkingDirectory=/usr/bin
ExecStart=/usr/bin/myService.sh
KillSignal=SIGINT

[Install]
WantedBy=default.target
```

So now we have the daemon script, and we have the service config, but what do we do with them so that SystemD will run our process?
Let's look at 2 different ways of handling that question.

1) running it as a user SystemD service

2) running it as a SystemD service with root.

### User Specific SystemD Service

To get a service running without access to root, we'll need to make sure that everything we need is accessible from our user account and to a degree, stored within it too.
Therefore, we need to make sure that we have the correct path created and that can be done with the following command:

```bash
	mkdir -p ~/.config/systemd/user
```

This path is where our .service file is going to go.
So let's take the myService.service file and move it to this location.

Keep in mind when naming a service, it doesn't matter what you call the file.
However the name of the file will be the name of the service as far as SystemD is concerned.

Now, our script is already where we expect it, so we just need to make SystemD aware of the new file.
To do this, we'll have it reload all the available daemons with the following command:

```bash
	systemctl --user daemon-reload
```

Here we're specifying the ```--user``` flag because we want it to look at our current user's services.
The default is to look at the system's available services.
This command will need to be run anytime you change the contents of a .service file as well.

Now that SystemD is aware of our new user level service, we can have it start the service.

```bash
	systemctl --user start myService
```

Let's check in that everything was started successfully.

```bash
	systemctl --user status myService
```

It will either show a status of "Active" and our log file will start getting new entries every 10 seconds, or it'll so "Inactive" and an error.
If you get an error, I'd bet that the script isn't executable.
If I'm right, the exit code will be 203.
We can fix that easily with the following:

```bash
	sudo chmod +x /usr/bin/myService.sh
```

If the file wasn't in /usr/bin but instead our user account's home directory, we wouldn't need sudo.

Now let's restart the server after everything is working, and watch it automatically turn back on.
After the server is back on and you've logged in, run the status command used above.
It's saying inactive?
Why is that?
Well, it's my fault.
We didn't tell SystemD to enable the service.
Only to start it.
But what's the difference?
Well start only starts the service.
Enable makes a symbolic link to a specific location that gets checked at system startup to see if there are any services that need to get started.

Let's get the service enabled, and then start it.

```bash
	systemctl --user enable myService
	systemctl --user start myService
	systemctl --user status myService
```

Now that we have the service enabled, started, and verified to be running, we should be able to restart the server, and watch this service magically come alive on startup.

Congratulations!!!
You've Successfully created a User Level SystemD Service!

Next let's build  a service for the system.

### System Level SystemD Service

Fortunately, a system level service is basically the same thing, but using different directory locations.
The .service file will need to go to ```/usr/lib/systemd/```, and the script can stay where it's at, ```/usr/bin/```.
With system level services, there's alot of subdirectories that a service can be stored at, but for the most part, they're logical separations and don't change runtime characteristics.

But let's go over the commands that we'll need and the order that we'll need them.

1) after the .service is placed in the correct location.

```bash
	sudo systemctl daemon-reload
```

This tells SystemD to reload all the available .service files it can find in the ```/usr/lib/systemd/``` directories.

2) we'll need to enable the service so that it is registered to be started on boot.

```bash
	sudo systemctl enable myService
```

3) we need to start the service the first time.

```bash
	sudo systemctl start myService
```

4) (optional) we can check that the service is running and is healthy.

```bash
	sudo systemctl status myService
```

5) finally we can restart the server to test that the service is operating as we'd expect.

```bash
	sudo reboot
```

NOTE: all of these commands start with sudo.
This is because every systemctl subcommand that causes a change to the system, requires that it's run as root.
Status is the only subcommand that doesn't need root access to run.
However, you  won't get logs partaining to the service if your user account doesn't have permissions to read the logs without a sudo in front.

### Other Subcommands

We've talked about enabling services and starting them, but what about stopping or restarting them?
Well we have options for that.

Let's start with stopping a service:

```bash
	# user level
	systemctl --user stop myService
	# or
	# system level
	sudo systemctl stop myService
```

then to restart a service:

```bash
	# user level
	systemctl --user restart myService
	# or
	# system level
	sudo systemctl restart myService
```

So now what if we wanna see all the avaiable services?
Well SystemD has you covered.

```bash
	# user level
	systemctl --user --type=service
	# or
	# system level
	systemctl --type=service
```

### Closing Thoughts

This is a short and very limited introduction to SystemD.
I'm not even attempting to show the fullest extent of what SystemD can do, but gets your foot in the door.
I highly recommend that you read the manual to see what all this can do.

### Appendix

If you run into issues with running a service as your user with the ```--user``` flag, you'll most likely have a mixture of the following 2 issues.

1) you need to run the following command:

```bash
	loginctl enable-linger $USERNAME
```

It allows your user to start processes on boot but before the user gets logged in.

2) your shell environment is missing a variable that SystemD needs: XDG_RUNTIME_DIR

Before you can set this, you'll need to get your uid.
You can do this with the following command:

```bash
	id -u $USERNAME
```

It should be a number at or above 1000.
Now that you have your user id (aka uid), you can add the following variable export to your bashrc or bash_profile:

```bash
	export XDG_RUNTIME_DIR=/run/user/1002
```
