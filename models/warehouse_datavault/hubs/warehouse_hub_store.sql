with store as (

    select * from {{ ref('stg_store') }}

)
,
final as (

    select 
        store_hash_key,
        business_key,
        load_date,
        record_source,
        last_seen
    from store

)

select * from final