-- adds values in table2 to table1
local append_values = function(table1, table2)
  for _, value in ipairs(table2) do
    table.insert(table1, value)
  end
  return table1
end

local luatools = {
  -- joins 2 tables, overwriting the first table with the second
  merge_tables = function(first_table, second_table)
    local new_table = {}
    append_values(new_table, first_table)
    append_values(new_table, second_table)
    return new_table
  end
}

return luatools

