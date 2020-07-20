with actor as (

    select * from {{ ref('stg_actor') }}

)