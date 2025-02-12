
  SELECT
    SALES.products_id
    ,SALES.date_date
    ,SALES.orders_id
    ,SALES.revenue
    ,SALES.quantity
    ,PRODUCT.purchase_price
    ,ROUND((SALES.quantity * PRODUCT.purchase_price),2) as purchase_cost
    ,ROUND(SALES.revenue - SALES.quantity * PRODUCT.purchase_price ,2) AS margin
  FROM {{ ref('sales') }} SALES
  LEFT JOIN {{ ref('product') }} PRODUCT
  ON PRODUCT.products_id = SALES.products_id

