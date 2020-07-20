with language as (

    select * from {{ ref('stg_language') }}

)
,
final as (

    select 
        language_hash_key,
        business_key,
        load_date,
        record_source,
        last_seen
    from language

)

select * from final