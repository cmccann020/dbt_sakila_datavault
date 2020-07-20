with staff as (

    select * from {{ ref('snapshot_staff') }}

)
,
final as (
    SELECT
        {{ dbt_utils.surrogate_key(['EMAIL']) }} AS STAFF_HASH_KEY,
        EMAIL AS BUSINESS_KEY,
        STAFF_ID,
        FIRST_NAME AS STAFF_FIRST_NAME,
        LAST_NAME AS STAFF_LAST_NAME,
        ADDRESS_ID,
        PICTURE,
        EMAIL AS STAFF_EMAIL,
        STORE_ID,
        ACTIVE,
        USERNAME AS STAFF_USERNAME,
        PASSWORD AS STAFF_PASSWORD,
        '{{ var("sakila_source") }}' as RECORD_SOURCE,
        DBT_VALID_FROM AS LOAD_DATE,
        DBT_VALID_TO AS LOAD_END_DATE,
        DATEDIFF(day,DBT_VALID_FROM,CURRENT_TIMESTAMP()) AS LAST_SEEN
    FROM staff
)

select * from final