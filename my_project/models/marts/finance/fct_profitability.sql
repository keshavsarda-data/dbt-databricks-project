select
    product_id,
    product_name,
    category,
    sum(quantity) as total_quantity_sold,
    sum(line_revenue) as total_revenue,
    avg(price) as average_price
from {{ ref('fct_product_revenue') }}
group by
    product_id,
    product_name,
    category