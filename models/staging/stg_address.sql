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
        DBT_SCD_ID AS DBT_Incremental_ID,
        DBT_UPDATED_AT
    FROM address
    WHERE DBT_VALID_TO IS NULL
    )

SELECT * FROM final