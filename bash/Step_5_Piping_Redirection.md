# Bash Pipes and Redirection

Piping is one of the most useful tools in the bash scripting arsenal.  It allows us to direct the output of one command into another, or direct specific output to different places.  These features because very handy when logging the actions of a command, or cushioning data into a specific format.

Lets start with a simple example to only print the second work of a sentence.

```bash
echo 'this is a sentence' | awk '{ print $2 }'
```

Here we're using the pipe symbol | that sits above your \ key to tell bash to send the output of the echo command to the awk command.

We can use the > to overwrite a file with the output of a command like so:

```bash
ls > pwd_contents.txt
```

Or we can append a file that already exists or create it if it doesn't with the >>

```bash
ls >> pwd_contents.txt
```

Where these can become useful is with logging like so

```bash
echo $(date) - completed system update >> /tmp/apt-update.log
```

Here we're using the date command to put a timestamp at the front of the line followed by the string of text that we need to relay to our future selves.  This will then be appended to the bottom of the apt-update.log file in the /tmp directory of our server.

Now lets take a look at redirecting errors to a log file.

First we need a function to write to stderr (short for Standard Error).

```bash
echoerr() { printf "\033[0;31m%s\n\033[0m" "$*" >&2; }
```

This will make anything that we pass to it appear in red in the terminal and the >&2 is a redirect to stderr.

Now let's use this function in the context of a script.  This script I named script.sh.  I know it's real original.

```bash
#!/bin/bash
echoerr() { printf "\033[0;31m%s\n\033[0m" "$*" >&2; }

echo "everything is fine"

echoerr "something went wrong"
```

Before we can run script.sh, we'll need to make it executable with the following command:

```bash
chmod +x script.sh
```

Now lets run the file with the 2>> error.log like this.

```bash
./script.sh 2>> error.log
```

You should see "everything is fine" appear in the terminal and "something went wrong" in the text file error.log

### EOF Redirection

Let's say that you need to send a block of test to a file.
There's a number of ways to do this, but for the purpose of showing what you can do, we'll show things off with an uber simple example before showing how you'd normally wanna use it.

```bash
cat << EOF > file.txt
this is a test of the emergency broadcast system
I can do multiple lines
without do the normal escape on the newline
and it won't stop until I hit the
EOF

cat file.txt
```

So in this example, we're telling bash that everything until the 'EOF' symbol is seen is a single input.
That input is being redirected to standard input, and given to the cat command which is designed to combine 2 or more input files into 1 and send that combined file to standard out.
Then we're redirecting the standard output generated by the cat command to a file called file.txt in the current directory.
This is something that normally we'd do just by opening the file in an editor and typing in.

However, let's look at a more useful situation.
Let's say that you need to get the contents of a file that's on several servers, but in different places.
The manual way to do this would be to ssh in, and poke around in the ssh shell to find the file.
Then cat out the contents of the file and copy/paste, or use something like sftp or scp to copy the file back to your computer.
Then repeat for each computer.
But what if I told you that ssh can take a command argument?
Furthermore, what if that command could be redirected input until it hits EOF?
Are you interested?

Let's look at what we'd do for one machine to check various places programmatically.
Then we can expand that to look a each machine within the context of a foreach loop.

```bash
ssh $server << EOF > file.txt
if [ -f /usr/lib/share/something/file.txt ]; then
	cat /usr/lib/share/something/file.txt
elif [ -f /opt/something/file.txt ]; then
	cat /opt/something/file.txt
else
	echo file.txt was not found
fi
EOF
```

What is this?
Well, it's doing the exact same logical checks that we'd be doing manually, but programatically.
Let's break it apart:

1. Ssh is connecting to the server through a variable called $server

2. Whatever is printed to standard output will be stored in file.txt

NOTE: this is a single arrow.
Meaning that it is not appending, but overwritting everytime you run this code block.

3. Everything on the next line, until the bash interpreter hits the EOF is seen as command input to be passed to the remote shell to be run on the server as bash commands.

4. The bash instructions are looking at 2 locations, and checking if the file exists with the -f in front of the path.
This can be done because technically the open square bracket '[' is a executable command in bash.
So the -f is actually a parameter, but that's a conversation for another day.

5. As it goes through the if, else if, and else blocks, it's checking the file system on the remote server to see if either the if statement, or the else if statement are true.
If both of them are false, then the else block will be executed.

6. Finally the standard output from the completed ssh command is actually put into the file.txt as explained in step 2.


Now let's do the same example, but with a list of servers:

```bash

servers="test1 test2 test3"

for server in $servers;
do
	ssh $server << EOF > file_$server.txt
		if [ -f /usr/lib/share/something/file.txt ]; then
			cat /usr/lib/share/something/file.txt
		elif [ -f /opt/something/file.txt ]; then
			cat /opt/something/file.txt
		else
			echo file.txt was not found
		fi
EOF

done

```

This isn't doing much more than before, but let's go over it and point out some important callouts.

1. We're filling the variable servers with all the hostnames that we want to connect to.

2. In the foreach declaration, we're storing the individual hostnames in a temp variable called server.

3. We're doing the same as before, but putting standard out to a variablized file name.
The first pass of the loop will create a file called file_test1.txt.

4. The last but probably the most important thing to note.
The EOF has no whitespace in front of it.
Even though we're indenting all the other lines, and that's fine.
We can't indent the EOF.
It changes the symbol and thus you'll get and 'unexpected eof' error.


