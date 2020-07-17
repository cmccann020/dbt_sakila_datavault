with inventory as (

    select * from {{ source('Sakila','inventory') }}

)
,
final as (
    SELECT
        INVENTORY_ID,
        FILM_ID,
        STORE_ID,
        LAST_UPDATE
    FROM inventory
)

select * from final