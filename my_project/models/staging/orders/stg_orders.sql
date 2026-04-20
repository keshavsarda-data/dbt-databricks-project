{{ config(materialized='view') }}

select
    order_id,
    customer_id,
    cast(order_date as timestamp) as order_date,
    upper(order_status) as order_status
from {{ source('analytics', 'orders_raw') }}
where order_id is not null