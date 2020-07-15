{% snapshot snapshot_store %}

    SELECT * FROM {{ source('DBT_CMCCANN','store' )}}
    
{% endsnapshot %}