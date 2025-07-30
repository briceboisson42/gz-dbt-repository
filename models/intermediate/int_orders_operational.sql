WITH j_ship AS(
SELECT 
    int_orders_margin.orders_id,
    int_orders_margin.date_date,
    int_orders_margin.revenue,
    int_orders_margin.quantity, 
    int_orders_margin.purchase_cost,
    int_orders_margin.margin,
    stg_raw__ship.shipping_fee,
    stg_raw__ship.ship_cost,
    stg_raw__ship.logcost
FROM {{ref("int_orders_margin")}}
LEFT JOIN {{ref("stg_raw__ship")}}
ON int_orders_margin.orders_id = stg_raw__ship.orders_id) 

SELECT 
    orders_id, 
    date_date,
    SUM(revenue) as revenue,
    SUM(margin+shipping_fee-ship_cost-logcost) as operational_margin,
    SUM(quantity) as quantity,
    SUM(margin) as margin,
    SUM(purchase_cost) as purchase_cost,
    SUM(shipping_fee) as shipping_fee,
    SUM(ship_cost) as ship_cost,
    SUM(logcost) as log_cost

FROM j_ship
GROUP BY orders_id, date_date