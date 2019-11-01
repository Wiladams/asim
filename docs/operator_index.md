The following is a list of the built in operators, grouped the types.
Operators are functions, or commands, that pull their arguments off the 
Operand Stack, perform a function, and optionally put some results back
on the stack.  The terse form of documentation for each operator shows 
what was on the stack before the operator, and what is left on the stack
after the operator is executed.

For the 'Left on stack' column, if there is nothing added to the stack,
it is indicated with a singular '-' symbol.  Similarly, if no arguments
are popped off the stack, the 'Arguments' will be represented by a single
'-' symbol.

Operand Stack Manipulation Operators
---------------
Arguments               Command     Left on stack, side effects<br/>
    any(1) ... any(n)   clear       -<br/>
                    a   dup         a a<br/>
                  a b   exch        b a<br/>
                  any   pop         - <br/>
any(n-1)...any(0) n j   roll        any(j-1) modn ... any0 any(n-1)... anyj mod n<br/> 

Special Cases
-------------
Arguments               Command     Left on stack, side effects<br/>
                  any   top         stack unchanged<br/>

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
