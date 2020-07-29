with store as (

    select * from {{  ref('stg_store') }}

)
,
address as (

    select * from {{  ref('stg_address') }}

)
,

final as (

    select 
        {{ dbt_utils.star(from=ref('stg_store'), except=["ADDRESS_ID",], relation_alias = "store") }}
    , address.address
    from store

    left join address
       on store.address_id = address.address_id
)

select * from final