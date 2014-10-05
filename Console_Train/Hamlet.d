#! /usr/bin/rdmd

import std.stdio;
import std.algorithm;
import std.string;

void main()
{
	uint[string] freqs;
	foreach (line; stdin.byLine())
	{
		foreach (word; splitter(strip(line)))
		{
			++freqs[word.idup];
		}
	}

	foreach (key, value; freqs)
	{
		writefln("%6u\t%s", value, key);
	}
}
