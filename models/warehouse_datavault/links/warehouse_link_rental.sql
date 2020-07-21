with rental as (

    select * from {{ ref('stg_rental') }}

)
,
inventory as (

    select * from {{ ref('stg_inventory') }}

)
,
customer as (

    select * from {{ ref('stg_customer') }}

)
,
staff as (

    select * from {{ ref('stg_staff') }}

)
,
final as (

    select
        {{ dbt_utils.surrogate_key(['inventory_hash_key', 'customer_hash_key','staff_hash_key']) }} AS rental_hash_key,
        inventory_hash_key,
        customer_hash_key,
        staff_hash_key,
        rental.load_date,
        rental.record_source
    from rental

    left join customer 
        on rental.customer_id = customer.customer_id

    left join staff
        on rental.staff_id = staff.staff_id
    
    left join inventory
        on rental.inventory_id = inventory.inventory_id
)

select * from final