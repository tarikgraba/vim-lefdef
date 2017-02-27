" Vim filetype plugin file
" Language:	DEF (Design Exchange Format)
" Maintainer:	Levon Ohanyan <lvnohayan@gmail.com>
" Last Change:	Mon Nov 18 16:38:32 AMT 2013
" Version: 1.0

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

set nofoldenable

" DEF global const
syn keyword global_const VERSION DIVIDERCHAR BUSBITCHARS NAMESCASESENSITIVE

" DEF keywords
syn keyword basic_keywords DISTANCE MICRONS DESIGN DIEAREA

" DEF sections
syn keyword def_sec TECHNOLOGY UNITS HISTORY PROPERTYDEFINITIONS DIEAREA
syn keyword def_sec ROW ROWS TRACKS GCELLGRID VIAS STYLES NONDEFAULTRULES
syn keyword def_sec REGIONS COMPONENTS PINS PINPROPERTIES BLOCKAGES
syn keyword def_sec SLOTS FILLS SPECIALNETS NETS SCANCHAINS GROUPS
syn keyword def_sec BEGINEXT CREATOR DATE REVISION ENDEXT
syn match def_sec "END\s" contained contains=def_sec

" DEF constants (for example lib_cell name)
syn match def_const "\<[A-Z][A-Z0-9_]\+\>" contains=def_sec

syn match error "\v(END\s.*)" contains=ALLBUT,def_sec
hi def link error Error

syn keyword local_var POLYGON RECT

" DEF component props
syn keyword comp_props EEQMASTER HALO ROUTEHALO WEIGHT REGION PROPERTY
syn match comp_props "\v^(SOURCE)&(.*NETLIST|.*DIST|.*USER|.*TIMING|.*TEST)"

" DEF orientations
syn keyword orientation N  "(North)         R0
syn keyword orientation S  "(South)         R180
syn keyword orientation W  "(West)          R90
syn keyword orientation E  "(East)          R270
syn keyword orientation FN "(Flipped North) MY
syn keyword orientation FS "(Flipped South) MX
syn keyword orientation FW "(Flipped West)  MX90
syn keyword orientation FE "(Flipped East)  MY90

" DEF placed state
syn keyword pl_state FIXED COVER PLACED UNPLACED

syn keyword bl_type PUSHDOWN COMPONENT FILLS SPACING DESIGNRULEWIDTH
syn keyword bl_type SLOTS EXCEPTPGNET PLACEMENT SOFT PARTIAL

syn keyword fill_props OPC VIA

syn keyword def_oper DO BY STEP

" DEF net properties
syn keyword net_props PIN SYNTHESIZED MUSTJOIN SHIELDNET VPIN SUBNET
syn keyword net_props NONDEFAULTRULE XTALK FIXEDBUMP FREQUENCY ORIGINAL
syn match net_props "\v^(USE)&(.*ANALOG|.*CLOCK|.*GROUND|.*POWER|.*RESET|.*SCAN|.*SIGNAL|.*TIEOFF)"
syn match net_props "\v^(PATTERN)&(.*BALANCED|.*STEINER|.*TRUNK|.*WIREDLOGIC)"
syn keyword net_props ESTCAP WEIGHT PROPERTY TAPER TAPERRULE STYLE ROUTED NOSHIELD

" DEF NDR properties
syn keyword ndr_props HARDSPACING WIDTH DIAGWIDTH SPACING WIREEXT VIA VIARULE MINCUTS PROPERTY

" DEF pin properties
syn keyword pin_props SPECIAL NETEXPR SUPPLYSENSITIVITY GROUNDSENSITIVITY
syn keyword pin_props ANTENNAPINPARTIALMETALAREA ANTENNAPINPARTIALMETALSIDEAREA
syn keyword pin_props ANTENNAPINPARTIALCUTAREA ANTENNAPINDIFFAREA
syn match pin_props "\v^(ANTENNAMODEL)&(.*OXIDE1|.*OXIDE2|.*OXIDE3|.*OXIDE4)"
syn match pin_props "\v^(DIRECTION)&(.*INPUT|.*OUTPUT|.*INOUT|.*FEEDTHRU)"
syn keyword pin_props ANTENNAPINGATEAREA ANTENNAPINMAXAREACAR ANTENNAPINMAXSIDEAREACAR
syn keyword pin_props ANTENNAPINMAXCUTCAR PORT DESIGNRULEWIDTH PINPROPERTIES

syn match region_props "\v^(TYPE)&(.*FENCE|.*GUIDE)"

syn keyword scanchain_props PARTITION MAXBITS COMMONSCANPINS IN OUT START FLOATING BITS ORDERED STOP

" DEF special net properties
syn keyword special_net_props VOLTAGE STYLE
syn match special_net_props "\v^(SHAPE)&(.*RING|.*PADRING|.*BLOCKRING.*|.*STRIPE.*|.*FOLLOWPIN|.*IOWIRE|.*COREWIRE|.*BLOCKWIRE|.*BLOCKAGEWIRE|.*FILLWIRE|.*FILLWIREOPC|.*DRCFILL)"

syn keyword viarule_props CUTSIZE LAYERS CUTSPACING ENCLOSURE ROWCOL ORIGIN OFFSET PATTERN

" LAYERS
syn keyword layer LAYER
syn keyword layer_types  METAL1 METAL2 METAL3 METAL4 METAL5 METAL6 METAL7
syn keyword layer_types  METAL8 METAL9 METAL10 METAL11 METAL12 METAL13 METAL14
syn keyword layer_types  METAL15 METAL16 METAL17 METAL18 METAL19 METAL20
syn keyword layer_types  M1 M2 M3 M4 M5 M6 M7 M8 M9 M10 M11 M12 M13 M14 M15 M16 M17 M18 M19 M20
syn keyword layer_types  m1 m2 m3 m4 m5 m6 m7 m8 m9 m10 m11 m12 m13 m14 m15 m16 m17 m18 m19 m20
syn keyword layer_types  VIA01 VIA12 VIA23 VIA34 VIA45
syn keyword layer_types  VIA56 VIA67 VIA78 VIA89 VIA910
syn keyword layer_types  VIA1011 VIA1112 VIA1213 VIA1314 VIA1415
syn keyword layer_types  VIA1516 VIA1617 VIA1718 VIA1819 VIA1920
syn keyword layer_types  VIA1 VIA2 VIA3 VIA4 VIA5 VIA6 VIA7 VIA8 VIA9 VIA10 VIA11 VIA12
syn keyword layer_types  VIA13 VIA14 VIA15 VIA16 VIA17 VIA18 VIA19 VIA20
syn keyword layer_types  TEXT1  TEXT2  TEXT3  TEXT4  TEXT5
syn keyword layer_types  TEXT6  TEXT7  TEXT8  TEXT9  TEXT10
syn keyword layer_types  TEXT11 TEXT12 TEXT13 TEXT14 TEXT15
syn keyword layer_types  TEXT16 TEXT17 TEXT18 TEXT19 TEXT20

syn keyword todo contained TODO FIXME XXX NOTE FIXME: XXX: TODO:
syn match comment "#.*$" contains=todo

" Regular int like number can contain -/+ in front
syn match nums '[ -]\d\+\ \d*'
syn match nums '[ +]\d\+\ \d*'
syn match nums '[ .]\d\+\ \d*'

" Floating point numbers (+/-)
syn match nums '\d\+\.\d*'
syn match nums '[-+]\d\+\.\d*'

" Floating point like numbers can contain e/E (+,-)
syn match nums '[-+]\=\d[[:digit:]]*[eE][\-+]\=\d\+'
syn match nums '\d[[:digit:]]*[eE][\-+]\=\d\+'
syn match nums '[-+]\=\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+'
syn match nums '\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+'

syn match ErrorNumber  ' -\0\ '

syn region str start='"' end='"'
hi link str String

set showmatch

hi def link basic_keywords      Keyword
hi def link todo                Todo
hi def link comment             Comment
hi def link class_type          Type
hi def link nums                Number
hi def link ErrorNumber         Error
hi def link layer               EnumerationName
hi def link layer_types         Typedef
hi def link local_var           Label
hi def link global_const        Define
hi def link comp_props          Property
hi def link orientation         Property
hi def link pl_state            EnumerationValue
hi def link net_props           Property
hi def link bl_type             Type
hi def link def_oper            Repeat
hi def link net_props           Property
hi def link ndr_props           Property
hi def link pin_props           Property
hi def link region_props        Property
hi def link scanchain_props     Property
hi def link special_net_props   Property
hi def link viarule_props       Property
hi def link def_const           Constant

if has('gui_running')
    hi def_sec gui=bold guifg=Turquoise guibg=black
else
    hi def link def_sec Namespace
endif

let b:current_syntax = "def"

