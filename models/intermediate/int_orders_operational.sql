    SELECT
        SALESMARGIN.orders_id
        ,SALESMARGIN.date_date
        ,SALESMARGIN.revenue
        ,SALESMARGIN.quantity
        ,SALESMARGIN.purchase_cost
        ,SALESMARGIN.margin
        ,(SALESMARGIN.margin + SHIP.shipping_fee - (SHIP.logcost + CAST(SHIP.ship_cost AS FLOAT64))) AS Operational_margin
        ,SHIP.shipping_fee
        ,SHIP.logcost
        ,SHIP.ship_cost
    FROM {{ ref('int_sales_margin') }} SALESMARGIN
    LEFT JOIN {{ ref('ship') }} SHIP
    ON SALESMARGIN.orders_id = SHIP.orders_id
ORDER BY orders_id DESC