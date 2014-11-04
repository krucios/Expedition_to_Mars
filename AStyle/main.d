module main;

import std.stdio, std.conv, std.string, std.algorithm, std.file, Automat;

int[] separators = [to!int(';'), to!int('}')]; 

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
		/*
		if (symbol != '\n' && symbol != '\t')
			buffer ~= symbol;
		else
			buffer ~= ' ';
		if (symbol == '"' || symbol == '\'')
			is_quotes_open = !is_quotes_open;
		if (!is_quotes_open)
		{
			foreach (sep; separators)
			{
				if (symbol == sep)
				{
					buffer = strip(buffer);
					buffer ~= "[" ~ to!string(sep) ~ "]";
					writeln (buffer);
					buffer.length = 0;
					break;
				}
			}
		}
		*/
		machine.feed(symbol);
	}
	machine.feed(' '); // For last symbol in machine;
}