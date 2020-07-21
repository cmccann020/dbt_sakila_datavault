with inventory as (

    select * from {{ ref('stg_inventory') }}

)
,
film as (

    select * from {{ ref('stg_film') }}

)
,
store as (

    select * from {{ ref('stg_store') }}

)
,
final as (

    select
        {{ dbt_utils.surrogate_key(['inventory_hash_key', 'film_hash_key','store_hash_key']) }} AS inventory_film_store_hash_key,
        inventory_hash_key,
        film_hash_key,
        store_hash_key,
        inventory.load_date,
        inventory.record_source
    from inventory

    left join film 
        on inventory.film_id = film.film_id

    left join store
        on inventory.store_id = store.store_id
)

select * from final