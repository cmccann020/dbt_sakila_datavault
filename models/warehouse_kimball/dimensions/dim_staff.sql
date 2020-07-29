with staff as (

    select * from {{  ref('stg_staff') }}

)
,
address as (

    select * from {{  ref('stg_address') }}

)
,

final as (

    select 
        {{ dbt_utils.star(from=ref('stg_staff'), except=["ADDRESS_ID","PICTURE"], relation_alias = "staff") }}
    , address.address
    from staff

    left join address
       on staff.address_id = address.address_id
)

select * from final