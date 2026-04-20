{{ config(materialized='view') }}

select
    address_id,
    customer_id,
    initcap(city) as city,
    initcap(state) as state,
    upper(country) as country,
    postal_code,
    created_at
from {{ source('analytics', 'customer_addresses_raw') }}
where customer_id is not null