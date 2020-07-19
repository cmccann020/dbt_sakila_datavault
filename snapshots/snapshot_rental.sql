{% snapshot snapshot_rental %}

    SELECT * FROM {{ source('DBT_CMCCANN','rental' )}}
    
{% endsnapshot %}