with address as (

    select * from {{ ref('stg_address') }}

)
,
final as (

    select
        address_hash_key,
        load_date,
        load_end_date,
        record_source,
        last_seen,
        address,
        address2,
        district,
        postal_code,
        phone_number
    from address
)

select * from final