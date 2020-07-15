with inventory as (

    select * from {{ ref('snapshot_inventory') }}

)
,
final as (
    SELECT
        INVENTORY_ID,
        FILM_ID,
        STORE_ID,
        DBT_SCD_ID AS DBT_INCREMENTAL_ID,
        DBT_UPDATED_AT
    FROM inventory
    WHERE DBT_VALID_TO IS NULL
)

select * from final