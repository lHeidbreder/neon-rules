--#region CORE
function importfile (in_file, template_path, outpath)
    -- exit if file exists
    f=io.open(outpath..".texin","r")
    if f~=nil then io.close(f) return end

    -- load file and transform file to list of common objects
    local data = {}
    local extension = in_file:match('%.%w+$')
    if extension:match('json') then
        data = transform_json(in_file)
    elseif in_file:match('csv') then
        data = transform_csv(in_file)
    else
        texio.write_nl('ERROR: file ' .. in_file .. ' has unknown extension!')
        return
    end
    
    -- load template
    local template_file = io.open(template_path, "r")
    if template_file == nil then
        texio.write_nl('ERROR: file ' .. template_file .. ' cannot be opened!')
        return
    end
    local template = template_file:read("*all")
    template_file:close()

    -- fill template
    for _, obj in ipairs(data) do
        local filledtemplate = template
        
        for key, value in pairs(obj) do
            -- -> if field contains string: fill it in
            -- -> if field contains list: itemize the list

            -- new itemize
            if type(value) == "table" then
                local tmp = ""
                for _, e in ipairs(value) do
                    if not e:match('^%s*$') then
                        tmp = tmp .. "\\item " .. e .. "\n"
                    end
                end
                value = tmp
            end
            --sublists (still the same hack)
            value = string.gsub(value,
                "::b(-?%d*)::",
                function(capture)
                    local capture_num = tonumber(capture) or -10
                    return "\\begin{itemize}\\setlength\\itemsep{"..capture_num.."mm}\\vspace{"..capture_num.."mm}"
                end)
            value = string.gsub(value, "::e::","\\end{itemize}")

            if value == nil then
                value = ""
            end
            --escape "%" for both lua and latex
            value = string.gsub(value, "%%", "\\%%%%")

            filledtemplate = filledtemplate:gsub("@"..key.."@", value)
        end

        --clean every pattern without matching column
		filledtemplate = filledtemplate:gsub("@[^%s@]*@", "")

        --write to file so \input can pick it up later
        write_to_file(outpath..".texin", filledtemplate)
    end
end

function write_to_file(path, text)
    local out = io.open(path, "a")
    if out == nil then
        error("Cannot write to " .. path)
    end
    out:write(text)
    io.close(out)
end

--#endregion

--#region JSON

function transform_json (in_file)
    local json = require("../scripts/dependencies/json.lua")

    local f = io.open(in_file, 'r')
    if f == nil then
        texio.write_nl('ERROR: file ' .. f .. ' cannot be opened!')
        return {}
    end
    local data = json.decode(f:read("*all"))
    io.close(f)

    return data
end

--#endregion

--#region CSV

function transform_csv (in_file)

    local rtn = {}

    local headers = {}
    local lines = {}
    local is_first_line = true
    for line in io.lines(in_file) do
        
        --skip lines beginning with %
        if string.find(line,'^%%') then
            goto continue
        end

        -- parse first line for headers
        if is_first_line then
            headers = ParseCSVLine(line)
            is_first_line = false
            goto continue
        end
    
        -- parse all other lines
        local parsedline = ParseCSVLine(line)
        local tmp = {}
        for index, _ in ipairs(headers) do
            
            if headers[index]:match('^itemize') then
                tmp[headers[index]] = {}
                for m in parsedline[index]:gmatch("([^;]+)") or {} do
                    table.insert(tmp[headers[index]], m)
                end
            else
                tmp[headers[index]] = parsedline[index]
            end
        end
        
        table.insert(rtn, tmp)

        ::continue::
    end

    return rtn
end

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

--#endregion

