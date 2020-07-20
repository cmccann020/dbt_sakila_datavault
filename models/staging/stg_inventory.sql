with inventory as (

    select * from {{ ref('snapshot_inventory') }}

)
,
final as (
    SELECT
        {{ dbt_utils.surrogate_key(['INVENTORY_ID']) }} AS INVENTORY_HASH_KEY,
        INVENTORY_ID,
        FILM_ID,
        STORE_ID,
        '{{ var("sakila_source") }}' as RECORD_SOURCE,
        DBT_VALID_FROM AS LOAD_DATE,
        DBT_VALID_TO AS LOAD_END_DATE,
        DATEDIFF(day,DBT_VALID_FROM,CURRENT_TIMESTAMP()) AS LAST_SEEN
    FROM inventory
)

select * from final