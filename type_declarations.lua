-------------------------------------------------------------------------------
-- Growing Trees Mod by Sapier
--
-- License GPLv3
--
--! @file type_declarations.lua
--! @brief file containing node to type mappings
--! @copyright Sapier
--! @author Sapier
--! @date 2012-09-04
--
-- Contact sapier a t gmx net
-------------------------------------------------------------------------------

branch_type = {
	"growing_trees:branch",
	"growing_trees:branch_ukn",
	"growing_trees:branch_zz",
	"growing_trees:branch_xx",
	"growing_trees:branch_xpzp",
	"growing_trees:branch_xpzm",
	"growing_trees:branch_xmzp",
	"growing_trees:branch_xmzm",
	"growing_trees:branch_sprout",
}

branch_static_type = {
	"growing_trees:branch",
	"growing_trees:branch_ukn",
	"growing_trees:branch_zz",
	"growing_trees:branch_xx",
	"growing_trees:branch_xpzp",
	"growing_trees:branch_xpzm",
	"growing_trees:branch_xmzp",
	"growing_trees:branch_xmzm",
}

trunk_type = {
	"growing_trees:trunk_top",
	"growing_trees:trunk",
	"growing_trees:medium_trunk",
	"growing_trees:big_trunk",
	"growing_trees:trunk_sprout"
}

trunk_static_type = {
	"growing_trees:trunk",
	"growing_trees:medium_trunk",
	"growing_trees:big_trunk",
}

leaves_type = {
	"growing_trees:leaves"
}

-------------------------------------------------------------------------------
-- name: table.contains(table_to_check,name)
--
-- @brief check if a table contains a specific element
--
-- @param table_to_check table or string to search in
-- @param name name to search
-- @return true/false
-------------------------------------------------------------------------------
table.contains = table.contains or function(type_declaration, name)
	for i = 1,#type_declaration do
		if type_declaration[i] == name then
			return true
		end
	end
	return false
end
