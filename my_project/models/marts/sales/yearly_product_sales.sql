select
    year(order_date) as sales_year,
    product_id,
    product_name,
    category,
    sum(quantity) as total_quantity_sold,
    sum(line_revenue) as total_revenue
from {{ ref('int_orders_with_historical_price') }}
group by
    year(order_date),
    product_id,
    product_name,
    category