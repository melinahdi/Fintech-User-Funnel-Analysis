# Fintech User Funnel Analysis

### Background and Overview
There is this fintech company, established in 2018, that is a global company which head quartered in Indonesia with global active users across Indonesia, Taiwan, Hong Kong, Singapore, Malaysia, Saudi Arabia, and soon Korea and Japan. and Brunei.

The company has a mission to empower its users through its products, such as payment, lending, insurance, investment, and savings.

Insights and recommendations are provided on the following key areas:

**User Behaviours:** Evaluation of historical user patterns with fintech. Discuss the user funnel by certain parameters like months, countries, devices and operating systems 

**Time to First Transaction Analysis:** Deep dive into how quickly the user does their first transaction, patterns regarding it are also discussed

**User Engagement:** How engaged are users with the products of the fintech and their retention with this fintech



### Data Structure and Overview
This fintech database has 7 tables, as can be seen below:
1. dim_country
2. dim_date
3. dim_device
4. dim_event_type
5. dim_location
6. dim_user
7. fact_user_events

These data could be organised or applicable for dimensional modelling, which is a snowflake schema. I choose this schema since normalization need to be done for dim_country and dim_location. Normalization here is done because dim_location is the detail version of dim_country, where in the dim_location table, there is information about the city. Below is the entity relationship diagram (ERD) for this analysis,

<img src="https://github.com/melinahdi/Fintech-User-Funnel-Analysis/blob/main/ERD%20fintech.png?raw=true" alt="ERD Diagram" width="500"/>

You could download the dataset


### Executive Summary
### Insights
### Recommendations

