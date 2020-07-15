with film as (

    select * from {{ ref('snapshot_film') }}

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
        DBT_SCD_ID AS DBT_INCREMENTAL_ID,
        DBT_UPDATED_AT
    FROM film
    WHERE DBT_VALID_TO IS NULL
)

select * from final