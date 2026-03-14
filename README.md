# Fintech User Funnel Analysis

### Background and Overview
There is this fintech company, established in 2018, that is a global company which head quartered in Indonesia with global active users across Indonesia, Taiwan, Hong Kong, Singapore, Malaysia, Saudi Arabia, and soon Korea and Japan, and Brunei.

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

![image_alt](https://github.com/melinahdi/Fintech-User-Funnel-Analysis/blob/main/ERD%20Fintech.png?raw=true)

You could download the dataset [here](https://github.com/melinahdi/Fintech-User-Funnel-Analysis/blob/main/Fintech%20Dataset.zip)

However, for the specification of the analysis, choose one platform to transform the data mainly, basically to centralize. I choose to create datamarts or subset of data in the SQL data warehouse. While for visualisation I use Power BI. Below is the structure of the datarmarts,

![image_alt](https://github.com/melinahdi/Fintech-User-Funnel-Analysis/blob/main/Datamarts%20Fintech.png?raw=true)

You could download the query to create the tables [here](https://github.com/melinahdi/Fintech-User-Funnel-Analysis/blob/main/Query%20Create%20Table.sql)

You could download the query to create datamarts [here](https://github.com/melinahdi/Fintech-User-Funnel-Analysis/blob/main/Query%20Datamart.sql)

### Executive Summary
In 2025, the fintech platform demonstrated stable user activity throughout the year, reflecting consistent acquisition and engagement. However, beneath this surface stability lie critical bottlenecks that limit growth or could be problems in the future and the user activation journey.



### Insights & Recommendations
![image_alt](https://github.com/melinahdi/Fintech-User-Funnel-Analysis/blob/main/Funnel%20Month.png)

If we look in scale of a year, the performance of users' activities in the fintech is quite good. I could say that because the trend from January 2025 to December 2025 is quite similar, which means it has a consistent tendency. Even we know there are many external and internal factors that might affect the funnel or the users' activities. The stability implies a resilient user base and reliable product performance. However, if we have initiative regarding growth, maybe could not be significant for month-over-month improvements.

![image_alt](https://github.com/melinahdi/Fintech-User-Funnel-Analysis/blob/main/Funnel%20Country.png)

Even though we see Indonesia as the most promising country, since it has the highest amount of users for the first transaction. However, Singapore and Hongkong has the least user drop, which is around 3,000 users, while Indonesia has around 10,000 users from signups to KYC completed.

Recommendation :
-	Investigate Indonesia-specific friction points (example: UX localization, verification process)
-	Learn and copy the success strategies from Singapore or Hongkong if possible, and align with Indonesia

![image_alt](https://github.com/melinahdi/Fintech-User-Funnel-Analysis/blob/main/Funnel%20Device%20Type%20and%20Operating%20System.png)

Android tablet and web Chrome become the most preferred device type and operating system selected by users of fintech for their first transaction. We see the mobile type, whether it is android and ios, has the fewest users for their first transaction. Probably because the screen is smaller than a tablet or web in a laptop, since fintech needs us to fill out some kind of form.
Recommendation :
-	Optimise mobile features like autofill, better UI and UX, and something mobile-friendly

Funnel Month, Funnel Country, and Funnel Device Type and Operating System, as stated above, we could see that there is a situation where signups are higher than installs. This happened due to
-	User journey cross month, locations, or device types. User A, for example, might install in January 2025 but sign up in March 2025. Their location might be different too, like installing in Malaysia but signing up when they are in Singapore. The same thing also happen too device type.
-	For Chrome and Safari, there is data for installation. I created this data from ChatGPT. The web doesn’t have an install funnel. So, this kind of error data generation that we need to be aware of.

![image_alt](https://github.com/melinahdi/Fintech-User-Funnel-Analysis/blob/main/Heatmap.png)
![image_alt](https://github.com/melinahdi/Fintech-User-Funnel-Analysis/blob/main/TTFT.png)

Most users take a long time to do their first transaction, 7-12 months, with 18082 users or could be said 61% from the total. There is a probability that the products are not immediately needed or the activation flow is weak. The consistency for this situation is also shown in the heatmap, which analyse relationship between registration month with first registration month. Where, 0-1 month after registration is very low, 2-3 increasing, 4-6 strong, and 7-12 highest. The drop in speed to do the first transaction happens between 1-3 months, and as we see the total row of the heatmap, the early months have very small percentages.

Recommendation :
-	Introduce early activation incentives to trigger speed, like bonuses, discounts, and educational content
-	implement re-engagement campaigns for users inactive after 1-3 months
-	Analyse behaviour of users who convert early (<3 months) to identify success patterns

![image_alt](https://github.com/melinahdi/Fintech-User-Funnel-Analysis/blob/main/Event%20Type.png)

The users in this part are the active users in the last 3 months of 2025. User distribution by event type is representative of user behaviour regarding their engagement with these fintech products. Event type distribution is around 30,000 users. 1-3 products are leading the user preference. Users are engaging, but with a narrow set of fintech products. This could indicate either product loyalty or underutilization of broader offerings.

Recommendation : 
-	Promote cross-product usage through in-app nudges and personalised recommendations
-	Track feature adoption cohorts to identify which products drive retention

![image_alt](https://github.com/melinahdi/Fintech-User-Funnel-Analysis/blob/main/Returning%20User.png)

The active days here mean users keep returning to the fintech product for certain days, as shown in the above histogram. The peak is between 9 and 11 days. Showing moderate return usage
Recommendation :
-	Introduce rewards or loyalty programs for consistent usage and drive high-frequency habits
-	Analyse what drives users who are active on days 9-11 and replicate those triggers earlier
