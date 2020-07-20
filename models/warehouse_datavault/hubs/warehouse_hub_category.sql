with category as (

    select * from {{ ref('stg_category') }}

)
,
final as (

    select 
        category_hash_key,
        business_key,
        load_date,
        record_source,
        last_seen
    from category

)

select * from final