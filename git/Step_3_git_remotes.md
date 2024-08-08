# Git Remotes

Git remotes are the git servers that you push your code to.
This could be GitHub, GitLab, a self-hosted Gitea instance, or any other git compatible server.
It could also be a separate directory on your same computer!
The important thing is that it's not your local working git repo.
At this remote resource, we push our commited changes, and our fellow colaborators can pull down those changes and vice versa.
This is where git goes from being single source version control to a full distributed version control system.
Git allows you to have multiple remotes, but for the purposes of this reference guide, we're not going to discuss that particular setup.


### Remote URL

The remote url is the link, or network name, that the repo is addressable at.
Let's use this repo's origin as an example:

```
	git@github.com:besmith43/tool_docs.git
```

There are a couple of parts to this url.
Starting with the reference to git at the front of the url.
This git@ means that the remote url is being accessed through the ssh protocol, and git servers normally default to accepting all interactions with git repos through the git user account.
This isn't a security issue, and it doesn't mean that someone can impersonate you as git determines who it's talking to by your ssh keys.
As long as you are the only one who has a copy and/or control of your private ssh key file, no one can interact with a git server as if they're you.
This ssh key file is the one that doesn't end in .pub (for public).
The next section of the remote url is the github.com.
This signifies exactly what you think it does.
I'm using Github.com to host this repo.
If you're using gitlab, it would be gitlab.com, or if you're self-hosting in some way, it would be the publically addressable domain name that you'd use to access it in the web browser.
After the colon, :, we see my username, besmith43.
This is the hosted user account that owns the repo.
It can be a user or group.
Then a slash separates the owner from the name of the repo ending with .git.

There is a separate way that this could work.
Instead of using the ssh protocol, it could be accessed via the http protocol.
In that case, the remote url would look like this:

```
	https://github.com/besmith43/tool_docs.git
```

Here is it mostly the same, but you'll notice that we're starting with the https:// protocol and the rest looks like a completely normal web url that you'd see in the browser.
That's because it is.
It also handles authentication in a similar fashion.
Git will ask you to authenticate in order to ask, and the nature of what that authentication will look like will be different for each platform and installation method.
That is to say if you're on Windows and using git for windows, it'll bring up a small gui, Graphical User Interface, for your to put your username and password into.
If you're on a unix operating system, it'll ask you with prompts on the command line.
If you're using git through some graphical tool or ide, like Visual Studio Code, the tool will have it's own way of handling the prompting of credentials.

So now that we know what a remote url is and what it looks like, let's take a look at several ways that we'll create it within our repositories.

### Git Clone

Let's start with the easiest situation: git clone.
Whenever you clone a repo, the remote origin is set for you.
The reason for this is that the remote is actually the starting point.

### Git Remote Add

With creating a git repo from scratch on our computer, we'll have to give our repo the remote url.
Which means that we'll have to figure out how to generate it too.
But how do we pass in to our git config?
We'll use git remote add like so:

```bash
	git remote add origin git@github.com:besmith43/example_repo.git
```

In this example, we're calling git's remote subcomand, and using the subcommand of it, add, to set the friendly name, or alias, of our remote url.
The standard practice is to use origin, but technically you can name it whatever you like.
After we've set this, we'll need to tell push some extra information the first time.
The extra info is the url that we'd like to push to.
It can be the friendly name that we set with the git remote add, or the url in full.
From then on out, we'll only have to use the normal 'git push' to commit our changes to the remote server.

```bash
	git push origin
	# or
	git push git@github.com:besmith43/example_repo.git
```

Now these commands are implying a flag.
The --set-upstream flag to be specific.

```bash
	git push --set-upstream origin
	# or
	git push --set-upstream git@github.com:besmith43/example_repo.git
```

What is this upstream?
Its git lingo for pairing our local git repo to the remote git repo, but it does give a hint to how the underlying technology works and some of the options it can give us.
We can have multiple upstreams, or upstream repos for our upstreams.
Simply put, local to remote git repo pairing isn't a one to one exclusive operation.
If you have a need for it, it can be chained one to one relationships or one to many relationships, but not many to many.
There have to be limits after all.

### Git Docs

[git remote docs](https://git-scm.com/docs/git-remote)
[git push docs](https://git-scm.com/docs/git-push)
[git pull docs](https://git-scm.com/docs/git-pull)
[git clone docs](https://git-scm.com/docs/git-clone)
