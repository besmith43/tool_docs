# VHS

[VHS](https://github.com/charmbracelet/vhs) is a fantastic tool that I've been using all throughout this repo to generate the gifs that you see.
Simply put, we put instructions into .tape files, and feed them to vhs.
It then "plays" the tape, and in a sub shell walks through each step of the instructions.
All the while, ffmpeg is recording this subshell.
Once it's out of instructions, the subshell is closed, and the resulting video stream is converted to a gif.

I have all of the tapes used for the demos in the assets/tapes directory in this repo.
However, let's take a look at some of the commands to use them.

```bash
	vhs new demo.tape
```

This command will generate a new tape file with helpful info regarding what options you have available to you, and how to make use of them.
Read it carefully.
Then edit it with the steps that you'd like it to do.
Keep in mind that this is only useful to capture text based interactions with a shell environment like bash.
If you want to screen capture and automate the usage of a graphical application, vhs is not the tool for you.


But now that we have our tape file, we need to run it.
Fortunately that's really simple.

```bash
	vhs demo.tape
```

It'll output to your shell's standard output the instructions that it's executing as it's doing it, so you can keep track of where it is in the process.


Finally if you want to do the actions, it can record to tape whatever you do in a shell like this.

```bash
	vhs record > demo.tape
```

