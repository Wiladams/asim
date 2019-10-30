/*
** LuaJIT frontend. Runs commands, scripts, read-eval-print (REPL) etc.
** Copyright (C) 2005-2013 Mike Pall. See Copyright Notice in luajit.h
**
** Major portions taken verbatim or adapted from the Lua interpreter.
** Copyright (C) 1994-2008 Lua.org, PUC-Rio. See Copyright Notice in lua.h
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define luajit_c

#include "lua.h"
#include "lauxlib.h"
#include "lualib.h"
#include "lj_arch.h"


#if LJ_TARGET_POSIX
  #include <unistd.h>
  #define lua_stdin_is_tty()	isatty(0)
#elif LJ_TARGET_WINDOWS
  #include <io.h>
    #define lua_stdin_is_tty()	_isatty(_fileno(stdin))
#else
  #define lua_stdin_is_tty()	1
#endif

#if !LJ_TARGET_CONSOLE
#include <signal.h>
#endif

static lua_State *globalL = NULL;
static const char *progname = LUA_PROGNAME;

// This is the startup script we need to run
// to get things going after the user script
// has been loaded.
const char * startupScript = "      \
local vm = require('asm_vm')()      \
while true do                   \
    io.write('=> ')             \
    local line = io.read('*l')  \
    vm:eval(line)           \
end";


#if !LJ_TARGET_CONSOLE
static void lstop(lua_State *L, lua_Debug *ar)
{
  (void)ar;  /* unused arg. */
  lua_sethook(L, NULL, 0, 0);
  /* Avoid luaL_error -- a C hook doesn't add an extra frame. */
  luaL_where(L, 0);
  lua_pushfstring(L, "%sinterrupted!", lua_tostring(L, -1));
  lua_error(L);
}

static void laction(int i)
{
  signal(i, SIG_DFL); /* if another SIGINT happens before lstop,
			 terminate process (default action) */
  lua_sethook(globalL, lstop, LUA_MASKCALL | LUA_MASKRET | LUA_MASKCOUNT, 1);
}
#endif


static void l_message(const char *pname, const char *msg)
{
  if (pname) fprintf(stderr, "%s: ", pname);
  fprintf(stderr, "%s\n", msg);
  fflush(stderr);
}

static int report(lua_State *L, int status)
{
  if (status && !lua_isnil(L, -1)) {
    const char *msg = lua_tostring(L, -1);
    if (msg == NULL) msg = "(error object is not a string)";
    l_message(progname, msg);
    lua_pop(L, 1);
  }
  return status;
}

static int traceback(lua_State *L)
{
  if (!lua_isstring(L, 1)) { /* Non-string error object? Try metamethod. */
    if (lua_isnoneornil(L, 1) ||
	!luaL_callmeta(L, 1, "__tostring") ||
	!lua_isstring(L, -1))
      return 1;  /* Return non-string error object. */
    lua_remove(L, 1);  /* Replace object by result of __tostring metamethod. */
  }
  luaL_traceback(L, L, lua_tostring(L, 1), 1);
  return 1;
}

static int docall(lua_State *L, int narg, int clear)
{
  int status;
  int base = lua_gettop(L) - narg;  /* function index */
  lua_pushcfunction(L, traceback);  /* push traceback function */
  lua_insert(L, base);  /* put it under chunk and args */
#if !LJ_TARGET_CONSOLE
  signal(SIGINT, laction);
#endif
  status = lua_pcall(L, narg, (clear ? 0 : LUA_MULTRET), base);
#if !LJ_TARGET_CONSOLE
  signal(SIGINT, SIG_DFL);
#endif
  lua_remove(L, base);  /* remove traceback function */
  /* force a complete garbage collection in case of errors */
  if (status != 0) lua_gc(L, LUA_GCCOLLECT, 0);
  return status;
}

static void print_version(void)
{
  fputs("asim - Copyright 2019 William Adams \n", stdout);
}


static int dostring(lua_State *L, const char *s, const char *name)
{
  int status = luaL_loadbuffer(L, s, strlen(s), name) || docall(L, 0, 1);

  return report(L, status);
}


struct Smain {
  char **argv;
  int argc;
  int status;
};


static int pmain(lua_State *L)
{
  struct Smain *s = (struct Smain *)lua_touserdata(L, 1);
  char **argv = s->argv;
  int script;
  int flags = 0;
  globalL = L;

  print_version();

  lua_gc(L, LUA_GCSTOP, 0);   // stop collector during initialization
  luaL_openlibs(L);           // open libraries

  lua_gc(L, LUA_GCRESTART, -1);

  dostring(L, startupScript, "=");

  return 0;
}

int main(int argc, char **argv)
{
  int status;
  struct Smain s;
  lua_State *L = lua_open();  /* create state */
  
  if (L == NULL) {
    l_message(argv[0], "cannot create state: not enough memory");
    return EXIT_FAILURE;
  }
  s.argc = argc;
  s.argv = argv;
  status = lua_cpcall(L, pmain, &s);
  report(L, status);
  lua_close(L);
  return (status || s.status) ? EXIT_FAILURE : EXIT_SUCCESS;
}

