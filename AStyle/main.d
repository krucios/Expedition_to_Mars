module main;

import std.stdio, std.conv, std.string, std.algorithm, std.file, Automat;

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
}