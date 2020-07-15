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
        DBT_SCD_ID AS DBT_Incremental_ID,
        DBT_UPDATED_AT
    FROM payment
    WHERE DBT_VALID_TO IS NULL
)

select * from final