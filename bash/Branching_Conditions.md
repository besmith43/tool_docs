# Branching in Bash

If / else blocks in bash are pretty simple but also different than most languages.
Let's look at an example where we check if a folder exists

```bash
if [ -d ~/Documents ]; then
	# do something if true
else
	# do something if false
fi
```

The -d is a check for if a directory exists.
The hashtag (#) is the start of a single line comment

We can expand on the previous example to perform multiple checks with elif.

```bash
if [ -d ~/Documents ]; then
	# do something if the documents folder exists
elif [  -f ~/Desktop ]; then
	# do something if desktop folder exists but the documents folder doesn't
else
	# do something if false
fi
```
