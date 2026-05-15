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

-- TODO: is this the best location for this global variable?
update_layout = false

function toggle_items()
    update_layout = true
end

-- TODO: add support for more of the layout being updatable.
function tracker_layout_update()
    if update_layout then
        local show_destiny_islands_items = Tracker:FindObjectForCode("destiny_islands_checks").CurrentStage == 1
        local show_world_keys = Tracker:FindObjectForCode("stacking_world_items").CurrentStage == 0
        local show_keyblades = Tracker:FindObjectForCode("keyblade_locks").CurrentStage == 1

        -- TODO: these calls outside of the if statements should probably be done on initial load only.
        Tracker:AddLayouts("layouts/keyblades/row_3/crabclaw_show.json")
        Tracker:AddLayouts("layouts/keyblades/row_3/spellbinder_show.json")
        Tracker:AddLayouts("layouts/keyblades/row_1.json")
        Tracker:AddLayouts("layouts/keyblades/row_2.json")
        Tracker:AddLayouts("layouts/keyblades/row_3.json")
        Tracker:AddLayouts("layouts/worlds/row_2.json")
        Tracker:AddLayouts("layouts/worlds/row_3.json")
        if show_destiny_islands_items then
            -- TODO: also hide/show raft materials
            Tracker:AddLayouts("layouts/worlds/row_1_di_show.json")
            Tracker:AddLayouts("layouts/keyblades/row_3/oathkeeper_show.json")
        else
            Tracker:AddLayouts("layouts/worlds/row_1_di_hide.json")
            Tracker:AddLayouts("layouts/keyblades/row_3/oathkeeper_hide.json")
        end
        if show_world_keys then
            Tracker:AddLayouts("layouts/world_keys_show.json")
        else
            Tracker:AddLayouts("layouts/world_keys_hide.json")
        end
        if show_keyblades then
            Tracker:AddLayouts("layouts/keyblades_show.json")
        else
            Tracker:AddLayouts("layouts/keyblades_hide.json")
        end
        update_layout = false
    end
end