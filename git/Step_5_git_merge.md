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

This is where branches can become difficult to manage.
When you merge a branch with another branch, you are injecting the diffs from the source branch into the destination branch.
Sometimes this can be done simply by a "fast-forward" operation.
In this case, there are no conflicts between the changes in the source branch's history and the destination branch.
Fast-forward merges are the easiest as it just layers the changes ontop of the destination branch's current history.
Let's take a look at what they looks like.

![git fast forward merge tree diagram](/assets/images/git_fast_forward_merge_tree.png)


Other times, there are changes to the original 

