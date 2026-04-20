select
    owp.order_item_id,
    owp.order_id,
    owp.order_date,
    owp.customer_id,
    owp.product_id,
    owp.product_name,
    owp.category,
    owp.quantity,
    iph.price,
    owp.quantity * iph.price as line_revenue
from {{ ref('int_orders_with_products') }} owp
left join {{ ref('int_product_pricing_history') }} iph
    on owp.product_id = iph.product_id
   and cast(owp.order_date as date) >= iph.valid_from
   and cast(owp.order_date as date) <= iph.valid_to