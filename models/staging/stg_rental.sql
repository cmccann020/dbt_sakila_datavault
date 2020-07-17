with rental as (

    select * from {{ source('Sakila','rental') }}

)
,
final as (
    SELECT
        RENTAL_ID,
        RENTAL_DATE,
        INVENTORY_ID,
        CUSTOMER_ID,
        RETURN_DATE,
        STAFF_ID,
        LAST_UPDATE
    FROM rental
)

select * from final