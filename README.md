# Movie Industry Analytics Dashboard

An interactive analytics dashboard exploring **movie industry trends, audience ratings, genre popularity, production company performance, and movie revenue from 1980–2020** using **R, Shiny, and data visualization techniques**.

---

## Project Overview

This project analyzes long-term trends in the movie industry using a dataset of **6,820 movies (1980–2020)** scraped from IMDb.

The dashboard combines **interactive filtering, exploratory data analysis (EDA), and business insights** to better understand how:

- Movie genres evolved over time
- Audience ratings vary by genre
- Production companies performed financially
- Movie revenue changed across decades
- Film release patterns shifted over time

The dashboard enables users to interactively explore trends by:

✅ Genre selection  
✅ Year range filtering  
✅ Decade filtering

The goal was to understand **how the movie industry has shifted over the last four decades**, from audience preferences to financial performance. 

---

## Methods Used

### Data Preparation
- Data cleaning and transformation
- Factor conversion
- Genre standardization
- Time-based feature engineering

### Data Analysis
- Revenue trend analysis
- Genre prevalence analysis
- Production company comparisons
- Audience rating distributions
- Release timing analysis
- Revenue ranking by decade

### Interactive Dashboard Features
- Genre checkbox filtering
- Year range slider
- Decade dropdown filtering
- Dynamic plot updates using **Shiny server callbacks**

The dashboard was built using **Shiny Dashboard**, **ggplot2**, and interactive filtering logic.

---

## Key Findings

📌 **Biography films experienced the greatest growth in prevalence over time**, while **comedies steadily declined**. 

📌 Certain genres demonstrated seasonal release patterns:

- **Comedies** were commonly released in **April and August**
- **Drama films** peaked in **January and October**
- **Horror films increased during colder months**. 

📌 **Animation and Biography films received the highest audience ratings on average**.

📌 **Universal Pictures, Warner Bros., and Twentieth Century Fox generated the highest total revenue over time**. 

📌 Action films became increasingly dominant, generating the highest revenue in recent decades.

📌 The highest grossing films by decade included:

- **1980s:** *E.T.*
- **1990s:** *Titanic*
- **2000s:** *Avatar*
- **2010s:** *Avengers: Endgame*
- **2020s:** *The Eight Hundred* 

---

## Dashboard Preview

### Interactive Dashboard

![Dashboard](dashboard-preview.png)

### Movie Revenue by Decade

![Revenue by Decade](revenue-decade-scatterplot.png)

### Top Production Companies by Revenue

![Top Production Companies](top-production-companies.png)

### Production Company Revenue Trends

![Revenue Trends](production-revenue-trends.png)

### Genre Trends Over Time

![Genre Density](genre-density.png)

### Movie Release Heatmap

![Heatmap](genre-release-heatmap.png)

### Audience Ratings by Genre

![Ratings](movie-ratings-boxplot.png)

---

## Tools Used

![R](https://img.shields.io/badge/R-276DC3?style=for-the-badge&logo=r&logoColor=white)
![Shiny](https://img.shields.io/badge/Shiny-0099F9?style=for-the-badge&logo=rstudio&logoColor=white)
![ggplot2](https://img.shields.io/badge/ggplot2-2C3E50?style=for-the-badge&logo=r&logoColor=white)
![Data Visualization](https://img.shields.io/badge/Data%20Visualization-FF6F00?style=for-the-badge)
![Business Analytics](https://img.shields.io/badge/Business%20Analytics-2E7D32?style=for-the-badge)
![IMDb Data](https://img.shields.io/badge/IMDb%20Movie%20Data-FFB300?style=for-the-badge)
