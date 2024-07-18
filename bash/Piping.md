Piping is one of the most useful tools in the bash scripting arsenal.  It allows us to direct the output of one command into another, or direct specific output to different places.  These features because very handy when logging the actions of a command, or cushioning data into a specific format.

Lets start with a simple example to only print the second work of a sentence.

echo 'this is a sentence' | awk '{ print $2 }'

Here we're using the pipe symbol | that sits above your \ key to tell bash to send the output of the echo command to the awk command.

We can use the > to overwrite a file with the output of a command like so:

ls > pwd_contents.txt

Or we can append a file that already exists or create it if it doesn't with the >>

ls >> pwd_contents.txt

Where these can become useful is with logging like so

echo $(date) - completed system update >> /tmp/apt-update.log

Here we're using the date command to put a timestamp at the front of the line followed by the string of text that we need to relay to our future selves.  This will then be appended to the bottom of the apt-update.log file in the /tmp directory of our server.

Now lets take a look at redirecting errors to a log file.

First we need a function to write to stderr (short for Standard Error).

echoerr() { printf "\033[0;31m%s\n\033[0m" "$*" >&2; }

This will make anything that we pass to it appear in red in the terminal and the >&2 is a redirect to stderr.

Now let's use this function in the context of a script.  This script I named script.sh.  I know it's real original.

#!/bin/bash

echoerr() { printf "\033[0;31m%s\n\033[0m" "$*" >&2; }

echo "everything is fine"

echoerr "something went wrong"

Before we can run script.sh, we'll need to make it executable with the following command:

chmod +x script.sh

Now lets run the file with the 2>> error.log like this.

./script.sh 2>>error.log

You should see "everything is fine" appear in the terminal and "something went wrong" in the text file error.log

