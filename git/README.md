# Git

Git is a version control system.  Here I'll have a brief overview of how to use it, and discuss my mental model for understanding it.

There are a few basic subcommands in the git binary: add, commit, push, pull, clone, status, and checkout.

git add:  this will almost always be run with the -A flag as that will select any changed or untracked files to be added to the next commit.  This is a staging command, so if you want to be selective on what is commit, you can spell out which files get added to the next commit.

git commit: this is how you set the message as a description of the change that you made to the file(s).  You can run it with a -m "message" where message is more useful text, or you can run it without a flag to have a command line editor like nano or vim to type your message into.

git push: this will sync all of your commits to the server for the current branch.

git pull: this will pull any changes to the current branch that have been added to the server onto your local computer.

git status: this will output what files and folders have been changed since the last commit, as well as detail if there are any untracked files and folders.

git clone: this will clone the current state of a repository onto your computer at the current directory location.

git checkout: this is how you'll swap between branches.  Branches are the best way to development a feature in isolation, and to maintain particular tracks.  For example with a website's git repo, we may have 3 main branches: Development, Test, and Prod.  Each one of these is designed to be a representation of the code on each of the 3 servers.

git branch: this is how you'll look at the available branches or check which branch you currently have checked out (aka are using).
