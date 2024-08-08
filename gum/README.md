# Gum

[Gum](https://github.com/charmbracelet/gum) is one of the first tools that [charm.sh](https://charm.sh) made, but it's a great tool.
It's express goal is to "glamorize" the terminal with color and style.
To me, the most important thing is the features that it brings like menu's with multi-selection capabilities, easy to use confirmation dialogs, spinners, and a table render to name a few.
For the purposes of not reinventing the wheel, I highly suggest you look at their github page's readme for all the details, but I'll make some simple overviews of the features that I tend to reach for alot.


# Gum Choose

[Gum Choose](https://github.com/charmbracelet/gum?tab=readme-ov-file#choose) is a menu subcommand of gum.
It allows you to define a list of options, and determine if your menu has 1 selection or multiple, while giving you filtering options and vim down and up navigation with the j/k keys respectively.

```bash
	gum choose testfile{1..10}
```

![gum choose demo](/assets/gifs/gum_choose.gif)

# Gum Spinner

[Gum Spinner](https://github.com/charmbracelet/gum?tab=readme-ov-file#spin) is probably one of the most fun options that gum provides.
The way it works is that you call gum with the spin subcommand, and you'll pass into the subcommand an instruction to execute.
Then it produces a spinner while you wait.

```bash
	gum spin --spinner dot --title "Buying Bubble Gum..." -- sleep 5
```

![gum spinner example from github](https://camo.githubusercontent.com/e44f1e5489ed8eaa80d73bf1d294df8231f07d754aa455b1998ec8e58f1ecffa/68747470733a2f2f7668732e636861726d2e73682f7668732d3359467377436d6f59346f3351374d797a576c3673532e676966)

# Gum Log

[Gum Log](https://github.com/charmbracelet/gum?tab=readme-ov-file#log) simply put is fancy echo.
The options it gives you are all geared toward generating a formatted log message though.
Let's start by looking at a simple example:

```bash
	gum log -l error "the script failed"
```

![gum basic error message](/assets/images/gum_log_basic_error.png)

As you can see, by default, not alot is happening.
That's ok, but let's unlock some of the features.
Why don't we start with adding a timestamp to this log entry?

```bash
	gum log -l error -t datetime "the script failed"
```

![gum basic error message with timestamp](/assets/images/gum_log_basic_error_w_timestamp.png)

Now it's starting to get useful.
Right!?
The list of available time stamp options can be found [here](https://pkg.go.dev/time#pkg-constants)

Well let's make it even better by turning on structured logging and having it detail the script that's generated the log entry.

```bash
	gum log -l error -t datetime -s "the script failed" script example.sh
```

NOTE: the message has to be the first thing after the flags, and everything else will be interpreted as key/value pairs

![gum structured error message](/assets/images/gum_log_structured_error.png)


##### Other features

The log levels are detailed [here](https://github.com/charmbracelet/log?tab=readme-ov-file#levels), but at the time of writting, there are the following:

- None (default)
- Debug
- Info
- Warn
- Error
- Fatal

There is also a printf style formatting option:

```bash
	gum log -l error -t datetime -f "%s %s" ": script example.sh :" "the script failed"
```

![gum log formatted input](/assets/images/gum_log_formatted.png)

