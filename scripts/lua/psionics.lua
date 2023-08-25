function psitemize(s_in)
    local parts = string.gmatch(s_in, "[^,]+") or {}
    for s in parts do
        tex.sprint("\\item ",s," ")
    end
end