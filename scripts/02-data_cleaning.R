#### Preamble ####
# Purpose: Cleans the raw data
# Author: Carl Fernandes
# Date: 17 April 2024
# Contact: carl.fernandes@mail.utoronto.ca


#### Workspace setup ####
library(tidyverse)

#### Clean data ####
# Display the first few rows of the dataset
head(raw_data)

# Display the structure of the dataset to understand column names and types
str(raw_data)

# Rename columns for clarity
names(raw_data) <- c("ContributorName", "ContributorAddress", "PostalCode", "ContributionAmount",
                     "ContributionReturned", "ContributionDescription", "GoodsServicesDescription",
                     "ContributorType", "RelationshipToCandidate", "CandidateName", "Office")

# Convert ContributionAmount to numeric if it's not already
raw_data$ContributionAmount <- as.numeric(as.character(raw_data$ContributionAmount))

# Check for errors after conversion
sum(is.na(raw_data$ContributionAmount))

# Remove records where contributions were returned if they are irrelevant to your analysis
raw_data <- raw_data[raw_data$ContributionReturned != "Yes", ]

# Save the cleaned data
write.csv(raw_data, "data/analysis_data/cleaned_data.csv", row.names = FALSE)

