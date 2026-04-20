select
    customer_id,
    customer_name,
    count(distinct order_id) as total_orders,
    min(order_date) as first_order_date,
    max(order_date) as latest_order_date
from {{ ref('int_customer_orders') }}
group by
    customer_id,
    customer_name