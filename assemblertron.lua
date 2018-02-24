local component = require("component")
local me = component.me_interface
local tp = component.transposer

local sides = require("sides")

local inv_names = 
{
  assembler={
    name="opencomputers:adapter",
    side=sides.unknown
  },
  interface={
    name="appliedenergistics2:interface",
    side=sides.unknown
  }
}

function registerInventories()
  for i=0,5 do
    for _, v in pairs(inv_names) do
      if v.name == tp.getInventoryName(i) then
        v.sides = i
      end
    end
  end
end

function checkInventories()
  local fail_table = {}
  for _, v in pairs(inv_names) do
    if v.sides == sides.unknown then
      fail_table.insert(v)
    end
  end
  if #fail_table then
    return false, fail_table
  end
  return true
end

registerInventories()
local ok,bad_invs = checkInventories()

if not ok then
  print("Could not find inventories %s":format(serialization.serialize(bad_invs,true)))
  os.exit()
end
print("Inventories found!")
