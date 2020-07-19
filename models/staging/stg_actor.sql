with actors as (

    select * from {{ source('Sakila','actor') }}

),
final as (
    SELECT
        {{ dbt_utils.surrogate_key(['FIRSTNAME', 'LASTNAME']) }} AS ACTOR_HASH_KEY,
        ACTORID As ACTOR_ID,
        FIRSTNAME AS ACTOR_FIRST_NAME,
        LASTNAME AS ACTOR_LAST_NAME,
        DATETIME AS LAST_UPDATE
    FROM actors
)

SELECT * FROM final