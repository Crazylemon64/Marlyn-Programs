local component = require("component")
local me = component.me_interface
local tp = component.transposer

local sides = require("sides")

for i=0,5 do
  print(i, sides[i], tp.getInventoryName(i), tp.getInventorySize(i))
end
