WITH STEP2 AS (
    SELECT
        SALESMARGIN.orders_id
        ,SALESMARGIN.date_date
        ,SALESMARGIN.margin
        ,(SALESMARGIN.margin + SHIP.shipping_fee - SHIP.logcost - CAST(SHIP.ship_cost AS FLOAT64)) AS Operational_margin
    FROM {{ ref('int_sales_margin') }} SALESMARGIN
    INNER JOIN {{ ref('ship') }} SHIP
    ON SALESMARGIN.orders_id = SHIP.orders_id
)
SELECT
orders_id
,date_date
,ROUND(SUM(margin),2) as margin
,ROUND(SUM(Operational_margin),2) as Operational_margin
FROM STEP2
GROUP BY orders_id
,date_date
ORDER BY orders_id
,date_date