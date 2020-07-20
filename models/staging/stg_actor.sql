with actors as (

    select * from {{ ref('snapshot_actor') }}

),
final as (
    SELECT
        {{ dbt_utils.surrogate_key(['FIRSTNAME', 'LASTNAME']) }} AS ACTOR_HASH_KEY,
        FIRSTNAME || LASTNAME AS BUSINESS_KEY,
        ACTORID As ACTOR_ID,
        FIRSTNAME AS ACTOR_FIRST_NAME,
        LASTNAME AS ACTOR_LAST_NAME,
        '{{ var("sakila_source") }}' as RECORD_SOURCE,
        DBT_VALID_FROM AS LOAD_DATE,
        DBT_VALID_TO AS LOAD_END_DATE,
        DATEDIFF(day,DBT_VALID_FROM,CURRENT_TIMESTAMP()) AS LAST_SEEN
    FROM actors
)

SELECT * FROM final