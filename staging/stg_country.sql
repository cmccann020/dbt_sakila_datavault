with country as (

    select * from {{ ref('snapshot_country') }}

)
,
final as (
    SELECT 
        {{ dbt_utils.surrogate_key(['COUNTRY']) }} AS COUNTRY_HASH_KEY,
        COUNTRY_ID,
        COUNTRY AS COUNTRY_NAME,
        DBT_SCD_ID AS DBT_Incremental_ID,
        DBT_UPDATED_AT
    FROM country
    WHERE DBT_VALID_TO IS NULL
)

SELECT * FROM final