with address as (

    select * from {{ ref('snapshot_address') }}

)
,
final as(
    SELECT
        {{ dbt_utils.surrogate_key(['ADDRESS']) }} AS ADDRESS_HASH_KEY,
        ADDRESS_ID,
        ADDRESS,
        ADDRESS2,
        NULLIF(DISTRICT,'" "') AS DISTRICT,
        CITY_ID,
        POSTAL_CODE,
        NULLIF(PHONE,'" "') AS Phone_Number,
        '{{ var("sakila_source") }}' as RECORD_SOURCE,
        DBT_VALID_FROM AS LOAD_DATE,
        DBT_VALID_TO AS LOAD_END_DATE,
        DATEDIFF(day,DBT_VALID_FROM,CURRENT_TIMESTAMP()) AS LAST_SEEN
    FROM address
    )

SELECT * FROM final