select
    year(order_date) as sales_year,
    month(order_date) as sales_month,
    sum(line_revenue) as total_revenue,
    count(distinct order_id) as total_orders
from {{ ref('fct_product_revenue') }}
group by
    year(order_date),
    month(order_date)