{{ config(materialized = 'view') }}


with payment_src as(
    select * from WORKSHOP.WORKSPACE.WORKSPACE_PAYMENTS
)
select 
    ps.user_id,
    ps.city,
    ps.race,
    ps.country,
    ps.currency,
    ps.credit_card_type,
    ps.subscription_price
from payment_src ps