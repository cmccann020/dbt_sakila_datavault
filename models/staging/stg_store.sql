with store as (

    select * from {{ ref('snapshot_store') }}

)
,
final as (

    SELECT
        {{ dbt_utils.surrogate_key(['STORE_ID']) }} AS STORE_HASH_KEY,
        STORE_ID,
        MANAGER_STAFF_ID,
        ADDRESS_ID,
        DBT_UPDATED_AT AS LOAD_DATE,
        DBT_VALID_FROM AS VALID_FROM,
        DBT_VALID_TO AS VALID_TO
    FROM store
    
)

select * from final