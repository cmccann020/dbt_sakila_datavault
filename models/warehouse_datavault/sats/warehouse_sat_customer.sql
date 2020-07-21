with customer as (

    select * from {{ ref('stg_customer') }}

)
,
final as (

    select
        customer_hash_key,
        load_date,
        load_end_date,
        record_source,
        last_seen,
        customer_first_name,
        customer_last_name,
        customer_email,
        customer_active
    from customer
)

select * from final