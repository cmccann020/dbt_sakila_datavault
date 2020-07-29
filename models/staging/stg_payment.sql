with payment as (

    select * from {{ ref('snapshot_payment') }}

)
,
final as (
    SELECT
        {{ dbt_utils.surrogate_key(['PAYMENT_ID','CUSTOMER_ID','STAFF_ID','RENTAL_ID']) }} AS PAYMENT_HASH_KEY,
        PAYMENT_ID,
        CUSTOMER_ID,
        STAFF_ID,
        RENTAL_ID,
        AMOUNT AS PAYMENT_AMOUNT,
        PAYMENT_DATE,
        '{{ var("sakila_source") }}' as RECORD_SOURCE,
        DBT_VALID_FROM AS LOAD_DATE,
        DBT_VALID_TO AS LOAD_END_DATE,
        DATEDIFF(day,DBT_VALID_FROM,CURRENT_TIMESTAMP()) AS LAST_SEEN
    FROM payment
    order by payment_id
)

select * from final