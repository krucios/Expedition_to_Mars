module main;

import  std.stdio, 
		std.conv, 
		std.string, 
		std.algorithm, 
		std.file,
		std.json,
		std.process,
		Automat, 
		BNFParesr;

void main(string[] args)
{
	Automat machine = new Automat;

	string text = readText("../../Files/input.txt");
	foreach (symbol; text)
	{
		writef ("[%03d]", symbol);
	}

	writeln ("\n** Start lexical analyze **");
	string buffer;

	foreach (symbol; text)
	{
		machine.feed(symbol);
	}
	machine.feed(' '); // For last symbol in machine;
	writeln (machine.text);
	
	// JSON Train ***************************************

	JSONValue[string] tree = parseBNF("../../Files/BNF.json").object;
	string letters = tree["letter"].str;

	assert(letters == "a|b|c|d|e|f|g|h|i|j|k|l|m|n|o|p|q|r|s|t|u|v|w|x|y|z|A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z");
}