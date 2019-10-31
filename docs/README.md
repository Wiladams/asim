
What is asim?
=============
asim is a programming language inspired by the Postscript page description language.  Postscript 
itself was inspired by Forth, and Lisp like languages.  By modern standards it might be a bit
quirky.  asim uses uses a stack based machine, and reverse polish notation.  The language and 
runtime are meant to be easy to learn, and easy to implement by those who are relatively new 
to the challenges of creating language runtimes.

At the core of the runtime is the so called "Operand Stack".  Operands are nothing more than the
arguments your would feed to a function.  An "Operator" can be thought of simply as a function.
Operators get values from the stack, and perform whatever algorithm they execute, returning any 
values to the stack.  The Operand Stack is THE mechanism for passing values between functions.

There are a number of built in operators (functions).  Some of them operate against the stack
itself, but most perform some function with values that are on the stack.

Here is a typical example:

```Postscript
==> 1 2 add
```

This will first put the numeric value 1 on the stack, then the numeric value 2.  Then the 'add'
operator name will be found, and the associated function will be called.  The 'add' function will 
take two operands off the stack (2, 1), and add them together, putting the result back on the stack
(3).

[Index of Operators](https://github.com/Wiladams/asim/blob/master/docs/operator_index.md)


Some useful reference material
===============================
The first few pages of the following summary are relevant
* [Mathematical Illustrations - Appendix 1](http://www.math.ubc.ca/~cass/graphics/manual/pdf/a1.pdf)

The explanation of execution model here is relevant
* [A First Guide to Postscript](http://www.tailrecursive.org/postscript/postscript.html)


