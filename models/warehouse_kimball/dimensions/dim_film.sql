with film as (

    select * from {{  ref('stg_film') }}

)
,
language as (

    select * from {{  ref('stg_language') }}

)
,

final as (

    select 
        {{ dbt_utils.star(from=ref('stg_film'), except=["LANGUAGE_ID", "ORIGINAL_LANGUAGE_ID"], relation_alias = "film") }}
    , language.language_name
    from film

    left join language
       on film.language_id = language.language_id
)

select * from final