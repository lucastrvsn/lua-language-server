---@meta

---Return a list of all keys used in a table.
---However, the order of the return table of keys is not guaranteed.
---
---@see From https://github.com/premake/premake-core/blob/master/src/base/table.lua
---@param t table Table
---@return table keys List of keys
function vim.tbl_keys(t) end

---
---Return a list of all values used in a table.
---However, the order of the return table of values is not guaranteed.
---
---@param t table Table
---@return table values List of values
function vim.tbl_values(t) end

---
---Apply a function to all values of a table.
---
---@param fn function | table Function or callable table
---@param t table Table
---@return table table Table of transformed values
function vim.tbl_map(fn, t) end

---
---Filter a table using a predicate function
---
---@param fn function | table Function or callable table
---@param t table Table
---@return table table Table of filtered values
function vim.tbl_filter(fn, t) end

---
---Checks if a list-like (vector) table contains `value`.
---
---@param t table Table to check
---@param value any Value to compare
---@return boolean `true` if `t` contains `value`
function vim.tbl_contains(t, value) end

---
---Checks if a table is empty.
---
---@see https://github.com/premake/premake-core/blob/master/src/base/table.lua
---@param t table Table to check
---@return boolean is_empty # `true` if `t` is empty
function vim.tbl_isempty(t) end

---@alias Neovim.Table.Extend.Behavior
---| "error" # raise an error
---| "keep" # use value from the leftmost map
---| "force" # use value from the rightmost map

---
---Merges two or more map-like tables.
---
---@see |extend()|
---@param behavior Neovim.Table.Extend.Behavior Decides what to do if a key is found in more than one map
---@param ... table Two or more map-like tables
---@return table table Merged table
function vim.tbl_extend(behavior, ...) end

---
---Merges recursively two or more map-like tables.
---
---@see |vim.tbl_extend()|
---@param behavior Neovim.Table.Extend.Behavior Decides what to do if a key is found in more than one map
---@param ... table Two or more map-like tables
---@return table table Merged table
function vim.tbl_deep_extend(behavior, ...) end

---
---Deep compare values for equality
---Tables are compared recursively unless they both provide the `eq` metamethod.
---All other types are compared using the equality `==` operator.
---
---@param a any First value
---@param b any Second value
---@return boolean `true` if values are equals, else `false`
function vim.deep_equal(a, b) end

---
---Add the reverse lookup values to an existing table.
---For example:
---<pre>
---tbl_add_reverse_lookup { A = 1 } == { [1] = 'A', A = 1 }
---</pre>
---Note that this **modifies** the input.
---
---@param o table Table to add the reverse to
---@return table o
function vim.tbl_add_reverse_lookup(o) end

---
---Index into a table (first argument) via string keys passed as subsequent arguments.
---Return `nil` if the key does not exist.
---
---Examples:
---<pre>
---vim.tbl_get({ key = { nested_key = true }}, 'key', 'nested_key') == true
---vim.tbl_get({ key = {}}, 'key', 'nested_key') == nil
---</pre>
---
---@param o table Table to index
---@param ... string Optional strings (0 or more, variadic) via which to index the table
---@return any key Nested value indexed by key (if it exists), else nil
function vim.tbl_get(o, ...) end

---
---Extends a list-like table with the values of another list-like table.
---**NOTE:** This mutates `dst`!
---
---@see |vim.tbl_extend()|
---@param dst table List which will be modified and appended to
---@param src table List from which values will be inserted
---@param start? number Start index on src. Defaults to 1
---@param finish? number Final index on src. Defaults to `#src`
---@return table dst
function vim.list_extend(dst, src, start, finish) end

---
---Creates a copy of a list-like table such that any nested tables are
---"unrolled" and appended to the result.
---
---@see From https://github.com/premake/premake-core/blob/master/src/base/table.lua
---@param t table List-like table
---@return table table Flattened copy of the given list-like table
function vim.tbl_flatten(t) end

---
---Tests if a Lua table can be treated as an array.
---Empty table `{}` is assumed to be an array, unless it was created by
---|`vim.empty_dict()`| or returned as a dict-like |`API`| or Vimscript result,
---for example from |rpcrequest()| or |vim.fn|.
---
---@param t table Table
---@return boolean is_list `true` if array-like table, else `false`
function vim.tbl_islist(t) end

---
---Counts the number of non-nil values in table `t`.
---<pre>
---vim.tbl_count({ a=1, b=2 }) => 2
---vim.tbl_count({ 1, 2 }) => 2
---</pre>
---
---@see https://github.com/Tieske/Penlight/blob/master/lua/pl/tablex.lua
---@param t table Table
---@return number count Number of non-nil values in table
function vim.tbl_count(t) end

---
---Creates a copy of a table containing only elements from start to end (inclusive)
---
---@param list table Table
---@param start number Start range of slice
---@param finish number End range of slice
---@return table table Copy of table sliced from start to finish (inclusive)
function vim.list_slice(list, start, finish) end

---
---Trim whitespace (Lua pattern "%s") from both sides of a string.
---
---@see https://www.lua.org/pil/20.2.html
---@param s string String to trim
---@return string s String with whitespace removed from its beginning and end
function vim.trim(s) end

---
---Escapes magic chars in |lua-patterns|.
---
---@see https://github.com/rxi/lume
---@param s string String to escape
---@return string s %-escaped pattern string
function vim.pesc(s) end

---
---Tests if `s` starts with `prefix`.
---
---@param s string String
---@param prefix string Prefix to match
---@return boolean bool `true` if `prefix` is a prefix of `s`
function vim.startswith(s, prefix) end

---
---Tests if `s` ends with `suffix`.
---
---@param s string String
---@param suffix string Suffix to match
---@return boolean bool `true` if `suffix` is a suffix of `s`
function vim.endswith(s, suffix) end

---@enum Neovim.Validate.Types
---| "table"
---| "t"
---| "string"
---| "s"
---| "number"
---| "n"
---| "boolean"
---| "b"
---| "function"
---| "f"
---| "callable"
---| "c"
---| "nil"
---| "thread"
---| "userdata"

---@alias Neovim.Validate.TableOptions { [1]: any, [2]: Neovim.Validate.Types | Neovim.Validate.Types[], [3]: boolean | nil }

---@alias Neovim.Validate.FunctionOptions { [1]: any, [2]: (fun(value: any): boolean | string), [3]: string | nil }

---@alias Neovim.Validate.Options table<string, Neovim.Validate.TableOptions | Neovim.Validate.FunctionOptions>

---
---Validates a parameter specification (types and values).
---
---Usage example:
---<pre>
--- function user.new(name, age, hobbies)
---   vim.validate{
---     name={name, 'string'},
---     age={age, 'number'},
---     hobbies={hobbies, 'table'},
---   }
---   ...
--- end
---</pre>
---
---Examples with explicit argument values (can be run directly):
---<pre>
---vim.validate{arg1={{'foo'}, 'table'}, arg2={'foo', 'string'}}
---   => NOP (success)
---
---vim.validate{arg1={1, 'table'}}
---   => error('arg1: expected table, got number')
---
---vim.validate{arg1={3, function(a) return (a % 2) == 0 end, 'even number'}}
---   => error('arg1: expected even number, got 3')
---</pre>
---
---If multiple types are valid they can be given as a list.
---<pre>
---vim.validate{arg1={{'foo'}, {'table', 'string'}}, arg2={'foo', {'table', 'string'}}}
---   => NOP (success)
---
---vim.validate{arg1={1, {'string', table'}}}
---   => error('arg1: expected string|table, got number')
---</pre>
---
---@param opt Neovim.Validate.Options Names of parameters to validate. Each key is a parameter name.
function vim.validate(opt) end

---
---Returns true if object `f` can be called as a function.
---
---@param f any Any object
---@return boolean is_callable `true` if `f` is callable, else `false`
function vim.is_callable(f) end

---
---Creates a table whose members are automatically created when accessed, if they don't already
---exist.
---They mimic defaultdict in python.
---
---If {create} is `nil`, this will create a defaulttable whose constructor function is
---this function, effectively allowing to create nested tables on the fly:
---
---<pre>
---local a = vim.defaulttable()
---a.b.c = 1
---</pre>
---
---@param create? function The function called to create a missing value.
---@return table table Empty table with metamethod
function vim.defaulttable(create) end
