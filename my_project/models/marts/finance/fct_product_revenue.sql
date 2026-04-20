select
    order_id,
    order_date,
    customer_id,
    product_id,
    product_name,
    category,
    quantity,
    price,
    line_revenue
from {{ ref('int_orders_with_historical_price') }}