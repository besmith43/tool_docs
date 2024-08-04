# SSH

SSH is a large topic, but put simply it allows to you securely interact with a remote server.

There are 2 ways that this protocol is used:

1. interactive
2. non-interactive


### Interactive Operation

This method creates an interactive shell on the remote resource so that you can run commands on your machine that get executed on the remote machine as though you were on that remote computer.


### Non-Interactive Operation

This method is used by other utilities such as git, scp, and sftp, but it also can be leveraged by you to run a single command or byte stream of instrustions on the remote computer.

```bash
	ssh username@remote_server ls -al
```

This example will run the ls command on the remote_server with the list all flags enabled and redirect the standard output of that command to your shell's standard output.


```bash
	ssh user@remote_server 
```

