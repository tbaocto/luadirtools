# luadirtools
Lua Library for operating on Directories 


Compilation:

$>fpc -fPIC dirtools.pas

HINT: This library requires the lua5.3 header files from https://github.com/malcome/Lua4Lazarus. Compile also lua53.pas with fpc option -fPIC, otherwise the linking process may fail.

Current functions:

readdir(path)	-	Retrieves the content of a certain path. Consider that the function supports globbing, hence, for instance, to retrieve the whole content of an exemplary path, you need to add an "*" at the end of the path, e.g., "/my/example/path/\*"




