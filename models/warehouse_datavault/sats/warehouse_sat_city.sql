with city as (

    select * from {{ ref('stg_city') }}

)
,
final as (

    select
        city_hash_key,
        load_date,
        load_end_date,
        record_source,
        last_seen,
        city_name,
        country_name
    from city
)

select * from final