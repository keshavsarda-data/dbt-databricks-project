select
    customer_id,
    customer_name,
    total_orders,
    total_revenue,
    case
        when total_revenue >= 10000 then 'High Value'
        when total_revenue >= 5000 then 'Medium Value'
        else 'Low Value'
    end as customer_segment
from {{ ref('int_customer_revenue') }}