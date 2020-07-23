with category as (

    select * from {{ ref('snapshot_category') }}
     
)
,
final as (
    SELECT
        {{ dbt_utils.surrogate_key(['NAME']) }} AS CATEGORY_HASH_KEY,
        NAME AS BUSINESS_KEY,
        CATEGORY_ID,
        NAME AS Category_NAME,
        '{{ var("sakila_source") }}' as RECORD_SOURCE,
        DBT_VALID_FROM AS LOAD_DATE,
        DBT_VALID_TO AS LOAD_END_DATE,
        DATEDIFF(day,DBT_VALID_FROM,CURRENT_TIMESTAMP()) AS LAST_SEEN
    FROM category
    order by NAME
)

SELECT * FROM final