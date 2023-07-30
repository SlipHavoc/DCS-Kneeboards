dofile(LockOn_Options.common_script_path.."KNEEBOARD/indicator/definitions.lua")
SetScale(FOV)

add_picture(LockOn_Options.script_path.."Resources/KNEEBOARD/notepad.dds")

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
predefined_font_04 = {general_font_scale* FontSizeY1*0.4, general_font_scale* FontSizeX1*0.4, 0.0, 0.0}
predefined_font_03 = {general_font_scale* FontSizeY1*0.3, general_font_scale* FontSizeX1*0.3, 0.0, 0.0}

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

-- TITLE
local Page_Title_x	= 0
local Page_Title_y	= - LineSizeY * 1.35

local Base_Col_1	= -ColumnSizeX * 22.0
local Base_Col_2	= -ColumnSizeX * 15.0
local Base_Col_3	= -ColumnSizeX * 5.0
local Base_Col_4	=  ColumnSizeX * 6.5
local Base_Col_5	=  ColumnSizeX * 10.0

local Title_Row_0	= Page_Title_y - LineSizeY * 1.5
local Title_Row_1	= Title_Row_0 - LineSizeY * 1.0
local Title_Row_2	= Title_Row_1 - LineSizeY * 1.0

local Table_Row_0	= Title_Row_2 - LineSizeY * 1.5
local Table_Row_1	= Table_Row_0 - LineSizeY * 1.0

txt_PageTitle					= CreateElement "ceStringPoly"
txt_PageTitle.name				= "txt_PageTitle"
txt_PageTitle.material			= "font_hints_kneeboard"
txt_PageTitle.init_pos			= {Page_Title_x,  Page_Title_y, 0}
txt_PageTitle.value				= "MISSION ROUTE PLAN"
txt_PageTitle.alignment			= "CenterCenter"
txt_PageTitle.parent_element	= HintsBase.name
txt_PageTitle.stringdefs		= predefined_font_10
AddElement(txt_PageTitle)

txt_TableTitle					= CreateElement "ceStringPoly"
txt_TableTitle.name				= "txt_TableTitle_0"
txt_TableTitle.material			= "font_hints_kneeboard"
txt_TableTitle.init_pos			= {-ColumnSizeX * 23.0,  Title_Row_0, 0}
txt_TableTitle.value			= "TOTAL DISTANCE:"
txt_TableTitle.alignment		= "LeftCenter"
txt_TableTitle.parent_element	= HintsBase.name
txt_TableTitle.stringdefs		= predefined_font_06
AddElement(txt_TableTitle)

txt_TableTitle					= CreateElement "ceStringPoly"
txt_TableTitle.name				= "txt_TableTitle_0"
txt_TableTitle.material			= "font_data_kneeboard"
txt_TableTitle.init_pos			= {-ColumnSizeX * 7.0,  Title_Row_0, 0}
txt_TableTitle.formats			= {"%1.1f NM"}
txt_TableTitle.alignment		= "LeftCenter"
txt_TableTitle.parent_element	= HintsBase.name
txt_TableTitle.stringdefs		= predefined_font_06
txt_TableTitle.controllers		= {{"MRP_TotalDistance"}}
AddElement(txt_TableTitle)

--

txt_TableTitle					= CreateElement "ceStringPoly"
txt_TableTitle.name				= "txt_TableTitle_1"
txt_TableTitle.material			= "font_hints_kneeboard"
txt_TableTitle.init_pos			= {-ColumnSizeX * 23.0,  Title_Row_1, 0}
txt_TableTitle.value			= "AVG GS:"
txt_TableTitle.alignment		= "LeftCenter"
txt_TableTitle.parent_element	= HintsBase.name
txt_TableTitle.stringdefs		= predefined_font_06
AddElement(txt_TableTitle)

txt_TableTitle					= CreateElement "ceStringPoly"
txt_TableTitle.name				= "txt_TableTitle_1_Val"
txt_TableTitle.material			= "font_data_kneeboard"
txt_TableTitle.init_pos			= {-ColumnSizeX * 15.0,  Title_Row_1, 0}
txt_TableTitle.formats			= {"%1.f KTS"}
txt_TableTitle.alignment		= "LeftCenter"
txt_TableTitle.parent_element	= HintsBase.name
txt_TableTitle.stringdefs		= predefined_font_06
txt_TableTitle.controllers		= {{"MRP_avg_GS"}}
AddElement(txt_TableTitle)

--

txt_TableTitle					= CreateElement "ceStringPoly"
txt_TableTitle.name				= "txt_TableTitle_1A"
txt_TableTitle.material			= "font_hints_kneeboard"
txt_TableTitle.init_pos			= {ColumnSizeX * 2.0,  Title_Row_1, 0}
txt_TableTitle.value			= "TOTAL ETE:"
txt_TableTitle.alignment		= "LeftCenter"
txt_TableTitle.parent_element	= HintsBase.name
txt_TableTitle.stringdefs		= predefined_font_06
AddElement(txt_TableTitle)

txt_TableTitle					= CreateElement "ceStringPoly"
txt_TableTitle.name				= "txt_TableTitle_1A_Val"
txt_TableTitle.material			= "font_data_kneeboard"
txt_TableTitle.init_pos			= {ColumnSizeX * 13.5,  Title_Row_1, 0}
txt_TableTitle.formats			= {"%s"}
txt_TableTitle.alignment		= "LeftCenter"
txt_TableTitle.parent_element	= HintsBase.name
txt_TableTitle.stringdefs		= predefined_font_06
txt_TableTitle.controllers		= {{"MRP_Total_ETE"}}
AddElement(txt_TableTitle)

--

txt_TableTitle					= CreateElement "ceStringPoly"
txt_TableTitle.name				= "txt_TableTitle_2"
txt_TableTitle.material			= "font_hints_kneeboard"
txt_TableTitle.init_pos			= {-ColumnSizeX * 23.0,  Title_Row_2, 0}
txt_TableTitle.value			= "TOTAL FUEL:"
txt_TableTitle.alignment		= "LeftCenter"
txt_TableTitle.parent_element	= HintsBase.name
txt_TableTitle.stringdefs		= predefined_font_06
AddElement(txt_TableTitle)

txt_TableTitle					= CreateElement "ceStringPoly"
txt_TableTitle.name				= "txt_TableTitle_2"
txt_TableTitle.material			= "font_data_kneeboard"
txt_TableTitle.init_pos			= {-ColumnSizeX * 11.0,  Title_Row_2, 0}
txt_TableTitle.formats			= {"%1.1f LBS"}
txt_TableTitle.alignment		= "LeftCenter"
txt_TableTitle.parent_element	= HintsBase.name
txt_TableTitle.stringdefs		= predefined_font_06
txt_TableTitle.controllers		= {{"MRP_Total_Fuel"}}
AddElement(txt_TableTitle)

--

txt_TableTitle					= CreateElement "ceStringPoly"
txt_TableTitle.name				= "txt_TableTitle_2A"
txt_TableTitle.material			= "font_hints_kneeboard"
txt_TableTitle.init_pos			= {ColumnSizeX * 2.0,  Title_Row_2, 0}
txt_TableTitle.value			= "WYPT COUNT:"
txt_TableTitle.alignment		= "LeftCenter"
txt_TableTitle.parent_element	= HintsBase.name
txt_TableTitle.stringdefs		= predefined_font_06
AddElement(txt_TableTitle)

txt_TableTitle					= CreateElement "ceStringPoly"
txt_TableTitle.name				= "txt_TableTitle_2A_Val"
txt_TableTitle.material			= "font_data_kneeboard"
txt_TableTitle.init_pos			= {ColumnSizeX * 13.5,  Title_Row_2, 0}
txt_TableTitle.formats			= {"%d"}
txt_TableTitle.alignment		= "LeftCenter"
txt_TableTitle.parent_element	= HintsBase.name
txt_TableTitle.stringdefs		= predefined_font_06
txt_TableTitle.controllers		= {{"MRP_Total_WYPT"}}
AddElement(txt_TableTitle)

--

txt_TableTitle					= CreateElement "ceStringPoly"
txt_TableTitle.name				= "txt_TableTitle_2B"
txt_TableTitle.material			= "font_hints_kneeboard"
txt_TableTitle.init_pos			= {ColumnSizeX * 17.0,  Title_Row_2, 0}
txt_TableTitle.value			= "PAGE:"
txt_TableTitle.alignment		= "LeftCenter"
txt_TableTitle.parent_element	= HintsBase.name
txt_TableTitle.stringdefs		= predefined_font_06
AddElement(txt_TableTitle)

txt_TableTitle					= CreateElement "ceStringPoly"
txt_TableTitle.name				= "txt_TableTitle_2B_Val"
txt_TableTitle.material			= "font_data_kneeboard"
txt_TableTitle.init_pos			= {ColumnSizeX * 22.5,  Title_Row_2, 0}
txt_TableTitle.formats			= {"%d"}
txt_TableTitle.alignment		= "LeftCenter"
txt_TableTitle.parent_element	= HintsBase.name
txt_TableTitle.stringdefs		= predefined_font_06
txt_TableTitle.controllers		= {{"MRP_Page_Count"}}
AddElement(txt_TableTitle)

-- TABLE HEADER

txt_Col01_Title					= CreateElement "ceStringPoly"
txt_Col01_Title.name			= "txt_Col01_Title"
txt_Col01_Title.material		= "font_hints_kneeboard"
txt_Col01_Title.init_pos		= {Base_Col_1,  Table_Row_0, 0}
txt_Col01_Title.value			= "WYPT"
txt_Col01_Title.alignment		= "CenterCenter"
txt_Col01_Title.parent_element	= HintsBase.name
txt_Col01_Title.stringdefs		= predefined_font_06
AddElement(txt_Col01_Title)

txt_Col02_Title					= CreateElement "ceStringPoly"
txt_Col02_Title.name			= "txt_Col02_Title"
txt_Col02_Title.material		= "font_hints_kneeboard"
txt_Col02_Title.init_pos		= {Base_Col_2,  Table_Row_0, 0}
txt_Col02_Title.value			= "NAME"
txt_Col02_Title.alignment		= "CenterCenter"
txt_Col02_Title.parent_element	= HintsBase.name
txt_Col02_Title.stringdefs		= predefined_font_06
AddElement(txt_Col02_Title)

--[[
txt_Col03_Title					= CreateElement "ceStringPoly"
txt_Col03_Title.name			= "txt_Col03_Title"
txt_Col03_Title.material		= "font_hints_kneeboard"
txt_Col03_Title.init_pos		= {Base_Col_3,  Table_Row_0, 0}
txt_Col03_Title.value			= "RMKS"
txt_Col03_Title.alignment		= "CenterCenter"
txt_Col03_Title.parent_element	= HintsBase.name
txt_Col03_Title.stringdefs		= predefined_font_06
AddElement(txt_Col03_Title)
--]]

txt_Col04_Title					= CreateElement "ceStringPoly"
txt_Col04_Title.name			= "txt_Col04_Title"
txt_Col04_Title.material		= "font_hints_kneeboard"
txt_Col04_Title.init_pos		= {ColumnSizeX * 0.0,  Table_Row_0, 0}
txt_Col04_Title.value			= "HDG"
txt_Col04_Title.alignment		= "CenterCenter"
txt_Col04_Title.parent_element	= HintsBase.name
txt_Col04_Title.stringdefs		= predefined_font_06
AddElement(txt_Col04_Title)

txt_Col05_Title					= CreateElement "ceStringPoly"
txt_Col05_Title.name			= "txt_Col05_Title"
txt_Col05_Title.material		= "font_hints_kneeboard"
txt_Col05_Title.init_pos		= {Base_Col_4,  Table_Row_0, 0}
txt_Col05_Title.value			= "D.LEG"
txt_Col05_Title.alignment		= "CenterCenter"
txt_Col05_Title.parent_element	= HintsBase.name
txt_Col05_Title.stringdefs		= predefined_font_06
AddElement(txt_Col05_Title)

txt_Col06_Title					= CreateElement "ceStringPoly"
txt_Col06_Title.name			= "txt_Col06_Title"
txt_Col06_Title.material		= "font_hints_kneeboard"
txt_Col06_Title.init_pos		= {Base_Col_5,  Table_Row_0, 0}
txt_Col06_Title.value			= "D.RMG"
txt_Col06_Title.alignment		= "LeftCenter"
txt_Col06_Title.parent_element	= HintsBase.name
txt_Col06_Title.stringdefs		= predefined_font_06
AddElement(txt_Col06_Title)

txt_Col07_Title					= CreateElement "ceStringPoly"
txt_Col07_Title.name			= "txt_Col07_Title"
txt_Col07_Title.material		= "font_hints_kneeboard"
txt_Col07_Title.init_pos		= {ColumnSizeX * 21.0,  Table_Row_0, 0}
txt_Col07_Title.value			= "ETE LEG"
txt_Col07_Title.alignment		= "CenterCenter"
txt_Col07_Title.parent_element	= HintsBase.name
txt_Col07_Title.stringdefs		= predefined_font_06
AddElement(txt_Col07_Title)

-- ROW 2
Table_Row_0	= Table_Row_0 - LineSizeY * 1.0

txt_Col02_Title					= CreateElement "ceStringPoly"
txt_Col02_Title.name			= "txt_Col02_Title"
txt_Col02_Title.material		= "font_hints_kneeboard"
txt_Col02_Title.init_pos		= {Base_Col_2,  Table_Row_0, 0}
txt_Col02_Title.value			= "RMKS"
txt_Col02_Title.alignment		= "CenterCenter"
txt_Col02_Title.parent_element	= HintsBase.name
txt_Col02_Title.stringdefs		= predefined_font_06
AddElement(txt_Col02_Title)

txt_Col04_Title					= CreateElement "ceStringPoly"
txt_Col04_Title.name			= "txt_Col04_Title"
txt_Col04_Title.material		= "font_hints_kneeboard"
txt_Col04_Title.init_pos		= {ColumnSizeX * 0.0,  Table_Row_0, 0}
txt_Col04_Title.value			= "GS KTS"
txt_Col04_Title.alignment		= "CenterCenter"
txt_Col04_Title.parent_element	= HintsBase.name
txt_Col04_Title.stringdefs		= predefined_font_06
AddElement(txt_Col04_Title)

txt_Col05_Title					= CreateElement "ceStringPoly"
txt_Col05_Title.name			= "txt_Col05_Title"
txt_Col05_Title.material		= "font_hints_kneeboard"
txt_Col05_Title.init_pos		= {Base_Col_4,  Table_Row_0, 0}
txt_Col05_Title.value			= "ALT"
txt_Col05_Title.alignment		= "CenterCenter"
txt_Col05_Title.parent_element	= HintsBase.name
txt_Col05_Title.stringdefs		= predefined_font_06
AddElement(txt_Col05_Title)

txt_Col06_Title					= CreateElement "ceStringPoly"
txt_Col06_Title.name			= "txt_Col06_Title"
txt_Col06_Title.material		= "font_hints_kneeboard"
txt_Col06_Title.init_pos		= {Base_Col_5,  Table_Row_0, 0}
txt_Col06_Title.value			= "D.TTL"
txt_Col06_Title.alignment		= "LeftCenter"
txt_Col06_Title.parent_element	= HintsBase.name
txt_Col06_Title.stringdefs		= predefined_font_06
AddElement(txt_Col06_Title)

txt_Col07_Title					= CreateElement "ceStringPoly"
txt_Col07_Title.name			= "txt_Col07_Title"
txt_Col07_Title.material		= "font_hints_kneeboard"
txt_Col07_Title.init_pos		= {ColumnSizeX * 21.0,  Table_Row_0, 0}
txt_Col07_Title.value			= "ETE ACC"
txt_Col07_Title.alignment		= "CenterCenter"
txt_Col07_Title.parent_element	= HintsBase.name
txt_Col07_Title.stringdefs		= predefined_font_06
AddElement(txt_Col07_Title)

-- TABLE RECORDS (2 ROWS PER ENTRY)
Table_Row_1	= Table_Row_0 - LineSizeY * 1.0

for i = 1, 15 do
	txt_Row01_Col01					= CreateElement "ceStringPoly"
	txt_Row01_Col01.name			= "txt_Row01_Col01" .. string.format("%02d", i)
	txt_Row01_Col01.material		= "font_data_kneeboard"
	txt_Row01_Col01.init_pos		= {Base_Col_1,  Table_Row_1, 0}
	txt_Row01_Col01.value			= string.format("%02d", i)
	txt_Row01_Col01.alignment		= "CenterCenter"
	txt_Row01_Col01.parent_element	= HintsBase.name
	txt_Row01_Col01.stringdefs		= predefined_font_05
	txt_Row01_Col01.controllers		= {{"MRP_Table_Index", i}}
	AddElement(txt_Row01_Col01)
	
	txt_Row01_Col02					= CreateElement "ceStringPoly"
	txt_Row01_Col02.name			= "txt_Row01_Col02" .. string.format("%02d", i)
	txt_Row01_Col02.material		= "font_data_kneeboard"
	txt_Row01_Col02.init_pos		= {-ColumnSizeX * 20.0,  Table_Row_1, 0}
	txt_Row01_Col02.formats			= {"%s"}
	txt_Row01_Col02.alignment		= "LeftCenter"
	txt_Row01_Col02.parent_element	= HintsBase.name
	txt_Row01_Col02.stringdefs		= predefined_font_05
	txt_Row01_Col02.controllers		= {{"MRP_Table_STP_Name", i}}
	AddElement(txt_Row01_Col02)
	
	--[[
	txt_Row01_Col03					= CreateElement "ceStringPoly"
	txt_Row01_Col03.name			= "txt_Row01_Col07" .. string.format("%02d", i)
	txt_Row01_Col03.material		= "font_data_kneeboard"
	txt_Row01_Col03.init_pos		= {-ColumnSizeX * 8.5,  Table_Row_1, 0}
	txt_Row01_Col03.formats			= {"%s"}
	txt_Row01_Col03.alignment		= "LeftCenter"
	txt_Row01_Col03.parent_element	= HintsBase.name
	txt_Row01_Col03.stringdefs		= predefined_font_05
	txt_Row01_Col03.controllers		= {{"MRP_Table_STP_RMKS", i}}
	AddElement(txt_Row01_Col03)
	--]]
	
	txt_Row01_Col04					= CreateElement "ceStringPoly"
	txt_Row01_Col04.name			= "txt_Row01_Col04" .. string.format("%02d", i)
	txt_Row01_Col04.material		= "font_data_kneeboard"
	txt_Row01_Col04.init_pos		= {ColumnSizeX * 0.0,  Table_Row_1, 0}
	txt_Row01_Col04.formats			= {"%03d"}
	txt_Row01_Col04.alignment		= "CenterCenter"
	txt_Row01_Col04.parent_element	= HintsBase.name
	txt_Row01_Col04.stringdefs		= predefined_font_05
	txt_Row01_Col04.controllers		= {{"MRP_Table_STP_HDG", i}}
	AddElement(txt_Row01_Col04)
	
	txt_Row01_Col05					= CreateElement "ceStringPoly"
	txt_Row01_Col05.name			= "txt_Row01_Col05" .. string.format("%02d", i)
	txt_Row01_Col05.material		= "font_data_kneeboard"
	txt_Row01_Col05.init_pos		= {ColumnSizeX * 8.0,  Table_Row_1, 0}
	txt_Row01_Col05.formats			= {"%1.1f"}
	txt_Row01_Col05.alignment		= "RightCenter"
	txt_Row01_Col05.parent_element	= HintsBase.name
	txt_Row01_Col05.stringdefs		= predefined_font_05
	txt_Row01_Col05.controllers		= {{"MRP_Table_STP_LEG", i}}
	AddElement(txt_Row01_Col05)
	
	txt_Row01_Col06					= CreateElement "ceStringPoly"
	txt_Row01_Col06.name			= "txt_Row01_Col06" .. string.format("%02d", i)
	txt_Row01_Col06.material		= "font_data_kneeboard"
	txt_Row01_Col06.init_pos		= {ColumnSizeX * 15.0,  Table_Row_1, 0}
	txt_Row01_Col06.formats			= {"%1.1f"}
	txt_Row01_Col06.alignment		= "RightCenter"
	txt_Row01_Col06.parent_element	= HintsBase.name
	txt_Row01_Col06.stringdefs		= predefined_font_05
	txt_Row01_Col06.controllers		= {{"MRP_Table_STP_RMNG", i}}
	AddElement(txt_Row01_Col06)
	
	txt_Row01_Col07					= CreateElement "ceStringPoly"
	txt_Row01_Col07.name			= "txt_Row01_Col07" .. string.format("%02d", i)
	txt_Row01_Col07.material		= "font_data_kneeboard"
	txt_Row01_Col07.init_pos		= {ColumnSizeX * 24.5,  Table_Row_1, 0}
	txt_Row01_Col07.formats			= {"%s"}
	txt_Row01_Col07.alignment		= "RightCenter"
	txt_Row01_Col07.parent_element	= HintsBase.name
	txt_Row01_Col07.stringdefs		= predefined_font_05
	txt_Row01_Col07.controllers		= {{"MRP_Table_STP_ETE", i}}
	AddElement(txt_Row01_Col07)
	
	-- ROW 2
	Table_Row_1	= Table_Row_1 - LineSizeY * 1.0
	
	txt_Row01_Col02					= CreateElement "ceStringPoly"
	txt_Row01_Col02.name			= "txt_Row01_Col02" .. string.format("%02d", i)
	txt_Row01_Col02.material		= "font_data_kneeboard"
	txt_Row01_Col02.init_pos		= {-ColumnSizeX * 20.0,  Table_Row_1, 0}
	txt_Row01_Col02.formats			= {"%s"}
	txt_Row01_Col02.alignment		= "LeftCenter"
	txt_Row01_Col02.parent_element	= HintsBase.name
	txt_Row01_Col02.stringdefs		= predefined_font_05
	txt_Row01_Col02.controllers		= {{"MRP_Table_STP_RMKS", i}}
	AddElement(txt_Row01_Col02)
	
	txt_Row01_Col04					= CreateElement "ceStringPoly"
	txt_Row01_Col04.name			= "txt_Row01_Col04" .. string.format("%02d", i)
	txt_Row01_Col04.material		= "font_data_kneeboard"
	txt_Row01_Col04.init_pos		= {ColumnSizeX * 0.0,  Table_Row_1, 0}
	txt_Row01_Col04.formats			= {"%1.f"}
	txt_Row01_Col04.alignment		= "CenterCenter"
	txt_Row01_Col04.parent_element	= HintsBase.name
	txt_Row01_Col04.stringdefs		= predefined_font_05
	txt_Row01_Col04.controllers		= {{"MRP_Table_STP_SPD", i}}
	AddElement(txt_Row01_Col04)
	
	txt_Row01_Col05					= CreateElement "ceStringPoly"
	txt_Row01_Col05.name			= "txt_Row01_Col05" .. string.format("%02d", i)
	txt_Row01_Col05.material		= "font_data_kneeboard"
	txt_Row01_Col05.init_pos		= {ColumnSizeX * 8.0,  Table_Row_1, 0}
	txt_Row01_Col05.formats			= {"%1.f"}
	txt_Row01_Col05.alignment		= "RightCenter"
	txt_Row01_Col05.parent_element	= HintsBase.name
	txt_Row01_Col05.stringdefs		= predefined_font_05
	txt_Row01_Col05.controllers		= {{"MRP_Table_STP_ALT", i}}
	AddElement(txt_Row01_Col05)
	
	txt_Row01_Col06					= CreateElement "ceStringPoly"
	txt_Row01_Col06.name			= "txt_Row01_Col06" .. string.format("%02d", i)
	txt_Row01_Col06.material		= "font_data_kneeboard"
	txt_Row01_Col06.init_pos		= {ColumnSizeX * 15.0,  Table_Row_1, 0}
	txt_Row01_Col06.formats			= {"%1.1f"}
	txt_Row01_Col06.alignment		= "RightCenter"
	txt_Row01_Col06.parent_element	= HintsBase.name
	txt_Row01_Col06.stringdefs		= predefined_font_05
	txt_Row01_Col06.controllers		= {{"MRP_Table_STP_TOTAL", i}}
	AddElement(txt_Row01_Col06)
	
	txt_Row01_Col07					= CreateElement "ceStringPoly"
	txt_Row01_Col07.name			= "txt_Row01_Col07" .. string.format("%02d", i)
	txt_Row01_Col07.material		= "font_data_kneeboard"
	txt_Row01_Col07.init_pos		= {ColumnSizeX * 24.5,  Table_Row_1, 0}
	txt_Row01_Col07.formats			= {"%s"}
	txt_Row01_Col07.alignment		= "RightCenter"
	txt_Row01_Col07.parent_element	= HintsBase.name
	txt_Row01_Col07.stringdefs		= predefined_font_05
	txt_Row01_Col07.controllers		= {{"MRP_Table_STP_TLETE", i}}
	AddElement(txt_Row01_Col07)
	
	Table_Row_1	= Table_Row_1 - LineSizeY * 1.0
end

txt_Col01_Title					= CreateElement "ceStringPoly"
txt_Col01_Title.name			= "txt_Col01_Footer"
txt_Col01_Title.material		= "font_hints_kneeboard"
txt_Col01_Title.init_pos		= {Base_Col_1,  Table_Row_1, 0}
txt_Col01_Title.value			= "GLOSSARY"
txt_Col01_Title.alignment		= "LeftCenter"
txt_Col01_Title.parent_element	= HintsBase.name
txt_Col01_Title.stringdefs		= predefined_font_06
AddElement(txt_Col01_Title)

txt_Col01_Title					= CreateElement "ceStringPoly"
txt_Col01_Title.name			= "txt_Col01A_Footer"
txt_Col01_Title.material		= "font_general_keys"
txt_Col01_Title.init_pos		= {ColumnSizeX * 24.5,  Table_Row_1, 0}
txt_Col01_Title.value			= "[RWIN]+[SPACE] FOR NEXT PAGE"
txt_Col01_Title.alignment		= "RightCenter"
txt_Col01_Title.parent_element	= HintsBase.name
txt_Col01_Title.stringdefs		= predefined_font_05
AddElement(txt_Col01_Title)

Table_Row_1	= Table_Row_1 - LineSizeY * 1.0

txt_Col01_Title					= CreateElement "ceStringPoly"
txt_Col01_Title.name			= "txt_Col02_Footer"
txt_Col01_Title.material		= "font_hints_kneeboard"
txt_Col01_Title.init_pos		= {Base_Col_1,  Table_Row_1, 0}
txt_Col01_Title.value			= "ETE: ESTIMATED TIME EN ROUTE"
txt_Col01_Title.alignment		= "LeftCenter"
txt_Col01_Title.parent_element	= HintsBase.name
txt_Col01_Title.stringdefs		= predefined_font_05
AddElement(txt_Col01_Title)

Table_Row_1	= Table_Row_1 - LineSizeY * 1.0

txt_Col01_Title					= CreateElement "ceStringPoly"
txt_Col01_Title.name			= "txt_Col03_Footer"
txt_Col01_Title.material		= "font_hints_kneeboard"
txt_Col01_Title.init_pos		= {Base_Col_1,  Table_Row_1, 0}
txt_Col01_Title.value			= "AAR: AIR-TO-AIR REFUELING ZONE"
txt_Col01_Title.alignment		= "LeftCenter"
txt_Col01_Title.parent_element	= HintsBase.name
txt_Col01_Title.stringdefs		= predefined_font_05
AddElement(txt_Col01_Title)

Table_Row_1	= Table_Row_1 - LineSizeY * 1.0

txt_Col01_Title					= CreateElement "ceStringPoly"
txt_Col01_Title.name			= "txt_Col04_Footer"
txt_Col01_Title.material		= "font_hints_kneeboard"
txt_Col01_Title.init_pos		= {Base_Col_1,  Table_Row_1, 0}
txt_Col01_Title.value			= "TGT: TARGET ZONE"
txt_Col01_Title.alignment		= "LeftCenter"
txt_Col01_Title.parent_element	= HintsBase.name
txt_Col01_Title.stringdefs		= predefined_font_05
AddElement(txt_Col01_Title)

Table_Row_1	= Table_Row_1 - LineSizeY * 1.0

txt_Col01_Title					= CreateElement "ceStringPoly"
txt_Col01_Title.name			= "txt_Col05_Footer"
txt_Col01_Title.material		= "font_hints_kneeboard"
txt_Col01_Title.init_pos		= {Base_Col_1,  Table_Row_1, 0}
txt_Col01_Title.value			= "IP:  BOMB RUN INITIAL POINT"
txt_Col01_Title.alignment		= "LeftCenter"
txt_Col01_Title.parent_element	= HintsBase.name
txt_Col01_Title.stringdefs		= predefined_font_05
AddElement(txt_Col01_Title)

Table_Row_1	= Table_Row_1 - LineSizeY * 1.0

txt_Col01_Title					= CreateElement "ceStringPoly"
txt_Col01_Title.name			= "txt_Col06_Footer"
txt_Col01_Title.material		= "font_hints_kneeboard"
txt_Col01_Title.init_pos		= {Base_Col_1,  Table_Row_1, 0}
txt_Col01_Title.value			= "O/S: WAYPOINT HAS OFFSET"
txt_Col01_Title.alignment		= "LeftCenter"
txt_Col01_Title.parent_element	= HintsBase.name
txt_Col01_Title.stringdefs		= predefined_font_05
AddElement(txt_Col01_Title)


