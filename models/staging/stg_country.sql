with country as (

    select * from {{ source('Sakila','country') }}

)
,
final as (

    SELECT 
        {{ dbt_utils.surrogate_key(['COUNTRY']) }} AS COUNTRY_HASH_KEY,
        COUNTRY_ID,
        COUNTRY AS COUNTRY_NAME,
    FROM country

)

SELECT * FROM final