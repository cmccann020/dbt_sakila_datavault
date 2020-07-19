with category as (

    select * from {{ ref('snapshot_category') }}
     
)
,
final as (
    SELECT
        {{ dbt_utils.surrogate_key(['NAME']) }} AS CATEGORY_HASH_KEY,
        CATEGORY_ID,
        NAME AS Category_NAME,
        DBT_UPDATED_AT AS LOAD_DATE,
        DBT_VALID_FROM AS VALID_FROM,
        DBT_VALID_TO AS VALID_TO
    FROM category
)

SELECT * FROM final