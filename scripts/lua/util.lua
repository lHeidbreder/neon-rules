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
    
    for i, value in ipairs(tier_costs) do
        if f_cost < value*1.2 then
            return i
        end
    end

    return 0
end
