SELECT
    date_date, 
    count(orders_id) AS nb_transactions,
    ROUND(SUM(revenue),2) as total_revenue,
    ROUND(AVG(revenue),2) as avg_basket,
    ROUND(SUM(operational_margin),2) as operational_margin,
    ROUND(SUM(purchase_cost),2) as total_purchase_cost,
    ROUND(SUM(shipping_fee),2) as total_shipping_fee,
    ROUND(SUM(log_cost),2) as total_log_cost,
    ROUND(SUM(quantity),2) as total_product_sold
FROM {{ref("int_orders_operational")}}
GROUP BY date_date
ORDER BY date_date ASC