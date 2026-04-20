select
    order_item_id,
    order_id,
    product_id,
    product_name,
    category,
    quantity,
    price,
    line_revenue
from {{ ref('int_orders_with_historical_price') }}