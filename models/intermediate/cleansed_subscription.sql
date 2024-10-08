{{ config(materialized='table')}}

with cleansed_subscription as (
    select * from {{ref('subscriptions')}}
)
select
sb.user_id,
case
    when plan in ('Business', 'Diamond', 'Gold', 'Platinium', 'Premium') then 'High'
    when plan in ('Bronze', 'Essential', 'Professional', 'Silver', 'Standard') then 'Normal'
    else 'Low'
end as subscription_importance,
sb.status,
sb.payment_term,
sb.payment_method,
sb.subscription_term
from cleansed_subscription sb
