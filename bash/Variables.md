In bash variable assignment, spaces matter.

Will work
Var1="testing variables"

Will error out because bash expects Var2 to be a command
Var2 = "testing variables"

You can also store the output of commands into variables like so

Var3=$(ls)

This will store all of the file and folders in the current working directory into the variable Var3 as an array

Once we've created a variable, you'll need to call it by using the variable name with the $ in from of it like so

echo $Var3

