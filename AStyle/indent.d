#! /usr/bin/rdmd

import std.stdio, std.string;

void main()
{
	uint nOpenBrackets = 0;
	foreach (line; stdin.byLine())
	{
		uint prev = nOpenBrackets;
		foreach (char c; line)
		{
			if (c == '{')
				++nOpenBrackets;
			if (c == '}')
				--nOpenBrackets;
		}
		if (prev > nOpenBrackets)
		{
			for (uint i; i < nOpenBrackets; ++i)
				write("    ");
		} else
		{
			for (uint i; i < prev; ++i)
				write("    ");
		}
		writeln(line);
	}
}
