with film as (

    select * from {{ ref('stg_film') }}

)
,
actor as (

    select * from {{ ref('stg_actor') }}

)
,
film_actor as (

    select * from {{ ref('stg_film_actor') }}

)
,
final as (

    select
        {{ dbt_utils.surrogate_key(['film_hash_key', 'actor_hash_key']) }} AS film_actor_hash_key,
        film_hash_key,
        actor_hash_key,
        film_actor.load_date,
        film_actor.record_source
    from film_actor

    left join actor 
        on film_actor.actor_id = actor.actor_id

    left join film
        on film_actor.film_id = film.film_id
)

select * from final