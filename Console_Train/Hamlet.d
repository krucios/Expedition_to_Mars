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
	string[] words = freqs.keys;
	sort!((a, b) 
		{
			return freqs[a] > freqs[b];
		})(words);
	foreach (word; words)
	{
		writefln("%6u\t%s", freqs[word], word);
	}
}
