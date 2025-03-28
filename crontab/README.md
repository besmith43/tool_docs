# Cron

Cron is a job runner that is usually available on unix systems.
Simply put, it will run scripts or commands on a timed interval or at system start/reboot.


### Example

Let's say that we need to run a script every day at 9:00AM.
We'll start by running the following to open the current crontab file in our default text editor:

```bash
    crontab -e
```

Now on an empty line, we'll need to add the following text:

```
* 9 * * * /path/to/script.sh
```

Finally save the file and close the editor.
Now you have setup cron to run that script everyday at 9:00AM.
Let's check the contents of the crontab file.

```bash
    crontab -l
```

But where did that asterisk ridden thing come from?
Well, asterisk, *, is a wildcard that stands for anything.
The order of them is Minute, Hour, Day, Month, Day of the Week.
So for example, if we need to run a script every 5 minutes but only on Saturdays, you'd use something like this:

```
*/5 * * * 6 /path/to/script.sh
```

### References

[Crontab Guru](https://crontab.guru/)
