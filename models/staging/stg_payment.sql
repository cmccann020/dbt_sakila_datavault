with payment as (

    select * from {{ ref('snapshot_payment') }}

)
,
final as (
    SELECT
        PAYMENT_ID,
        CUSTOMER_ID,
        STAFF_ID,
        RENTAL_ID,
        AMOUNT AS PAYMENT_AMOUNT,
        PAYMENT_DATE,
        DBT_UPDATED_AT AS LOAD_DATE,
        DBT_VALID_FROM AS VALID_FROM,
        DBT_VALID_TO AS VALID_TO
    FROM payment
)

select * from final