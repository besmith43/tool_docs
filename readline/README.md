# Readline

Readline is a terminal program built into shell environments to give us additional options for navigating and manipulating the terminal.
For Example, we can jump forward a word with alt+f, or back a word with alt+b.
We can swap the current word with the one before it with alt+t.
These and many more features like them can make working in the terminal much quicker and more effiecent.
However, like with any new thing, you need to take things slow and work in a shortcut or 2 at a time, and use it until it becomes second nature.
Then start adopting a new shortcut or 2.
This way you won't be overwhelmed.



### Common Shortcuts


Alt-f - forward word

Alt-b - back word

Alt-t - swap words

Ctrl-f - forward char

Ctrl-b - back char

Ctrl-t - swap char

Ctrl-w - delete one word back

Ctrl-u - delete entire line to right

Ctrl-r - reverse search


See [here](https://gist.github.com/2KAbhishek/9c6d607e160b0439a186d4fbd1bd81df) for a full listing

### Example

This example is making use of alt+b (to jump back a word), alt+t (to swap the current word with word behind it), ctrl+a (to jump to the start of the line), and ctrl+u (to delete all the text to the right of the cursor)

![example of readline](/assets/gifs/readline.gif)

##### Note for MacOS users

Also remember that the alt key does weird stuff, so you’ll need to modify the behavior in iTerm2

go to settings -> Profile -> Keys -> General

set to this
left option key: Esc+
right option key: Esc+ (if you want both option buttons to behave the same)


https://stackoverflow.com/questions/18923765/bash-keyboard-shortcuts-in-iterm-like-altd-and-altf


