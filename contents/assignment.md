# Introduction

Rik Huijzer and Don van Ravenzwaaij.

This document describes the Bayes factors assignment for the _statistical solutions to research problems in psychology_ course.

_Version: August, 2021._

## Background

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

The synthetic data provided with this assignment consists of the personality scores of commandos and civlians on neuroticism (N) and extraversion (E).
The first and last few rows of the dataset are shown in @tbl:dataset.

```jl
caption = "First and last few rows of the dataset."
label = "dataset"
data = first_and_last_few_rows(dataset())
Options(data; caption, label)
```

To give you a bit of an intuition about this dataset, we visualize it by plotting all the points, see @fig:not_so_useful.
This figure is a bit misleading since there could be many points lying on top of each other.

```jl
fg = BayesianAssignment.plot_points()
caption = "A possibly misleading visualization of the data."
label = "not_so_useful"
Options(fg; caption, label)
```

So, instead, we can also visualize it by estimating the distribution via a, so called, kernel density estimator (@fig:kde).

```jl
fg = BayesianAssignment.plot_density()
caption = "A simple visualization of the data via a kernel density estimator."
label = "kde"
Options(fg; caption, label)
```
