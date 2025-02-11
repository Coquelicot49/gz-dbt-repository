WITH step1 AS (
  SELECT
    SALES.orders_id
    ,SALES.products_id
    ,SALES.date_date
    ,SALES.revenue
    ,SALES.quantity
    ,PRODUCT.purchase_price
    , (SALES.quantity * PRODUCT.purchase_price) as purchase_cost
  FROM {{ ref('sales') }} SALES
  INNER JOIN {{ ref('product') }} PRODUCT
  ON PRODUCT.products_id = SALES.products_id
)
SELECT
    products_id
    ,orders_id
    , date_date
    ,ROUND(SUM(revenue),2) AS revenue
    ,ROUND(SUM(quantity),2) AS quantity
    ,ROUND(SUM(purchase_price),2) AS purchase_price
    ,ROUND(SUM(purchase_cost),2) AS purchase_cost
    ,ROUND(SUM((revenue - purchase_cost)),2) as margin
  FROM step1
  GROUP BY products_id, orders_id, date_date
  ORDER BY products_id, orders_id, date_date