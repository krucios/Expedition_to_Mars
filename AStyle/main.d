module main;

import std.stdio, std.conv, std.string, std.algorithm;

string[] separators = [" ", ",", ".", "-", ":"]; 

void main(string[] args)
{
	writeln ("** Start lexical analyze **");
	foreach (line; stdin.byLine())
	{
		foreach (symbol; line)
		{
			writeln (symbol);
		}
	}
}

