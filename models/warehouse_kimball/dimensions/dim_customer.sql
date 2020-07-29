with customer as (

    select * from {{  ref('stg_customer') }}

)
,
address as (

    select * from {{  ref('stg_address') }}

)
,

final as (

    select 
        {{ dbt_utils.star(from=ref('stg_customer'), except=["ADDRESS_ID"], relation_alias = "customer") }}
    , address.address
    from customer

    left join address
       on customer.address_id = address.address_id
)

select * from final