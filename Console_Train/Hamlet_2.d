#! /usr/bin/rdmd

import std.stdio, std.algorithm, std.string, std.conv, std.regex, std.range;
import std.ascii;

struct PersonaData
{
	uint totalWords;
	uint[string] wordCount; 
}

void main()
{
	// Input data
	PersonaData[string] info;
	string currentParagraph;
	foreach (line; stdin.byLine())
	{
		if (line.startsWith("    ")
		    && line.length > 4
		    && isAlpha(line[4]))
		{
			currentParagraph ~= line[3 .. $];
		} else 
		if (line.startsWith("  ")
		    && line.length > 2
		    && isAlpha(line[2]))
		{
			addParagraph(currentParagraph, info);
			currentParagraph = to!string(line[2 .. $]);
		}
	}
	printResults(info);
}

void addParagraph(string line, ref PersonaData[string] info)
{
	line = strip(line);
	auto sentence = std.algorithm.find(line, ". ");
	if (sentence.empty)
	{
		return;
	}
	auto persona = line[0 .. $ - sentence.length];
	sentence = toLower(strip(sentence[2 .. $]));
	auto words = split(sentence, regex("[ \t,.;:?]+"));
	if (!(persona in info))
	{
		info[persona] = PersonaData();
	}
	info[persona].totalWords += words.length;
	foreach (word; words)
		++info[persona].wordCount[word];
}

void printResults(PersonaData[string] info)
{
	foreach (persona, data; info)
	{
		writefln("%20s %6u %6u", persona, data.totalWords, data.wordCount.length);
	}
}
