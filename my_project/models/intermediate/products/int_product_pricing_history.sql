select
    product_price_id,
    product_id,
    price,

    cast(
        coalesce(
            valid_from,
            dbt_valid_from
        ) as date
    ) as valid_from,

    cast(
        coalesce(
            valid_to,
            dbt_valid_to,
            '2099-12-31'
        ) as date
    ) as valid_to

from {{ ref('products_snapshot') }}