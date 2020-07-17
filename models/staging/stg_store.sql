with store as (

    select * from {{ source('Sakila','store') }}

)
,
final as (

    SELECT
        {{ dbt_utils.surrogate_key(['STORE_ID']) }} AS STORE_HASH_KEY,
        STORE_ID,
        MANAGER_STAFF_ID,
        ADDRESS_ID,
        LAST_UPDATE
    FROM store
    
)

select * from final