with country as (

    select * from {{ ref('snapshot_country') }}

)
,
final as (

    SELECT 
        {{ dbt_utils.surrogate_key(['COUNTRY']) }} AS COUNTRY_HASH_KEY,
        COUNTRY_ID,
        COUNTRY AS COUNTRY_NAME,
        DBT_UPDATED_AT AS LOAD_DATE,
        DBT_VALID_FROM AS VALID_FROM,
        DBT_VALID_TO AS VALID_TO
    FROM country

)

SELECT * FROM final