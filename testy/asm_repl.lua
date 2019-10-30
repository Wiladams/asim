package.path = "../?.lua;"..package.path

local PSVM = require("asm_vm")
local vm = PSVM();              -- Create postscript virtual machine

local function runPrompt()
    while true do
        io.write("> ")
        local line = io.read("*l")
        vm:eval(line)
    end
end

local function main(args)
    if #args > 1 then
        return ("usage: luajit json_repl.lua [scriptname]")
    elseif #args == 1 then
        vm:runFile(args[1])
    else
        runPrompt()
    end

end

main(arg)
