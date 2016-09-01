-------------------------------------------------------------------------------
-- Growing Trees Mod by Sapier
-- 
-- License GPLv3
--
--! @file abms.lua
--! @brief file containing abms doing growing
--! mod
--! @copyright Sapier
--! @author Sapier
--! @date 2012-09-04
--
-- Contact sapier a t gmx net
-------------------------------------------------------------------------------


-------------------------------------------------------------------------------
--
-- grow trunk abm
--
-------------------------------------------------------------------------------
minetest.register_abm({
        nodenames = { "growing_trees:sprout" },
        interval = 10,
        chance = 5,
        action = function(pos, node, active_object_count, active_object_count_wider)

            --print("Sprout abm called " .. os.time(os.date('*t')));
            
            local trunktop = growing_trees_get_trunk_below(pos)
            
            if trunktop == nil then
                print("ERROR sprout not ontop of tree")
                return
            end
            
            local treesize,tree_root = growing_trees_get_tree_size(trunktop)
            
            --print("Treesize: " .. treesize)
            
            --reduce growing speed for trees larger then 10
            if (treesize > 10 ) then
                if math.random() > 1/treesize then
                    return
                end
            end
            

            local grown = false

            if math.random() > 0.2 then
                --print("growing straight")
                local pos_above = {x= pos.x,y=pos.y+1,z=pos.z}
                
                local node_above = minetest.env:get_node(pos_above)
                
                if node_above.name == "air" or
                    node_above.name == "growing_trees:leaves" then
                    
                    minetest.env:remove_node(pos)
                    minetest.env:add_node(pos,{type=node,name="growing_trees:trunk"})
                    minetest.env:add_node(pos_above,{type=node,name="growing_trees:sprout"})
                
                    grown = true
                end
            end
            
            if not grown then
                if growing_trees_next_to(pos,"growing_trees:trunk") == false then
                    --print("growing horizontaly")
                    --decide which direction to grow trunk
                    local pos_to_grow_to = growing_trees_get_random_next_to(pos)
    
                    --check if pos is feasable
                    --TODO
                    
                    minetest.env:remove_node(pos)
                    minetest.env:add_node(pos,{type=node,name="growing_trees:trunk"})
                    
                    minetest.env:add_node(pos_to_grow_to,{type=node,name="growing_trees:sprout"})
                    
                    grown = true
                else
                    print("Not growing horizontaly twice")
                end
            end

        end
    })
    

-------------------------------------------------------------------------------
--
-- create branch abm
--
-------------------------------------------------------------------------------
minetest.register_abm({
        nodenames = { "growing_trees:trunk" },
        interval = 10,
        chance = 5,
        
        action = function(pos, node, active_object_count, active_object_count_wider)
            
                --print("Add branch sprout abm called")
            
                local treesize,tree_root = growing_trees_get_tree_size(pos)
                
                --don't add branches to trees to small
                if treesize < 5 then
                    return
                end
                
                local growpos = growing_trees_get_random_next_to(pos)
                
                if growing_trees_is_tree_structure(growpos) == false then
                
                    local distance = growing_trees_min_distance(growpos)
                    
                    --print("branch sprout add function, distance to ground: " .. distance)
                    
                    if distance > 2 and
                        growing_trees_next_to_branch(growpos,nil) == false then
                        minetest.env:remove_node(growpos)
                        minetest.env:add_node(growpos,{type=node,name="growing_trees:branch_sprout"})
                    end
                
                end
        end
    })

-------------------------------------------------------------------------------
--
-- grow branch abm
--
-------------------------------------------------------------------------------
minetest.register_abm({
        nodenames = { "growing_trees:branch_sprout" },
        interval = 10,
        chance = 5,
        
        action = function(pos, node, active_object_count, active_object_count_wider)
        
            --print("Add branch abm called")
            --TODO add chance to grow up
            local growpos = growing_trees_get_brach_growpos(pos)
            local node_at_pos = minetest.env:get_node(growpos)
            
            local tree_structure = growing_trees_is_tree_structure(growpos)
            local next_to_branch = growing_trees_next_to_branch(growpos,pos)
            
            if  tree_structure == false and
                next_to_branch == false then
            
                
                --print("valid growing pos found:" .. printpos(growpos) .. " -> " .. node_at_pos.name )
                
                local branch = {}
            
                local distance_from_trunk,treesize,tree_root = growing_trees_get_distance_from_trunk(pos,branch)
                local top_distance = (tree_root.y + treesize) - pos.y
                --print ("Treesize: " .. treesize .. " Distance: " .. distance_from_trunk)
                
                if (top_distance < 0) then
                    growing_trees_debug("error","Growing_Trees: top_distance calculation wrong")
                    top_distance = treesize
                end
                
                if treesize ~= 0 and
                    distance_from_trunk < treesize/4 and
                    ((top_distance > treesize/8) or (distance_from_trunk < top_distance)) 
                    then
                    minetest.env:remove_node(pos)
                    minetest.env:add_node(pos,{type=node,name="growing_trees:branch"})
                    minetest.env:remove_node(growpos)
                    minetest.env:add_node(growpos,{type=node,name="growing_trees:branch_sprout"})
                end
            else
                --TODO check why this happens
                growing_trees_debug("info","Position " .. printpos(growpos) .. " invalid to grow branch to ts: " .. dump(tree_structure) .. " ntb: " ..dump(next_to_branch))
            end
        end
        })

-------------------------------------------------------------------------------
--
-- remove leaves abm
--
-------------------------------------------------------------------------------
minetest.register_abm({
        nodenames = { "growing_trees:leaves" },
        interval = 10,
        chance = 5,
        
        action = function(pos, node, active_object_count, active_object_count_wider)
        
                if math.random() < 0.3 then 
                    minetest.env:remove_node(pos)
                end
            end
            
        })

-------------------------------------------------------------------------------
--
-- grow leaves abms
--
-------------------------------------------------------------------------------
minetest.register_abm({
        nodenames = { "growing_trees:sprout" },
        interval = 10,
        chance = 5,
        action = function(pos, node, active_object_count, active_object_count_wider)
             growing_trees_grow_sprout_leaves(pos)
        end
        })

minetest.register_abm({
        nodenames = branch_nodes,
        interval = 10,
        chance = 5,
        action = function(pos, node, active_object_count, active_object_count_wider)
                growing_trees_grow_leaves(pos)
            end
            
        })


-------------------------------------------------------------------------------
--
-- replace unknown branches abm
--
-------------------------------------------------------------------------------
minetest.register_abm({
        nodenames = { "growing_trees:branch" },
        interval = 10,
        chance = 1,
        action = function(pos, node, active_object_count, active_object_count_wider)
                
                local branch_type = growing_trees_get_branch_type(pos)
                
                if branch_type == "xx" then
                    minetest.env:remove_node(pos)
                    minetest.env:add_node(pos,{type=node,name="growing_trees:branch_xx"})
                end
                
                if branch_type == "zz" then
                    minetest.env:remove_node(pos)
                    minetest.env:add_node(pos,{type=node,name="growing_trees:branch_zz"})
                end
                
                if branch_type == "xpzp" then
                    minetest.env:remove_node(pos)
                    minetest.env:add_node(pos,{type=node,name="growing_trees:branch_xpzp"})
                end
                
                if branch_type == "xpzm" then
                    minetest.env:remove_node(pos)
                    minetest.env:add_node(pos,{type=node,name="growing_trees:branch_xpzm"})
                end
                
                if branch_type == "xmzp" then
                    minetest.env:remove_node(pos)
                    minetest.env:add_node(pos,{type=node,name="growing_trees:branch_xmzp"})
                end
                
                if branch_type == "xmzm" then
                    minetest.env:remove_node(pos)
                    minetest.env:add_node(pos,{type=node,name="growing_trees:branch_xmzm"})
                end
                
            end
            
        })