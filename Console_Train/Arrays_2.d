#! /usr/bin/rdmd

import std.array, std.stdio;

bool binarySearch(T)(T[] input, T value)
{
	while (!input.empty)
	{
		auto i = input.length / 2;
		auto mid = input[i];
		if (mid > value)
			input = input[0 .. i];
		else if (mid < value)
			input = input[i + 1 .. $];
		else 
			return true;  
	}
	return false;
}

bool binarySearchRec(T)(T[] input, T value)
{
	if (input.empty)
		return false;
	auto i = input.length / 2;
	auto mid = input[i];
	if (mid < value)
		return binarySearchRec(input[i + 1 .. $], value);
	if (mid > value)
		return binarySearchRec(input[0 .. i], value);
	return true;
}

unittest 
{
	assert(binarySearch([1, 4, 5, 2, 7, 3], 5));
	assert(binarySearchRec([1, 2, 3], 4));
}

void main()
{
	writeln ("Hello, world!");
}
