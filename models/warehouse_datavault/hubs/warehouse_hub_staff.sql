with staff as (

    select * from {{ ref('stg_staff') }}

)
,
final as (

    select 
        staff_hash_key,
        business_key,
        load_date,
        record_source,
        last_seen
    from staff

)

select * from final