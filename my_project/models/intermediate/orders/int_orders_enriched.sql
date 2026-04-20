{{ config(materialized='view') }}

select
    o.order_id,
    o.order_date,
    o.order_status,
    o.customer_id,
    c.customer_name,
    c.email,
    a.city,
    a.state,
    a.country,
    p.payment_method,
    p.payment_amount
from {{ ref('stg_orders') }} o
left join {{ ref('stg_customers') }} c
    on o.customer_id = c.customer_id
left join {{ ref('stg_customer_addresses') }} a
    on o.customer_id = a.customer_id
left join {{ ref('stg_payments') }} p
    on o.order_id = p.order_id