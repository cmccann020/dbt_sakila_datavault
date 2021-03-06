with film_category as (

    select * from {{ source('Sakila','film_category') }}

)
,
final as (

    select
        {{ dbt_utils.surrogate_key(['FILM_ID','CATEGORY_ID']) }} AS FILM_CATEGORY_HASH_KEY,
        FILM_ID,
        CATEGORY_ID,
        LAST_UPDATE as LOAD_DATE,
        '{{ var("sakila_source") }}' as RECORD_SOURCE
    FROM film_category
    order by film_id, category_id
    
)

select * from final