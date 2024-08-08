# SSH Config Files

SSH config files are a way to setup friendly names and tie those names to the specific settings you want to use for each connection.
Let's go over an example config:

```
HOST friendlyName
	Hostname networkServerName
	user yourUserAccount
	IdentityFile ~/.ssh/id_rsa
	IdentitiesOnly yes

HOST friendlyName2
	Hostname networkServerName2
	user yourUserAccount
	IdentityFile ~/.ssh/id_rsa
	IdentitiesOnly yes
	ProxyJump friendlyName

HOST friendlyName3
	Hostname networkServerName3
	user yourUserAccount
	IdentityFile ~/.ssh/id_rsa
	IdentitiesOnly yes
	ProxyJump friendlyName2
	LocalForward 127.0.0.1:8000 localhost:8000
# locally addressable url:port	addressable url accessible on the remote server:port
```

This example config has 3 entries, but let's break down the common attributes.

HOST - the friendly name that you'll type into your terminal when attempting to start an ssh connection

Hostname - the network addressable hostname of the remote server.
Sometimes this is an FQDN (fully qualified domain name).

user - this is the user account that you want to use on the remote server.
It does not have to be your current user, but it should be one that you have permission/access to use.

IdentityFile - (optional) This is the path to the private ssh key that you want to use for connecting to this host.

IdentitiesOnly - (optional) This is an option that specifies that ssh will only use the ssh private key specified in the IdentityFile option.

**Advanced Options**

ProxyJump - Jump through an intermediate server to be able to reach the desired server.
This is a useful trick when you can't access a resource directly, but can by going through another machine first.
By using this keyword, the hop is handled automatically for you without the need for any manual intervention.

LocalForward - This is a type of port forwarding that makes a resource from the other end of the ssh tunnel available to the local machine as if it was normally addressable.
For a better explaination of this, see this [youtube video](https://youtu.be/YlYZtDnZUO8?si=Ijh0lp5xL2wpU9Aa).



