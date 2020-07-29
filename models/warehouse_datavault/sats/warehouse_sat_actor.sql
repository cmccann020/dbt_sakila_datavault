with actor as (

    select * from {{ ref('stg_actor') }}

)
,
final as (

    select
        actor_hash_key,
        load_date,
        load_end_date,
        record_source,
        last_seen,
        actor_first_name,
        actor_last_name
    from actor

)

select * from final