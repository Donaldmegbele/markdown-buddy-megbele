AI Assistance Declaration: I used ChatGPT to plan and refine the README structure, draft Markdown documentation, suggest R Markdown formatting and code examples, and review documentation quality. Prompts used: The complete list of prompts and summaries of key AI responses are documented in markdown_buddy_appendix.pdf. I verified outputs by comparing the documentation with the R script and reviewing the rendered Markdown and R Markdown HTML output. All final calculations are done by myself. I am responsible for the accuracy and originality of this work.

# Student Performance Data Analysis

An introductory R project that generates synthetic student data, calculates descriptive statistics, and visualizes the relationship between study hours and exam scores.

## Overview

This project demonstrates a reproducible data analysis workflow using 50 fictional students. The R script generates the dataset, analyzes three numerical variables, and saves the resulting data, summary table, and scatter plot.

The analysis explores:

- What are the mean, median, range, and standard deviation of study hours, attendance, and exam scores?
- How do study hours relate to exam scores in the generated sample?

Data note: The dataset is fully synthetic. The score-generation formula deliberately includes study hours and attendance, so relationships in the output are part of the simulation—not evidence about real students or causal effects.

## Objectives

- Create a reproducible fictional dataset using R.
- Summarize student performance using descriptive statistics.
- Produce a scatter plot with a fitted linear trend line.
- Export results in accessible CSV and PNG formats.

## Dataset

The script uses `set.seed(42)` to generate 50 records with the following columns:

| Column | Description |
| --- | --- |
| `student_id` | Fictional identifier, from `S001` to `S050` |
| `study_hours` | Simulated weekly study hours, between 1 and 10 |
| `attendance_pct` | Simulated attendance percentage, from 60% to 100% |
| `exam_score` | Simulated exam score, rounded and capped between 0 and 100 |

Exam scores are generated from study hours, attendance, and random noise. No external dataset or real student information is used.

## Installation

1. Install [R](https://cran.r-project.org/) and optionally [RStudio](https://posit.co/download/rstudio-desktop/).
2. Download the project files or clone the repository if it has been published to GitHub.
3. Confirm R is available in Terminal:

   ```bash
   Rscript --version
   ```

The script uses base R only. No additional R packages are required.

## Usage

1. Place `student_performance_analysis.R` in the project folder alongside this README.
2. Open Terminal in the project folder and run:

   ```bash
   Rscript student_performance_analysis.R
   ```

   Alternatively, run `source("student_performance_analysis.R")` in RStudio with the project folder as your working directory.
3. Review the summary table printed in the console and the three generated files in `outputs/`.

The script creates the `outputs/` directory automatically. Run it from the project folder because its output paths are relative to the current working directory.

## Outputs and Repository Structure

```text
student-performance-analysis/
├── README.md
├── student_performance_analysis.R
└── outputs/                           # Created when the script runs
    ├── student_data.csv
    ├── summary_statistics.csv
    └── study_hours_vs_exam_score.png
```

| Output | Contents |
| --- | --- |
| `outputs/student_data.csv` | All 50 synthetic student records |
| `outputs/summary_statistics.csv` | Mean, median, minimum, maximum, and standard deviation for each numerical variable |
| `outputs/study_hours_vs_exam_score.png` | Scatter plot with a fitted linear regression line |

## Example Code

The following excerpt matches the project's R script and illustrates how the summary statistics are calculated after the `students` data frame is generated:

```r
measurements <- students[c("study_hours", "attendance_pct", "exam_score")]

summary_stats <- data.frame(
  variable = names(measurements),
  mean = sapply(measurements, mean),
  median = sapply(measurements, median),
  minimum = sapply(measurements, min),
  maximum = sapply(measurements, max),
  std_dev = sapply(measurements, sd),
  row.names = NULL
)
```

## Cheat Sheet

Useful base R commands for exploring this dataset:

| Task | Example R code |
| --- | --- |
| Inspect the first rows | `head(students)` |
| View column names and types | `str(students)` |
| Summarize numeric variables | `summary(students)` |
| Count missing values | `colSums(is.na(students))` |
| Calculate a mean | `mean(students$exam_score, na.rm = TRUE)` |
| Calculate standard deviation | `sd(students$exam_score)` |
| Create a scatter plot | `plot(students$study_hours, students$exam_score)` |
| Fit a linear trend line | `lm(exam_score ~ study_hours, data = students)` |

These commands can be explored in RStudio after running the main script.

## Reproducibility

- `set.seed(42)` makes the simulated data repeatable in the same R environment.
- All data are generated in the script; no downloads or external packages are needed.
- The CSV files and PNG plot are regenerated when the script runs.


## Findings and Interpretation

The generated exam scores depend by design on study hours, attendance, and random variation. The script provides descriptive statistics and a scatter plot to help examine those simulated relationships. Exact numerical results should be reported only after running the script and checking its generated output.

## License

No license has been selected. 

## Status

The R script and project documentation have been prepared. The README and R Markdown documentation were reviewed against the source script. The R Markdown report was successfully knitted to HTML, and the rendered sections, code blocks, summary statistics, and visualizations were inspected.

## AI Assistance Disclosure

**AI Tool:** ChatGPT

**Main Prompts:**
- Explain what sections a good GitHub README for an R data analysis project should include.
- Revise the sections list so it's concise and uses Markdown headers and bullet formatting.
- Add sections for Installation, Example Code, and License.
- Review the Markdown for syntax errors and suggest two improvements for clarity.

**Modifications and Verification:**

The AI-generated documentation was reviewed and refined to match the actual R script, its dependencies, and generated outputs. Markdown formatting was checked, and the R Markdown document was knitted and inspected.

The complete AI interaction record, including additional prompts and summaries of key responses, is available in the appendix.
