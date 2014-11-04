module Automat;

import std.stdio;

class Automat
{
private:
	bool flag_s;
	bool flag_n;
	bool flag_o;

	string current_word;

	string letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMOPQRSTUVWXYZ_";
	string numbers = "0123456789";
	string operators = "+-*/<>=&|~!:.%?,^";
	immutable char[] separators = [' ', '\t', '\n', '(', ')', ';', '{', '}'];
	immutable char[] spacers = [' ', '\t', '\n'];

public:
	this()
	{
		// Constructor code
	}

	void feed(char c)
	{
		if (!current_word.length)
		{
			if (isSpacer(c))
				return;
			flag_s = isLetter(c);
			flag_n = isNumber(c);
			flag_o = isOperator(c);
			current_word ~= c;
			return;
		}
		if (!isSeparator(c))
		{
			if ((isLetter(c) || isNumber(c)) && flag_s)
				current_word ~= c;
			else
			{
				if (isNumber(c) && flag_n)
					current_word ~= c;
				else
				{
					if (isOperator(c) && flag_o)
						current_word ~= c;
					else
					{
						writeln (current_word);
						current_word.length = 0;
						if (!isSpacer(c))
						{
							flag_s = isLetter(c);
							flag_n = isNumber(c);
							flag_o = isOperator(c);
							current_word ~= c;
						}
					}
				}
			}
			return;
		} else
		{
			/*
			if (isOperator(c))
			{
				writeln (current_word);
				current_word.length = 0;
				flag_s = isLetter(c);
				flag_n = isNumber(c);
				flag_o = isOperator(c);
				current_word ~= c;
			} else
			*/
			{
				writeln (current_word);
				current_word.length = 0;
				if (!isSpacer(c))
				{
					flag_s = isLetter(c);
					flag_n = isNumber(c);
					flag_o = isOperator(c);
					current_word ~= c;
				}
			}
		}
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

