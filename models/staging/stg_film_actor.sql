with film_actor as (

    select * from {{ source('Sakila','film_actor') }}

)
,
final as (

    select
        {{ dbt_utils.surrogate_key(['FILM_ID','ACTOR_ID']) }} AS FILM_ACTOR_HASH_KEY,
        FILM_ID,
        ACTOR_ID,
        LAST_UPDATE
    FROM film_actor
    
)

select * from final