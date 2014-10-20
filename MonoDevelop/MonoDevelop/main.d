module main;

import std.stdio;

void main(string[] args)
{
	for (auto i = 0; i < 10; ++i)
		writeln("Hello World!");
	
	// Lets the user press <Return> before program returns
	stdin.readln();
}

