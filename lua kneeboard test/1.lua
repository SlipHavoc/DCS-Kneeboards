dofile(LockOn_Options.common_script_path.."KNEEBOARD/indicator/definitions.lua")
SetScale(FOV)

add_picture(LockOn_Options.script_path.."Resources/KNEEBOARD/kneeboard_page.dds")

--[[
-- GENERAL SCALE
local general_font_scale = 1.0

FontSizeX1	= 0.0075 * general_font_scale
FontSizeY1	= FontSizeX1

predefined_font_20 = {general_font_scale* FontSizeY1*2.0, general_font_scale* FontSizeX1*2.0, 0.0, 0.0}
predefined_font_10 = {general_font_scale* FontSizeY1, 	  general_font_scale* FontSizeX1	, 0.0, 0.0}
predefined_font_09 = {general_font_scale* FontSizeY1*0.9, general_font_scale* FontSizeX1*0.9, 0.0, 0.0}
predefined_font_08 = {general_font_scale* FontSizeY1*0.8, general_font_scale* FontSizeX1*0.8, 0.0, 0.0}
predefined_font_07 = {general_font_scale* FontSizeY1*0.7, general_font_scale* FontSizeX1*0.7, 0.0, 0.0}
predefined_font_06 = {general_font_scale* FontSizeY1*0.6, general_font_scale* FontSizeX1*0.6, 0.0, 0.0}
predefined_font_05 = {general_font_scale* FontSizeY1*0.5, general_font_scale* FontSizeX1*0.5, 0.0, 0.0}

function AddElement(object)
    object.use_mipfilter = true
    Add(object)
end

local LineSizeY   = FontSizeY1 * 9
local ColumnSizeX = FontSizeX1 * 48 / 72 * 8 

firstLineY = - LineSizeY

local hints_scale		= MakeMaterial("arcade.tga", {255, 128, 64, 255})

local base_size_x   = ColumnSizeX * 45.0
local base_size_y   = LineSizeY   * 17.0
local base_size_x05 = base_size_x * 0.5
local base_size_y05 = base_size_y * 0.5

HintsBase					= CreateElement "ceSimple"
HintsBase.name				= "HintsBase"
HintsBase.init_pos			= {0, GetAspect() - 3.5 * FontSizeY1}
AddElement(HintsBase)

local Base_Col_1	= -ColumnSizeX * 9.5
local Base_Row_1	= -LineSizeY * 4.5
local Base_Row_2	= Base_Row_1 - LineSizeY * 23.2
local Base_Row_3	= Base_Row_2 - LineSizeY * 10.0
local Base_Row_4	= Base_Row_1 - LineSizeY * 16.0
local Base_Row_5	= Base_Row_1 - LineSizeY * 20.3

-- GAU-12 Gun Pod
txt_GunPod_Load					= CreateElement "ceStringPoly"
txt_GunPod_Load.name			= "txt_GunPod_Load"
txt_GunPod_Load.material		= "font_hints_kneeboard"
txt_GunPod_Load.init_pos		= {Base_Col_1,  Base_Row_1, 0}
txt_GunPod_Load.value			= "LOADED"
txt_GunPod_Load.alignment		= "LeftCenter"
txt_GunPod_Load.parent_element	= HintsBase.name
txt_GunPod_Load.stringdefs		= predefined_font_07
txt_GunPod_Load.controllers		= {{"GAU12_Present"}}
AddElement(txt_GunPod_Load)

txt_GunPod_Ammo					= CreateElement "ceStringPoly"
txt_GunPod_Ammo.name			= "txt_GunPod_Ammo"
txt_GunPod_Ammo.material		= "font_hints_kneeboard"
txt_GunPod_Ammo.init_pos		= {Base_Col_1,  Base_Row_1 - LineSizeY * 1.5, 0}
txt_GunPod_Ammo.value			= "300 ROUNDS"
txt_GunPod_Ammo.alignment		= "LeftCenter"
txt_GunPod_Ammo.parent_element	= HintsBase.name
txt_GunPod_Ammo.stringdefs		= predefined_font_07
txt_GunPod_Ammo.controllers		= {{"GAU12_Present"}}
AddElement(txt_GunPod_Ammo)

-- FFAR Fire Mode
txt_FFAR_FireMode					= CreateElement "ceStringPoly"
txt_FFAR_FireMode.name				= "txt_FFAR_FireMode"
txt_FFAR_FireMode.material			= "font_hints_kneeboard"
txt_FFAR_FireMode.init_pos			= {Base_Col_1,  Base_Row_1 - LineSizeY * 3.0, 0}
txt_FFAR_FireMode.formats			= {"%s"}
txt_FFAR_FireMode.alignment			= "LeftCenter"
txt_FFAR_FireMode.parent_element	= HintsBase.name
txt_FFAR_FireMode.stringdefs		= predefined_font_07
txt_FFAR_FireMode.controllers		= {{"FFAR_FireMode"}}
AddElement(txt_FFAR_FireMode)

-- NVG Case
txt_NVG_Case_Load					= CreateElement "ceStringPoly"
txt_NVG_Case_Load.name				= "txt_NVG_Case_Load"
txt_NVG_Case_Load.material			= "font_hints_kneeboard"
txt_NVG_Case_Load.init_pos			= {Base_Col_1,  Base_Row_1 - LineSizeY * 5.7, 0}
txt_NVG_Case_Load.value				= "LOADED"
txt_NVG_Case_Load.alignment			= "LeftCenter"
txt_NVG_Case_Load.parent_element	= HintsBase.name
txt_NVG_Case_Load.stringdefs		= predefined_font_07
txt_NVG_Case_Load.controllers		= {{"ANVIS_Case_Present"}}
AddElement(txt_NVG_Case_Load)

-- APKWS Laser Code
txt_GR20_Laser_Code					= CreateElement "ceStringPoly"
txt_GR20_Laser_Code.name			= "txt_GR20_Laser_Code"
txt_GR20_Laser_Code.material		= "font_hints_kneeboard"
txt_GR20_Laser_Code.init_pos		= {Base_Col_1,  Base_Row_5, 0}
txt_GR20_Laser_Code.formats			= {"%d"}
txt_GR20_Laser_Code.alignment		= "LeftCenter"
txt_GR20_Laser_Code.parent_element	= HintsBase.name
txt_GR20_Laser_Code.stringdefs		= predefined_font_07
txt_GR20_Laser_Code.controllers		= {{"APKWS_LaserCode"}}
AddElement(txt_GR20_Laser_Code)

-- CHAFF/FLARES DISPENSER
txt_CMD_TFL_Load					= CreateElement "ceStringPoly"
txt_CMD_TFL_Load.name				= "txt_CMD_TFL_Load"
txt_CMD_TFL_Load.material			= "font_hints_kneeboard"
txt_CMD_TFL_Load.init_pos			= {Base_Col_1,  Base_Row_2, 0}
txt_CMD_TFL_Load.formats			= {"%s"}
txt_CMD_TFL_Load.alignment			= "LeftCenter"
txt_CMD_TFL_Load.parent_element		= HintsBase.name
txt_CMD_TFL_Load.stringdefs			= predefined_font_07
txt_CMD_TFL_Load.controllers		= {{"CMD_TFL_Load"}}
AddElement(txt_CMD_TFL_Load)

txt_CMD_TFR_Load					= CreateElement "ceStringPoly"
txt_CMD_TFR_Load.name				= "txt_CMD_TFR_Load"
txt_CMD_TFR_Load.material			= "font_hints_kneeboard"
txt_CMD_TFR_Load.init_pos			= {Base_Col_1,  Base_Row_2 - LineSizeY * 1.5, 0}
txt_CMD_TFR_Load.formats			= {"%s"}
txt_CMD_TFR_Load.alignment			= "LeftCenter"
txt_CMD_TFR_Load.parent_element		= HintsBase.name
txt_CMD_TFR_Load.stringdefs			= predefined_font_07
txt_CMD_TFR_Load.controllers		= {{"CMD_TFR_Load"}}
AddElement(txt_CMD_TFR_Load)

txt_CMD_TRL_Load					= CreateElement "ceStringPoly"
txt_CMD_TRL_Load.name				= "txt_CMD_TRL_Load"
txt_CMD_TRL_Load.material			= "font_hints_kneeboard"
txt_CMD_TRL_Load.init_pos			= {Base_Col_1,  Base_Row_2 - LineSizeY * 2.8, 0}
txt_CMD_TRL_Load.formats			= {"%s"}
txt_CMD_TRL_Load.alignment			= "LeftCenter"
txt_CMD_TRL_Load.parent_element		= HintsBase.name
txt_CMD_TRL_Load.stringdefs			= predefined_font_07
txt_CMD_TRL_Load.controllers		= {{"CMD_TRL_Load"}}
AddElement(txt_CMD_TRL_Load)

txt_CMD_TRR_Load					= CreateElement "ceStringPoly"
txt_CMD_TRR_Load.name				= "txt_CMD_TRR_Load"
txt_CMD_TRR_Load.material			= "font_hints_kneeboard"
txt_CMD_TRR_Load.init_pos			= {Base_Col_1,  Base_Row_2 - LineSizeY * 4.3, 0}
txt_CMD_TRR_Load.formats			= {"%s"}
txt_CMD_TRR_Load.alignment			= "LeftCenter"
txt_CMD_TRR_Load.parent_element		= HintsBase.name
txt_CMD_TRR_Load.stringdefs			= predefined_font_07
txt_CMD_TRR_Load.controllers		= {{"CMD_TRR_Load"}}
AddElement(txt_CMD_TRR_Load)

txt_CMD_BTL_Load					= CreateElement "ceStringPoly"
txt_CMD_BTL_Load.name				= "txt_CMD_BTL_Load"
txt_CMD_BTL_Load.material			= "font_hints_kneeboard"
txt_CMD_BTL_Load.init_pos			= {Base_Col_1,  Base_Row_2 - LineSizeY * 5.8, 0}
txt_CMD_BTL_Load.formats			= {"%s"}
txt_CMD_BTL_Load.alignment			= "LeftCenter"
txt_CMD_BTL_Load.parent_element		= HintsBase.name
txt_CMD_BTL_Load.stringdefs			= predefined_font_07
txt_CMD_BTL_Load.controllers		= {{"CMD_BTL_Load"}}
AddElement(txt_CMD_BTL_Load)

txt_CMD_BTR_Load					= CreateElement "ceStringPoly"
txt_CMD_BTR_Load.name				= "txt_CMD_BTR_Load"
txt_CMD_BTR_Load.material			= "font_hints_kneeboard"
txt_CMD_BTR_Load.init_pos			= {Base_Col_1,  Base_Row_2 - LineSizeY * 7.3, 0}
txt_CMD_BTR_Load.formats			= {"%s"}
txt_CMD_BTR_Load.alignment			= "LeftCenter"
txt_CMD_BTR_Load.parent_element		= HintsBase.name
txt_CMD_BTR_Load.stringdefs			= predefined_font_07
txt_CMD_BTR_Load.controllers		= {{"CMD_BTR_Load"}}
AddElement(txt_CMD_BTR_Load)

-- Present Position
txt_PP_Latitude						= CreateElement "ceStringPoly"
txt_PP_Latitude.name				= "txt_PP_Latitude"
txt_PP_Latitude.material			= "font_hints_kneeboard"
txt_PP_Latitude.init_pos			= {Base_Col_1 + ColumnSizeX * 1.2,  Base_Row_3, 0}
txt_PP_Latitude.formats				= {"%02d:%02d:%02d %s"}
txt_PP_Latitude.alignment			= "LeftCenter"
txt_PP_Latitude.parent_element		= HintsBase.name
txt_PP_Latitude.stringdefs			= predefined_font_07
txt_PP_Latitude.controllers			= {{"AC_IP_Lat"}}
AddElement(txt_PP_Latitude)

txt_PP_Longitude					= CreateElement "ceStringPoly"
txt_PP_Longitude.name				= "txt_PP_Longitude"
txt_PP_Longitude.material			= "font_hints_kneeboard"
txt_PP_Longitude.init_pos			= {Base_Col_1,  Base_Row_3 - LineSizeY * 1.3, 0}
txt_PP_Longitude.formats			= {"%03d:%02d:%02d %s"}
txt_PP_Longitude.alignment			= "LeftCenter"
txt_PP_Longitude.parent_element		= HintsBase.name
txt_PP_Longitude.stringdefs			= predefined_font_07
txt_PP_Longitude.controllers		= {{"AC_IP_Lon"}}
AddElement(txt_PP_Longitude)

txt_PP_Altitude						= CreateElement "ceStringPoly"
txt_PP_Altitude.name				= "txt_PP_Altitude"
txt_PP_Altitude.material			= "font_hints_kneeboard"
txt_PP_Altitude.init_pos			= {Base_Col_1,  Base_Row_3 - LineSizeY * 2.6, 0}
txt_PP_Altitude.formats				= {"%d FEET"}
txt_PP_Altitude.alignment			= "LeftCenter"
txt_PP_Altitude.parent_element		= HintsBase.name
txt_PP_Altitude.stringdefs			= predefined_font_07
txt_PP_Altitude.controllers			= {{"AC_IP_Alt"}}
AddElement(txt_PP_Altitude)

txt_PP_MagVar						= CreateElement "ceStringPoly"
txt_PP_MagVar.name					= "txt_PP_MagVar"
txt_PP_MagVar.material				= "font_hints_kneeboard"
txt_PP_MagVar.init_pos				= {Base_Col_1,  Base_Row_3 - LineSizeY * 4.0, 0}
txt_PP_MagVar.formats				= {"%1.1f %s"}
txt_PP_MagVar.alignment				= "LeftCenter"
txt_PP_MagVar.parent_element		= HintsBase.name
txt_PP_MagVar.stringdefs			= predefined_font_07
txt_PP_MagVar.controllers			= {{"AC_IP_MagVar"}}
AddElement(txt_PP_MagVar)

-- Weapons Load
local Grid_Col_1	= Base_Col_1 - ColumnSizeX * 6.0
local Grid_Col_2	= Base_Col_1 - ColumnSizeX * 0.0
local Grid_Col_3	= Base_Col_1 + ColumnSizeX * 6.3
local Grid_Col_4	= Base_Col_1 + ColumnSizeX * 12.5
local Grid_Col_5	= Base_Col_1 + ColumnSizeX * 19.0
local Grid_Col_6	= Base_Col_1 + ColumnSizeX * 25.0
local Grid_Col_7	= Base_Col_1 + ColumnSizeX * 31.0

txt_WL_Sta1_Code					= CreateElement "ceStringPoly"
txt_WL_Sta1_Code.name				= "txt_WL_Sta1_Code"
txt_WL_Sta1_Code.material			= "font_hints_kneeboard"
txt_WL_Sta1_Code.init_pos			= {Grid_Col_1,  Base_Row_4, 0}
txt_WL_Sta1_Code.formats			= {"%s"}
txt_WL_Sta1_Code.alignment			= "CenterCenter"
txt_WL_Sta1_Code.parent_element		= HintsBase.name
txt_WL_Sta1_Code.stringdefs			= predefined_font_07
txt_WL_Sta1_Code.controllers		= {{"WL_Sta1_Code"}}
AddElement(txt_WL_Sta1_Code)

txt_WL_Sta1_Count					= CreateElement "ceStringPoly"
txt_WL_Sta1_Count.name				= "txt_WL_Sta1_Count"
txt_WL_Sta1_Count.material			= "font_hints_kneeboard"
txt_WL_Sta1_Count.init_pos			= {Grid_Col_1,  Base_Row_4 - LineSizeY * 2.2, 0}
txt_WL_Sta1_Count.formats			= {"%d"}
txt_WL_Sta1_Count.alignment			= "CenterCenter"
txt_WL_Sta1_Count.parent_element	= HintsBase.name
txt_WL_Sta1_Count.stringdefs		= predefined_font_07
txt_WL_Sta1_Count.controllers		= {{"WL_Sta1_Count"}}
AddElement(txt_WL_Sta1_Count)

txt_WL_Sta2_Code					= CreateElement "ceStringPoly"
txt_WL_Sta2_Code.name				= "txt_WL_Sta2_Code"
txt_WL_Sta2_Code.material			= "font_hints_kneeboard"
txt_WL_Sta2_Code.init_pos			= {Grid_Col_2,  Base_Row_4, 0}
txt_WL_Sta2_Code.formats			= {"%s"}
txt_WL_Sta2_Code.alignment			= "CenterCenter"
txt_WL_Sta2_Code.parent_element		= HintsBase.name
txt_WL_Sta2_Code.stringdefs			= predefined_font_07
txt_WL_Sta2_Code.controllers		= {{"WL_Sta2_Code"}}
AddElement(txt_WL_Sta2_Code)

txt_WL_Sta2_Count					= CreateElement "ceStringPoly"
txt_WL_Sta2_Count.name				= "txt_WL_Sta2_Count"
txt_WL_Sta2_Count.material			= "font_hints_kneeboard"
txt_WL_Sta2_Count.init_pos			= {Grid_Col_2,  Base_Row_4 - LineSizeY * 2.2, 0}
txt_WL_Sta2_Count.formats			= {"%d"}
txt_WL_Sta2_Count.alignment			= "CenterCenter"
txt_WL_Sta2_Count.parent_element	= HintsBase.name
txt_WL_Sta2_Count.stringdefs		= predefined_font_07
txt_WL_Sta2_Count.controllers		= {{"WL_Sta2_Count"}}
AddElement(txt_WL_Sta2_Count)

txt_WL_Sta3_Code					= CreateElement "ceStringPoly"
txt_WL_Sta3_Code.name				= "txt_WL_Sta3_Code"
txt_WL_Sta3_Code.material			= "font_hints_kneeboard"
txt_WL_Sta3_Code.init_pos			= {Grid_Col_3,  Base_Row_4, 0}
txt_WL_Sta3_Code.formats			= {"%s"}
txt_WL_Sta3_Code.alignment			= "CenterCenter"
txt_WL_Sta3_Code.parent_element		= HintsBase.name
txt_WL_Sta3_Code.stringdefs			= predefined_font_07
txt_WL_Sta3_Code.controllers		= {{"WL_Sta3_Code"}}
AddElement(txt_WL_Sta3_Code)

txt_WL_Sta3_Count					= CreateElement "ceStringPoly"
txt_WL_Sta3_Count.name				= "txt_WL_Sta3_Count"
txt_WL_Sta3_Count.material			= "font_hints_kneeboard"
txt_WL_Sta3_Count.init_pos			= {Grid_Col_3,  Base_Row_4 - LineSizeY * 2.2, 0}
txt_WL_Sta3_Count.formats			= {"%d"}
txt_WL_Sta3_Count.alignment			= "CenterCenter"
txt_WL_Sta3_Count.parent_element	= HintsBase.name
txt_WL_Sta3_Count.stringdefs		= predefined_font_07
txt_WL_Sta3_Count.controllers		= {{"WL_Sta3_Count"}}
AddElement(txt_WL_Sta3_Count)

txt_WL_Sta4_Code					= CreateElement "ceStringPoly"
txt_WL_Sta4_Code.name				= "txt_WL_Sta4_Code"
txt_WL_Sta4_Code.material			= "font_hints_kneeboard"
txt_WL_Sta4_Code.init_pos			= {Grid_Col_4,  Base_Row_4, 0}
txt_WL_Sta4_Code.formats			= {"%s"}
txt_WL_Sta4_Code.alignment			= "CenterCenter"
txt_WL_Sta4_Code.parent_element		= HintsBase.name
txt_WL_Sta4_Code.stringdefs			= predefined_font_07
txt_WL_Sta4_Code.controllers		= {{"WL_Sta4_Code"}}
AddElement(txt_WL_Sta4_Code)

txt_WL_Sta4_Count					= CreateElement "ceStringPoly"
txt_WL_Sta4_Count.name				= "txt_WL_Sta4_Count"
txt_WL_Sta4_Count.material			= "font_hints_kneeboard"
txt_WL_Sta4_Count.init_pos			= {Grid_Col_4,  Base_Row_4 - LineSizeY * 2.2, 0}
txt_WL_Sta4_Count.formats			= {"%d"}
txt_WL_Sta4_Count.alignment			= "CenterCenter"
txt_WL_Sta4_Count.parent_element	= HintsBase.name
txt_WL_Sta4_Count.stringdefs		= predefined_font_07
txt_WL_Sta4_Count.controllers		= {{"WL_Sta4_Count"}}
AddElement(txt_WL_Sta4_Count)

txt_WL_Sta5_Code					= CreateElement "ceStringPoly"
txt_WL_Sta5_Code.name				= "txt_WL_Sta5_Code"
txt_WL_Sta5_Code.material			= "font_hints_kneeboard"
txt_WL_Sta5_Code.init_pos			= {Grid_Col_5,  Base_Row_4, 0}
txt_WL_Sta5_Code.formats			= {"%s"}
txt_WL_Sta5_Code.alignment			= "CenterCenter"
txt_WL_Sta5_Code.parent_element		= HintsBase.name
txt_WL_Sta5_Code.stringdefs			= predefined_font_07
txt_WL_Sta5_Code.controllers		= {{"WL_Sta5_Code"}}
AddElement(txt_WL_Sta5_Code)

txt_WL_Sta5_Count					= CreateElement "ceStringPoly"
txt_WL_Sta5_Count.name				= "txt_WL_Sta5_Count"
txt_WL_Sta5_Count.material			= "font_hints_kneeboard"
txt_WL_Sta5_Count.init_pos			= {Grid_Col_5,  Base_Row_4 - LineSizeY * 2.2, 0}
txt_WL_Sta5_Count.formats			= {"%d"}
txt_WL_Sta5_Count.alignment			= "CenterCenter"
txt_WL_Sta5_Count.parent_element	= HintsBase.name
txt_WL_Sta5_Count.stringdefs		= predefined_font_07
txt_WL_Sta5_Count.controllers		= {{"WL_Sta5_Count"}}
AddElement(txt_WL_Sta5_Count)

txt_WL_Sta6_Code					= CreateElement "ceStringPoly"
txt_WL_Sta6_Code.name				= "txt_WL_Sta6_Code"
txt_WL_Sta6_Code.material			= "font_hints_kneeboard"
txt_WL_Sta6_Code.init_pos			= {Grid_Col_6,  Base_Row_4, 0}
txt_WL_Sta6_Code.formats			= {"%s"}
txt_WL_Sta6_Code.alignment			= "CenterCenter"
txt_WL_Sta6_Code.parent_element		= HintsBase.name
txt_WL_Sta6_Code.stringdefs			= predefined_font_07
txt_WL_Sta6_Code.controllers		= {{"WL_Sta6_Code"}}
AddElement(txt_WL_Sta6_Code)

txt_WL_Sta6_Count					= CreateElement "ceStringPoly"
txt_WL_Sta6_Count.name				= "txt_WL_Sta6_Count"
txt_WL_Sta6_Count.material			= "font_hints_kneeboard"
txt_WL_Sta6_Count.init_pos			= {Grid_Col_6,  Base_Row_4 - LineSizeY * 2.2, 0}
txt_WL_Sta6_Count.formats			= {"%d"}
txt_WL_Sta6_Count.alignment			= "CenterCenter"
txt_WL_Sta6_Count.parent_element	= HintsBase.name
txt_WL_Sta6_Count.stringdefs		= predefined_font_07
txt_WL_Sta6_Count.controllers		= {{"WL_Sta6_Count"}}
AddElement(txt_WL_Sta6_Count)

txt_WL_Sta7_Code					= CreateElement "ceStringPoly"
txt_WL_Sta7_Code.name				= "txt_WL_Sta7_Code"
txt_WL_Sta7_Code.material			= "font_hints_kneeboard"
txt_WL_Sta7_Code.init_pos			= {Grid_Col_7,  Base_Row_4, 0}
txt_WL_Sta7_Code.formats			= {"%s"}
txt_WL_Sta7_Code.alignment			= "CenterCenter"
txt_WL_Sta7_Code.parent_element		= HintsBase.name
txt_WL_Sta7_Code.stringdefs			= predefined_font_07
txt_WL_Sta7_Code.controllers		= {{"WL_Sta7_Code"}}
AddElement(txt_WL_Sta7_Code)

txt_WL_Sta7_Count					= CreateElement "ceStringPoly"
txt_WL_Sta7_Count.name				= "txt_WL_Sta7_Count"
txt_WL_Sta7_Count.material			= "font_hints_kneeboard"
txt_WL_Sta7_Count.init_pos			= {Grid_Col_7,  Base_Row_4 - LineSizeY * 2.2, 0}
txt_WL_Sta7_Count.formats			= {"%d"}
txt_WL_Sta7_Count.alignment			= "CenterCenter"
txt_WL_Sta7_Count.parent_element	= HintsBase.name
txt_WL_Sta7_Count.stringdefs		= predefined_font_07
txt_WL_Sta7_Count.controllers		= {{"WL_Sta7_Count"}}
AddElement(txt_WL_Sta7_Count)

]]