select
    order_id,
    customer_id,
    product_id,
    order_date,
    quantity,
    price,
    line_revenue
from {{ ref('int_orders_with_historical_price') }}