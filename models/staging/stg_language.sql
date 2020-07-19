with language as (

    select * from {{ source('Sakila','language') }}

)
,

,
final as (
    SELECT
        {{ dbt_utils.surrogate_key(['NAME']) }} AS LANGUAGE_HASH_KEY,
        LANGUAGE_ID,
        TRIM(NAME,'"') AS LANGUAGE_NAME,
        LAST_UPDATE
    FROM language
)

select * from final