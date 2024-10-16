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
	if entry == nil then return "" end
	local parts = string.gmatch(entry, "([^;]+)") or {}
    local rtn = ""
    for part in parts do
        rtn = rtn .. "\\item " .. part .. "\n"
    end

    --sublists
    rtn = string.gsub(rtn,"::b::","\\begin{itemize}\\setlength\\itemsep{-10mm}\\vspace{-10mm}")
    rtn = string.gsub(rtn,"::e::","\\end{itemize}")

    return rtn
end

function importfrom(csvpath, templatepath, outpath)

    -- exit if file exists
    f=io.open(outpath..".texin","r")
    if f~=nil then io.close(f) return end

    local headers = {}
    local lines = {}
    local is_first_line = true
    for line in io.lines(csvpath) do
        
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
            
            if line[j] == nil then
                line[j] = ""
            end
            
            --escape "%" for both lua and latex
            line[j] = string.gsub(line[j], "%%", "\\%%%%")
            
            filledtemplate = string.gsub(filledtemplate, "@"..headers[j].."@", line[j])
        end
		
		--clean every pattern without matching column
		filledtemplate = string.gsub(filledtemplate, "@[^%s@]*@", "")

        --write to file so \input can pick it up later
        writetofile(outpath..".texin", filledtemplate)
    end
end

function noncombat_skills(filepath)
    local headers = {}
    local lines = {}
    local is_first_line = true
    for line in io.lines(filepath) do
        
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
    
    local tpl = io.open("../scripts/templates/noncombat-skill.tpl"):read("*all")
    for _,line in pairs(lines) do
        local out = tpl
        for j=1,table.getn(headers) do
            
            if line[j] == nil then
                line[j] = ""
            end
            if string.match(line[j],"Combat Training") then
                goto continue0
            end
            
            --escape "%" for both lua and latex
            line[j] = string.gsub(line[j], "%%", "\\%%%%")
            
            out = string.gsub(out, "@"..headers[j].."@", line[j])
        end
        tex.print(out)
        ::continue0::
    end
end

function combat_skills(filepath, filter)
    local headers = {}
    local lines = {}
    local is_first_line = true
    for line in io.lines(filepath) do
        
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
    
    local tpl = io.open("../scripts/templates/combat-skill.tpl"):read("*all")
    for _,line in pairs(lines) do
        local out = tpl
        
        print(line[1])
        if not string.match(line[1],filter.." Combat Training") then
            goto continue0
        end

        for j=1,table.getn(headers) do
            
            if line[j] == nil then
                line[j] = ""
            end
            
            --escape "%" for both lua and latex
            line[j] = string.gsub(line[j], "%%", "\\%%%%")
            
            out = string.gsub(out, "@"..headers[j].."@", line[j])
        end
        tex.print(out)
        ::continue0::
    end
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

function writetofile(path, text)
    local out = io.open(path, "a")
    out:write(text)
    io.close(out)
end
