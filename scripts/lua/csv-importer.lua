-- Taken from http://lua-users.org/wiki/LuaCsv
function ParseCSVLine (line,sep) 
	local res = {}
	local pos = 1
	sep = sep or ','
	while true do 
		local c = string.sub(line,pos,pos)
		if (c == "") then break end
		if (c == '"') then
			-- quoted value (ignore separator within)
			local txt = ""
			repeat
				local startp,endp = string.find(line,'^%b""',pos)
				txt = txt..string.sub(line,startp+1,endp-1)
				pos = endp + 1
				c = string.sub(line,pos,pos) 
				if (c == '"') then txt = txt..'"' end 
				-- check first char AFTER quoted string, if it is another
				-- quoted string without separator, then append it
				-- this is the way to "escape" the quote char in a quote. example:
				--   value1,"blub""blip""boing",value3  will result in blub"blip"boing  for the middle
			until (c ~= '"')
			table.insert(res,txt)
			assert(c == sep or c == "")
			pos = pos + 1
		else	
			-- no quotes used, just look for the first separator
			local startp,endp = string.find(line,sep,pos)
			if (startp) then 
				table.insert(res,string.sub(line,pos,startp-1))
				pos = endp + 1
			else
				-- no separator found -> use rest of string and terminate
				table.insert(res,string.sub(line,pos))
				break
			end 
		end
	end
    return res
end

-- Splits the entry and adds "\item " before each part
function itemize(entry)
    local parts = string.gmatch(entry, "([^,]+)")
    local rtn = ""
    for part in parts do
        rtn = rtn .. "\\item " .. part .. "\n"
    end

    return rtn
end

function importfrom(csvpath, templatepath)

    -- clear input file
    os.remove(csvpath..".texin")

    local headers = {}
    local lines = {}
    local is_first_line = true
    for line in io.lines(csvpath) do
        
        -- parse first line for headers
        if is_first_line then
            headers = ParseCSVLine(line)
            is_first_line = false
            goto continue
        end
    
        -- parse all other lines
        local parsedline = ParseCSVLine(line)
        table.insert(lines, parsedline)

        ::continue::
    end

    -- load template
    local template_file = io.open(templatepath, "r")
    local template = template_file:read("*all")
    template_file:close()

    -- adjust for itemize
    for i=1,table.getn(headers) do
        if string.match(headers[i], "itemize:[a-zA-Z_]") ~= nil then
            for key, line in pairs(lines) do
                lines[key][i] = itemize(lines[key][i])
            end
        end
    end

    -- fill template
    for key, line in pairs(lines) do
        local filledtemplate = template
        
        for j=1,table.getn(headers) do
            filledtemplate = string.gsub(filledtemplate, "@"..headers[j].."@", line[j])
        end

        --write to file so \input can pick it up later
        writetofile(csvpath..".texin", filledtemplate)
    end
end

function writetofile(path, text)
    local out = io.open(path, "a")
    out:write(text)
    io.close(out)
end
