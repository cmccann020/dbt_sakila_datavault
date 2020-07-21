with category as (

    select * from {{ ref('stg_category') }}

)
,
final as (

    select
        category_hash_key,
        load_date,
        load_end_date,
        record_source,
        last_seen,
        category_id,
        category_name
    from category
)

select * from final