# asim
A Stack Intensive Machine, A SImple Machine, Algorithm SIMulator

ASIM is a simple runtime environment that implements a stack based machine.  The runtime includes an embedded interpreter which uses reverse polish notation to put items on the stack and execute them.  
The thing is written in LuaJIT, which is compiled to a self contained executable.  The operator keywords, and program constructs derive from the Postscript language.  As such, referring to Postscript documentation (some listed at bottom of this README) will be helpful in understanding how the environment operates.

The base runtime does not include the graphics operators that are in the Postscript language, but
it includes most other operators, including the file operators.  There is a separate project (lj2ps)
which contains robust support for Postscript graphics, using blend2d as a graphics backend.

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

Soon enough you'll be able to feed it a complete program from a file, but
for now, the interactive mode is there.



Runtime Basics
==============
One of the core components of the runtime is the runtime stack.  The embedded scanner tokenizes your input, placing appropriate items on the stack for further processing.  when an executable operator is identified, it is executed immediately. The environment can be extended by creating new operators, procedures, and data structures.

You Read the [docs](https://github.com/Wiladams/asim/tree/master/docs) to get an idea of the runtime operators and how to use them to build
programs.


