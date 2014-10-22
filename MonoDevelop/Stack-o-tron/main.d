module main;

import std.stdio, stack;

static immutable COUNT_OF_BYTES = 1024;

static int[] memory = new int[COUNT_OF_BYTES / int.sizeof];
static int bias;
static int top;

void main(string[] args)
{
	Stack st;
	int cur_word;

	writeln("Stack-o-tron glad to see you! \n");

	for (auto i = 0; i < 10; ++i)
	{
		st.push(i);
	}

	st.show();
	readln();
}

