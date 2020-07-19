with payment as (

    select * from {{ source('Sakila','payment') }}

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
        LAST_UPDATE
    FROM payment
)

select * from final