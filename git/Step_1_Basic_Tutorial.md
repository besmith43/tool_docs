# Basic Step by Step Tutorial


![git tutorial](/assets/gifs/git_tutorial.gif)


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

This command creates a .git folder in your root directory that stores all of this repo's data and configuration settings.

![git init](/assets/images/git_init.png)

4. Then make a file.  In git bash you can use "touch file1.txt" to create an empty file named file1.txt, and in powershell you can use "new-item file1.txt" to do the same thing.

```bash
	touch file1.txt
```

5. Let's take a look at the git repo as git sees it.  To do so, run the following git command:

```bash
	git status
```

The git status command displays the currently tracked and untracked files, as well as notes any files who's contents have changed since the last commit.  This is a very hand command to run.

![git status](/assets/images/git_status.png)

6. Now that you have an empty file run "git add -A" and git commit -m "initial commit" to tell git to track the file and commit the addition of the empty file to the repo.

```bash
	git add -A
	git commit -m "initial commit"
```

For git add, the -A flag stands for All, so we're telling git to add all untracked and any file changes to a new commit.  Then with git commit, the -m flag is setting the new commit we just started with the previous command to have a message of "initial commit".  This message can be anything that you'd like, but try to make it valuable.  Your future self will appreciate it.

![git add and commit](/assets/images/git_add_commit.png)

7. Run "git checkout -b feature-one" to create a new branch based on the current state of the master branch.  Here the -b flag is telling git to create a new branch called feature-one and check it out.

```bash
	git checkout -b feature-one
```

![git checkout](/assets/images/git_checkout_new_branch.png)

8. Let's add a new file to this feature-one branch and commit it.

```bash
	touch file2.txt
	git add -A
	git commit -m "adding second file to feature branch"
```

![adding new file to second branch](/assets/images/add_second_file_to_new_branch.png)

Let's take a break and check our mental model.

Our git repo is all of the files that exists inside a folder called "root".
We have 2 branches or you can think of them as trains of thoughts.
In the first branch, named "trunk", we have a single empty file named file1.txt.
In the other branch, named "feature-one", we have 2 empty files: file1.txt, and file2.txt.

The 2 branches can deviate as much or as little as is desired.
They are logical separators for histories of file diffs.
That's really all git version control is.

9. At this point, you can check which branch you're in by running "git branch -a".

```bash
	git branch -a
```

The -a flag tells git branch to list all known branches.
As this repo only exists on your computer, these 2 branches on the only ones that actually exist.
However, when working on a team with multiple developers, there are repos that exist on your computer, your coworkers' computers, and the git server.
They don't all have to be shared.

![git branch all](/assets/images/git_branch_all.png)

9. Now let's change back to the trunk branch with "git checkout trunk".

```bash
	git checkout trunk
```

If you look at your git repo's files now, you'll see that file2.txt is gone.
But where did it go!?
Remeber that file2.txt is a file that exists only in the feature-one branch.
The trunk branch doesn't know anything about it.

![git checkout trunk](/assets/images/git_checkout_trunk.png)

10. Let's merge the changes from the 'HEAD' of the branch 'feature-one' with the 'trunk' branch.

```bash
	git merge feature-one
```

Here a merge is taking the changes stored in a separate branch, and mixing them into the currently checked out branch.
In this case, the feature-one branch's changes are being merged into the trunk branch.
Merges can get very scary and the cause of alot of trainwrecks in software development.
Don't be afraid, but do be mindful.
A merge is trying to take the changes from one branch's change log and put it into another.
Collisions can happen when changes are made to the same file in both branches that differ in such a way that git can't safely figure out what to do.
In those cases, the merge fails, and git let's you handle what should be kept and what should be discarded.
Or if everything should be kept.
We won't talk about dealing with these merge conflicts here, because there are entire books written about the subject.

![git merge](/assets/images/git_merge.png)

11. Now comes some fun with a little known feature of git called worktrees.  Run the following:

```bash
	git worktree add ../feature-one
```

This will create a folder with the feature-one branch in the parent directory like this.


Git Worktrees are great if you want to maintain 2 or more branches of a given git repo in your filesystem at the same time.
This can be really useful when you have a website that has a Dev, Test and Prod branch, and any changes are automatically deployed when commits are made to specific branches.
This way, you can be working on a new feature in the development branch, and shift to the production branch when a bug is discovered without having to stash your development branch changes.
Git stash is outside the scope of this tutorial but simply, it's a way to save changes for later when you need to leave a branch, but don't want to loose all of your changes that aren't quite ready to be committed to the git repo.

![git worktree](/assets/images/git_worktree.png)

12. You've successfully created a git repo, made changes to it, committed those changes, created a new branch, and fixed a merge conflict.  The only thing you're missing is pushing and pulling those changes alongside the team from the remote git server.  You can do this to your hearts content to get better at working with git and understanding some of the edge cases that you may run into.

