{{ config(materialized='view') }}

select
    oi.order_item_id,
    oi.order_id,
    o.order_date,
    o.customer_id,
    oi.product_id,
    p.product_name,
    p.category,
    oi.quantity
from {{ ref('stg_order_items') }} oi
left join {{ ref('stg_orders') }} o
    on oi.order_id = o.order_id
left join {{ ref('stg_products') }} p
    on oi.product_id = p.product_id