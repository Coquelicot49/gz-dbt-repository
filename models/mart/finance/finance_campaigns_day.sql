
SELECT
FIN.date_date
,ROUND(SUM(FIN.operational_margin - CAMP.ads_cost), 2) AS ads_margin
, ROUND(SUM(FIN.average_basket),1) AS average_basket
, ROUND(SUM(operational_margin),0)AS operational_margin
, ROUND(SUM(CAMP.ads_cost),0)AS ads_cost
, ROUND(SUM(CAMP.ads_impression),0)AS ads_impression
, ROUND(SUM(CAMP.ads_click),0)AS ads_click
, ROUND(SUM(FIN.quantity),1) AS quantity
, ROUND(SUM(FIN.revenue),1) AS revenue
, ROUND(SUM(FIN.purchase_cost),1) AS purchase_cost
, ROUND(SUM(FIN.margin),1) AS margin
, ROUND(SUM(FIN.shipping_fee),1) AS shipping_fee
, ROUND(SUM(FIN.logcost),1) AS logcost
, ROUND(SUM(FIN.ship_cost),1) AS ship_cost
FROM {{ ref('finance_days') }} FIN
LEFT JOIN {{ ref('int_campaigns_day') }} CAMP
ON FIN.date_date = CAMP.date_date
GROUP BY date_date
order by date_date DESC