
---

# **CO₂ Concentration Analysis and Forecasting**  
### *Analyzing Trends and Building a Predictive Model for Atmospheric CO₂ Levels (2014–2024)*  

## **Project Overview**  
This project analyzes atmospheric CO₂ concentration levels spanning a decade (2014–2024) using a dataset from Kaggle. The goal is to identify long-term trends, seasonal patterns, and anomalies, and to build a **Multiple Linear Regression Model** to forecast CO₂ levels for 2025.  

Through data visualization and predictive modeling, this project highlights the steady rise in CO₂ concentrations, providing insights into the impact of human activity on global climate trends.  

---

## **Objectives**  
- Explore CO₂ concentration trends and patterns over a 10-year period.  
- Visualize seasonal and long-term variations using various statistical plots.  
- Build and validate a **Multiple Linear Regression Model** to predict future CO₂ levels.  
- Avoid overfitting through careful feature selection and engineering.  

---

## **Tools and Technologies Used**  
- **Programming Language**: R  
- **Key Libraries**:  
   - `tidyverse`: Data wrangling and manipulation  
   - `ggplot2`: Data visualization  
   - `lubridate`: Handling date-time variables  
   - `dplyr`: Data transformation  
   - `scales`: Improving plot aesthetics  
   - `caret`: Model building and evaluation  

---

## **Data Source**  
The dataset was sourced from Kaggle and includes daily atmospheric CO₂ concentration levels from **October 2014 to November 2024**. The data was collected via the **Daily Atmosphere Carbon Dioxide Concentration API** from RapidAPI (global-warming.org).  

---

## **Steps and Methodology**  
1. **Data Exploration and Cleaning**  
   - Checked for missing values and handled them appropriately (mean imputation).  
   - Examined the structure of the dataset and visualized key patterns.  

2. **Feature Engineering**  
   - Created new features:  
      - **Season**: To analyze seasonal variations.  
      - **Annual Change**: Year-over-year change in CO₂ concentration.  
      - **Z-Scores**: For detecting anomalies and outliers.  

3. **Data Visualization**  
   - Plotted **line plots**, **scatterplots**, and **box plots** to analyze trends, seasonal cycles, and anomalies.  

4. **Model Building**  
   - Built a **Multiple Linear Regression Model** to forecast CO₂ levels for 2025.  
   - Avoided overfitting through careful predictor variable selection.  

5. **Model Validation**  
   - Achieved an estimated **80% accuracy** using the model.  

---

## **Key Insights**  
- CO₂ levels have shown a **consistent upward trend** from 2014 to 2024.  
- Seasonal patterns revealed cyclical variations in CO₂ concentrations across years.  
- The predictive model forecasts an average CO₂ level of **~424.84 ppm for 2025**, emphasizing the continued increase in atmospheric CO₂.  

---

## **How This Project Can Be Used**  
- **Public Education**: Communicate the impact of rising CO₂ levels on climate change.  
- **Policy Making**: Provide data-driven insights to support carbon emission reduction strategies.  
- **Climate Mitigation**: Forecast future trends to inform sustainability efforts and global initiatives.  

---

## **Future Improvements**  
- Integrate additional predictors such as global temperature anomalies or fossil fuel emissions.  
- Use advanced machine learning models (e.g., Random Forest, Time-Series Forecasting with ARIMA) to improve accuracy.  
- Analyze regional CO₂ trends to gain more localized insights.  

---

## **How to Run the Project**  
1. Clone the repository:  
   ```bash  
   git clone <https://github.com/KingOz-stack/CO2-Predictive-Model>  
   ```  
2. Ensure R and necessary libraries (`tidyverse`, `ggplot2`, `caret`, `lubridate`) are installed.  
3. Run the R scripts in sequence:  
   - Data Cleaning and Visualization  
   - Feature Engineering  
   - Model Building and Evaluation  

---

## **Contributors**  
- Favour Umejesi  
- Angel Antwi-Mensah 

---

## **License**  
This project is licensed under the MIT License.  

---

