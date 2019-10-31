# asim
A Stack Intensive Machine

A SImple Machine

ASIM is a simple runtime environment that implements a stack based machine.  The runtime includes an embedded interpreter which uses reverse polish notation to put items on the stack and execute them.  The operator keywords, and program constructs derive from the Postscript language.  As such, referring to Postscript documentation will be helpful in understanding how the environment operates.
The base runtime does not include the graphics operators that are in the Postscript language, but
it includes most other operators, including the file operators.

Getting Started
===============
At present, the /build directory contains a binary for Windows (asim.exe).  Download this
and put it somewhere accessbile from the command line.

To execute, simply call asim and you'll see a prompt

```
asim
==>
```

From there, you can start trying out simple commands.


```Postscript
==> 1 2 add ==
3
```

In the very near future, you'll be able to feed it a complete program from a file, but
for now, the interactive mode is there.

The environment can be extended by creating new operators, procedures, and datatypes.

One of the core components of the runtime is the runtime stack.  The embedded scanner tokenizes your input, placing appropriate items on the stack for further processing.  when an executable operator is identified, it is executed immediately.

The following is a list of the built in operators, grouped the types they affect.

Primary Stack Operators
---------------
* clear   - clear the entire stack
* dup     - duplicate the value on the top of the stack
* exch    - exchange the two values on the top of the stack
* pop     - remove the value that is at the top of the stack
* push    - put a value onto the top of the stack
* roll    - rotate values within the stack
* top     - return value at the top of the stack without removing it

More Stack Operators
--------------------

* cleartomark   - clear entries in the stack up to a mark
* count         - count how many entries are on the stack
* counttomark   - count up to a mark on the stack
* copy          - copy a specified number of entries on the stack
* mark          - place a mark on the stack

Even More Stack Operators
--------------
* stack         - print the current stack (non-destructive)
* pstack        - print the current stack (non-destructive)
* =             - pop top stack item and print
* ==            - pop top stack item and print

Math Operators
--------------
* abs
* add
* atan
* ceiling
* cos
* div
* exp
* floor
* idiv
* ln
* log
* mul
* mod
* max
* min
* neg
* rand
* round
* rrand
* sin
* sqrt
* srand
* sub
* truncate

Boolean Operators
-----------------
* eq            - compare top two items on stack and place bool value on top of stack
* ne            - compare top two items on stack
* gt            - compare top two items on stack
* ge            - compare top two items on stack
* lt            - compare top two items on stack
* le            - compare top two items on stack

Boolean and bitwise Operators
-----------------------------
* and
* or
* not
* xor
* bitshift

Control Operators
-----------------
* if
* ifelse
* for
* repeat
* loop
* forall
* exit
* stopped

Data Conversion Operators
-------------------------
* cvx
* cvi
* cvr
* cvn
* cvs
* cvrs





References
==========
The first few pages of the following summary are relevant
* http://www.math.ubc.ca/~cass/graphics/manual/pdf/a1.pdf

The explanation of execution model here is relevant
* http://www.tailrecursive.org/postscript/postscript.html

