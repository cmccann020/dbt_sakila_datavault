with film as (

    select * from {{ ref('stg_film') }}

)
,
language as (

    select * from {{ ref('stg_language') }}

)
,
final as (

    select
        {{ dbt_utils.surrogate_key(['film_hash_key', 'language_hash_key']) }} AS film_language_hash_key,
        film_hash_key,
        language_hash_key,
        film.load_date,
        film.record_source
    from film

    left join language 
        on film.language_id = language.language_id
)

select * from final