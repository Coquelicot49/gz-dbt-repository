select 
date_date
, ROUND(SUM(ads_cost),2) AS ads_cost
, ROUND(SUM(impression),2) AS ads_impression
, ROUND(SUM(click),2) AS ads_click
from {{ ref('int_campaigns') }}
group by date_date
ORDER BY date_date DESC