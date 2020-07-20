with country as (

    select * from {{ ref('snapshot_country') }}

)
,
final as (

    SELECT 
        {{ dbt_utils.surrogate_key(['COUNTRY']) }} AS COUNTRY_HASH_KEY,
        COUNTRY_ID,
        COUNTRY AS COUNTRY_NAME,
        '{{ var("sakila_source") }}' as RECORD_SOURCE,
        DBT_VALID_FROM AS LOAD_DATE,
        DBT_VALID_TO AS LOAD_END_DATE,
        DATEDIFF(day,DBT_VALID_FROM,CURRENT_TIMESTAMP()) AS LAST_SEEN
    FROM country

)

SELECT * FROM final