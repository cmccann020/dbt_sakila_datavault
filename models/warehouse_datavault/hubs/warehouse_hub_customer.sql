with customer as (

    select * from {{ ref('stg_customer') }}

)
,
final as (

    select 
        customer_hash_key,
        business_key,
        load_date,
        record_source,
        last_seen
    from customer

)

select * from final