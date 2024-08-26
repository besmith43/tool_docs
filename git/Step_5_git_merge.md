# Managing the Tree

Git merge and its sibling commands are probably some of the most important commands after the basics to learn and be familar with.
This is where git's branching and commit histories become stumbling blocks for people, and understandably so.
When we work merge history, we're basically becoming time wizards, and the actions we take to perform this magic can quickly create unintended results.

### Commit History

Let's start by looking at what happens when we make a commit.
First, the diff of the changes of the file(s) that we've selected for the current commit are saved.
When we talk about diffs, we're dicussing the "+this line", "-that line" of text that you see when you look at commits in the web browser.
Very similar to this:

```diff
this is the content of a text file

+ this is an updated line within that text file
- this is what the line used to be

...
```

There is a separate diff per file, and all of these diffs get saved until the singular heading of your commit.
The message you give the commit, your name, and email are most of the metadata that gets saved along side these diffs into the git history.
Before pushing these commits to a remote repo, you can check out their contents with the diff subcommand.

```bash
	git diff
```

Keep in mind that the git diff subcommand will only show you the changes that have occurred on any git tracked file since the last commit.
If you create a new file or have freshly created a commit, it will show nothing.

We can also list out the git history with the git log command.

```bash
	git log
```

As you can see when you run it, there are additional metadata such as a hash that acts as a check sum for the commit, and a timestamp.


### Branches

Now that we have a better understanding of commit histories, and how we're tracking changes with git.
Let's look at Branches.
Simply put, branches are isolated commit logs with shared history at the point that they branched from.
So just like a real tree, you can have many branches from the same trunk and they all diverge at different points or in different ways.
Git Branches do that too.

Why do we want branches?
Branches can be used to develop a feature inside a codebase without effecting anyone else or being effected by anyone else's changes.
This branching style allows you to maintain a clean history that partains exclusively to the feature being developed without holding up anyone else.
Branches can also be used to maintain completely different codebases within the same git repository.
The limits are whatever you set, and they're use cases can be whatever makes sense to the task at hand.


### Merge

This is where branch management comes into play.
When you merge a branch with another branch, you are injecting the diffs from the source branch into the destination branch.
Sometimes this can be done simply by a "fast-forward" operation.
In this case, there are no conflicts between the changes in the source branch's history and the destination branch.
Fast-forward merges are the easiest as it just layers the source branch's changes ontop of the destination branch's current history.
Let's take a look at what they looks like.

![git fast forward merge tree diagram](/assets/images/git_fast_forward_merge_tree.png)

NOTE: you can make changes to the main branch and still fast-forward merge with a different branch.

Other times, there are changes being brought to the destination branch are summed into a commit message.
This most often happens when there is a merge conflict.
Merge conflicts occur when a change is made to the same section of a file's contents in each branch.
However the changes made are different between the 2 branches.
Thus when we try to merge them, we get a conflict that needs to be solved manually.
Let's take a look at what such a merge conflict looks like at the commit history level.

![git merge conflict tree diagram](/assets/images/git_merge_conflict_tree.png)

So as you can see in the way the commit history changes, we're not simply duplicating the source branch's commits into the distination branch's commit history like with the fast-forward, but instead we're having to create an entirely new commit.
This doesn't mean that anytime there is a different commit history, you'll have a merge conflict.
This only happens when there are changes to the same thing in commits on both branches that are different.

For example by looking only at the current contents of each branch, which of the following do you think with have a merge conflict?

1. merging branch A with branch B

run.sh from branch A
```bash
#!/bin/bash

echo hello world
```

run.sh from branch B
```bash
#!/bin/bash

echo hello Bob
```

2. merging branch C with branch D

run.sh from branch C
```bash
#!/bin/bash

echo hello world
```

test.sh from branch D
```bash
#!/bin/bash

python3 test.py
```

For those of you that said option 1, you're correct, but let's break down why.
Branch A has a single file called run.sh.
It's contents will print "hello world" to the screen.
Branch B has a file with the same name, but will print "hello Bob" to the console screen.
If these 2 branches get merged, git will attempt to apply the diffs and see a conflict in that world and Bob are not the same thing.
This git will produce edits in your current branch (the destination branch) with both lines and expect you to manually decide what you want in the file, save, and commit those changes.
But what does this merge conflicted state look like in the file itself?
Let's take a look.

run.sh
```
#!/bin/bash

<<<<<<< HEAD
echo hello world
=======
echo hello Bob
>>>>>>> new_feature

```

In this example, we're merging branch A with branch B.
Head indicates what branch A's version of the file has.
After the line of ='s, it's showing what is in branch B's version of the file.
You'll need to clean up the file into the version that you want it to be, then run the usual ```git add -A``` and ```git commit -m "$message"``` to complete the merge.


### Squash

Now that we have fast-forward and merge conflict under our belts, let's look at one more common merge technique: Merge Squash.
Squashing is the idea of taking all the commit history of a branch that's being merged as a single condensed commit.
So let's say that you're working in a feature branch for the last month.
Your new feature is done and you're ready to merge it into the main development branch for others to test, but you have alot of commits in this branch that doesn't need to be in the commit history outside of your feature branch.
With squash, you can effectively all of those changes throughout time, and make a single diff between the start of the branch and the current state of the branch without all of the intermediate steps.
This can be useful if you had to go down a number of paths that failed to work out.
Some teams do this as a standard practice to keep the main branch's commit history as lean as possible with the changes that are getting pushed into later stages of the development pipeline.
Unlike the previous 2 operations which git decides for you (to an extent) when you perform a merge operation, with a squash operation, you have to specify that you'd like to perform a squash when you call git merge.
It can be done like this:

```bash
	git merge --squash new_feature
```

### BONUS ROUND: CHERRY PICKING FILES FROM OTHER BRANCHES

So git has the ability to allow you to pluck a file from another branch and import it's current state into your current branch.
This can be done with the checkout subcommand.
Hop to the branch that you want to put the file or pattern, as it does handle wildcards, with the following:

```bash
	git checkout dest_branch
```

Then checkout the from the source branch the file or pattern that you want like so:

```bash
	git checkout src_branch file
```

or with a pattern:

```bash
	git checkout src_branch src/*
```

### References

[git merge docs](https://git-scm.com/docs/git-merge)
[git cherry picking](https://www.30secondsofcode.org/git/s/copy-file-from-branch/)
