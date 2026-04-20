{{ config(materialized='view') }}

select
    product_price_id,
    product_id,
    price,
    valid_from,
    valid_to
from {{ source('analytics', 'product_prices_raw') }}
where product_price_id is not null