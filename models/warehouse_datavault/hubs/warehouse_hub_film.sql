with film as (

    select * from {{ ref('stg_film') }}

)
,
final as (

    select 
        film_hash_key,
        business_key,
        load_date,
        record_source,
        last_seen
    from film

)

select * from final