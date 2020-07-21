with address as (

    select * from {{ ref('stg_address') }}

)
,
staff as (

    select * from {{ ref('stg_staff') }}

)
,
store as (

    select * from {{ ref('stg_store') }}

)
,
final as (

    select
        {{ dbt_utils.surrogate_key(['address_hash_key', 'staff_hash_key','store_hash_key']) }} AS address_staff_store_hash_key,
        address_hash_key,
        staff_hash_key,
        store_hash_key,
        store.load_date,
        store.record_source
    from store

    left join staff 
        on store.manager_staff_id = staff.staff_id

    left join address
        on store.address_id = address.address_id
)

select * from final