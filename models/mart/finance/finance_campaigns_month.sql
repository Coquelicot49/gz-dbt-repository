SELECT 
 DATE_TRUNC(date_date, month) AS date_date
 , ROUND(SUM(ads_margin),2) AS ads_margin
 , ROUND(SUM(average_basket),2) AS  average_basket
 , ROUND(SUM(operational_margin),2) AS operational_margin
 , ROUND(SUM(ads_cost),2) AS ads_cost
 ,ROUND(SUM(ads_impression),2) AS  ads_impression
 , ROUND(SUM(ads_click),2) AS  ads_click
 , ROUND(SUM(quantity),2) AS  quantity
 , ROUND(SUM(revenue),2) AS revenue
 , ROUND(SUM(purchase_cost),2) AS purchase_cost
 ,  ROUND(SUM(margin),2) AS margin
 --, shipping_fee
 --, logcost
 --, ship_cost
FROM {{ ref('finance_campaigns_day') }}
GROUP BY date_date