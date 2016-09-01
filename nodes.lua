-------------------------------------------------------------------------------
-- Growing Trees Mod by Sapier
-- 
-- License GPLv3
--
--! @file nodes.lua
--! @brief file containing node definitions
--! mod
--! @copyright Sapier
--! @author Sapier
--! @date 2012-09-04
--
-- Contact sapier a t gmx net
-------------------------------------------------------------------------------

local textures_trunk = {"default_tree_top.png", "default_tree_top.png", "default_tree.png"}
local textures_branch = {"default_tree_top.png", "default_tree_top.png", "default_tree.png"}


minetest.register_node("growing_trees:sprout", {
    description = "Trunk-Sprout (growing_trees)",
    drawtype = "allfaces_optional",
    visual_scale = 1.3,
    tiles = {"default_leaves.png"},
    paramtype = "light",
    groups = {snappy=3},
    drop = {
        max_items = 1,
        items = {
            {
                -- player will get sapling with 1/20 chance
                items = {'growing_trees:sapling'},
                rarity = 20,
            },
            {
                -- player will get leaves only if he get no saplings,
                -- this is because max_items is 1
                items = {'default:leaves'},
            }
        }
    },
    sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("growing_trees:leaves", {
    description = "Leaves (growing_trees)",
    drawtype = "allfaces_optional",
    visual_scale = 1.3,
    tiles = {"default_leaves.png"},
    paramtype = "light",
    groups = {snappy=3},
    drop = {
        max_items = 1,
        items = {
            {
                -- player will get sapling with 1/20 chance
                items = {'growing_trees:sapling'},
                rarity = 20,
            },
            {
                -- player will get leaves only if he get no saplings,
                -- this is because max_items is 1
                items = {'default:leaves'},
            }
        }
    },
    sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("growing_trees:branch_sprout", {
    description = "Leaves-Sprout (growing_trees)",
    drawtype = "allfaces_optional",
    visual_scale = 1.3,
    tiles = {"default_leaves.png"},
    paramtype = "light",
    groups = {snappy=3},
    drop = {
        max_items = 1,
        items = {
            {
                -- player will get sapling with 1/20 chance
                items = {'growing_trees:sapling'},
                rarity = 20,
            },
            {
                -- player will get leaves only if he get no saplings,
                -- this is because max_items is 1
                items = {'default:leaves'},
            }
        }
    },
    sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("growing_trees:trunk", {
    description = "Trunk (growing_trees)",
    paramtype = "light",
    tiles = textures_trunk,
    is_ground_content = true,
    drawtype = "nodebox",
    node_box = {
        type = "fixed",
        fixed = {
            {-0.35,-0.5,-0.4,0.35,0.5,0.4},
            {-0.4,-0.5,-0.35, 0.4,0.5,0.35},
            {-0.25,-0.5,-0.45,0.25,0.5,0.45},
            {-0.45,-0.5,-0.25, 0.45,0.5,0.25},
            {-0.15,-0.5,-0.5,0.15,0.5,0.5},
            {-0.5,-0.5,-0.15, 0.5,0.5,0.15},
        },
    },
    groups = {
        tree = 1,
        snappy = 1,
        choppy = 2,
        oddly_breakable_by_hand = 1,
        flammable = 2
    },
    sounds = default.node_sound_wood_defaults(),
    drop =  "default:tree"
})

minetest.register_node("growing_trees:branch", {
    description = "Branch (growing_trees)",
    drawtype = "nodebox",
    tiles = textures_branch,
    paramtype = "light",
    is_ground_content = true,
    walkable = true,
    node_box = {
            type = "fixed",
            fixed = nodebox_branch_ukn,
    },
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=1,flammable=2,tree=1},
    sounds = default.node_sound_wood_defaults(),
    drop =  "default:tree"
})

minetest.register_node("growing_trees:branch_xmzm", {
    description = "Branch (growing_trees)",
    drawtype = "nodebox",
    tiles = textures_branch,
    paramtype = "light",
    is_ground_content = true,
    walkable = true,
    node_box = {
            type = "fixed",
            fixed = nodebox_branch_xmzm,
    },
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=1,flammable=2,tree=1},
    sounds = default.node_sound_wood_defaults(),
    drop =  "default:tree"
})

minetest.register_node("growing_trees:branch_xpzm", {
    description = "Branch (growing_trees)",
    drawtype = "nodebox",
    tiles = textures_branch,
    paramtype = "light",
    is_ground_content = true,
    walkable = true,
    node_box = {
            type = "fixed",
            fixed = nodebox_branch_xpzm,
    },
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=1,flammable=2,tree=1},
    sounds = default.node_sound_wood_defaults(),
    drop =  "default:tree"
})

minetest.register_node("growing_trees:branch_xmzp", {
    description = "Branch (growing_trees)",
    drawtype = "nodebox",
    tiles = textures_branch,
    paramtype = "light",
    is_ground_content = true,
    walkable = true,
    node_box = {
            type = "fixed",
            fixed = nodebox_branch_xmzp,
    },
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=1,flammable=2,tree=1},
    sounds = default.node_sound_wood_defaults(),
    drop =  "default:tree"
})

minetest.register_node("growing_trees:branch_xpzp", {
    description = "Branch (growing_trees)",
    drawtype = "nodebox",
    tiles = textures_branch,
    paramtype = "light",
    is_ground_content = true,
    walkable = true,
    node_box = {
            type = "fixed",
            fixed = nodebox_branch_xpzp,
    },
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=1,flammable=2,tree=1},
    sounds = default.node_sound_wood_defaults(),
    drop =  "default:tree"
})

minetest.register_node("growing_trees:branch_zz", {
    description = "Branch (growing_trees)",
    drawtype = "nodebox",
    tiles = textures_branch,
    paramtype = "light",
    is_ground_content = true,
    walkable = true,
    node_box = {
            type = "fixed",
            fixed = nodebox_branch_zz,
    },
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=1,flammable=2,tree=1},
    sounds = default.node_sound_wood_defaults(),
    drop =  "default:tree"
})

minetest.register_node("growing_trees:branch_xx", {
    description = "Branch (growing_trees)",
    drawtype = "nodebox",
    tiles = textures_branch,
    paramtype = "light",
    is_ground_content = true,
    walkable = true,
    node_box = {
            type = "fixed",
            fixed = nodebox_branch_xx,
    },
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=1,flammable=2,tree=1},
    sounds = default.node_sound_wood_defaults(),
    drop =  "default:tree"
})

--minetest.register_node("growing_trees:branch", {
--    description = "Branch (growing_trees)",
--    tile_images = {"default_tree_top.png", "default_tree_top.png", "default_tree.png"},
--    is_ground_content = true,
--    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=1,flammable=2,tree=1},
--    sounds = default.node_sound_wood_defaults(),
--    drop =  "default:tree"
--})