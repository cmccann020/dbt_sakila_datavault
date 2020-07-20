with inventory as (

    select * from {{ ref('stg_inventory') }}

)
,
final as (

    select 
        inventory_hash_key,
        business_key,
        load_date,
        record_source,
        last_seen
    from inventory

)

select * from final