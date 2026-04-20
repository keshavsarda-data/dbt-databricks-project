{{ config(materialized='view') }}

select
    order_item_id,
    order_id,
    product_id,
    quantity
from {{ source('analytics', 'order_items_raw') }}
where order_item_id is not null