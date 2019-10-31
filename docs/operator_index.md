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
