with store as (

    select * from {{ ref('stg_store') }}

)
,
final as (

    select
        store_hash_key,
        load_date,
        load_end_date,
        record_source,
        last_seen,
        store_id
    from store
)

select * from final