with language as (

    select * from {{ ref('snapshot_language') }}

)
,

,
final as (
    SELECT
        {{ dbt_utils.surrogate_key(['NAME']) }} AS LANGUAGE_HASH_KEY,
        LANGUAGE_ID,
        TRIM(NAME,'"') AS LANGUAGE_NAME,
        DBT_UPDATED_AT AS LOAD_DATE,
        DBT_VALID_FROM AS VALID_FROM,
        DBT_VALID_TO AS VALID_TO
    FROM language
)

select * from final