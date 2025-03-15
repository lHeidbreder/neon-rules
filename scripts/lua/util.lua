function ifisnumericprint(pstring, pthen)
    numregex = "^%d*%.?%d+$"
    if string.match(pstring, numregex) then
        tex.sprint(pthen)
    end
end

function makekeyforlabel(prefix, pkey)
    local key = pkey:
            gsub("%s+", ""):
            gsub('"+',""):
            gsub("-",""):
            lower()
    return prefix == "" and key or prefix..":"..key
end

function makelabel(prefix, pkey)
    local success, err = pcall(function()
        local lbl = makekeyforlabel(prefix,pkey)
        tex.print("\\label{"..lbl.."}")
    end)

    if not success then
        texio.write_nl("log", "Error in Lua function: " .. err)
    end
    collectgarbage("collect")
end

function tierfromcost(cost)
    tier_costs = {50, 180, 500, 2000, 8000}
    f_cost = tonumber(cost)
    if f_cost == nil then
        return 0
    end
    
    for i, value in ipairs(tier_costs) do
        if f_cost < value*1.2 then
            return i
        end
    end

    return 0
end

-- Taken from https://stackoverflow.com/questions/41942289/display-contents-of-tables-in-lua
function tprint (tbl, indent)
    if not indent then indent = 0 end
    local toprint = string.rep(" ", indent) .. "{\r\n"
    indent = indent + 2 
    for k, v in pairs(tbl) do
      toprint = toprint .. string.rep(" ", indent)
      if (type(k) == "number") then
        toprint = toprint .. "[" .. k .. "] = "
      elseif (type(k) == "string") then
        toprint = toprint  .. k ..  "= "   
      end
      if (type(v) == "number") then
        toprint = toprint .. v .. ",\r\n"
      elseif (type(v) == "string") then
        toprint = toprint .. "\"" .. v .. "\",\r\n"
      elseif (type(v) == "table") then
        toprint = toprint .. tprint(v, indent + 2) .. ",\r\n"
      else
        toprint = toprint .. "\"" .. tostring(v) .. "\",\r\n"
      end
    end
    toprint = toprint .. string.rep(" ", indent-2) .. "}"
    return toprint
  end

function iscurrentdoc (title)
  if title == tex.jobtitle then
    tex.print("true") 
    return true
  else
    tex.print("false")
    return false
  end
end
