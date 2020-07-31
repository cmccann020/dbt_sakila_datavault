with customer as (

    select * from {{ ref('snapshot_customer') }}

)
,
final as (
    SELECT
        {{ dbt_utils.surrogate_key(['EMAIL']) }} AS CUSTOMER_HASH_KEY, 
        EMAIL AS BUSINESS_KEY,
        CUSTOMER_ID,
        STORE_ID,
        FIRST_NAME as CUSTOMER_FIRST_NAME,
        LAST_NAME AS CUSTOMER_LAST_NAME,
        EMAIL AS CUSTOMER_EMAIL,
        ADDRESS_ID,
        ACTIVE AS CUSTOMER_ACTIVE,
        '{{ var("sakila_source") }}' as RECORD_SOURCE,
        DBT_VALID_FROM AS LOAD_DATE,
        DBT_VALID_TO AS LOAD_END_DATE,
        DATEDIFF(day,DBT_VALID_FROM,CURRENT_TIMESTAMP()) AS LAST_SEEN
    FROM customer
    order by email

)

SELECT * FROM final
where customer_email is null