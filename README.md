# Project: Understanding Hired Rides in NYC

Group Name: IEOR 4501 Final Project Group 31

UNIs: cg3355, sh4326

The packages of specific versions listed in `requirements.txt` are installed by the authors locally, but may not be required to be exact the same if you are about to run the codes on your own computer.

## Overview

We collected data from NYC taxi trips dataset, Uber rides dataset and NCEI weather dataset to analyze the details of hired rides in NYC and its correlation with local weather data. Some of the dataset websites are listed below.

- NYC Taxi Trips Dataset: https://www1.nyc.gov/site/tlc/about/tlc-trip-record-data.page
- NCEI Weather Dataset: https://www.ncei.noaa.gov/data/local-climatological-data/
- Geographical Boundaries of Districts/Areas in NYC: https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page

## What we have done

1. Calculating distance
    - We calculate the distance according to the pickup/dropoff latitude/longitude of each hired rides by only using `math` module from the standard library. The implementation is done by the function `calculate_distance`.

2. Download and process taxi data
    - The Yellow Taxi Trips Dataset is a subset of NYC Taxi Trips Dataset (https://www1.nyc.gov/site/tlc/about/tlc-trip-record-data.page), the files are attached to the website and can be downloaded through `requests` or mannually, with each file refers to a specific month (such as 01-2009).
    - We have implemented functions with `requests`, `BeautifulSoup` and other packages to automatically download all existing files about yellow taxi trips and save them as `.parquet` files locally.
    - The Yellow Taxi Trips Dataset does not provide exact pickup/dropoff latitude/longitude coordinates, instead the location IDs are provided, which are specific districts or areas in NYC, and the geographic boundaries can be found. We locate the pickup/dropoff latitude/longitude by the centroid of the pickup/dropoff locations approximately.

3. Download and process uber data
    - The uber dataset is downloaded from Google drive https://drive.google.com/file/d/1F7D82w1D5151GXCR6BTEk7mNQ_YnPNDk/view?usp=sharing.
    - The calculation of trip distances is the same as taxi data, except that the pickup/dropoff latitude/longitude coordinates are directly provided in the dataset.

4. Download and process weather data
    - The NYC weather data is automatically downloaded from https://www.ncei.noaa.gov/data/local-climatological-data/, with each CSV file refers to a specific year.
    - The frequency of the weather data are mixed, some of the fields are updated hourly/daily while others are updated when certain conditions had been triggered. Thus, we choose some of the fields for further analysis and rearrange them to an hourly and daily frequency dataset. The fields includes `precipitation`, `wind_speed`, `temperature`, and `visibility`.

5. Storing data
    - For every dataset we have collected, including taxi trips data, uber trips data, hourly weather data and daily weather data, we create a `Sqlite` database and store each dataset into corresponding tables through `sqlalchemy`.
    - The table schema can be found in `schema.sql` and the datasets can be found in `project.db`.

6. Understanding the Data
    - We developed 6 SQL queries to help understand the datasets. For details, see **Part 3** in the notebook `Project.ipynb`.
    - We developed 6 strands of functions to help visualize the datasets. For details, see **Part 4** in the notebook `Project.ipynb`.

7. Further analysis
    - We developed 1 animated plot to show the comovement of cumulative number of hired rides and precipitation.
    - We choose sunset/sunrise data from the original NYC Weather Dataset to show the percentage of hired rides before sunrise, between sunrise and sunset, and after sunset.
