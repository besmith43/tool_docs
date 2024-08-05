Lets talk about how that works with examples that you can follow.

1. Open a powershell or unix like shell in an application (for example: MobaXTerm, Git Bash, or WSL2) and create a folder somewhere of your choicing.

2. Cd into that folder and make another folder called root.

```bash
	mkdir root
```

3. Cd into the root folder and run "git init"

```bash
	cd root
	git init
```

4. Then make a file.  In git bash you can use "touch file1.txt" to create an empty file named file1.txt, and in powershell you can use "new-item file1.txt" to do the same thing.

```bash
	touch file1.txt
```

5. Let's take a look at the git repo as git sees it.  To do so, run the following git command:

```bash
	git status
```

The git status command displays the currently tracked and untracked files, as well as notes any files who's contents have changed since the last commit.  This is a very hand command to run.

6. Now that you have an empty file run "git add -A" and git commit -m "initial commit" to tell git to track the file and commit the addition of the empty file to the repo.

```bash
	git add -A
	git commit -m "initial commit"
```

7. Run "git checkout -b feature-one" to create a new branch based on the current state of the master branch.  Here the -b flag is telling git to create a new branch called feature-one and check it out.

```bash
	git init
```

8. At this point, you can check which branch you're in by running "git branch -a".

```bash
	git init
```

9. Now change back to the master branch with "git checkout master".

```bash
	git init
```

10. Now comes some fun with a little known feature of git called worktrees.  Run the following:

```bash
	git worktree add ../feature-one
```

This will create a folder with the feature-one branch in the parent directory like this.

11. Edit the file1.txt in the root folder and commit the changes.

12. Now compare file1.txt in the root branch to the file1.txt in the feature-one branch, they're different.  The file1.txt in the feature-one branch should be empty still.

13. So go ahead and edit the file1.txt in the feature-one branch with a different message.  Then add and commit the change. (Note: you'll need to cd over to the feature-one folder to add and commit the changes).

14. Go back to the root folder and lets merge the changes made in feature-one to master by running "git merge feature-one".  You'll get this output because there's a merge conflict.

15. Basically Git is telling us that we have a line in the same file that is different between the 2 versions of the file and we need to intervene to pick which change is correct.  So lets look at what the differences are with "git diff"

16. Now we can fix it by editing the contents of file1.txt and adding and committing the changes we made, because since the merge failed, git added these extra lines around the problem spots.

17. You've successfully created a git repo, made changes to it, committed those changes, created a new branch, and fixed a merge conflict.  The only thing you're missing is pushing and pulling those changes alongside the team from the remote git server.  You can do this to your hearts content to get better at working with git and understanding some of the edge cases that you may run into.

