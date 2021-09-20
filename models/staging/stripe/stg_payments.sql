with fact_orders as (
    select orderid as order_id,
           status,           
           amount/100 as amount
    from raw.stripe.payment
)

Select * from fact_orders