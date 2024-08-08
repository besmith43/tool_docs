# RSA Keys

RSA Keys are public/private key pairs used for authentication.

### Generating Keys

First thing's first.
We have to generate the keys.
To do that, we'll run the ssh-keygen program.
However, as a part of consistency, I generally run it like this to specify the encryption algorithm used.

```bash
	ssh-keygen -t rsa
```

It'll ask you what name you'd like to give the file and the path where you'd like to put it.
The default location is generally fine: ~/.ssh/id_rsa.
It will also ask for a password, and for you to confirm the password.
This can be left blank.
Or for additional security, you can set a password that will have to be given everytime you use the ssh key for authentication.

![ssh key generation](/assets/gifs/ssh_key_gen.gif)

### Pushing Public Key to Server

In order to use ssh keys for auth, we need to put the id_rsa.pub file that was just generated onto the server in question.
It's contents have to be copied into a specific file (~/.ssh/authorized_keys)with specific permissions that can be set with the following command:

```bash
	chmod 600 ~/.ssh/authorized_keys
```

Now all of this can be done for you by running an included program called ssh-copy-id.

```bash
	ssh-copy-id remoteServer
```

![ssh copy id demo](/assets/gifs/ssh_copy_id.gif)
