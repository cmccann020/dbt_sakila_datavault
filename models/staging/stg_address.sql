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
        DBT_UPDATED_AT AS LOAD_DATE,
        DBT_VALID_FROM AS VALID_FROM,
        DBT_VALID_TO AS VALID_TO
    FROM address
    )

SELECT * FROM final