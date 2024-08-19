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

We can also list out the git history with the git log command.

```bash
	git log
```

As you can see when you run it, there are additional metadata such as a hash that acts as a check sum for the commit, and a timestamp.

