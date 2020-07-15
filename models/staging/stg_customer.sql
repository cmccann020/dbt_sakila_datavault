with customer as (

    select * from {{ ref('snapshot_customer') }}

)
,
final as (
    SELECT
        {{ dbt_utils.surrogate_key(['FIRST_NAME','LAST_NAME']) }} AS CUSTOMER_HASH_KEY,
        CUSTOMER_ID,
        STORE_ID,
        FIRST_NAME AS CUSTOMER_FIRST_NAME,
        LAST_NAME AS CUSTOMER_LAST_NAME,
        EMAIL AS CUSTOMER_EMAIL,
        ADDRESS_ID,
        ACTIVE,
        CREATE_DATE,
        DBT_SCD_ID AS DBT_INCREMENTAL_ID,
        DBT_UPDATED_AT
    FROM customer
    WHERE DBT_VALID_TO IS NULL
)

SELECT * from final