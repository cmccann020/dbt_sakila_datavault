with address as (

    select * from {{ ref('stg_address') }}

)
,
city as (

    select * from {{ ref('stg_city') }}

)
,
final as (

    select
        {{ dbt_utils.surrogate_key(['address_hash_key', 'city_hash_key']) }} AS address_city_hash_key,
        address_hash_key,
        city_hash_key,
        address.load_date,
        address.record_source
    from address

    left join city 
        on address.city_id = city.city_id
)

select * from final