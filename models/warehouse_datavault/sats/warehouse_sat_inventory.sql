with inventory as (

    select * from {{ ref('stg_inventory') }}

)
,
final as (

    select
        inventory_hash_key,
        load_date,
        load_end_date,
        record_source,
        last_seen,
        inventory_id
    from inventory
)

select * from final