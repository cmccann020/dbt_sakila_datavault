with store as (

    select * from {{ ref('snapshot_store') }}

)
,
final as (

    SELECT
        {{ dbt_utils.surrogate_key(['STORE_ID']) }} AS STORE_HASH_KEY,
        STORE_ID AS BUSINESS_KEY,
        STORE_ID,
        MANAGER_STAFF_ID,
        ADDRESS_ID,
        '{{ var("sakila_source") }}' as RECORD_SOURCE,
        DBT_VALID_FROM AS LOAD_DATE,
        DBT_VALID_TO AS LOAD_END_DATE,
        DATEDIFF(day,DBT_VALID_FROM,CURRENT_TIMESTAMP()) AS LAST_SEEN
    FROM store
    
)

select * from final