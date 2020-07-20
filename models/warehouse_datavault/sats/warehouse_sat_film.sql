with film as (

    select * from {{ ref('stg_film') }}

)
,
final as (

    select
        film_hash_key,
        load_date,
        load_end_date,
        record_source,
        last_seen,
        film_title,
        film_description,
        film_release_year,
        film_rental_duration,
        film_rental_rate,
        film_length,
        film_replacement_cost,
        film_rating,
        film_special_features
    from film
)

select * from final