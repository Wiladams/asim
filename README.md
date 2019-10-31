# asim
A Stack Intensive Machine

A SImple Machine

ASIM is a simple runtime environment that implements a stack based machine.  The runtime includes an embedded interpreter which uses reverse polish notation to put items on the stack and execute them.  The operator keywords, and program constructs derive from the Postscript language.  As such, referring to Postscript documentation will be helpful in understanding how the environment operates.
The base runtime does not include the graphics operators that are in the Postscript language, but
it includes most other operators, including the file operators.

What does it look like?

```Postscript
> 1 2 add ==
3
```

The environment can be extended by creating new operators, procedures, and datatypes.  The built in operators are grouped by the types they affect

One of the core components of the runtime is the runtime stack.  The embedded scanner tokenizes your input, placing appropriate items on the stack for further processing.  when an executable operator is identified, it is executed immediately.

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

* cleartomark
* count
* counttomark
* copy
* mark

Even More Stack Operators
--------------
* stack
* pstack
* =
* ==

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
* eq
* ne
* gt
* ge
* lt
* le

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
http://www.math.ubc.ca/~cass/graphics/manual/pdf/a1.pdf

http://www.tailrecursive.org/postscript/postscript.html

