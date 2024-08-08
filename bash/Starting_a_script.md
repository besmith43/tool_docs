# How to Start a Bash Script

To start a new script, open a file with or without the .sh file extension (Unix operating systems don't care about the extension but Windows does).
There are 2 main methods to start the script's contents.

### Method 1

```bash
#!/bin/bash
```

This is commonly referred to as a shebang.
What you're doing is providing a header of sorts to specify that you want the rest of the file's commands to be interpreted through the bash interpreter inside the /bin folder.

### Method 2

```bash
#!/usr/bin/env bash
```

This is doing the same thing, but it works by having the env binary determine where the bash interpreter is.
This is only necessary if there is a chance that bash won't be in the bin folder on every system that the script is going to run.
