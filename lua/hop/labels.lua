local M = {}

M.most_similar_shapes = {
  [ 'a' ] = 'aoescnrguzxfdvwmtbhklpyqij',
  [ 'o' ] = 'oaescnrguzxvwmtfbdhklpyqij',
  [ 'e' ] = 'eaoscnrguzxfdvwmtbhklpyqij',
  [ 's' ] = 'szaoecnrguxfdvwmtbhklpyqij',
  [ 'c' ] = 'coueasnrgzxfdvwmtbhklpyqij',
  [ 'n' ] = 'naoescrguzxfdvwmtbhklpyqij',
  [ 'r' ] = 'raoescnguzxfdvwmtbhklpyqij',
  [ 'g' ] = 'gqyaoescnruzxfdvwmtbhklpij',
  [ 'u' ] = 'uvaoescnrgzxfdwmtbhklpyqij',
  [ 'z' ] = 'zaoescnrguxfdvwmtbhklpyqij',
  [ 'x' ] = 'xaoescnrguzfdvwmtbhklpyqij',
  [ 'f' ] = 'ftldaoescnrguzxvwmbhkpyqij',
  [ 'd' ] = 'dbaoescnrguzxfvwmthklpyqij',
  [ 'v' ] = 'vuwaoescnrzxmyqpgtfdbhklij',
  [ 'w' ] = 'wmvxuaoescnrgzfdtbhklpyqij',
  [ 'm' ] = 'mwnxaoescrguzfdvtbhklpyqij',
  [ 't' ] = 'tfliaoescnrguzxdvwmbhkpyqj',
  [ 'b' ] = 'bhdlaoescnrguzxfvwmtkpyqij',
  [ 'h' ] = 'hbdaoescnrguzxfvwmtklpyqij',
  [ 'k' ] = 'kaoescnrguzxfdvwmtbhlpyqij',
  [ 'l' ] = 'liaoescnrguzxfdvwmtbhkpyqj',
  [ 'p' ] = 'pqyaoescnrguzxfdvwmtbhklij',
  [ 'y' ] = 'ypaoescnrguzxfdvwmtbhklqij',
  [ 'q' ] = 'qaoescnrguzxfdvwmtbhklpyij',
  [ 'i' ] = 'ijfltaoescnrguzxdvwmbhkpyq',
  [ 'j' ] = 'jigyaoescnruzxfdvwmtbhklpq',
  [ 'A' ] = 'dbhklfjtiwmxpyqgvaoescnruz',
}


-- The keys that are most visually similar to the character will be at the
-- front of the output string. If the visual similarity is unknown, the input
-- keys order is used.
---@param character string
---@param keys string
---@return string
function M.sort_visually_similar(character, keys)
  local sort_order = M.most_similar_shapes[character]
  if sort_order == nil then
    return keys
  end
  local t = {}
  keys:gsub('.',function(c) table.insert(t, c) end)
  -- return true if a should come before b
  table.sort(t, function(a, b)
    local a_pos = string.find(sort_order, a, 1, true)
    local b_pos = string.find(sort_order, b, 1, true)
    if a_pos == nil and b_pos == nil then
      return string.find(keys, a, 1, true) < string.find(keys, b, 1, true)
    elseif a_pos == nil then
      return false
    elseif b_pos == nil then
      return true
    else
      return a_pos < b_pos
    end
  end)
  return table.concat(t, '')
end

return M
