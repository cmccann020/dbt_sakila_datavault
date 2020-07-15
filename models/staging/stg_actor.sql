with actors as (

    select * from {{ ref('snapshot_actor') }}

),
final as (
    SELECT
        {{ dbt_utils.surrogate_key(['FIRSTNAME', 'LASTNAME']) }} AS ACTOR_HASH_KEY,
        ACTORID As ACTOR_ID,
        FIRSTNAME AS ACTOR_FIRST_NAME,
        LASTNAME AS ACTOR_LAST_NAME,
        DATETIME AS LAST_UPDATE,
        DBT_SCD_ID AS DBT_Incremental_ID,
        DBT_UPDATED_AT
    FROM actors
    WHERE DBT_VALID_TO IS NULL
)

SELECT * FROM final