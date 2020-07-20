with city as (

    select * from {{ ref('stg_city') }}

)
,
final as (

    select 
        city_hash_key,
        business_key,
        load_date,
        record_source,
        last_seen
    from city

)

select * from final