with yearly_sales as (

    select
        year(order_date) as sales_year,
        product_id,
        product_name,
        category,
        sum(line_revenue) as total_revenue
    from {{ ref('int_orders_with_historical_price') }}
    group by
        year(order_date),
        product_id,
        product_name,
        category

),

ranked_products as (

    select
        *,
        dense_rank() over (
            partition by sales_year
            order by total_revenue desc
        ) as revenue_rank
    from yearly_sales

)

select *
from ranked_products
where revenue_rank <= 5