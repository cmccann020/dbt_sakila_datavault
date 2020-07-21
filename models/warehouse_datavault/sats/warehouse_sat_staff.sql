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
        staff_first_name,
        staff_last_name,
        staff_email,
        active,
        staff_username,
        staff_password
    from staff
)

select * from final