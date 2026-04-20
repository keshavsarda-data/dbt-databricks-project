select
    customer_id,
    customer_name,
    email,
    city,
    state,
    country
from {{ ref('int_customer_orders') }}
group by
    customer_id,
    customer_name,
    email,
    city,
    state,
    country