{% snapshot customers_snapshot %}

{{
    config(
        target_schema='snapshots',
        unique_key='customer_id',
        strategy='check',
        check_cols=[
            'customer_name',
            'email',
            'city',
            'state',
            'country'
        ]
    )
}}

select
    c.customer_id,
    c.customer_name,
    c.email,
    a.city,
    a.state,
    a.country
from {{ ref('stg_customers') }} c
left join {{ ref('stg_customer_addresses') }} a
    on c.customer_id = a.customer_id

{% endsnapshot %}