with customer as (

    select * from {{ ref('stg_customer') }}

)
,
store as (

    select * from {{ ref('stg_store') }}

)
,
final as (

    select
        {{ dbt_utils.surrogate_key(['customer_hash_key', 'store_hash_key']) }} AS customer_store_hash_key,
        customer_hash_key,
        store_hash_key,
        customer.load_date,
        customer.record_source
    from customer

    left join store 
        on customer.store_id = store.store_id
)

select * from final