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
local Base_Col_3	= -ColumnSizeX * 8.0
local Base_Col_4	= -ColumnSizeX * 1.0
local Base_Col_5	=  ColumnSizeX * 3.0

local Table_Row_0	= Page_Title_y - LineSizeY * 1.5
local Table_Row_1	= Table_Row_0 - LineSizeY * 1.0

txt_PageTitle					= CreateElement "ceStringPoly"
txt_PageTitle.name				= "txt_PageTitle"
txt_PageTitle.material			= "font_hints_kneeboard"
txt_PageTitle.init_pos			= {Page_Title_x,  Page_Title_y, 0}
txt_PageTitle.value				= "AWLS CHANNEL LIST"
txt_PageTitle.alignment			= "CenterCenter"
txt_PageTitle.parent_element	= HintsBase.name
txt_PageTitle.stringdefs		= predefined_font_10
AddElement(txt_PageTitle)

-- TABLE HEADER

txt_Col01_Title					= CreateElement "ceStringPoly"
txt_Col01_Title.name			= "txt_Col01_Title"
txt_Col01_Title.material		= "font_hints_kneeboard"
txt_Col01_Title.init_pos		= {Base_Col_1,  Table_Row_0, 0}
txt_Col01_Title.value			= "CHNL"
txt_Col01_Title.alignment		= "CenterCenter"
txt_Col01_Title.parent_element	= HintsBase.name
txt_Col01_Title.stringdefs		= predefined_font_06
AddElement(txt_Col01_Title)

txt_Col02_Title					= CreateElement "ceStringPoly"
txt_Col02_Title.name			= "txt_Col02_Title"
txt_Col02_Title.material		= "font_hints_kneeboard"
txt_Col02_Title.init_pos		= {Base_Col_2,  Table_Row_0, 0}
txt_Col02_Title.value			= "FREQ"
txt_Col02_Title.alignment		= "CenterCenter"
txt_Col02_Title.parent_element	= HintsBase.name
txt_Col02_Title.stringdefs		= predefined_font_06
AddElement(txt_Col02_Title)

txt_Col03_Title					= CreateElement "ceStringPoly"
txt_Col03_Title.name			= "txt_Col03_Title"
txt_Col03_Title.material		= "font_hints_kneeboard"
txt_Col03_Title.init_pos		= {Base_Col_3,  Table_Row_0, 0}
txt_Col03_Title.value			= "TACAN"
txt_Col03_Title.alignment		= "CenterCenter"
txt_Col03_Title.parent_element	= HintsBase.name
txt_Col03_Title.stringdefs		= predefined_font_06
AddElement(txt_Col03_Title)

txt_Col04_Title					= CreateElement "ceStringPoly"
txt_Col04_Title.name			= "txt_Col04_Title"
txt_Col04_Title.material		= "font_hints_kneeboard"
txt_Col04_Title.init_pos		= {Base_Col_4,  Table_Row_0, 0}
txt_Col04_Title.value			= "RUNWAY"
txt_Col04_Title.alignment		= "CenterCenter"
txt_Col04_Title.parent_element	= HintsBase.name
txt_Col04_Title.stringdefs		= predefined_font_06
AddElement(txt_Col04_Title)

txt_Col05_Title					= CreateElement "ceStringPoly"
txt_Col05_Title.name			= "txt_Col05_Title"
txt_Col05_Title.material		= "font_hints_kneeboard"
txt_Col05_Title.init_pos		= {Base_Col_5,  Table_Row_0, 0}
txt_Col05_Title.value			= "AIRPORT"
txt_Col05_Title.alignment		= "LeftCenter"
txt_Col05_Title.parent_element	= HintsBase.name
txt_Col05_Title.stringdefs		= predefined_font_06
AddElement(txt_Col05_Title)


-- TABLE RECORDS
for i = 1, 20 do
	txt_Row01_Col01					= CreateElement "ceStringPoly"
	txt_Row01_Col01.name			= "txt_Row01_Col01" .. string.format("%02d", i)
	txt_Row01_Col01.material		= "font_data_kneeboard"
	txt_Row01_Col01.init_pos		= {Base_Col_1,  Table_Row_1, 0}
	txt_Row01_Col01.formats			= {"%02d"}
	txt_Row01_Col01.alignment		= "CenterCenter"
	txt_Row01_Col01.parent_element	= HintsBase.name
	txt_Row01_Col01.stringdefs		= predefined_font_06
	txt_Row01_Col01.controllers		= {{"AWLS_Channel", i}}
	AddElement(txt_Row01_Col01)
	
	txt_Row01_Col02					= CreateElement "ceStringPoly"
	txt_Row01_Col02.name			= "txt_Row01_Col02" .. string.format("%02d", i)
	txt_Row01_Col02.material		= "font_data_kneeboard"
	txt_Row01_Col02.init_pos		= {Base_Col_2,  Table_Row_1, 0}
	txt_Row01_Col02.formats			= {"%3.3f"}
	txt_Row01_Col02.alignment		= "CenterCenter"
	txt_Row01_Col02.parent_element	= HintsBase.name
	txt_Row01_Col02.stringdefs		= predefined_font_06
	txt_Row01_Col02.controllers		= {{"AWLS_Frequency", i}}
	AddElement(txt_Row01_Col02)
	
	txt_Row01_Col03					= CreateElement "ceStringPoly"
	txt_Row01_Col03.name			= "txt_Row01_Col03" .. string.format("%02d", i)
	txt_Row01_Col03.material		= "font_data_kneeboard"
	txt_Row01_Col03.init_pos		= {Base_Col_3,  Table_Row_1, 0}
	txt_Row01_Col03.formats			= {"%02d%s"}
	txt_Row01_Col03.alignment		= "CenterCenter"
	txt_Row01_Col03.parent_element	= HintsBase.name
	txt_Row01_Col03.stringdefs		= predefined_font_06
	txt_Row01_Col03.controllers		= {{"AWLS_TACAN", i}}
	AddElement(txt_Row01_Col03)
	
	txt_Row01_Col04					= CreateElement "ceStringPoly"
	txt_Row01_Col04.name			= "txt_Row01_Col04" .. string.format("%02d", i)
	txt_Row01_Col04.material		= "font_data_kneeboard"
	txt_Row01_Col04.init_pos		= {Base_Col_4,  Table_Row_1, 0}
	txt_Row01_Col04.value			= {"%s"}
	txt_Row01_Col04.alignment		= "CenterCenter"
	txt_Row01_Col04.parent_element	= HintsBase.name
	txt_Row01_Col04.stringdefs		= predefined_font_06
	txt_Row01_Col04.controllers		= {{"AWLS_Runway", i}}
	AddElement(txt_Row01_Col04)
	
	txt_Row01_Col05					= CreateElement "ceStringPoly"
	txt_Row01_Col05.name			= "txt_Row01_Col05" .. string.format("%02d", i)
	txt_Row01_Col05.material		= "font_data_kneeboard"
	txt_Row01_Col05.init_pos		= {Base_Col_5,  Table_Row_1, 0}
	txt_Row01_Col05.value			= {"%s"}
	txt_Row01_Col05.alignment		= "LeftCenter"
	txt_Row01_Col05.parent_element	= HintsBase.name
	txt_Row01_Col05.stringdefs		= predefined_font_06
	txt_Row01_Col05.controllers		= {{"AWLS_Airport", i}}
	AddElement(txt_Row01_Col05)
	
	Table_Row_1	= Table_Row_1 - LineSizeY * 1.0
end

-- Traget Points 
local TPage_Title_y	= Table_Row_1 - LineSizeY * 1.35

txt_SectionTitle				= CreateElement "ceStringPoly"
txt_SectionTitle.name			= "txt_SectionTitle"
txt_SectionTitle.material		= "font_hints_kneeboard"
txt_SectionTitle.init_pos		= {Page_Title_x,  TPage_Title_y, 0}
txt_SectionTitle.value			= "TARGET LIST"
txt_SectionTitle.alignment		= "CenterCenter"
txt_SectionTitle.parent_element	= HintsBase.name
txt_SectionTitle.stringdefs		= predefined_font_10
AddElement(txt_SectionTitle)

TPage_Title_y	= TPage_Title_y - LineSizeY * 1.35

txt_SectionHelp					= CreateElement "ceStringPoly"
txt_SectionHelp.name			= "txt_SectionHelp"
txt_SectionHelp.material		= "font_general_keys"
txt_SectionHelp.init_pos		= {Page_Title_x,  TPage_Title_y, 0}
txt_SectionHelp.value			= "(PRESS RS+RA+[8] FOR LOADING INTO AIRCRAFT)"
txt_SectionHelp.alignment		= "CenterCenter"
txt_SectionHelp.parent_element	= HintsBase.name
txt_SectionHelp.stringdefs		= predefined_font_05
AddElement(txt_SectionHelp)

local TTable_Row_0	= TPage_Title_y - LineSizeY * 1.5
local TTable_Row_1	= TTable_Row_0 - LineSizeY * 1.0

Base_Col_2	= -ColumnSizeX * 9
Base_Col_3	=  ColumnSizeX * 1.0
Base_Col_4	=  ColumnSizeX * 5.5
Base_Col_5	=  ColumnSizeX * 10.0


txt_TPCol01_Title					= CreateElement "ceStringPoly"
txt_TPCol01_Title.name				= "txt_TPCol01_Title"
txt_TPCol01_Title.material			= "font_hints_kneeboard"
txt_TPCol01_Title.init_pos			= {Base_Col_1,  TTable_Row_0, 0}
txt_TPCol01_Title.value				= "INDX"
txt_TPCol01_Title.alignment			= "CenterCenter"
txt_TPCol01_Title.parent_element	= HintsBase.name
txt_TPCol01_Title.stringdefs		= predefined_font_06
AddElement(txt_TPCol01_Title)

txt_TPCol02_Title					= CreateElement "ceStringPoly"
txt_TPCol02_Title.name				= "txt_TPCol02_Title"
txt_TPCol02_Title.material			= "font_hints_kneeboard"
txt_TPCol02_Title.init_pos			= {Base_Col_2,  TTable_Row_0, 0}
txt_TPCol02_Title.value				= "MGRS COORD"
txt_TPCol02_Title.alignment			= "CenterCenter"
txt_TPCol02_Title.parent_element	= HintsBase.name
txt_TPCol02_Title.stringdefs		= predefined_font_06
AddElement(txt_TPCol02_Title)

txt_TPCol04_Title					= CreateElement "ceStringPoly"
txt_TPCol04_Title.name				= "txt_TPCol04_Title"
txt_TPCol04_Title.material			= "font_hints_kneeboard"
txt_TPCol04_Title.init_pos			= {Base_Col_4,  TTable_Row_0, 0}
txt_TPCol04_Title.value				= "ELEV."
txt_TPCol04_Title.alignment			= "CenterCenter"
txt_TPCol04_Title.parent_element	= HintsBase.name
txt_TPCol04_Title.stringdefs		= predefined_font_06
AddElement(txt_TPCol04_Title)

txt_TPCol05_Title					= CreateElement "ceStringPoly"
txt_TPCol05_Title.name				= "txt_TPCol05_Title"
txt_TPCol05_Title.material			= "font_hints_kneeboard"
txt_TPCol05_Title.init_pos			= {Base_Col_5,  TTable_Row_0, 0}
txt_TPCol05_Title.value				= "RECORD"
txt_TPCol05_Title.alignment			= "LeftCenter"
txt_TPCol05_Title.parent_element	= HintsBase.name
txt_TPCol05_Title.stringdefs		= predefined_font_06
AddElement(txt_TPCol05_Title)

Base_Col_4	=  ColumnSizeX * 7.5
Base_Col_5	=  ColumnSizeX * 10.0

for i = 1, 10 do
	txt_TPRow_Col01					= CreateElement "ceStringPoly"
	txt_TPRow_Col01.name			= "txt_TPRow_Col01" .. string.format("%02d", i)
	txt_TPRow_Col01.material		= "font_data_kneeboard"
	txt_TPRow_Col01.init_pos		= {Base_Col_1,  TTable_Row_1, 0}
	txt_TPRow_Col01.formats			= {"T%02d"}
	txt_TPRow_Col01.alignment		= "CenterCenter"
	txt_TPRow_Col01.parent_element	= HintsBase.name
	txt_TPRow_Col01.stringdefs		= predefined_font_06
	txt_TPRow_Col01.controllers		= {{"TP_Index", i}}
	AddElement(txt_TPRow_Col01)
	
	txt_TPRow_Col02					= CreateElement "ceStringPoly"
	txt_TPRow_Col02.name			= "txt_TPRow_Col02" string.format("%02d", i)
	txt_TPRow_Col02.material		= "font_data_kneeboard"
	txt_TPRow_Col02.init_pos		= {Base_Col_2,  TTable_Row_1, 0}
	txt_TPRow_Col02.formats			= {"%s %s %d%d"}
	txt_TPRow_Col02.alignment		= "CenterCenter"
	txt_TPRow_Col02.parent_element	= HintsBase.name
	txt_TPRow_Col02.stringdefs		= predefined_font_06
	txt_TPRow_Col02.controllers		= {{"TP_MGRS", i}}
	AddElement(txt_TPRow_Col02)
	
	txt_TPRow_Col04					= CreateElement "ceStringPoly"
	txt_TPRow_Col04.name			= "txt_TPRow_Col04" string.format("%02d", i)
	txt_TPRow_Col04.material		= "font_data_kneeboard"
	txt_TPRow_Col04.init_pos		= {Base_Col_4,  TTable_Row_1, 0}
	txt_TPRow_Col04.formats			= {"%1.0f"}
	txt_TPRow_Col04.alignment		= "RightCenter"
	txt_TPRow_Col04.parent_element	= HintsBase.name
	txt_TPRow_Col04.stringdefs		= predefined_font_06
	txt_TPRow_Col04.controllers		= {{"TP_Elevation", i}}
	AddElement(txt_TPRow_Col04)
	
	txt_TPRow_Col05					= CreateElement "ceStringPoly"
	txt_TPRow_Col05.name			= "txt_TPRow_Col05" string.format("%02d", i)
	txt_TPRow_Col05.material		= "font_data_kneeboard"
	txt_TPRow_Col05.init_pos		= {Base_Col_5,  TTable_Row_1, 0}
	txt_TPRow_Col05.formats			= {"%s"}
	txt_TPRow_Col05.alignment		= "LeftCenter"
	txt_TPRow_Col05.parent_element	= HintsBase.name
	txt_TPRow_Col05.stringdefs		= predefined_font_06
	txt_TPRow_Col05.controllers		= {{"TP_Name", i}}
	AddElement(txt_TPRow_Col05)
	
	TTable_Row_1	= TTable_Row_1 - LineSizeY * 1.0
end

TPage_Title_y	= TTable_Row_0 - LineSizeY * 3.35

txt_SectionTitle				= CreateElement "ceStringPoly"
txt_SectionTitle.name			= "txt_SectionTitle"
txt_SectionTitle.material		= "font_data_kneeboard"
txt_SectionTitle.init_pos		= {Page_Title_x,  TPage_Title_y, 0}
txt_SectionTitle.value			= "NO TARGETS LOADED"
txt_SectionTitle.alignment		= "CenterCenter"
txt_SectionTitle.parent_element	= HintsBase.name
txt_SectionTitle.stringdefs		= predefined_font_10
txt_SectionTitle.controllers	= {{"TP_NotPresent"}}
AddElement(txt_SectionTitle)
