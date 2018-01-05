

library dirtools;
{$mode delphi}

uses sysutils, lua53;

var
	mylib : Array[0..1] of luaL_reg;

function readdir(l: plua_state): Integer; cdecl;
var
	sr : TSearchRec;
	path: String;
	c: Integer;
begin
	if not (lua_isstring(l, 1)) then begin
		luaL_error(l, 'Path must be provided as String');
	end;

	path := lua_tolstring(l, 1, nil);
	if findFirst(path, faAnyFile and faDirectory,sr) = 0 then
		begin
			c := 1;
			lua_createtable(l,0,0);
			repeat
				lua_pushinteger(l, c);
				lua_pushlstring(l, PChar(sr.name), length(sr.name));
				lua_settable(l, 2);
				lua_settop(l, 2);
				c := c+1;
			until findNext(sr)<>0
		end;
	result := 1;
end;


function luaopen_libdirtools(l: plua_state): Integer;
var
	f1,e: luaL_reg;
begin
	f1.name := 'readdir';
	f1.func := @readdir;
	e.name := nil;
	e.func := nil;
	mylib[0] := f1;
	mylib[1] := e;
	luaL_newlib(l, mylib);
	result := 1;
end;


exports
	luaopen_libdirtools;

end.
