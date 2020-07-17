with address as (

    select * from {{ source('Sakila','address') }}

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
        LAST_UPDATE
    FROM address
    )

SELECT * FROM final