-------------------------------------------------------------------------------
-- Growing Trees Mod by Sapier
-- 
-- License GPLv3
--
--! @file init.lua
--! @brief main module file responsible for including all parts of growing tees
--! mod
--! @copyright Sapier
--! @author Sapier
--! @date 2012-09-04
--
-- Contact sapier a t gmx net
-------------------------------------------------------------------------------
local version = "0.0.4"

local growing_trees_modpath = minetest.get_modpath("growing_trees")

dofile (growing_trees_modpath .. "/models.lua")
dofile (growing_trees_modpath .. "/trunk_functions.lua")
dofile (growing_trees_modpath .. "/branch_functions.lua")
dofile (growing_trees_modpath .. "/generic_functions.lua")
dofile (growing_trees_modpath .. "/nodes.lua")
dofile (growing_trees_modpath .. "/crafts.lua")
dofile (growing_trees_modpath .. "/model_selection.lua")
dofile (growing_trees_modpath .. "/abms.lua")
dofile (growing_trees_modpath .. "/spawning.lua")

function growing_trees_debug(loglevel,text)
    --print(text)
end

print("growing_trees mod " .. version .. " loaded")