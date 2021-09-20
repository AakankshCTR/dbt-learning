with orders as (
    select * from {{ ref('stg_orders') }}
),

fact_orders as (
    select order_id, case when status = 'success' then amount else 0 end as amount from {{ ref('stg_payments') }}
),

final as (
    select o.order_id,
           o.customer_id,
           fo.amount
    from orders o inner join fact_orders fo on o.order_id = fo.order_id 
)

Select * from final