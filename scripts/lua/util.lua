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

