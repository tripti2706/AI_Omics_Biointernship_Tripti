
setwd("C:/Users/Tripti/Desktop/AI_Omics_Internship_2025")

#create folders
dir.create("raw_data")
dir.create("clean_data")
dir.create("scripts")
dir.create("results")
dir.create("Plots")
dir.create("Tasks")

# Import Data from CSV
data <- read.csv(file.choose())

# View data in spreadsheet format
View(data)

# Check structure of the dataset
str(data)

#unique values in columns
unique(data$bmi)
unique(data$age)
unique(data$gender)
unique(data$smoker)

# Convert 'bmi' column to factor
data$bmi_fac <- as.factor(data$bmi)
str(data)

# Reorder factor levels manually
data$bmi_fac <- factor(data$bmi_fac, 
                       levels = c("Underweight", "Healthy", "Overweight"))
levels(data$bmi_fac)

# Convert 'gender' to factor
data$gender_fac <- as.factor(data$gender)
str(data)

#Convert 'smoker' to binary factor
data$smoker_binary <- factor(ifelse(data$smoker== "Yes", 1, 0), 
                             levels = c(0,1))
data$smoker_binary_labels <- factor(ifelse(data$smoker== "Yes", 1, 0), 
                                    levels = c(0,1),
                                    labels = c("Non-Smoker", "Smoker"))

levels(data$smoker_binary)
levels(data$smoker_binary_labels)

# Save the cleaned dataset 
write.csv(data, "clean_data/patient_info_clean.csv", row.names = FALSE)

save.image("TriptiKashyap_Class_1b.RData")

