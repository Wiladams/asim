# ASIM
A Stack Intensive Machine, A SImple Machine, Algorithm SIMulator
= =     =         =

ASIM is a simple runtime environment that implements a stack based machine.  The runtime includes an embedded interpreter which uses reverse polish notation to put items on the stack and execute them.  
The thing is written in LuaJIT, which is compiled to a self contained executable.  The operator keywords, and program constructs derive from the Postscript language.  As such, referring to Postscript documentation will be helpful in understanding how the environment operates.

The base runtime does not include the graphics operators that are in the Postscript language, but
it includes most other operators, including the file operators.  The [lj2ps](https://github.com/Wiladams/lj2ps) contains robust support for Postscript graphics, using blend2d as a vector graphics backend.

Getting Started
===============
At present, the /build directory contains a binary for Windows [asim.exe](https://github.com/Wiladams/asim/blob/master/build/asim.exe).  Download this
and put it somewhere accessbile from the command line.  There are no other dependencies or libraries, startup files and the like to be concerned with.

Building your own
-----------------
You can build this yourself, assuming you 
have an instance of luajit already on your machine.  The build directory has a 'msvcbuild.bat' file.
Simply call this from the command line and you'll be left with your own copy of asm.exe.  The included lua51.lib is built for 64-bit applications, so if you want 32-bit, simply replace this with
a 32-bit version and you're good to go.

Execute your first program
--------------------------
To execute, simply call asim.exe and you'll see a prompt

```
asim
==>
```

From there, you can start trying out simple commands.


```Postscript
==> 1 2 add ==
3
```


Exiting the runtime
-------------------
Ctl-C a couple of times, and you're back to the Windows command prompt

Running a program in a file
---------------------------
Typing single lines of code interactively in the interpreter can bring only
so much joy to your life.  Things are much more fun when you can write more
extensive multi-line programs.

From the interactive prompt, you can execute code from a file using the 'run' 
operator.  So, if you typed the following into a file (ex1.ap):

```Postscript
%!PS
% usage: 
%   asim 
%   ==> (ex1.ap) run
%
1 2 add
pstack
3 mul
sqrt
==
```

You could then run it with:
```Postscript
==> (ex1.ap) run
```

Never mind what this particular program does, this is the general way to execute
programs that are inside files.  The name of the file does not matter.  There is 
no meaning to the '.ap' extension, I just felt like having some extension.




Documentation
=============

You can read the [docs](https://github.com/Wiladams/asim/tree/master/docs) to get an idea of the runtime operators and how to use them to build programs.

Note
====

Postscript is a registered trademark of Adobe Systems Incorporated.  The copyright to the Postscript language is also held by Adobe Systems Incorporated.  This site is not relate to, supported by, or in any way condoned by Adobe in any way.

<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a>.
