with language as (

    select * from {{ ref('stg_language') }}

)
,
final as (

    select
        language_hash_key,
        load_date,
        load_end_date,
        record_source,
        last_seen,
        language_name
    from language
)

select * from final