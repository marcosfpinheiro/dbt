{{ config(materialized='table') }}

with
cleansed_payments as
(
    select * from {{ ref('cleansed_payments')}}
),

cleansed_subscription as 
(
    select * from {{ ref('cleansed_subscription')}}
),

payments_per_plan_credit_card_type as (
    select
        subs.subscription_importance,
        pmts.credit_card_type,
        sum(pmts.subscription_price) as total_price
        from cleansed_payments as pmts
        inner join cleansed_subscription as subs
        on pmts.user_id = subs.user_id
        group by subs.subscription_importance, pmts.credit_card_type
        order by subs.subscription_importance asc, total_price desc
)
select * from payments_per_plan_credit_card_type