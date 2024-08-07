# Link

Link, or ln, is a command line tool that allows you to create links.
Simply put, links are filesystem pointers, and they come in 2 made varieties: hard and symbolic (sometimes referred to as soft).

Hard links are links that point to the same starting block of data on the physical disk.
These kinds of links are identical references to the same data blocks as the original file.
The downside of hard links is that you don't know from looking at them that they're links at all because for all practical purposes they aren't.
However you can run into issues when the contents of a file get changed and you forgot that it was a hard link.

```bash
	ln /usr/lib/something/bin/something /usr/bin/something
```

![hard link demo](/assets/gifs/hard_link.gif)

Symbolic links are references to other file in the filesystem.
This is something you'll see all over Unix operating systems by creating a link from a script into the /usr/bin directory, or by having a directory with a version number in it symbolically linked to a new directory name without the version number.
That last example is specially useful as you can have your path or an alias reference the "happy path" and when a new version comes out, update the symbolic link to the new version's directory.

```bash
	ln -s /usr/lib/something/bin/something /usr/bin/something
```

NOTE: The only difference between these 2 examples is the -s flag.
By default, ln creates hard links.

![symbolic link demo](/assets/gifs/symbolic_link.gif)


