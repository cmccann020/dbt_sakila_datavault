with film_category as (

    select * from {{ source('DBT_CMCCANN','film_category') }}

)
,
final as (

    select
        {{ dbt_utils.surrogate_key(['FILM_ID','CATEGORY_ID']) }} AS FILM_CATEGORY_HASH_KEY,
        FILM_ID,
        CATEGORY_ID,
        LAST_UPDATE
    FROM film_category
    
)

select * from final