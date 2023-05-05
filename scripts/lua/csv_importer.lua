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

function itemize(entry)
    local parts = string.gmatch(entry, "([^,]+)")
    local rtn = ""
    for part in parts do
        rtn = rtn .. "\\item " .. part .. "\n"
    end

    return rtn
end

function import_from(csv_path, template_path)

    -- open file
    local csv = io.open(csv_path, "r")

    local headers = {}
    local lines = {}
    local is_first_line = true
    for line in io.lines(csv_path) do
        -- parse first line for headers
        if is_first_line then
            headers = ParseCSVLine(line)
            is_first_line = false
            goto continue
        end
    
        -- parse all other lines
        table.insert(lines, ParseCSVLine(line))

        ::continue::
    end

    -- close file
    csv:close()

    -- load template
    local template_file = io.open(template_path, "r")
    local template = f:read("*all")
    template_file:close()

    -- adjust for itemize
    for i=0,table.getn(headers) do
        if string.match(headers[i], "itemize:[a-zA-Z_]") ~= nil then
            for line in lines do
                line[i] = itemize(line[i])
            end
        end
    end

    -- fill template
    for line in lines do
        local filled_template = template

        for j=0,table.getn(headers) do
            filled_template = string.gsub(filled_template, "@"..headers[j].."@", line[j])
        end

        tex.sprint(filled_template)
    end
end