with city as (

    select * from {{ source('Sakila','city') }}

)
,
country as (

    select * from {{ source('Sakila','country') }}

)
,
final as (
    SELECT
        {{ dbt_utils.surrogate_key(['CITY','COUNTRY']) }} AS CITY_HASH_KEY,
        CITY_ID,
        CITY AS CITY_NAME,
        country.COUNTRY as COUNTRY_NAME,
        city.LAST_UPDATE
    FROM city
    LEFT JOIN country
        ON city.COUNTRY_ID=country.COUNTRY_ID
)

SELECT * FROM final