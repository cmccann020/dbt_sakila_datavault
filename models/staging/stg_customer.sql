with customer as (

    select * from {{ ref('snapshot_customer') }}

)
,
final as (
    SELECT
        {{ dbt_utils.surrogate_key(['EMAIL']) }} AS CUSTOMER_HASH_KEY, 
        CUSTOMER_ID,
        STORE_ID,
        FIRST_NAME as CUSTOMER_FIRST_NAME,
        LAST_NAME AS CUSTOMER_LAST_NAME,
        EMAIL AS CUSTOMER_EMAIL,
        ADDRESS_ID,
        ACTIVE AS CUSTOMER_ACTIVE,
        DBT_UPDATED_AT AS LOAD_DATE,
        DBT_VALID_FROM AS VALID_FROM,
        DBT_VALID_TO AS VALID_TO
    FROM customer

)

SELECT * FROM final