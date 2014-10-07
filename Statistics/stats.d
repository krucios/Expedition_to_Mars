import stat, std.stdio, std.exception;

void main(string[] args)
{
    Stat[] stats;
    foreach (arg; args[1 .. $])
    {
        auto newStat = cast(Stat) Object.factory("stat." ~ arg);
        enforce(newStat, "Invalid statistics function: " ~ arg);
        stats ~= newStat;
    }

    for (double x; stdin. readf(" %s ", &x) == 1; )
    {
        foreach (s; stats)
            s.accumulate(x);
    }

    foreach (s; stats)
    {
        s.postprocess();
        writeln (s.result());
    }
    writeln("Yahoo!");
}
