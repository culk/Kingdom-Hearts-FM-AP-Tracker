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

update_layout = true

function toggle_items()
    update_layout = true
end

function layout_update_worlds(show_destiny_islands, show_atlantica, show_eotw)
    if show_destiny_islands then
        Tracker:AddLayouts("layouts/worlds/row_1_di_show.json")
    else
        Tracker:AddLayouts("layouts/worlds/row_1_di_hide.json")
    end
    if show_atlantica then
        Tracker:AddLayouts("layouts/worlds/row_2_at_show.json")
    else
        Tracker:AddLayouts("layouts/worlds/row_2_at_hide.json")
    end
    if show_eotw then
        Tracker:AddLayouts("layouts/worlds/row_3_eotw_show.json")
    else
        Tracker:AddLayouts("layouts/worlds/row_3_eotw_hide.json")
    end
end

function layout_update_world_keys(show_world_keys, show_jack_box, show_atlantica, show_cups, show_final_door_key)
    if show_world_keys then
        Tracker:AddLayouts("layouts/world_keys_show_all.json")
        Tracker:AddLayouts("layouts/world_keys/row_1.json")
        Tracker:AddLayouts("layouts/world_keys/row_2.json")
        Tracker:AddLayouts("layouts/world_keys/row_2/forget_me_not_show.json")
        Tracker:AddLayouts("layouts/world_keys/row_2/theon_6_show.json")
        if show_jack_box then
            Tracker:AddLayouts("layouts/world_keys/row_2/jack_box_show.json")
        else
            Tracker:AddLayouts("layouts/world_keys/row_2/jack_box_hide.json")
        end
        if show_atlantica then
            Tracker:AddLayouts("layouts/world_keys/row_2/trident_show.json")
        else
            Tracker:AddLayouts("layouts/world_keys/row_2/trident_hide.json")
        end
    end
    if show_cups or show_final_door_key then
        if not show_world_keys then
            Tracker:AddLayouts("layouts/world_keys_show_cups_door.json")
        end
        Tracker:AddLayouts("layouts/world_keys/row_3.json")
        if show_cups then
            Tracker:AddLayouts("layouts/world_keys/row_3/cups_show.json")
        else
            Tracker:AddLayouts("layouts/world_keys/row_3/cups_hide.json")
        end
        if show_final_door_key then
            Tracker:AddLayouts("layouts/world_keys/row_3/final_door_key_show.json")
        else
            Tracker:AddLayouts("layouts/world_keys/row_3/final_door_key_hide.json")
        end
    elseif show_world_keys then
        Tracker:AddLayouts("layouts/world_keys/row_3/cups_hide.json")
        Tracker:AddLayouts("layouts/world_keys/row_3/final_door_key_hide.json")
    else
        Tracker:AddLayouts("layouts/world_keys_hide.json")
    end
end

function layout_update_keyblades(show_keyblades, show_destiny_islands, show_100_acre, show_atlantica)
    if show_keyblades then
        Tracker:AddLayouts("layouts/keyblades_show.json")
        Tracker:AddLayouts("layouts/keyblades/row_1.json")
        Tracker:AddLayouts("layouts/keyblades/row_2.json")
        Tracker:AddLayouts("layouts/keyblades/row_3.json")
        if show_destiny_islands then
            Tracker:AddLayouts("layouts/keyblades/row_3/oathkeeper_show.json")
        else
            Tracker:AddLayouts("layouts/keyblades/row_3/oathkeeper_hide.json")
        end
        if show_100_acre then
            Tracker:AddLayouts("layouts/keyblades/row_3/spellbinder_show.json")
        else
            Tracker:AddLayouts("layouts/keyblades/row_3/spellbinder_hide.json")
        end
        if show_atlantica then
            Tracker:AddLayouts("layouts/keyblades/row_3/crabclaw_show.json")
        else
            Tracker:AddLayouts("layouts/keyblades/row_3/crabclaw_hide.json")
        end
    else
        Tracker:AddLayouts("layouts/keyblades_hide.json")
    end
end

function layout_update_collectibles(show_lucky_emblems, show_destiny_islands, show_100_acre)
    Tracker:AddLayouts("layouts/collectibles/row_1.json")
    Tracker:AddLayouts("layouts/collectibles/row_1/postcards_puppies_show.json")
    Tracker:AddLayouts("layouts/collectibles/row_2.json")
    if show_lucky_emblems then
        Tracker:AddLayouts("layouts/collectibles/row_1/lucky_emblems_show.json")
    else
        Tracker:AddLayouts("layouts/collectibles/row_1/lucky_emblems_hide.json")
    end
    if show_destiny_islands then
        Tracker:AddLayouts("layouts/collectibles/row_1/raft_materials_show.json")
    else
        Tracker:AddLayouts("layouts/collectibles/row_1/raft_materials_hide.json")
    end
    if show_100_acre then
        Tracker:AddLayouts("layouts/collectibles/row_3_torn_page_show.json")
    else
        Tracker:AddLayouts("layouts/collectibles/row_3_torn_page_hide.json")
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