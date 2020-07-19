with film as (

    select * from {{ source('Sakila','film') }}

)
,
final as (
    SELECT
        {{ dbt_utils.surrogate_key(['TITLE','RELEASE_YEAR']) }} AS FILM_HASH_KEY,
        FILM_ID,
        TITLE AS FILM_TITLE,
        DESCRIPTION AS FILM_DESCRIPTION,
        RELEASE_YEAR AS FILM_RELEASE_YEAR,
        LANGUAGE_ID,
        ORIGINAL_LANGUAGE_ID,
        RENTAL_DURATION AS FILM_RENTAL_DURATION, 
        RENTAL_RATE AS FILM_RENTAL_RATE,
        LENGTH AS FILM_LENGTH,
        REPLACEMENT_COST AS FILM_REPLACEMENT_COST,
        RATING AS FILM_RATING,
        SPECIAL_FEATURES AS FILM_SPECIAL_FEATURES,
        LAST_UPDATE
    FROM film
)

select * from final