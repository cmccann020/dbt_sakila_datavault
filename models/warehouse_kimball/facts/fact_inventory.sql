with film as (

    select * from {{  ref('dim_film') }}

)
,
store as (

    select * from {{ ref('dim_store') }}

)
,
inventory as (

    select * from {{ ref('stg_inventory') }}

)
,
final as (

    select
        inventory_hash_key,
        store_hash_key,
        film_hash_key,
        {{ dbt_utils.star(from=ref('stg_inventory'), except=["INVENTORY_HASH_KEY","STORE_ID","FILM_ID"], relation_alias = "inventory") }}
    from inventory

    left join store
        on inventory.store_id = store.store_id

    left join film
        on inventory.film_id = film.film_id

)

select * from final