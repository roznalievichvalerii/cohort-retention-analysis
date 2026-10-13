# Cohort & Retention Analysis

## Project Overview
This project analyzes user retention using cohort analysis. The goal is to understand how user engagement changes over time and compare retention patterns between promotional and organic users.

## Business Problem
Understanding user retention helps businesses evaluate user engagement, identify retention trends, and assess the effectiveness of promotional acquisition strategies.

## Objectives
- Analyze user retention across monthly cohorts.
- Calculate retention rates for subsequent months.
- Compare promotional and organic users.
- Identify retention patterns and potential areas for improvement.
- Provide data-driven business recommendations.

## Tools & Technologies
- SQL
- PostgreSQL
- Google Sheets
- Cohort Analysis
- Data Visualization

## Methodology
1. Prepared and validated user registration and activity data.
2. Defined monthly cohorts based on registration dates.
3. Calculated monthly retention rates.
4. Compared retention between promotional and organic users.
5. Visualized results using cohort tables and conditional formatting.
6. Developed business insights and recommendations.

## Key Findings

- **Organic Users Show Higher Retention.** Organic users demonstrate stronger retention than promotional users. Weighted M1 retention is approximately **81.2% for organic users**, compared with **55.4% for promotional users**. This suggests that organic users are more likely to remain active in the month following registration.

- **The Retention Gap Widens Over Time.** The difference between acquisition channels becomes more pronounced in later months. Weighted retention is approximately **80.0% vs. 41.3% in M2** and **77.2% vs. 25.5% in M3** for organic and promotional users, respectively. These figures are calculated using only cohorts with available observations for each month.

- **Overall Retention Declines Over Time.** Across all users, weighted retention decreases from approximately **71.2% in M1** to **58.3% in M3**. This highlights the importance of improving early engagement and maintaining user activity after registration.

- **Promotional Users Contribute to Acquisition but Show Lower Retention.** The promotional segment contains 242 users at M0, while the organic segment contains 358. Although promotional campaigns can attract users, their lower observed retention suggests that acquisition volume alone may not indicate long-term value.

- **Cohort Age Matters.** Older cohorts have more months of observed activity than newer cohorts. Comparisons of long-term retention should therefore use only cohorts with data available for the same month offset.

## Business Recommendations

1. **Evaluate Acquisition Channel Quality.** Compare promotional and organic users not only by the number of registrations, but also by retention, engagement, and long-term value. Use these metrics to assess the effectiveness of acquisition campaigns.

2. **Improve Promotional User Retention.** Investigate why promotional users have lower observed retention. Consider testing improved onboarding, follow-up communication, and engagement initiatives tailored to users acquired through promotions.

3. **Strengthen Early Engagement.** Analyze user behavior during the first month after registration to identify barriers to continued activity. Test interventions that encourage users to return and experience the product's core value.

4. **Investigate Long-Term Engagement.** Examine the behavior of organic users who remain active over multiple months. Identify patterns that may help improve retention among promotional users, while validating whether these patterns apply to both groups.

5. **Continue Monitoring Cohorts.** Update the cohort analysis as more data becomes available. Compare cohorts over equivalent observation periods to avoid drawing misleading conclusions from incomplete data.

## Conclusion

The cohort analysis reveals a clear difference in retention between organic and promotional users. Organic users show substantially higher retention across the observed months, while promotional users experience a steeper decline in activity. These findings suggest that acquisition strategies should be evaluated based on both the number of users acquired and their ability to remain engaged over time. Further analysis of user behavior, campaign characteristics, and engagement patterns can help identify opportunities to improve retention and acquisition efficiency.


## Project Deliverables
- SQL queries used for data preparation and analysis.
- Cohort retention tables.
- Promotional vs. organic user comparison.
- Data visualizations and business insights.

## Project Files

- **Excel Analysis:** [cohort_analysis.xlsx](cohort_analysis.xlsx) — cohort tables, user activity, and retention results.
- **SQL Queries:** [cohort_analysis.sql](sql/cohort_analysis.sql) — SQL queries used for cohort analysis and retention calculations.
- **Screenshots:** See the [results](results/) folder for visual examples of the analysis.
## Project Screenshots

### Cohort Analysis Overview

![Cohort Analysis Overview](results/Overview.png)

### Promotional Users

![Promotional Users](results/Promotional%20Users.png)

### Organic Users

![Organic Users](results/Organic%20Users.png)

## Author
Valerii Roznalievich
Aspiring Data Analyst | SQL • PostgreSQL • Google Sheets
LinkedIn www.linkedin.com/in/valerii-roznalievich-data
