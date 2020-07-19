with rental as (

    select * from {{ ref('snapshot_rental') }}

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
        DBT_UPDATED_AT AS LOAD_DATE,
        DBT_VALID_FROM AS VALID_FROM,
        DBT_VALID_TO AS VALID_TO
    FROM rental
)

select * from final