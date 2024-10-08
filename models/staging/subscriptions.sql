{{ config(materialized='view') }}

with subscription_src as (
    select * from WORKSHOP.WORKSPACE.WORKSPACE_SUBSCRIPTION
)
select
    sb.user_id,
    sb.status,
    sb.payment_term,
    sb.payment_method,
    sb.subscription_term
from subscription_src sb