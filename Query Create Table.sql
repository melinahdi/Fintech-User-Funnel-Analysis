CREATE TABLE user_funnel_analysis.dim_country (
    country_id INT PRIMARY KEY,
    country_name VARCHAR(100) NOT NULL);

CREATE TABLE user_funnel_analysis.dim_location (
    location_id INT PRIMARY KEY,
    city VARCHAR(100) NOT NULL,
    country_id INT NOT NULL,
    FOREIGN KEY (country_id) REFERENCES user_funnel_analysis.dim_country(country_id)
);

CREATE TABLE user_funnel_analysis.dim_device (
    device_id INT PRIMARY KEY,
    device_type VARCHAR(50),
    os VARCHAR(50)
);

CREATE TABLE user_funnel_analysis.dim_event_type (
    event_type_id INT PRIMARY KEY,
    event_name VARCHAR(100) NOT NULL,
    funnel_stage VARCHAR(50)
);

CREATE TABLE user_funnel_analysis.dim_date (
    date_id INT PRIMARY KEY,
    date DATE NOT NULL,
    month INT,
    year INT
);

CREATE TABLE user_funnel_analysis.dim_user (
    user_id INT PRIMARY KEY,
    gender VARCHAR(10),
    birth_year INT,
    registration_date DATE,
    occupation VARCHAR(100),
    location_id INT,
    FOREIGN KEY (location_id) REFERENCES user_funnel_analysis.dim_location(location_id)
);

CREATE TABLE user_funnel_analysis.fact_user_events (
    event_id BIGINT PRIMARY KEY,
    user_id INT NOT NULL,
    event_type_id INT NOT NULL,
    date_id INT NOT NULL,
    device_id INT NOT NULL,
    location_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user_funnel_analysis.dim_user(user_id),
    FOREIGN KEY (event_type_id) REFERENCES user_funnel_analysis.dim_event_type(event_type_id),
    FOREIGN KEY (date_id) REFERENCES user_funnel_analysis.dim_date(date_id),
    FOREIGN KEY (device_id) REFERENCES user_funnel_analysis.dim_device(device_id),
    FOREIGN KEY (location_id) REFERENCES user_funnel_analysis.dim_location(location_id)
);
