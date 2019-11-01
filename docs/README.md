
What is asim?
=============
asim is a programming language inspired by the Postscript page description language.  Postscript 
itself was inspired by Forth, and Lisp like languages.  By modern standards it might be a bit
quirky.  asim is a stack based machine, and uses reverse polish notation when tokenizing.  The language and  runtime are meant to be easy to learn, and easy to implement by those who are relatively new to the challenges of creating language runtimes.

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

There is a distinction between the stack based runtime, and the language interpreter.  The runtime itself doesn't know much about language syntax.  It has a stack, and has data types, and will 
faithfully perform operations regardless of how those operators got on the stack.  The language 
is a convenience for being able to simply type some form of syntax that makes sense, and is coherent.  Other than being able to scan the core types and place them on the stack, the language
has features such as comments and a few special indicators.

Comments begin with the '%' character anywhere on a line, and continue to the end
of that line.  There is no provision for multi-line comments.

```Postscript
%!PS - This is a special comment found at the beginning of a program
% More comments may follow, and include any characters
% including the '%' symbol itself.  All that matters
1 2 add  % is that the comment goes to the end of the line
=
```
Some immediately useful operators
---------------------------------
In order to get some immediate gratification, being able to print out results is useful.
The '=' operator will pop a value off the Operand Stack and print it.

```Postscript
1 2 add
=
```

> 3

So, the "Hello, World!" of ASIM looks like:
```Postscript
(Hello, World!) =
```

[Data Types](https://github.com/Wiladams/asim/blob/master/docs/operator_index.md)
[Index of Operators](https://github.com/Wiladams/asim/blob/master/docs/operator_index.md)


Some useful reference material
===============================
A useful reference to the language
* [Thinking in Postscript](http://cholla.mmto.org/computers/postscript/tips.pdf)

The first few pages of the following summary are relevant
* [Mathematical Illustrations - Appendix 1](http://www.math.ubc.ca/~cass/graphics/manual/pdf/a1.pdf)

The explanation of execution model here is relevant
* [A First Guide to Postscript](http://www.tailrecursive.org/postscript/postscript.html)


