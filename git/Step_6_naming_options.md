# Naming Options within Git

Let's take a beat to discuss naming, but more importantly, renaming options in git, and where they're hidden in the git subcommands.

### Git Clone

One of the most common options to rename something is within the git clone command.
the normal layout for that command looks like this:

```bash
	git clone $URI
```

However, let's say that you don't like the name of the project on github or want to add a suffix to the repo name.
What options do you have?
Well, remember that the hidden ```.git``` folder inside your repo contains all of the tracked state.
The parent directory doesn't matter.
So if you wanted to, you could do the clone and then rename the parent directory with the mv command like so:

```bash
	mv original_dir_name new_dir_name
```

But let's say that you have a naming conflict that is keeping you from cloning the repo in the first place.
Do you want to go somewhere else in your file system, do the clone, and then move it to the desired location with a new name?
That's an option, but git clone has you covered.
Just append a new name to the end of the git clone command and it'll overwrite the default value for the parent directory name with the name you gave it.
Just like this:

```bash
	git clone $URI $newName
```

NOTE: in these examples, I've been using bash variables, but in practice, you'd most likely be typing out the values.

### Forks

From my understand forks are a feature of git that's defined and implemented by the major webservices like Github and Gitlab, and isn't really available in the git cli.
I say that it's not really available because you can create an additional remote, and that can technically be viewed as a fork of the repo.
However, both platforms mentioned give you the opportunity to rename a repo when you fork it.

### Branchs

While you can rename a branch, it's not something locally on your machine.
That rename becomes part of the repo's history and will be migrated as you push and pull changes across the repos.
However, you can spin off a new branch from the branch in question and give it whatever name you'd like.
Then keep track of the state of the "public" branch with frequent merges.
Remember, branches are private by default, and only get pushed up to a remote repo by you.
So if you want to keep a branch private, simply never push it to the remote repo.

