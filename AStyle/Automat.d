module Automat;

import std.stdio, std.conv;

struct lichar
{
	string c; // if isDefined then c should contain only 1 symbol
	bool isDefined = false; // TRUE when char is symbol of the text and FALSE when it is 

	this (string symbol)
	{
		c = symbol;
		if (symbol.length == 1)
			isDefined = true;
	}
}

class Automat
{
private:
	bool flag_s;
	bool flag_n;
	bool flag_o;

	lichar[] current_word;
	lichar[] _text;

	string letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_";
	string numbers = "0123456789";
	string operators = "+-*/<>=&|~!:.%?,^";
	immutable char[] separators = [' ', '\t', '\n', '(', ')', ';', '{', '}'];
	immutable char[] spacers = " " ~ "\t" ~ symbl_nl;
	immutable char symbl_nl = '\n';

public:
	this()
	{
		current_word = null;
		_text = null;
	}

	@property string text()
	{
		string ans;
		foreach (lichar c; _text)
		{
			ans ~= c.c;
		}
		return ans;
	}

	void feed(char c)
	{
		if (!current_word.length)
		{
			if (isSpacer(c))
				return;
			flag_s = isLetter((c));
			flag_n = isNumber((c));
			flag_o = isOperator((c));
			current_word ~= lichar(to!string(c));
			return;
		}
		if (!isSeparator(c))
		{
			if (isLetter(c) || isNumber(c) && flag_s)
				current_word ~= lichar(to!string(c));
			else
			{
				if (isNumber(c) && flag_n)
					current_word ~= lichar(to!string(c));
				else
				{
					if (isOperator(c) && flag_o)
						current_word ~= lichar(to!string(c));
					else
					{ // needed to rethink this branch
						if (/*endOfLine(current_word)*/ c == symbl_nl)
						{
							//current_word ~= NEWLINE;
							current_word ~= lichar("[NL]\n");

							_text ~= current_word;
							current_word.length = 0;
							//current_word ~= TAB;
							current_word ~= lichar("[TAB]");
						}
						else
						{
							//current_word ~= SPACE;
							current_word ~= lichar("[SP]");
							_text ~= current_word;
							current_word.length = 0;
						}
						if (!isSpacer(c))
						{
							flag_s = isLetter(c);
							flag_n = isNumber(c);
							flag_o = isOperator(c);
							current_word ~= lichar(to!string(c));
						}
					}
				}
			}
			return;
		} else // if (isSeparator(c))
		{
			/*
			if (isOperator(to!string(c)))
			{
				writeln (current_word);
				current_word.length = 0;
				flag_s = isLetter(c);
				flag_n = isNumber(c);
				flag_o = isOperator(c);
				current_word ~= c;
			} else
			*/
			{ // needed to rethink
				if (/*endOfLine(current_word) ||*/ c == symbl_nl)
				{
					//current_word ~= NEWLINE;
					current_word ~= lichar("[NL]\n");
					
					_text ~= current_word;
					current_word.length = 0;
					//current_word ~= TAB;
					current_word ~= lichar("[TAB]");
				}
				else
				{
					//current_word ~= SPACE;
					current_word ~= lichar("[SP]");
					_text ~= current_word;
					current_word.length = 0;
				}
				if (!isSpacer(c))
				{
					flag_s = isLetter(c);
					flag_n = isNumber(c);
					flag_o = isOperator(c);
					current_word ~= lichar(to!string(c));
				}
			}
		}
	}

	bool endOfLine(lichar[] word)
	{
		return (word[word.length - 1].c == ";" || word[word.length - 1].c == "\n") ? true : false;
	}

	bool isLetter(char c)
	{
		foreach (letter; letters)
			if (c == letter)
				return true;
		return false;
	}

	bool isNumber(char c)
	{
		foreach (number; numbers)
			if (c == number)
				return true;
		return false;
	}

	bool isOperator(char c)
	{
		foreach (operator; operators)
			if (c == operator)
				return true;
		return false;
	}

	bool isSeparator(char c)
	{
		foreach (separator; separators)
			if (c == separator)
				return true;
		//if (!flag_o && current_word.length && isOperator(c))
		//	return true;
		return false;
	}

	bool isSpacer(char c)
	{
		foreach (space; spacers)
			if (space == c)
				return true;
		return false;
	}
}

