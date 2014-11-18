module BNFParesr;

import std.string, 
       std.json,
	   std.file;

JSONValue parseBNF(string path_to_json = "Files/BNF.json")
{
	return parseJSON(chompPrefix(readText(path_to_json), "\xEF\xBB\xBF"));
}

