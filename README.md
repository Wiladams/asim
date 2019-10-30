# asim
A Stack Intensive Machine
A SImple Machine

ASIM is an execution environment.  The execution environment is a stack based machine, which is typically driven by a realtime interpreter.  The operator keywords, and program constructs derive from the Postscript language.  As such, referring to Postscript documentation will be helpful in understanding how the environment operates.

What does it look like?

```Postscript
> 1 2 add ==
3
```

The environment can be extended by creating new operators, procedures, and datatypes.  The built in operators are grouped by the types they affect

One of the core components of the runtime is the runtime stack.  When you type a number, followed by
a <space> the number is placed on the runtime stack.  In fact, all values you type are first placed on 
the stack before the interpreter does anything with them.

Stack Operators
---------------
    * clear   - clear the entire stack
    * dup     - duplicate the value on the top of the stack
    * exch    - exchange the two values on the top of the stack
    * pop     - remove the value that is at the top of the stack
    * push    - put a value onto the top of the stack
    * roll    - rotate values within the stack
    * top     - return value at the top of the stack without removing it


A byproduct of the lj2ps (Postscript interpreter using LuaJIT and blend2d) project, this is the standalone interpreter without the graphics operators.
