with actor as (

    select * from {{ ref('stg_actor') }}

)
,
final as (

    select 
        actor_hash_key,
        business_key,
        load_date,
        record_source,
        last_seen
    from actor

)

select * from final