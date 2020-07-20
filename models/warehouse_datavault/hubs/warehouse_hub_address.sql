with address as (

    select * from {{ ref('stg_address') }}

)
,
final as (

    select 
        address_hash_key,
        business_key,
        load_date,
        record_source,
        last_seen
    from address

)

select * from final