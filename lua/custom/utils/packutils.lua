-- TODO: Add cool funtion that automatically adds specified dependencies
---@param deps { name : string, version? : string }[]
function Load_dependencies(deps)
	local url = 'https://www.github.com'
	for i = 1, #deps do
		deps[i].name = url .. deps[i].name
	end
	vim.pack.add(deps)
end

function Gh(repo)
    return "https://github.com/" .. repo
end
