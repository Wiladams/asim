package.path = "../?.lua;"..package.path

--[[
http://paulbourke.net/dataformats/postscript/
--]]

local PSVM = require("asim.asm_vm")
local vm = PSVM();              -- Create postscript virtual machine

vm:eval([[
1 2 add
3.7 mul
neg
floor
(should be -12) print
==
]])