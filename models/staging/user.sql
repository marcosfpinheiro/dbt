{{ config(materialized='view') }}


with user_src as (
    select * from WORKSHOP.WORKSPACE.WORKSPACE_USER 
)
select 
    pu.id,
    pu.user_id,
    pu.username,
    pu.gender,
    pu.employment,
    pu.credit_card,
    pu.subscription
from user_src pu

