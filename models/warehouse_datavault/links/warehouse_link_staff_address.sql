with staff as (

    select * from {{ ref('stg_staff') }}

)
,
address as (

    select * from {{ ref('stg_address') }}

)
,
final as (

    select
        {{ dbt_utils.surrogate_key(['staff_hash_key', 'address_hash_key']) }} AS staff_address_hash_key,
        staff_hash_key,
        address_hash_key,
        staff.load_date,
        staff.record_source
    from staff

    left join address 
        on staff.address_id = address.address_id
)

select * from final