    SELECT
        SALESMARGIN.orders_id
        ,SALESMARGIN.date_date
        ,ROUND(SUM(SALESMARGIN.revenue),2) as revenue
        ,ROUND(sum(SALESMARGIN.quantity),2) as quantity
        ,ROUND(sum(SALESMARGIN.purchase_cost),2) AS purchase_cost
        ,ROUND(SUM(SALESMARGIN.margin),2) AS margin
        ,ROUND( SUM(SALESMARGIN.margin + SHIP.shipping_fee - (SHIP.logcost + CAST(SHIP.ship_cost AS FLOAT64))),2) AS Operational_margin
        ,ROUND(SUM(SHIP.shipping_fee),2) AS shipping_fee
        ,ROUND(SUM(SHIP.logcost),2) AS logcost
        ,ROUND(SUM(CAST(SHIP.ship_cost as FLOAT64)),2) AS ship_cost
    FROM {{ ref('int_sales_margin') }} SALESMARGIN
    LEFT JOIN {{ ref('ship') }} SHIP
    ON SALESMARGIN.orders_id = SHIP.orders_id
GROUP BY orders_id, date_date
ORDER BY orders_id DESC