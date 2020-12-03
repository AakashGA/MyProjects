# Create a vector of courses (e.g., MATH 101) you have taken previously. 
# Make sure you have at least 8 courses. Name the vector myCourses
myCourses <- c("IT 101", "IT 106", "IT 109", "IT 206", "IT 209", "CS 112", "CS 211", "DAEN 500", "HIST 103", "CALC 1")

# Get the length of the vector myCourses
length(myCourses)

# Get the first two courses from myCourses
myCourses[1:2]

# Get the 3rd and 4th courses from myCourses
myCourses[3:4]

# Sort myCourses using a method
sort(myCourses, decreasing = FALSE)

# Sort myCourse in the reverse direction
sort(myCourses, decreasing = TRUE)

rm(list = ls())
