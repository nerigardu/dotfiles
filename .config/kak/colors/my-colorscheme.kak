evaluate-commands %sh{

prim='rgb:5725c8'
sec1='rgb:854821'
sec2='rgb:b7632e'
sec3='rgb:b77a54'
hlt1='rgb:082dff'
hlt2='rgb:ff6200'
hlt3='rgb:be00ff'

# code

echo "
	face global value rgb:ffffff,default
	face global type rgb:dedede,default
	face global identifier rgb:e0d86c,default
	face global string ${sec3},default
	face global error default,rgb:ffffff
	face global keyword ${prim},default+b
	face global operator ${hlt1},default
	face global attribute rgb:ffffff,default
	face global comment ${sec1},default
	face global module ${hlt3},default
	face global variable ${hlt2},default
	face global meta rgb:878787,default
"

# text

echo "
	face global title rgb:ffffff,default+b
	face global header rgb:ffffff,default
	face global bold rgb:ffffff,default+b
	face global italic rgb:ededed,default+i
	face global mono rgb:cccccc,rgb:212121
	face global block rgb:cccccc,rgb:212121
	face global link rgb:ffffff,default
	face global bullet rgb:ffffff,default
	face global list rgb:dedede,default
"

# kakoune UI

echo "
	face global Default rgb:cccccc,rgb:000000
	face global PrimarySelection rgb:000000,${sec1}
	face global SecondarySelection rgb:121212,rgb:ababab
	face global PrimaryCursor rgb:000000,rgb:ffffff+b
	face global SecondaryCursor rgb:121212,rgb:dedede+b
	face global MatchingChar default,rgb:333333
	face global Search default,rgb:333333
	face global Whitespace default,rgb:333333
	face global BufferPadding rgb:333333,default
	face global LineNumbers rgb:333333,default
	face global LineNumberCursor rgb:666666,default
	face global MenuForeground rgb:000000,${hlt2}
	face global MenuBackground default,rgb:333333
	face global MenuInfo default,rgb:545454
	face global Information rgb:000000,${sec1}
	face global Error rgb:121212,rgb:dedede
	face global StatusLine rgb:cccccc,rgb:212121
	face global StatusLineMode rgb:000000,${hlt2}
	face global StatusLineInfo rgb:ffffff,rgb:333333
	face global StatusLineValue rgb:ffffff,rgb:454545
        face global PrimaryCursorEol black,${hlt1}+fg
	face global StatusCursor default,rgb:787878
	face global Prompt rgb:000000,${sec1}
"
}
