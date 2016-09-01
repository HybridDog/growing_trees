-------------------------------------------------------------------------------
-- name: printpos(pos)
--
-- action: convert pos to string of type "(X,Y,Z)"
--
-- param1: position to convert
-- retval: string with coordinates of pos
-------------------------------------------------------------------------------
function printpos(pos)
	if pos ~= nil then
		if pos.y ~= nil then
			return "("..pos.x..","..pos.y..","..pos.z..")"
		else
			return "("..pos.x..", ? ,"..pos.z..")"
		end
	end
	return ""
end


-------------------------------------------------------------------------------
-- name: issamepos(pos1,pos2)
--
-- @brief check if two 3d positions are equal
--
-- @param pos1 position one
-- @param pos2 position two
-- @return true/false
-------------------------------------------------------------------------------
function issamepos(pos1,pos2) 
	
	if (pos1 == nil) or
		(pos2 == nil) and
		(pos1 ~= pos2) then
		return false
	end
	
	if (pos1.x == pos2.x) and
	   (pos1.y == pos2.y) and
	   (pos1.z == pos2.z) then
	   return true
	end
	
	return false
end


-------------------------------------------------------------------------------
-- name: contains(table_to_check,position)
--
-- @brief check if a table contains a specific position
--
-- @param table_to_check table to search in
-- @param position position to search
-- @return true/false
-------------------------------------------------------------------------------
function contains(table_to_check,position) 
	for i,v in ipairs(table_to_check) do
		if issamepos(v,position) then
			return true
		end
	end
	
	return false

end

-------------------------------------------------------------------------------
-- name: contains_name(table_to_check,name)
--
-- @brief check if a table contains a specific element
--
-- @param table_to_check table or string to search in
-- @param name name to search
-- @return true/false
-------------------------------------------------------------------------------
function contains_name(table_to_check,name)
    if type(table_to_check) == "table" then
        for i,v in ipairs(table_to_check) do
            if v == name then
                return true
            end
        end

    else
        if table_to_check == name then 
            return true
        end
    end
    
    return false

end



-------------------------------------------------------------------------------
-- name: growing_trees_is_tree_structure(pos)
--
-- @brief check if node at pos a tree structure (leaves don't count as structure)
--
-- @param pos position to check
-- @return true/false
-------------------------------------------------------------------------------
-- 
function growing_trees_is_tree_structure(pos)
	local node = minetest.env:get_node(pos)
	
	if node == nil then
		return false
	end
	
	if node.name == "growing_trees:trunk" or
		growing_trees_is_branch_structure(node.name) or
		node.name == "growing_trees:sprout" or
		node.name == "growing_trees:branch_sprout" then
		return true
	end
	
	return false
end


-------------------------------------------------------------------------------
-- name: growing_trees_is_branch_structure(name)
--
-- @brief check if a nodename matches a branch structure
--
-- @param name nodename to check
-- @return true/false
-------------------------------------------------------------------------------

branch_nodes = {
            "growing_trees:branch",
            "growing_trees:branch_ukn",
            "growing_trees:branch_zz",
            "growing_trees:branch_xx",
            "growing_trees:branch_xpzp",
            "growing_trees:branch_xpzm",
            "growing_trees:branch_xmzp",
            "growing_trees:branch_xmzm",
            }

function growing_trees_is_branch_structure(name)
    if contains_name(branch_nodes,name) then
        return true
    end
    
    return false
end