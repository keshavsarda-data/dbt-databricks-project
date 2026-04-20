{{ config(materialized='view') }}

select
    payment_id,
    order_id,
    lower(payment_method) as payment_method,
    payment_amount,
    cast(payment_date as timestamp) as payment_date
from {{ source('analytics', 'payments_raw') }}
where payment_id is not null