module main;

import std.stdio, std.conv, std.string, std.algorithm, std.file, Automat;

int[] separators = [to!int(';'), to!int('}')]; 

void main(string[] args)
{
	Automat machine = new Automat;

	string text = readText("../../Files/input.txt");

	writeln ("** Start lexical analyze **");
	string buffer;
	bool is_quotes_open = false;
	foreach (symbol; detab(text, 1))
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
}