with
    j_sales_pdt as (
        select
            date_date,
            orders_id,
            stg_raw__sales.products_id,
            revenue,
            quantity,
            stg_raw__product.purchase_price,
        from {{ ref("stg_raw__sales") }}
        left join
            {{ ref("stg_raw__product") }}
            on stg_raw__sales.products_id = stg_raw__product.products_id
    )

select *, 
(revenue - purchase_price) as margin, 
(quantity*purchase_price) AS purchase_cost
from j_sales_pdt