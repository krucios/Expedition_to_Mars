module stat;

interface Stat
{
    void accumulate(double x);
    void postprocess();
    double result();
}


class Min : Stat
{
    private double min = double.max;

    void accumulate(double x)
    {
        if (x < min)
        {
            min = x;
        }
    }

    void postprocess()
    {
    }

    double result()
    {
        return min;
    }
};
