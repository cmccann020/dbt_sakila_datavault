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
        DBT_SCD_ID AS DBT_INCREMENTAL_ID,
        DBT_UPDATED_AT
    FROM language
    WHERE DBT_VALID_TO IS NULL
)

select * from final