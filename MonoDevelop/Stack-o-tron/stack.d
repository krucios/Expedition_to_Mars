module stack;

import std.stdio;

class Stack
{
	int[1024] stack_mem;
	int count;

public:
	this()
	{
		count = 0;
	}

	bool isEmpty()
	{
		return !stack_mem.length;
	};

	void push(int n)
	{
		try {
		stack_mem[count] = n;
		count++;
		} catch {
			writeln ("Error in push()");
		}
	};

	int pop()
	{
		auto ans = stack_mem[count - 1];
		count--;
		return ans;
	};

	void show()
	{
		foreach (i; stack_mem)
		{
			writeln(i);
		}
	}
}

