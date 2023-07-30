dofile(LockOn_Options.common_script_path.."KNEEBOARD/indicator/definitions.lua")
dofile(LockOn_Options.script_path.."materials.lua")
dofile(LockOn_Options.script_path.."fonts.lua")
SetScale(FOV)

add_picture(LockOn_Options.script_path.."Resources/IndicationTextures/kneepad.dds")

local gettext = require("i_18n")
_ = gettext.translate

function AddElement(object)
 object.use_mipfilter = true
 Add(object)
end

-- fonts
font_size_item_y = 0.0070
font_size_item_x = 0.5517 * font_size_item_y

font_item_defs = {font_size_item_y, font_size_item_x, -0.0007, 0.0}

local start_line_y = 1.22
local line_size_y = 0.137

local function getLineY(line)
 return start_line_y - line_size_y * (line)
end

local start_line = 1
local item_pos_x_l = -0.82
local item_pos_x_r = 0.11

Name_Arc210Channels = CreateElement "ceStringPoly"
Name_Arc210Channels.name = "Name_Arc210Channels"
Name_Arc210Channels.material = "font_kneeboard"
Name_Arc210Channels.init_pos = {0, getLineY(0), 0}
Name_Arc210Channels.value = _("AN/ARC-210 CHANNELS")
Name_Arc210Channels.alignment = "CenterBottom"
Name_Arc210Channels.stringdefs = font_item_defs
AddElement(Name_Arc210Channels)

for channel = 1,15 do
	local ch_line = start_line + channel
    local pos_y = getLineY(ch_line)

    Arc210ChannelStrL = CreateElement "ceStringPoly"
    Arc210ChannelStrL.name = "Arc210ChannelStrL"..channel
    Arc210ChannelStrL.material = "font_kneeboard"
    Arc210ChannelStrL.init_pos = {item_pos_x_l, pos_y, 0}
    Arc210ChannelStrL.alignment = "LeftBottom"
    Arc210ChannelStrL.stringdefs = font_item_defs
    Arc210ChannelStrL.controllers = {{"arc210_channel_label", channel}}
    AddElement(Arc210ChannelStrL)
	
	Arc210ChannelStrR = CreateElement "ceStringPoly"
    Arc210ChannelStrR.name = "Arc210ChannelStrR"..channel
    Arc210ChannelStrR.material = "font_kneeboard"
    Arc210ChannelStrR.init_pos = {item_pos_x_r, pos_y, 0}
    Arc210ChannelStrR.alignment = "LeftBottom"
    Arc210ChannelStrR.stringdefs = font_item_defs
    Arc210ChannelStrR.controllers = {{"arc210_channel_label", channel+15}}
    AddElement(Arc210ChannelStrR)
end
