--[[
    Operators related to files
]]
local octetstream = require("octetstream")
local ps_common = require("asm_common")
local Scanner = require("asm_scanner")

local exports = {}

-- file
-- filename access file file
local function file(vm)
    local access = vm.OperandStack:pop()
    local filename = vm.OperandStack:pop()

    -- construct an octetstream based on filename
    -- and intended access
    --print("OP:file; ", access, filename)

    local f = io.open(filename, "r")
    assert(f ~= nil)
    local bytes = f:read("*a")
    f:close()

    local bs = octetstream(bytes)
    assert(bs ~= nil)

    vm.OperandStack:push(bs)

    return true
end
exports.file = file

-- closefile
-- file closefile -
local function closefile(vm)
    local f = vm.OperandStack:pop()
    
    -- closing the file won't do much at the moment

    return true
end
exports.closefile = closefile

-- read
--   file read int true
--   file read false
local function read(vm)
    local f = vm.OperandStack:pop()
    if f:isEOF() then
        vm.OperandStack:push(false)
    else
        local c, err = vm.OperandStack:readOctet()
        if c then
            vm.OperandStack:push(c)
            vm.OperandStack:push(true)
        else
            vm.OperandStack:push(false)
        end
    end

    return true
end
exports.read = read

-- write
--   file int write -
local function write(vm)
    local c = vm.OperandStack:pop()
    local f = vm.OperandStack:pop()
    
    f:writeOctet(f)

    return true
end
exports.write = write

-- readhexstring
-- writehexstring

-- readstring
--   file string readstring substring bool
local function readstring(vm)
    local str = vm.OperandStack:pop()
    local src = vm.OperandStack:pop()
    local n = str.capacity

    str:reset()

    local offset = 0
    while (not src:isEOF()) and offset < n do
        local c, err = src:readOctet()
        str[offset] = c
        offset = offset + 1
    end

    vm.OperandStack:push(str)
    vm.OperandStack:push(not src:isEOF())
    
    return true
end
exports.readstring = readstring

-- writestring

-- readline
--   file string readline substring bool
local function readline(vm)
    local CR = string.byte("\r")
    local LF = string.byte("\n")
    local sawnewline = false

    local str = vm.OperandStack:pop()
    local src = vm.OperandStack:pop()
    local n = str.capacity
--print("length: ", n, str.capacity)
--print("stream, remaining: ", src:remaining())
    -- reset the string before usage
    str:reset()

    local offset = 0;
    while (not src:isEOF()) and offset < n do
        --print("readline:WHILE")
        local c = src:peekOctet()
        --print(c, string.char(c))
        if (c == CR) then
            if src:peekOctet(1) == LF then
                sawnewline = true
                src:skip(2)
                break
            end
        elseif c == LF then
            sawnewline = true
            src:skip(1)
            break
        end

        src:skip(1)
        str[offset] = c
        offset = offset + 1
    end

    --print("  OP:readline; str: ", str, sawnewline)
    vm.OperandStack:push(str)
    vm.OperandStack:push(sawnewline)

    return true
end
exports.readline = readline

-- token
-- file token ps_token
--
local function token(vm)
    --print("OP:token - BEGIN")
    local f = vm.OperandStack:pop()
    local scnr = f.Scanner
    if not scnr then
        -- if there's not already a scanner assigned to the
        -- file, then create one and assign it
        scnr = Scanner(vm, f)
        f.Scanner = scnr
    end

    -- Just get the next available token
    local foundOne = false
    local foundTok = nil
    for _, tok in scnr:tokens() do
        foundTok = tok
        print("OP:token: ", tok.kind, tok.value)
        break
    end

    if foundTok ~= nil then
        vm.OperandStack:push(tok)
        vm.OperandStack:push(true)
    else
        vm.OperandStack:push(false)
    end

    return true
end
exports.token = token

-- bytesavailable
--    file bytesavailable int
local function bytesavailable(vm)
    local f = vm.OperandStack:pop()
    local n = f:remaining()

    vm.OperandStack:push(n)

    return true
end
exports.bytesavailable = bytesavailable

-- fileposition
--   file fileposition int
local function fileposition(vm)
    local f = vm.OperandStack:pop()
    local p = f:tell()
    vm.OperandStack:push(p)

    return true
end
exports.fileposition = fileposition

-- setfileposition
-- file int setfileposition -
local function setfileposition(vm)
    local n = vm.OperandStack:pop()
    local f = vm.OperandStack:pop()
    f:seekFromBeginning(n)

    return true
end

-- flushfile
--   file flushfile -
local function flushfile(vm)
    local f = vm.OperandStack:pop()

    return true
end
exports.flushfile = flushfile

-- flush

-- resetfile
local function resetfile(vm)
    local f = vm.OperandStack:pop()
    f:seekFromBeginning(0)

    return true
end
exports.resetfile = resetfile

-- status

-- run
--   filename run -
local function run(vm)
    local filename = vm.OperandStack:pop()
    vm:runFile(filename)

    return true
end
exports.run = run

-- currentfile
--   - currentfile file
local function currentfile(vm)
    if vm.CurrentFile then
        vm.OperandStack:push(vm.CurrentFile)
        --vm.OperandStack:push(true)
    else
        vm.OperandStack:push(ps_common.NULL)
        --vm.OperandStack:push(false)
    end

    return true
end
exports.currentfile = currentfile

return exports