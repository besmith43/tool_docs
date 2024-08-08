# Freeze

[Freeze](https://github.com/charmbracelet/freeze) is a snapshot creation tool to make a photo out of code files or commands given to be run.
Let's look at the 2 simple ways to use this tool.

### Freezing a code file

```bash
	freeze script.sh --show-line-numbers -o photo.png
```

![freeze demo with line numbers](/assets/images/freeze_example.png)

Here we're giving freeze a bash script called "script.sh".
Then telling freeze to output the result in a picture file called "photo.png" with the -o flag.
This file will have syntacs highlighting and can show line numbers.

We can also specify the lines we want it to screenshot.
This can be done to show only a function or a codeblock.

```bash
	freeze script.sh --lines 5,10 --show-line-numbers -o photo.png
```

![freeze demo lines 5 to 10](/assets/images/freeze_example2.png)

### Asking Freeze to take a photo of a command

Freeze can also run a program and take a photo of the resulting output.

```bash
	freeze --execute "ls -al" -o freeze_ls_example.png
```

![freeze execute demo](/assets/images/freeze_ls_example.png)


