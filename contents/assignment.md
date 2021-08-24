# Introduction {#sec:intro}

Rik Huijzer and Don van Ravenzwaaij.

This document describes the Bayes factors assignment for the course: _statistical solutions to research problems in psychology_.

```jl
BayesianAssignment.show_version()
```

## Background {#sec:background}

Throughout the course of your psychology cirriculum, you have been exposed to Null Hypothesis Significance Testing (NHST) on numerous occasions.
NHST is arguably the golden standard in inferential statistics in psychology, but it does not come without its shortcomings.
In this course, we are going to focus on one specific issue:
the inability to find evidence _in favor_ of the null hypothesis.

There are a lot of reasons why one might want to quantify evidence in favor of the null.
For one, some fields in psychology are in a "crisis of confidence" [see e.g., @pashler2012editors].
In this crisis, many claims have been made, with statistical support, which turn out not to be true.
One way to undo these results is to gather statistical evidence against these false claims.

In this module, you are presented with an alternative inferential framework:
Bayesian statistics.
In the first lecture, you will learn about the philosophy behind Bayesian statistics, how it conceptually works, and its advantages and disadvantages compared to conventional inferential statistics.
In the second lecture, you will be introduced to a synthetic dataset from Rik's research.
With this dataset, you will be able to obtain roughly the same results as Rik and the co-authors got.
The assignment in this module asks you to analyze this dataset yourself.
You will conduct both conventional and Bayesian inference and write a results section that showcases your findings.
You will not only report that an effect is there, but also that an effect is **not** there.

## Assignment

In this assignment, we will look into the differences in the Big Five personality traits of Dutch special operations forces (henceforth, commandos) versus the general population.
Commandos are elite military troops, so they are required to perform well in extreme mental and physical conditions.
Therefore, we expect that commandos are less neurotic (sensitive/nervous) than civilians [@mcdonald1990training; @lee2011prospective; @jackson2012military].
Also, we expect that commandos are more extravert (outgoing/energetic) than civilians [@jackson2012military].

The synthetic data provided with this assignment consists of the personality scores of commandos and civilians on neuroticism (N) and extraversion (E).
The first and last few rows of the dataset are shown in @tbl:dataset.

```jl
let
    caption = "First and last few rows of the dataset."
    label = "dataset"
    data = first_and_last_few_rows(dataset())
    Options(data; caption, label)
end
```

You can download the data via: \
<https://rikhuijzer.github.io/BayesianAssignment.jl/data.csv>

To give you a bit of an intuition about this dataset, we visualize it by plotting all the points, see @fig:not_so_useful.
This figure is a bit misleading since there could be many points lying on top of each other.

```jl
let
    fg = BayesianAssignment.plot_points()
    caption = "A simple but possibly misleading visualization of the data."
    label = "not_so_useful"
    Options(fg; caption, label)
end
```

So, instead, we can also visualize it by estimating the distribution via a, so called, kernel density estimator (@fig:kde).
(Basically, this means: throw all the scores on different piles and make it prettier by smoothing it all out a bit.
Understanding this is not required for the assignment.)

```jl
fg = BayesianAssignment.plot_density()
caption = "Estimation of the distributions."
label = "kde"
Options(fg; caption, label)
```

1. _[2 pt]_ The data contains many missing values.
    Clean up the data by using the pass-through filter in JASP.
    Report what formula you use in the filter and how many rows remain.
    Note that, to apply multiple filters at the same time, you can use something like
    $(\text{neuroticism} \cdots ) \land ( \cdots )$.

1. _[2 pt]_ Create boxplots for neuroticism and extraversion while also splitting the data up in groups.
    Add the plots to your report.

1. _[3 pt]_ Report results for doing traditional inference tests.
    Think about the design, report what test you are using.
    Is it a _t_-test (if yes, one- or two-tailed?), an ANOVA (if yes, what contrasts, post-hoc tests?), a linear regression, or something else?
    Report your test statistic, the degrees of freedom, and the obtained p-value.

1. _[3 pt]_ Report results for Bayesian inference. Make sure you use the same kind of analysis as you did for the traditional approach (you will find the Bayesian equivalent under the same button).
    Report the Bayes factor and include a plot of the sequential Bayes factor (tick the box that says "Sequential analysis").
