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

--is element in table
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
-- name: growing_trees_is_tree_structure(pos)
--
-- @brief check if node at pos a tree structure (leaves don't count as structure)
--
-- @param pos position to check
-- @return true/false
-------------------------------------------------------------------------------
--
function growing_trees_is_tree_structure(pos)
	local nodename = minetest.get_node(pos).name
	return table.contains(trunk_type, nodename)
		or table.contains(branch_type, nodename)
end


-------------------------------------------------------------------------------
-- name: growing_trees_get_surface(x,z, min_y, max_y)
--
--! @brief get surface for x/z coordinates
--
--! @param x x-coordinate
--! @param z z-coordinate
--! @param min_y minimum y-coordinate to consider
--! @param max_y maximum y-coordinate to consider
--! @return y value of surface or nil
-------------------------------------------------------------------------------
function growing_trees_get_surface(x,z, min_y, max_y)
    for runy = min_y, max_y do
        if minetest.get_node{x=x, y=runy, z=z}.name == "default:dirt_with_grass" then
            return runy
        end
    end
end

-------------------------------------------------------------------------------
-- name: growing_trees_neighbour_positions(pos,ynodes_too)
--
--! @brief get positions of positions sharing a side with pos
--
--! @param pos position to get surrounding positions
--! @param ynodes_too get y neighbours too
--! @return table of positions
-------------------------------------------------------------------------------
function growing_trees_neighbour_positions(pos,ynodes_too)
	local retval = {
		{x=pos.x-1,y=pos.y,z=pos.z},
		{x=pos.x+1,y=pos.y,z=pos.z},
		{x=pos.x,y=pos.y,z=pos.z+1},
		{x=pos.x,y=pos.y,z=pos.z-1}
	}
	if ynodes_too then
		retval[5] = {x=pos.x,y=pos.y+1,z=pos.z}
		retval[6] = {x=pos.x,y=pos.y-1,z=pos.z}
	end

	return retval
end
