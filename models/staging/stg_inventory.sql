with inventory as (

    select * from {{ ref('snapshot_inventory') }}

)
,
final as (
    SELECT
        INVENTORY_ID,
        FILM_ID,
        STORE_ID,
        DBT_UPDATED_AT AS LOAD_DATE,
        DBT_VALID_FROM AS VALID_FROM,
        DBT_VALID_TO AS VALID_TO
    FROM inventory
)

select * from final