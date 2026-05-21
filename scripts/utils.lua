-- from https://stackoverflow.com/questions/9168058/how-to-dump-a-table-to-console
-- dumps a table in a readable string
function has(item, amount)
	local count = Tracker:ProviderCountForCode(item)
	amount = tonumber(amount)
	if not amount then
		return count > 0
	else
		return count >= amount
	end
end

function dump_table(o, depth)
    if depth == nil then
        depth = 0
    end
    if type(o) == 'table' then
        local tabs = ('\t'):rep(depth)
        local tabs2 = ('\t'):rep(depth + 1)
        local s = '{\n'
        for k, v in pairs(o) do
            if type(k) ~= 'number' then
                k = '"' .. k .. '"'
            end
            s = s .. tabs2 .. '[' .. k .. '] = ' .. dump_table(v, depth + 1) .. ',\n'
        end
        return s .. tabs .. '}'
    else
        return tostring(o)
    end
end

function is_slot_2_level(location_id)
    return location_id >= 2658100 and location_id <= 2658200
end

update_layout = true

function toggle_items()
    update_layout = true
end

function get_pad_size(base_size, conditions)
    local size = base_size
    for _, condition in ipairs(conditions) do
        if not condition then
            size = size + 1
        end
    end
    return size
end

function layout_update_worlds(show_destiny_islands, show_atlantica, show_eotw)
    if show_destiny_islands then
        Tracker:AddLayouts("layouts/worlds/destiny_islands_show.json")
    else
        Tracker:AddLayouts("layouts/worlds/destiny_islands_hide.json")
    end
    if show_atlantica then
        Tracker:AddLayouts("layouts/worlds/atlantica_show.json")
    else
        Tracker:AddLayouts("layouts/worlds/atlantica_hide.json")
    end
    if show_eotw then
        Tracker:AddLayouts("layouts/worlds/eotw_show.json")
    else
        Tracker:AddLayouts("layouts/worlds/eotw_hide.json")
    end

    if IS_HORIZONTAL then
        local max_icons = 3
        if show_destiny_islands or show_atlantica then
            max_icons = 4
        end
        local row_1_pad_size = get_pad_size(0, {show_destiny_islands or max_icons == 3})
        Tracker:AddLayouts("layouts/padding/worlds_row_1_pad_" .. row_1_pad_size .. ".json")
        local row_2_pad_size = get_pad_size(0, {show_atlantica or max_icons == 3})
        Tracker:AddLayouts("layouts/padding/worlds_row_2_pad_" .. row_2_pad_size .. ".json")
        local row_3_pad_size = get_pad_size(0, {show_eotw, max_icons == 3})
        Tracker:AddLayouts("layouts/padding/worlds_row_3_pad_" .. row_3_pad_size .. ".json")
    else
        local row_1_pad_size = get_pad_size(0, {show_destiny_islands})
        Tracker:AddLayouts("layouts/padding/worlds_row_1_pad_" .. row_1_pad_size .. ".json")
        local row_2_pad_size = get_pad_size(3, {show_atlantica, show_eotw})
        Tracker:AddLayouts("layouts/padding/worlds_row_2_pad_" .. row_2_pad_size .. ".json")
    end
end

function layout_update_world_keys(show_world_keys, show_jack_box, show_atlantica, show_cups, show_final_door_key)
    local world_keys_hidden = false
    if show_world_keys then
        Tracker:AddLayouts("layouts/world_keys/group_show_all.json")
        if show_jack_box then
            Tracker:AddLayouts("layouts/world_keys/jack_box_show.json")
        else
            Tracker:AddLayouts("layouts/world_keys/jack_box_hide.json")
        end
        if show_atlantica then
            Tracker:AddLayouts("layouts/world_keys/trident_show.json")
        else
            Tracker:AddLayouts("layouts/world_keys/trident_hide.json")
        end
    end
    if show_cups or show_final_door_key then
        if not show_world_keys then
            Tracker:AddLayouts("layouts/world_keys/group_show_cups_door.json")
        end
        if show_cups then
            Tracker:AddLayouts("layouts/world_keys/cups_show.json")
        else
            Tracker:AddLayouts("layouts/world_keys/cups_hide.json")
        end
        if show_final_door_key then
            Tracker:AddLayouts("layouts/world_keys/final_door_key_show.json")
        else
            Tracker:AddLayouts("layouts/world_keys/final_door_key_hide.json")
        end
    elseif show_world_keys then
        Tracker:AddLayouts("layouts/world_keys/cups_hide.json")
        Tracker:AddLayouts("layouts/world_keys/final_door_key_hide.json")
    else
        world_keys_hidden = true
        Tracker:AddLayouts("layouts/world_keys/group_hide.json")
    end

    if not world_keys_hidden then
        if IS_HORIZONTAL then
            local max_icons = 3
            if (show_jack_box and show_atlantica) or (show_cups and show_final_door_key) then
                max_icons = 4
            end
            local row_1_pad_size = get_pad_size(0, {max_icons == 3})
            Tracker:AddLayouts("layouts/padding/world_keys_row_1_pad_" .. row_1_pad_size .. ".json")
            local row_2_pad_size = get_pad_size(-1, {show_jack_box, show_atlantica, max_icons == 3})
            Tracker:AddLayouts("layouts/padding/world_keys_row_2_pad_" .. row_2_pad_size .. ".json")
            local row_cups_door_pad_size = 0
            if show_world_keys then
                row_cups_door_pad_size = get_pad_size(-1, {show_cups, show_cups, show_cups, show_final_door_key, max_icons == 3})
            elseif not show_cups then
                row_cups_door_pad_size = 1
            end
            Tracker:AddLayouts("layouts/padding/world_keys_row_cups_door_pad_" .. row_cups_door_pad_size .. ".json")
        else
            local row_1_pad_size = get_pad_size(0, {show_jack_box, show_atlantica})
            Tracker:AddLayouts("layouts/padding/world_keys_row_1_pad_" .. row_1_pad_size .. ".json")
            local row_cups_door_pad_size = get_pad_size(3, {show_cups, show_cups, show_cups, show_final_door_key})
            Tracker:AddLayouts("layouts/padding/world_keys_row_cups_door_pad_" .. row_cups_door_pad_size .. ".json")
        end
    end
end

function layout_update_keyblades(show_keyblades, show_destiny_islands, show_100_acre, show_atlantica)
    if show_keyblades then
        Tracker:AddLayouts("layouts/keyblades/group_show.json")
        if show_destiny_islands then
            Tracker:AddLayouts("layouts/keyblades/oathkeeper_show.json")
        else
            Tracker:AddLayouts("layouts/keyblades/oathkeeper_hide.json")
        end
        if show_100_acre then
            Tracker:AddLayouts("layouts/keyblades/spellbinder_show.json")
        else
            Tracker:AddLayouts("layouts/keyblades/spellbinder_hide.json")
        end
        if show_atlantica then
            Tracker:AddLayouts("layouts/keyblades/crabclaw_show.json")
        else
            Tracker:AddLayouts("layouts/keyblades/crabclaw_hide.json")
        end

        if IS_HORIZONTAL then
            local pad_size = get_pad_size(2, {show_destiny_islands, show_100_acre, show_atlantica})
            Tracker:AddLayouts("layouts/padding/keyblades_row_3_pad_" .. pad_size .. ".json")
        else
            local row_1_pad_size = get_pad_size(0, {show_destiny_islands, show_100_acre})
            Tracker:AddLayouts("layouts/padding/keyblades_row_1_pad_" .. row_1_pad_size .. ".json")
            local row_2_pad_size = get_pad_size(1, {show_atlantica})
            Tracker:AddLayouts("layouts/padding/keyblades_row_2_pad_" .. row_2_pad_size .. ".json")
        end
    else
        Tracker:AddLayouts("layouts/keyblades/group_hide.json")
    end
end

function layout_update_collectibles(show_lucky_emblems, show_destiny_islands, show_100_acre)
    if show_lucky_emblems then
        Tracker:AddLayouts("layouts/collectibles/lucky_emblems_show.json")
    else
        Tracker:AddLayouts("layouts/collectibles/lucky_emblems_hide.json")
    end
    if show_destiny_islands then
        Tracker:AddLayouts("layouts/collectibles/raft_materials_show.json")
    else
        Tracker:AddLayouts("layouts/collectibles/raft_materials_hide.json")
    end
    if show_100_acre then
        Tracker:AddLayouts("layouts/collectibles/torn_pages_show.json")
    else
        Tracker:AddLayouts("layouts/collectibles/torn_pages_hide.json")
    end

    if IS_HORIZONTAL then
        local row_1_pad_size = get_pad_size(0, {show_lucky_emblems, show_destiny_islands})
        Tracker:AddLayouts("layouts/padding/collectibles_row_1_pad_" .. row_1_pad_size .. ".json")
        local row_3_pad_size = get_pad_size(1, {show_100_acre})
        Tracker:AddLayouts("layouts/padding/collectibles_row_3_pad_" .. row_3_pad_size .. ".json")
    else
        local row_1_pad_size = get_pad_size(0, {show_lucky_emblems, show_destiny_islands, show_100_acre})
        Tracker:AddLayouts("layouts/padding/collectibles_row_1_pad_" .. row_1_pad_size .. ".json")
    end
end

function tracker_layout_update()
    if update_layout then
        local show_keyblades = Tracker:FindObjectForCode("keyblade_locks").CurrentStage == 1
        local show_world_keys = Tracker:FindObjectForCode("stacking_world_items").CurrentStage == 0
        local show_jack_box = Tracker:FindObjectForCode("halloween_town_key_item_bundle").CurrentStage == 0
        local show_destiny_islands = Tracker:FindObjectForCode("destiny_islands_checks").CurrentStage == 1
        local show_100_acre = Tracker:FindObjectForCode("100_acre_checks").CurrentStage == 1
        local show_atlantica = Tracker:FindObjectForCode("atlantica_checks").CurrentStage == 1
        local show_eotw = Tracker:FindObjectForCode("eotw_unlock").CurrentStage == 0
        local goal_status = Tracker:FindObjectForCode("goal").CurrentStage
        local show_cups = Tracker:FindObjectForCode("cups").CurrentStage ~= 0 or Tracker:FindObjectForCode("superbosses").CurrentStage == 1 or goal_status == 0
        local show_lucky_emblems = goal_status == 3 or not show_eotw
        local show_final_door_key = goal_status ~= 3

        layout_update_worlds(show_destiny_islands, show_atlantica, show_eotw)
        layout_update_world_keys(show_world_keys, show_jack_box, show_atlantica, show_cups, show_final_door_key)
        layout_update_keyblades(show_keyblades, show_destiny_islands, show_100_acre, show_atlantica)
        layout_update_collectibles(show_lucky_emblems, show_destiny_islands, show_100_acre)

        update_layout = false
    end
end