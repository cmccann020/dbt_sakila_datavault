with film as (

    select * from {{ ref('stg_film') }}

)
,
category as (

    select * from {{ ref('stg_category') }}

)
,
film_category as (

    select * from {{ ref('stg_film_category') }}

)
,
final as (

    select
        {{ dbt_utils.surrogate_key(['film_hash_key', 'category_hash_key']) }} AS film_category_hash_key,
        film_hash_key,
        category_hash_key,
        film_category.load_date,
        film_category.record_source
    from film_category

    left join category 
        on film_category.category_id = category.category_id

    left join film
        on film_category.film_id = film.film_id
)

select * from final