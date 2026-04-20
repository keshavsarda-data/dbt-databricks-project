select
    i.customer_id,
    i.customer_name,
    count(distinct f.order_id) as total_orders,
    sum(f.line_revenue) as total_revenue
from {{ ref('int_customer_orders') }} i
left join {{ ref('int_orders_with_historical_price') }} f
    on i.customer_id = f.customer_id
group by
    i.customer_id,
    i.customer_name