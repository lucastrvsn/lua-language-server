---@meta

---@class Neovim
vim = {}

vim.log = {}

---@enum Neovim.Log.Levels
vim.log.levels = {}

---@class Neovim.Fn
vim.fn = {}

vim.g = {}

vim.v = {}

vim.b = {}

vim.w = {}

vim.t = {}

---
---Return a human-readable representation of the given object.
---
---@see https://github.com/kikito/inspect.lua
---@see https://github.com/mpeterv/vinspect
---@param object any
---@param options? table
function vim.inspect(object, options) end

---
---Prints given arguments in human-readable format.
---
---Example:
---<pre>
---  -- Print highlight group Normal and store it's contents in a variable.
---  local hl_normal = vim.pretty_print(vim.api.nvim_get_hl_by_name("Normal", true))
---</pre>
---@see |vim.inspect()|
---@return any arguments Number given arguments.
function vim.pretty_print(...) end

function vim.schedule(fn) end

function vim.schedule_wrap(fn) end

---
---Defers calling `fn` until `timeout` ms passes.
---
---Use to do a one-shot timer that calls `fn`
---Note: The {fn} is |vim.schedule_wrap()|ped automatically, so API functions are
---safe to call.
---@param fn function Callback to call once `timeout` expires
---@param timeout integer Number of milliseconds to wait before calling `fn`
---@return table timer luv timer object
function vim.defer_fn(fn, timeout) end

---
---Execute Vim script commands
---
---@param command string | table
---@return any
function vim.cmd(command) end

---
---Get a table of lines with start, end columns for a region marked by two points
---
---@param bufnr number number of buffer
---@param pos1 integer[] (line, column) tuple marking beginning of region
---@param pos2 integer[] (line, column) tuple marking end of region
---@param regtype string type of selection, see |setreg()|
---@param inclusive boolean indicating whether the selection is end-inclusive
---@return table<integer, {}> region lua table of the form {linenr = {startcol,endcol}}
function vim.region(bufnr, pos1, pos2, regtype, inclusive) end

---
---Display a notification to the user.
---
---This function can be overridden by plugins to display notifications using a
---custom provider (such as the system notification provider). By default,
---writes to |:messages|.
---
---@param msg string Content of the notification to show to the user.
---@param level? Neovim.Log.Levels One of the values from |vim.log.levels|.
---@param opts? table Optional parameters. Unused by default.
function vim.notify(msg, level, opts) end

---
---Display a notification only one time.
---
---Like |vim.notify()|, but subsequent calls with the same message will not
---display a notification.
---
---@param msg string Content of the notification to show to the user.
---@param level? Neovim.Log.Levels One of the values from |vim.log.levels|.
---@param opts? table Optional parameters. Unused by default.
---@return boolean success true if message was displayed, else false
function vim.notify_once(msg, level, opts) end

---
---deprecated, instead use: `vim.on_key`
---
---@deprecated
function vim.register_keystroke_callback() end

---
---Adds Lua function {fn} with namespace id {ns_id} as a listener to every, yes every, input key.
---
---The Nvim command-line option |-w| is related but does not support callbacks and cannot be toggled dynamically.
---
---@param fn fun(key: string) Callback function. It should take one string argument.
---                    On each key press, Nvim passes the key char to fn(). |i_CTRL-V|
---                    If {fn} is nil, it removes the callback for the associated {ns_id}
---@param ns_id Neovim.Namespace? Namespace ID. If nil or 0, generates and returns a new `vim.api.nvim_create_namespace()` id.
---@return number Namespace id associated with {fn}. Or count of all callbacks if on_key() is called without arguments.
---
---@note {fn} will be removed if an error occurs while calling.
---@note {fn} will not be cleared by |nvim_buf_clear_namespace()|
---@note {fn} will receive the keys after mappings have been evaluated
function vim.on_key(fn, ns_id) end

---
---Display a deprecation notification to the user.
---
---@param name         string  Deprecated function.
---@param alternative? string  Preferred alternative function.
---@param version      string  Version in which the deprecated function will be removed.
---@param plugin?      string  Plugin name that the function will be removed from. Defaults to "Nvim".
---@param backtrace?   boolean Prints backtrace. Defaults to true.
function vim.deprecated(name, alternative, version, plugin, backtrace) end

return vim
