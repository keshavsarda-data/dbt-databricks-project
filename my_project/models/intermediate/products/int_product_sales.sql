select
    product_id,
    product_name,
    category,
    count(distinct order_id) as total_orders,
    sum(quantity) as total_quantity_sold,
    sum(line_revenue) as total_revenue
from {{ ref('int_orders_with_historical_price') }}
group by
    product_id,
    product_name,
    category