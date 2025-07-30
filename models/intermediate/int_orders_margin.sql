select
    orders_id, 
    date_date,
    SUM(revenue) as revenue, 
    SUM(quantity) as quantity,
    SUM(purchase_cost) as purchase_cost,
    SUM(margin) as margin
FROM {{ref("int_sales_margin")}}
GROUP by orders_id, date_date