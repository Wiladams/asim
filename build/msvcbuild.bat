@rem Script to build bestdesk, bestwin with MSVC.
@rem
@rem Either open a "Visual Studio .NET Command Prompt"
@rem (Note that the Express Edition does not contain an x64 compiler)
@rem -or-
@rem Open a "Windows SDK Command Shell" and set the compiler environment:
@rem     setenv /release /x86
@rem   -or-
@rem     setenv /release /x64
@rem
@rem Then cd to this directory and run this script.

@if not defined INCLUDE goto :FAIL

@setlocal
@set LJCOMPILE=cl /nologo /c /O2 /W3 /D_CRT_SECURE_NO_DEPRECATE
@set LJLINK=link /nologo
@set LJMT=mt /nologo
@set LJLIB=lib /nologo /nodefaultlib

@set LUAC=luajit -b
@set LJDLLNAME=lua51.dll
@set LJLIBNAME=bin/lua51.lib

%LUAC% ../asim/asm_array.lua asm_array.obj
%LUAC% ../asim/asm_common.lua asm_common.obj
%LUAC% ../asim/asm_dictstack.lua asm_dictstack.obj
%LUAC% ../asim/asm_operators.lua asm_operators.obj
%LUAC% ../asim/asm_operators_file.lua asm_operators_file.obj
%LUAC% ../asim/asm_scanner.lua asm_scanner.obj
%LUAC% ../asim/asm_stack.lua asm_stack.obj
%LUAC% ../asim/asm_string.lua asm_string.obj
%LUAC% ../asim/asm_vm.lua asm_vm.obj
%LUAC% ../asim/cctype.lua cctype.obj
%LUAC% ../asim/enum.lua enum.obj
%LUAC% ../asim/errors.lua errors.obj
%LUAC% ../asim/filesystem.lua filesystem.obj
%LUAC% ../asim/namespace.lua namespace.obj
%LUAC% ../asim/octetstream.lua octetstream.obj
%LUAC% ../asim/unicode_util.lua unicode_util.obj
%LUAC% ../asim/win32.lua win32.obj


@set ASIMLIB=asm_array.obj asm_common.obj asm_dictstack.obj asm_operators.obj asm_operators_file.obj asm_scanner.obj asm_stack.obj asm_string.obj asm_vm.obj cctype.obj enum.obj errors.obj filesystem.obj namespace.obj octetstream.obj unicode_util.obj win32.obj






%LJCOMPILE% asm_main.c
@if errorlevel 1 goto :BAD


%LJLINK% /out:asim.exe %LJLIBNAME% asm_main.obj %CLIBS% %ASIMLIB%
@if errorlevel 1 goto :BAD
if exist asim.exe.manifest^
  %LJMT% -manifest asim.exe.manifest -outputresource:asim.exe



del *.obj *.manifest
@echo.
@echo === Successfully built asim application for Windows/%LJARCH% ===
@rem move asim.exe bin 


goto :END
:BAD
@echo.
@echo *******************************************************
@echo *** Build FAILED -- Please check the error messages ***
@echo *******************************************************
@goto :END
:FAIL
@echo You must open a "Visual Studio .NET Command Prompt" to run this script
:END
