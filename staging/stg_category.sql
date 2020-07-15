with category as (

    select * from {{ ref('snapshot_category') }}

)
,
final as (
    SELECT
        {{ dbt_utils.surrogate_key(['NAME']) }} AS CATEGORY_HASH_KEY,
        CATEGORY_ID,
        NAME AS Category_NAME,
        DBT_SCD_ID AS DBT_Incremental_ID,
        DBT_UPDATED_AT
    FROM category
    WHERE DBT_VALID_TO IS NULL
)

SELECT * FROM final