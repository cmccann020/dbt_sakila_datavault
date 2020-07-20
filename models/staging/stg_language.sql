with language as (

    select * from {{ ref('snapshot_language') }}

)
,
clean_language as (
    SELECT
        LANGUAGE_ID,
        TRIM(NAME,'"') AS LANGUAGE_NAME,
        '{{ var("sakila_source") }}' as RECORD_SOURCE,
        DBT_VALID_FROM AS LOAD_DATE,
        DBT_VALID_TO AS LOAD_END_DATE,
        DATEDIFF(day,DBT_VALID_FROM,CURRENT_TIMESTAMP()) AS LAST_SEEN
    FROM language
)
,
final as (
    SELECT
        {{ dbt_utils.surrogate_key(['LANGUAGE_NAME']) }} AS LANGUAGE_HASH_KEY,
        LANGUAGE_ID,
        LANGUAGE_NAME,
        RECORD_SOURCE,
        LOAD_DATE,
        LOAD_END_DATE,
        LAST_SEEN
    FROM clean_language
)

select * from final