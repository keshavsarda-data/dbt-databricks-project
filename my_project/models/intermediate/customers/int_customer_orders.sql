select
    c.customer_id,
    c.customer_name,
    c.email,
    a.city,
    a.state,
    a.country,
    o.order_id,
    o.order_date,
    o.order_status
from {{ ref('stg_customers') }} c
left join {{ ref('stg_customer_addresses') }} a
    on c.customer_id = a.customer_id
left join {{ ref('stg_orders') }} o
    on c.customer_id = o.customer_id