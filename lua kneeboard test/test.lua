dofile(LockOn_Options.common_script_path..'elements_defs.lua')
 
local FONT = MakeFont({ used_DXUnicodeFontData = 'font_dejavu_lgc_sans_condensed_17'}, {0, 0, 0, 255})

local h_center = 100
local v_center = 100

local txt = CreateElement 'ceStringPoly'
txt.value = 'My text'
txt.material = FONT
txt.init_pos = {h_center, v_center}
txt.alignment = 'CenterCenter'
txt.stringdefs = {0.005, 0.0013, 0, 0}
txt.use_mipfilter = true
txt.h_clip_relation = h_clip_relations.COMPARE
txt.level = DEFAULT_LEVEL
Add(txt) 

--[[
	Define h_center and v_center with the position you want the text to appear on the kneeboard page. 
]]


--[[
local imageMaterial = MakeMaterial(path, { 255, 255, 255, 255 })

local back = CreateElement "ceTexPoly"
back.name = create_guid_string()
back.material = imageMaterial
back.init_pos = { x - 1, GetAspect() - y }
back.vertices = {
	{ 0, 0 },
	{ width, 0 },
	{ width, -height },
	{ 0, -height }
}
back.indices = { 0, 1, 2; 0, 2, 3 }
back.tex_coords = texture_box(0, 0, 1, 1)
back.h_clip_relation = h_clip_relations.COMPARE
back.level = DEFAULT_LEVEL
Add(back)  
--]]