select
    year(order_date) as revenue_year,
    product_id,
    product_name,
    category,
    sum(quantity) as total_quantity_sold,
    sum(line_revenue) as total_revenue
from {{ ref('fct_product_revenue') }}
group by
    year(order_date),
    product_id,
    product_name,
    category