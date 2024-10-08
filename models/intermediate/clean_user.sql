{{ config(materialized='table') }}

with cleansed_user as
(
    select * from {{ ref('user') }}
)
select
    cu.user_id as user_id,
    cu.username as user_name,
    cu.gender as gender,
    JSON_EXTRACT_PATH_TEXT(TO_JSON(cu.employment), 'title') as title,
    JSON_EXTRACT_PATH_TEXT(TO_JSON(cu.subscription), 'payment_method') as payment_method
from cleansed_user as cu