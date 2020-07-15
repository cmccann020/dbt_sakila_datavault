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
        DBT_SCD_ID AS DBT_Incremental_ID,
        DBT_UPDATED_AT
    FROM store
    WHERE DBT_VALID_TO IS NULL
    
)

select * from final