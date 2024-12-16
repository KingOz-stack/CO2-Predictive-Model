---
title: "CO2 Levels (2014-2024): Trends & Cycles"
output:
  html_document:
    df_print: paged
  pdf_document:
    latex_engine: xelatex
date: "2024-11-18"
---

```{r}
include=FALSE
knitr::opts_chunk$set(echo = TRUE)
library(dplyr)
library(ggplot2)
library(car)

```


```{r}
co2_concentration <- read.csv("/cloud/project/co2 concentration.csv")

```


```{r}
#Descriptive statistics
head(co2_concentration) #Shows the first 6 rows
```


```{r}
tail(co2_concentration) #shows the last  rows by default.
```


```{r}
str(co2_concentration) #To understand the structure of the data frame
```

```{r}
summary(co2_concentration) #Provides summary of the data, it provides statistics like the minimum, maximum, mean, and quartiles.
```



```{r}
co2_concentration$Season <- case_when(
  co2_concentration$month %in% c(12, 1, 2) ~ "Winter",
  co2_concentration$month %in% c(3, 4, 5) ~ "Spring",
  co2_concentration$month %in% c(6, 7, 8) ~ "Summer",
  co2_concentration$month %in% c(9, 10, 11) ~ "Autumn"
  )  # This bit will help us to analyze how CO₂ levels vary across seasons, and also help us to understand the column cycles in depth
```


```{r}
co2_concentration$Season <- factor(co2_concentration$Season, levels = c("Winter", "Spring", "Summer", "Autumn"), ordered = TRUE)  
#Convert the "Season" column into an ordered factor to ensure the seasons follow a logical order
# (Winter < Spring < Summer < Autumn). This is useful for analysis and visualization where 
# the natural sequence of seasons matters, such as sorting or comparisons.
```



```{r}
str(co2_concentration$Season)
#To check that the factor is indeed an ordered factor 
```


```{r}
co2_concentration <- co2_concentration %>%
  group_by(year) %>%
  mutate(Annual_Change = trend - lag(trend))
#Annual rate change of year-over-year CO2_Concentration trend
```


```{r}
co2_concentration <- co2_concentration %>%
  mutate(Annual_Change_Percentage = (trend - lag(trend)) / lag(trend) * 100)
#This column is for the percentage change in CO2 concentration compared to the previous year. Its purpose is to help use access the relative changes over time.
```

```{r}
#summary of the dataset
summary(co2_concentration)
```

```{r}
#Finding missing values in the Annual_Change Column and replace with the mean
co2_concentration$Annual_Change[is.na(co2_concentration$Annual_Change)] <- mean(co2_concentration$Annual_Change, na.rm = TRUE)
```

```{r}
#Replace missing values in the Annual_Change_Percentage column and replace with the mean
co2_concentration$Annual_Change_Percentage[is.na(co2_concentration$Annual_Change_Percentage)] <- mean(co2_concentration$Annual_Change_Percentage, na.rm = TRUE)
```


```{r}
#summary of the dataset
summary(co2_concentration)
```

```{r}
# Z-Score for Co2_Concentration trend
co2_concentration <- co2_concentration %>%
  mutate(
    z_score_trend = (trend - mean(trend, na.rm = TRUE)) / sd(trend, na.rm = TRUE),
    anomaly = ifelse(abs(z_score_trend) > 1.5, TRUE, FALSE)  
  )

# View rows with anomalies
anomalies <- co2_concentration %>% filter(anomaly == TRUE)
print(anomalies)

```

```{r}
# Z-Score for Co2_Concentration trend
co2_concentration <- co2_concentration %>%
  mutate(
    z_score_cycle = (cycle - mean(cycle, na.rm = TRUE)) / sd(cycle, na.rm = TRUE),
    anomaly = ifelse(abs(z_score_cycle) > 1.5, TRUE, FALSE)  # Corrected column name here
  )

```

```{r}
#Summary of dataset after creating columns
summary(co2_concentration)
```


```{r}
#Visualizations

#Create a lineplot of Co2_Concentration vs time
ggplot(co2_concentration, aes(x=year,y=trend)) + geom_line(color = "blue", linewidth= 1) +
geom_point(size = 0.1, alpha = 0.2) +
labs(
title = "Trend over Years",
x = "Year",
y = "Trend",
caption = "Source: CO2 Concentration Dataset"
) +
theme_minimal() +
theme(
plot.title = element_text(size = 16, face= "bold"),
axis.title = element_text(size = 12),
legend.position = "bottom"
)
```


```{r}
#Create a Scatterplot of Trend VS Year
ggplot(co2_concentration, aes(x = year, y = trend)) +  geom_point()
```


```{r}
#Create a of boxplot of Z_Score
boxplot(z_score_trend ~ year, data = co2_concentration, xlab = 
"Year", ylab = "z_score_trend", col = c("lightblue", "lightgreen","lightpink")) 
```
```{r}
"z_score_trend" 
str(co2_concentration)

```

```{r}
#Check for correlation between trend, year and cycle. We checked correlation between the response variable (trend) and predictors to identify the strongest relationships, to avoid Multicollinearity.

cor(co2_concentration[, c("trend", "year", "cycle")])
```




```{r}
#Linear Regression Model

# Build a linear regression model 
model <- lm(trend ~ year + Season + month, data = co2_concentration)
```

```{r}
summary(model)
```

```{r}
vif(model)  #To check the multicollinearity of between the predictor variables and if vif is > 5 or 10, that means one predictor variable must be dropped to avoid ending up with a multicollinearity model.
```

```{r}
#Evaluating our model's performance using R-squared,Mse,Mae
#Calculate the residuals to find mse (mean squared error)
predictions <- predict(model, co2_concentration)
residuals <- co2_concentration$trend - predictions
mse <- mean(residuals^2)
print(mse)
#Calculate the mean absolute error (mae)
mae <- mean(abs(residuals))
print(mae)
summary(model)$r.squared
```


```{r}
print(predictions)
```

```{r}
#Making predictions using the independent variables to forecast the dependent variable (trend)
model <- lm(trend ~ year + Season + month, data = co2_concentration)

new_data <- data.frame(
  year = rep(2025, 12),  # Assuming monthly data
  Season = c("Winter", "Winter", "Spring", "Spring", "Spring", "Summer", "Summer", "Summer", "Autumn", "Autumn", "Autumn", "Winter"),
  month = 1:12
)
predictions_2025 <- predict(model, newdata = new_data)
new_data$predicted_trend <- predictions_2025
print(new_data)

```
```{r}
mean(predictions_2025)
```

