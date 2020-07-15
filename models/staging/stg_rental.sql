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
        DBT_SCD_ID AS DBT_Incremental_ID,
        DBT_UPDATED_AT
    FROM rental
    WHERE DBT_VALID_TO IS NULL
)

select * from final