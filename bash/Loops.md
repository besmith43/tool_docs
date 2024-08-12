# Loops

Bash has many of the same loop-logic options that you'd expect in a language like while loops, for loops, foreach loops, and switch statements.


### While Loops

```bash
i=0

while [ $i -le 2 ]
do
  echo Number: $i
  ((i++))
done
```

Here we're checking if $i is less than or equal to 2 at the start of each loop.
Then writing the string "Number: $i" where $i is the current value of $i and incremented $i by one inside of each loop.
Do and Done are keywords to signify the beginning and end of each loop much like then and fi did for the if / else block.


### For Loops

Here is a C style for loop in bash

```bash
n=7

for (( i=1 ; i<=$n ; i++ )); 
do
    echo $i
done
```

However most of the time, you'll want to use the foreach.

```bash
i=$(ls)

for item in $i;
do
	echo $i
done
```

Let's briefly talk about ranges.
You can do a simple number range like this:

```bash
{1..5}
```

This range will go from 1 to 5 by increments of 1.

However you can do ranges and specify the increment amount like so:

```bash
{1..5..2}
```

Where the first number is where to start, the second number is where to end, and the third number is by how much you'll increment between each iteration.

Switch Statements

Here is a switch statement in Bash.
Note that it has a "normal" form, but has some unique syntax.

```bash
case EXPRESSION in

  PATTERN_1)
    STATEMENTS
    ;;

  PATTERN_2)
    STATEMENTS
    ;;

  PATTERN_N)
    STATEMENTS
    ;;

  *)
    STATEMENTS
    ;;
esac
```

The Expression is the variable to be evaluated.
Each pattern's code block is ended by 2 semicolons.
The default case is a wildcard *, and the switch statement is ended by easc.
Just like if, it's closed by the inverse of the starting keyword.


References

[Bash Case Statement | Linuxize](https://linuxize.com/post/bash-case-statement/)
[Bash while Loop | Linuxize](https://linuxize.com/post/bash-while-loop/)
[Bash For Loop | Linuxize](https://linuxize.com/post/bash-for-loop/)

