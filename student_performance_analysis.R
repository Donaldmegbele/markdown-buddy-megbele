# Student Performance Analysis

# 1. Generate a reproducible dataset of 50 fictional students.
set.seed(42)
student_count <- 50

students <- data.frame(
  student_id = sprintf("S%03d", seq_len(student_count)),
  study_hours = round(runif(student_count, min = 1, max = 10), 1),
  attendance_pct = sample(60:100, student_count, replace = TRUE)
)

# Simulate exam scores with some random variation.
students$exam_score <- round(pmin(100, pmax(0,
  20 + 4 * students$study_hours + 0.35 * students$attendance_pct +
    rnorm(student_count, mean = 0, sd = 10)
)))

# 2. Create an output folder and save the synthetic dataset.
dir.create("outputs", showWarnings = FALSE)
write.csv(students, "outputs/student_data.csv", row.names = FALSE)

# 3. Calculate and display descriptive summary statistics.
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

summary_stats[-1] <- lapply(summary_stats[-1], round, digits = 2)
cat("Student Performance Analysis (50 synthetic students)\n")
print(summary_stats)
write.csv(summary_stats, "outputs/summary_statistics.csv", row.names = FALSE)

# 4. Plot study hours against exam scores, with a fitted trend line.
png("outputs/study_hours_vs_exam_score.png", width = 900, height = 600)
plot(
  students$study_hours, students$exam_score,
  main = "Study Hours vs Exam Score (Synthetic Data)",
  xlab = "Weekly Study Hours",
  ylab = "Exam Score (%)",
  pch = 19,
  col = "steelblue",
  ylim = c(0, 100)
)
abline(lm(exam_score ~ study_hours, data = students),
       col = "firebrick", lwd = 2)
grid()
dev.off()

cat("\nSaved: outputs/student_data.csv, outputs/summary_statistics.csv,\n",
    "       outputs/study_hours_vs_exam_score.png\n")
