-- Traverse Town 1st District Blue Trinity Balcony Chest
function tt_balcony_access()
   return ANY(
      ALL("blue_trinity", "glide"),
      ALL(AT_LEAST(LOGIC_PROUD), "glide"),
      ALL(AT_LEAST(LOGIC_MINIMAL), can_dumbo_skip(), "summon_anywhere"),
      ALL(AccessibilityLevel.SequenceBreak, "blue_trinity")
   )
end

-- Traverse Town Mystical House Yellow Trinity Chest
function tt_mystical_house_trinity_chest_access()
   return ANY(
      "yellow_trinity",
      ALL(AT_LEAST(LOGIC_NORMAL), HAS("high_jump", 2)),
      ALL(
         AT_LEAST(LOGIC_PROUD),
         ANY(
            "high_jump",
            ALL(can_dumbo_skip(), "summon_anywhere")
         )
      )
   )
end

-- Traverse Town Mystical House Glide Chest
function tt_mystical_house_glide_access()
   return ANY(
      "glide",
      ALL(
         AT_LEAST(LOGIC_PROUD),
         ANY(
            ALL(can_dumbo_skip(), "summon_anywhere"),
            HAS("high_jump", 3),
            ALL(
               "combo_master",
               ANY(
                  can_air_dodge(),
                  HAS("high_jump", 2),
                  ALL("high_jump", HAS("air_combo_plus", 2))
               )
            )
         )
      ),
      ALL(
         AT_LEAST(LOGIC_MINIMAL),
         ANY(
            "mermaid_kick",
            can_air_dodge(),
            ALL(
               "combo_master",
               ANY("high_jump", HAS("air_combo_plus", 2))
            )
         )
      )
   )
end

-- Traverse Town Moogle Workshop
function tt_moogle_workshop_access()
   return ANY(
      "green_trinity",
      ALL(
         AT_LEAST(LOGIC_PROUD),
         ANY(
            HAS("high_jump", 2),
            ALL(can_dumbo_skip(), "summon_anywhere")
         )
      )
   )
end

-- Traverse Town Item Workshop Synth 15 Items
function tt_can_synth_15()
   local orichalcum_count = Tracker:FindObjectForCode("orichalcum").AcquiredCount
   local mythril_count = Tracker:FindObjectForCode("mythril").AcquiredCount

   return math.min(orichalcum_count, 9) + math.min(mythril_count, 9) >= 15
end

-- Wonderland Queen's Castle Hedge Chests
function wl_queens_castle_hedge_access()
   return ANY(
      wl_after_footprints(),
      "high_jump",
      ALL(AT_LEAST(LOGIC_NORMAL), "glide"),
      ALL(AT_LEAST(LOGIC_PROUD), can_dumbo_skip(), "summon_anywhere")
   )
end

function wl_early_tea_access()
   return ANY(
      "glide",
      ANY(
         ALL(AT_LEAST(LOGIC_PROUD), can_air_dodge(), HAS("high_jump", 3)),
         ALL(
            AT_LEAST(LOGIC_MINIMAL),
            ANY(
               can_minimal_air_combo_jump(),
               ALL(
                  can_air_dodge(),
                  ANY(
                     HAS("high_jump", 2),
                     ALL("combo_master", "high_jump", HAS("air_combo_plus", 2))
                  )
               )
            )
         )
      )
   )
end

-- Wonderland Lotus Forest Glide Chest
function wl_lotus_forest_southwest_access()
   return ANY(
      "glide",
      ALL(
         AT_LEAST(LOGIC_PROUD),
         ANY("high_jump", can_dumbo_skip()),
         wl_after_footprints()
      ),
      wl_early_tea_access()
   )
end

-- Wonderland Lotus Forest Corner Chest
function wl_jump_and_glide_access()
   if has("high_jump") and has("glide") then
      return AccessibilityLevel.Normal
   elseif logic_difficulty_at_least_normal() and (has("high_jump") or has("glide")) then
      return AccessibilityLevel.Normal
   elseif logic_difficulty_at_least_proud() then
      return AccessibilityLevel.Normal
   end

   return AccessibilityLevel.SequenceBreak
end

-- Wonderland Tea Party Garden Above Lotus Forest Entrance 2nd Chest
-- Wonderland Tea Party Garden Above Lotus Forest Entrance 1st Chest
function wl_tea_party_entrance_hedge_access()
   return ANY(
      "glide",
      ALL(AT_LEAST(LOGIC_NORMAL), HAS("high_jump", 2), wl_after_footprints()),
      ALL(
         AT_LEAST(LOGIC_PROUD),
         ANY("high_jump", can_dumbo_skip()),
         wl_after_footprints()
      ),
      wl_early_tea_access()
   )
end

-- Wonderland Tea Party Garden Bear and Clock Puzzle Chest
function wl_tea_party_puzzle_access()
   if wl_after_footprints() or has("glide") then
      return AccessibilityLevel.Normal
   elseif logic_difficulty_at_least_minimal() and can_minimal_air_combo_jump() then
      return AccessibilityLevel.Normal
   elseif can_minimal_air_combo_jump() then
      return AccessibilityLevel.SequenceBreak
   end

   return AccessibilityLevel.None
end

-- Wonderland Tea Party Garden Chairs
function wl_tea_party_chair_access()
   return ANY(
      wl_after_footprints(),
      "glide",
      wl_early_tea_access()
   )
end

-- Wonderland Tea Party Garden Across From Bizarre Room Entrance Chest
function wl_tea_party_high_hedge_access()
   return ANY(
      "glide",
      ALL(AT_LEAST(LOGIC_NORMAL), HAS("high_jump", 3), wl_after_footprints()),
      ALL(
         AT_LEAST(LOGIC_PROUD),
         ANY(
            ALL("high_jump", "combo_master", wl_after_footprints()),
            ALL(HAS("high_jump", 2), wl_after_footprints())
         )
      ),
      wl_early_tea_access()
   )
end

-- Deep Jungle Hippo's Lagoon Right Chest
function dj_jump_and_glide_access()
   if has("high_jump") and has("glide") then
      return AccessibilityLevel.Normal
   elseif logic_difficulty_at_least_normal() and (has("high_jump") or has("glide")) then
      return AccessibilityLevel.Normal
   elseif logic_difficulty_at_least_proud() then
      return AccessibilityLevel.Normal
   end

   return AccessibilityLevel.SequenceBreak
end

-- Agrabah Main Street High Above Palace Gates Entrance Chest
function ag_high_jump_access()
   if has("high_jump") then
      return AccessibilityLevel.Normal
   elseif logic_difficulty_at_least_normal() and has("glide") then
      return AccessibilityLevel.Normal
   elseif logic_difficulty_at_least_proud() and can_dumbo_skip() then
      return AccessibilityLevel.Normal
   elseif has("glide") or can_dumbo_skip() then
      return AccessibilityLevel.SequenceBreak
   end

   return AccessibilityLevel.None
end

-- Agrabah Palace Gates High Close to Palace Chest
function ag_palace_access()
   return ANY(
      ALL("high_jump", "glide"),
      ALL(AT_LEAST(LOGIC_NORMAL), HAS("high_jump", 3)),
      ALL(
         AT_LEAST(LOGIC_PROUD),
         ANY(HAS("high_jump", 2), "glide", ALL("high_jump", "combo_master"))
      ),
      ALL(
         AT_LEAST(LOGIC_MINIMAL),
         ANY("combo_master", ALL(can_dumbo_skip(), "summon_anywhere"))
      )
   )
end

-- Agrabah Cave of Wonders Entrance Tall Tower Chest
function ag_cow_entrance_access()
   return ANY(
      "glide",
      ALL(AT_LEAST(LOGIC_NORMAL), HAS("high_jump", 2)),
      ALL(
         AT_LEAST(LOGIC_PROUD),
         ANY("combo_master", can_dumbo_skip(), "high_jump", can_air_dodge())
      ),
      AT_LEAST(LOGIC_MINIMAL)
   )
end

-- Agrabah Cave of Wonders Dark Chamber Near Save Chest
function ag_cow_near_save_access()
   if has("high_jump", 1) or has("glide", 1) then
      return AccessibilityLevel.Normal
   elseif logic_difficulty_at_least_normal() then
      return AccessibilityLevel.Normal
   end

   return AccessibilityLevel.SequenceBreak
end

-- Agrabah Cave of Wonders Hidden Room Right Chest
-- Agrabah Cave of Wonders Hidden Room Left Chest
function ag_cow_hidden_room_access()
   if has("yellow_trinity") then
      return AccessibilityLevel.Normal
   elseif logic_difficulty_at_least_normal() and has("high_jump") then
      return AccessibilityLevel.Normal
   elseif logic_difficulty_at_least_proud() and has("glide") then
      return AccessibilityLevel.Normal
   elseif has("high_jump") or has("glide") then
      return AccessibilityLevel.SequenceBreak
   end

   return AccessibilityLevel.None
end

function has_minimal_kurt_zisa_magic()
   if has("blizzard") or has("fire") or has("thunder") or has("gravity") then
      return true
   elseif has_any_magic() and has("mushu") and has("genie") and has("dumbo") then
      return true
   end
   return false
end

-- Agrabah Desert Defeat Kurt Zisa
function ag_kurt_zisa_magic_access()
   if has("blizzard", 3) then
      return AccessibilityLevel.Normal
   elseif (
      logic_difficulty_at_least_normal()
      and (has("blizzard", 2) or has("fire", 3) or has("thunder", 3) or has("gravity", 3))
   ) then
      return AccessibilityLevel.Normal
   elseif (
      logic_difficulty_at_least_proud()
      and (has("blizzard", 1) or has("fire", 2) or has("thunder", 2) or has("gravity", 2))
   ) then
      return AccessibilityLevel.Normal
   elseif logic_difficulty_at_least_minimal() and has_minimal_kurt_zisa_magic() then
      return AccessibilityLevel.Normal
   elseif has_minimal_kurt_zisa_magic() then
      return AccessibilityLevel.SequenceBreak
   end

   return AccessibilityLevel.None
end

-- Monstro Mouth High Platform Boat Side Chest
-- Monstro Mouth High Platform Across from Boat Chest
-- Monstro Mouth Green Trinity Top of Boat Chest
function mon_mouth_high_places_access()
   return ANY(
      "high_jump",
      ALL(AT_LEAST(LOGIC_NORMAL), "glide"),
      ALL(AT_LEAST(LOGIC_PROUD), can_dumbo_skip(), "summon_anywhere")
   )
end

-- Monstro Chamber 6 Other Platform Chest
function mon_chamber_6_other_platform_access()
   return ANY(
      ALL("high_jump", "glide"),
      ALL(
         AT_LEAST(LOGIC_PROUD),
         ANY("combo_master", "high_jump", "glide", can_air_dodge(), can_dumbo_skip())
      ),
      AT_LEAST(LOGIC_MINIMAL)
   )
end

-- Monstro Chamber 6 Raised Area Near Chamber 1 Entrance Chest
function mon_chamber_6_near_chamber_1_access()
   return ANY(
      ALL("high_jump", "glide"),
      ALL(
         AT_LEAST(LOGIC_PROUD),
         ANY(
            "combo_master",
            "high_jump",
            "glide",
            can_air_dodge(),
            ALL(can_dumbo_skip(), "summon_anywhere")
         )
      ),
      AT_LEAST(LOGIC_MINIMAL)
   )
end

-- Monstro Defeat Parasite Cage II Stop Event
function mon_parasite_ii_access()
   if not has("monstro") then
      return AccessibilityLevel.None
   end
   if (
      has("high_jump")
      or (logic_difficulty_at_least_normal() and has("glide"))
   ) then
      return AccessibilityLevel.Normal
   elseif has("glide") then
      return AccessibilityLevel.SequenceBreak
   end

   return AccessibilityLevel.None
end

-- Atlantica Crystal Trident Checks Modified Beginner Logic
-- AP world verifies that beginner players with keyblade locking can
-- access the crystal trident chest before giving access to crystal
-- trident checks.
function at_beginner_require_chest()
   if access_chest_for("atlantica") then
      return AccessibilityLevel.Normal
   elseif logic_difficulty_at_least_normal() then
      return AccessibilityLevel.Normal
   end

   return AccessibilityLevel.SequenceBreak
end

-- Atlantica Offensive Magic Against Ursula
function at_offensive_magic()
   if has("fire") or has("blizzard") then
      return AccessibilityLevel.Normal
   elseif logic_difficulty_at_least_proud() and (has("thunder") or has("gravity")) then
      return AccessibilityLevel.Normal
   elseif logic_difficulty_at_least_minimal() and has("stop") then
      return AccessibilityLevel.Normal
   elseif has("thunder") or has("gravity") or has("stop") then
      return AccessibilityLevel.SequenceBreak
   end

   return AccessibilityLevel.None
end

-- Halloween Town Guillotine Square High Tower Chest
function ht_high_tower_access()
   if has("high_jump") and has("glide") then
      return AccessibilityLevel.Normal
   elseif logic_difficulty_at_least_normal() and (has("high_jump") or has("glide")) then
      return AccessibilityLevel.Normal
   elseif logic_difficulty_at_least_proud() and can_dumbo_skip() then
      return AccessibilityLevel.Normal
   elseif has("high_jump") or has("glide") or can_dumbo_skip() then
      return AccessibilityLevel.SequenceBreak
   end

   return AccessibilityLevel.None
end

-- Halloween Town Guillotine Square Pumpkin Structure Left Chest
-- Halloween Town Guillotine Square Pumpkin Structure Right Chest
function ht_pumpkin_structure_access()
   return ALL(
      ANY(
         "high_jump",
         ALL(AT_LEAST(LOGIC_NORMAL), "glide"),
         ALL(AT_LEAST(LOGIC_PROUD), can_dumbo_skip())
      ),
      ANY(
         "glide",
         ALL(AT_LEAST(LOGIC_NORMAL), HAS("high_jump", 2)),
         ALL(
            AT_LEAST(LOGIC_PROUD),
            ANY("combo_master", can_air_dodge())
         )
      )
   )
end

-- Halloween Town Bridge Right of Gate Chest
function ht_bridge_right_access()
   if has("glide") or has("high_jump", 3) then
      return AccessibilityLevel.Normal
   elseif logic_difficulty_at_least_normal() and has("high_jump", 2) then
      return AccessibilityLevel.Normal
   elseif logic_difficulty_at_least_proud() and has("high_jump") then
      return AccessibilityLevel.Normal
   elseif logic_difficulty_at_least_minimal() then
      return AccessibilityLevel.Normal
   end

   return AccessibilityLevel.SequenceBreak
end

-- Halloween Town Bridge Left of Gate Chest
function ht_bridge_left_access()
   if has("glide") or has("high_jump") then
      return AccessibilityLevel.Normal
   elseif logic_difficulty_at_least_proud() then
      return AccessibilityLevel.Normal
   end

   return AccessibilityLevel.SequenceBreak
end

-- Halloween Town Oogie's Manor
function ht_oogie_manor_access()
   if has("fire") then
      return AccessibilityLevel.Normal
   elseif logic_difficulty_at_least_normal() and has("high_jump", 3) then
      return AccessibilityLevel.Normal
   elseif logic_difficulty_at_least_proud() and (has("high_jump", 2) or (has("high_jump") and has("glide"))) then
      return AccessibilityLevel.Normal
   elseif logic_difficulty_at_least_minimal() and (has("high_jump") or has("glide")) then
      return AccessibilityLevel.Normal
   elseif has("high_jump") or has("glide") then
      return AccessibilityLevel.SequenceBreak
   end

   return false
end

-- Halloween Town Oogie's Manor Lower Iron Cage
function ht_manor_lower_cage_access()
   if has("glide") or has_basic_tools() then
      return AccessibilityLevel.Normal
   elseif logic_difficulty_at_least_normal() then
      return AccessibilityLevel.Normal
   end

   return AccessibilityLevel.SequenceBreak
end

-- Halloween Town Oogie's Manor Upper Iron Cage
function ht_manor_upper_cage_access()
   if has("glide") and has("high_jump") then
      return AccessibilityLevel.Normal
   elseif has_basic_tools() then
      return AccessibilityLevel.Normal
   elseif logic_difficulty_at_least_normal() then
      return AccessibilityLevel.Normal
   end

   return AccessibilityLevel.SequenceBreak
end

-- Neverland Ship Hold Beam Chests
function nl_hold_beam_access()
   if has("green_trinity") or has("glide") then
      return AccessibilityLevel.Normal
   elseif logic_difficulty_at_least_normal() and has("high_jump", 3) then
      return AccessibilityLevel.Normal
   elseif has("high_jump", 3) then
      return AccessibilityLevel.SequenceBreak
   end

   return AccessibilityLevel.None
end

-- Neverland Defeat Phantom
function nl_phantom_magic_access()
   if has_lv_magic(3) then
      return AccessibilityLevel.Normal
   elseif logic_difficulty_at_least_normal() and has_lv_magic(2) then
      return AccessibilityLevel.Normal
   end

   local elemental_magic_count = 0
   local elemental_spells = {"fire", "blizzard", "thunder"}
   for _, spell in ipairs(elemental_spells) do
      if has(spell) then
         elemental_magic_count = elemental_magic_count + 1
      end
   end

   if logic_difficulty_at_least_proud() and elemental_magic_count == 3 and has("stop") then
      return AccessibilityLevel.Normal
   elseif logic_difficulty_at_least_minimal() and elemental_magic_count >= 2 and has("stop") then
      return AccessibilityLevel.Normal
   elseif elemental_magic_count >= 2 and has("stop") then
      return AccessibilityLevel.SequenceBreak
   end

   return AccessibilityLevel.None
end

-- Neverland Defeat Phantom
function nl_phantom_defense_access()
   if has("leaf_bracer") or logic_difficulty_at_least_proud() then
      return AccessibilityLevel.Normal
   end

   return AccessibilityLevel.SequenceBreak
end

-- Hollow Bastion Floating Platform Near Save Point
function hb_falls_floating_platform_near_save_access()
   return ANY(
      "high_jump",
      "glide",
      "blizzard",
      ALL(AT_LEAST(LOGIC_PROUD), can_dumbo_skip(), "summon_anywhere"),
      ALL(AT_LEAST(LOGIC_MINIMAL), can_air_dodge())
   )
end

-- Hollow Bastion Floating Platform Near Bubble
function hb_falls_floating_platform_near_bubble_access()
   return ANY(
      "high_jump",
      "glide",
      "blizzard",
      ALL(AT_LEAST(LOGIC_PROUD), can_dumbo_skip(), "summon_anywhere"),
      ALL(
         AT_LEAST(LOGIC_MINIMAL),
         can_air_dodge(),
         "combo_master",
         HAS("air_combo_plus", 2)
      )
   )
end

-- Hollow Bastion Rising Falls High Platform Chest
function hb_falls_high_platform_access()
   return ANY(
      "glide",
      ALL("blizzard", has_emblems()),
      ALL(AT_LEAST(LOGIC_NORMAL), HAS("high_jump", 3)),
      ALL(
         AT_LEAST(LOGIC_PROUD),
         ANY(
            "high_jump",
            "combo_master",
            can_air_dodge(),
            ALL(can_dumbo_skip(), "summon_anywhere")
         )
      ),
      AT_LEAST(LOGIC_MINIMAL)
   )
end

-- Hollow Bastion Base Level Platform Near Entrance
function hb_base_platform_access()
   if has("glide") or has("high_jump") or logic_difficulty_at_least_normal() then
      return AccessibilityLevel.Normal
   end

   return AccessibilityLevel.SequenceBreak
end

-- Hollow Bastion Castle Gates Gravity Chest
function hb_castle_gates_gravity_access()
   if has_emblems() then
      return AccessibilityLevel.Normal
   elseif logic_difficulty_at_least_normal() and has("glide") and has("high_jump", 3) then
      return AccessibilityLevel.Normal
   elseif logic_difficulty_at_least_proud() and has("glide") and (has("high_jump", 2) or can_dumbo_skip()) then
      return AccessibilityLevel.Normal
   elseif logic_difficulty_at_least_minimal() and has("glide") and has("high_jump") then
      return AccessibilityLevel.Normal
   elseif has("glide") and (has("high_jump") or can_dumbo_skip()) then
      return AccessibilityLevel.SequenceBreak
   end

   return AccessibilityLevel.None
end

-- Hollow Bastion Castle Gates Freestanding Pillar Chest
-- Hollow Bastion Castle Gates High Pillar Chest
function hb_castle_gates_pillar_access()
   if has_emblems() then
      return AccessibilityLevel.Normal
   elseif logic_difficulty_at_least_normal() and has("high_jump", 3) then
      return AccessibilityLevel.Normal
   elseif logic_difficulty_at_least_proud() and (has("high_jump", 2) or can_dumbo_skip()) then
      return AccessibilityLevel.Normal
   elseif logic_difficulty_at_least_minimal() and has("glide") and has("high_jump") then
      return AccessibilityLevel.Normal
   elseif can_dumbo_skip() or (has("glide") and has("high_jump")) then
      return AccessibilityLevel.SequenceBreak
   end

   return AccessibilityLevel.None
end

-- Hollow Bastion Lift Stop from Waterway Examine Node
function hb_lift_stop_from_waterway_access()
   if has_emblems() then
      return AccessibilityLevel.Normal
   elseif logic_difficulty_at_least_normal() and has("glide") and has("high_jump", 3) then
      return AccessibilityLevel.Normal
   elseif logic_difficulty_at_least_proud() and has("glide") and (has("high_jump", 2) or can_dumbo_skip()) then
      return AccessibilityLevel.Normal
   elseif logic_difficulty_at_least_minimal() and has("glide") and has("high_jump") then
      return AccessibilityLevel.Normal
   elseif has("glide") and (has("high_jump") or can_dumbo_skip()) then
      return AccessibilityLevel.SequenceBreak
   end

   return AccessibilityLevel.None
end


-- Hollow Bastion Entrance Hall Pillar Left of Emblem Door Chest
function hb_entrance_hall_pillar_access()
   return ANY(
      "high_jump",
      ALL(
         AT_LEAST(LOGIC_PROUD),
         can_dumbo_skip(),
         ANY(has_emblems(), "summon_anywhere")
      )
   )
end

-- Hollow Bastion Entrance Hall Upper Level
function hb_entrance_hall_upper_level_access()
   if hb_after_theon_6() or has_emblems() then
      return AccessibilityLevel.Normal
   elseif logic_difficulty_at_least_normal() and has("high_jump", 3) then
      return AccessibilityLevel.Normal
   elseif logic_difficulty_at_least_proud() and has("high_jump", 2) then
      return AccessibilityLevel.Normal
   elseif has("high_jump", 2) then
      return AccessibilityLevel.SequenceBreak
   end

   return AccessibilityLevel.None
end

-- Hollow Bastion Entrance Hall Emblem Piece Flame
function hb_entrance_hall_flame_emblem_access()
   return ALL(
      hb_entrance_hall_upper_level_access(),
      ANY("fire", AT_LEAST(LOGIC_MINIMAL)),
      ANY(
         "glide",
         "thunder",
         ALL(AT_LEAST(LOGIC_NORMAL), "high_jump"),
         AT_LEAST(LOGIC_PROUD)
      )
   )
end

-- End of the World Final Dimension Giant Crevasse - 1st Chest
function eotw_giant_crevasse_first()
   return ANY(
      "high_jump",
      "glide",
      AT_LEAST(LOGIC_PROUD)
   )
end

-- End of the World Final Dimension Giant Crevasse - 2nd Chest
-- End of the World Final Dimension Giant Crevasse - 3rd Chest
function eotw_giant_crevasse_lower()
   if has("glide") or has("high_jump") then
      return AccessibilityLevel.Normal
   elseif logic_difficulty_at_least_normal() then
      return AccessibilityLevel.Normal
   end

   return AccessibilityLevel.SequenceBreak
end

-- End of the World Final Dimension Giant Crevasse - 4th Chest
function eotw_giant_crevasse_upper()
   return ANY(
      "glide",
      ALL(
         AT_LEAST(LOGIC_PROUD),
         ANY(HAS("high_jump", 2), ALL(can_dumbo_skip(), "summon_anywhere"))
      ),
      ALL(AT_LEAST(LOGIC_MINIMAL), can_air_dodge())
   )
end

-- End of the World World Terminus Agrabah Chest
function eotw_world_terminus_agrabah_access()
   return ANY(
      "high_jump",
      ALL(
         AT_LEAST(LOGIC_PROUD),
         can_dumbo_skip(),
         ANY("glide", "summon_anywhere")
      )
   )
end

-- 100 Acre Wood Bouncing Spot Left Cliff Chest
-- 100 Acre Wood Bouncing Spot Right Tree Alcove Chest
-- 100 Acre Wood Bouncing Spot Turn in Rare Nut 2, 3, 4
function haw_bouncing_spot_access()
   if has("high_jump") and has("glide") then
      return AccessibilityLevel.Normal
   elseif logic_difficulty_at_least_normal() and (has("high_jump") or has("glide")) then
      return AccessibilityLevel.Normal
   elseif logic_difficulty_at_least_proud() then
      return AccessibilityLevel.Normal
   end

   return AccessibilityLevel.SequenceBreak
end

-- 100 Acre Wood Bouncing Spot Turn in Rare Nut 5
function haw_final_nut_access()
   return ANY(
      ALL("high_jump", "glide"),
      ALL(AT_LEAST(LOGIC_NORMAL), ANY("glide", "high_jump")),
      ALL(AT_LEAST(LOGIC_MINIMAL), ANY("combo_master", can_air_dodge()))
   )
end

function boss_beginner_require_tools()
   if has_basic_tools() then
      return AccessibilityLevel.Normal
   elseif logic_difficulty_at_least_normal() then
      return AccessibilityLevel.Normal
   end

   return AccessibilityLevel.SequenceBreak
end