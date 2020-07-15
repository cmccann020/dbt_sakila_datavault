with city as (

    select * from {{ ref('snapshot_city') }}

)
,
country as (
    select * from {{ ref('snapshot_country') }}
)
,
final as (
    SELECT
        {{ dbt_utils.surrogate_key(['CITY','COUNTRY']) }} AS CITY_HASH_KEY,
        CITY_ID,
        CITY AS CITY_NAME,
        country.COUNTRY as COUNTRY_NAME,
        city.DBT_SCD_ID AS DBT_Incremental_ID,
        city.DBT_UPDATED_AT
    FROM city
    LEFT JOIN country
        ON city.COUNTRY_ID=country.COUNTRY_ID
    WHERE city.DBT_VALID_TO IS NULL
)

SELECT * FROM final