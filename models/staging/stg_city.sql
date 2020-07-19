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
        DBT_UPDATED_AT AS LOAD_DATE,
        DBT_VALID_FROM AS VALID_FROM,
        DBT_VALID_TO AS VALID_TO
    FROM city
    LEFT JOIN country
        ON city.COUNTRY_ID=country.COUNTRY_ID
)

SELECT * FROM final