with category as (

    select * from {{ source('Sakila','category') }}

)
,
final as (
    SELECT
        {{ dbt_utils.surrogate_key(['NAME']) }} AS CATEGORY_HASH_KEY,
        CATEGORY_ID,
        NAME AS Category_NAME,
        LAST_UPDATE
    FROM category
)

SELECT * FROM final