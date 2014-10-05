#! /usr/bin/rdmd

import std.stdio;

void main()
{
	int[] months = new int[12];
	foreach(int i, ref e; months)
	{
		e = i + 1;
		writeln("--", i);
	}
}
