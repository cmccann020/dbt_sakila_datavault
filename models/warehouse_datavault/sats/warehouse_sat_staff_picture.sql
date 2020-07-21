with staff as (

    select * from {{ ref('stg_staff') }}

)
,
final as (

    select
        staff_hash_key,
        load_date,
        load_end_date,
        record_source,
        last_seen,
        picture
    from staff
)

select * from final