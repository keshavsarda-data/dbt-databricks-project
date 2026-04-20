{{ config(materialized='view') }}

select
    product_id,
    initcap(product_name) as product_name,
    upper(category) as category,
    created_at
from {{ source('analytics', 'products_raw') }}
where product_id is not null