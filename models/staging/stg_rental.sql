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
        '{{ var("sakila_source") }}' as RECORD_SOURCE,
        DBT_VALID_FROM AS LOAD_DATE,
        DBT_VALID_TO AS LOAD_END_DATE,
        DATEDIFF(day,DBT_VALID_FROM,CURRENT_TIMESTAMP()) AS LAST_SEEN
    FROM rental
)

select * from final