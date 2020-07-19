{% snapshot snapshot_actor %}

    SELECT * FROM {{ source('DBT_CMCCANN','actor' )}}
    
{% endsnapshot %}