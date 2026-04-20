select
    customer_id,
    customer_name,
    total_orders,
    total_revenue
from {{ ref('int_customer_revenue') }}
where total_orders > 1