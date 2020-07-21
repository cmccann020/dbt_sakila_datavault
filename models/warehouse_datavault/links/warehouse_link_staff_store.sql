with staff as (

    select * from {{ ref('stg_staff') }}

)
,
store as (

    select * from {{ ref('stg_store') }}

)
,
final as (

    select
        {{ dbt_utils.surrogate_key(['staff_hash_key', 'store_hash_key']) }} AS staff_store_hash_key,
        staff_hash_key,
        store_hash_key,
        staff.load_date,
        staff.record_source
    from staff

    left join store 
        on staff.store_id = store.store_id
)

select * from final