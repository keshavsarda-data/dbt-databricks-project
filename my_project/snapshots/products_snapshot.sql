{% snapshot products_snapshot %}

{{
    config(
        unique_key='product_price_id',
        strategy='check',
        check_cols=['price']
    )
}}

select *
from {{ ref('stg_products_prices') }}

{% endsnapshot %}