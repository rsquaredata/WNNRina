<div align="center">

# wnnTS

### *Weighted Nearest Neighbors for Electricity Load Forecasting*

[![R](https://img.shields.io/badge/R-4.3+-blue.svg)](https://www.r-project.org/)
[![Time%20Series](https://img.shields.io/badge/Time%20Series-Forecasting-orange.svg)]()
[![Energy](https://img.shields.io/badge/Application-Electricity%20Load-red.svg)]()
[![License](https://img.shields.io/badge/License-Academic-lightgrey.svg)]()

*Master 2 SISE Project – Time Series*  
*Université Lumière Lyon 2 | 2025–2026*

[Overview](#overview) • [Methodology](#methodology) • [Package](#package) • [Installation](#installation) • [Quick Start](#quick-start)

---

</div>

## Table of Contents

- [Overview](#overview)
- [Objectives](#objectives)
- [Project Highlights](#project-highlights)
- [Methodology](#methodology)
- [Package](#package)
- [Installation](#installation)
- [Quick Start](#quick-start)
- [Project Structure](#project-structure)
- [License](#license)
- [Bibliography](#bibliography)

---

## Overview

**wnnTS** is an academic project dedicated to **electricity load forecasting** using classical, machine learning, and weighted nearest neighbors models.

The project is based on a dataset which contains:
- electricity consumption (kW)
- outdoor air temperature

measured every **15 minutes** for a single building, from  **January 1st, 2010 (01:15)** to **February 18th, 2010 (23:45)**.

The final objective is to **forecast electricity consumption for February 19th, 2010**, corresponding to **96 time steps (24 hours)**.

---

## Objectives

### Part 1 — Model comparison

- Apply and compare forecasting models:
  - Exponential smoothing
  - SARIMA
  - Neural networks
  - LSTM
  - XGBoost
  - Random Forest
  - Support Vector Machines
  - Facebook Prophet
- Tune model hyperparameters
- Evaluate models using **rolling-origin cross-validation**
- Select the **best-performing model**
- Produce a final **24-hour forecast (96 values)**

### Part 2 — Weighted Nearest Neighbors

- Implement the **Weighted Nearest Neighbors (WNN)** forecasting method
- Package the implementation in a **fully installable R package**
- Provide a **vignette** demonstrating the use of the package
- Compare WNN forecasts with the best model selected in Part 1

---

## Project Highlights

- Strict respect of **time series forecasting constraints**
- No data leakage (rolling-origin evaluation)
- Unified comparison framework across heterogeneous models
- Educational and transparent implementation of WNN
- Clear separation between:
  - exploratory work
  - package development
  - academic reporting

---

## Methodology

The project follows a complete and reproducible forecasting workflow:

```
Raw time series
↓
Exploratory analysis and preprocessing
↓
Train / validation split via rolling-origin CV
↓
Benchmark of classical and ML forecasting models
↓
Model selection based on forecast accuracy
↓
Final forecast for 2010-02-19 (96 steps)
↓
Weighted Nearest Neighbors implementation
↓
Comparison between WNN and best benchmark model
```

---

## Package

The `WNNRina` package implements a **Weighted Nearest Neighbors (WNN)** forecasting method for time series data.

This non-parametric approach predicts future values by identifying historical windows similar to the current situation and producing forecasts as a weighted average of the trajectories that followed these neighbors in the past.

The package provides:
- an implementation of the WNN forecasting algorithm
- control over the window size and number of neighbors
- forecasting over arbitrary horizons
- simple visualization utilities
- a pedagogical vignette illustrating the method

### Example usage

```r
library(WNNRina)

set.seed(123)
history <- sin(seq(0, 100, length.out = 2000)) + rnorm(2000, sd = 0.1)

forecast <- predict_wnn(
  train_y    = history,
  window_size = 96,
  k           = 5,
  forecast_h  = 96
)

plot(
  forecast,
  type = "l",
  col  = "blue",
  main = "WNN Forecast Example",
  ylab = "Value"
)
```

A full methodological description and additional examples are provided in the package vignette:

```r
vignette("Introduction to WNNRina")
```

---

## Installation

The `WNNRina` package is developed in an academic context and is not published on CRAN.

To install it locally from source, clone the repository and install the package using `devtools`:

```r
# Install devtools if needed
install.packages("devtools")

# Install WNNRina from local source
devtools::install(".")
```

Alternatively, download and install the packaged archive [WNNRina.tar.gz](https://github.com/rsquaredata/wnnTS/raw/refs/heads/main/doc/archive/WNNRina_0.1.0.tar.gz):

```r
install.packages("WNNRina.tar.gz", repos = NULL, type = "source")
```

---

## Quick Start

The main function provided by the package is `predict_wnn`, which implements a **Weighted Nearest Neighbors (WNN)** forecasting strategy for time series data.

Below is a minimal example, identical to the one used in the package vignette.

```r
library(WNNRina)

# Generate a synthetic seasonal signal
set.seed(123)
history <- sin(seq(0, 100, length.out = 2000)) + rnorm(2000, sd = 0.1)

# Forecast the next 96 points (24 hours at 15-minute intervals)
forecast <- predict_wnn(
  train_y   = history,
  window_size = 96,
  k           = 5,
  forecast_h  = 96
)

plot(
  forecast,
  type = "l",
  col  = "blue",
  main = "WNN Forecast Example",
  ylab = "Value"
)
```

The full methodological explanation and additional examples are available in the package vignette:
```r
vignette("Introduction to WNNRina")
```

---

## Project Structure

```
wnnTS/
│
├── R/                  # WNN implementation
├── man/                # Documentation
├── vignettes/          # Package vignette (R Markdown)
├── notebooks/          # Model comparison (Part 1)
├── report/             # Short academic report (PDF)
├── README.md
└── DESCRIPTION
```

---

## License

This project is develeoped in an academic context. For educational use only.

---

## Bibliography

Talavera-Llames, R.L., Pérez-Chacón, R., Martínez-Ballesteros, M., Troncoso, A., Martínez-Álvarez, F. (2016). *A Nearest Neighbours-Based Algorithm for Big Time Series Data Forecasting*. In: Martínez-Álvarez, F., Troncoso, A., Quintián, H., Corchado, E. (eds) Hybrid Artificial Intelligent Systems. HAIS 2016. Lecture Notes in Computer Science, vol 9648. Springer, Cham

---

<div align="center">

wnnTS — Weighted Nearest Neighbors for Electricity Load Forecasting

</div>






[^1]: Talavera-Llames, R.L., Pérez-Chacón, R., Martínez-Ballesteros, M., Troncoso, A., Martínez-Álvarez, F. (2016). A Nearest Neighbours-Based Algorithm for Big Time Series Data Forecasting. In: Martínez-Álvarez, F., Troncoso, A., Quintián, H., Corchado, E. (eds) Hybrid Artificial Intelligent Systems. HAIS 2016. Lecture Notes in Computer Science, vol 9648. Springer, Cham.
