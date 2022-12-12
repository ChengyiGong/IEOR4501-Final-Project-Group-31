CREATE TABLE IF NOT EXISTS HOURLY_WEATHER(
    hourly_weather_uid INTEGER PRIMARY KEY AUTOINCREMENT,
    datetime DATETIME,
    latitude FLOAT,
    longitude FLOAT,
    temperature FLOAT,
    precipitation FLOAT,
    visibility FLOAT,
    wind_speed FLOAT
)CREATE TABLE IF NOT EXISTS DAILY_WEATHER(
    daily_weather_uid INTEGER PRIMARY KEY AUTOINCREMENT,
    datetime DATETIME,
    latitude FLOAT,
    longitude FLOAT,
    temperature FLOAT,
    precipitation FLOAT,
    visibility FLOAT,
    wind_speed FLOAT
)CREATE TABLE IF NOT EXISTS TAXI_TRIPS(
    taxi_trips_uid INTEGER PRIMARY KEY AUTOINCREMENT,
    pickup_datetime DATETIME,
    dropoff_datetime DATETIME,
    pickup_latitude FLOAT,
    pickup_longitude FLOAT,
    dropoff_latitude FLOAT,
    dropoff_longitude FLOAT,
    fare_amount FLOAT,
    tip_amount FLOAT,
    passenger_count INTEGER,
    distance FLOAT
)CREATE TABLE IF NOT EXISTS UBER_TRIPS(
    uber_trips_uid INTEGER PRIMARY KEY AUTOINCREMENT,
    pickup_datetime DATETIME,
    pickup_latitude FLOAT,
    pickup_longitude FLOAT,
    dropoff_latitude FLOAT,
    dropoff_longitude FLOAT,
    fare_amount FLOAT,
    tip_amount FLOAT,
    distance FLOAT
)