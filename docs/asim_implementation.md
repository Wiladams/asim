ASIM is implemented using the LuaJIT language.  LuaJIT is an implementation of the 
lua language, with the added benefit of a Just In Time compiler option.  This makes
for a faster runtime.  There are numerous options for implementing ASIM, but 
the LuaJIT language provides a simple starting point, with a minimal footprint
and fairly low concept count.

ASIM has such minimal requirements of the implementation language, it's relatively
easy to see how it can be implemented to be as close to the actual hardware as possible.
Still, LuaJIT offers features such as coroutines, which makes it relatively easy to 
implement various looping constructs, with exit capability, without much effort.  In
addition, the fact there is an inbuilt garbage collector makes it a natural fit
for the ASIM language as well.

ASIM can be implemented in any language.  The essentials are garbage collection
and some form of structural unions.  Beyond that, there's just not much there.  This
simplicity makes ASIM a natural for extending the core runtime and language.

Base Datatypes
--------------
* [asm_array](https://github.com/Wiladams/asim/blob/master/asim/asm_array.lua)
* [asm_dictstack](https://github.com/Wiladams/asim/blob/master/asim/asm_dictstack.lua)
* [asm_stack](https://github.com/Wiladams/asim/blob/master/asim/asm_stack.lua)
* [asm_string](https://github.com/Wiladams/asim/blob/master/asim/asm_string.lua)

Operators
---------
* [asm_operators](https://github.com/Wiladams/asim/blob/master/asim/asm_operators.lua) - Contains the core operators of the language
* [asm_operators_file](https://github.com/Wiladams/asim/blob/master/asim/asm_operators_file.lua) - Contains file specific operators

Runtime
-------
* [asm_scanner](https://github.com/Wiladams/asim/blob/master/asim/asm_scanner.lua) - The scanner
* [asm_vm](https://github.com/Wiladams/asim/blob/master/asim/asm_vm.lua) - the actual execution engine
* [filesystem](https://github.com/Wiladams/asim/blob/master/asim/filesystem.lua) - file system iteration and access
* [octetstream](https://github.com/Wiladams/asim/blob/master/asim/octetstream.lua) - An easy byte streaming interface 

Misc
----
* [unicode_util](https://github.com/Wiladams/asim/blob/master/asim/unicode_util.lua)
* [win32](https://github.com/Wiladams/asim/blob/master/asim/win32.lua)
