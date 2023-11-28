local scopes = { o = vim.o, b = vim.bo, w = vim.wo } -- scopes: { editor, buffer, window }
local function set_editor_option(scope, field, value)
	scopes[scope][field] = value

	if scope ~= 'o' then
		scopes['o'][field] = value
	end
end

set_editor_option('o', 'foldmethod', 'expr')
set_editor_option('o', 'foldexpr', 'nvim_treesitter#foldexpr()')

