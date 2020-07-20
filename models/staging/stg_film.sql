with film as (

    select * from {{ ref('snapshot_film') }}

)
,
final as (
    SELECT
        {{ dbt_utils.surrogate_key(['TITLE','RELEASE_YEAR']) }} AS FILM_HASH_KEY,
        TITLE || RELEASE_YEAR AS BUSINESS_KEY,
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
        '{{ var("sakila_source") }}' as RECORD_SOURCE,
        DBT_VALID_FROM AS LOAD_DATE,
        DBT_VALID_TO AS LOAD_END_DATE,
        DATEDIFF(day,DBT_VALID_FROM,CURRENT_TIMESTAMP()) AS LAST_SEEN
    FROM film
)

select * from final