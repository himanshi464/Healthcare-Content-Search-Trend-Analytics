# Healthcare Content & Search Trend Analytics
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

search = pd.read_csv('../02_Clean_Data/search_trends_clean.csv')
content = pd.read_csv('../02_Clean_Data/content_performance_clean.csv')
doctors = pd.read_csv('../02_Clean_Data/doctors_clean.csv')

print(search.head())
print(content.head())
print(search.isnull().sum())
print(content.isnull().sum())

topic_search = search.groupby(['Specialty','Topic']).agg(
    avg_search_interest=('Search Interest','mean'),
    avg_trend_growth=('Trend Change %','mean')
).reset_index()

topic_content = content.groupby(['Specialty','Topic']).agg(
    avg_engagement=('Engagement_Rate','mean'),
    total_reach=('Reach','sum'),
    total_posts=('Post_ID','count')
).reset_index()

combined = topic_search.merge(topic_content, on=['Specialty','Topic'], how='inner')

# Min-max normalization
def minmax(s):
    if s.max() == s.min():
        return pd.Series(1.0, index=s.index)
    return (s-s.min())/(s.max()-s.min())

combined['search_score'] = minmax(combined['avg_search_interest'])
combined['engagement_score'] = minmax(combined['avg_engagement'])
combined['trend_score'] = minmax(combined['avg_trend_growth'])

latest_date = search['Date'].max()
combined['recency_score'] = 1.0  # Replace with a date-based normalized score after using final data
combined['opportunity_score'] = (
    0.40*combined['search_score'] +
    0.30*combined['engagement_score'] +
    0.20*combined['trend_score'] +
    0.10*combined['recency_score']
)*100

print(combined.sort_values('opportunity_score', ascending=False).head(15))

# Search vs engagement
plt.figure(figsize=(9,6))
plt.scatter(combined['avg_search_interest'], combined['avg_engagement'])
plt.xlabel('Average Search Interest')
plt.ylabel('Average Engagement Rate')
plt.title('Search Interest vs Content Engagement')
plt.tight_layout()
plt.show()

# Content format performance
format_perf = content.groupby('Content_Type').agg(
    avg_engagement=('Engagement_Rate','mean'),
    total_reach=('Reach','sum'),
    total_posts=('Post_ID','count')
).sort_values('avg_engagement', ascending=False)
print(format_perf)
