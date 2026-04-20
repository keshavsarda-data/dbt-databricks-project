{{ config(materialized='view') }}

select
    customer_id,
    upper(customer_name) as customer_name,
    lower(email) as email,
    created_at
from {{ source('analytics', 'customers_raw') }}
where customer_id is not null